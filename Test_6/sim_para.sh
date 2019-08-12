function_name () { 
    # Folder

    #pcouple
    pcouple=$1

    #kompressibility
    komp=$2

   
    RHO0=$3
    
    folder=SIM_${komp}_${pcouple}
    mkdir $folder
    cd $folder
    cp ../fort.5 fort.5
    
    a=$(python -c "print((69.24 + 345.39*float('$komp') + 15.56*float('$komp')**0.61)**0.5)")
    echo $komp $a
    #Set compressibility
    cp ../fort.3 fort.3
    cp ../fort.1 fort.1
    sed -i "/* compressibility/{n;s/.*/${komp}/}" fort.3
    sed -i "/* rho0:/{n;s/.*/${RHO0}/}" fort.3
    sed -i "/eq_state_dens:/{n;s/.*/${a}/}" fort.1
    sed -i "/pressure_coupling:/{n;s/.*/${pcouple}/}" fort.1

    ../../../occam_pressure/occamcg
    python ../COMP_PRESSURE_PROFILES.py 1
    
    cd ..
    


}


#pcouple=("2" "5" "20" "100" "200")
#komp=("0.1" "0.05" "0.03")
komp=( "0.03" "0.05" "0.10")
p=("20" "2" )
r=( "8.333" )

python solvate_dna.py 9.688 9.163	    
rm  -r SIM_*
for k in "${komp[@]}";do
    for pi in "${p[@]}";do
	function_name $pi $k $r &
    done
done

wait
echo "DONE"
