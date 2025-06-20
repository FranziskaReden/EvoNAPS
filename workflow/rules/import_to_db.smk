rule import_to_db:
    input: 
        prefix = "{ali_id}",
        ali_file = "{ali_id}_ali_parameters.tsv",
        seq_file = "{ali_id}_seq_parameters.tsv",
        model_file = "{ali_id}_model_parameters.tsv",
        branch_file = "{ali_id}_branch_parameters.tsv",
        tree_file = "{ali_id}_tree_parameters.tsv",
        pythia_file = "{ali_id}.pythia.csv",
        credentials = "config/EvoNAPS_credentials.cnf",
        import_commands = "config/EvoNAPS_import_statements.sql",
        tables = "config/taxonomy_table.json"
    output: "{ali_id}_summary.txt"
    conda: "../envs/evonaps_env.yaml"
    shell: """
        if [ -f "{input.prefix}.info" ]; then 
            info_file="{input.prefix}.info"
        elif [ -f config/import.info ]; then
            info_file="config/import.info"
        else
            info_file="{input.prefix}.info"
        fi;
        
        if [ -f $info_file ]; then
            python workflow/scripts/import_to_db.py \
            -p {input.prefix} -db {input.credentials} -t {input.tables} \
            -c {input.import_commands} -i {input.prefix}.info \
            -py {input.pythia_file}
        else
            python workflow/scripts/import_to_db.py \
            -p {input.prefix} -db {input.credentials} -t {input.tables} \
            -c {input.import_commands} \
            -py {input.pythia_file}
        fi;
        """
