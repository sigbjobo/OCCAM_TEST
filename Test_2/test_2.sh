

rm -rf sim
mkdir sim
cd sim

cp -r ../input/* .
bash ${SHELL_PATH}/run_para.sh  
cat fort.7 | grep 'force_i 000000001  W' | awk '{print $4, $5, $6, $7, $8, $9 }' > forces.dat
python ../comp_exact.py 15 15 15
cp  {forces.dat,forces_exact.dat} ../../test_results/test_2
cd ..
