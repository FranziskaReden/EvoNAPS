rule test_models_and_tree_search:
    """
    The TestModelsAndTreeSearch rule starts the model selection and tree search using the alignment file as input.
    """
    output:
        iqtree_file = "{ali_id}.iqtree",
        treefile = "{ali_id}.treefile",
        checkpoint_file = "{ali_id}.ckp.gz",
        log_file = "{ali_id}.log"
    input:
        seq = "{ali_id}"
    params:
        seq_type = config["seq_type"]
    shell: """
        workflow/bin/iqtree2mod -s {input.seq} --seqtype {params.seq_type} \
            -m MFP -mrate E,I,G,I+G,R > {input.seq}.iqlog
        if test -f {input.seq}.uniqueseq.phy; then
            declare seed_num="$(workflow/scripts/get_seed.py --file {input.seq}.iqtree)"
            workflow/bin/iqtree2mod -s {input.seq} --seqtype {params.seq_type} \
            -m MFP -mrate E,I,G,I+G,R --keep-ident --seed $seed_num \
            --prefix {input.seq}-keep_ident > {input.seq}-keep_ident.iqlog
        fi;
        """

rule parse_parameters: 
    """
    This rule ensures that once the TestModelsAndTreeSearch rule has finished successfully, all relevant parameters are filtered 
    from the output files. The input is the alignment file and *.treefile and *.iqtree file generated in the TestModelsAndTreeSearch rule.
    The parse_parameters.py script takes the name of the alignment file as input and searches for all relevant output files generated by IQ-Tree.
    """
    output: 
        "{ali_id}_ali_parameters.tsv", 
        "{ali_id}_seq_parameters.tsv",
        "{ali_id}_model_parameters.tsv",
        "{ali_id}_branch_parameters.tsv",
        "{ali_id}_tree_parameters.tsv"
    input:
        seq = "{ali_id}",
        treefile = "{ali_id}.treefile",
        iqtree_file = "{ali_id}.iqtree"
    conda: "../envs/evonaps_env.yaml"
    shell: """
        if [ -f {input.seq}.tax ]; then 
            python workflow/scripts/parse_parameters.py \
            -p {input.seq} -o {input.seq} \
            -t {input.seq}.tax -c config/
        elif [ -f config/tax_ids.tax ]; then 
            python workflow/scripts/parse_parameters.py \
            -p {input.seq} -o {input.seq} \
            -t config/tax_ids.tax -c config/
        else
            python workflow/scripts/parse_parameters.py \
            -p {input.seq} -o {input.seq} \
            -c config/ -q
        fi;
        """

rule calculate_pythia_score:
    output:
        "{ali_id}.pythia.csv"
    input:
        seq = "{ali_id}"
    conda: "../envs/pypythia.yml"
    shell: """
        pythia -m {input.seq} -r workflow/bin/raxml-ng --prefix {input.seq} --forceDuplicates > {input.seq}.pythia.ter.log 2>&1
        """
