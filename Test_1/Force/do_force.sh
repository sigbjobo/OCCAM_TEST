
cp fort_old.5 fort.5
cp fort_old.1 fort.1
#mi=22
for mi in `seq 20 2 78`
do

    echo $mi
    rm force${mi}.dat

    python change_fort3.py fort.3 $mi
    for di in `seq 0. 0.05 5`
    do
	python change_fort5.py fort.5 $di $mi
	echo $di  >> force${mi}.dat 
	./occamcg   >> force${mi}.dat
    done
done
