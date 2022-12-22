###############################################################################
#
# assess.sh
#
# Note: run this script with the command below:
# 	assess.sh [-s somevalue] [-d somevalue] [-r] [-p] [-m somevalue] [-t somevalue] 
# 		-s 	c src dir to input into ikos and sse,
# 		-d 	dst dir for output db of sse and ikos,
# 		-r 	should rerun ikos? 
# 		-p 	should pull from sse?
#  		-m  metadata dir of NIST,
# 		-t 	report dir for assess-in-batch output.
#		
###############################################################################


#########################
# handle script options #
#########################
while getopts rps:d:t:m: flag
do
		case "${flag}" in
			s) srcdir=${OPTARG};;
			d) dstdir=${OPTARG};;
			r) rerun=true;;
			p) pullsse=true;;
			t) reportdir=${OPTARG};;
			m) metadatadir=${OPTARG};;
			?) echo "script usage: $(basename $0) [-s srcpath] [-d dstpath] [-r]"
		esac
done

if [ ! -d $dstdir ]; then
  mkdir $dstdir
fi


##########################
# run ikos for one time, i.e., 
# if find .ikos.db file in the dst dir, skip, else run ikos again 
##########################
if [ "X${rerun}" != "X" ];
then
	rm "${srcdir}/ikos_tmp" -rf
	mkdir "${srcdir}/ikos_tmp"

	rm ${dstdir}/*.ikos.db -f
	
	find $srcdir -name "*.c" | while read srcfile
	do
		srcfilename="${srcfile##*/}"
		srcfilename_short="${srcfilename%.*}"
		/usr/lib/llvm-9/bin/clang -c -emit-llvm -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -D__IKOS__ -g -O0 -Xclang -disable-O0-optnone -isystem /opt/ikos/include -I./testcasesupport/ -fcolor-diagnostics -DINCLUDEMAIN  $srcfile -o ${srcdir}/ikos_tmp/${srcfilename_short}.bc > /dev/null

		ikos-pp -opt=basic -entry-points=main ${srcdir}/ikos_tmp/${srcfilename_short}.bc -o ${srcdir}/ikos_tmp/${srcfilename_short}.pp.bc > /dev/null

		ikos-analyzer -a=boa  -d=interval -entry-points=main -globals-init=skip-big-arrays -proc=inter -j=1 -widening-strategy=widen -widening-delay=1 -widening-period=1 -narrowing-strategy=narrow -allow-dbg-mismatch -display-checks=no -display-inv=no -log=debug -progress=auto ${srcdir}/ikos_tmp/${srcfilename_short}.pp.bc -o ${dstdir}/${srcfilename_short}.ikos.db > /dev/null

		echo "[ikos] file: ${srcfile} done!"
	done
else
	echo "[ikos] ikos has been run previously, skip ikos on all input!"
fi

#################################
# pull designated branch of sse #
#################################




###############################
# build the branch of the sse #
###############################



###############################################################
# run sse on the testcases and put all db into the output dbs #
###############################################################
if [ ! -d ${srcdir}/sse_tmp ]; then
  	mkdir ${srcdir}/sse_tmp
else
	rm ${srcdir}/sse_tmp/* -f
fi

rm ${dstdir}/*.sse.db -f

find $srcdir -name "*.c" | while read srcfile
do
	srcfilename="${srcfile##*/}"
	srcfilename_short="${srcfilename%.*}"
	$LLVM_DIR/bin/clang -S -c -Xclang -disable-O0-optnone -fno-discard-value-names -g -emit-llvm -I./testcasesupport/ -DINCLUDEMAIN $srcfile -o $srcdir/sse_tmp/${srcfilename_short}.ll

	sse $srcdir/sse_tmp/${srcfilename_short}.ll -overflow -output=$dstdir/${srcfilename_short}.sse.db > /dev/null
	echo "[SSE] file: ${srcfile} done!"
	rm ./*.ll.stat
done


####################################
# run sse-assessment python script #
####################################
echo "[assess-in-batch] start to diff and report!"
if [ ! -d $reportdir ]; then
  	mkdir $reportdir
else
	rm $reportdir/* -f
fi

python3.7 ./utils/assess-in-batch.py $dstdir $metadatadir $reportdir