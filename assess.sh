###############################################################################
#
# assess.sh
#
# Note: run this script with the command below:
# 	assess.sh [-s somevalue] [-d somevalue] [-r] [-p] [-m somevalue] [-t somevalue] 
# 		-s 	c src dir to input into ikos and sse,
# 		-d 	dst dir for output db of sse and ikos,
# 		-p 	should rerun sse?
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
			p) rerunsse=true;;
			t) reportdir=${OPTARG};;
			m) metadatadir=${OPTARG};;
			?) echo "script usage: $(basename $0) [-s srcpath] [-d dstpath] [-t report dir] [-m metadata dir] [-p]"
		esac
done

if [ ! -d $dstdir ]; then
  mkdir $dstdir
fi

###############################################################
# run sse on the testcases and put all db into the output dbs #
###############################################################
if [ "X${rerunsse}" != "X" ]; then
  if [ ! -d ${srcdir}/sse_tmp ]; then
      mkdir ${srcdir}/sse_tmp
  else
    rm ${srcdir}/sse_tmp -rf
    mkdir ${srcdir}/sse_tmp
  fi

  find $srcdir -name "*.c" | while read srcfile
  do
    srcfilename="${srcfile##*/}"
    srcfilename_short="${srcfilename%.*}"
    
    # if filename ends with a, b, c, d, e
    echo "${srcfilename_short: -1}" | grep -q "[abcde]"
    if [ $? -ne 0 ];  # the file belongs to a normal single file testcase 
    then
      if test -f "${dstdir}/${srcfilename_short}.sse.db";
      then
      	echo "[SSE] 4:file: ${srcfilename} skip!"
      else
        /home/joelyang/SVF/llvm-13.0.0.obj/bin/clang -S -c -Xclang -disable-O0-optnone -fno-discard-value-names -g -emit-llvm -I./testcasesupport/ -DINCLUDEMAIN $srcfile -o ${srcdir}/sse_tmp/${srcfilename_short}.ll
        /home/joelyang/SVF-Z3/cmake-build-debug/bin/sse $srcdir/sse_tmp/${srcfilename_short}.ll -overflow -output=$dstdir/${srcfilename_short}.sse.db>/dev/null 2>/dev/null
        rm ./*.ll.stat -f
        echo "[SSE] 1:file: ${srcfilename} done!"
      fi
    elif [[ "${srcfilename_short: -1}" == 'a' ]];  # the file is the main file of a multi-file testcase
    then
      if test -f "$dstdir/${srcfilename_short:0:-1}.sse.db";
      then
        echo "[SSE] 4:file: ${srcfilename} skip!"
      else
        bcfile_list="${srcdir}/sse_tmp/${srcfilename_short}.ll"
        appendent_list=('b' 'c' 'd' 'e')
        #  compile the main file
        /home/joelyang/SVF/llvm-13.0.0.obj/bin/clang -S -c -Xclang -disable-O0-optnone -fno-discard-value-names -g -emit-llvm -I./testcasesupport/ -DINCLUDEMAIN $srcfile -o "${srcdir}/sse_tmp/${srcfilename_short}.ll"
        #  compiler each file respectively
        for character in ${appendent_list}
        do
          if test -f "${srcdir}/${srcfilename_short:0:-1}${character}.c";
          then
            /home/joelyang/SVF/llvm-13.0.0.obj/bin/clang -S -c -Xclang -disable-O0-optnone -fno-discard-value-names -g -emit-llvm -I./testcasesupport/ -DINCLUDEMAIN ${srcdir}/${srcfilename_short:0:-1}${character}.c -o ${srcdir}/sse_tmp/${srcfilename_short:0:-1}${character}.ll
            bcfile_list="${bcfile_list} ${srcdir}/sse_tmp/${srcfilename_short:0:-1}${character}.ll"
          fi
        done
        #  use llvm-link to link the bcs into one
        /home/joelyang/SVF/llvm-13.0.0.obj/bin/llvm-link -o="${srcdir}/sse_tmp/${srcfilename_short:0:-1}.ll" ${bcfile_list}
        #  use sse to analyze
        /home/joelyang/SVF-Z3/cmake-build-debug/bin/sse $srcdir/sse_tmp/${srcfilename_short:0:-1}.ll -overflow -output=$dstdir/${srcfilename_short:0:-1}.sse.db>/dev/null 2>/dev/null
        rm ./*.ll.stat -f
        echo "[sse] 2:file: ${srcfilename} done!"
      fi
    else  # the file is the appendent file of a multi-files testcase
      echo "[sse] 3:file: ${srcfilename} skip!"
    fi
  done
else
  echo "[sse] sse has been run previously, skip sse on all input!"
fi

####################################
# run sse-assessment python script #
####################################
echo "[assess-in-batch] start to diff and report!"
if [ ! -d $reportdir ]; then
  	mkdir $reportdir
else
	rm $reportdir/* -f
fi

python3 ./utils/assess-in-batch.py $dstdir $metadatadir $reportdir