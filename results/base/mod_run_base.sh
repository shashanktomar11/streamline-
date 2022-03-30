#!/usr/bin/zsh
now=$(date +"%T")
echo "Current time : $now"
echo ""> receiver_out.log
echo "">sender_out.log
echo "numbits bps ber ber10 ber01 ber1bit bermultibit" > bitrate_results.txt;
echo "numbits bps ber | ber10 ber01 | ber1bit bermultibit"

## Run the experiment for payload size in bits of 200,000 to 1 billion. 
for i in 100 1000 200000000 500000000 1000000000 ; do
# for i in 200000 500000 1000000 2000000 5000000  10000000 20000000 50000000 100000000 200000000 500000000 1000000000 ; do
# for i in 1000000 2000000 3000000 4000000 5000000 6000000 7000000 8000000 9000000; do

    ## Run the experiment 5 times.
    out_a=`sudo ../../bin/receiver.o -n $i & sudo ../../bin/sender.o -n $i >>sender_out.log 2>&1 ;`;
    echo "----------" >> sender_out.log ; 
    a=`echo "$out_a" | grep "Bit Period" | tail -n1 | awk '{print $8,$10,$12,$13}' | sed 's/FinalCorrectSamples=//' | sed 's/\%//g' | sed 's/Tx1_to_0_errors=//' | sed 's/Tx0_to_1_errors=//' | sed 's/,//'`
    a1=`echo "$out_a" | grep "Bit-Error" | awk '{print $12,$13}' | sed 's/\%//g'`
    bps_a=`echo $a | awk '{print $1}'`; bcr_a=`echo $a | awk '{print $2}'`; ber10_a=`echo $a | awk '{print $3}'`; ber01_a=`echo $a | awk '{print $4}'`;  ber1bit_a=`echo $a1 | awk '{print $1}'`; bermultibit_a=`echo $a1 | awk '{print $2}'`; 
    bps_a=$[bps_a];
    ber_a=$[100-bcr_a];
    ber10_a=$[ber10_a]; ber01_a=$[ber01_a];
    ber1bit_a=$[ber1bit_a]; bermultibit_a=$[bermultibit_a];
    printf "%d  %d  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%\n" $i $bps_a $ber_a $ber10_a $ber01_a $ber1bit_a $bermultibit_a >> bitrate_results.txt;
    printf "%d  %d  %0.2f%% | %0.2f%%  %0.2f%% | %0.2f%%  %0.2f%%\n" $i $bps_a $ber_a $ber10_a $ber01_a $ber1bit_a $bermultibit_a 
    echo "$out_a" >> receiver_out.log
    echo "----------------------------------------------" >> receiver_out.log

    
    out_b=`sudo ../../bin/receiver.o -n $i & sudo ../../bin/sender.o -n $i >>sender_out.log 2>&1 ;`;
    echo "----------" >> sender_out.log ; 
    b=`echo "$out_b" | grep "Bit Period" | tail -n1 | awk '{print $8,$10,$12,$13}' | sed 's/FinalCorrectSamples=//' | sed 's/\%//g' | sed 's/Tx1_to_0_errors=//' | sed 's/Tx0_to_1_errors=//' | sed 's/,//'`
    b1=`echo "$out_b" | grep "Bit-Error" | awk '{print $12,$13}' | sed 's/\%//g'`
    bps_b=`echo $b | awk '{print $1}'`; bcr_b=`echo $b | awk '{print $2}'`; ber10_b=`echo $b | awk '{print $3}'`; ber01_b=`echo $b | awk '{print $4}'`;  ber1bit_b=`echo $b1 | awk '{print $1}'`; bermultibit_b=`echo $b1 | awk '{print $2}'`; 
    bps_b=$[bps_b];
    ber_b=$[100-bcr_b];
    ber10_b=$[ber10_b]; ber01_b=$[ber01_b];
    ber1bit_b=$[ber1bit_b]; bermultibit_b=$[bermultibit_b];
    printf "%d  %d  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%\n" $i $bps_b $ber_b $ber10_b $ber01_b $ber1bit_b $bermultibit_b >> bitrate_results.txt;
    printf "%d  %d  %0.2f%% | %0.2f%%  %0.2f%% | %0.2f%%  %0.2f%%\n" $i $bps_b $ber_b $ber10_b $ber01_b $ber1bit_b $bermultibit_b 
    echo "$out_b" >> receiver_out.log
    echo "----------------------------------------------" >> receiver_out.log
    
    
    out_c=`sudo ../../bin/receiver.o -n $i & sudo ../../bin/sender.o -n $i >>sender_out.log 2>&1 ;`;
    echo "----------" >> sender_out.log ; 
    c=`echo "$out_c" | grep "Bit Period" | tail -n1 | awk '{print $8,$10,$12,$13}' | sed 's/FinalCorrectSamples=//' | sed 's/\%//g' | sed 's/Tx1_to_0_errors=//' | sed 's/Tx0_to_1_errors=//' | sed 's/,//'`
    c1=`echo "$out_c" | grep "Bit-Error" | awk '{print $12,$13}' | sed 's/\%//g'`
    bps_c=`echo $c | awk '{print $1}'`; bcr_c=`echo $c | awk '{print $2}'`; ber10_c=`echo $c | awk '{print $3}'`; ber01_c=`echo $c | awk '{print $4}'`;  ber1bit_c=`echo $c1 | awk '{print $1}'`; bermultibit_c=`echo $c1 | awk '{print $2}'`; 
    bps_c=$[bps_c];        
    ber_c=$[100-bcr_c];
    ber10_c=$[ber10_c]; ber01_c=$[ber01_c];
    ber1bit_c=$[ber1bit_c]; bermultibit_c=$[bermultibit_c];
    printf "%d  %d  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%\n" $i $bps_c $ber_c $ber10_c $ber01_c $ber1bit_c $bermultibit_c >> bitrate_results.txt;
    printf "%d  %d  %0.2f%% | %0.2f%%  %0.2f%% | %0.2f%%  %0.2f%%\n" $i $bps_c $ber_c $ber10_c $ber01_c $ber1bit_c $bermultibit_c 
    echo "$out_c" >> receiver_out.log
    echo "----------------------------------------------" >> receiver_out.log    


    out_d=`sudo ../../bin/receiver.o -n $i & sudo ../../bin/sender.o -n $i >>sender_out.log 2>&1 ;`;
    echo "----------" >> sender_out.log ; 
    d=`echo "$out_d" | grep "Bit Period" | tail -n1 | awk '{print $8,$10,$12,$13}' | sed 's/FinalCorrectSamples=//' | sed 's/\%//g' | sed 's/Tx1_to_0_errors=//' | sed 's/Tx0_to_1_errors=//' | sed 's/,//'`
    d1=`echo "$out_d" | grep "Bit-Error" | awk '{print $12,$13}' | sed 's/\%//g'`
    bps_d=`echo $d | awk '{print $1}'`; bcr_d=`echo $d | awk '{print $2}'`; ber10_d=`echo $d | awk '{print $3}'`; ber01_d=`echo $d | awk '{print $4}'`;  ber1bit_d=`echo $d1 | awk '{print $1}'`; bermultibit_d=`echo $d1 | awk '{print $2}'`; 
    bps_d=$[bps_d];
    ber_d=$[100-bcr_d];    
    ber10_d=$[ber10_d]; ber01_d=$[ber01_d];
    ber1bit_d=$[ber1bit_d]; bermultibit_d=$[bermultibit_d];
    printf "%d  %d  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%\n" $i $bps_d $ber_d $ber10_d $ber01_d $ber1bit_d $bermultibit_d >> bitrate_results.txt;
    printf "%d  %d  %0.2f%% | %0.2f%%  %0.2f%% | %0.2f%%  %0.2f%%\n" $i $bps_d $ber_d $ber10_d $ber01_d $ber1bit_d $bermultibit_d 
    echo "$out_d" >> receiver_out.log
    echo "----------------------------------------------" >> receiver_out.log
    
    
    out_e=`sudo ../../bin/receiver.o -n $i & sudo ../../bin/sender.o -n $i >>sender_out.log 2>&1 ;`;
    ## Get the string corresponding to the bit-period achieved in each run
    e=`echo "$out_e" | grep "Bit Period" | tail -n1 | awk '{print $8,$10,$12,$13}' | sed 's/FinalCorrectSamples=//' | sed 's/\%//g' | sed 's/Tx1_to_0_errors=//' | sed 's/Tx0_to_1_errors=//' | sed 's/,//'`
    ## Get the bit-error-rate achieved in each run
    e1=`echo "$out_e" | grep "Bit-Error" | awk '{print $12,$13}' | sed 's/\%//g'`
    ## Get the bit-period achieved in each run
    bps_e=`echo $e | awk '{print $1}'`; bcr_e=`echo $e | awk '{print $2}'`; ber10_e=`echo $e | awk '{print $3}'`; ber01_e=`echo $e | awk '{print $4}'`;  ber1bit_e=`echo $e1 | awk '{print $1}'`; bermultibit_e=`echo $e1 | awk '{print $2}'`; 
    ## Average the different metrics across 5 runs.
    ## bps - bit-rate in bits per second
    # bps=$[(bps_a+bps_b+bps_c+bps_d+bps_e)/5];
    bps_e=$[bps_e];
    ## ber - bit-error-rate (percentage of bits received erroneously)
    # ber=$[100-(bcr_a+bcr_b+bcr_c+bcr_d+bcr_e)/5];
    ber_e=$[100-bcr_e];
    ## ber10 - percentage of bits where sent 1 but received 0;  ber01 - percentage of bits where sent 0  but received 1.
    # ber10=$[(ber10_a+ber10_b+ber10_c+ber10_d+ber10_e)/5]; ber01=$[(ber01_a+ber01_b+ber01_c+ber01_d+ber01_e)/5];
    ber10_e=$[ber10_e]; ber01_e=$[ber01_e];
    ## ber1bit - percentage of 8-byte packets with 1-bit error; bermultibit - percentage of 8-byte packets with multibit errors.
    # ber1bit=$[(ber1bit_a+ber1bit_b+ber1bit_c+ber1bit_d+ber1bit_e)/5]; bermultibit=$[(bermultibit_a+bermultibit_b+bermultibit_c+bermultibit_d+bermultibit_e)/5];
    ber1bit_e=$[ber1bit_e]; bermultibit_e=$[bermultibit_e];
    ## Print the bitrate and error-rate results
    printf "%d  %d  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%  %0.2f%%\n" $i $bps_e $ber_e $ber10_e $ber01_e $ber1bit_e $bermultibit_e >> bitrate_results.txt;
    printf "%d  %d  %0.2f%% | %0.2f%%  %0.2f%% | %0.2f%%  %0.2f%%\n" $i $bps_e $ber_e $ber10_e $ber01_e $ber1bit_e $bermultibit_e 
    echo "$out_e" >> receiver_out.log
    echo "----------------------------------------------" >> receiver_out.log
    echo "----------------------------------------------" >> receiver_out.log
done
now=$(date +"%T")
echo "Current time : $now"