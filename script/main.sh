#!/usr/bin/env bash

cd ..
cmake src
make

GET_HUMAN=0             # download Human choromosomes and make SEQ out of FASTA
GET_CHIMPANZEE=0        # download Chimpanzee choromosomes and make SEQ out of FASTA
GET_GORILLA=0           # download Gorilla choromosomes and make SEQ out of FASTA
GET_CHICKEN=0           # download Chicken choromosomes and make SEQ out of FASTA
GET_TURKEY=0            # download Turkey choromosomes and make SEQ out of FASTA
INSTALL_XS=0            # install "XS" from Github
INSTALL_GOOSE=0         # install "GOOSE" from Github
INSTALL_GULL=0          # install "GULL" from Github
GEN_DATASET=0          # generate datasets using "XS"
GEN_MUTATIONS=0         # generate mutations using "GOOSE"
GEN_ARCHAEA=0           # generate archea dataset using "GOOSE" -- output: out#.fa
RUN_PHOENIX=0           # run Phoenix
PLOT_RESULT=0           # plot results using "gnuplot"
BUILD_MATRIX=0          # build matrix from datasets
PLOT_MATRIX=0           # plot matrix from datasets

### reference parameters
#REF_SPECIES=$HUMAN_CHR
#REF_SPECIES=$CHIMPANZEE_CHR
#REF_SPECIES=$GORILLA_CHR
#REF_SPECIES=$CHICKEN_CHR
#REF_SPECIES=$TURKEY_CHR
REF_SPECIES=$ARCHAEA_CHR
### all chromosomes for that species, e.g. HS_SEQ_RUN
tempRefSeqRun=${REF_SPECIES}_SEQ_RUN;    REF_SEQ_RUN=${!tempRefSeqRun}

REF_DATASET="";  for i in 24; do REF_DATASET+=$REF_SPECIES${i}" "; done
#REF_DATASET="";  for i in $REF_SEQ_RUN; do REF_DATASET+=$REF_SPECIES${i}" "; done

### target parameters
#TAR_SPECIES=$HUMAN_CHR
#TAR_SPECIES=$CHIMPANZEE_CHR
#TAR_SPECIES=$GORILLA_CHR
#TAR_SPECIES=$CHICKEN_CHR
#TAR_SPECIES=$TURKEY_CHR
TAR_SPECIES=$ARCHAEA_CHR
### all chromosomes for that species, e.g. HS_SEQ_RUN
tempTarSeqRun=${TAR_SPECIES}_SEQ_RUN;    TAR_SEQ_RUN=${!tempTarSeqRun}

TAR_DATASET="";  for i in $TAR_SEQ_RUN; do TAR_DATASET+=$TAR_SPECIES${i}" "; done


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
if [[ $GEN_DATASET -eq 1 ]]; then . $FLD_script/generate_dataset.sh; fi

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
