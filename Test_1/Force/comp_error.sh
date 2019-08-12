#distance

cp fort_old.3 fort.3
cp fort_old.5 fort.5
rm force*.dat
for k in `seq 1 1 5`
do
    j=`echo "10*2 ^ $k" | bc`

#j=31    
echo $j
python change_fort3.py fort.3 $j

for di in `seq 1 0.1 5`
do
    python change_fort5.py fort.5 $di $j
    echo $di  >> force${j}.dat 
    ./occamcg_pol   >> force${j}.dat
done
#    python error.py out${j}.dat >> error$j.dat
done

