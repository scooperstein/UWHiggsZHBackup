#!/usr/bin/env python
import os
from optparse import OptionParser, OptionGroup

## set up the option parser
parser = OptionParser(usage="usage: %prog [options] ARGS",
                      description="Script to create datacards to be used locally or to be uploaded to the cvs. The output directory to copy the datacards to is expected to have a dedicated structure. Directories that do not exist are created on the fly. The default configuration is to upload all currently available datacards to the common cvs repository for the HiggsToTauTau analysis subgroup. ARGS corresponds to a list of integer values resembling the mass points for which you want to create the datacards. Ranges can be indicated e.g. by: 110-145'. That only any x-th mass point should be taken into account can be indicated e.g. by: 110-145:5. The latter example will pick up the masses 110 115 120 130 135 140 145. Any combination of this syntax is possible.")
parser.add_option("-i", "--in", dest="input", default="%s/src/HiggsAnalysis/HiggsToTauTau/setup" % os.environ["CMSSW_BASE"], type="string", help="Full path to the input directory from which you would like to create the datacards. The path should be given relative to $CMSSW_BASE. Note that you need to obey the directory structures provide the corresponding configurationfiels for the translatino of the uncertainties into the datacards if you plan to use your own input path. [Default: src/HiggsAnalysis/HiggsToTauTau/setup]")
parser.add_option("-o", "--out", dest="out", default="auxiliaries/datacards", type="string", help="Name of the output directory to which the datacards should be copied. [Default: auxiliaries/datacards]")
parser.add_option("-p", "--periods", dest="periods", default="7TeV 8TeV", type="string", help="Choose between run periods [Default: \"7TeV 8TeV\"]")
parser.add_option("-a", "--analysis", dest="analysis", default="sm", type="choice", help="Type of analysis (sm or mssm). Lower case is required. [Default: sm]", choices=["sm", "mssm"])
parser.add_option("-c", "--channels", dest="channels", default="mm em mt et", type="string", help="List of channels, for which datacards should be created. The list should be embraced by call-ons and separeted by whitespace or comma. Available channels are mm, em, mt, et, tt, vhtt. [Default: \"mm em mt et\"]")
parser.add_option("--SM4", dest="SM4", default=False, action="store_true", help="Re-scale signal samples in input file according to SM4 cross section*BR before datacard creation. [Default: False]")
cats1 = OptionGroup(parser, "SM EVENT CATEGORIES", "Event categories to be picked up for the SM analysis.")
cats1.add_option("--sm-categories-mm", dest="mm_sm_categories", default="0 1 2 3 5", type="string", help="List mm of event categories. [Default: \"0 1 2 3 5\"]")
cats1.add_option("--sm-categories-em", dest="em_sm_categories", default="0 1 2 3 5", type="string", help="List em of event categories. [Default: \"0 1 2 3 5\"]")
cats1.add_option("--sm-categories-mt", dest="mt_sm_categories", default="0 1 2 3 5", type="string", help="List mt of event categories. [Default: \"0 1 2 3 5\"]")
cats1.add_option("--sm-categories-et", dest="et_sm_categories", default="0 1 2 3 5", type="string", help="List et of event categories. [Default: \"0 1 2 3 5\"]")
cats1.add_option("--sm-categories-tt", dest="tt_sm_categories", default="0 1", type="string", help="List of tt event categories. [Default: \"0 1\"]")
cats1.add_option("--sm-categories-vhtt", dest="vhtt_sm_categories", default="0 1", type="string", help="List of vhtt event categories. [Default: \"0 1\"]")
cats1.add_option("--sm-categories-vhbb", dest="vhbb_sm_categories", default="0 1 2 3 4 5 6 7", type="string", help="List of vhbb event categories. [Default: \"0 1 2 3 4 5 6 7\"]")
parser.add_option_group(cats1)
cats2 = OptionGroup(parser, "MSSM EVENT CATEGORIES", "Event categories to be used for the MSSM analysis.")
cats2.add_option("--mssm-categories-mm", dest="mm_mssm_categories", default="0 1 2 3 6 7", type="string", help="List mm of event categories. [Default: \"0 1 2 3 6 7\"]")
cats2.add_option("--mssm-categories-em", dest="em_mssm_categories", default="0 1 2 3 6 7", type="string", help="List em of event categories. [Default: \"0 1 2 3 6 7\"]")
cats2.add_option("--mssm-categories-mt", dest="mt_mssm_categories", default="0 1 2 3 6 7", type="string", help="List mt of event categories. [Default: \"0 1 2 3 6 7\"]")
cats2.add_option("--mssm-categories-et", dest="et_mssm_categories", default="0 1 2 3 6 7", type="string", help="List et of event categories. [Default: \"0 1 2 3 6 7\"]")
cats2.add_option("--mssm-categories-tt", dest="tt_mssm_categories", default="0 1", type="string", help="List of tt event categories. [Default: \"0 1\"]")
cats2.add_option("--mssm-categories-hmm", dest="hmm_mssm_categories", default="0 1", type="string", help="List of hmm event categories. [Default: \"0 1\"]")
parser.add_option_group(cats2)

## check number of arguments; in case print usage
(options, args) = parser.parse_args()

if len(args) < 1 :
    parser.print_usage()
    exit(1)

from HiggsAnalysis.HiggsToTauTau.utils import parseArgs
from HiggsAnalysis.HiggsToTauTau.utils import mass_category

## periods
periods = options.periods.split()
for idx in range(len(periods)) : periods[idx] = periods[idx].rstrip(',')
## channels
channels = options.channels.split()
for idx in range(len(channels)) : channels[idx] = channels[idx].rstrip(',')

## setup output directory structure in case it does not exist, yet
if not os.path.exists(options.out) :
    os.system("mkdir {OUTPUT}/".format(OUTPUT=options.out))
if not os.path.exists("{OUTPUT}/{ANA}".format(OUTPUT=options.out, ANA=options.analysis)) :
    os.system("mkdir {OUTPUT}/{ANA}".format(OUTPUT=options.out, ANA=options.analysis))
for channel in channels :
    prefix = "" if (channel == "vhtt" or channel == "vhbb") else "htt_"
    if not os.path.exists("{OUTPUT}/{ANA}/{PRE}{CHN}".format(OUTPUT=options.out, ANA=options.analysis, PRE=prefix, CHN=channel)) :
        os.system("mkdir {OUTPUT}/{ANA}/{PRE}{CHN}".format(OUTPUT=options.out, ANA=options.analysis, PRE=prefix, CHN=channel))
os.chdir(options.out)

## valid mass range per category
if options.analysis == "sm" :
    valid_masses = {
        "mm"   : (110, 145),
        "em"   : (110, 145),
        "mt"   : (110, 145),
        "et"   : (110, 145),
        "tt"   : (110, 145),
        "vhtt" : (110, 140),
    }
if options.analysis == "mssm" :
    valid_masses = {
        "mm"   : (100, 500),
        "em"   : (100, 500),
        "mt"   : (100, 500),
        "et"   : (100, 500),
        "tt"   : (100, 500),
    }
    
print "------------------------------------------------------"
print " Valid mass ranges per channel:"
print "------------------------------------------------------"
for chn in channels :
    print "chn: ", chn, "valid mass range:", valid_masses[chn]
print

## valid run periods
if options.analysis == "sm" :
    valid_periods = {
        "mm"   : "7TeV 8TeV",
        "em"   : "7TeV 8TeV",
        "mt"   : "7TeV 8TeV",
        "et"   : "7TeV 8TeV",
        "tt"   : "8TeV",
        "vhtt" : "7TeV 8TeV",
        }
if options.analysis == "mssm" :
    valid_periods = {
        "mm"   : "7TeV 8TeV",
        "em"   : "7TeV 8TeV",
        "mt"   : "7TeV 8TeV",
        "et"   : "7TeV 8TeV",
        "tt"   : "8TeV",
        }

print "------------------------------------------------------"
print " Valid mass run periods per channel:"
print "------------------------------------------------------"
for chn in channels :
    print "chn: ", chn, "valid run periods:", valid_periods[chn]
print

## switch to sm event categories
if options.analysis == "sm" :
    os.chdir("sm")
    categories = {
        "mm"   : options.mm_sm_categories.split(),
        "em"   : options.em_sm_categories.split(),
        "mt"   : options.mt_sm_categories.split(),
        "et"   : options.et_sm_categories.split(),
        "tt"   : options.tt_sm_categories.split(),
        "vhtt" : options.vhtt_sm_categories.split(),
        "vhbb" : options.vhbb_sm_categories.split(),
        }

## switch to mssm event categories
if options.analysis == "mssm" :
    os.chdir("mssm")
    categories = {
        "mm"   : options.mm_mssm_categories.split(),
        "em"   : options.em_mssm_categories.split(),
        "mt"   : options.mt_mssm_categories.split(),
        "et"   : options.et_mssm_categories.split(),
        #"tt"   : options.tt_mssm_categories.split(),
        #"hmm"  : options.hmm_mssm_categories.split(),
        }

## start the process here
base = os.getcwd()
for channel in channels :
    for period in periods :
        for cat in categories[channel] :
            ## here the normal workflow continues
            prefix = "" if (channel == "vhtt" or channel == "vhbb") else "htt_"
            os.chdir("{PWD}/{CHN}".format(CHN=prefix+channel, PWD=base))
            ## check validity of run period
            if not period in valid_periods[channel] :
                #print "drop due to failing period: ", channel, valid_periods[channel], period 
                continue
            os.system("datacard-project.py -i {PATH} -c {CHN} -e {ANA}-{PER}-0{CAT} {PER}-0{CAT}".format(PATH=os.path.abspath(options.input), CHN=channel, ANA=options.analysis, PER=period, CAT=cat))
            os.chdir("{PWD}/{CHN}/{PER}-0{CAT}".format(CHN=prefix+channel, PER=period, PWD=base, CAT=cat))
            for mass in parseArgs(args) :
                ## check validity of mass
                if (float(mass)< valid_masses[channel][0] or float(mass)> valid_masses[channel][1]) :
                    #print "drop due to failing mass:" , channel, valid_masses[channel][0], valid_masses[channel][1], ":", mass 
                    continue
                print "creating datacard for:", options.analysis, period, channel, cat, mass
                if options.analysis == "mssm" :
                    os.system("create-datacard.py -i {CHN}.inputs-{ana}-{PER}-{MASSCAT}.root -o {CHN}_{CAT}_{PER}-{MASS}.txt {MASS}".format(
                        CHN=prefix+channel, ana=options.analysis, PER=period, MASSCAT=mass_category(mass), CAT=cat, MASS=mass))
                if options.analysis == "sm" :
                    if options.SM4 :
                        print "rescaling signal cross sections accoring to SM4 cross sections"
                        os.system(r"root -q -l -b {CMSSW_BASE}/src/HiggsAnalysis/HiggsToTauTau/macros/rescale2SM4.C+\(true,\"{CHN}.inputs-{per}.root\"\)".format(
                            CMSSW_BASE=os.environ['CMSSW_BASE'], CHN=channel, per=period.lowe()))
                    os.system("create-datacard.py -i {CHN}.inputs-{ANA}-{per}.root -o {CHN}_{CAT}_{PER}-{MASS}.txt {MASS}".format(
                        CHN=prefix+channel, ANA=options.analysis, per=period, CAT=cat, PER=period, MASS=mass))
            os.system("mv *.* ../")
            os.chdir("{PWD}/{CHN}".format(CHN=prefix+channel, PWD=base))
            os.system("rm -r {PER}-0{CAT}".format(PER=period, CAT=cat))
            os.system("rm -r cgs.* unc.*")
