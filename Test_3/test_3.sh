

rm -rf sim sim_2
mkdir sim sim_2
cd sim

cp -r ../input/* .
bash ${SHELL_PATH}/run_para.sh  
cat fort.7 | grep 'force_i 000000001  W' | awk '{print $4, $5, $6, $7, $8, $9 }' > forces.dat
python ../comp_exact.py 15 15 15
cp  {forces.dat,forces_exact.dat} ../../test_results/test_3


cd ../sim_2
cp -r ../input_2/* .
bash ${SHELL_PATH}/run_para.sh  
cat fort.7 | grep 'force_i 000000001  W' | awk '{print $4, $5, $6, $7, $8, $9 }' > forces_W.dat
cat fort.7 | grep 'force_i 000000001 '| grep  'C\|D' | awk '{print $4, $5, $6, $7, $8, $9 }' > forces_MEM.dat
cp  {forces_W.dat,forces_MEM.dat} ../../test_results/test_3


cd ..
