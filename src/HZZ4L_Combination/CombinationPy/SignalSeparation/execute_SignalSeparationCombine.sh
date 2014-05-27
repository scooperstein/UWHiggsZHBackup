#! /bin/bash

### Inputs:
# 1: directory with cards
# 2: card (signal model1 + signal model2)
# 3: what to do (default is run hypothesis test)


if [ $# -lt 2 ]
    then
    echo "Need at least two arguments: "
    echo "    1) directory with cards"
    echo "    2) card (signal model1)"
    echo "    3) action (not mandatory, default=0)"
    exit 1
fi


cardDir=$1
card1=$2


cp runSignalSeparation.py tdrstyle.cc $cardDir/

cd $cardDir
outDir="output_combine/"

if [ -d $outDir ]
    then
    echo "Output directory ${cardDir}/${outDir}/ already exisiting. I will not overwrite. Please remove it and try again."
    exit 2
fi

mkdir $outDir




action=1
if [ $# -ge 3 ]
    then
    action=$3
fi


# Run hypothesis testing, using nominal value of nuisances and mu for generation
NTOYS=4000 # toys per  job
MH=125  # mass of the signal hypothesis

if [ $action -eq 1 ]
    then 
### FIXED MU: 
    text2workspace.py -m $MH $card1 -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs -o fixedMu.root
    combine -m $MH -M HybridNew --testStat=TEV --generateExt=1 --generateNuis=0 fixedMu.root --singlePoint 1 --saveHybridResult --fork 40 -T $NTOYS -i 1 --clsAcc 0 --fullBToys
#make the tree of the test statistics distribution (the macro is under HiggsAnalysis/CombinedLimit/test/plotting)
    root -q -b higgsCombineTest.HybridNew.mH${MH}.root "${CMSSW_BASE}/src/HiggsAnalysis/CombinedLimit/test/plotting/hypoTestResultTree.cxx(\"qmu.FixedMu.root\",${MH},1,\"x\")"
    cp qmu.FixedMu.root qmu.root
elif [ $action -eq 2 ]
    then
### Run 1D scan:
### FLOAT MU:
    text2workspace.py -m $MH $card1 -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating -o floatMu.root
    combine -m $MH -M HybridNew --testStat=TEV --generateExt=1 --generateNuis=0 floatMu.root --singlePoint 1 --saveHybridResult --fork 40 -T $NTOYS -i 1 --clsAcc 0 --fullBToys -n "Test1D"
    root -q -b higgsCombineTest1D.HybridNew.mH${MH}.root "${CMSSW_BASE}/src/HiggsAnalysis/CombinedLimit/test/plotting/hypoTestResultTree.cxx(\"qmu.FloatMu.root\",${MH},1,\"x\")"
    combine -M MultiDimFit floatMu.root --algo=grid --points 100  -m $MH -v 2 -n 1D
    cp qmu.FloatMu.root qmu.root
#draw the output
###      limit->Draw("2*deltaNLL:x", "deltaNLL > 0","PL")
elif [ $action -eq 3 ]
    then
#Run 2D scan (without profiling nuisances)
### FOR 2D: 
    text2workspace.py -m $MH $card1 -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs --PO=muAsPOI -o scan2D.root
    combine -M MultiDimFit scan2D.root --algo=grid --points 10000 --fastScan  -m $MH -v 2 -n "Test2D"
### plot with contours.cxx
### for the 1D scan of r:
### combine -M MultiDimFit  scan2D.root --algo=grid --points 100 -m $MH -v 2 -n 1Dr -P r --floatOtherPOI=1
else
    echo "Requested to perform and unrecognized action: "${action}
    echo "action can be 1:hypothesis test (fixed mu)  ;   2:1D scan, mu floated as nuisance   ;   3:2D scan, mu floated as POI"
    echo "Exiting."
    exit 3
fi

