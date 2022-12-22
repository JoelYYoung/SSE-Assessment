; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_13_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 5, !dbg !22
  br i1 %cmp, label %if.then, label %if.end5, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !24, metadata !DIExpression()), !dbg !31
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !32
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !34
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !35
  %cmp1 = icmp ne i8* %call, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !37

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !40
  store i32 %call4, i32* %data, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !45

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !46
  %cmp6 = icmp eq i32 %3, 5, !dbg !48
  br i1 %cmp6, label %if.then7, label %if.end12, !dbg !49

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !50, metadata !DIExpression()), !dbg !56
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !56
  %5 = load i32, i32* %data, align 4, !dbg !57
  %cmp8 = icmp sge i32 %5, 0, !dbg !59
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !60

if.then9:                                         ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !61
  %idxprom = sext i32 %6 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !63
  %7 = load i32, i32* %arrayidx, align 4, !dbg !63
  call void @printIntLine(i32 %7), !dbg !64
  br label %if.end11, !dbg !65

if.else10:                                        ; preds = %if.then7
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %if.end12, !dbg !68

if.end12:                                         ; preds = %if.end11, %if.end5
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_13_good() #0 !dbg !70 {
entry:
  call void @goodB2G1(), !dbg !71
  call void @goodB2G2(), !dbg !72
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__CWE129_fgets_13_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__CWE129_fgets_13_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !95 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 -1, i32* %data, align 4, !dbg !98
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !99
  %cmp = icmp eq i32 %0, 5, !dbg !101
  br i1 %cmp, label %if.then, label %if.end5, !dbg !102

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !103, metadata !DIExpression()), !dbg !106
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !107
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !109
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !110
  %cmp1 = icmp ne i8* %call, null, !dbg !111
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !112

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !113
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !115
  store i32 %call4, i32* %data, align 4, !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !120

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !121
  %cmp6 = icmp ne i32 %3, 5, !dbg !123
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !124

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !125
  br label %if.end14, !dbg !127

if.else8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !128, metadata !DIExpression()), !dbg !131
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !131
  %5 = load i32, i32* %data, align 4, !dbg !132
  %cmp9 = icmp sge i32 %5, 0, !dbg !134
  br i1 %cmp9, label %land.lhs.true, label %if.else12, !dbg !135

land.lhs.true:                                    ; preds = %if.else8
  %6 = load i32, i32* %data, align 4, !dbg !136
  %cmp10 = icmp slt i32 %6, 10, !dbg !137
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !138

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !139
  %idxprom = sext i32 %7 to i64, !dbg !141
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !141
  %8 = load i32, i32* %arrayidx, align 4, !dbg !141
  call void @printIntLine(i32 %8), !dbg !142
  br label %if.end13, !dbg !143

if.else12:                                        ; preds = %land.lhs.true, %if.else8
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !144
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.then7
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !147 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i32 -1, i32* %data, align 4, !dbg !150
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !151
  %cmp = icmp eq i32 %0, 5, !dbg !153
  br i1 %cmp, label %if.then, label %if.end5, !dbg !154

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !155, metadata !DIExpression()), !dbg !158
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !161
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !162
  %cmp1 = icmp ne i8* %call, null, !dbg !163
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !164

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !167
  store i32 %call4, i32* %data, align 4, !dbg !168
  br label %if.end, !dbg !169

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !172

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !173
  %cmp6 = icmp eq i32 %3, 5, !dbg !175
  br i1 %cmp6, label %if.then7, label %if.end13, !dbg !176

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !177, metadata !DIExpression()), !dbg !180
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !180
  %5 = load i32, i32* %data, align 4, !dbg !181
  %cmp8 = icmp sge i32 %5, 0, !dbg !183
  br i1 %cmp8, label %land.lhs.true, label %if.else11, !dbg !184

land.lhs.true:                                    ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !185
  %cmp9 = icmp slt i32 %6, 10, !dbg !186
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !187

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !188
  %idxprom = sext i32 %7 to i64, !dbg !190
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !190
  %8 = load i32, i32* %arrayidx, align 4, !dbg !190
  call void @printIntLine(i32 %8), !dbg !191
  br label %if.end12, !dbg !192

if.else11:                                        ; preds = %land.lhs.true, %if.then7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !193
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  br label %if.end13, !dbg !195

if.end13:                                         ; preds = %if.end12, %if.end5
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !197 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 -1, i32* %data, align 4, !dbg !200
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !201
  %cmp = icmp ne i32 %0, 5, !dbg !203
  br i1 %cmp, label %if.then, label %if.else, !dbg !204

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !205
  br label %if.end, !dbg !207

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !208
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !210
  %cmp1 = icmp eq i32 %1, 5, !dbg !212
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !213

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !214, metadata !DIExpression()), !dbg !217
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !217
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !217
  %3 = load i32, i32* %data, align 4, !dbg !218
  %cmp3 = icmp sge i32 %3, 0, !dbg !220
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !221

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !222
  %idxprom = sext i32 %4 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !224
  %5 = load i32, i32* %arrayidx, align 4, !dbg !224
  call void @printIntLine(i32 %5), !dbg !225
  br label %if.end6, !dbg !226

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !227
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !229

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !231 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !232, metadata !DIExpression()), !dbg !233
  store i32 -1, i32* %data, align 4, !dbg !234
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !235
  %cmp = icmp eq i32 %0, 5, !dbg !237
  br i1 %cmp, label %if.then, label %if.end, !dbg !238

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !239
  br label %if.end, !dbg !241

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !242
  %cmp1 = icmp eq i32 %1, 5, !dbg !244
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !245

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !246, metadata !DIExpression()), !dbg !249
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !249
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !249
  %3 = load i32, i32* %data, align 4, !dbg !250
  %cmp3 = icmp sge i32 %3, 0, !dbg !252
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !253

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !254
  %idxprom = sext i32 %4 to i64, !dbg !256
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !256
  %5 = load i32, i32* %arrayidx, align 4, !dbg !256
  call void @printIntLine(i32 %5), !dbg !257
  br label %if.end5, !dbg !258

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !259
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !261

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !262
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_13_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_13.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!22 = !DILocation(line: 29, column: 25, scope: !21)
!23 = !DILocation(line: 29, column: 8, scope: !12)
!24 = !DILocalVariable(name: "inputBuffer", scope: !25, file: !13, line: 32, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !13, line: 31, column: 9)
!26 = distinct !DILexicalBlock(scope: !21, file: !13, line: 30, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 32, column: 18, scope: !25)
!32 = !DILocation(line: 34, column: 23, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !13, line: 34, column: 17)
!34 = !DILocation(line: 34, column: 53, scope: !33)
!35 = !DILocation(line: 34, column: 17, scope: !33)
!36 = !DILocation(line: 34, column: 60, scope: !33)
!37 = !DILocation(line: 34, column: 17, scope: !25)
!38 = !DILocation(line: 37, column: 29, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 35, column: 13)
!40 = !DILocation(line: 37, column: 24, scope: !39)
!41 = !DILocation(line: 37, column: 22, scope: !39)
!42 = !DILocation(line: 38, column: 13, scope: !39)
!43 = !DILocation(line: 41, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 40, column: 13)
!45 = !DILocation(line: 44, column: 5, scope: !26)
!46 = !DILocation(line: 45, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!48 = !DILocation(line: 45, column: 25, scope: !47)
!49 = !DILocation(line: 45, column: 8, scope: !12)
!50 = !DILocalVariable(name: "buffer", scope: !51, file: !13, line: 48, type: !53)
!51 = distinct !DILexicalBlock(scope: !52, file: !13, line: 47, column: 9)
!52 = distinct !DILexicalBlock(scope: !47, file: !13, line: 46, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 10)
!56 = !DILocation(line: 48, column: 17, scope: !51)
!57 = !DILocation(line: 51, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !51, file: !13, line: 51, column: 17)
!59 = !DILocation(line: 51, column: 22, scope: !58)
!60 = !DILocation(line: 51, column: 17, scope: !51)
!61 = !DILocation(line: 53, column: 37, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 52, column: 13)
!63 = !DILocation(line: 53, column: 30, scope: !62)
!64 = !DILocation(line: 53, column: 17, scope: !62)
!65 = !DILocation(line: 54, column: 13, scope: !62)
!66 = !DILocation(line: 57, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !58, file: !13, line: 56, column: 13)
!68 = !DILocation(line: 60, column: 5, scope: !52)
!69 = !DILocation(line: 61, column: 1, scope: !12)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_13_good", scope: !13, file: !13, line: 215, type: !14, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 217, column: 5, scope: !70)
!72 = !DILocation(line: 218, column: 5, scope: !70)
!73 = !DILocation(line: 219, column: 5, scope: !70)
!74 = !DILocation(line: 220, column: 5, scope: !70)
!75 = !DILocation(line: 221, column: 1, scope: !70)
!76 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 232, type: !77, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!17, !17, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !13, line: 232, type: !17)
!82 = !DILocation(line: 232, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !13, line: 232, type: !79)
!84 = !DILocation(line: 232, column: 27, scope: !76)
!85 = !DILocation(line: 235, column: 22, scope: !76)
!86 = !DILocation(line: 235, column: 12, scope: !76)
!87 = !DILocation(line: 235, column: 5, scope: !76)
!88 = !DILocation(line: 237, column: 5, scope: !76)
!89 = !DILocation(line: 238, column: 5, scope: !76)
!90 = !DILocation(line: 239, column: 5, scope: !76)
!91 = !DILocation(line: 242, column: 5, scope: !76)
!92 = !DILocation(line: 243, column: 5, scope: !76)
!93 = !DILocation(line: 244, column: 5, scope: !76)
!94 = !DILocation(line: 246, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !13, line: 70, type: !17)
!97 = !DILocation(line: 70, column: 9, scope: !95)
!98 = !DILocation(line: 72, column: 10, scope: !95)
!99 = !DILocation(line: 73, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !13, line: 73, column: 8)
!101 = !DILocation(line: 73, column: 25, scope: !100)
!102 = !DILocation(line: 73, column: 8, scope: !95)
!103 = !DILocalVariable(name: "inputBuffer", scope: !104, file: !13, line: 76, type: !27)
!104 = distinct !DILexicalBlock(scope: !105, file: !13, line: 75, column: 9)
!105 = distinct !DILexicalBlock(scope: !100, file: !13, line: 74, column: 5)
!106 = !DILocation(line: 76, column: 18, scope: !104)
!107 = !DILocation(line: 78, column: 23, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !13, line: 78, column: 17)
!109 = !DILocation(line: 78, column: 53, scope: !108)
!110 = !DILocation(line: 78, column: 17, scope: !108)
!111 = !DILocation(line: 78, column: 60, scope: !108)
!112 = !DILocation(line: 78, column: 17, scope: !104)
!113 = !DILocation(line: 81, column: 29, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !13, line: 79, column: 13)
!115 = !DILocation(line: 81, column: 24, scope: !114)
!116 = !DILocation(line: 81, column: 22, scope: !114)
!117 = !DILocation(line: 82, column: 13, scope: !114)
!118 = !DILocation(line: 85, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !108, file: !13, line: 84, column: 13)
!120 = !DILocation(line: 88, column: 5, scope: !105)
!121 = !DILocation(line: 89, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !95, file: !13, line: 89, column: 8)
!123 = !DILocation(line: 89, column: 25, scope: !122)
!124 = !DILocation(line: 89, column: 8, scope: !95)
!125 = !DILocation(line: 92, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 90, column: 5)
!127 = !DILocation(line: 93, column: 5, scope: !126)
!128 = !DILocalVariable(name: "buffer", scope: !129, file: !13, line: 97, type: !53)
!129 = distinct !DILexicalBlock(scope: !130, file: !13, line: 96, column: 9)
!130 = distinct !DILexicalBlock(scope: !122, file: !13, line: 95, column: 5)
!131 = !DILocation(line: 97, column: 17, scope: !129)
!132 = !DILocation(line: 99, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !13, line: 99, column: 17)
!134 = !DILocation(line: 99, column: 22, scope: !133)
!135 = !DILocation(line: 99, column: 27, scope: !133)
!136 = !DILocation(line: 99, column: 30, scope: !133)
!137 = !DILocation(line: 99, column: 35, scope: !133)
!138 = !DILocation(line: 99, column: 17, scope: !129)
!139 = !DILocation(line: 101, column: 37, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !13, line: 100, column: 13)
!141 = !DILocation(line: 101, column: 30, scope: !140)
!142 = !DILocation(line: 101, column: 17, scope: !140)
!143 = !DILocation(line: 102, column: 13, scope: !140)
!144 = !DILocation(line: 105, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !133, file: !13, line: 104, column: 13)
!146 = !DILocation(line: 109, column: 1, scope: !95)
!147 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 112, type: !14, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !13, line: 114, type: !17)
!149 = !DILocation(line: 114, column: 9, scope: !147)
!150 = !DILocation(line: 116, column: 10, scope: !147)
!151 = !DILocation(line: 117, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !13, line: 117, column: 8)
!153 = !DILocation(line: 117, column: 25, scope: !152)
!154 = !DILocation(line: 117, column: 8, scope: !147)
!155 = !DILocalVariable(name: "inputBuffer", scope: !156, file: !13, line: 120, type: !27)
!156 = distinct !DILexicalBlock(scope: !157, file: !13, line: 119, column: 9)
!157 = distinct !DILexicalBlock(scope: !152, file: !13, line: 118, column: 5)
!158 = !DILocation(line: 120, column: 18, scope: !156)
!159 = !DILocation(line: 122, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !13, line: 122, column: 17)
!161 = !DILocation(line: 122, column: 53, scope: !160)
!162 = !DILocation(line: 122, column: 17, scope: !160)
!163 = !DILocation(line: 122, column: 60, scope: !160)
!164 = !DILocation(line: 122, column: 17, scope: !156)
!165 = !DILocation(line: 125, column: 29, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !13, line: 123, column: 13)
!167 = !DILocation(line: 125, column: 24, scope: !166)
!168 = !DILocation(line: 125, column: 22, scope: !166)
!169 = !DILocation(line: 126, column: 13, scope: !166)
!170 = !DILocation(line: 129, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !160, file: !13, line: 128, column: 13)
!172 = !DILocation(line: 132, column: 5, scope: !157)
!173 = !DILocation(line: 133, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !147, file: !13, line: 133, column: 8)
!175 = !DILocation(line: 133, column: 25, scope: !174)
!176 = !DILocation(line: 133, column: 8, scope: !147)
!177 = !DILocalVariable(name: "buffer", scope: !178, file: !13, line: 136, type: !53)
!178 = distinct !DILexicalBlock(scope: !179, file: !13, line: 135, column: 9)
!179 = distinct !DILexicalBlock(scope: !174, file: !13, line: 134, column: 5)
!180 = !DILocation(line: 136, column: 17, scope: !178)
!181 = !DILocation(line: 138, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !13, line: 138, column: 17)
!183 = !DILocation(line: 138, column: 22, scope: !182)
!184 = !DILocation(line: 138, column: 27, scope: !182)
!185 = !DILocation(line: 138, column: 30, scope: !182)
!186 = !DILocation(line: 138, column: 35, scope: !182)
!187 = !DILocation(line: 138, column: 17, scope: !178)
!188 = !DILocation(line: 140, column: 37, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !13, line: 139, column: 13)
!190 = !DILocation(line: 140, column: 30, scope: !189)
!191 = !DILocation(line: 140, column: 17, scope: !189)
!192 = !DILocation(line: 141, column: 13, scope: !189)
!193 = !DILocation(line: 144, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !182, file: !13, line: 143, column: 13)
!195 = !DILocation(line: 147, column: 5, scope: !179)
!196 = !DILocation(line: 148, column: 1, scope: !147)
!197 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!198 = !DILocalVariable(name: "data", scope: !197, file: !13, line: 153, type: !17)
!199 = !DILocation(line: 153, column: 9, scope: !197)
!200 = !DILocation(line: 155, column: 10, scope: !197)
!201 = !DILocation(line: 156, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !13, line: 156, column: 8)
!203 = !DILocation(line: 156, column: 25, scope: !202)
!204 = !DILocation(line: 156, column: 8, scope: !197)
!205 = !DILocation(line: 159, column: 9, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !13, line: 157, column: 5)
!207 = !DILocation(line: 160, column: 5, scope: !206)
!208 = !DILocation(line: 165, column: 14, scope: !209)
!209 = distinct !DILexicalBlock(scope: !202, file: !13, line: 162, column: 5)
!210 = !DILocation(line: 167, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !197, file: !13, line: 167, column: 8)
!212 = !DILocation(line: 167, column: 25, scope: !211)
!213 = !DILocation(line: 167, column: 8, scope: !197)
!214 = !DILocalVariable(name: "buffer", scope: !215, file: !13, line: 170, type: !53)
!215 = distinct !DILexicalBlock(scope: !216, file: !13, line: 169, column: 9)
!216 = distinct !DILexicalBlock(scope: !211, file: !13, line: 168, column: 5)
!217 = !DILocation(line: 170, column: 17, scope: !215)
!218 = !DILocation(line: 173, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !13, line: 173, column: 17)
!220 = !DILocation(line: 173, column: 22, scope: !219)
!221 = !DILocation(line: 173, column: 17, scope: !215)
!222 = !DILocation(line: 175, column: 37, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !13, line: 174, column: 13)
!224 = !DILocation(line: 175, column: 30, scope: !223)
!225 = !DILocation(line: 175, column: 17, scope: !223)
!226 = !DILocation(line: 176, column: 13, scope: !223)
!227 = !DILocation(line: 179, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !219, file: !13, line: 178, column: 13)
!229 = !DILocation(line: 182, column: 5, scope: !216)
!230 = !DILocation(line: 183, column: 1, scope: !197)
!231 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 186, type: !14, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!232 = !DILocalVariable(name: "data", scope: !231, file: !13, line: 188, type: !17)
!233 = !DILocation(line: 188, column: 9, scope: !231)
!234 = !DILocation(line: 190, column: 10, scope: !231)
!235 = !DILocation(line: 191, column: 8, scope: !236)
!236 = distinct !DILexicalBlock(scope: !231, file: !13, line: 191, column: 8)
!237 = !DILocation(line: 191, column: 25, scope: !236)
!238 = !DILocation(line: 191, column: 8, scope: !231)
!239 = !DILocation(line: 195, column: 14, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !13, line: 192, column: 5)
!241 = !DILocation(line: 196, column: 5, scope: !240)
!242 = !DILocation(line: 197, column: 8, scope: !243)
!243 = distinct !DILexicalBlock(scope: !231, file: !13, line: 197, column: 8)
!244 = !DILocation(line: 197, column: 25, scope: !243)
!245 = !DILocation(line: 197, column: 8, scope: !231)
!246 = !DILocalVariable(name: "buffer", scope: !247, file: !13, line: 200, type: !53)
!247 = distinct !DILexicalBlock(scope: !248, file: !13, line: 199, column: 9)
!248 = distinct !DILexicalBlock(scope: !243, file: !13, line: 198, column: 5)
!249 = !DILocation(line: 200, column: 17, scope: !247)
!250 = !DILocation(line: 203, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !13, line: 203, column: 17)
!252 = !DILocation(line: 203, column: 22, scope: !251)
!253 = !DILocation(line: 203, column: 17, scope: !247)
!254 = !DILocation(line: 205, column: 37, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !13, line: 204, column: 13)
!256 = !DILocation(line: 205, column: 30, scope: !255)
!257 = !DILocation(line: 205, column: 17, scope: !255)
!258 = !DILocation(line: 206, column: 13, scope: !255)
!259 = !DILocation(line: 209, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !251, file: !13, line: 208, column: 13)
!261 = !DILocation(line: 212, column: 5, scope: !248)
!262 = !DILocation(line: 213, column: 1, scope: !231)
