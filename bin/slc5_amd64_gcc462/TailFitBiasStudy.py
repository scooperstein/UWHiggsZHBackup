#!/usr/bin/env python
from optparse import OptionParser, OptionGroup

## set up the option parser
parser = OptionParser(usage="usage: %prog [options]",
                      description="Script to study potential bias in choice of tail fit function by running toys")
## General options
parser.add_option("-i"  ,"--input",      dest="input",      default="test.root",                            type="string",          help="Input file where to find the signal histograms (or workspaces). [Default: test.root]")
parser.add_option("-b"  ,"--background", dest="background", default="TT QCD EWK",                           type="string",          help="Template to change [TT QCD EWK]")
parser.add_option("-n"  ,"--name",       dest="name",       default="shift",                                type="string",          help="shift")
parser.add_option("-e"  ,"--energy",     dest="energy",     default="8TeV",                                 type="string",          help="Energy [Default: 8 TeV]")
parser.add_option("-c"  ,"--channel",    dest="channel",    default="tt",                                   type="string",          help="channel [Default: tt]")
parser.add_option("-k"  ,"--categories", dest="categories", default="8 9",                                  type="string",          help="Categories [Default: 8 9 ]")
parser.add_option("--rebin",             dest="rebin",      default=False,                                  action="store_true",    help="Rebin histogram to data_obs [Default: False]")
parser.add_option("-s"  ,"--setup",      dest="setup",      default="HiggsAnalysis/HiggsToTauTau/setup",    type="string",          help="Setup Directory : HiggsAnalysis/HiggsToTauTau/setup")
parser.add_option("-v"  ,"--verbose",    dest="verbose",    default=False,                                  action="store_true",    help="increase verbosity. [Default: False]")
parser.add_option("-o"  ,"--varbin",     dest="varbin",     default=False,                                  action="store_true",    help="Use variable binned fits    [Default: False]")
## Options for first (generator) tail fit
parser.add_option("-r"  ,"--range",      dest="first",      default="200",                                  type="int",             help="Beginning of fit range [Default: 200]")
parser.add_option("-l"  ,"--rangelast",  dest="last",       default="1500",                                 type="int",             help="End of fit range [Default: 1500]")
parser.add_option("-f"  ,"--fitmodel",   dest="fitmodel",   default="0",                                    type="int",             help="Fit model 0(exp(m/(a+b*m)) 1(exp(a*m*pow(b)) [Default:0]")
## Options for second (fitting) tail fit
parser.add_option("-g"  ,"--fitmodel1",  dest="fitmodel1",  default="0",                                    type="int",             help="Alternative Fit model 0(exp(m/(a+b*m)) 1(exp(a*m*pow(b)) [Default:0]")
## Toy fit options
parser.add_option("-m"  ,"--mass",       dest="mass",       default="800",                                  type="string",          help="Signal mass used in bias study [Default: 800]")
parser.add_option("--sigscale",          dest="sigscale",   default="0.1",                                  type="float",           help="Signal scale as fraction of background used in bias study [Default: 0.1]")
parser.add_option("--ntoys",             dest="ntoys",      default="1000",                                 type="int",             help="Number of toys to use in bias study [Default: 1000]")

# check number of arguments; in case print usage
(options, args) = parser.parse_args()
#if len(args) < 1 :
#    parser.print_usage()
#    exit(1)

import os
import re

print " You are running with configuration: "
print "-------------------------------------"
print " input      : ", options.input
print " Template   : ", options.background
print " energy     : ", options.energy
print " channel    : ", options.channel
print " categories : ", options.categories

from HiggsAnalysis.HiggsToTauTau.utils import parseArgs 

## mapping out signals
channelName = {
    "mm" : "mumu",
    "em" : "emu",
    "et" : "eleTau",
    "mt" : "muTau",
    "tt" : "tauTau"
    }

print " channel : ",  channelName[options.channel]
## add shift Nuisance (ignore the VBF Option right now)
os.system(r"cp {CMSSW_BASE}/src/HiggsAnalysis/HiggsToTauTau/macros/rootlogon.C .".format(CMSSW_BASE=os.environ.get("CMSSW_BASE")))

os.system("cp %s %s.bak"      %  (options.setup+'/'+options.channel+'/'+options.input,options.setup+'/'+options.channel+'/'+options.input))
for cat in options.categories.split() :
    for bkg in options.background.split() : 
        os.system(r"root -l -b -q rootlogon.C {CMSSW_BASE}/src/HiggsAnalysis/HiggsToTauTau/macros/addFitNuisanceBiasStudy.C+\(\"{FILENAME}\"\,\"{CHANNEL}\"\,\"{BKG}\"\,\"{ENERGY}\"\,\"{NAME}\"\,\"{CATEGORY}\"\,{FIRST}\,{LAST}\,{FITMODEL}\,{FITMODEL1}\,{VARBIN}\,{REBIN}\,\"{MASS}\"\,{SIGSCALE}\,{NTOYS}\)".format(
            CMSSW_BASE=os.environ.get("CMSSW_BASE"), FILENAME=options.setup+'/'+options.channel+'/'+options.input,CHANNEL=channelName[options.channel],BKG=bkg,ENERGY=options.energy,NAME=options.name,CATEGORY=cat,FIRST=options.first,LAST=options.last,FITMODEL=options.fitmodel,FITMODEL1=options.fitmodel1,VARBIN=str(options.varbin).lower(),REBIN=str(options.rebin).lower(),MASS=options.mass,SIGSCALE=options.sigscale,NTOYS=options.ntoys))
