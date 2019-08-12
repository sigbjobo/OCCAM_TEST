function_name () { 
    # Folder

    #pcouple
    pcouple=$1

    #kompressibility
    komp=$2

   
    RHO0=$3
    
    
    folder=SIM2_${komp}_${RHO0}
    mkdir $folder
    cd $folder
    cp ../fort.5 fort.5
 
    #Set compressibility
    cp ../fort.3 fort.3
    sed -i "/* compressibility/{n;s/.*/${komp}/}" fort.3
    sed -i "/* rho0:/{n;s/.*/${RHO0}/}" fort.3

    cp ../fort.1 fort.1
    ../../../occam_pressure/occamcg
     python ../COMP_PRESSURE_PROFILES.py 1
    python ../COMP_PHI.py
    cd ..
    


}


#pcouple=("2" "5" "20" "100" "200")
#komp=("0.1" "0.05" "0.03")
komp=( "0.0051" "0.01" "0.03" "0.05"   )
p=("20")
rho0=( "8.5" )

python solvate_dna.py 10	    
#rm  -r SIM_*
for k in "${komp[@]}";do
    for r in "${rho0[@]}";do
	function_name $p $k $r &
    done
done

wait
echo "DONE"
