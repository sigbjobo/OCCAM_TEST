
# SIMULATION OF DNA WITH ALL TYPES OF BONDED FORCES IN THE NVE-ENSEMBLE
# 10000 steps at 0.03 ps

#Prepare simulation
rm -rf sim
mkdir sim
cp -r input/* sim/
cd sim/

#Run simulation
bash ${SHELL_PATH}/run_para.sh
python ../COMP_PRESSURE_PROFILES.py 16 16 36
cd ..
