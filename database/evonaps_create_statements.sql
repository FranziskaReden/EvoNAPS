-- MySQL dump 10.15  Distrib 10.0.13-MariaDB, for Linux (x86_64)
--
-- Database: EvoNAPS
-- ------------------------------------------------------
-- Server version	10.6.15-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aa_alignments`
--

DROP TABLE IF EXISTS `aa_alignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_alignments` (
  `ALI_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL COMMENT 'Name of the alignment (alignment ID). Must be unique.',
  `FROM_DATABASE` varchar(100) NOT NULL COMMENT 'States from which original database the alignemnt stems from (e.g. PANDIT). Serves as foreign key to connect to the DataOrigin table.',
  `DATA_URL` varchar(500) DEFAULT NULL,
  `STUDY_ID` varchar(250) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT 'A field that can hold an optional comment regarding the alignment. This can be left blank and the default value is accordingly NULL.',
  `TAXA` int(11) DEFAULT NULL,
  `SITES` int(11) DEFAULT NULL,
  `PARSIMONY_INFORMATIVE_SITES` int(11) NOT NULL COMMENT 'States the number of parsimony informative sites in alignment.',
  `SINGLETON_SITES` int(11) DEFAULT NULL,
  `CONSTANT_SITES` int(11) NOT NULL COMMENT 'States the number of singelton sites in alignment.',
  `FRAC_WILDCARDS_GAPS` decimal(5,4) NOT NULL COMMENT 'States the fraction of wildcards and gaps in the alignment.',
  `DISTINCT_PATTERNS` int(11) NOT NULL COMMENT 'States the number of distinct patterns in alignment.',
  `FAILED_CHI2` int(11) NOT NULL COMMENT 'States the number of sequences that failed the chi2 (chi-squared) test. The test examines whether the nucleotide composition of the sequences matches the mean nucleotide frequencies across all sequences.',
  `IDENTICAL_SEQ` int(11) DEFAULT NULL COMMENT 'States the number of identical sequences in the alignment, should there be any. Default is NULL.',
  `EXCLUDED_SEQ` int(11) DEFAULT NULL COMMENT 'States the number of excluded sequences in the alignment, should there be any. Default is NULL.',
  `DIST_MIN` decimal(15,7) DEFAULT NULL,
  `DIST_MAX` decimal(15,7) DEFAULT NULL,
  `DIST_MEAN` decimal(15,7) DEFAULT NULL,
  `DIST_MEDIAN` decimal(15,7) DEFAULT NULL,
  `DIST_VAR` decimal(15,7) DEFAULT NULL,
  `PYTHIA_SCORE` decimal(15,9) DEFAULT NULL,
  PRIMARY KEY (`ALI_KEY`),
  UNIQUE KEY `ALI_ID` (`ALI_ID`),
  KEY `FROM_DATABASE` (`FROM_DATABASE`),
  KEY `aa_study_constraint` (`STUDY_ID`),
  KEY `aa_taxa_index` (`TAXA`),
  KEY `aa_sites_index` (`SITES`),
  KEY `aa_gaps_index` (`FRAC_WILDCARDS_GAPS`),
  KEY `aa_dist_mean_index` (`DIST_MEAN`),
  CONSTRAINT `AA_Alignments_ibfk_1` FOREIGN KEY (`FROM_DATABASE`) REFERENCES `dataorigin` (`DATABASE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aa_study_constraint` FOREIGN KEY (`STUDY_ID`) REFERENCES `studies` (`STUDY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21801 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The aa_alignments table holds general information and charac';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aa_alignments_taxonomy`
--

DROP TABLE IF EXISTS `aa_alignments_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_alignments_taxonomy` (
  `ALI_TAX_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `TAX_RESOLVED` tinyint(1) NOT NULL,
  `LCA_TAX_ID` int(11) NOT NULL,
  `LCA_RANK_NR` int(11) NOT NULL,
  `LCA_RANK_NAME` varchar(50) NOT NULL,
  `superkingdom` int(11) DEFAULT NULL,
  `kingdom` int(11) DEFAULT NULL,
  `subkingdom` int(11) DEFAULT NULL,
  `superphylum` int(11) DEFAULT NULL,
  `subphylum` int(11) DEFAULT NULL,
  `phylum` int(11) DEFAULT NULL,
  `superclass` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `subclass` int(11) DEFAULT NULL,
  `infraclass` int(11) DEFAULT NULL,
  `cohort` int(11) DEFAULT NULL,
  `subcohort` int(11) DEFAULT NULL,
  `superorder` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `suborder` int(11) DEFAULT NULL,
  `infraorder` int(11) DEFAULT NULL,
  `parvorder` int(11) DEFAULT NULL,
  `superfamily` int(11) DEFAULT NULL,
  `family` int(11) DEFAULT NULL,
  `subfamily` int(11) DEFAULT NULL,
  `genus` int(11) DEFAULT NULL,
  `subgenus` int(11) DEFAULT NULL,
  `species_group` int(11) DEFAULT NULL,
  `species_subgroup` int(11) DEFAULT NULL,
  `species` int(11) DEFAULT NULL,
  `subspecies` int(11) DEFAULT NULL,
  `tribe` int(11) DEFAULT NULL,
  `subtribe` int(11) DEFAULT NULL,
  `forma` int(11) DEFAULT NULL,
  `varietas` int(11) DEFAULT NULL,
  `strain` int(11) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `subsection` int(11) DEFAULT NULL,
  `pathogroup` int(11) DEFAULT NULL,
  `subvariety` int(11) DEFAULT NULL,
  `genotype` int(11) DEFAULT NULL,
  `serotype` int(11) DEFAULT NULL,
  `isolate` int(11) DEFAULT NULL,
  `morph` int(11) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `forma_specialis` int(11) DEFAULT NULL,
  `serogroup` int(11) DEFAULT NULL,
  `biotype` int(11) DEFAULT NULL,
  PRIMARY KEY (`ALI_TAX_KEY`),
  UNIQUE KEY `aa_ali_tax_constraint` (`ALI_ID`),
  KEY `aa_ali_tax_foreign_key_lca` (`LCA_TAX_ID`),
  KEY `aa_ali_tax_foreign_1_superkingdom` (`superkingdom`),
  KEY `aa_ali_tax_foreign_2_kingdom` (`kingdom`),
  KEY `aa_ali_tax_foreign_3_subkingdom` (`subkingdom`),
  KEY `aa_ali_tax_foreign_4_superphylum` (`superphylum`),
  KEY `aa_ali_tax_foreign_5_phylum` (`phylum`),
  KEY `aa_ali_tax_foreign_6_subphylum` (`subphylum`),
  KEY `aa_ali_tax_foreign_8_superclass` (`superclass`),
  KEY `aa_ali_tax_foreign_9_class` (`class`),
  KEY `aa_ali_tax_foreign_10_subclass` (`subclass`),
  KEY `aa_ali_tax_foreign_11_infraclass` (`infraclass`),
  KEY `aa_ali_tax_foreign_12_cohort` (`cohort`),
  KEY `aa_ali_tax_foreign_13_subcohort` (`subcohort`),
  KEY `aa_ali_tax_foreign_14_superorder` (`superorder`),
  KEY `aa_ali_tax_foreign_15_order` (`order`),
  KEY `aa_ali_tax_foreign_16_suborder` (`suborder`),
  KEY `aa_ali_tax_foreign_17_infraorder` (`infraorder`),
  KEY `aa_ali_tax_foreign_18_parvorder` (`parvorder`),
  KEY `aa_ali_tax_foreign_19_superfamily` (`superfamily`),
  KEY `aa_ali_tax_foreign_20_family` (`family`),
  KEY `aa_ali_tax_foreign_21_subfamily` (`subfamily`),
  KEY `aa_ali_tax_foreign_22_tribe` (`tribe`),
  KEY `aa_ali_tax_foreign_23_subtribe` (`subtribe`),
  KEY `aa_ali_tax_foreign_24_genus` (`genus`),
  KEY `aa_ali_tax_foreign_25_subgenus` (`subgenus`),
  KEY `aa_ali_tax_foreign_26_section` (`section`),
  KEY `aa_ali_tax_foreign_27_subsection` (`subsection`),
  KEY `aa_ali_tax_foreign_28_series` (`series`),
  KEY `aa_ali_tax_foreign_30_species_group` (`species_group`),
  KEY `aa_ali_tax_foreign_31_species_subgroup` (`species_subgroup`),
  KEY `aa_ali_tax_foreign_32_species` (`species`),
  KEY `aa_ali_tax_foreign_33_forma_specialis` (`forma_specialis`),
  KEY `aa_ali_tax_foreign_34_subspecies` (`subspecies`),
  KEY `aa_ali_tax_foreign_35_varietas` (`varietas`),
  KEY `aa_ali_tax_foreign_36_subvariety` (`subvariety`),
  KEY `aa_ali_tax_foreign_37_forma` (`forma`),
  KEY `aa_ali_tax_foreign_38_serogroup` (`serogroup`),
  KEY `aa_ali_tax_foreign_39_serotype` (`serotype`),
  KEY `aa_ali_tax_foreign_40_strain` (`strain`),
  KEY `aa_ali_tax_foreign_41_isolate` (`isolate`),
  CONSTRAINT `aa_ali_tax_foreign_key` FOREIGN KEY (`ALI_ID`) REFERENCES `aa_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aa_ali_tax_foreign_key_lca` FOREIGN KEY (`LCA_TAX_ID`) REFERENCES `taxonomy` (`TAX_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32768 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aa_branches`
--

DROP TABLE IF EXISTS `aa_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_branches` (
  `BRANCH_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `TIME_STAMP` datetime NOT NULL,
  `TREE_TYPE` varchar(100) DEFAULT NULL,
  `BRANCH_INDEX` int(11) NOT NULL,
  `BRANCH_TYPE` varchar(30) NOT NULL,
  `BL` decimal(16,10) NOT NULL,
  `SPLIT_SIZE` int(11) NOT NULL,
  `MIN_PATH_1` decimal(16,10) DEFAULT NULL,
  `MAX_PATH_1` decimal(16,10) DEFAULT NULL,
  `MEAN_PATH_1` decimal(16,10) DEFAULT NULL,
  `MEDIAN_PATH_1` decimal(16,10) DEFAULT NULL,
  `MIN_PATH_2` decimal(16,10) DEFAULT NULL,
  `MAX_PATH_2` decimal(16,10) DEFAULT NULL,
  `MEAN_PATH_2` decimal(16,10) DEFAULT NULL,
  `MEDIAN_PATH_2` decimal(16,10) DEFAULT NULL,
  PRIMARY KEY (`BRANCH_KEY`),
  UNIQUE KEY `aa_branch_constraint` (`ALI_ID`,`BRANCH_INDEX`,`TIME_STAMP`,`TREE_TYPE`),
  KEY `ALI_ID` (`ALI_ID`,`TIME_STAMP`,`TREE_TYPE`),
  CONSTRAINT `AA_Branches_ibfk_1` FOREIGN KEY (`ALI_ID`, `TIME_STAMP`, `TREE_TYPE`) REFERENCES `aa_trees` (`ALI_ID`, `TIME_STAMP`, `TREE_TYPE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10245619 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aa_modelparameters`
--

DROP TABLE IF EXISTS `aa_modelparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_modelparameters` (
  `MODELTEST_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `IQTREE_VERSION` varchar(100) NOT NULL,
  `RANDOM_SEED` int(11) NOT NULL,
  `TIME_STAMP` datetime NOT NULL,
  `MODEL_TYPE` varchar(100) NOT NULL,
  `KEEP_IDENT` tinyint(1) DEFAULT NULL,
  `ORIGINAL_ALI` tinyint(1) DEFAULT NULL,
  `MODEL` varchar(100) NOT NULL,
  `BASE_MODEL` varchar(100) NOT NULL,
  `RHAS_MODEL` varchar(100) DEFAULT NULL,
  `NUM_RATE_CAT` int(11) DEFAULT NULL,
  `LOGL` decimal(21,9) NOT NULL,
  `AIC` decimal(21,9) NOT NULL,
  `AIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_AIC` tinyint(1) NOT NULL,
  `AICC` decimal(21,9) NOT NULL,
  `AICC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_AICC` tinyint(1) NOT NULL,
  `BIC` decimal(21,9) NOT NULL,
  `BIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_BIC` tinyint(1) NOT NULL,
  `CAIC` decimal(21,9) NOT NULL,
  `CAIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_CAIC` tinyint(1) NOT NULL,
  `ABIC` decimal(21,9) NOT NULL,
  `ABIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_ABIC` tinyint(1) NOT NULL,
  `NUM_FREE_PARAMETERS` int(11) NOT NULL,
  `NUM_MODEL_PARAMETERS` int(11) NOT NULL,
  `NUM_BRANCHES` int(11) NOT NULL,
  `TREE_LENGTH` decimal(15,9) NOT NULL,
  `PROP_INVAR` decimal(10,9) DEFAULT NULL,
  `ALPHA` decimal(15,9) DEFAULT NULL,
  `FREQ_TYPE` varchar(100) DEFAULT NULL,
  `FREQ_A` decimal(10,9) DEFAULT NULL,
  `FREQ_R` decimal(10,9) DEFAULT NULL,
  `FREQ_N` decimal(10,9) DEFAULT NULL,
  `FREQ_D` decimal(10,9) DEFAULT NULL,
  `FREQ_C` decimal(10,9) DEFAULT NULL,
  `FREQ_Q` decimal(10,9) DEFAULT NULL,
  `FREQ_E` decimal(10,9) DEFAULT NULL,
  `FREQ_G` decimal(10,9) DEFAULT NULL,
  `FREQ_H` decimal(10,9) DEFAULT NULL,
  `FREQ_I` decimal(10,9) DEFAULT NULL,
  `FREQ_L` decimal(10,9) DEFAULT NULL,
  `FREQ_K` decimal(10,9) DEFAULT NULL,
  `FREQ_M` decimal(10,9) DEFAULT NULL,
  `FREQ_F` decimal(10,9) DEFAULT NULL,
  `FREQ_P` decimal(10,9) DEFAULT NULL,
  `FREQ_S` decimal(10,9) DEFAULT NULL,
  `FREQ_T` decimal(10,9) DEFAULT NULL,
  `FREQ_W` decimal(10,9) DEFAULT NULL,
  `FREQ_Y` decimal(10,9) DEFAULT NULL,
  `FREQ_V` decimal(10,9) DEFAULT NULL,
  `PROP_CAT_1` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_1` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_2` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_2` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_3` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_3` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_4` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_4` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_5` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_5` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_6` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_6` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_7` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_7` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_8` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_8` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_9` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_9` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_10` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_10` decimal(15,9) DEFAULT NULL,
  PRIMARY KEY (`MODELTEST_KEY`),
  UNIQUE KEY `aa_modeltest_constraint` (`ALI_ID`,`TIME_STAMP`,`MODEL`),
  KEY `BASE_MODEL` (`BASE_MODEL`),
  KEY `aa_modepara_index` (`MODEL`),
  KEY `aa_bic_weight` (`BIC_WEIGHT`),
  KEY `aa_aic_weight` (`AIC_WEIGHT`),
  KEY `aa_aicc_weight` (`AICC_WEIGHT`),
  CONSTRAINT `AA_ModelParameters_ibfk_1` FOREIGN KEY (`ALI_ID`) REFERENCES `aa_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AA_ModelParameters_ibfk_2` FOREIGN KEY (`BASE_MODEL`) REFERENCES `aa_models` (`MODEL_NAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12196812 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The dna_modelparameters table holds the results of model eva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aa_models`
--

DROP TABLE IF EXISTS `aa_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_models` (
  `MODEL_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `MODEL_NAME` varchar(100) NOT NULL COMMENT 'Name of the protein model (substitution rate matrix). The name must be unique.',
  `REGION` varchar(50) DEFAULT NULL COMMENT 'States the region of the cell where the proteins from which the substitution rate matrix was derived from are abundant. Optional, default is NULL.',
  `EXPLANATION` varchar(100) DEFAULT NULL COMMENT 'This field contains a short description of the model.',
  `STAT_DIS_TYPE` varchar(50) DEFAULT NULL,
  `FREQ_A` decimal(10,9) DEFAULT NULL,
  `FREQ_R` decimal(10,9) DEFAULT NULL,
  `FREQ_N` decimal(10,9) DEFAULT NULL,
  `FREQ_D` decimal(10,9) DEFAULT NULL,
  `FREQ_C` decimal(10,9) DEFAULT NULL,
  `FREQ_Q` decimal(10,9) DEFAULT NULL,
  `FREQ_E` decimal(10,9) DEFAULT NULL,
  `FREQ_G` decimal(10,9) DEFAULT NULL,
  `FREQ_H` decimal(10,9) DEFAULT NULL,
  `FREQ_I` decimal(10,9) DEFAULT NULL,
  `FREQ_L` decimal(10,9) DEFAULT NULL,
  `FREQ_K` decimal(10,9) DEFAULT NULL,
  `FREQ_M` decimal(10,9) DEFAULT NULL,
  `FREQ_F` decimal(10,9) DEFAULT NULL,
  `FREQ_P` decimal(10,9) DEFAULT NULL,
  `FREQ_S` decimal(10,9) DEFAULT NULL,
  `FREQ_T` decimal(10,9) DEFAULT NULL,
  `FREQ_W` decimal(10,9) DEFAULT NULL,
  `FREQ_Y` decimal(10,9) DEFAULT NULL,
  `FREQ_V` decimal(10,9) DEFAULT NULL,
  `RATE_AR` decimal(15,10) NOT NULL COMMENT 'The substitution rate from aa A to aa R assumed by the model.',
  `RATE_AN` decimal(15,10) NOT NULL,
  `RATE_AD` decimal(15,10) NOT NULL,
  `RATE_AC` decimal(15,10) NOT NULL,
  `RATE_AQ` decimal(15,10) NOT NULL,
  `RATE_AE` decimal(15,10) NOT NULL,
  `RATE_AG` decimal(15,10) NOT NULL,
  `RATE_AH` decimal(15,10) NOT NULL,
  `RATE_AI` decimal(15,10) NOT NULL,
  `RATE_AL` decimal(15,10) NOT NULL,
  `RATE_AK` decimal(15,10) NOT NULL,
  `RATE_AM` decimal(15,10) NOT NULL,
  `RATE_AF` decimal(15,10) NOT NULL,
  `RATE_AP` decimal(15,10) NOT NULL,
  `RATE_AS` decimal(15,10) NOT NULL,
  `RATE_AT` decimal(15,10) NOT NULL,
  `RATE_AW` decimal(15,10) NOT NULL,
  `RATE_AY` decimal(15,10) NOT NULL,
  `RATE_AV` decimal(15,10) NOT NULL,
  `RATE_RN` decimal(15,10) NOT NULL,
  `RATE_RD` decimal(15,10) NOT NULL,
  `RATE_RC` decimal(15,10) NOT NULL,
  `RATE_RQ` decimal(15,10) NOT NULL,
  `RATE_RE` decimal(15,10) NOT NULL,
  `RATE_RG` decimal(15,10) NOT NULL,
  `RATE_RH` decimal(15,10) NOT NULL,
  `RATE_RI` decimal(15,10) NOT NULL,
  `RATE_RL` decimal(15,10) NOT NULL,
  `RATE_RK` decimal(15,10) NOT NULL,
  `RATE_RM` decimal(15,10) NOT NULL,
  `RATE_RF` decimal(15,10) NOT NULL,
  `RATE_RP` decimal(15,10) NOT NULL,
  `RATE_RS` decimal(15,10) NOT NULL,
  `RATE_RT` decimal(15,10) NOT NULL,
  `RATE_RW` decimal(15,10) NOT NULL,
  `RATE_RY` decimal(15,10) NOT NULL,
  `RATE_RV` decimal(15,10) NOT NULL,
  `RATE_ND` decimal(15,10) NOT NULL,
  `RATE_NC` decimal(15,10) NOT NULL,
  `RATE_NQ` decimal(15,10) NOT NULL,
  `RATE_NE` decimal(15,10) NOT NULL,
  `RATE_NG` decimal(15,10) NOT NULL,
  `RATE_NH` decimal(15,10) NOT NULL,
  `RATE_NI` decimal(15,10) NOT NULL,
  `RATE_NL` decimal(15,10) NOT NULL,
  `RATE_NK` decimal(15,10) NOT NULL,
  `RATE_NM` decimal(15,10) NOT NULL,
  `RATE_NF` decimal(15,10) NOT NULL,
  `RATE_NP` decimal(15,10) NOT NULL,
  `RATE_NS` decimal(15,10) NOT NULL,
  `RATE_NT` decimal(15,10) NOT NULL,
  `RATE_NW` decimal(15,10) NOT NULL,
  `RATE_NY` decimal(15,10) NOT NULL,
  `RATE_NV` decimal(15,10) NOT NULL,
  `RATE_DC` decimal(15,10) NOT NULL,
  `RATE_DQ` decimal(15,10) NOT NULL,
  `RATE_DE` decimal(15,10) NOT NULL,
  `RATE_DG` decimal(15,10) NOT NULL,
  `RATE_DH` decimal(15,10) NOT NULL,
  `RATE_DI` decimal(15,10) NOT NULL,
  `RATE_DL` decimal(15,10) NOT NULL,
  `RATE_DK` decimal(15,10) NOT NULL,
  `RATE_DM` decimal(15,10) NOT NULL,
  `RATE_DF` decimal(15,10) NOT NULL,
  `RATE_DP` decimal(15,10) NOT NULL,
  `RATE_DS` decimal(15,10) NOT NULL,
  `RATE_DT` decimal(15,10) NOT NULL,
  `RATE_DW` decimal(15,10) NOT NULL,
  `RATE_DY` decimal(15,10) NOT NULL,
  `RATE_DV` decimal(15,10) NOT NULL,
  `RATE_CQ` decimal(15,10) NOT NULL,
  `RATE_CE` decimal(15,10) NOT NULL,
  `RATE_CG` decimal(15,10) NOT NULL,
  `RATE_CH` decimal(15,10) NOT NULL,
  `RATE_CI` decimal(15,10) NOT NULL,
  `RATE_CL` decimal(15,10) NOT NULL,
  `RATE_CK` decimal(15,10) NOT NULL,
  `RATE_CM` decimal(15,10) NOT NULL,
  `RATE_CF` decimal(15,10) NOT NULL,
  `RATE_CP` decimal(15,10) NOT NULL,
  `RATE_CS` decimal(15,10) NOT NULL,
  `RATE_CT` decimal(15,10) NOT NULL,
  `RATE_CW` decimal(15,10) NOT NULL,
  `RATE_CY` decimal(15,10) NOT NULL,
  `RATE_CV` decimal(15,10) NOT NULL,
  `RATE_QE` decimal(15,10) NOT NULL,
  `RATE_QG` decimal(15,10) NOT NULL,
  `RATE_QH` decimal(15,10) NOT NULL,
  `RATE_QI` decimal(15,10) NOT NULL,
  `RATE_QL` decimal(15,10) NOT NULL,
  `RATE_QK` decimal(15,10) NOT NULL,
  `RATE_QM` decimal(15,10) NOT NULL,
  `RATE_QF` decimal(15,10) NOT NULL,
  `RATE_QP` decimal(15,10) NOT NULL,
  `RATE_QS` decimal(15,10) NOT NULL,
  `RATE_QT` decimal(15,10) NOT NULL,
  `RATE_QW` decimal(15,10) NOT NULL,
  `RATE_QY` decimal(15,10) NOT NULL,
  `RATE_QV` decimal(15,10) NOT NULL,
  `RATE_EG` decimal(15,10) NOT NULL,
  `RATE_EH` decimal(15,10) NOT NULL,
  `RATE_EI` decimal(15,10) NOT NULL,
  `RATE_EL` decimal(15,10) NOT NULL,
  `RATE_EK` decimal(15,10) NOT NULL,
  `RATE_EM` decimal(15,10) NOT NULL,
  `RATE_EF` decimal(15,10) NOT NULL,
  `RATE_EP` decimal(15,10) NOT NULL,
  `RATE_ES` decimal(15,10) NOT NULL,
  `RATE_ET` decimal(15,10) NOT NULL,
  `RATE_EW` decimal(15,10) NOT NULL,
  `RATE_EY` decimal(15,10) NOT NULL,
  `RATE_EV` decimal(15,10) NOT NULL,
  `RATE_GH` decimal(15,10) NOT NULL,
  `RATE_GI` decimal(15,10) NOT NULL,
  `RATE_GL` decimal(15,10) NOT NULL,
  `RATE_GK` decimal(15,10) NOT NULL,
  `RATE_GM` decimal(15,10) NOT NULL,
  `RATE_GF` decimal(15,10) NOT NULL,
  `RATE_GP` decimal(15,10) NOT NULL,
  `RATE_GS` decimal(15,10) NOT NULL,
  `RATE_GT` decimal(15,10) NOT NULL,
  `RATE_GW` decimal(15,10) NOT NULL,
  `RATE_GY` decimal(15,10) NOT NULL,
  `RATE_GV` decimal(15,10) NOT NULL,
  `RATE_HI` decimal(15,10) NOT NULL,
  `RATE_HL` decimal(15,10) NOT NULL,
  `RATE_HK` decimal(15,10) NOT NULL,
  `RATE_HM` decimal(15,10) NOT NULL,
  `RATE_HF` decimal(15,10) NOT NULL,
  `RATE_HP` decimal(15,10) NOT NULL,
  `RATE_HS` decimal(15,10) NOT NULL,
  `RATE_HT` decimal(15,10) NOT NULL,
  `RATE_HW` decimal(15,10) NOT NULL,
  `RATE_HY` decimal(15,10) NOT NULL,
  `RATE_HV` decimal(15,10) NOT NULL,
  `RATE_IL` decimal(15,10) NOT NULL,
  `RATE_IK` decimal(15,10) NOT NULL,
  `RATE_IM` decimal(15,10) NOT NULL,
  `RATE_IF` decimal(15,10) NOT NULL,
  `RATE_IP` decimal(15,10) NOT NULL,
  `RATE_IS` decimal(15,10) NOT NULL,
  `RATE_IT` decimal(15,10) NOT NULL,
  `RATE_IW` decimal(15,10) NOT NULL,
  `RATE_IY` decimal(15,10) NOT NULL,
  `RATE_IV` decimal(15,10) NOT NULL,
  `RATE_LK` decimal(15,10) NOT NULL,
  `RATE_LM` decimal(15,10) NOT NULL,
  `RATE_LF` decimal(15,10) NOT NULL,
  `RATE_LP` decimal(15,10) NOT NULL,
  `RATE_LS` decimal(15,10) NOT NULL,
  `RATE_LT` decimal(15,10) NOT NULL,
  `RATE_LW` decimal(15,10) NOT NULL,
  `RATE_LY` decimal(15,10) NOT NULL,
  `RATE_LV` decimal(15,10) NOT NULL,
  `RATE_KM` decimal(15,10) NOT NULL,
  `RATE_KF` decimal(15,10) NOT NULL,
  `RATE_KP` decimal(15,10) NOT NULL,
  `RATE_KS` decimal(15,10) NOT NULL,
  `RATE_KT` decimal(15,10) NOT NULL,
  `RATE_KW` decimal(15,10) NOT NULL,
  `RATE_KY` decimal(15,10) NOT NULL,
  `RATE_KV` decimal(15,10) NOT NULL,
  `RATE_MF` decimal(15,10) NOT NULL,
  `RATE_MP` decimal(15,10) NOT NULL,
  `RATE_MS` decimal(15,10) NOT NULL,
  `RATE_MT` decimal(15,10) NOT NULL,
  `RATE_MW` decimal(15,10) NOT NULL,
  `RATE_MY` decimal(15,10) NOT NULL,
  `RATE_MV` decimal(15,10) NOT NULL,
  `RATE_FP` decimal(15,10) NOT NULL,
  `RATE_FS` decimal(15,10) NOT NULL,
  `RATE_FT` decimal(15,10) NOT NULL,
  `RATE_FW` decimal(15,10) NOT NULL,
  `RATE_FY` decimal(15,10) NOT NULL,
  `RATE_FV` decimal(15,10) NOT NULL,
  `RATE_PS` decimal(15,10) NOT NULL,
  `RATE_PT` decimal(15,10) NOT NULL,
  `RATE_PW` decimal(15,10) NOT NULL,
  `RATE_PY` decimal(15,10) NOT NULL,
  `RATE_PV` decimal(15,10) NOT NULL,
  `RATE_ST` decimal(15,10) NOT NULL,
  `RATE_SW` decimal(15,10) NOT NULL,
  `RATE_SY` decimal(15,10) NOT NULL,
  `RATE_SV` decimal(15,10) NOT NULL,
  `RATE_TW` decimal(15,10) NOT NULL,
  `RATE_TY` decimal(15,10) NOT NULL,
  `RATE_TV` decimal(15,10) NOT NULL,
  `RATE_WY` decimal(15,10) NOT NULL,
  `RATE_WV` decimal(15,10) NOT NULL,
  `RATE_YV` decimal(15,10) NOT NULL,
  PRIMARY KEY (`MODEL_KEY`),
  UNIQUE KEY `aa_model_constraint` (`MODEL_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The aa_models table depicts the assumed substitution rates a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aa_sequences`
--

DROP TABLE IF EXISTS `aa_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_sequences` (
  `SEQ_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL COMMENT 'Name of the alignment (alignment ID). Serves as foreign key to connect to the AA_Alignments table.',
  `SEQ_INDEX` int(11) NOT NULL COMMENT 'This column holds the unique index (integer starting with 1) for each sequence of an alignment.',
  `SEQ_NAME` varchar(250) NOT NULL COMMENT 'States the name of the sequence as it appears in the original alignment.',
  `TAX_ID` int(11) DEFAULT NULL,
  `TAX_CHECK` tinyint(4) DEFAULT NULL,
  `ACC_NR` varchar(20) DEFAULT NULL,
  `FRAC_WILDCARDS_GAPS` decimal(10,9) DEFAULT NULL COMMENT 'States the fraction of wildcards and gaps in the sequence.',
  `CHI2_P_VALUE` decimal(7,2) DEFAULT NULL COMMENT 'States the p value of the Chi2 test for the sequence. The Chi2 test tests whether the nucleotide composition of the sequence fits the mean nucleotide frequencies across all sequences in the alignment.',
  `CHI2_PASSED` tinyint(1) DEFAULT NULL COMMENT 'States whether the sequence passed (1) or failed (0) the Chi2 test. The Chi2 test tests whether the nucleotide composition of the sequence fits the mean nucleotide frequencies across all sequences in the alignment.',
  `EXCLUDED` int(11) DEFAULT NULL COMMENT 'States whether the sequence has been excluded from the IQ-Tree 2 calculations (without the flag --keep-ident). IQ-Tree 2 excludes a sequence if there are already at least two sequences in the alignment that are completely identical (gaps and wildcards mus',
  `IDENTICAL_TO` varchar(10000) DEFAULT NULL COMMENT 'States to which sequence(s) the sequence is identical to, if such (a) sequence(s) exist(s).',
  `FREQ_A` decimal(10,9) NOT NULL COMMENT 'States the frequencies of the amino acid Alanine (A) in the sequence.',
  `FREQ_R` decimal(10,9) NOT NULL,
  `FREQ_N` decimal(10,9) NOT NULL,
  `FREQ_D` decimal(10,9) NOT NULL,
  `FREQ_C` decimal(10,9) NOT NULL,
  `FREQ_Q` decimal(10,9) NOT NULL,
  `FREQ_E` decimal(10,9) NOT NULL,
  `FREQ_G` decimal(10,9) NOT NULL,
  `FREQ_H` decimal(10,9) NOT NULL,
  `FREQ_I` decimal(10,9) NOT NULL,
  `FREQ_L` decimal(10,9) NOT NULL,
  `FREQ_K` decimal(10,9) NOT NULL,
  `FREQ_M` decimal(10,9) NOT NULL,
  `FREQ_F` decimal(10,9) NOT NULL,
  `FREQ_P` decimal(10,9) NOT NULL,
  `FREQ_S` decimal(10,9) NOT NULL,
  `FREQ_T` decimal(10,9) NOT NULL,
  `FREQ_W` decimal(10,9) NOT NULL,
  `FREQ_Y` decimal(10,9) NOT NULL,
  `FREQ_V` decimal(10,9) NOT NULL,
  `SEQ` mediumtext NOT NULL COMMENT 'This text field contains the sequence (with wildcards and gaps) as it appears in the alignment.',
  PRIMARY KEY (`SEQ_KEY`),
  UNIQUE KEY `aa_seq_constraint` (`ALI_ID`,`SEQ_INDEX`),
  KEY `aa_taxonomy_key` (`TAX_ID`),
  CONSTRAINT `AA_Sequences_ibfk_1` FOREIGN KEY (`ALI_ID`) REFERENCES `aa_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aa_taxonomy_key` FOREIGN KEY (`TAX_ID`) REFERENCES `taxonomy` (`TAX_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1754211 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The aa_sequences table holds the sequences of each protein a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aa_tmp_pythia`
--

DROP TABLE IF EXISTS `aa_tmp_pythia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_tmp_pythia` (
  `TMP_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `PYTHIA_SCORE` decimal(15,9) NOT NULL,
  PRIMARY KEY (`TMP_KEY`),
  UNIQUE KEY `DATABASE_ID` (`ALI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21743 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aa_trees`
--

DROP TABLE IF EXISTS `aa_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_trees` (
  `TREE_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `IQTREE_VERSION` varchar(100) DEFAULT NULL,
  `RANDOM_SEED` int(11) NOT NULL,
  `TIME_STAMP` datetime NOT NULL,
  `MODEL_TYPE` varchar(100) NOT NULL,
  `TREE_TYPE` varchar(100) NOT NULL,
  `CHOICE_CRITERIUM` varchar(100) DEFAULT NULL,
  `KEEP_IDENT` tinyint(1) DEFAULT NULL,
  `ORIGINAL_ALI` tinyint(1) DEFAULT NULL,
  `MODEL` varchar(100) NOT NULL,
  `BASE_MODEL` varchar(100) NOT NULL,
  `RHAS_MODEL` varchar(100) DEFAULT NULL,
  `NUM_RATE_CAT` int(11) DEFAULT NULL,
  `LOGL` decimal(21,9) NOT NULL,
  `UNCONSTRAINED_LOGL` decimal(21,9) DEFAULT NULL,
  `AIC` decimal(21,9) NOT NULL,
  `AICC` decimal(21,9) NOT NULL,
  `BIC` decimal(21,9) NOT NULL,
  `CAIC` decimal(21,9) DEFAULT NULL,
  `ABIC` decimal(21,9) DEFAULT NULL,
  `NUM_FREE_PARAMETERS` int(11) NOT NULL,
  `NUM_MODEL_PARAMETERS` int(11) NOT NULL,
  `NUM_BRANCHES` int(11) NOT NULL,
  `PROP_INVAR` decimal(10,9) DEFAULT NULL,
  `ALPHA` decimal(15,9) DEFAULT NULL,
  `FREQ_TYPE` varchar(100) DEFAULT NULL,
  `FREQ_A` decimal(10,9) DEFAULT NULL,
  `FREQ_R` decimal(10,9) DEFAULT NULL,
  `FREQ_N` decimal(10,9) DEFAULT NULL,
  `FREQ_D` decimal(10,9) DEFAULT NULL,
  `FREQ_C` decimal(10,9) DEFAULT NULL,
  `FREQ_Q` decimal(10,9) DEFAULT NULL,
  `FREQ_E` decimal(10,9) DEFAULT NULL,
  `FREQ_G` decimal(10,9) DEFAULT NULL,
  `FREQ_H` decimal(10,9) DEFAULT NULL,
  `FREQ_I` decimal(10,9) DEFAULT NULL,
  `FREQ_L` decimal(10,9) DEFAULT NULL,
  `FREQ_K` decimal(10,9) DEFAULT NULL,
  `FREQ_M` decimal(10,9) DEFAULT NULL,
  `FREQ_F` decimal(10,9) DEFAULT NULL,
  `FREQ_P` decimal(10,9) DEFAULT NULL,
  `FREQ_S` decimal(10,9) DEFAULT NULL,
  `FREQ_T` decimal(10,9) DEFAULT NULL,
  `FREQ_W` decimal(10,9) DEFAULT NULL,
  `FREQ_Y` decimal(10,9) DEFAULT NULL,
  `FREQ_V` decimal(10,9) DEFAULT NULL,
  `PROP_CAT_1` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_1` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_2` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_2` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_3` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_3` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_4` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_4` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_5` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_5` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_6` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_6` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_7` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_7` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_8` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_8` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_9` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_9` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_10` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_10` decimal(15,9) DEFAULT NULL,
  `TREE_LENGTH` decimal(16,10) NOT NULL,
  `SUM_IBL` decimal(16,10) NOT NULL,
  `TREE_DIAMETER` decimal(16,10) NOT NULL,
  `DIST_MIN` decimal(15,7) DEFAULT NULL,
  `DIST_MAX` decimal(15,7) DEFAULT NULL,
  `DIST_MEAN` decimal(15,7) DEFAULT NULL,
  `DIST_MEDIAN` decimal(15,7) DEFAULT NULL,
  `DIST_VAR` decimal(15,7) DEFAULT NULL,
  `BL_MIN` decimal(16,10) DEFAULT NULL,
  `BL_MAX` decimal(16,10) DEFAULT NULL,
  `BL_MEAN` decimal(16,10) DEFAULT NULL,
  `BL_MEDIAN` decimal(16,10) DEFAULT NULL,
  `BL_VAR` decimal(16,10) DEFAULT NULL,
  `IBL_MIN` decimal(16,10) DEFAULT NULL,
  `IBL_MAX` decimal(16,10) DEFAULT NULL,
  `IBL_MEAN` decimal(16,10) DEFAULT NULL,
  `IBL_MEDIAN` decimal(16,10) DEFAULT NULL,
  `IBL_VAR` decimal(16,10) DEFAULT NULL,
  `EBL_MIN` decimal(16,10) DEFAULT NULL,
  `EBL_MAX` decimal(16,10) DEFAULT NULL,
  `EBL_MEAN` decimal(16,10) DEFAULT NULL,
  `EBL_MEDIAN` decimal(16,10) DEFAULT NULL,
  `EBL_VAR` decimal(16,10) DEFAULT NULL,
  `POT_LBA_7` int(11) DEFAULT NULL,
  `POT_LBA_8` int(11) DEFAULT NULL,
  `POT_LBA_9` int(11) DEFAULT NULL,
  `POT_LBA_10` int(11) DEFAULT NULL,
  `NEWICK_STRING` mediumtext NOT NULL,
  PRIMARY KEY (`TREE_KEY`),
  UNIQUE KEY `aa_tree_constraint` (`ALI_ID`,`TIME_STAMP`,`TREE_TYPE`),
  KEY `AA_Trees_foreign_model` (`BASE_MODEL`),
  KEY `aa_trees_index` (`MODEL`),
  KEY `aa_tree_length_index` (`TREE_LENGTH`),
  KEY `aa_tree_diameter_index` (`TREE_DIAMETER`),
  KEY `aa_bl_max_index` (`BL_MAX`),
  KEY `aa_bl_mean_index` (`BL_MEAN`),
  KEY `aa_ibl_max_index` (`IBL_MAX`),
  KEY `aa_ibl_mean_index` (`IBL_MEAN`),
  KEY `aa_ebl_max_index` (`EBL_MAX`),
  KEY `aa_ebl_mean_index` (`EBL_MEAN`),
  CONSTRAINT `AA_Trees_foreign_model` FOREIGN KEY (`BASE_MODEL`) REFERENCES `aa_models` (`MODEL_NAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AA_Trees_ibfk_1` FOREIGN KEY (`ALI_ID`) REFERENCES `aa_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62025 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataorigin`
--

DROP TABLE IF EXISTS `dataorigin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataorigin` (
  `DATABASE_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `DATABASE_ID` varchar(100) NOT NULL COMMENT 'This field holds the name of the source database, which in turn serves as the ID of said database. The entries of this column must be unique.',
  `STUDY_ID` varchar(250) DEFAULT NULL,
  `LAST_UPDATED` date DEFAULT NULL COMMENT 'States the date the source database was last updated, if available.',
  `SEQ_TYPE` varchar(100) DEFAULT NULL COMMENT 'States whether the source database holds of DNA and/or protein alignments.',
  `DESCRIPTION` text DEFAULT NULL COMMENT 'A text field that gives a short description of the source database.',
  `SIZE` text DEFAULT NULL COMMENT 'States the number of alignments the source database holds.',
  `URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`DATABASE_KEY`),
  UNIQUE KEY `DATABASE_ID` (`DATABASE_ID`),
  KEY `dataorigin_study_constraint` (`STUDY_ID`),
  CONSTRAINT `dataorigin_study_constraint` FOREIGN KEY (`STUDY_ID`) REFERENCES `studies` (`STUDY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The dataorigin table holds information regarding the origina';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_alignments`
--

DROP TABLE IF EXISTS `dna_alignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_alignments` (
  `ALI_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL COMMENT 'Name of the alignment (alignment ID). Must be unique.',
  `FROM_DATABASE` varchar(100) NOT NULL COMMENT 'States from which original database the alignment stems from (e.g. PANDIT). Serves as foreign key to connect to the DataOrigin table.',
  `DATA_URL` varchar(500) DEFAULT NULL,
  `STUDY_ID` varchar(250) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT 'A field that can hold an optional comment regarding the alignment. This can be left blank and the default value is accordingly NULL.',
  `TAXA` int(11) DEFAULT NULL,
  `SITES` int(11) DEFAULT NULL,
  `PARSIMONY_INFORMATIVE_SITES` int(11) NOT NULL COMMENT 'States the number of parsimony informative sites in alignment.',
  `SINGLETON_SITES` int(11) DEFAULT NULL,
  `CONSTANT_SITES` int(11) NOT NULL COMMENT 'States the number of constant sites in alignment.',
  `FRAC_WILDCARDS_GAPS` decimal(5,4) NOT NULL COMMENT 'States the fraction of wildcards and gaps in the alignment.',
  `DISTINCT_PATTERNS` int(11) NOT NULL COMMENT 'States the number of distinct patterns in alignment.',
  `FAILED_CHI2` int(11) NOT NULL COMMENT 'States the number of sequences that failed the chi2 (chi-squared) test. The test examines whether the nucleotide composition of the sequences matches the mean nucleotide frequencies across all sequences.',
  `IDENTICAL_SEQ` int(11) DEFAULT NULL COMMENT 'States the number of identical sequences in the alignment, should there be any. Default is NULL.',
  `EXCLUDED_SEQ` int(11) DEFAULT NULL COMMENT 'States the number of excluded sequences in the alignment, should there be any. Default is NULL.',
  `DIST_MIN` decimal(15,7) DEFAULT NULL,
  `DIST_MAX` decimal(15,7) DEFAULT NULL,
  `DIST_MEAN` decimal(15,7) DEFAULT NULL,
  `DIST_MEDIAN` decimal(15,7) DEFAULT NULL,
  `DIST_VAR` decimal(15,7) DEFAULT NULL,
  `PYTHIA_SCORE` decimal(15,9) DEFAULT NULL,
  PRIMARY KEY (`ALI_KEY`),
  UNIQUE KEY `ALI_ID` (`ALI_ID`),
  KEY `FROM_DATABASE` (`FROM_DATABASE`),
  KEY `dna_study_constraint` (`STUDY_ID`),
  KEY `dna_taxa_index` (`TAXA`),
  KEY `dna_sites_index` (`SITES`),
  KEY `dna_gaps_index` (`FRAC_WILDCARDS_GAPS`),
  KEY `dna_dist_mean_index` (`DIST_MEAN`),
  CONSTRAINT `DNA_Alignments_ibfk_1` FOREIGN KEY (`FROM_DATABASE`) REFERENCES `dataorigin` (`DATABASE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dna_study_constraint` FOREIGN KEY (`STUDY_ID`) REFERENCES `studies` (`STUDY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48707 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The dna_alignments table holds general information and chara';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_alignments_taxonomy`
--

DROP TABLE IF EXISTS `dna_alignments_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_alignments_taxonomy` (
  `ALI_TAX_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `TAX_RESOLVED` tinyint(1) NOT NULL,
  `LCA_TAX_ID` int(11) NOT NULL,
  `LCA_RANK_NR` int(11) NOT NULL,
  `LCA_RANK_NAME` varchar(50) NOT NULL,
  `superkingdom` int(11) DEFAULT NULL,
  `kingdom` int(11) DEFAULT NULL,
  `subkingdom` int(11) DEFAULT NULL,
  `superphylum` int(11) DEFAULT NULL,
  `subphylum` int(11) DEFAULT NULL,
  `phylum` int(11) DEFAULT NULL,
  `superclass` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `subclass` int(11) DEFAULT NULL,
  `infraclass` int(11) DEFAULT NULL,
  `cohort` int(11) DEFAULT NULL,
  `subcohort` int(11) DEFAULT NULL,
  `superorder` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `suborder` int(11) DEFAULT NULL,
  `infraorder` int(11) DEFAULT NULL,
  `parvorder` int(11) DEFAULT NULL,
  `superfamily` int(11) DEFAULT NULL,
  `family` int(11) DEFAULT NULL,
  `subfamily` int(11) DEFAULT NULL,
  `genus` int(11) DEFAULT NULL,
  `subgenus` int(11) DEFAULT NULL,
  `species_group` int(11) DEFAULT NULL,
  `species_subgroup` int(11) DEFAULT NULL,
  `species` int(11) DEFAULT NULL,
  `subspecies` int(11) DEFAULT NULL,
  `tribe` int(11) DEFAULT NULL,
  `subtribe` int(11) DEFAULT NULL,
  `forma` int(11) DEFAULT NULL,
  `varietas` int(11) DEFAULT NULL,
  `strain` int(11) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `subsection` int(11) DEFAULT NULL,
  `pathogroup` int(11) DEFAULT NULL,
  `subvariety` int(11) DEFAULT NULL,
  `genotype` int(11) DEFAULT NULL,
  `serotype` int(11) DEFAULT NULL,
  `isolate` int(11) DEFAULT NULL,
  `morph` int(11) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `forma_specialis` int(11) DEFAULT NULL,
  `serogroup` int(11) DEFAULT NULL,
  `biotype` int(11) DEFAULT NULL,
  PRIMARY KEY (`ALI_TAX_KEY`),
  UNIQUE KEY `dna_ali_tax_constraint` (`ALI_ID`),
  KEY `dna_ali_tax_foreign_key_lca` (`LCA_TAX_ID`),
  KEY `dna_ali_tax_foreign_1_superkingdom` (`superkingdom`),
  KEY `dna_ali_tax_foreign_2_kingdom` (`kingdom`),
  KEY `dna_ali_tax_foreign_3_subkingdom` (`subkingdom`),
  KEY `dna_ali_tax_foreign_4_superphylum` (`superphylum`),
  KEY `dna_ali_tax_foreign_5_phylum` (`phylum`),
  KEY `dna_ali_tax_foreign_6_subphylum` (`subphylum`),
  KEY `dna_ali_tax_foreign_8_superclass` (`superclass`),
  KEY `dna_ali_tax_foreign_9_class` (`class`),
  KEY `dna_ali_tax_foreign_10_subclass` (`subclass`),
  KEY `dna_ali_tax_foreign_11_infraclass` (`infraclass`),
  KEY `dna_ali_tax_foreign_12_cohort` (`cohort`),
  KEY `dna_ali_tax_foreign_13_subcohort` (`subcohort`),
  KEY `dna_ali_tax_foreign_14_superorder` (`superorder`),
  KEY `dna_ali_tax_foreign_15_order` (`order`),
  KEY `dna_ali_tax_foreign_16_suborder` (`suborder`),
  KEY `dna_ali_tax_foreign_17_infraorder` (`infraorder`),
  KEY `dna_ali_tax_foreign_18_parvorder` (`parvorder`),
  KEY `dna_ali_tax_foreign_19_superfamily` (`superfamily`),
  KEY `dna_ali_tax_foreign_20_family` (`family`),
  KEY `dna_ali_tax_foreign_21_subfamily` (`subfamily`),
  KEY `dna_ali_tax_foreign_22_tribe` (`tribe`),
  KEY `dna_ali_tax_foreign_23_subtribe` (`subtribe`),
  KEY `dna_ali_tax_foreign_24_genus` (`genus`),
  KEY `dna_ali_tax_foreign_25_subgenus` (`subgenus`),
  KEY `dna_ali_tax_foreign_26_section` (`section`),
  KEY `dna_ali_tax_foreign_27_subsection` (`subsection`),
  KEY `dna_ali_tax_foreign_28_series` (`series`),
  KEY `dna_ali_tax_foreign_30_species_group` (`species_group`),
  KEY `dna_ali_tax_foreign_31_species_subgroup` (`species_subgroup`),
  KEY `dna_ali_tax_foreign_32_species` (`species`),
  KEY `dna_ali_tax_foreign_33_forma_specialis` (`forma_specialis`),
  KEY `dna_ali_tax_foreign_34_subspecies` (`subspecies`),
  KEY `dna_ali_tax_foreign_35_varietas` (`varietas`),
  KEY `dna_ali_tax_foreign_36_subvariety` (`subvariety`),
  KEY `dna_ali_tax_foreign_37_forma` (`forma`),
  KEY `dna_ali_tax_foreign_38_serogroup` (`serogroup`),
  KEY `dna_ali_tax_foreign_39_serotype` (`serotype`),
  KEY `dna_ali_tax_foreign_40_strain` (`strain`),
  KEY `dna_ali_tax_foreign_41_isolate` (`isolate`),
  CONSTRAINT `dna_ali_tax_foreign_key` FOREIGN KEY (`ALI_ID`) REFERENCES `dna_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dna_ali_tax_foreign_key_lca` FOREIGN KEY (`LCA_TAX_ID`) REFERENCES `taxonomy` (`TAX_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65536 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_branches`
--

DROP TABLE IF EXISTS `dna_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_branches` (
  `BRANCH_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `TIME_STAMP` datetime NOT NULL,
  `TREE_TYPE` varchar(100) DEFAULT NULL,
  `BRANCH_INDEX` int(11) NOT NULL,
  `BRANCH_TYPE` varchar(30) NOT NULL,
  `BL` decimal(16,10) NOT NULL,
  `SPLIT_SIZE` int(11) NOT NULL,
  `MIN_PATH_1` decimal(16,10) DEFAULT NULL,
  `MAX_PATH_1` decimal(16,10) DEFAULT NULL,
  `MEAN_PATH_1` decimal(16,10) DEFAULT NULL,
  `MEDIAN_PATH_1` decimal(16,10) DEFAULT NULL,
  `MIN_PATH_2` decimal(16,10) DEFAULT NULL,
  `MAX_PATH_2` decimal(16,10) DEFAULT NULL,
  `MEAN_PATH_2` decimal(16,10) DEFAULT NULL,
  `MEDIAN_PATH_2` decimal(16,10) DEFAULT NULL,
  PRIMARY KEY (`BRANCH_KEY`),
  UNIQUE KEY `dna_branch_constraint` (`ALI_ID`,`BRANCH_INDEX`,`TIME_STAMP`,`TREE_TYPE`),
  KEY `ALI_ID` (`ALI_ID`,`TIME_STAMP`,`TREE_TYPE`),
  CONSTRAINT `DNA_Branches_ibfk_1` FOREIGN KEY (`ALI_ID`, `TIME_STAMP`, `TREE_TYPE`) REFERENCES `dna_trees` (`ALI_ID`, `TIME_STAMP`, `TREE_TYPE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27004199 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_modelparameters`
--

DROP TABLE IF EXISTS `dna_modelparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_modelparameters` (
  `MODELTEST_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `IQTREE_VERSION` varchar(100) NOT NULL,
  `RANDOM_SEED` int(11) NOT NULL,
  `TIME_STAMP` datetime NOT NULL,
  `MODEL_TYPE` varchar(100) NOT NULL,
  `KEEP_IDENT` tinyint(1) DEFAULT NULL,
  `ORIGINAL_ALI` tinyint(1) DEFAULT NULL,
  `MODEL` varchar(100) NOT NULL,
  `BASE_MODEL` varchar(100) NOT NULL,
  `RHAS_MODEL` varchar(100) DEFAULT NULL,
  `NUM_RATE_CAT` int(11) DEFAULT NULL,
  `LOGL` decimal(21,9) NOT NULL,
  `AIC` decimal(21,9) NOT NULL,
  `AIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_AIC` tinyint(1) NOT NULL,
  `AICC` decimal(21,9) NOT NULL,
  `AICC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_AICC` tinyint(1) NOT NULL,
  `BIC` decimal(21,9) NOT NULL,
  `BIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_BIC` tinyint(1) NOT NULL,
  `CAIC` decimal(21,9) NOT NULL,
  `CAIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_CAIC` tinyint(1) NOT NULL,
  `ABIC` decimal(21,9) NOT NULL,
  `ABIC_WEIGHT` float DEFAULT NULL,
  `CONFIDENCE_ABIC` tinyint(1) NOT NULL,
  `NUM_FREE_PARAMETERS` int(11) NOT NULL,
  `NUM_MODEL_PARAMETERS` int(11) NOT NULL,
  `NUM_BRANCHES` int(11) NOT NULL,
  `TREE_LENGTH` decimal(15,9) NOT NULL,
  `PROP_INVAR` decimal(10,9) DEFAULT NULL,
  `ALPHA` decimal(15,9) DEFAULT NULL,
  `FREQ_TYPE` varchar(100) DEFAULT NULL,
  `FREQ_A` decimal(10,9) DEFAULT NULL,
  `FREQ_C` decimal(10,9) DEFAULT NULL,
  `FREQ_G` decimal(10,9) DEFAULT NULL,
  `FREQ_T` decimal(10,9) DEFAULT NULL,
  `RATE_AC` decimal(15,9) NOT NULL,
  `RATE_CA` decimal(15,9) NOT NULL,
  `RATE_AG` decimal(15,9) NOT NULL,
  `RATE_GA` decimal(15,9) NOT NULL,
  `RATE_AT` decimal(15,9) NOT NULL,
  `RATE_TA` decimal(15,9) NOT NULL,
  `RATE_CG` decimal(15,9) NOT NULL,
  `RATE_GC` decimal(15,9) NOT NULL,
  `RATE_CT` decimal(15,9) NOT NULL,
  `RATE_TC` decimal(15,9) NOT NULL,
  `RATE_GT` decimal(15,9) NOT NULL,
  `RATE_TG` decimal(15,9) NOT NULL,
  `PROP_CAT_1` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_1` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_2` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_2` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_3` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_3` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_4` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_4` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_5` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_5` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_6` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_6` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_7` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_7` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_8` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_8` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_9` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_9` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_10` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_10` decimal(15,9) DEFAULT NULL,
  PRIMARY KEY (`MODELTEST_KEY`),
  UNIQUE KEY `dna_modeltest_constraint` (`ALI_ID`,`TIME_STAMP`,`MODEL`),
  KEY `BASE_MODEL` (`BASE_MODEL`),
  KEY `ON_MODEL_DNA_ModelParameters` (`MODEL`),
  KEY `dna_modelpara_index` (`MODEL`),
  KEY `dna_bic_weight` (`BIC_WEIGHT`),
  KEY `dna_aic_weight` (`AIC_WEIGHT`),
  KEY `dna_aicc_weight` (`AICC_WEIGHT`),
  CONSTRAINT `DNA_ModelParameters_ibfk_1` FOREIGN KEY (`ALI_ID`) REFERENCES `dna_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DNA_ModelParameters_ibfk_2` FOREIGN KEY (`BASE_MODEL`) REFERENCES `dna_models` (`MODEL_NAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10193141 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The dna_modelparameters table holds the results of model eva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_models`
--

DROP TABLE IF EXISTS `dna_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_models` (
  `MODEL_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `MODEL_NAME` varchar(100) NOT NULL COMMENT 'Name of the protein model (substitution rate matrix). The name must be unique.',
  `FREE_PARAMETERS` int(11) NOT NULL COMMENT 'States the number of free parameters of the model.',
  `BASE_FREQUENCIES` varchar(30) NOT NULL COMMENT 'States whether the assumed base frequencies of the model are equal (0.25 for each base) or unequal.',
  `SUBSTITUTION_RATES` varchar(100) NOT NULL COMMENT 'States (possible) restrictions the model has on the substitution rates.',
  `EXPLANATION` varchar(100) DEFAULT NULL COMMENT 'This filed gives a short description of the model.',
  `SUBSTITUTION_CODE` varchar(100) NOT NULL COMMENT 'This field shows the substitution code of the rate matrix.',
  PRIMARY KEY (`MODEL_KEY`),
  UNIQUE KEY `dna_model_constraint` (`MODEL_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The dna_models table gives an overview of the different DNA ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_sequences`
--

DROP TABLE IF EXISTS `dna_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_sequences` (
  `SEQ_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL COMMENT 'Name of the alignment (alignment ID). Serves as foreign key to connect to the DNA_Alignments table.',
  `SEQ_INDEX` int(11) NOT NULL COMMENT 'This column holds the unique index (integer starting with 1) for each sequence of an alignment. Together with the alignment ID (ALI_ID) it serves as a constraint (unique key).',
  `SEQ_NAME` varchar(250) NOT NULL COMMENT 'States the name of the sequence as it appears in the original alignment.',
  `TAX_ID` int(11) DEFAULT NULL,
  `TAX_CHECK` tinyint(4) DEFAULT NULL,
  `ACC_NR` varchar(20) DEFAULT NULL,
  `FRAC_WILDCARDS_GAPS` decimal(10,9) DEFAULT NULL COMMENT 'States the fractions of wildcards and gaps in the sequence.',
  `CHI2_P_VALUE` decimal(7,2) DEFAULT NULL,
  `CHI2_PASSED` tinyint(1) DEFAULT NULL COMMENT 'States whether the sequence passed (1) or failed (0) the Chi2 test. The Chi2 test tests whether the nucleotide composition of the sequence fits the mean nucleotide frequencies across all sequences in the alignment.',
  `EXCLUDED` int(11) DEFAULT NULL COMMENT 'States whether the sequence has been excluded from the IQ-Tree 2 calculations (without the flag --keep-ident). IQ-Tree 2 excludes a sequence if there are already at least two sequences in the alignment that are completely identical (gaps and wildcards mus',
  `IDENTICAL_TO` varchar(10000) DEFAULT NULL COMMENT 'States to which sequence(s) the sequence is identical to, if such (a) sequence(s) exist(s).',
  `FREQ_A` decimal(10,9) NOT NULL COMMENT 'States the frequency of the base Adenine (A) in the sequence.',
  `FREQ_C` decimal(10,9) NOT NULL COMMENT 'States the frequency of the base Cytosine (C) in the sequence.',
  `FREQ_G` decimal(10,9) NOT NULL COMMENT 'States the frequency of the base Guanine (G) in the sequence.',
  `FREQ_T` decimal(10,9) NOT NULL COMMENT 'States the frequency of the base Thymine (T) in the sequence.',
  `SEQ` mediumtext NOT NULL COMMENT 'This text filed contains the sequence (with wildcards and gaps) as it appears in the alignment.',
  PRIMARY KEY (`SEQ_KEY`),
  UNIQUE KEY `dna_seq_constraint` (`ALI_ID`,`SEQ_INDEX`),
  KEY `TAX_ID` (`TAX_ID`),
  CONSTRAINT `dna_sequences_foreign_key` FOREIGN KEY (`ALI_ID`) REFERENCES `dna_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dna_sequences_ibfk_1` FOREIGN KEY (`TAX_ID`) REFERENCES `taxonomy` (`TAX_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5640336 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The dna_sequences table holds the sequences of each DNA alig';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_tmp_pythia`
--

DROP TABLE IF EXISTS `dna_tmp_pythia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_tmp_pythia` (
  `TMP_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `PYTHIA_SCORE` decimal(15,9) NOT NULL,
  PRIMARY KEY (`TMP_KEY`),
  UNIQUE KEY `DATABASE_ID` (`ALI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48613 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_trees`
--

DROP TABLE IF EXISTS `dna_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dna_trees` (
  `TREE_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `IQTREE_VERSION` varchar(100) NOT NULL,
  `RANDOM_SEED` int(11) NOT NULL,
  `TIME_STAMP` datetime NOT NULL,
  `MODEL_TYPE` varchar(100) NOT NULL,
  `TREE_TYPE` varchar(100) NOT NULL,
  `CHOICE_CRITERIUM` varchar(100) DEFAULT NULL,
  `KEEP_IDENT` tinyint(1) DEFAULT NULL,
  `ORIGINAL_ALI` tinyint(1) DEFAULT NULL,
  `MODEL` varchar(100) NOT NULL,
  `BASE_MODEL` varchar(100) NOT NULL,
  `RHAS_MODEL` varchar(100) DEFAULT NULL,
  `NUM_RATE_CAT` int(11) DEFAULT NULL,
  `LOGL` decimal(21,9) NOT NULL,
  `UNCONSTRAINED_LOGL` decimal(21,9) DEFAULT NULL,
  `AIC` decimal(21,9) NOT NULL,
  `AICC` decimal(21,9) NOT NULL,
  `BIC` decimal(21,9) NOT NULL,
  `CAIC` decimal(21,9) DEFAULT NULL,
  `ABIC` decimal(21,9) DEFAULT NULL,
  `NUM_FREE_PARAMETERS` int(11) NOT NULL,
  `NUM_MODEL_PARAMETERS` int(11) NOT NULL,
  `NUM_BRANCHES` int(11) NOT NULL,
  `PROP_INVAR` decimal(10,9) DEFAULT NULL,
  `ALPHA` decimal(15,9) DEFAULT NULL,
  `FREQ_TYPE` varchar(100) DEFAULT NULL,
  `FREQ_A` decimal(10,9) DEFAULT NULL,
  `FREQ_C` decimal(10,9) DEFAULT NULL,
  `FREQ_G` decimal(10,9) DEFAULT NULL,
  `FREQ_T` decimal(10,9) DEFAULT NULL,
  `RATE_AC` decimal(15,9) NOT NULL,
  `RATE_AG` decimal(15,9) NOT NULL,
  `RATE_AT` decimal(15,9) NOT NULL,
  `RATE_CA` decimal(15,9) NOT NULL,
  `RATE_CG` decimal(15,9) NOT NULL,
  `RATE_CT` decimal(15,9) NOT NULL,
  `RATE_GA` decimal(15,9) NOT NULL,
  `RATE_GC` decimal(15,9) NOT NULL,
  `RATE_GT` decimal(15,9) NOT NULL,
  `RATE_TA` decimal(15,9) NOT NULL,
  `RATE_TC` decimal(15,9) NOT NULL,
  `RATE_TG` decimal(15,9) NOT NULL,
  `PROP_CAT_1` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_1` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_2` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_2` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_3` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_3` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_4` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_4` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_5` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_5` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_6` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_6` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_7` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_7` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_8` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_8` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_9` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_9` decimal(15,9) DEFAULT NULL,
  `PROP_CAT_10` decimal(10,9) DEFAULT NULL,
  `REL_RATE_CAT_10` decimal(15,9) DEFAULT NULL,
  `TREE_LENGTH` decimal(16,10) NOT NULL,
  `SUM_IBL` decimal(16,10) NOT NULL,
  `TREE_DIAMETER` decimal(16,10) NOT NULL,
  `DIST_MIN` decimal(15,7) DEFAULT NULL,
  `DIST_MAX` decimal(15,7) DEFAULT NULL,
  `DIST_MEAN` decimal(15,7) DEFAULT NULL,
  `DIST_MEDIAN` decimal(15,7) DEFAULT NULL,
  `DIST_VAR` decimal(15,7) DEFAULT NULL,
  `BL_MIN` decimal(16,10) DEFAULT NULL,
  `BL_MAX` decimal(16,10) DEFAULT NULL,
  `BL_MEAN` decimal(16,10) DEFAULT NULL,
  `BL_MEDIAN` decimal(16,10) DEFAULT NULL,
  `BL_VAR` decimal(16,10) DEFAULT NULL,
  `IBL_MIN` decimal(16,10) DEFAULT NULL,
  `IBL_MAX` decimal(16,10) DEFAULT NULL,
  `IBL_MEAN` decimal(16,10) DEFAULT NULL,
  `IBL_MEDIAN` decimal(16,10) DEFAULT NULL,
  `IBL_VAR` decimal(16,10) DEFAULT NULL,
  `EBL_MIN` decimal(16,10) DEFAULT NULL,
  `EBL_MAX` decimal(16,10) DEFAULT NULL,
  `EBL_MEAN` decimal(16,10) DEFAULT NULL,
  `EBL_MEDIAN` decimal(16,10) DEFAULT NULL,
  `EBL_VAR` decimal(16,10) DEFAULT NULL,
  `POT_LBA_7` int(11) DEFAULT NULL,
  `POT_LBA_8` int(11) DEFAULT NULL,
  `POT_LBA_9` int(11) DEFAULT NULL,
  `POT_LBA_10` int(11) DEFAULT NULL,
  `NEWICK_STRING` mediumtext NOT NULL,
  PRIMARY KEY (`TREE_KEY`),
  UNIQUE KEY `dna_tree_constraint` (`ALI_ID`,`TIME_STAMP`,`TREE_TYPE`),
  KEY `DNA_Trees_foreign_model` (`BASE_MODEL`),
  KEY `dna_trees_index` (`MODEL`),
  KEY `dna_tree_length_index` (`TREE_LENGTH`),
  KEY `dna_tree_diameter_index` (`TREE_DIAMETER`),
  KEY `dna_bl_max_index` (`BL_MAX`),
  KEY `dna_bl_mean_index` (`BL_MEAN`),
  KEY `dna_ibl_max_index` (`IBL_MAX`),
  KEY `dna_ibl_mean_index` (`IBL_MEAN`),
  KEY `dna_ebl_max_index` (`EBL_MAX`),
  KEY `dna_ebl_mean_index` (`EBL_MEAN`),
  CONSTRAINT `DNA_Trees_foreign_model` FOREIGN KEY (`BASE_MODEL`) REFERENCES `dna_models` (`MODEL_NAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DNA_Trees_ibfk_1` FOREIGN KEY (`ALI_ID`) REFERENCES `dna_alignments` (`ALI_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129782 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studies`
--

DROP TABLE IF EXISTS `studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studies` (
  `STUDY_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `STUDY_ID` varchar(250) NOT NULL,
  `STUDY_URL` varchar(500) DEFAULT NULL,
  `YEAR` int(11) DEFAULT NULL,
  `CITATION` text DEFAULT NULL,
  PRIMARY KEY (`STUDY_KEY`),
  UNIQUE KEY `study_unique_key` (`STUDY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5304 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy`
--

DROP TABLE IF EXISTS `taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy` (
  `TAX_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `TAX_ID` int(11) NOT NULL COMMENT 'NCBI taxonomy identifier',
  `PARENT_TAX_ID` int(11) DEFAULT NULL,
  `TAX_NAME` varchar(250) DEFAULT NULL,
  `TAX_RANK` varchar(50) DEFAULT NULL,
  `RED_RANK` varchar(50) DEFAULT NULL,
  `RED_RANK_NUM` int(11) DEFAULT NULL,
  `RED_RANK_NAME` varchar(250) DEFAULT NULL,
  `RED_TAX_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TAX_KEY`),
  UNIQUE KEY `TAX_ID` (`TAX_ID`),
  KEY `tax_name_index` (`TAX_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2704396 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Taxonomy table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_studies`
--

DROP TABLE IF EXISTS `tmp_studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_studies` (
  `TMP_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ALI_ID` varchar(250) NOT NULL,
  `STUDY_ID` varchar(250) DEFAULT NULL,
  `DATA_URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`TMP_KEY`),
  UNIQUE KEY `tmp_ali` (`ALI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11521 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 15:37:21
