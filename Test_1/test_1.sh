
# Remove old files
rm -rf sim
mkdir sim
cd sim

# Copy inputfiles to sim directory
cp ../input/* .

# Compute forces for different cell sizes
#for mi in `seq 20 5 40`
mi=30
do
    rm -rf force${mi}.dat

    python ../change_fort3.py fort.3 $mi
    for di in `seq 0. 0.5 5`
    do
	#di=5
	python ../change_fort5.py fort.5 $di $mi
	bash ${SHELL_PATH}/run_para.sh  
	
	forces=$(cat fort.7 | grep 'force_i 000000001  NA' | awk '{print $7, $8, $9 }')
	echo "$di $forces" >> force${mi}.dat
	
    done
    #Predicted result from coulomb
    python ../COMP_EXACT.py force${mi}.dat 20
#done

# Remove old results and copy back results to final folder
rm -f ../test_results/test_1/
mv force*.dat ../test_results/test_1/
cd ..
