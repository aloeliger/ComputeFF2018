./Andrew_Make.sh Set1_correction_mt.cc
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DataA.root files_corr1FF_mt/DataA.root data_obs data_obs 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DataB.root files_corr1FF_mt/DataB.root data_obs data_obs 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DataC.root files_corr1FF_mt/DataC.root data_obs data_obs 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DataD.root files_corr1FF_mt/DataD.root data_obs data_obs 0
hadd -f files_corr1FF_mt/Data.root files_corr1FF_mt/DataA.root files_corr1FF_mt/DataB.root files_corr1FF_mt/DataC.root files_corr1FF_mt/DataD.root
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DY.root files_corr1FF_mt/DYincl.root DY DY 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DY1.root files_corr1FF_mt/DY1.root DY DY 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DY2.root files_corr1FF_mt/DY2.root DY DY 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DY3.root files_corr1FF_mt/DY3.root DY DY 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/DY4.root files_corr1FF_mt/DY4.root DY DY 0
hadd -f files_corr1FF_mt/DY.root files_corr1FF_mt/DYincl.root files_corr1FF_mt/DY1.root files_corr1FF_mt/DY2.root files_corr1FF_mt/DY3.root files_corr1FF_mt/DY4.root
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/Wall.root files_corr1FF_mt/W.root W W 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/Wall.root files_corr1FF_mt/WMC.root W WMC 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/TTToHadronic.root files_corr1FF_mt/TTToHadronic.root TTToHadronic TT 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/TTTo2L2Nu.root files_corr1FF_mt/TTTo2L2Nu.root TTTo2L2Nu TT 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/TTToSemiLeptonic.root files_corr1FF_mt/TTToSemiLeptonic.root TTToSemiLeptonic TT 0
hadd -f files_corr1FF_mt/TT.root files_corr1FF_mt/TTToHadronic.root files_corr1FF_mt/TTTo2L2Nu.root files_corr1FF_mt/TTToSemiLeptonic.root
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/TTToHadronic.root files_corr1FF_mt/TTToHadronicMC.root TTToHadronic TTMC 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/TTTo2L2Nu.root files_corr1FF_mt/TTTo2L2NuMC.root TTTo2L2Nu TTMC 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/TTToSemiLeptonic.root files_corr1FF_mt/TTToSemiLeptonicMC.root TTToSemiLeptonic TTMC 0
hadd -f files_corr1FF_mt/TTMC.root files_corr1FF_mt/TTToHadronicMC.root files_corr1FF_mt/TTTo2L2NuMC.root files_corr1FF_mt/TTToSemiLeptonicMC.root
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/WW.root files_corr1FF_mt/WW.root WW VV 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/WZ.root files_corr1FF_mt/WZ.root WZ VV 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/ZZ.root files_corr1FF_mt/ZZ.root ZZ VV 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/ST_t_antitop.root files_corr1FF_mt/ST_t_antitop.root ST_t_antitop ST 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/ST_t_top.root files_corr1FF_mt/ST_t_top.root ST_t_top ST 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/ST_tW_antitop.root files_corr1FF_mt/ST_tW_antitop.root ST_tW_antitop ST 0
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/ST_tW_top.root files_corr1FF_mt/ST_tW_top.root ST_tW_top ST 0
hadd -f files_corr1FF_mt/VV.root files_corr1FF_mt/WW.root files_corr1FF_mt/WZ.root files_corr1FF_mt/ZZ.root files_corr1FF_mt/ST_t_antitop.root files_corr1FF_mt/ST_t_top.root files_corr1FF_mt/ST_tW_antitop.root files_corr1FF_mt/ST_tW_top.root

python Subtract_prompt_mt.py --directory files_corr1FF_mt
root -l -b -q Fit_FFclosure_mt.cc

# Prepare mT histograms, fit the ratio later with the OS/SS correction
./Set1_correction_mt.exe /data/ccaillol/smhmt2018_svfitted_4aug/Wall.root files_corr1FF_mt/WMC2.root W WMC2 0

hadd -f mvisclosure_mt.root files_corr1FF_mt/Data.root files_corr1FF_mt/DY.root files_corr1FF_mt/W.root files_corr1FF_mt/TT.root files_corr1FF_mt/VV.root 
