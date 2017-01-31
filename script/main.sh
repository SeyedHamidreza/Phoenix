#!/bin/bash


#***********************************************************
#   change directory to home
#***********************************************************
cd ..
cmake src
make

#***********************************************************
#   parameters to install and run needed programs
#***********************************************************
###*** folders to be used
FLD_archive_dat="archive_dat"
FLD_archive_datasets="archive_datasets"
FLD_chromosomes="chromosomes"
FLD_dat="dat"
FLD_datasets="datasets"
FLD_GOOSE="goose"
FLD_GULL="GULL"
FLD_XS="XS"
FLD_src="src"
FLD_script="script"

GET_HUMAN=0             # download Human choromosomes and make SEQ out of FASTA
GET_CHIMPANZEE=0        # download Chimpanzee choromosomes and make SEQ out of FASTA
GET_GORILLA=0           # download Gorilla choromosomes and make SEQ out of FASTA
GET_CHICKEN=0           # download Chicken choromosomes and make SEQ out of FASTA
GET_TURKEY=0            # download Turkey choromosomes and make SEQ out of FASTA
INSTALL_XS=0            # install "XS" from Github
INSTALL_GOOSE=0         # install "GOOSE" from Github
INSTALL_GULL=0          # install "GULL" from Github
GEN_DATASETS=0          # generate datasets using "XS"
GEN_MUTATIONS=0         # generate mutations using "GOOSE"
GEN_ARCHAEA=0           # generate archea dataset using "GOOSE" -- output: out#.fa
RUN_PHOENIX=0                   # run the program
PLOT_RESULT=0          # plot results using "gnuplot"
BUILD_MATRIX=0          # build matrix from datasets
PLOT_MATRIX=0           # plot matrix from datasets

# mutations list:   `seq -s' ' 1 10`
#MUT_LIST="1 2 3 4 5 6 7 8 9 10 12 14 16 18 20 25 30 35 40 45 50"

HUMAN_URL="ftp://ftp.ncbi.nlm.nih.gov/genomes/H_sapiens/Assembled_chromosomes/seq"
CHIMPANZEE_URL="ftp://ftp.ncbi.nlm.nih.gov/genomes/Pan_troglodytes/Assembled_chromosomes/seq"
GORILLA_URL="ftp://ftp.ncbi.nlm.nih.gov/genomes/Gorilla_gorilla/Assembled_chromosomes/seq"
CHICKEN_URL="ftp://ftp.ncbi.nlm.nih.gov/genomes/Gallus_gallus/Assembled_chromosomes/seq"
TURKEY_URL="ftp://ftp.ncbi.nlm.nih.gov/genomes/Meleagris_gallopavo/Assembled_chromosomes/seq"

HUMAN_CHR_PREFIX="hs_ref_GRCh38.p7_"
CHIMPANZEE_CHR_PREFIX="ptr_ref_Pan_tro_3.0_"
GORILLA_CHR_PREFIX="9595_ref_gorGor4_"
CHICKEN_CHR_PREFIX="gga_ref_Gallus_gallus-5.0_"
TURKEY_CHR_PREFIX="mga_ref_Turkey_5.0_"

CHR="chr"

HUMAN_CHR="HS"
CHIMPANZEE_CHR="PT"
GORILLA_CHR="GG"
ARCHAEA_CHR="A"
CHICKEN_CHR="GGA"
TURKEY_CHR="MGA"

CURR_CHR="21"
chromosomes="$HUMAN_CHR_PREFIX$CHR$CURR_CHR"

HUMAN_CHROMOSOME="$HUMAN_CHR_PREFIX$CHR"
CHIMPANZEE_CHROMOSOME="$CHIMPANZEE_CHR_PREFIX$CHR"
GORILLA_CHROMOSOME="$GORILLA_CHR_PREFIX$CHR"
CHICKEN_CHROMOSOME="$CHICKEN_CHR_PREFIX$CHR"
TURKEY_CHROMOSOME="$TURKEY_CHR_PREFIX$CHR"

HS_SEQ_RUN=`seq -s' ' 1 22`; HS_SEQ_RUN+=" X Y MT AL UL UP"
PT_SEQ_RUN="1 2A 2B "; PT_SEQ_RUN+=`seq -s' ' 3 22`; PT_SEQ_RUN+=" X Y MT UL UP"
GG_SEQ_RUN="1 2A 2B "; GG_SEQ_RUN+=`seq -s' ' 3 22`; GG_SEQ_RUN+=" X MT UL UP"
A_SEQ_RUN=`seq -s' ' 1 206`
GGA_SEQ_RUN=`seq -s' ' 1 28`; GGA_SEQ_RUN+=" "; GGA_SEQ_RUN+=`seq -s' ' 30 33`; GGA_SEQ_RUN+=" LG MT W Z UL UP"
MGA_SEQ_RUN=`seq -s' ' 1 30`; MGA_SEQ_RUN+=" MT W Z UL UP"

datasets="$HUMAN_CHR$CURR_CHR"
#datasets="";   for i in $HS_SEQ_RUN; do datasets+=$HUMAN_CHR${i}" "; done

### reference parameters
#REF_SPECIE=$HUMAN_CHR
#REF_SPECIE=$CHIMPANZEE_CHR
#REF_SPECIE=$GORILLA_CHR
#REF_SPECIE=$CHICKEN_CHR
#REF_SPECIE=$TURKEY_CHR
REF_SPECIE=$ARCHAEA_CHR
#
tempRefSeqRun=${REF_SPECIE}_SEQ_RUN
REF_SEQ_RUN=${!tempRefSeqRun}     # all chromosomes for that specie, e.g. HS_SEQ_RUN
REF_DATASET="";  for i in 24; do REF_DATASET+=$REF_SPECIE${i}" "; done
#REF_DATASET="";  for i in $REF_SEQ_RUN; do REF_DATASET+=$REF_SPECIE${i}" "; done

###*** target parameters
#TAR_SPECIE=$HUMAN_CHR
#TAR_SPECIE=$CHIMPANZEE_CHR
#TAR_SPECIE=$GORILLA_CHR
#TAR_SPECIE=$CHICKEN_CHR
#TAR_SPECIE=$TURKEY_CHR
TAR_SPECIE=$ARCHAEA_CHR
#
tempTarSeqRun=${TAR_SPECIE}_SEQ_RUN
TAR_SEQ_RUN=${!tempTarSeqRun}     # all chromosomes for that specie, e.g. HS_SEQ_RUN
TAR_DATASET="";  for i in $TAR_SEQ_RUN; do TAR_DATASET+=$TAR_SPECIE${i}" "; done


FILE_TYPE="fa"          # file type
COMP_FILE_TYPE="gz"     # compressed file type
INF_FILE_TYPE="dat"     # information (data) file type
#INF_FILE_TYPE="csv"     # information (data) file type

PIX_FORMAT=pdf          # output format: pdf, png, svg, eps, epslatex (set output x.y)
IR_LBL=i                # label for inverted repeat
a_LBL=a                 # label for alpha denominator

INV_REPEATS="0 1"         # list of inverted repeats
ALPHA_DENS="100"        # list of alpha denominators
MIN_CTX=20              # min context-order size
MAX_CTX=20              # max context-order size


#>>>>>  download Human choromosomes and make SEQ out of FASTA
if [[ $GET_HUMAN -eq 1 ]]; then . $FLD_script/get_human.sh; fi

#>>>>>  download Chimpanzee choromosomes and make SEQ out of FASTA
if [[ $GET_CHIMPANZEE -eq 1 ]]; then . $FLD_script/get_chimpanzee.sh; fi

#>>>>>  download Gorilla choromosomes and make SEQ out of FASTA
if [[ $GET_GORILLA -eq 1 ]]; then . $FLD_script/get_gorilla.sh; fi

#>>>>>  download Chicken choromosomes and make SEQ out of FASTA
if [[ $GET_CHICKEN -eq 1 ]]; then . $FLD_script/get_chicken.sh; fi

#>>>>>  download Turkey choromosomes and make SEQ out of FASTA
if [[ $GET_TURKEY -eq 1 ]]; then . $FLD_script/get_turkey.sh; fi

#>>>>>  install "XS" from Github
if [[ $INSTALL_XS -eq 1 ]]; then . $FLD_script/install_XS.sh; fi

#>>>>>  install "GOOSE" from Github
if [[ $INSTALL_GOOSE -eq 1 ]]; then . $FLD_script/install_GOOSE.sh; fi

#>>>>>  install "GULL" from Github
if [[ $INSTALL_GULL -eq 1 ]]; then . $FLD_script/install_GULL.sh; fi

#>>>>>  generate datasets using "XS"
if [[ $GEN_DATASETS -eq 1 ]]; then . $FLD_script/generate_dataset.sh; fi

#>>>>>  generate mutations using "GOOSE"
if [[ $GEN_MUTATIONS -eq 1 ]]; then . $FLD_script/generate_mutation.sh; fi

#>>>>>  generate archaea dataset using "GOOSE" -- output: out#.fa
if [[ $GEN_ARCHAEA -eq 1 ]]; then . $FLD_script/generate_archaea.sh; fi

#>>>>>  run Phoenix
if [[ $RUN_PHOENIX -eq 1 ]]; then . $FLD_script/run_phoenix.sh; fi

#>>>>>  plot results using "gnuplot"
if [[ $PLOT_RESULT -eq 1 ]]; then . $FLD_script/plot_result.sh; fi

#>>>>>  build matrix from Reference Target correspondence
if [[ $BUILD_MATRIX -eq 1 ]]; then . $FLD_script/build_matrix.sh; fi

#>>>>>  plot matrix from Reference Target correspondence
if [[ $PLOT_MATRIX -eq 1 ]]; then . $FLD_script/plot_matrix.sh; fi


########################
cd $FLD_script