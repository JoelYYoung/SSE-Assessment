; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end5, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !24, metadata !DIExpression()), !dbg !31
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !32
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !34
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !35
  %cmp = icmp ne i8* %call1, null, !dbg !36
  br i1 %cmp, label %if.then2, label %if.else, !dbg !37

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !40
  store i32 %call4, i32* %data, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !45

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 (...) @globalReturnsTrue(), !dbg !46
  %tobool7 = icmp ne i32 %call6, 0, !dbg !46
  br i1 %tobool7, label %if.then8, label %if.end28, !dbg !48

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !53, metadata !DIExpression()), !dbg !54
  %call9 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !55
  %2 = bitcast i8* %call9 to i32*, !dbg !56
  store i32* %2, i32** %buffer, align 8, !dbg !54
  %3 = load i32*, i32** %buffer, align 8, !dbg !57
  %cmp10 = icmp eq i32* %3, null, !dbg !59
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !60

if.then11:                                        ; preds = %if.then8
  call void @exit(i32 -1) #9, !dbg !61
  unreachable, !dbg !61

if.end12:                                         ; preds = %if.then8
  store i32 0, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end12
  %4 = load i32, i32* %i, align 4, !dbg !66
  %cmp13 = icmp slt i32 %4, 10, !dbg !68
  br i1 %cmp13, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !70
  %6 = load i32, i32* %i, align 4, !dbg !72
  %idxprom = sext i32 %6 to i64, !dbg !70
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !70
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !75
  %inc = add nsw i32 %7, 1, !dbg !75
  store i32 %inc, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !80
  %cmp14 = icmp sge i32 %8, 0, !dbg !82
  br i1 %cmp14, label %if.then15, label %if.else26, !dbg !83

if.then15:                                        ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !84
  %10 = load i32, i32* %data, align 4, !dbg !86
  %idxprom16 = sext i32 %10 to i64, !dbg !84
  %arrayidx17 = getelementptr inbounds i32, i32* %9, i64 %idxprom16, !dbg !84
  store i32 1, i32* %arrayidx17, align 4, !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  br label %for.cond18, !dbg !90

for.cond18:                                       ; preds = %for.inc23, %if.then15
  %11 = load i32, i32* %i, align 4, !dbg !91
  %cmp19 = icmp slt i32 %11, 10, !dbg !93
  br i1 %cmp19, label %for.body20, label %for.end25, !dbg !94

for.body20:                                       ; preds = %for.cond18
  %12 = load i32*, i32** %buffer, align 8, !dbg !95
  %13 = load i32, i32* %i, align 4, !dbg !97
  %idxprom21 = sext i32 %13 to i64, !dbg !95
  %arrayidx22 = getelementptr inbounds i32, i32* %12, i64 %idxprom21, !dbg !95
  %14 = load i32, i32* %arrayidx22, align 4, !dbg !95
  call void @printIntLine(i32 %14), !dbg !98
  br label %for.inc23, !dbg !99

for.inc23:                                        ; preds = %for.body20
  %15 = load i32, i32* %i, align 4, !dbg !100
  %inc24 = add nsw i32 %15, 1, !dbg !100
  store i32 %inc24, i32* %i, align 4, !dbg !100
  br label %for.cond18, !dbg !101, !llvm.loop !102

for.end25:                                        ; preds = %for.cond18
  br label %if.end27, !dbg !104

if.else26:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %for.end25
  %16 = load i32*, i32** %buffer, align 8, !dbg !107
  %17 = bitcast i32* %16 to i8*, !dbg !107
  call void @free(i8* %17) #8, !dbg !108
  br label %if.end28, !dbg !109

if.end28:                                         ; preds = %if.end27, %if.end5
  ret void, !dbg !110
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11_good() #0 !dbg !111 {
entry:
  call void @goodB2G1(), !dbg !112
  call void @goodB2G2(), !dbg !113
  call void @goodG2B1(), !dbg !114
  call void @goodG2B2(), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !122, metadata !DIExpression()), !dbg !123
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !124, metadata !DIExpression()), !dbg !125
  %call = call i64 @time(i64* null) #8, !dbg !126
  %conv = trunc i64 %call to i32, !dbg !127
  call void @srand(i32 %conv) #8, !dbg !128
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11_good(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11_bad(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !134
  ret i32 0, !dbg !135
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !136 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !137, metadata !DIExpression()), !dbg !138
  store i32 -1, i32* %data, align 4, !dbg !139
  %call = call i32 (...) @globalReturnsTrue(), !dbg !140
  %tobool = icmp ne i32 %call, 0, !dbg !140
  br i1 %tobool, label %if.then, label %if.end5, !dbg !142

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !143, metadata !DIExpression()), !dbg !146
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !146
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !147
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !149
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !150
  %cmp = icmp ne i8* %call1, null, !dbg !151
  br i1 %cmp, label %if.then2, label %if.else, !dbg !152

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !155
  store i32 %call4, i32* %data, align 4, !dbg !156
  br label %if.end, !dbg !157

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !160

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 (...) @globalReturnsFalse(), !dbg !161
  %tobool7 = icmp ne i32 %call6, 0, !dbg !161
  br i1 %tobool7, label %if.then8, label %if.else9, !dbg !163

if.then8:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !164
  br label %if.end30, !dbg !166

if.else9:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !167, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !171, metadata !DIExpression()), !dbg !172
  %call10 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !173
  %2 = bitcast i8* %call10 to i32*, !dbg !174
  store i32* %2, i32** %buffer, align 8, !dbg !172
  %3 = load i32*, i32** %buffer, align 8, !dbg !175
  %cmp11 = icmp eq i32* %3, null, !dbg !177
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !178

if.then12:                                        ; preds = %if.else9
  call void @exit(i32 -1) #9, !dbg !179
  unreachable, !dbg !179

if.end13:                                         ; preds = %if.else9
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end13
  %4 = load i32, i32* %i, align 4, !dbg !184
  %cmp14 = icmp slt i32 %4, 10, !dbg !186
  br i1 %cmp14, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !188
  %6 = load i32, i32* %i, align 4, !dbg !190
  %idxprom = sext i32 %6 to i64, !dbg !188
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !193
  %inc = add nsw i32 %7, 1, !dbg !193
  store i32 %inc, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !197
  %cmp15 = icmp sge i32 %8, 0, !dbg !199
  br i1 %cmp15, label %land.lhs.true, label %if.else28, !dbg !200

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !201
  %cmp16 = icmp slt i32 %9, 10, !dbg !202
  br i1 %cmp16, label %if.then17, label %if.else28, !dbg !203

if.then17:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !204
  %11 = load i32, i32* %data, align 4, !dbg !206
  %idxprom18 = sext i32 %11 to i64, !dbg !204
  %arrayidx19 = getelementptr inbounds i32, i32* %10, i64 %idxprom18, !dbg !204
  store i32 1, i32* %arrayidx19, align 4, !dbg !207
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond20, !dbg !210

for.cond20:                                       ; preds = %for.inc25, %if.then17
  %12 = load i32, i32* %i, align 4, !dbg !211
  %cmp21 = icmp slt i32 %12, 10, !dbg !213
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !214

for.body22:                                       ; preds = %for.cond20
  %13 = load i32*, i32** %buffer, align 8, !dbg !215
  %14 = load i32, i32* %i, align 4, !dbg !217
  %idxprom23 = sext i32 %14 to i64, !dbg !215
  %arrayidx24 = getelementptr inbounds i32, i32* %13, i64 %idxprom23, !dbg !215
  %15 = load i32, i32* %arrayidx24, align 4, !dbg !215
  call void @printIntLine(i32 %15), !dbg !218
  br label %for.inc25, !dbg !219

for.inc25:                                        ; preds = %for.body22
  %16 = load i32, i32* %i, align 4, !dbg !220
  %inc26 = add nsw i32 %16, 1, !dbg !220
  store i32 %inc26, i32* %i, align 4, !dbg !220
  br label %for.cond20, !dbg !221, !llvm.loop !222

for.end27:                                        ; preds = %for.cond20
  br label %if.end29, !dbg !224

if.else28:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !225
  br label %if.end29

if.end29:                                         ; preds = %if.else28, %for.end27
  %17 = load i32*, i32** %buffer, align 8, !dbg !227
  %18 = bitcast i32* %17 to i8*, !dbg !227
  call void @free(i8* %18) #8, !dbg !228
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then8
  ret void, !dbg !229
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !230 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 -1, i32* %data, align 4, !dbg !233
  %call = call i32 (...) @globalReturnsTrue(), !dbg !234
  %tobool = icmp ne i32 %call, 0, !dbg !234
  br i1 %tobool, label %if.then, label %if.end5, !dbg !236

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !237, metadata !DIExpression()), !dbg !240
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !240
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !240
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !241
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !243
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !244
  %cmp = icmp ne i8* %call1, null, !dbg !245
  br i1 %cmp, label %if.then2, label %if.else, !dbg !246

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !247
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !249
  store i32 %call4, i32* %data, align 4, !dbg !250
  br label %if.end, !dbg !251

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !252
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !254

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 (...) @globalReturnsTrue(), !dbg !255
  %tobool7 = icmp ne i32 %call6, 0, !dbg !255
  br i1 %tobool7, label %if.then8, label %if.end29, !dbg !257

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !258, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !262, metadata !DIExpression()), !dbg !263
  %call9 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !264
  %2 = bitcast i8* %call9 to i32*, !dbg !265
  store i32* %2, i32** %buffer, align 8, !dbg !263
  %3 = load i32*, i32** %buffer, align 8, !dbg !266
  %cmp10 = icmp eq i32* %3, null, !dbg !268
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !269

if.then11:                                        ; preds = %if.then8
  call void @exit(i32 -1) #9, !dbg !270
  unreachable, !dbg !270

if.end12:                                         ; preds = %if.then8
  store i32 0, i32* %i, align 4, !dbg !272
  br label %for.cond, !dbg !274

for.cond:                                         ; preds = %for.inc, %if.end12
  %4 = load i32, i32* %i, align 4, !dbg !275
  %cmp13 = icmp slt i32 %4, 10, !dbg !277
  br i1 %cmp13, label %for.body, label %for.end, !dbg !278

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !279
  %6 = load i32, i32* %i, align 4, !dbg !281
  %idxprom = sext i32 %6 to i64, !dbg !279
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !279
  store i32 0, i32* %arrayidx, align 4, !dbg !282
  br label %for.inc, !dbg !283

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !284
  %inc = add nsw i32 %7, 1, !dbg !284
  store i32 %inc, i32* %i, align 4, !dbg !284
  br label %for.cond, !dbg !285, !llvm.loop !286

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !288
  %cmp14 = icmp sge i32 %8, 0, !dbg !290
  br i1 %cmp14, label %land.lhs.true, label %if.else27, !dbg !291

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !292
  %cmp15 = icmp slt i32 %9, 10, !dbg !293
  br i1 %cmp15, label %if.then16, label %if.else27, !dbg !294

if.then16:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !295
  %11 = load i32, i32* %data, align 4, !dbg !297
  %idxprom17 = sext i32 %11 to i64, !dbg !295
  %arrayidx18 = getelementptr inbounds i32, i32* %10, i64 %idxprom17, !dbg !295
  store i32 1, i32* %arrayidx18, align 4, !dbg !298
  store i32 0, i32* %i, align 4, !dbg !299
  br label %for.cond19, !dbg !301

for.cond19:                                       ; preds = %for.inc24, %if.then16
  %12 = load i32, i32* %i, align 4, !dbg !302
  %cmp20 = icmp slt i32 %12, 10, !dbg !304
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !305

for.body21:                                       ; preds = %for.cond19
  %13 = load i32*, i32** %buffer, align 8, !dbg !306
  %14 = load i32, i32* %i, align 4, !dbg !308
  %idxprom22 = sext i32 %14 to i64, !dbg !306
  %arrayidx23 = getelementptr inbounds i32, i32* %13, i64 %idxprom22, !dbg !306
  %15 = load i32, i32* %arrayidx23, align 4, !dbg !306
  call void @printIntLine(i32 %15), !dbg !309
  br label %for.inc24, !dbg !310

for.inc24:                                        ; preds = %for.body21
  %16 = load i32, i32* %i, align 4, !dbg !311
  %inc25 = add nsw i32 %16, 1, !dbg !311
  store i32 %inc25, i32* %i, align 4, !dbg !311
  br label %for.cond19, !dbg !312, !llvm.loop !313

for.end26:                                        ; preds = %for.cond19
  br label %if.end28, !dbg !315

if.else27:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !316
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %for.end26
  %17 = load i32*, i32** %buffer, align 8, !dbg !318
  %18 = bitcast i32* %17 to i8*, !dbg !318
  call void @free(i8* %18) #8, !dbg !319
  br label %if.end29, !dbg !320

if.end29:                                         ; preds = %if.end28, %if.end5
  ret void, !dbg !321
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !322 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !323, metadata !DIExpression()), !dbg !324
  store i32 -1, i32* %data, align 4, !dbg !325
  %call = call i32 (...) @globalReturnsFalse(), !dbg !326
  %tobool = icmp ne i32 %call, 0, !dbg !326
  br i1 %tobool, label %if.then, label %if.else, !dbg !328

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !329
  br label %if.end, !dbg !331

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !332
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !334
  %tobool2 = icmp ne i32 %call1, 0, !dbg !334
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !336

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !337, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !341, metadata !DIExpression()), !dbg !342
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !343
  %0 = bitcast i8* %call4 to i32*, !dbg !344
  store i32* %0, i32** %buffer, align 8, !dbg !342
  %1 = load i32*, i32** %buffer, align 8, !dbg !345
  %cmp = icmp eq i32* %1, null, !dbg !347
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !348

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #9, !dbg !349
  unreachable, !dbg !349

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !351
  br label %for.cond, !dbg !353

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !354
  %cmp7 = icmp slt i32 %2, 10, !dbg !356
  br i1 %cmp7, label %for.body, label %for.end, !dbg !357

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !358
  %4 = load i32, i32* %i, align 4, !dbg !360
  %idxprom = sext i32 %4 to i64, !dbg !358
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !358
  store i32 0, i32* %arrayidx, align 4, !dbg !361
  br label %for.inc, !dbg !362

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !363
  %inc = add nsw i32 %5, 1, !dbg !363
  store i32 %inc, i32* %i, align 4, !dbg !363
  br label %for.cond, !dbg !364, !llvm.loop !365

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !367
  %cmp8 = icmp sge i32 %6, 0, !dbg !369
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !370

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !371
  %8 = load i32, i32* %data, align 4, !dbg !373
  %idxprom10 = sext i32 %8 to i64, !dbg !371
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !371
  store i32 1, i32* %arrayidx11, align 4, !dbg !374
  store i32 0, i32* %i, align 4, !dbg !375
  br label %for.cond12, !dbg !377

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !378
  %cmp13 = icmp slt i32 %9, 10, !dbg !380
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !381

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !382
  %11 = load i32, i32* %i, align 4, !dbg !384
  %idxprom15 = sext i32 %11 to i64, !dbg !382
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !382
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !382
  call void @printIntLine(i32 %12), !dbg !385
  br label %for.inc17, !dbg !386

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !387
  %inc18 = add nsw i32 %13, 1, !dbg !387
  store i32 %inc18, i32* %i, align 4, !dbg !387
  br label %for.cond12, !dbg !388, !llvm.loop !389

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !391

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !392
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !394
  %15 = bitcast i32* %14 to i8*, !dbg !394
  call void @free(i8* %15) #8, !dbg !395
  br label %if.end22, !dbg !396

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !397
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !398 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !399, metadata !DIExpression()), !dbg !400
  store i32 -1, i32* %data, align 4, !dbg !401
  %call = call i32 (...) @globalReturnsTrue(), !dbg !402
  %tobool = icmp ne i32 %call, 0, !dbg !402
  br i1 %tobool, label %if.then, label %if.end, !dbg !404

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !405
  br label %if.end, !dbg !407

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !408
  %tobool2 = icmp ne i32 %call1, 0, !dbg !408
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !410

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !411, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !415, metadata !DIExpression()), !dbg !416
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !417
  %0 = bitcast i8* %call4 to i32*, !dbg !418
  store i32* %0, i32** %buffer, align 8, !dbg !416
  %1 = load i32*, i32** %buffer, align 8, !dbg !419
  %cmp = icmp eq i32* %1, null, !dbg !421
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !422

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #9, !dbg !423
  unreachable, !dbg !423

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !425
  br label %for.cond, !dbg !427

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !428
  %cmp7 = icmp slt i32 %2, 10, !dbg !430
  br i1 %cmp7, label %for.body, label %for.end, !dbg !431

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !432
  %4 = load i32, i32* %i, align 4, !dbg !434
  %idxprom = sext i32 %4 to i64, !dbg !432
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !432
  store i32 0, i32* %arrayidx, align 4, !dbg !435
  br label %for.inc, !dbg !436

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !437
  %inc = add nsw i32 %5, 1, !dbg !437
  store i32 %inc, i32* %i, align 4, !dbg !437
  br label %for.cond, !dbg !438, !llvm.loop !439

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !441
  %cmp8 = icmp sge i32 %6, 0, !dbg !443
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !444

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !445
  %8 = load i32, i32* %data, align 4, !dbg !447
  %idxprom10 = sext i32 %8 to i64, !dbg !445
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !445
  store i32 1, i32* %arrayidx11, align 4, !dbg !448
  store i32 0, i32* %i, align 4, !dbg !449
  br label %for.cond12, !dbg !451

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !452
  %cmp13 = icmp slt i32 %9, 10, !dbg !454
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !455

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !456
  %11 = load i32, i32* %i, align 4, !dbg !458
  %idxprom15 = sext i32 %11 to i64, !dbg !456
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !456
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !456
  call void @printIntLine(i32 %12), !dbg !459
  br label %for.inc17, !dbg !460

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !461
  %inc18 = add nsw i32 %13, 1, !dbg !461
  store i32 %inc18, i32* %i, align 4, !dbg !461
  br label %for.cond12, !dbg !462, !llvm.loop !463

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !465

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !466
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !468
  %15 = bitcast i32* %14 to i8*, !dbg !468
  call void @free(i8* %15) #8, !dbg !469
  br label %if.end21, !dbg !470

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !471
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocation(line: 29, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 8)
!23 = !DILocation(line: 29, column: 8, scope: !14)
!24 = !DILocalVariable(name: "inputBuffer", scope: !25, file: !15, line: 32, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 30, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 32, column: 18, scope: !25)
!32 = !DILocation(line: 34, column: 23, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !15, line: 34, column: 17)
!34 = !DILocation(line: 34, column: 53, scope: !33)
!35 = !DILocation(line: 34, column: 17, scope: !33)
!36 = !DILocation(line: 34, column: 60, scope: !33)
!37 = !DILocation(line: 34, column: 17, scope: !25)
!38 = !DILocation(line: 37, column: 29, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !15, line: 35, column: 13)
!40 = !DILocation(line: 37, column: 24, scope: !39)
!41 = !DILocation(line: 37, column: 22, scope: !39)
!42 = !DILocation(line: 38, column: 13, scope: !39)
!43 = !DILocation(line: 41, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !15, line: 40, column: 13)
!45 = !DILocation(line: 44, column: 5, scope: !26)
!46 = !DILocation(line: 45, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 8)
!48 = !DILocation(line: 45, column: 8, scope: !14)
!49 = !DILocalVariable(name: "i", scope: !50, file: !15, line: 48, type: !6)
!50 = distinct !DILexicalBlock(scope: !51, file: !15, line: 47, column: 9)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 46, column: 5)
!52 = !DILocation(line: 48, column: 17, scope: !50)
!53 = !DILocalVariable(name: "buffer", scope: !50, file: !15, line: 49, type: !5)
!54 = !DILocation(line: 49, column: 19, scope: !50)
!55 = !DILocation(line: 49, column: 35, scope: !50)
!56 = !DILocation(line: 49, column: 28, scope: !50)
!57 = !DILocation(line: 50, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !50, file: !15, line: 50, column: 17)
!59 = !DILocation(line: 50, column: 24, scope: !58)
!60 = !DILocation(line: 50, column: 17, scope: !50)
!61 = !DILocation(line: 50, column: 34, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 50, column: 33)
!63 = !DILocation(line: 52, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !15, line: 52, column: 13)
!65 = !DILocation(line: 52, column: 18, scope: !64)
!66 = !DILocation(line: 52, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 52, column: 13)
!68 = !DILocation(line: 52, column: 27, scope: !67)
!69 = !DILocation(line: 52, column: 13, scope: !64)
!70 = !DILocation(line: 54, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 53, column: 13)
!72 = !DILocation(line: 54, column: 24, scope: !71)
!73 = !DILocation(line: 54, column: 27, scope: !71)
!74 = !DILocation(line: 55, column: 13, scope: !71)
!75 = !DILocation(line: 52, column: 34, scope: !67)
!76 = !DILocation(line: 52, column: 13, scope: !67)
!77 = distinct !{!77, !69, !78, !79}
!78 = !DILocation(line: 55, column: 13, scope: !64)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 58, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !50, file: !15, line: 58, column: 17)
!82 = !DILocation(line: 58, column: 22, scope: !81)
!83 = !DILocation(line: 58, column: 17, scope: !50)
!84 = !DILocation(line: 60, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 59, column: 13)
!86 = !DILocation(line: 60, column: 24, scope: !85)
!87 = !DILocation(line: 60, column: 30, scope: !85)
!88 = !DILocation(line: 62, column: 23, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 62, column: 17)
!90 = !DILocation(line: 62, column: 21, scope: !89)
!91 = !DILocation(line: 62, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !15, line: 62, column: 17)
!93 = !DILocation(line: 62, column: 30, scope: !92)
!94 = !DILocation(line: 62, column: 17, scope: !89)
!95 = !DILocation(line: 64, column: 34, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 63, column: 17)
!97 = !DILocation(line: 64, column: 41, scope: !96)
!98 = !DILocation(line: 64, column: 21, scope: !96)
!99 = !DILocation(line: 65, column: 17, scope: !96)
!100 = !DILocation(line: 62, column: 37, scope: !92)
!101 = !DILocation(line: 62, column: 17, scope: !92)
!102 = distinct !{!102, !94, !103, !79}
!103 = !DILocation(line: 65, column: 17, scope: !89)
!104 = !DILocation(line: 66, column: 13, scope: !85)
!105 = !DILocation(line: 69, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !81, file: !15, line: 68, column: 13)
!107 = !DILocation(line: 71, column: 18, scope: !50)
!108 = !DILocation(line: 71, column: 13, scope: !50)
!109 = !DILocation(line: 73, column: 5, scope: !51)
!110 = !DILocation(line: 74, column: 1, scope: !14)
!111 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_11_good", scope: !15, file: !15, line: 280, type: !16, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 282, column: 5, scope: !111)
!113 = !DILocation(line: 283, column: 5, scope: !111)
!114 = !DILocation(line: 284, column: 5, scope: !111)
!115 = !DILocation(line: 285, column: 5, scope: !111)
!116 = !DILocation(line: 286, column: 1, scope: !111)
!117 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 297, type: !118, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DISubroutineType(types: !119)
!119 = !{!6, !6, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!122 = !DILocalVariable(name: "argc", arg: 1, scope: !117, file: !15, line: 297, type: !6)
!123 = !DILocation(line: 297, column: 14, scope: !117)
!124 = !DILocalVariable(name: "argv", arg: 2, scope: !117, file: !15, line: 297, type: !120)
!125 = !DILocation(line: 297, column: 27, scope: !117)
!126 = !DILocation(line: 300, column: 22, scope: !117)
!127 = !DILocation(line: 300, column: 12, scope: !117)
!128 = !DILocation(line: 300, column: 5, scope: !117)
!129 = !DILocation(line: 302, column: 5, scope: !117)
!130 = !DILocation(line: 303, column: 5, scope: !117)
!131 = !DILocation(line: 304, column: 5, scope: !117)
!132 = !DILocation(line: 307, column: 5, scope: !117)
!133 = !DILocation(line: 308, column: 5, scope: !117)
!134 = !DILocation(line: 309, column: 5, scope: !117)
!135 = !DILocation(line: 311, column: 5, scope: !117)
!136 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !15, line: 83, type: !6)
!138 = !DILocation(line: 83, column: 9, scope: !136)
!139 = !DILocation(line: 85, column: 10, scope: !136)
!140 = !DILocation(line: 86, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !15, line: 86, column: 8)
!142 = !DILocation(line: 86, column: 8, scope: !136)
!143 = !DILocalVariable(name: "inputBuffer", scope: !144, file: !15, line: 89, type: !27)
!144 = distinct !DILexicalBlock(scope: !145, file: !15, line: 88, column: 9)
!145 = distinct !DILexicalBlock(scope: !141, file: !15, line: 87, column: 5)
!146 = !DILocation(line: 89, column: 18, scope: !144)
!147 = !DILocation(line: 91, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 91, column: 17)
!149 = !DILocation(line: 91, column: 53, scope: !148)
!150 = !DILocation(line: 91, column: 17, scope: !148)
!151 = !DILocation(line: 91, column: 60, scope: !148)
!152 = !DILocation(line: 91, column: 17, scope: !144)
!153 = !DILocation(line: 94, column: 29, scope: !154)
!154 = distinct !DILexicalBlock(scope: !148, file: !15, line: 92, column: 13)
!155 = !DILocation(line: 94, column: 24, scope: !154)
!156 = !DILocation(line: 94, column: 22, scope: !154)
!157 = !DILocation(line: 95, column: 13, scope: !154)
!158 = !DILocation(line: 98, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !148, file: !15, line: 97, column: 13)
!160 = !DILocation(line: 101, column: 5, scope: !145)
!161 = !DILocation(line: 102, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !136, file: !15, line: 102, column: 8)
!163 = !DILocation(line: 102, column: 8, scope: !136)
!164 = !DILocation(line: 105, column: 9, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !15, line: 103, column: 5)
!166 = !DILocation(line: 106, column: 5, scope: !165)
!167 = !DILocalVariable(name: "i", scope: !168, file: !15, line: 110, type: !6)
!168 = distinct !DILexicalBlock(scope: !169, file: !15, line: 109, column: 9)
!169 = distinct !DILexicalBlock(scope: !162, file: !15, line: 108, column: 5)
!170 = !DILocation(line: 110, column: 17, scope: !168)
!171 = !DILocalVariable(name: "buffer", scope: !168, file: !15, line: 111, type: !5)
!172 = !DILocation(line: 111, column: 19, scope: !168)
!173 = !DILocation(line: 111, column: 35, scope: !168)
!174 = !DILocation(line: 111, column: 28, scope: !168)
!175 = !DILocation(line: 112, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !168, file: !15, line: 112, column: 17)
!177 = !DILocation(line: 112, column: 24, scope: !176)
!178 = !DILocation(line: 112, column: 17, scope: !168)
!179 = !DILocation(line: 112, column: 34, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 112, column: 33)
!181 = !DILocation(line: 114, column: 20, scope: !182)
!182 = distinct !DILexicalBlock(scope: !168, file: !15, line: 114, column: 13)
!183 = !DILocation(line: 114, column: 18, scope: !182)
!184 = !DILocation(line: 114, column: 25, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !15, line: 114, column: 13)
!186 = !DILocation(line: 114, column: 27, scope: !185)
!187 = !DILocation(line: 114, column: 13, scope: !182)
!188 = !DILocation(line: 116, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 115, column: 13)
!190 = !DILocation(line: 116, column: 24, scope: !189)
!191 = !DILocation(line: 116, column: 27, scope: !189)
!192 = !DILocation(line: 117, column: 13, scope: !189)
!193 = !DILocation(line: 114, column: 34, scope: !185)
!194 = !DILocation(line: 114, column: 13, scope: !185)
!195 = distinct !{!195, !187, !196, !79}
!196 = !DILocation(line: 117, column: 13, scope: !182)
!197 = !DILocation(line: 119, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !168, file: !15, line: 119, column: 17)
!199 = !DILocation(line: 119, column: 22, scope: !198)
!200 = !DILocation(line: 119, column: 27, scope: !198)
!201 = !DILocation(line: 119, column: 30, scope: !198)
!202 = !DILocation(line: 119, column: 35, scope: !198)
!203 = !DILocation(line: 119, column: 17, scope: !168)
!204 = !DILocation(line: 121, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !198, file: !15, line: 120, column: 13)
!206 = !DILocation(line: 121, column: 24, scope: !205)
!207 = !DILocation(line: 121, column: 30, scope: !205)
!208 = !DILocation(line: 123, column: 23, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !15, line: 123, column: 17)
!210 = !DILocation(line: 123, column: 21, scope: !209)
!211 = !DILocation(line: 123, column: 28, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !15, line: 123, column: 17)
!213 = !DILocation(line: 123, column: 30, scope: !212)
!214 = !DILocation(line: 123, column: 17, scope: !209)
!215 = !DILocation(line: 125, column: 34, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !15, line: 124, column: 17)
!217 = !DILocation(line: 125, column: 41, scope: !216)
!218 = !DILocation(line: 125, column: 21, scope: !216)
!219 = !DILocation(line: 126, column: 17, scope: !216)
!220 = !DILocation(line: 123, column: 37, scope: !212)
!221 = !DILocation(line: 123, column: 17, scope: !212)
!222 = distinct !{!222, !214, !223, !79}
!223 = !DILocation(line: 126, column: 17, scope: !209)
!224 = !DILocation(line: 127, column: 13, scope: !205)
!225 = !DILocation(line: 130, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !198, file: !15, line: 129, column: 13)
!227 = !DILocation(line: 132, column: 18, scope: !168)
!228 = !DILocation(line: 132, column: 13, scope: !168)
!229 = !DILocation(line: 135, column: 1, scope: !136)
!230 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!231 = !DILocalVariable(name: "data", scope: !230, file: !15, line: 140, type: !6)
!232 = !DILocation(line: 140, column: 9, scope: !230)
!233 = !DILocation(line: 142, column: 10, scope: !230)
!234 = !DILocation(line: 143, column: 8, scope: !235)
!235 = distinct !DILexicalBlock(scope: !230, file: !15, line: 143, column: 8)
!236 = !DILocation(line: 143, column: 8, scope: !230)
!237 = !DILocalVariable(name: "inputBuffer", scope: !238, file: !15, line: 146, type: !27)
!238 = distinct !DILexicalBlock(scope: !239, file: !15, line: 145, column: 9)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 144, column: 5)
!240 = !DILocation(line: 146, column: 18, scope: !238)
!241 = !DILocation(line: 148, column: 23, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !15, line: 148, column: 17)
!243 = !DILocation(line: 148, column: 53, scope: !242)
!244 = !DILocation(line: 148, column: 17, scope: !242)
!245 = !DILocation(line: 148, column: 60, scope: !242)
!246 = !DILocation(line: 148, column: 17, scope: !238)
!247 = !DILocation(line: 151, column: 29, scope: !248)
!248 = distinct !DILexicalBlock(scope: !242, file: !15, line: 149, column: 13)
!249 = !DILocation(line: 151, column: 24, scope: !248)
!250 = !DILocation(line: 151, column: 22, scope: !248)
!251 = !DILocation(line: 152, column: 13, scope: !248)
!252 = !DILocation(line: 155, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !242, file: !15, line: 154, column: 13)
!254 = !DILocation(line: 158, column: 5, scope: !239)
!255 = !DILocation(line: 159, column: 8, scope: !256)
!256 = distinct !DILexicalBlock(scope: !230, file: !15, line: 159, column: 8)
!257 = !DILocation(line: 159, column: 8, scope: !230)
!258 = !DILocalVariable(name: "i", scope: !259, file: !15, line: 162, type: !6)
!259 = distinct !DILexicalBlock(scope: !260, file: !15, line: 161, column: 9)
!260 = distinct !DILexicalBlock(scope: !256, file: !15, line: 160, column: 5)
!261 = !DILocation(line: 162, column: 17, scope: !259)
!262 = !DILocalVariable(name: "buffer", scope: !259, file: !15, line: 163, type: !5)
!263 = !DILocation(line: 163, column: 19, scope: !259)
!264 = !DILocation(line: 163, column: 35, scope: !259)
!265 = !DILocation(line: 163, column: 28, scope: !259)
!266 = !DILocation(line: 164, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !259, file: !15, line: 164, column: 17)
!268 = !DILocation(line: 164, column: 24, scope: !267)
!269 = !DILocation(line: 164, column: 17, scope: !259)
!270 = !DILocation(line: 164, column: 34, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !15, line: 164, column: 33)
!272 = !DILocation(line: 166, column: 20, scope: !273)
!273 = distinct !DILexicalBlock(scope: !259, file: !15, line: 166, column: 13)
!274 = !DILocation(line: 166, column: 18, scope: !273)
!275 = !DILocation(line: 166, column: 25, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !15, line: 166, column: 13)
!277 = !DILocation(line: 166, column: 27, scope: !276)
!278 = !DILocation(line: 166, column: 13, scope: !273)
!279 = !DILocation(line: 168, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !15, line: 167, column: 13)
!281 = !DILocation(line: 168, column: 24, scope: !280)
!282 = !DILocation(line: 168, column: 27, scope: !280)
!283 = !DILocation(line: 169, column: 13, scope: !280)
!284 = !DILocation(line: 166, column: 34, scope: !276)
!285 = !DILocation(line: 166, column: 13, scope: !276)
!286 = distinct !{!286, !278, !287, !79}
!287 = !DILocation(line: 169, column: 13, scope: !273)
!288 = !DILocation(line: 171, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !259, file: !15, line: 171, column: 17)
!290 = !DILocation(line: 171, column: 22, scope: !289)
!291 = !DILocation(line: 171, column: 27, scope: !289)
!292 = !DILocation(line: 171, column: 30, scope: !289)
!293 = !DILocation(line: 171, column: 35, scope: !289)
!294 = !DILocation(line: 171, column: 17, scope: !259)
!295 = !DILocation(line: 173, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !289, file: !15, line: 172, column: 13)
!297 = !DILocation(line: 173, column: 24, scope: !296)
!298 = !DILocation(line: 173, column: 30, scope: !296)
!299 = !DILocation(line: 175, column: 23, scope: !300)
!300 = distinct !DILexicalBlock(scope: !296, file: !15, line: 175, column: 17)
!301 = !DILocation(line: 175, column: 21, scope: !300)
!302 = !DILocation(line: 175, column: 28, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !15, line: 175, column: 17)
!304 = !DILocation(line: 175, column: 30, scope: !303)
!305 = !DILocation(line: 175, column: 17, scope: !300)
!306 = !DILocation(line: 177, column: 34, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !15, line: 176, column: 17)
!308 = !DILocation(line: 177, column: 41, scope: !307)
!309 = !DILocation(line: 177, column: 21, scope: !307)
!310 = !DILocation(line: 178, column: 17, scope: !307)
!311 = !DILocation(line: 175, column: 37, scope: !303)
!312 = !DILocation(line: 175, column: 17, scope: !303)
!313 = distinct !{!313, !305, !314, !79}
!314 = !DILocation(line: 178, column: 17, scope: !300)
!315 = !DILocation(line: 179, column: 13, scope: !296)
!316 = !DILocation(line: 182, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !289, file: !15, line: 181, column: 13)
!318 = !DILocation(line: 184, column: 18, scope: !259)
!319 = !DILocation(line: 184, column: 13, scope: !259)
!320 = !DILocation(line: 186, column: 5, scope: !260)
!321 = !DILocation(line: 187, column: 1, scope: !230)
!322 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 190, type: !16, scopeLine: 191, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!323 = !DILocalVariable(name: "data", scope: !322, file: !15, line: 192, type: !6)
!324 = !DILocation(line: 192, column: 9, scope: !322)
!325 = !DILocation(line: 194, column: 10, scope: !322)
!326 = !DILocation(line: 195, column: 8, scope: !327)
!327 = distinct !DILexicalBlock(scope: !322, file: !15, line: 195, column: 8)
!328 = !DILocation(line: 195, column: 8, scope: !322)
!329 = !DILocation(line: 198, column: 9, scope: !330)
!330 = distinct !DILexicalBlock(scope: !327, file: !15, line: 196, column: 5)
!331 = !DILocation(line: 199, column: 5, scope: !330)
!332 = !DILocation(line: 204, column: 14, scope: !333)
!333 = distinct !DILexicalBlock(scope: !327, file: !15, line: 201, column: 5)
!334 = !DILocation(line: 206, column: 8, scope: !335)
!335 = distinct !DILexicalBlock(scope: !322, file: !15, line: 206, column: 8)
!336 = !DILocation(line: 206, column: 8, scope: !322)
!337 = !DILocalVariable(name: "i", scope: !338, file: !15, line: 209, type: !6)
!338 = distinct !DILexicalBlock(scope: !339, file: !15, line: 208, column: 9)
!339 = distinct !DILexicalBlock(scope: !335, file: !15, line: 207, column: 5)
!340 = !DILocation(line: 209, column: 17, scope: !338)
!341 = !DILocalVariable(name: "buffer", scope: !338, file: !15, line: 210, type: !5)
!342 = !DILocation(line: 210, column: 19, scope: !338)
!343 = !DILocation(line: 210, column: 35, scope: !338)
!344 = !DILocation(line: 210, column: 28, scope: !338)
!345 = !DILocation(line: 211, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !338, file: !15, line: 211, column: 17)
!347 = !DILocation(line: 211, column: 24, scope: !346)
!348 = !DILocation(line: 211, column: 17, scope: !338)
!349 = !DILocation(line: 211, column: 34, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !15, line: 211, column: 33)
!351 = !DILocation(line: 213, column: 20, scope: !352)
!352 = distinct !DILexicalBlock(scope: !338, file: !15, line: 213, column: 13)
!353 = !DILocation(line: 213, column: 18, scope: !352)
!354 = !DILocation(line: 213, column: 25, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !15, line: 213, column: 13)
!356 = !DILocation(line: 213, column: 27, scope: !355)
!357 = !DILocation(line: 213, column: 13, scope: !352)
!358 = !DILocation(line: 215, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !15, line: 214, column: 13)
!360 = !DILocation(line: 215, column: 24, scope: !359)
!361 = !DILocation(line: 215, column: 27, scope: !359)
!362 = !DILocation(line: 216, column: 13, scope: !359)
!363 = !DILocation(line: 213, column: 34, scope: !355)
!364 = !DILocation(line: 213, column: 13, scope: !355)
!365 = distinct !{!365, !357, !366, !79}
!366 = !DILocation(line: 216, column: 13, scope: !352)
!367 = !DILocation(line: 219, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !338, file: !15, line: 219, column: 17)
!369 = !DILocation(line: 219, column: 22, scope: !368)
!370 = !DILocation(line: 219, column: 17, scope: !338)
!371 = !DILocation(line: 221, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !15, line: 220, column: 13)
!373 = !DILocation(line: 221, column: 24, scope: !372)
!374 = !DILocation(line: 221, column: 30, scope: !372)
!375 = !DILocation(line: 223, column: 23, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !15, line: 223, column: 17)
!377 = !DILocation(line: 223, column: 21, scope: !376)
!378 = !DILocation(line: 223, column: 28, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !15, line: 223, column: 17)
!380 = !DILocation(line: 223, column: 30, scope: !379)
!381 = !DILocation(line: 223, column: 17, scope: !376)
!382 = !DILocation(line: 225, column: 34, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !15, line: 224, column: 17)
!384 = !DILocation(line: 225, column: 41, scope: !383)
!385 = !DILocation(line: 225, column: 21, scope: !383)
!386 = !DILocation(line: 226, column: 17, scope: !383)
!387 = !DILocation(line: 223, column: 37, scope: !379)
!388 = !DILocation(line: 223, column: 17, scope: !379)
!389 = distinct !{!389, !381, !390, !79}
!390 = !DILocation(line: 226, column: 17, scope: !376)
!391 = !DILocation(line: 227, column: 13, scope: !372)
!392 = !DILocation(line: 230, column: 17, scope: !393)
!393 = distinct !DILexicalBlock(scope: !368, file: !15, line: 229, column: 13)
!394 = !DILocation(line: 232, column: 18, scope: !338)
!395 = !DILocation(line: 232, column: 13, scope: !338)
!396 = !DILocation(line: 234, column: 5, scope: !339)
!397 = !DILocation(line: 235, column: 1, scope: !322)
!398 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 238, type: !16, scopeLine: 239, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!399 = !DILocalVariable(name: "data", scope: !398, file: !15, line: 240, type: !6)
!400 = !DILocation(line: 240, column: 9, scope: !398)
!401 = !DILocation(line: 242, column: 10, scope: !398)
!402 = !DILocation(line: 243, column: 8, scope: !403)
!403 = distinct !DILexicalBlock(scope: !398, file: !15, line: 243, column: 8)
!404 = !DILocation(line: 243, column: 8, scope: !398)
!405 = !DILocation(line: 247, column: 14, scope: !406)
!406 = distinct !DILexicalBlock(scope: !403, file: !15, line: 244, column: 5)
!407 = !DILocation(line: 248, column: 5, scope: !406)
!408 = !DILocation(line: 249, column: 8, scope: !409)
!409 = distinct !DILexicalBlock(scope: !398, file: !15, line: 249, column: 8)
!410 = !DILocation(line: 249, column: 8, scope: !398)
!411 = !DILocalVariable(name: "i", scope: !412, file: !15, line: 252, type: !6)
!412 = distinct !DILexicalBlock(scope: !413, file: !15, line: 251, column: 9)
!413 = distinct !DILexicalBlock(scope: !409, file: !15, line: 250, column: 5)
!414 = !DILocation(line: 252, column: 17, scope: !412)
!415 = !DILocalVariable(name: "buffer", scope: !412, file: !15, line: 253, type: !5)
!416 = !DILocation(line: 253, column: 19, scope: !412)
!417 = !DILocation(line: 253, column: 35, scope: !412)
!418 = !DILocation(line: 253, column: 28, scope: !412)
!419 = !DILocation(line: 254, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !412, file: !15, line: 254, column: 17)
!421 = !DILocation(line: 254, column: 24, scope: !420)
!422 = !DILocation(line: 254, column: 17, scope: !412)
!423 = !DILocation(line: 254, column: 34, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !15, line: 254, column: 33)
!425 = !DILocation(line: 256, column: 20, scope: !426)
!426 = distinct !DILexicalBlock(scope: !412, file: !15, line: 256, column: 13)
!427 = !DILocation(line: 256, column: 18, scope: !426)
!428 = !DILocation(line: 256, column: 25, scope: !429)
!429 = distinct !DILexicalBlock(scope: !426, file: !15, line: 256, column: 13)
!430 = !DILocation(line: 256, column: 27, scope: !429)
!431 = !DILocation(line: 256, column: 13, scope: !426)
!432 = !DILocation(line: 258, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !15, line: 257, column: 13)
!434 = !DILocation(line: 258, column: 24, scope: !433)
!435 = !DILocation(line: 258, column: 27, scope: !433)
!436 = !DILocation(line: 259, column: 13, scope: !433)
!437 = !DILocation(line: 256, column: 34, scope: !429)
!438 = !DILocation(line: 256, column: 13, scope: !429)
!439 = distinct !{!439, !431, !440, !79}
!440 = !DILocation(line: 259, column: 13, scope: !426)
!441 = !DILocation(line: 262, column: 17, scope: !442)
!442 = distinct !DILexicalBlock(scope: !412, file: !15, line: 262, column: 17)
!443 = !DILocation(line: 262, column: 22, scope: !442)
!444 = !DILocation(line: 262, column: 17, scope: !412)
!445 = !DILocation(line: 264, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !15, line: 263, column: 13)
!447 = !DILocation(line: 264, column: 24, scope: !446)
!448 = !DILocation(line: 264, column: 30, scope: !446)
!449 = !DILocation(line: 266, column: 23, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !15, line: 266, column: 17)
!451 = !DILocation(line: 266, column: 21, scope: !450)
!452 = !DILocation(line: 266, column: 28, scope: !453)
!453 = distinct !DILexicalBlock(scope: !450, file: !15, line: 266, column: 17)
!454 = !DILocation(line: 266, column: 30, scope: !453)
!455 = !DILocation(line: 266, column: 17, scope: !450)
!456 = !DILocation(line: 268, column: 34, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !15, line: 267, column: 17)
!458 = !DILocation(line: 268, column: 41, scope: !457)
!459 = !DILocation(line: 268, column: 21, scope: !457)
!460 = !DILocation(line: 269, column: 17, scope: !457)
!461 = !DILocation(line: 266, column: 37, scope: !453)
!462 = !DILocation(line: 266, column: 17, scope: !453)
!463 = distinct !{!463, !455, !464, !79}
!464 = !DILocation(line: 269, column: 17, scope: !450)
!465 = !DILocation(line: 270, column: 13, scope: !446)
!466 = !DILocation(line: 273, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !442, file: !15, line: 272, column: 13)
!468 = !DILocation(line: 275, column: 18, scope: !412)
!469 = !DILocation(line: 275, column: 13, scope: !412)
!470 = !DILocation(line: 277, column: 5, scope: !413)
!471 = !DILocation(line: 278, column: 1, scope: !398)
