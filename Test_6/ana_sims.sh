


rm phi_fluc.dat
for folder in $(ls -r | grep 'SIM_*')
do
    echo $folder
    cd $folder
    python ../COMP_STATS.py
    a=$(python ../COMP_PHI.py)
    echo $folder $a >>../phi_fluc.dat
    cd ..
    
done 