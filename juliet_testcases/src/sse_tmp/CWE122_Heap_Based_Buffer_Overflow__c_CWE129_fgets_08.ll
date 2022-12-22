; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
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
  %call6 = call i32 @staticReturnsTrue(), !dbg !46
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08_good() #0 !dbg !111 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08_good(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08_bad(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !134
  ret i32 0, !dbg !135
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !136 {
entry:
  ret i32 1, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !140 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !141, metadata !DIExpression()), !dbg !142
  store i32 -1, i32* %data, align 4, !dbg !143
  %call = call i32 @staticReturnsTrue(), !dbg !144
  %tobool = icmp ne i32 %call, 0, !dbg !144
  br i1 %tobool, label %if.then, label %if.end5, !dbg !146

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !147, metadata !DIExpression()), !dbg !150
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !150
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !151
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !153
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !154
  %cmp = icmp ne i8* %call1, null, !dbg !155
  br i1 %cmp, label %if.then2, label %if.else, !dbg !156

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !159
  store i32 %call4, i32* %data, align 4, !dbg !160
  br label %if.end, !dbg !161

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !162
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !164

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsFalse(), !dbg !165
  %tobool7 = icmp ne i32 %call6, 0, !dbg !165
  br i1 %tobool7, label %if.then8, label %if.else9, !dbg !167

if.then8:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !168
  br label %if.end30, !dbg !170

if.else9:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !171, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !175, metadata !DIExpression()), !dbg !176
  %call10 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !177
  %2 = bitcast i8* %call10 to i32*, !dbg !178
  store i32* %2, i32** %buffer, align 8, !dbg !176
  %3 = load i32*, i32** %buffer, align 8, !dbg !179
  %cmp11 = icmp eq i32* %3, null, !dbg !181
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !182

if.then12:                                        ; preds = %if.else9
  call void @exit(i32 -1) #9, !dbg !183
  unreachable, !dbg !183

if.end13:                                         ; preds = %if.else9
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end13
  %4 = load i32, i32* %i, align 4, !dbg !188
  %cmp14 = icmp slt i32 %4, 10, !dbg !190
  br i1 %cmp14, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !192
  %6 = load i32, i32* %i, align 4, !dbg !194
  %idxprom = sext i32 %6 to i64, !dbg !192
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !192
  store i32 0, i32* %arrayidx, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %7, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !201
  %cmp15 = icmp sge i32 %8, 0, !dbg !203
  br i1 %cmp15, label %land.lhs.true, label %if.else28, !dbg !204

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !205
  %cmp16 = icmp slt i32 %9, 10, !dbg !206
  br i1 %cmp16, label %if.then17, label %if.else28, !dbg !207

if.then17:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !208
  %11 = load i32, i32* %data, align 4, !dbg !210
  %idxprom18 = sext i32 %11 to i64, !dbg !208
  %arrayidx19 = getelementptr inbounds i32, i32* %10, i64 %idxprom18, !dbg !208
  store i32 1, i32* %arrayidx19, align 4, !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond20, !dbg !214

for.cond20:                                       ; preds = %for.inc25, %if.then17
  %12 = load i32, i32* %i, align 4, !dbg !215
  %cmp21 = icmp slt i32 %12, 10, !dbg !217
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !218

for.body22:                                       ; preds = %for.cond20
  %13 = load i32*, i32** %buffer, align 8, !dbg !219
  %14 = load i32, i32* %i, align 4, !dbg !221
  %idxprom23 = sext i32 %14 to i64, !dbg !219
  %arrayidx24 = getelementptr inbounds i32, i32* %13, i64 %idxprom23, !dbg !219
  %15 = load i32, i32* %arrayidx24, align 4, !dbg !219
  call void @printIntLine(i32 %15), !dbg !222
  br label %for.inc25, !dbg !223

for.inc25:                                        ; preds = %for.body22
  %16 = load i32, i32* %i, align 4, !dbg !224
  %inc26 = add nsw i32 %16, 1, !dbg !224
  store i32 %inc26, i32* %i, align 4, !dbg !224
  br label %for.cond20, !dbg !225, !llvm.loop !226

for.end27:                                        ; preds = %for.cond20
  br label %if.end29, !dbg !228

if.else28:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !229
  br label %if.end29

if.end29:                                         ; preds = %if.else28, %for.end27
  %17 = load i32*, i32** %buffer, align 8, !dbg !231
  %18 = bitcast i32* %17 to i8*, !dbg !231
  call void @free(i8* %18) #8, !dbg !232
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then8
  ret void, !dbg !233
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !234 {
entry:
  ret i32 0, !dbg !235
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !236 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %data, align 4, !dbg !239
  %call = call i32 @staticReturnsTrue(), !dbg !240
  %tobool = icmp ne i32 %call, 0, !dbg !240
  br i1 %tobool, label %if.then, label %if.end5, !dbg !242

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !243, metadata !DIExpression()), !dbg !246
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !246
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !246
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !247
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !249
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !250
  %cmp = icmp ne i8* %call1, null, !dbg !251
  br i1 %cmp, label %if.then2, label %if.else, !dbg !252

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !253
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !255
  store i32 %call4, i32* %data, align 4, !dbg !256
  br label %if.end, !dbg !257

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !258
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !260

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !261
  %tobool7 = icmp ne i32 %call6, 0, !dbg !261
  br i1 %tobool7, label %if.then8, label %if.end29, !dbg !263

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !268, metadata !DIExpression()), !dbg !269
  %call9 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !270
  %2 = bitcast i8* %call9 to i32*, !dbg !271
  store i32* %2, i32** %buffer, align 8, !dbg !269
  %3 = load i32*, i32** %buffer, align 8, !dbg !272
  %cmp10 = icmp eq i32* %3, null, !dbg !274
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !275

if.then11:                                        ; preds = %if.then8
  call void @exit(i32 -1) #9, !dbg !276
  unreachable, !dbg !276

if.end12:                                         ; preds = %if.then8
  store i32 0, i32* %i, align 4, !dbg !278
  br label %for.cond, !dbg !280

for.cond:                                         ; preds = %for.inc, %if.end12
  %4 = load i32, i32* %i, align 4, !dbg !281
  %cmp13 = icmp slt i32 %4, 10, !dbg !283
  br i1 %cmp13, label %for.body, label %for.end, !dbg !284

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !285
  %6 = load i32, i32* %i, align 4, !dbg !287
  %idxprom = sext i32 %6 to i64, !dbg !285
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !285
  store i32 0, i32* %arrayidx, align 4, !dbg !288
  br label %for.inc, !dbg !289

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !290
  %inc = add nsw i32 %7, 1, !dbg !290
  store i32 %inc, i32* %i, align 4, !dbg !290
  br label %for.cond, !dbg !291, !llvm.loop !292

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !294
  %cmp14 = icmp sge i32 %8, 0, !dbg !296
  br i1 %cmp14, label %land.lhs.true, label %if.else27, !dbg !297

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !298
  %cmp15 = icmp slt i32 %9, 10, !dbg !299
  br i1 %cmp15, label %if.then16, label %if.else27, !dbg !300

if.then16:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !301
  %11 = load i32, i32* %data, align 4, !dbg !303
  %idxprom17 = sext i32 %11 to i64, !dbg !301
  %arrayidx18 = getelementptr inbounds i32, i32* %10, i64 %idxprom17, !dbg !301
  store i32 1, i32* %arrayidx18, align 4, !dbg !304
  store i32 0, i32* %i, align 4, !dbg !305
  br label %for.cond19, !dbg !307

for.cond19:                                       ; preds = %for.inc24, %if.then16
  %12 = load i32, i32* %i, align 4, !dbg !308
  %cmp20 = icmp slt i32 %12, 10, !dbg !310
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !311

for.body21:                                       ; preds = %for.cond19
  %13 = load i32*, i32** %buffer, align 8, !dbg !312
  %14 = load i32, i32* %i, align 4, !dbg !314
  %idxprom22 = sext i32 %14 to i64, !dbg !312
  %arrayidx23 = getelementptr inbounds i32, i32* %13, i64 %idxprom22, !dbg !312
  %15 = load i32, i32* %arrayidx23, align 4, !dbg !312
  call void @printIntLine(i32 %15), !dbg !315
  br label %for.inc24, !dbg !316

for.inc24:                                        ; preds = %for.body21
  %16 = load i32, i32* %i, align 4, !dbg !317
  %inc25 = add nsw i32 %16, 1, !dbg !317
  store i32 %inc25, i32* %i, align 4, !dbg !317
  br label %for.cond19, !dbg !318, !llvm.loop !319

for.end26:                                        ; preds = %for.cond19
  br label %if.end28, !dbg !321

if.else27:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !322
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %for.end26
  %17 = load i32*, i32** %buffer, align 8, !dbg !324
  %18 = bitcast i32* %17 to i8*, !dbg !324
  call void @free(i8* %18) #8, !dbg !325
  br label %if.end29, !dbg !326

if.end29:                                         ; preds = %if.end28, %if.end5
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !328 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 -1, i32* %data, align 4, !dbg !331
  %call = call i32 @staticReturnsFalse(), !dbg !332
  %tobool = icmp ne i32 %call, 0, !dbg !332
  br i1 %tobool, label %if.then, label %if.else, !dbg !334

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !335
  br label %if.end, !dbg !337

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !338
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !340
  %tobool2 = icmp ne i32 %call1, 0, !dbg !340
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !342

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !343, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !347, metadata !DIExpression()), !dbg !348
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !349
  %0 = bitcast i8* %call4 to i32*, !dbg !350
  store i32* %0, i32** %buffer, align 8, !dbg !348
  %1 = load i32*, i32** %buffer, align 8, !dbg !351
  %cmp = icmp eq i32* %1, null, !dbg !353
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !354

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #9, !dbg !355
  unreachable, !dbg !355

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !357
  br label %for.cond, !dbg !359

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !360
  %cmp7 = icmp slt i32 %2, 10, !dbg !362
  br i1 %cmp7, label %for.body, label %for.end, !dbg !363

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !364
  %4 = load i32, i32* %i, align 4, !dbg !366
  %idxprom = sext i32 %4 to i64, !dbg !364
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !364
  store i32 0, i32* %arrayidx, align 4, !dbg !367
  br label %for.inc, !dbg !368

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !369
  %inc = add nsw i32 %5, 1, !dbg !369
  store i32 %inc, i32* %i, align 4, !dbg !369
  br label %for.cond, !dbg !370, !llvm.loop !371

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !373
  %cmp8 = icmp sge i32 %6, 0, !dbg !375
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !376

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !377
  %8 = load i32, i32* %data, align 4, !dbg !379
  %idxprom10 = sext i32 %8 to i64, !dbg !377
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !377
  store i32 1, i32* %arrayidx11, align 4, !dbg !380
  store i32 0, i32* %i, align 4, !dbg !381
  br label %for.cond12, !dbg !383

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !384
  %cmp13 = icmp slt i32 %9, 10, !dbg !386
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !387

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !388
  %11 = load i32, i32* %i, align 4, !dbg !390
  %idxprom15 = sext i32 %11 to i64, !dbg !388
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !388
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !388
  call void @printIntLine(i32 %12), !dbg !391
  br label %for.inc17, !dbg !392

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !393
  %inc18 = add nsw i32 %13, 1, !dbg !393
  store i32 %inc18, i32* %i, align 4, !dbg !393
  br label %for.cond12, !dbg !394, !llvm.loop !395

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !397

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !398
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !400
  %15 = bitcast i32* %14 to i8*, !dbg !400
  call void @free(i8* %15) #8, !dbg !401
  br label %if.end22, !dbg !402

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !403
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !404 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !405, metadata !DIExpression()), !dbg !406
  store i32 -1, i32* %data, align 4, !dbg !407
  %call = call i32 @staticReturnsTrue(), !dbg !408
  %tobool = icmp ne i32 %call, 0, !dbg !408
  br i1 %tobool, label %if.then, label %if.end, !dbg !410

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !411
  br label %if.end, !dbg !413

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !414
  %tobool2 = icmp ne i32 %call1, 0, !dbg !414
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !416

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !417, metadata !DIExpression()), !dbg !420
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !421, metadata !DIExpression()), !dbg !422
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !423
  %0 = bitcast i8* %call4 to i32*, !dbg !424
  store i32* %0, i32** %buffer, align 8, !dbg !422
  %1 = load i32*, i32** %buffer, align 8, !dbg !425
  %cmp = icmp eq i32* %1, null, !dbg !427
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !428

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #9, !dbg !429
  unreachable, !dbg !429

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !431
  br label %for.cond, !dbg !433

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !434
  %cmp7 = icmp slt i32 %2, 10, !dbg !436
  br i1 %cmp7, label %for.body, label %for.end, !dbg !437

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !438
  %4 = load i32, i32* %i, align 4, !dbg !440
  %idxprom = sext i32 %4 to i64, !dbg !438
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !438
  store i32 0, i32* %arrayidx, align 4, !dbg !441
  br label %for.inc, !dbg !442

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !443
  %inc = add nsw i32 %5, 1, !dbg !443
  store i32 %inc, i32* %i, align 4, !dbg !443
  br label %for.cond, !dbg !444, !llvm.loop !445

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !447
  %cmp8 = icmp sge i32 %6, 0, !dbg !449
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !450

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !451
  %8 = load i32, i32* %data, align 4, !dbg !453
  %idxprom10 = sext i32 %8 to i64, !dbg !451
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !451
  store i32 1, i32* %arrayidx11, align 4, !dbg !454
  store i32 0, i32* %i, align 4, !dbg !455
  br label %for.cond12, !dbg !457

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !458
  %cmp13 = icmp slt i32 %9, 10, !dbg !460
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !461

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !462
  %11 = load i32, i32* %i, align 4, !dbg !464
  %idxprom15 = sext i32 %11 to i64, !dbg !462
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !462
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !462
  call void @printIntLine(i32 %12), !dbg !465
  br label %for.inc17, !dbg !466

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !467
  %inc18 = add nsw i32 %13, 1, !dbg !467
  store i32 %inc18, i32* %i, align 4, !dbg !467
  br label %for.cond12, !dbg !468, !llvm.loop !469

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !471

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !472
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !474
  %15 = bitcast i32* %14 to i8*, !dbg !474
  call void @free(i8* %15) #8, !dbg !475
  br label %if.end21, !dbg !476

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !477
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !6)
!19 = !DILocation(line: 39, column: 9, scope: !14)
!20 = !DILocation(line: 41, column: 10, scope: !14)
!21 = !DILocation(line: 42, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 8)
!23 = !DILocation(line: 42, column: 8, scope: !14)
!24 = !DILocalVariable(name: "inputBuffer", scope: !25, file: !15, line: 45, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 44, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 43, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 45, column: 18, scope: !25)
!32 = !DILocation(line: 47, column: 23, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !15, line: 47, column: 17)
!34 = !DILocation(line: 47, column: 53, scope: !33)
!35 = !DILocation(line: 47, column: 17, scope: !33)
!36 = !DILocation(line: 47, column: 60, scope: !33)
!37 = !DILocation(line: 47, column: 17, scope: !25)
!38 = !DILocation(line: 50, column: 29, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !15, line: 48, column: 13)
!40 = !DILocation(line: 50, column: 24, scope: !39)
!41 = !DILocation(line: 50, column: 22, scope: !39)
!42 = !DILocation(line: 51, column: 13, scope: !39)
!43 = !DILocation(line: 54, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !15, line: 53, column: 13)
!45 = !DILocation(line: 57, column: 5, scope: !26)
!46 = !DILocation(line: 58, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 58, column: 8)
!48 = !DILocation(line: 58, column: 8, scope: !14)
!49 = !DILocalVariable(name: "i", scope: !50, file: !15, line: 61, type: !6)
!50 = distinct !DILexicalBlock(scope: !51, file: !15, line: 60, column: 9)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 59, column: 5)
!52 = !DILocation(line: 61, column: 17, scope: !50)
!53 = !DILocalVariable(name: "buffer", scope: !50, file: !15, line: 62, type: !5)
!54 = !DILocation(line: 62, column: 19, scope: !50)
!55 = !DILocation(line: 62, column: 35, scope: !50)
!56 = !DILocation(line: 62, column: 28, scope: !50)
!57 = !DILocation(line: 63, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !50, file: !15, line: 63, column: 17)
!59 = !DILocation(line: 63, column: 24, scope: !58)
!60 = !DILocation(line: 63, column: 17, scope: !50)
!61 = !DILocation(line: 63, column: 34, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 63, column: 33)
!63 = !DILocation(line: 65, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !15, line: 65, column: 13)
!65 = !DILocation(line: 65, column: 18, scope: !64)
!66 = !DILocation(line: 65, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 65, column: 13)
!68 = !DILocation(line: 65, column: 27, scope: !67)
!69 = !DILocation(line: 65, column: 13, scope: !64)
!70 = !DILocation(line: 67, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 66, column: 13)
!72 = !DILocation(line: 67, column: 24, scope: !71)
!73 = !DILocation(line: 67, column: 27, scope: !71)
!74 = !DILocation(line: 68, column: 13, scope: !71)
!75 = !DILocation(line: 65, column: 34, scope: !67)
!76 = !DILocation(line: 65, column: 13, scope: !67)
!77 = distinct !{!77, !69, !78, !79}
!78 = !DILocation(line: 68, column: 13, scope: !64)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 71, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !50, file: !15, line: 71, column: 17)
!82 = !DILocation(line: 71, column: 22, scope: !81)
!83 = !DILocation(line: 71, column: 17, scope: !50)
!84 = !DILocation(line: 73, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 72, column: 13)
!86 = !DILocation(line: 73, column: 24, scope: !85)
!87 = !DILocation(line: 73, column: 30, scope: !85)
!88 = !DILocation(line: 75, column: 23, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 75, column: 17)
!90 = !DILocation(line: 75, column: 21, scope: !89)
!91 = !DILocation(line: 75, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !15, line: 75, column: 17)
!93 = !DILocation(line: 75, column: 30, scope: !92)
!94 = !DILocation(line: 75, column: 17, scope: !89)
!95 = !DILocation(line: 77, column: 34, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 76, column: 17)
!97 = !DILocation(line: 77, column: 41, scope: !96)
!98 = !DILocation(line: 77, column: 21, scope: !96)
!99 = !DILocation(line: 78, column: 17, scope: !96)
!100 = !DILocation(line: 75, column: 37, scope: !92)
!101 = !DILocation(line: 75, column: 17, scope: !92)
!102 = distinct !{!102, !94, !103, !79}
!103 = !DILocation(line: 78, column: 17, scope: !89)
!104 = !DILocation(line: 79, column: 13, scope: !85)
!105 = !DILocation(line: 82, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !81, file: !15, line: 81, column: 13)
!107 = !DILocation(line: 84, column: 18, scope: !50)
!108 = !DILocation(line: 84, column: 13, scope: !50)
!109 = !DILocation(line: 86, column: 5, scope: !51)
!110 = !DILocation(line: 87, column: 1, scope: !14)
!111 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_08_good", scope: !15, file: !15, line: 293, type: !16, scopeLine: 294, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 295, column: 5, scope: !111)
!113 = !DILocation(line: 296, column: 5, scope: !111)
!114 = !DILocation(line: 297, column: 5, scope: !111)
!115 = !DILocation(line: 298, column: 5, scope: !111)
!116 = !DILocation(line: 299, column: 1, scope: !111)
!117 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 310, type: !118, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DISubroutineType(types: !119)
!119 = !{!6, !6, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!122 = !DILocalVariable(name: "argc", arg: 1, scope: !117, file: !15, line: 310, type: !6)
!123 = !DILocation(line: 310, column: 14, scope: !117)
!124 = !DILocalVariable(name: "argv", arg: 2, scope: !117, file: !15, line: 310, type: !120)
!125 = !DILocation(line: 310, column: 27, scope: !117)
!126 = !DILocation(line: 313, column: 22, scope: !117)
!127 = !DILocation(line: 313, column: 12, scope: !117)
!128 = !DILocation(line: 313, column: 5, scope: !117)
!129 = !DILocation(line: 315, column: 5, scope: !117)
!130 = !DILocation(line: 316, column: 5, scope: !117)
!131 = !DILocation(line: 317, column: 5, scope: !117)
!132 = !DILocation(line: 320, column: 5, scope: !117)
!133 = !DILocation(line: 321, column: 5, scope: !117)
!134 = !DILocation(line: 322, column: 5, scope: !117)
!135 = !DILocation(line: 324, column: 5, scope: !117)
!136 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !137, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DISubroutineType(types: !138)
!138 = !{!6}
!139 = !DILocation(line: 27, column: 5, scope: !136)
!140 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DILocalVariable(name: "data", scope: !140, file: !15, line: 96, type: !6)
!142 = !DILocation(line: 96, column: 9, scope: !140)
!143 = !DILocation(line: 98, column: 10, scope: !140)
!144 = !DILocation(line: 99, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 99, column: 8)
!146 = !DILocation(line: 99, column: 8, scope: !140)
!147 = !DILocalVariable(name: "inputBuffer", scope: !148, file: !15, line: 102, type: !27)
!148 = distinct !DILexicalBlock(scope: !149, file: !15, line: 101, column: 9)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 100, column: 5)
!150 = !DILocation(line: 102, column: 18, scope: !148)
!151 = !DILocation(line: 104, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 104, column: 17)
!153 = !DILocation(line: 104, column: 53, scope: !152)
!154 = !DILocation(line: 104, column: 17, scope: !152)
!155 = !DILocation(line: 104, column: 60, scope: !152)
!156 = !DILocation(line: 104, column: 17, scope: !148)
!157 = !DILocation(line: 107, column: 29, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !15, line: 105, column: 13)
!159 = !DILocation(line: 107, column: 24, scope: !158)
!160 = !DILocation(line: 107, column: 22, scope: !158)
!161 = !DILocation(line: 108, column: 13, scope: !158)
!162 = !DILocation(line: 111, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !152, file: !15, line: 110, column: 13)
!164 = !DILocation(line: 114, column: 5, scope: !149)
!165 = !DILocation(line: 115, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !140, file: !15, line: 115, column: 8)
!167 = !DILocation(line: 115, column: 8, scope: !140)
!168 = !DILocation(line: 118, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 116, column: 5)
!170 = !DILocation(line: 119, column: 5, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !15, line: 123, type: !6)
!172 = distinct !DILexicalBlock(scope: !173, file: !15, line: 122, column: 9)
!173 = distinct !DILexicalBlock(scope: !166, file: !15, line: 121, column: 5)
!174 = !DILocation(line: 123, column: 17, scope: !172)
!175 = !DILocalVariable(name: "buffer", scope: !172, file: !15, line: 124, type: !5)
!176 = !DILocation(line: 124, column: 19, scope: !172)
!177 = !DILocation(line: 124, column: 35, scope: !172)
!178 = !DILocation(line: 124, column: 28, scope: !172)
!179 = !DILocation(line: 125, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !172, file: !15, line: 125, column: 17)
!181 = !DILocation(line: 125, column: 24, scope: !180)
!182 = !DILocation(line: 125, column: 17, scope: !172)
!183 = !DILocation(line: 125, column: 34, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !15, line: 125, column: 33)
!185 = !DILocation(line: 127, column: 20, scope: !186)
!186 = distinct !DILexicalBlock(scope: !172, file: !15, line: 127, column: 13)
!187 = !DILocation(line: 127, column: 18, scope: !186)
!188 = !DILocation(line: 127, column: 25, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !15, line: 127, column: 13)
!190 = !DILocation(line: 127, column: 27, scope: !189)
!191 = !DILocation(line: 127, column: 13, scope: !186)
!192 = !DILocation(line: 129, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !15, line: 128, column: 13)
!194 = !DILocation(line: 129, column: 24, scope: !193)
!195 = !DILocation(line: 129, column: 27, scope: !193)
!196 = !DILocation(line: 130, column: 13, scope: !193)
!197 = !DILocation(line: 127, column: 34, scope: !189)
!198 = !DILocation(line: 127, column: 13, scope: !189)
!199 = distinct !{!199, !191, !200, !79}
!200 = !DILocation(line: 130, column: 13, scope: !186)
!201 = !DILocation(line: 132, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !172, file: !15, line: 132, column: 17)
!203 = !DILocation(line: 132, column: 22, scope: !202)
!204 = !DILocation(line: 132, column: 27, scope: !202)
!205 = !DILocation(line: 132, column: 30, scope: !202)
!206 = !DILocation(line: 132, column: 35, scope: !202)
!207 = !DILocation(line: 132, column: 17, scope: !172)
!208 = !DILocation(line: 134, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !202, file: !15, line: 133, column: 13)
!210 = !DILocation(line: 134, column: 24, scope: !209)
!211 = !DILocation(line: 134, column: 30, scope: !209)
!212 = !DILocation(line: 136, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !15, line: 136, column: 17)
!214 = !DILocation(line: 136, column: 21, scope: !213)
!215 = !DILocation(line: 136, column: 28, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 136, column: 17)
!217 = !DILocation(line: 136, column: 30, scope: !216)
!218 = !DILocation(line: 136, column: 17, scope: !213)
!219 = !DILocation(line: 138, column: 34, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 137, column: 17)
!221 = !DILocation(line: 138, column: 41, scope: !220)
!222 = !DILocation(line: 138, column: 21, scope: !220)
!223 = !DILocation(line: 139, column: 17, scope: !220)
!224 = !DILocation(line: 136, column: 37, scope: !216)
!225 = !DILocation(line: 136, column: 17, scope: !216)
!226 = distinct !{!226, !218, !227, !79}
!227 = !DILocation(line: 139, column: 17, scope: !213)
!228 = !DILocation(line: 140, column: 13, scope: !209)
!229 = !DILocation(line: 143, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !202, file: !15, line: 142, column: 13)
!231 = !DILocation(line: 145, column: 18, scope: !172)
!232 = !DILocation(line: 145, column: 13, scope: !172)
!233 = !DILocation(line: 148, column: 1, scope: !140)
!234 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !137, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!235 = !DILocation(line: 32, column: 5, scope: !234)
!236 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 151, type: !16, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!237 = !DILocalVariable(name: "data", scope: !236, file: !15, line: 153, type: !6)
!238 = !DILocation(line: 153, column: 9, scope: !236)
!239 = !DILocation(line: 155, column: 10, scope: !236)
!240 = !DILocation(line: 156, column: 8, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !15, line: 156, column: 8)
!242 = !DILocation(line: 156, column: 8, scope: !236)
!243 = !DILocalVariable(name: "inputBuffer", scope: !244, file: !15, line: 159, type: !27)
!244 = distinct !DILexicalBlock(scope: !245, file: !15, line: 158, column: 9)
!245 = distinct !DILexicalBlock(scope: !241, file: !15, line: 157, column: 5)
!246 = !DILocation(line: 159, column: 18, scope: !244)
!247 = !DILocation(line: 161, column: 23, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !15, line: 161, column: 17)
!249 = !DILocation(line: 161, column: 53, scope: !248)
!250 = !DILocation(line: 161, column: 17, scope: !248)
!251 = !DILocation(line: 161, column: 60, scope: !248)
!252 = !DILocation(line: 161, column: 17, scope: !244)
!253 = !DILocation(line: 164, column: 29, scope: !254)
!254 = distinct !DILexicalBlock(scope: !248, file: !15, line: 162, column: 13)
!255 = !DILocation(line: 164, column: 24, scope: !254)
!256 = !DILocation(line: 164, column: 22, scope: !254)
!257 = !DILocation(line: 165, column: 13, scope: !254)
!258 = !DILocation(line: 168, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !248, file: !15, line: 167, column: 13)
!260 = !DILocation(line: 171, column: 5, scope: !245)
!261 = !DILocation(line: 172, column: 8, scope: !262)
!262 = distinct !DILexicalBlock(scope: !236, file: !15, line: 172, column: 8)
!263 = !DILocation(line: 172, column: 8, scope: !236)
!264 = !DILocalVariable(name: "i", scope: !265, file: !15, line: 175, type: !6)
!265 = distinct !DILexicalBlock(scope: !266, file: !15, line: 174, column: 9)
!266 = distinct !DILexicalBlock(scope: !262, file: !15, line: 173, column: 5)
!267 = !DILocation(line: 175, column: 17, scope: !265)
!268 = !DILocalVariable(name: "buffer", scope: !265, file: !15, line: 176, type: !5)
!269 = !DILocation(line: 176, column: 19, scope: !265)
!270 = !DILocation(line: 176, column: 35, scope: !265)
!271 = !DILocation(line: 176, column: 28, scope: !265)
!272 = !DILocation(line: 177, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !265, file: !15, line: 177, column: 17)
!274 = !DILocation(line: 177, column: 24, scope: !273)
!275 = !DILocation(line: 177, column: 17, scope: !265)
!276 = !DILocation(line: 177, column: 34, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !15, line: 177, column: 33)
!278 = !DILocation(line: 179, column: 20, scope: !279)
!279 = distinct !DILexicalBlock(scope: !265, file: !15, line: 179, column: 13)
!280 = !DILocation(line: 179, column: 18, scope: !279)
!281 = !DILocation(line: 179, column: 25, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !15, line: 179, column: 13)
!283 = !DILocation(line: 179, column: 27, scope: !282)
!284 = !DILocation(line: 179, column: 13, scope: !279)
!285 = !DILocation(line: 181, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !15, line: 180, column: 13)
!287 = !DILocation(line: 181, column: 24, scope: !286)
!288 = !DILocation(line: 181, column: 27, scope: !286)
!289 = !DILocation(line: 182, column: 13, scope: !286)
!290 = !DILocation(line: 179, column: 34, scope: !282)
!291 = !DILocation(line: 179, column: 13, scope: !282)
!292 = distinct !{!292, !284, !293, !79}
!293 = !DILocation(line: 182, column: 13, scope: !279)
!294 = !DILocation(line: 184, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !265, file: !15, line: 184, column: 17)
!296 = !DILocation(line: 184, column: 22, scope: !295)
!297 = !DILocation(line: 184, column: 27, scope: !295)
!298 = !DILocation(line: 184, column: 30, scope: !295)
!299 = !DILocation(line: 184, column: 35, scope: !295)
!300 = !DILocation(line: 184, column: 17, scope: !265)
!301 = !DILocation(line: 186, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !295, file: !15, line: 185, column: 13)
!303 = !DILocation(line: 186, column: 24, scope: !302)
!304 = !DILocation(line: 186, column: 30, scope: !302)
!305 = !DILocation(line: 188, column: 23, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !15, line: 188, column: 17)
!307 = !DILocation(line: 188, column: 21, scope: !306)
!308 = !DILocation(line: 188, column: 28, scope: !309)
!309 = distinct !DILexicalBlock(scope: !306, file: !15, line: 188, column: 17)
!310 = !DILocation(line: 188, column: 30, scope: !309)
!311 = !DILocation(line: 188, column: 17, scope: !306)
!312 = !DILocation(line: 190, column: 34, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !15, line: 189, column: 17)
!314 = !DILocation(line: 190, column: 41, scope: !313)
!315 = !DILocation(line: 190, column: 21, scope: !313)
!316 = !DILocation(line: 191, column: 17, scope: !313)
!317 = !DILocation(line: 188, column: 37, scope: !309)
!318 = !DILocation(line: 188, column: 17, scope: !309)
!319 = distinct !{!319, !311, !320, !79}
!320 = !DILocation(line: 191, column: 17, scope: !306)
!321 = !DILocation(line: 192, column: 13, scope: !302)
!322 = !DILocation(line: 195, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !295, file: !15, line: 194, column: 13)
!324 = !DILocation(line: 197, column: 18, scope: !265)
!325 = !DILocation(line: 197, column: 13, scope: !265)
!326 = !DILocation(line: 199, column: 5, scope: !266)
!327 = !DILocation(line: 200, column: 1, scope: !236)
!328 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!329 = !DILocalVariable(name: "data", scope: !328, file: !15, line: 205, type: !6)
!330 = !DILocation(line: 205, column: 9, scope: !328)
!331 = !DILocation(line: 207, column: 10, scope: !328)
!332 = !DILocation(line: 208, column: 8, scope: !333)
!333 = distinct !DILexicalBlock(scope: !328, file: !15, line: 208, column: 8)
!334 = !DILocation(line: 208, column: 8, scope: !328)
!335 = !DILocation(line: 211, column: 9, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !15, line: 209, column: 5)
!337 = !DILocation(line: 212, column: 5, scope: !336)
!338 = !DILocation(line: 217, column: 14, scope: !339)
!339 = distinct !DILexicalBlock(scope: !333, file: !15, line: 214, column: 5)
!340 = !DILocation(line: 219, column: 8, scope: !341)
!341 = distinct !DILexicalBlock(scope: !328, file: !15, line: 219, column: 8)
!342 = !DILocation(line: 219, column: 8, scope: !328)
!343 = !DILocalVariable(name: "i", scope: !344, file: !15, line: 222, type: !6)
!344 = distinct !DILexicalBlock(scope: !345, file: !15, line: 221, column: 9)
!345 = distinct !DILexicalBlock(scope: !341, file: !15, line: 220, column: 5)
!346 = !DILocation(line: 222, column: 17, scope: !344)
!347 = !DILocalVariable(name: "buffer", scope: !344, file: !15, line: 223, type: !5)
!348 = !DILocation(line: 223, column: 19, scope: !344)
!349 = !DILocation(line: 223, column: 35, scope: !344)
!350 = !DILocation(line: 223, column: 28, scope: !344)
!351 = !DILocation(line: 224, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !344, file: !15, line: 224, column: 17)
!353 = !DILocation(line: 224, column: 24, scope: !352)
!354 = !DILocation(line: 224, column: 17, scope: !344)
!355 = !DILocation(line: 224, column: 34, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !15, line: 224, column: 33)
!357 = !DILocation(line: 226, column: 20, scope: !358)
!358 = distinct !DILexicalBlock(scope: !344, file: !15, line: 226, column: 13)
!359 = !DILocation(line: 226, column: 18, scope: !358)
!360 = !DILocation(line: 226, column: 25, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !15, line: 226, column: 13)
!362 = !DILocation(line: 226, column: 27, scope: !361)
!363 = !DILocation(line: 226, column: 13, scope: !358)
!364 = !DILocation(line: 228, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !15, line: 227, column: 13)
!366 = !DILocation(line: 228, column: 24, scope: !365)
!367 = !DILocation(line: 228, column: 27, scope: !365)
!368 = !DILocation(line: 229, column: 13, scope: !365)
!369 = !DILocation(line: 226, column: 34, scope: !361)
!370 = !DILocation(line: 226, column: 13, scope: !361)
!371 = distinct !{!371, !363, !372, !79}
!372 = !DILocation(line: 229, column: 13, scope: !358)
!373 = !DILocation(line: 232, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !344, file: !15, line: 232, column: 17)
!375 = !DILocation(line: 232, column: 22, scope: !374)
!376 = !DILocation(line: 232, column: 17, scope: !344)
!377 = !DILocation(line: 234, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !15, line: 233, column: 13)
!379 = !DILocation(line: 234, column: 24, scope: !378)
!380 = !DILocation(line: 234, column: 30, scope: !378)
!381 = !DILocation(line: 236, column: 23, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !15, line: 236, column: 17)
!383 = !DILocation(line: 236, column: 21, scope: !382)
!384 = !DILocation(line: 236, column: 28, scope: !385)
!385 = distinct !DILexicalBlock(scope: !382, file: !15, line: 236, column: 17)
!386 = !DILocation(line: 236, column: 30, scope: !385)
!387 = !DILocation(line: 236, column: 17, scope: !382)
!388 = !DILocation(line: 238, column: 34, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !15, line: 237, column: 17)
!390 = !DILocation(line: 238, column: 41, scope: !389)
!391 = !DILocation(line: 238, column: 21, scope: !389)
!392 = !DILocation(line: 239, column: 17, scope: !389)
!393 = !DILocation(line: 236, column: 37, scope: !385)
!394 = !DILocation(line: 236, column: 17, scope: !385)
!395 = distinct !{!395, !387, !396, !79}
!396 = !DILocation(line: 239, column: 17, scope: !382)
!397 = !DILocation(line: 240, column: 13, scope: !378)
!398 = !DILocation(line: 243, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !374, file: !15, line: 242, column: 13)
!400 = !DILocation(line: 245, column: 18, scope: !344)
!401 = !DILocation(line: 245, column: 13, scope: !344)
!402 = !DILocation(line: 247, column: 5, scope: !345)
!403 = !DILocation(line: 248, column: 1, scope: !328)
!404 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 251, type: !16, scopeLine: 252, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!405 = !DILocalVariable(name: "data", scope: !404, file: !15, line: 253, type: !6)
!406 = !DILocation(line: 253, column: 9, scope: !404)
!407 = !DILocation(line: 255, column: 10, scope: !404)
!408 = !DILocation(line: 256, column: 8, scope: !409)
!409 = distinct !DILexicalBlock(scope: !404, file: !15, line: 256, column: 8)
!410 = !DILocation(line: 256, column: 8, scope: !404)
!411 = !DILocation(line: 260, column: 14, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !15, line: 257, column: 5)
!413 = !DILocation(line: 261, column: 5, scope: !412)
!414 = !DILocation(line: 262, column: 8, scope: !415)
!415 = distinct !DILexicalBlock(scope: !404, file: !15, line: 262, column: 8)
!416 = !DILocation(line: 262, column: 8, scope: !404)
!417 = !DILocalVariable(name: "i", scope: !418, file: !15, line: 265, type: !6)
!418 = distinct !DILexicalBlock(scope: !419, file: !15, line: 264, column: 9)
!419 = distinct !DILexicalBlock(scope: !415, file: !15, line: 263, column: 5)
!420 = !DILocation(line: 265, column: 17, scope: !418)
!421 = !DILocalVariable(name: "buffer", scope: !418, file: !15, line: 266, type: !5)
!422 = !DILocation(line: 266, column: 19, scope: !418)
!423 = !DILocation(line: 266, column: 35, scope: !418)
!424 = !DILocation(line: 266, column: 28, scope: !418)
!425 = !DILocation(line: 267, column: 17, scope: !426)
!426 = distinct !DILexicalBlock(scope: !418, file: !15, line: 267, column: 17)
!427 = !DILocation(line: 267, column: 24, scope: !426)
!428 = !DILocation(line: 267, column: 17, scope: !418)
!429 = !DILocation(line: 267, column: 34, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !15, line: 267, column: 33)
!431 = !DILocation(line: 269, column: 20, scope: !432)
!432 = distinct !DILexicalBlock(scope: !418, file: !15, line: 269, column: 13)
!433 = !DILocation(line: 269, column: 18, scope: !432)
!434 = !DILocation(line: 269, column: 25, scope: !435)
!435 = distinct !DILexicalBlock(scope: !432, file: !15, line: 269, column: 13)
!436 = !DILocation(line: 269, column: 27, scope: !435)
!437 = !DILocation(line: 269, column: 13, scope: !432)
!438 = !DILocation(line: 271, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !15, line: 270, column: 13)
!440 = !DILocation(line: 271, column: 24, scope: !439)
!441 = !DILocation(line: 271, column: 27, scope: !439)
!442 = !DILocation(line: 272, column: 13, scope: !439)
!443 = !DILocation(line: 269, column: 34, scope: !435)
!444 = !DILocation(line: 269, column: 13, scope: !435)
!445 = distinct !{!445, !437, !446, !79}
!446 = !DILocation(line: 272, column: 13, scope: !432)
!447 = !DILocation(line: 275, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !418, file: !15, line: 275, column: 17)
!449 = !DILocation(line: 275, column: 22, scope: !448)
!450 = !DILocation(line: 275, column: 17, scope: !418)
!451 = !DILocation(line: 277, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !15, line: 276, column: 13)
!453 = !DILocation(line: 277, column: 24, scope: !452)
!454 = !DILocation(line: 277, column: 30, scope: !452)
!455 = !DILocation(line: 279, column: 23, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !15, line: 279, column: 17)
!457 = !DILocation(line: 279, column: 21, scope: !456)
!458 = !DILocation(line: 279, column: 28, scope: !459)
!459 = distinct !DILexicalBlock(scope: !456, file: !15, line: 279, column: 17)
!460 = !DILocation(line: 279, column: 30, scope: !459)
!461 = !DILocation(line: 279, column: 17, scope: !456)
!462 = !DILocation(line: 281, column: 34, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !15, line: 280, column: 17)
!464 = !DILocation(line: 281, column: 41, scope: !463)
!465 = !DILocation(line: 281, column: 21, scope: !463)
!466 = !DILocation(line: 282, column: 17, scope: !463)
!467 = !DILocation(line: 279, column: 37, scope: !459)
!468 = !DILocation(line: 279, column: 17, scope: !459)
!469 = distinct !{!469, !461, !470, !79}
!470 = !DILocation(line: 282, column: 17, scope: !456)
!471 = !DILocation(line: 283, column: 13, scope: !452)
!472 = !DILocation(line: 286, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !448, file: !15, line: 285, column: 13)
!474 = !DILocation(line: 288, column: 18, scope: !418)
!475 = !DILocation(line: 288, column: 13, scope: !418)
!476 = !DILocation(line: 290, column: 5, scope: !419)
!477 = !DILocation(line: 291, column: 1, scope: !404)
