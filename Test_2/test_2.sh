
 
rm -rf sim sim2
mkdir sim sim2
cd sim

# COMPARE FORCE OUTPUT OF ANALYTIC
cp -r ../input/* .
bash ${SHELL_PATH}/run_para.sh  
cat fort.7 | grep 'force_i 000000001  W' | awk '{print $4, $5, $6, $7, $8, $9 }' > forces.dat
python ../comp_exact.py 15 15 15

cp  {forces.dat,forces_exact.dat} ../../test_results/test_2
cd ..


#COMPARE FORCE OUPUT OF TWO PARALLEL CODES
cd sim2
cp -r ../input_2/* .
bash ${SHELL_PATH}/run_para.sh  
cat fort.7 | grep 'force_i 000000100  ' | awk '{print $4, $5, $6, $7, $8, $9 }' > forces_new.dat
rm fort.7
rm occamcgmpi
bash ${SHELL_PATH}/run_para_old.sh  
cat fort.7 | grep 'force_i 000000100  ' | awk '{print $4, $5, $6, $7, $8, $9 }' > forces_old.dat
rm fort.7
python3 difference.py
cd ..
