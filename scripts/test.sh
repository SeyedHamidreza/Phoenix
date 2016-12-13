#!/bin/bash

# change directory to "source" and make the project
cd ..
cmake ./source
make

GET_XS=0        # to get XS code from Github
INSTALL_XS=0    # to install XS code from Github
GEN_DATASET=1   # generate dataset

# get XS code from Github
if [[ $GET_XS == 1 ]]; then
git clone https://github.com/pratas/XS.git
fi

# install XS code from Github
if [[ $INSTALL_XS == 1 ]]; then
cd ./XS
make
cd ..
fi

# generate dataset using XS
if [[ $GEN_DATASET == 1 ]]; then
cd ./XS
./XS -v -t 1 -i n=MySeq -ls 70 -n 10 -f 0.24,0.21,0.21,0.24,0.08 -eh -eo -es DATASET
mv DATASET ..
cd ..
fi

## list of datasets
##datasets="c"
#datasets="b"
##datasets="a"
##datasets="c b"
##datasets="c b a"
#
#invRepeats="0 1"            # list of inverted repeats
#alphaDens="1 10 100"        # list of alpha denominators
#
## set output format
#PIXFORMAT=png
##PIXFORMAT=svg
#
#rm -f $irName*.$PIXFORMAT   # remove FORMAT pictures, if they exist
#
## set names for inverted repeat, alpha denominator, max context size
#irName=ir
#aName=ad
#maxCtx=21   # real: -=1
#
#for dataset in $datasets
#do
#    for ir in $invRepeats
#    do
#        for alphaDen in $alphaDens
#        do
##        rm -f $irName$ir$aName$alphaDen$dataset.dat
#        touch $irName$ir-$aName$alphaDen-$dataset.dat
#        echo -e "# ir\talpha\tctx\tbpb" >> $irName$ir-$aName$alphaDen-$dataset.dat
#
#            # execute the code with different parameters
#            for((ctx=2; ctx<$maxCtx; ++ctx))
#            do
#            ./phoenix -m t,$ctx,$alphaDen,$ir -t $dataset.fa >> $irName$ir-$aName$alphaDen-$dataset.dat
#            done
#        done
#
## show output in a figure, using gnuplot
#gnuplot <<- EOF
#set xlabel "context"
#set ylabel "bpb"
#set key right bottom    # legend position
#set term $PIXFORMAT     # set terminal for output picture format
#set output "$irName$ir$dataset.$PIXFORMAT"       # set output name
#
## plot 3 figures at once, for constant "ir", but different "alpha"s and "context"s
#plot "$irName$ir-${aName}1-$dataset.dat" using 3:4  with linespoints ls 6 title "ir=$ir, alpha=1/1,     $dataset", \
#     "$irName$ir-${aName}10-$dataset.dat" using 3:4 with linespoints ls 7 title "ir=$ir, alpha=1/10,   $dataset", \
#     "$irName$ir-${aName}100-$dataset.dat" using 3:4 with linespoints ls 8 title "ir=$ir, alpha=1/100, $dataset"
#
## the following line (EOF) MUST be left as it is; i.e. no space, etc
#EOF
#    done
#done
#
#rm -rf dat              # remove "dat" folder, if it exists
#mkdir -p dat            # make "dat" folder
#mv $irName*.dat dat     # move all created dat files to the "dat" folder