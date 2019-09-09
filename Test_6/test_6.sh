ana_sim()
{
  fort7=$1
  filename=$2
  
  timestep=$(grep -A1 'time_step:' fort.1|grep -v "time_step:")
  frames=$(grep -A1 'out_print:'  fort.1|grep -v "out_print:")
  timestep=`python -c "print(float($timestep)/1.0E6)"`

  grep -a " dens" ${fort7} |grep -v 'density' | awk -v c="$timestep" '{print $1*c, $2}' > $filename

}

rm -rf sim_water
mkdir sim_water
cd sim_water

echo 'Parallel simulation'
cp -r ../input_water/* .
bash ${SHELL_PATH}/run_para.sh  
mv fort.7 fort.7_parallel
ana_sim fort.7_parallel TOTAL_DENS_PARA.dat

echo 'Serial simulation'
mv fort.1_serial fort.1
../occamcg
mv fort.7 fort.7_serial
ana_sim fort.7_serial TOTAL_DENS_SERIAL.dat
cd ../

# Copy back results
rm -f ../test_results/test_6/*
cp sim_water/TOTAL_DENS*.dat ../test_results/test_6

