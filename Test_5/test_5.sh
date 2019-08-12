
# SIMULATION OF DNA WITH ALL TYPES OF BONDED FORCES IN THE NVE-ENSEMBLE
# 10000 steps at 0.03 ps

#Prepare simulation
rm -f *.xvg
rm -rf sim
mkdir sim
cp -r input/* sim/
cd sim/

#Run simulation
bash ${SHELL_PATH}/run_para2.sh

#Analyze simulation
timestep=$(grep -A1 'time_step:' fort.1|grep -v "time_step:")
frames=$(grep -A1 'out_print:' fort.1|grep -v "out_print:")

filename="TOTAL_BONDED_ENERGY.xvg"

timestep=`python -c "print(float($timestep)*float($frames)/1.0E6)"`
grep -a "etot non-shifted" fort.7 | awk -v c="$timestep" '{print $1*c, $2}' > $filename

cp $filename ../../test_results/test_5/

cd ..
