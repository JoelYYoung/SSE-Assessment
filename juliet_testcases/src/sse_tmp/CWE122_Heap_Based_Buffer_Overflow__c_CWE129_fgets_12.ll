; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i30 = alloca i32, align 4
  %buffer31 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else5, !dbg !23

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
  br label %if.end6, !dbg !45

if.else5:                                         ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !46
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.end
  %call7 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !48
  %tobool8 = icmp ne i32 %call7, 0, !dbg !48
  br i1 %tobool8, label %if.then9, label %if.else29, !dbg !50

if.then9:                                         ; preds = %if.end6
  call void @llvm.dbg.declare(metadata i32* %i, metadata !51, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !55, metadata !DIExpression()), !dbg !56
  %call10 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !57
  %2 = bitcast i8* %call10 to i32*, !dbg !58
  store i32* %2, i32** %buffer, align 8, !dbg !56
  %3 = load i32*, i32** %buffer, align 8, !dbg !59
  %cmp11 = icmp eq i32* %3, null, !dbg !61
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !62

if.then12:                                        ; preds = %if.then9
  call void @exit(i32 -1) #9, !dbg !63
  unreachable, !dbg !63

if.end13:                                         ; preds = %if.then9
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end13
  %4 = load i32, i32* %i, align 4, !dbg !68
  %cmp14 = icmp slt i32 %4, 10, !dbg !70
  br i1 %cmp14, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !72
  %6 = load i32, i32* %i, align 4, !dbg !74
  %idxprom = sext i32 %6 to i64, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !77
  %inc = add nsw i32 %7, 1, !dbg !77
  store i32 %inc, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !82
  %cmp15 = icmp sge i32 %8, 0, !dbg !84
  br i1 %cmp15, label %if.then16, label %if.else27, !dbg !85

if.then16:                                        ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !86
  %10 = load i32, i32* %data, align 4, !dbg !88
  %idxprom17 = sext i32 %10 to i64, !dbg !86
  %arrayidx18 = getelementptr inbounds i32, i32* %9, i64 %idxprom17, !dbg !86
  store i32 1, i32* %arrayidx18, align 4, !dbg !89
  store i32 0, i32* %i, align 4, !dbg !90
  br label %for.cond19, !dbg !92

for.cond19:                                       ; preds = %for.inc24, %if.then16
  %11 = load i32, i32* %i, align 4, !dbg !93
  %cmp20 = icmp slt i32 %11, 10, !dbg !95
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !96

for.body21:                                       ; preds = %for.cond19
  %12 = load i32*, i32** %buffer, align 8, !dbg !97
  %13 = load i32, i32* %i, align 4, !dbg !99
  %idxprom22 = sext i32 %13 to i64, !dbg !97
  %arrayidx23 = getelementptr inbounds i32, i32* %12, i64 %idxprom22, !dbg !97
  %14 = load i32, i32* %arrayidx23, align 4, !dbg !97
  call void @printIntLine(i32 %14), !dbg !100
  br label %for.inc24, !dbg !101

for.inc24:                                        ; preds = %for.body21
  %15 = load i32, i32* %i, align 4, !dbg !102
  %inc25 = add nsw i32 %15, 1, !dbg !102
  store i32 %inc25, i32* %i, align 4, !dbg !102
  br label %for.cond19, !dbg !103, !llvm.loop !104

for.end26:                                        ; preds = %for.cond19
  br label %if.end28, !dbg !106

if.else27:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %for.end26
  %16 = load i32*, i32** %buffer, align 8, !dbg !109
  %17 = bitcast i32* %16 to i8*, !dbg !109
  call void @free(i8* %17) #8, !dbg !110
  br label %if.end59, !dbg !111

if.else29:                                        ; preds = %if.end6
  call void @llvm.dbg.declare(metadata i32* %i30, metadata !112, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %buffer31, metadata !116, metadata !DIExpression()), !dbg !117
  %call32 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !118
  %18 = bitcast i8* %call32 to i32*, !dbg !119
  store i32* %18, i32** %buffer31, align 8, !dbg !117
  %19 = load i32*, i32** %buffer31, align 8, !dbg !120
  %cmp33 = icmp eq i32* %19, null, !dbg !122
  br i1 %cmp33, label %if.then34, label %if.end35, !dbg !123

if.then34:                                        ; preds = %if.else29
  call void @exit(i32 -1) #9, !dbg !124
  unreachable, !dbg !124

if.end35:                                         ; preds = %if.else29
  store i32 0, i32* %i30, align 4, !dbg !126
  br label %for.cond36, !dbg !128

for.cond36:                                       ; preds = %for.inc41, %if.end35
  %20 = load i32, i32* %i30, align 4, !dbg !129
  %cmp37 = icmp slt i32 %20, 10, !dbg !131
  br i1 %cmp37, label %for.body38, label %for.end43, !dbg !132

for.body38:                                       ; preds = %for.cond36
  %21 = load i32*, i32** %buffer31, align 8, !dbg !133
  %22 = load i32, i32* %i30, align 4, !dbg !135
  %idxprom39 = sext i32 %22 to i64, !dbg !133
  %arrayidx40 = getelementptr inbounds i32, i32* %21, i64 %idxprom39, !dbg !133
  store i32 0, i32* %arrayidx40, align 4, !dbg !136
  br label %for.inc41, !dbg !137

for.inc41:                                        ; preds = %for.body38
  %23 = load i32, i32* %i30, align 4, !dbg !138
  %inc42 = add nsw i32 %23, 1, !dbg !138
  store i32 %inc42, i32* %i30, align 4, !dbg !138
  br label %for.cond36, !dbg !139, !llvm.loop !140

for.end43:                                        ; preds = %for.cond36
  %24 = load i32, i32* %data, align 4, !dbg !142
  %cmp44 = icmp sge i32 %24, 0, !dbg !144
  br i1 %cmp44, label %land.lhs.true, label %if.else57, !dbg !145

land.lhs.true:                                    ; preds = %for.end43
  %25 = load i32, i32* %data, align 4, !dbg !146
  %cmp45 = icmp slt i32 %25, 10, !dbg !147
  br i1 %cmp45, label %if.then46, label %if.else57, !dbg !148

if.then46:                                        ; preds = %land.lhs.true
  %26 = load i32*, i32** %buffer31, align 8, !dbg !149
  %27 = load i32, i32* %data, align 4, !dbg !151
  %idxprom47 = sext i32 %27 to i64, !dbg !149
  %arrayidx48 = getelementptr inbounds i32, i32* %26, i64 %idxprom47, !dbg !149
  store i32 1, i32* %arrayidx48, align 4, !dbg !152
  store i32 0, i32* %i30, align 4, !dbg !153
  br label %for.cond49, !dbg !155

for.cond49:                                       ; preds = %for.inc54, %if.then46
  %28 = load i32, i32* %i30, align 4, !dbg !156
  %cmp50 = icmp slt i32 %28, 10, !dbg !158
  br i1 %cmp50, label %for.body51, label %for.end56, !dbg !159

for.body51:                                       ; preds = %for.cond49
  %29 = load i32*, i32** %buffer31, align 8, !dbg !160
  %30 = load i32, i32* %i30, align 4, !dbg !162
  %idxprom52 = sext i32 %30 to i64, !dbg !160
  %arrayidx53 = getelementptr inbounds i32, i32* %29, i64 %idxprom52, !dbg !160
  %31 = load i32, i32* %arrayidx53, align 4, !dbg !160
  call void @printIntLine(i32 %31), !dbg !163
  br label %for.inc54, !dbg !164

for.inc54:                                        ; preds = %for.body51
  %32 = load i32, i32* %i30, align 4, !dbg !165
  %inc55 = add nsw i32 %32, 1, !dbg !165
  store i32 %inc55, i32* %i30, align 4, !dbg !165
  br label %for.cond49, !dbg !166, !llvm.loop !167

for.end56:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !169

if.else57:                                        ; preds = %land.lhs.true, %for.end43
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !170
  br label %if.end58

if.end58:                                         ; preds = %if.else57, %for.end56
  %33 = load i32*, i32** %buffer31, align 8, !dbg !172
  %34 = bitcast i32* %33 to i8*, !dbg !172
  call void @free(i8* %34) #8, !dbg !173
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.end28
  ret void, !dbg !174
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_good() #0 !dbg !175 {
entry:
  call void @goodB2G(), !dbg !176
  call void @goodG2B(), !dbg !177
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !179 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !184, metadata !DIExpression()), !dbg !185
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !186, metadata !DIExpression()), !dbg !187
  %call = call i64 @time(i64* null) #8, !dbg !188
  %conv = trunc i64 %call to i32, !dbg !189
  call void @srand(i32 %conv) #8, !dbg !190
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !191
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_good(), !dbg !192
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !193
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !194
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_bad(), !dbg !195
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !196
  ret i32 0, !dbg !197
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !198 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %inputBuffer6 = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i40 = alloca i32, align 4
  %buffer41 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 -1, i32* %data, align 4, !dbg !201
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !202
  %tobool = icmp ne i32 %call, 0, !dbg !202
  br i1 %tobool, label %if.then, label %if.else5, !dbg !204

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !205, metadata !DIExpression()), !dbg !208
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !208
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !208
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !209
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !211
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !212
  %cmp = icmp ne i8* %call1, null, !dbg !213
  br i1 %cmp, label %if.then2, label %if.else, !dbg !214

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !215
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !217
  store i32 %call4, i32* %data, align 4, !dbg !218
  br label %if.end, !dbg !219

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !220
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end15, !dbg !222

if.else5:                                         ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer6, metadata !223, metadata !DIExpression()), !dbg !226
  %2 = bitcast [14 x i8]* %inputBuffer6 to i8*, !dbg !226
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !226
  %arraydecay7 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !227
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !229
  %call8 = call i8* @fgets(i8* %arraydecay7, i32 14, %struct._IO_FILE* %3), !dbg !230
  %cmp9 = icmp ne i8* %call8, null, !dbg !231
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !232

if.then10:                                        ; preds = %if.else5
  %arraydecay11 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !233
  %call12 = call i32 @atoi(i8* %arraydecay11) #7, !dbg !235
  store i32 %call12, i32* %data, align 4, !dbg !236
  br label %if.end14, !dbg !237

if.else13:                                        ; preds = %if.else5
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !238
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end
  %call16 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !240
  %tobool17 = icmp ne i32 %call16, 0, !dbg !240
  br i1 %tobool17, label %if.then18, label %if.else39, !dbg !242

if.then18:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !243, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !247, metadata !DIExpression()), !dbg !248
  %call19 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !249
  %4 = bitcast i8* %call19 to i32*, !dbg !250
  store i32* %4, i32** %buffer, align 8, !dbg !248
  %5 = load i32*, i32** %buffer, align 8, !dbg !251
  %cmp20 = icmp eq i32* %5, null, !dbg !253
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !254

if.then21:                                        ; preds = %if.then18
  call void @exit(i32 -1) #9, !dbg !255
  unreachable, !dbg !255

if.end22:                                         ; preds = %if.then18
  store i32 0, i32* %i, align 4, !dbg !257
  br label %for.cond, !dbg !259

for.cond:                                         ; preds = %for.inc, %if.end22
  %6 = load i32, i32* %i, align 4, !dbg !260
  %cmp23 = icmp slt i32 %6, 10, !dbg !262
  br i1 %cmp23, label %for.body, label %for.end, !dbg !263

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !264
  %8 = load i32, i32* %i, align 4, !dbg !266
  %idxprom = sext i32 %8 to i64, !dbg !264
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !264
  store i32 0, i32* %arrayidx, align 4, !dbg !267
  br label %for.inc, !dbg !268

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !269
  %inc = add nsw i32 %9, 1, !dbg !269
  store i32 %inc, i32* %i, align 4, !dbg !269
  br label %for.cond, !dbg !270, !llvm.loop !271

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !273
  %cmp24 = icmp sge i32 %10, 0, !dbg !275
  br i1 %cmp24, label %land.lhs.true, label %if.else37, !dbg !276

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !277
  %cmp25 = icmp slt i32 %11, 10, !dbg !278
  br i1 %cmp25, label %if.then26, label %if.else37, !dbg !279

if.then26:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !280
  %13 = load i32, i32* %data, align 4, !dbg !282
  %idxprom27 = sext i32 %13 to i64, !dbg !280
  %arrayidx28 = getelementptr inbounds i32, i32* %12, i64 %idxprom27, !dbg !280
  store i32 1, i32* %arrayidx28, align 4, !dbg !283
  store i32 0, i32* %i, align 4, !dbg !284
  br label %for.cond29, !dbg !286

for.cond29:                                       ; preds = %for.inc34, %if.then26
  %14 = load i32, i32* %i, align 4, !dbg !287
  %cmp30 = icmp slt i32 %14, 10, !dbg !289
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !290

for.body31:                                       ; preds = %for.cond29
  %15 = load i32*, i32** %buffer, align 8, !dbg !291
  %16 = load i32, i32* %i, align 4, !dbg !293
  %idxprom32 = sext i32 %16 to i64, !dbg !291
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !291
  %17 = load i32, i32* %arrayidx33, align 4, !dbg !291
  call void @printIntLine(i32 %17), !dbg !294
  br label %for.inc34, !dbg !295

for.inc34:                                        ; preds = %for.body31
  %18 = load i32, i32* %i, align 4, !dbg !296
  %inc35 = add nsw i32 %18, 1, !dbg !296
  store i32 %inc35, i32* %i, align 4, !dbg !296
  br label %for.cond29, !dbg !297, !llvm.loop !298

for.end36:                                        ; preds = %for.cond29
  br label %if.end38, !dbg !300

if.else37:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !301
  br label %if.end38

if.end38:                                         ; preds = %if.else37, %for.end36
  %19 = load i32*, i32** %buffer, align 8, !dbg !303
  %20 = bitcast i32* %19 to i8*, !dbg !303
  call void @free(i8* %20) #8, !dbg !304
  br label %if.end70, !dbg !305

if.else39:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata i32* %i40, metadata !306, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.declare(metadata i32** %buffer41, metadata !310, metadata !DIExpression()), !dbg !311
  %call42 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !312
  %21 = bitcast i8* %call42 to i32*, !dbg !313
  store i32* %21, i32** %buffer41, align 8, !dbg !311
  %22 = load i32*, i32** %buffer41, align 8, !dbg !314
  %cmp43 = icmp eq i32* %22, null, !dbg !316
  br i1 %cmp43, label %if.then44, label %if.end45, !dbg !317

if.then44:                                        ; preds = %if.else39
  call void @exit(i32 -1) #9, !dbg !318
  unreachable, !dbg !318

if.end45:                                         ; preds = %if.else39
  store i32 0, i32* %i40, align 4, !dbg !320
  br label %for.cond46, !dbg !322

for.cond46:                                       ; preds = %for.inc51, %if.end45
  %23 = load i32, i32* %i40, align 4, !dbg !323
  %cmp47 = icmp slt i32 %23, 10, !dbg !325
  br i1 %cmp47, label %for.body48, label %for.end53, !dbg !326

for.body48:                                       ; preds = %for.cond46
  %24 = load i32*, i32** %buffer41, align 8, !dbg !327
  %25 = load i32, i32* %i40, align 4, !dbg !329
  %idxprom49 = sext i32 %25 to i64, !dbg !327
  %arrayidx50 = getelementptr inbounds i32, i32* %24, i64 %idxprom49, !dbg !327
  store i32 0, i32* %arrayidx50, align 4, !dbg !330
  br label %for.inc51, !dbg !331

for.inc51:                                        ; preds = %for.body48
  %26 = load i32, i32* %i40, align 4, !dbg !332
  %inc52 = add nsw i32 %26, 1, !dbg !332
  store i32 %inc52, i32* %i40, align 4, !dbg !332
  br label %for.cond46, !dbg !333, !llvm.loop !334

for.end53:                                        ; preds = %for.cond46
  %27 = load i32, i32* %data, align 4, !dbg !336
  %cmp54 = icmp sge i32 %27, 0, !dbg !338
  br i1 %cmp54, label %land.lhs.true55, label %if.else68, !dbg !339

land.lhs.true55:                                  ; preds = %for.end53
  %28 = load i32, i32* %data, align 4, !dbg !340
  %cmp56 = icmp slt i32 %28, 10, !dbg !341
  br i1 %cmp56, label %if.then57, label %if.else68, !dbg !342

if.then57:                                        ; preds = %land.lhs.true55
  %29 = load i32*, i32** %buffer41, align 8, !dbg !343
  %30 = load i32, i32* %data, align 4, !dbg !345
  %idxprom58 = sext i32 %30 to i64, !dbg !343
  %arrayidx59 = getelementptr inbounds i32, i32* %29, i64 %idxprom58, !dbg !343
  store i32 1, i32* %arrayidx59, align 4, !dbg !346
  store i32 0, i32* %i40, align 4, !dbg !347
  br label %for.cond60, !dbg !349

for.cond60:                                       ; preds = %for.inc65, %if.then57
  %31 = load i32, i32* %i40, align 4, !dbg !350
  %cmp61 = icmp slt i32 %31, 10, !dbg !352
  br i1 %cmp61, label %for.body62, label %for.end67, !dbg !353

for.body62:                                       ; preds = %for.cond60
  %32 = load i32*, i32** %buffer41, align 8, !dbg !354
  %33 = load i32, i32* %i40, align 4, !dbg !356
  %idxprom63 = sext i32 %33 to i64, !dbg !354
  %arrayidx64 = getelementptr inbounds i32, i32* %32, i64 %idxprom63, !dbg !354
  %34 = load i32, i32* %arrayidx64, align 4, !dbg !354
  call void @printIntLine(i32 %34), !dbg !357
  br label %for.inc65, !dbg !358

for.inc65:                                        ; preds = %for.body62
  %35 = load i32, i32* %i40, align 4, !dbg !359
  %inc66 = add nsw i32 %35, 1, !dbg !359
  store i32 %inc66, i32* %i40, align 4, !dbg !359
  br label %for.cond60, !dbg !360, !llvm.loop !361

for.end67:                                        ; preds = %for.cond60
  br label %if.end69, !dbg !363

if.else68:                                        ; preds = %land.lhs.true55, %for.end53
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !364
  br label %if.end69

if.end69:                                         ; preds = %if.else68, %for.end67
  %36 = load i32*, i32** %buffer41, align 8, !dbg !366
  %37 = bitcast i32* %36 to i8*, !dbg !366
  call void @free(i8* %37) #8, !dbg !367
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.end38
  ret void, !dbg !368
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !369 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !370, metadata !DIExpression()), !dbg !371
  store i32 -1, i32* %data, align 4, !dbg !372
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !373
  %tobool = icmp ne i32 %call, 0, !dbg !373
  br i1 %tobool, label %if.then, label %if.else, !dbg !375

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !376
  br label %if.end, !dbg !378

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !379
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !381
  %tobool2 = icmp ne i32 %call1, 0, !dbg !381
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !383

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !384, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !388, metadata !DIExpression()), !dbg !389
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !390
  %0 = bitcast i8* %call4 to i32*, !dbg !391
  store i32* %0, i32** %buffer, align 8, !dbg !389
  %1 = load i32*, i32** %buffer, align 8, !dbg !392
  %cmp = icmp eq i32* %1, null, !dbg !394
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !395

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #9, !dbg !396
  unreachable, !dbg !396

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !398
  br label %for.cond, !dbg !400

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !401
  %cmp7 = icmp slt i32 %2, 10, !dbg !403
  br i1 %cmp7, label %for.body, label %for.end, !dbg !404

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !405
  %4 = load i32, i32* %i, align 4, !dbg !407
  %idxprom = sext i32 %4 to i64, !dbg !405
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !405
  store i32 0, i32* %arrayidx, align 4, !dbg !408
  br label %for.inc, !dbg !409

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !410
  %inc = add nsw i32 %5, 1, !dbg !410
  store i32 %inc, i32* %i, align 4, !dbg !410
  br label %for.cond, !dbg !411, !llvm.loop !412

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !414
  %cmp8 = icmp sge i32 %6, 0, !dbg !416
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !417

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !418
  %8 = load i32, i32* %data, align 4, !dbg !420
  %idxprom10 = sext i32 %8 to i64, !dbg !418
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !418
  store i32 1, i32* %arrayidx11, align 4, !dbg !421
  store i32 0, i32* %i, align 4, !dbg !422
  br label %for.cond12, !dbg !424

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !425
  %cmp13 = icmp slt i32 %9, 10, !dbg !427
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !428

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !429
  %11 = load i32, i32* %i, align 4, !dbg !431
  %idxprom15 = sext i32 %11 to i64, !dbg !429
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !429
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !429
  call void @printIntLine(i32 %12), !dbg !432
  br label %for.inc17, !dbg !433

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !434
  %inc18 = add nsw i32 %13, 1, !dbg !434
  store i32 %inc18, i32* %i, align 4, !dbg !434
  br label %for.cond12, !dbg !435, !llvm.loop !436

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !438

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !439
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !441
  %15 = bitcast i32* %14 to i8*, !dbg !441
  call void @free(i8* %15) #8, !dbg !442
  br label %if.end51, !dbg !443

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !444, metadata !DIExpression()), !dbg !447
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !448, metadata !DIExpression()), !dbg !449
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !450
  %16 = bitcast i8* %call25 to i32*, !dbg !451
  store i32* %16, i32** %buffer24, align 8, !dbg !449
  %17 = load i32*, i32** %buffer24, align 8, !dbg !452
  %cmp26 = icmp eq i32* %17, null, !dbg !454
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !455

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 -1) #9, !dbg !456
  unreachable, !dbg !456

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !458
  br label %for.cond29, !dbg !460

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !461
  %cmp30 = icmp slt i32 %18, 10, !dbg !463
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !464

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !465
  %20 = load i32, i32* %i23, align 4, !dbg !467
  %idxprom32 = sext i32 %20 to i64, !dbg !465
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !465
  store i32 0, i32* %arrayidx33, align 4, !dbg !468
  br label %for.inc34, !dbg !469

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !470
  %inc35 = add nsw i32 %21, 1, !dbg !470
  store i32 %inc35, i32* %i23, align 4, !dbg !470
  br label %for.cond29, !dbg !471, !llvm.loop !472

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !474
  %cmp37 = icmp sge i32 %22, 0, !dbg !476
  br i1 %cmp37, label %if.then38, label %if.else49, !dbg !477

if.then38:                                        ; preds = %for.end36
  %23 = load i32*, i32** %buffer24, align 8, !dbg !478
  %24 = load i32, i32* %data, align 4, !dbg !480
  %idxprom39 = sext i32 %24 to i64, !dbg !478
  %arrayidx40 = getelementptr inbounds i32, i32* %23, i64 %idxprom39, !dbg !478
  store i32 1, i32* %arrayidx40, align 4, !dbg !481
  store i32 0, i32* %i23, align 4, !dbg !482
  br label %for.cond41, !dbg !484

for.cond41:                                       ; preds = %for.inc46, %if.then38
  %25 = load i32, i32* %i23, align 4, !dbg !485
  %cmp42 = icmp slt i32 %25, 10, !dbg !487
  br i1 %cmp42, label %for.body43, label %for.end48, !dbg !488

for.body43:                                       ; preds = %for.cond41
  %26 = load i32*, i32** %buffer24, align 8, !dbg !489
  %27 = load i32, i32* %i23, align 4, !dbg !491
  %idxprom44 = sext i32 %27 to i64, !dbg !489
  %arrayidx45 = getelementptr inbounds i32, i32* %26, i64 %idxprom44, !dbg !489
  %28 = load i32, i32* %arrayidx45, align 4, !dbg !489
  call void @printIntLine(i32 %28), !dbg !492
  br label %for.inc46, !dbg !493

for.inc46:                                        ; preds = %for.body43
  %29 = load i32, i32* %i23, align 4, !dbg !494
  %inc47 = add nsw i32 %29, 1, !dbg !494
  store i32 %inc47, i32* %i23, align 4, !dbg !494
  br label %for.cond41, !dbg !495, !llvm.loop !496

for.end48:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !498

if.else49:                                        ; preds = %for.end36
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !499
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end48
  %30 = load i32*, i32** %buffer24, align 8, !dbg !501
  %31 = bitcast i32* %30 to i8*, !dbg !501
  call void @free(i8* %31) #8, !dbg !502
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end21
  ret void, !dbg !503
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12.c", directory: "/root/SSE-Assessment")
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
!46 = !DILocation(line: 49, column: 14, scope: !47)
!47 = distinct !DILexicalBlock(scope: !22, file: !15, line: 46, column: 5)
!48 = !DILocation(line: 51, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !14, file: !15, line: 51, column: 8)
!50 = !DILocation(line: 51, column: 8, scope: !14)
!51 = !DILocalVariable(name: "i", scope: !52, file: !15, line: 54, type: !6)
!52 = distinct !DILexicalBlock(scope: !53, file: !15, line: 53, column: 9)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 52, column: 5)
!54 = !DILocation(line: 54, column: 17, scope: !52)
!55 = !DILocalVariable(name: "buffer", scope: !52, file: !15, line: 55, type: !5)
!56 = !DILocation(line: 55, column: 19, scope: !52)
!57 = !DILocation(line: 55, column: 35, scope: !52)
!58 = !DILocation(line: 55, column: 28, scope: !52)
!59 = !DILocation(line: 56, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !52, file: !15, line: 56, column: 17)
!61 = !DILocation(line: 56, column: 24, scope: !60)
!62 = !DILocation(line: 56, column: 17, scope: !52)
!63 = !DILocation(line: 56, column: 34, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 56, column: 33)
!65 = !DILocation(line: 58, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !52, file: !15, line: 58, column: 13)
!67 = !DILocation(line: 58, column: 18, scope: !66)
!68 = !DILocation(line: 58, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 58, column: 13)
!70 = !DILocation(line: 58, column: 27, scope: !69)
!71 = !DILocation(line: 58, column: 13, scope: !66)
!72 = !DILocation(line: 60, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 59, column: 13)
!74 = !DILocation(line: 60, column: 24, scope: !73)
!75 = !DILocation(line: 60, column: 27, scope: !73)
!76 = !DILocation(line: 61, column: 13, scope: !73)
!77 = !DILocation(line: 58, column: 34, scope: !69)
!78 = !DILocation(line: 58, column: 13, scope: !69)
!79 = distinct !{!79, !71, !80, !81}
!80 = !DILocation(line: 61, column: 13, scope: !66)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 64, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !52, file: !15, line: 64, column: 17)
!84 = !DILocation(line: 64, column: 22, scope: !83)
!85 = !DILocation(line: 64, column: 17, scope: !52)
!86 = !DILocation(line: 66, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 65, column: 13)
!88 = !DILocation(line: 66, column: 24, scope: !87)
!89 = !DILocation(line: 66, column: 30, scope: !87)
!90 = !DILocation(line: 68, column: 23, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 68, column: 17)
!92 = !DILocation(line: 68, column: 21, scope: !91)
!93 = !DILocation(line: 68, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 68, column: 17)
!95 = !DILocation(line: 68, column: 30, scope: !94)
!96 = !DILocation(line: 68, column: 17, scope: !91)
!97 = !DILocation(line: 70, column: 34, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 69, column: 17)
!99 = !DILocation(line: 70, column: 41, scope: !98)
!100 = !DILocation(line: 70, column: 21, scope: !98)
!101 = !DILocation(line: 71, column: 17, scope: !98)
!102 = !DILocation(line: 68, column: 37, scope: !94)
!103 = !DILocation(line: 68, column: 17, scope: !94)
!104 = distinct !{!104, !96, !105, !81}
!105 = !DILocation(line: 71, column: 17, scope: !91)
!106 = !DILocation(line: 72, column: 13, scope: !87)
!107 = !DILocation(line: 75, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !83, file: !15, line: 74, column: 13)
!109 = !DILocation(line: 77, column: 18, scope: !52)
!110 = !DILocation(line: 77, column: 13, scope: !52)
!111 = !DILocation(line: 79, column: 5, scope: !53)
!112 = !DILocalVariable(name: "i", scope: !113, file: !15, line: 83, type: !6)
!113 = distinct !DILexicalBlock(scope: !114, file: !15, line: 82, column: 9)
!114 = distinct !DILexicalBlock(scope: !49, file: !15, line: 81, column: 5)
!115 = !DILocation(line: 83, column: 17, scope: !113)
!116 = !DILocalVariable(name: "buffer", scope: !113, file: !15, line: 84, type: !5)
!117 = !DILocation(line: 84, column: 19, scope: !113)
!118 = !DILocation(line: 84, column: 35, scope: !113)
!119 = !DILocation(line: 84, column: 28, scope: !113)
!120 = !DILocation(line: 85, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !15, line: 85, column: 17)
!122 = !DILocation(line: 85, column: 24, scope: !121)
!123 = !DILocation(line: 85, column: 17, scope: !113)
!124 = !DILocation(line: 85, column: 34, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 85, column: 33)
!126 = !DILocation(line: 87, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !113, file: !15, line: 87, column: 13)
!128 = !DILocation(line: 87, column: 18, scope: !127)
!129 = !DILocation(line: 87, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 87, column: 13)
!131 = !DILocation(line: 87, column: 27, scope: !130)
!132 = !DILocation(line: 87, column: 13, scope: !127)
!133 = !DILocation(line: 89, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 88, column: 13)
!135 = !DILocation(line: 89, column: 24, scope: !134)
!136 = !DILocation(line: 89, column: 27, scope: !134)
!137 = !DILocation(line: 90, column: 13, scope: !134)
!138 = !DILocation(line: 87, column: 34, scope: !130)
!139 = !DILocation(line: 87, column: 13, scope: !130)
!140 = distinct !{!140, !132, !141, !81}
!141 = !DILocation(line: 90, column: 13, scope: !127)
!142 = !DILocation(line: 92, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !113, file: !15, line: 92, column: 17)
!144 = !DILocation(line: 92, column: 22, scope: !143)
!145 = !DILocation(line: 92, column: 27, scope: !143)
!146 = !DILocation(line: 92, column: 30, scope: !143)
!147 = !DILocation(line: 92, column: 35, scope: !143)
!148 = !DILocation(line: 92, column: 17, scope: !113)
!149 = !DILocation(line: 94, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !15, line: 93, column: 13)
!151 = !DILocation(line: 94, column: 24, scope: !150)
!152 = !DILocation(line: 94, column: 30, scope: !150)
!153 = !DILocation(line: 96, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 96, column: 17)
!155 = !DILocation(line: 96, column: 21, scope: !154)
!156 = !DILocation(line: 96, column: 28, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !15, line: 96, column: 17)
!158 = !DILocation(line: 96, column: 30, scope: !157)
!159 = !DILocation(line: 96, column: 17, scope: !154)
!160 = !DILocation(line: 98, column: 34, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 97, column: 17)
!162 = !DILocation(line: 98, column: 41, scope: !161)
!163 = !DILocation(line: 98, column: 21, scope: !161)
!164 = !DILocation(line: 99, column: 17, scope: !161)
!165 = !DILocation(line: 96, column: 37, scope: !157)
!166 = !DILocation(line: 96, column: 17, scope: !157)
!167 = distinct !{!167, !159, !168, !81}
!168 = !DILocation(line: 99, column: 17, scope: !154)
!169 = !DILocation(line: 100, column: 13, scope: !150)
!170 = !DILocation(line: 103, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !143, file: !15, line: 102, column: 13)
!172 = !DILocation(line: 105, column: 18, scope: !113)
!173 = !DILocation(line: 105, column: 13, scope: !113)
!174 = !DILocation(line: 108, column: 1, scope: !14)
!175 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_good", scope: !15, file: !15, line: 292, type: !16, scopeLine: 293, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = !DILocation(line: 294, column: 5, scope: !175)
!177 = !DILocation(line: 295, column: 5, scope: !175)
!178 = !DILocation(line: 296, column: 1, scope: !175)
!179 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 307, type: !180, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DISubroutineType(types: !181)
!181 = !{!6, !6, !182}
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!184 = !DILocalVariable(name: "argc", arg: 1, scope: !179, file: !15, line: 307, type: !6)
!185 = !DILocation(line: 307, column: 14, scope: !179)
!186 = !DILocalVariable(name: "argv", arg: 2, scope: !179, file: !15, line: 307, type: !182)
!187 = !DILocation(line: 307, column: 27, scope: !179)
!188 = !DILocation(line: 310, column: 22, scope: !179)
!189 = !DILocation(line: 310, column: 12, scope: !179)
!190 = !DILocation(line: 310, column: 5, scope: !179)
!191 = !DILocation(line: 312, column: 5, scope: !179)
!192 = !DILocation(line: 313, column: 5, scope: !179)
!193 = !DILocation(line: 314, column: 5, scope: !179)
!194 = !DILocation(line: 317, column: 5, scope: !179)
!195 = !DILocation(line: 318, column: 5, scope: !179)
!196 = !DILocation(line: 319, column: 5, scope: !179)
!197 = !DILocation(line: 321, column: 5, scope: !179)
!198 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 117, type: !16, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!199 = !DILocalVariable(name: "data", scope: !198, file: !15, line: 119, type: !6)
!200 = !DILocation(line: 119, column: 9, scope: !198)
!201 = !DILocation(line: 121, column: 10, scope: !198)
!202 = !DILocation(line: 122, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !15, line: 122, column: 8)
!204 = !DILocation(line: 122, column: 8, scope: !198)
!205 = !DILocalVariable(name: "inputBuffer", scope: !206, file: !15, line: 125, type: !27)
!206 = distinct !DILexicalBlock(scope: !207, file: !15, line: 124, column: 9)
!207 = distinct !DILexicalBlock(scope: !203, file: !15, line: 123, column: 5)
!208 = !DILocation(line: 125, column: 18, scope: !206)
!209 = !DILocation(line: 127, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 127, column: 17)
!211 = !DILocation(line: 127, column: 53, scope: !210)
!212 = !DILocation(line: 127, column: 17, scope: !210)
!213 = !DILocation(line: 127, column: 60, scope: !210)
!214 = !DILocation(line: 127, column: 17, scope: !206)
!215 = !DILocation(line: 130, column: 29, scope: !216)
!216 = distinct !DILexicalBlock(scope: !210, file: !15, line: 128, column: 13)
!217 = !DILocation(line: 130, column: 24, scope: !216)
!218 = !DILocation(line: 130, column: 22, scope: !216)
!219 = !DILocation(line: 131, column: 13, scope: !216)
!220 = !DILocation(line: 134, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !210, file: !15, line: 133, column: 13)
!222 = !DILocation(line: 137, column: 5, scope: !207)
!223 = !DILocalVariable(name: "inputBuffer", scope: !224, file: !15, line: 141, type: !27)
!224 = distinct !DILexicalBlock(scope: !225, file: !15, line: 140, column: 9)
!225 = distinct !DILexicalBlock(scope: !203, file: !15, line: 139, column: 5)
!226 = !DILocation(line: 141, column: 18, scope: !224)
!227 = !DILocation(line: 143, column: 23, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !15, line: 143, column: 17)
!229 = !DILocation(line: 143, column: 53, scope: !228)
!230 = !DILocation(line: 143, column: 17, scope: !228)
!231 = !DILocation(line: 143, column: 60, scope: !228)
!232 = !DILocation(line: 143, column: 17, scope: !224)
!233 = !DILocation(line: 146, column: 29, scope: !234)
!234 = distinct !DILexicalBlock(scope: !228, file: !15, line: 144, column: 13)
!235 = !DILocation(line: 146, column: 24, scope: !234)
!236 = !DILocation(line: 146, column: 22, scope: !234)
!237 = !DILocation(line: 147, column: 13, scope: !234)
!238 = !DILocation(line: 150, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !228, file: !15, line: 149, column: 13)
!240 = !DILocation(line: 154, column: 8, scope: !241)
!241 = distinct !DILexicalBlock(scope: !198, file: !15, line: 154, column: 8)
!242 = !DILocation(line: 154, column: 8, scope: !198)
!243 = !DILocalVariable(name: "i", scope: !244, file: !15, line: 157, type: !6)
!244 = distinct !DILexicalBlock(scope: !245, file: !15, line: 156, column: 9)
!245 = distinct !DILexicalBlock(scope: !241, file: !15, line: 155, column: 5)
!246 = !DILocation(line: 157, column: 17, scope: !244)
!247 = !DILocalVariable(name: "buffer", scope: !244, file: !15, line: 158, type: !5)
!248 = !DILocation(line: 158, column: 19, scope: !244)
!249 = !DILocation(line: 158, column: 35, scope: !244)
!250 = !DILocation(line: 158, column: 28, scope: !244)
!251 = !DILocation(line: 159, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !244, file: !15, line: 159, column: 17)
!253 = !DILocation(line: 159, column: 24, scope: !252)
!254 = !DILocation(line: 159, column: 17, scope: !244)
!255 = !DILocation(line: 159, column: 34, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !15, line: 159, column: 33)
!257 = !DILocation(line: 161, column: 20, scope: !258)
!258 = distinct !DILexicalBlock(scope: !244, file: !15, line: 161, column: 13)
!259 = !DILocation(line: 161, column: 18, scope: !258)
!260 = !DILocation(line: 161, column: 25, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !15, line: 161, column: 13)
!262 = !DILocation(line: 161, column: 27, scope: !261)
!263 = !DILocation(line: 161, column: 13, scope: !258)
!264 = !DILocation(line: 163, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !15, line: 162, column: 13)
!266 = !DILocation(line: 163, column: 24, scope: !265)
!267 = !DILocation(line: 163, column: 27, scope: !265)
!268 = !DILocation(line: 164, column: 13, scope: !265)
!269 = !DILocation(line: 161, column: 34, scope: !261)
!270 = !DILocation(line: 161, column: 13, scope: !261)
!271 = distinct !{!271, !263, !272, !81}
!272 = !DILocation(line: 164, column: 13, scope: !258)
!273 = !DILocation(line: 166, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !244, file: !15, line: 166, column: 17)
!275 = !DILocation(line: 166, column: 22, scope: !274)
!276 = !DILocation(line: 166, column: 27, scope: !274)
!277 = !DILocation(line: 166, column: 30, scope: !274)
!278 = !DILocation(line: 166, column: 35, scope: !274)
!279 = !DILocation(line: 166, column: 17, scope: !244)
!280 = !DILocation(line: 168, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !274, file: !15, line: 167, column: 13)
!282 = !DILocation(line: 168, column: 24, scope: !281)
!283 = !DILocation(line: 168, column: 30, scope: !281)
!284 = !DILocation(line: 170, column: 23, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !15, line: 170, column: 17)
!286 = !DILocation(line: 170, column: 21, scope: !285)
!287 = !DILocation(line: 170, column: 28, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !15, line: 170, column: 17)
!289 = !DILocation(line: 170, column: 30, scope: !288)
!290 = !DILocation(line: 170, column: 17, scope: !285)
!291 = !DILocation(line: 172, column: 34, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !15, line: 171, column: 17)
!293 = !DILocation(line: 172, column: 41, scope: !292)
!294 = !DILocation(line: 172, column: 21, scope: !292)
!295 = !DILocation(line: 173, column: 17, scope: !292)
!296 = !DILocation(line: 170, column: 37, scope: !288)
!297 = !DILocation(line: 170, column: 17, scope: !288)
!298 = distinct !{!298, !290, !299, !81}
!299 = !DILocation(line: 173, column: 17, scope: !285)
!300 = !DILocation(line: 174, column: 13, scope: !281)
!301 = !DILocation(line: 177, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !274, file: !15, line: 176, column: 13)
!303 = !DILocation(line: 179, column: 18, scope: !244)
!304 = !DILocation(line: 179, column: 13, scope: !244)
!305 = !DILocation(line: 181, column: 5, scope: !245)
!306 = !DILocalVariable(name: "i", scope: !307, file: !15, line: 185, type: !6)
!307 = distinct !DILexicalBlock(scope: !308, file: !15, line: 184, column: 9)
!308 = distinct !DILexicalBlock(scope: !241, file: !15, line: 183, column: 5)
!309 = !DILocation(line: 185, column: 17, scope: !307)
!310 = !DILocalVariable(name: "buffer", scope: !307, file: !15, line: 186, type: !5)
!311 = !DILocation(line: 186, column: 19, scope: !307)
!312 = !DILocation(line: 186, column: 35, scope: !307)
!313 = !DILocation(line: 186, column: 28, scope: !307)
!314 = !DILocation(line: 187, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !307, file: !15, line: 187, column: 17)
!316 = !DILocation(line: 187, column: 24, scope: !315)
!317 = !DILocation(line: 187, column: 17, scope: !307)
!318 = !DILocation(line: 187, column: 34, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !15, line: 187, column: 33)
!320 = !DILocation(line: 189, column: 20, scope: !321)
!321 = distinct !DILexicalBlock(scope: !307, file: !15, line: 189, column: 13)
!322 = !DILocation(line: 189, column: 18, scope: !321)
!323 = !DILocation(line: 189, column: 25, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !15, line: 189, column: 13)
!325 = !DILocation(line: 189, column: 27, scope: !324)
!326 = !DILocation(line: 189, column: 13, scope: !321)
!327 = !DILocation(line: 191, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !15, line: 190, column: 13)
!329 = !DILocation(line: 191, column: 24, scope: !328)
!330 = !DILocation(line: 191, column: 27, scope: !328)
!331 = !DILocation(line: 192, column: 13, scope: !328)
!332 = !DILocation(line: 189, column: 34, scope: !324)
!333 = !DILocation(line: 189, column: 13, scope: !324)
!334 = distinct !{!334, !326, !335, !81}
!335 = !DILocation(line: 192, column: 13, scope: !321)
!336 = !DILocation(line: 194, column: 17, scope: !337)
!337 = distinct !DILexicalBlock(scope: !307, file: !15, line: 194, column: 17)
!338 = !DILocation(line: 194, column: 22, scope: !337)
!339 = !DILocation(line: 194, column: 27, scope: !337)
!340 = !DILocation(line: 194, column: 30, scope: !337)
!341 = !DILocation(line: 194, column: 35, scope: !337)
!342 = !DILocation(line: 194, column: 17, scope: !307)
!343 = !DILocation(line: 196, column: 17, scope: !344)
!344 = distinct !DILexicalBlock(scope: !337, file: !15, line: 195, column: 13)
!345 = !DILocation(line: 196, column: 24, scope: !344)
!346 = !DILocation(line: 196, column: 30, scope: !344)
!347 = !DILocation(line: 198, column: 23, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !15, line: 198, column: 17)
!349 = !DILocation(line: 198, column: 21, scope: !348)
!350 = !DILocation(line: 198, column: 28, scope: !351)
!351 = distinct !DILexicalBlock(scope: !348, file: !15, line: 198, column: 17)
!352 = !DILocation(line: 198, column: 30, scope: !351)
!353 = !DILocation(line: 198, column: 17, scope: !348)
!354 = !DILocation(line: 200, column: 34, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !15, line: 199, column: 17)
!356 = !DILocation(line: 200, column: 41, scope: !355)
!357 = !DILocation(line: 200, column: 21, scope: !355)
!358 = !DILocation(line: 201, column: 17, scope: !355)
!359 = !DILocation(line: 198, column: 37, scope: !351)
!360 = !DILocation(line: 198, column: 17, scope: !351)
!361 = distinct !{!361, !353, !362, !81}
!362 = !DILocation(line: 201, column: 17, scope: !348)
!363 = !DILocation(line: 202, column: 13, scope: !344)
!364 = !DILocation(line: 205, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !337, file: !15, line: 204, column: 13)
!366 = !DILocation(line: 207, column: 18, scope: !307)
!367 = !DILocation(line: 207, column: 13, scope: !307)
!368 = !DILocation(line: 210, column: 1, scope: !198)
!369 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 215, type: !16, scopeLine: 216, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!370 = !DILocalVariable(name: "data", scope: !369, file: !15, line: 217, type: !6)
!371 = !DILocation(line: 217, column: 9, scope: !369)
!372 = !DILocation(line: 219, column: 10, scope: !369)
!373 = !DILocation(line: 220, column: 8, scope: !374)
!374 = distinct !DILexicalBlock(scope: !369, file: !15, line: 220, column: 8)
!375 = !DILocation(line: 220, column: 8, scope: !369)
!376 = !DILocation(line: 224, column: 14, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !15, line: 221, column: 5)
!378 = !DILocation(line: 225, column: 5, scope: !377)
!379 = !DILocation(line: 230, column: 14, scope: !380)
!380 = distinct !DILexicalBlock(scope: !374, file: !15, line: 227, column: 5)
!381 = !DILocation(line: 232, column: 8, scope: !382)
!382 = distinct !DILexicalBlock(scope: !369, file: !15, line: 232, column: 8)
!383 = !DILocation(line: 232, column: 8, scope: !369)
!384 = !DILocalVariable(name: "i", scope: !385, file: !15, line: 235, type: !6)
!385 = distinct !DILexicalBlock(scope: !386, file: !15, line: 234, column: 9)
!386 = distinct !DILexicalBlock(scope: !382, file: !15, line: 233, column: 5)
!387 = !DILocation(line: 235, column: 17, scope: !385)
!388 = !DILocalVariable(name: "buffer", scope: !385, file: !15, line: 236, type: !5)
!389 = !DILocation(line: 236, column: 19, scope: !385)
!390 = !DILocation(line: 236, column: 35, scope: !385)
!391 = !DILocation(line: 236, column: 28, scope: !385)
!392 = !DILocation(line: 237, column: 17, scope: !393)
!393 = distinct !DILexicalBlock(scope: !385, file: !15, line: 237, column: 17)
!394 = !DILocation(line: 237, column: 24, scope: !393)
!395 = !DILocation(line: 237, column: 17, scope: !385)
!396 = !DILocation(line: 237, column: 34, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !15, line: 237, column: 33)
!398 = !DILocation(line: 239, column: 20, scope: !399)
!399 = distinct !DILexicalBlock(scope: !385, file: !15, line: 239, column: 13)
!400 = !DILocation(line: 239, column: 18, scope: !399)
!401 = !DILocation(line: 239, column: 25, scope: !402)
!402 = distinct !DILexicalBlock(scope: !399, file: !15, line: 239, column: 13)
!403 = !DILocation(line: 239, column: 27, scope: !402)
!404 = !DILocation(line: 239, column: 13, scope: !399)
!405 = !DILocation(line: 241, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !402, file: !15, line: 240, column: 13)
!407 = !DILocation(line: 241, column: 24, scope: !406)
!408 = !DILocation(line: 241, column: 27, scope: !406)
!409 = !DILocation(line: 242, column: 13, scope: !406)
!410 = !DILocation(line: 239, column: 34, scope: !402)
!411 = !DILocation(line: 239, column: 13, scope: !402)
!412 = distinct !{!412, !404, !413, !81}
!413 = !DILocation(line: 242, column: 13, scope: !399)
!414 = !DILocation(line: 245, column: 17, scope: !415)
!415 = distinct !DILexicalBlock(scope: !385, file: !15, line: 245, column: 17)
!416 = !DILocation(line: 245, column: 22, scope: !415)
!417 = !DILocation(line: 245, column: 17, scope: !385)
!418 = !DILocation(line: 247, column: 17, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !15, line: 246, column: 13)
!420 = !DILocation(line: 247, column: 24, scope: !419)
!421 = !DILocation(line: 247, column: 30, scope: !419)
!422 = !DILocation(line: 249, column: 23, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !15, line: 249, column: 17)
!424 = !DILocation(line: 249, column: 21, scope: !423)
!425 = !DILocation(line: 249, column: 28, scope: !426)
!426 = distinct !DILexicalBlock(scope: !423, file: !15, line: 249, column: 17)
!427 = !DILocation(line: 249, column: 30, scope: !426)
!428 = !DILocation(line: 249, column: 17, scope: !423)
!429 = !DILocation(line: 251, column: 34, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !15, line: 250, column: 17)
!431 = !DILocation(line: 251, column: 41, scope: !430)
!432 = !DILocation(line: 251, column: 21, scope: !430)
!433 = !DILocation(line: 252, column: 17, scope: !430)
!434 = !DILocation(line: 249, column: 37, scope: !426)
!435 = !DILocation(line: 249, column: 17, scope: !426)
!436 = distinct !{!436, !428, !437, !81}
!437 = !DILocation(line: 252, column: 17, scope: !423)
!438 = !DILocation(line: 253, column: 13, scope: !419)
!439 = !DILocation(line: 256, column: 17, scope: !440)
!440 = distinct !DILexicalBlock(scope: !415, file: !15, line: 255, column: 13)
!441 = !DILocation(line: 258, column: 18, scope: !385)
!442 = !DILocation(line: 258, column: 13, scope: !385)
!443 = !DILocation(line: 260, column: 5, scope: !386)
!444 = !DILocalVariable(name: "i", scope: !445, file: !15, line: 264, type: !6)
!445 = distinct !DILexicalBlock(scope: !446, file: !15, line: 263, column: 9)
!446 = distinct !DILexicalBlock(scope: !382, file: !15, line: 262, column: 5)
!447 = !DILocation(line: 264, column: 17, scope: !445)
!448 = !DILocalVariable(name: "buffer", scope: !445, file: !15, line: 265, type: !5)
!449 = !DILocation(line: 265, column: 19, scope: !445)
!450 = !DILocation(line: 265, column: 35, scope: !445)
!451 = !DILocation(line: 265, column: 28, scope: !445)
!452 = !DILocation(line: 266, column: 17, scope: !453)
!453 = distinct !DILexicalBlock(scope: !445, file: !15, line: 266, column: 17)
!454 = !DILocation(line: 266, column: 24, scope: !453)
!455 = !DILocation(line: 266, column: 17, scope: !445)
!456 = !DILocation(line: 266, column: 34, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !15, line: 266, column: 33)
!458 = !DILocation(line: 268, column: 20, scope: !459)
!459 = distinct !DILexicalBlock(scope: !445, file: !15, line: 268, column: 13)
!460 = !DILocation(line: 268, column: 18, scope: !459)
!461 = !DILocation(line: 268, column: 25, scope: !462)
!462 = distinct !DILexicalBlock(scope: !459, file: !15, line: 268, column: 13)
!463 = !DILocation(line: 268, column: 27, scope: !462)
!464 = !DILocation(line: 268, column: 13, scope: !459)
!465 = !DILocation(line: 270, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !15, line: 269, column: 13)
!467 = !DILocation(line: 270, column: 24, scope: !466)
!468 = !DILocation(line: 270, column: 27, scope: !466)
!469 = !DILocation(line: 271, column: 13, scope: !466)
!470 = !DILocation(line: 268, column: 34, scope: !462)
!471 = !DILocation(line: 268, column: 13, scope: !462)
!472 = distinct !{!472, !464, !473, !81}
!473 = !DILocation(line: 271, column: 13, scope: !459)
!474 = !DILocation(line: 274, column: 17, scope: !475)
!475 = distinct !DILexicalBlock(scope: !445, file: !15, line: 274, column: 17)
!476 = !DILocation(line: 274, column: 22, scope: !475)
!477 = !DILocation(line: 274, column: 17, scope: !445)
!478 = !DILocation(line: 276, column: 17, scope: !479)
!479 = distinct !DILexicalBlock(scope: !475, file: !15, line: 275, column: 13)
!480 = !DILocation(line: 276, column: 24, scope: !479)
!481 = !DILocation(line: 276, column: 30, scope: !479)
!482 = !DILocation(line: 278, column: 23, scope: !483)
!483 = distinct !DILexicalBlock(scope: !479, file: !15, line: 278, column: 17)
!484 = !DILocation(line: 278, column: 21, scope: !483)
!485 = !DILocation(line: 278, column: 28, scope: !486)
!486 = distinct !DILexicalBlock(scope: !483, file: !15, line: 278, column: 17)
!487 = !DILocation(line: 278, column: 30, scope: !486)
!488 = !DILocation(line: 278, column: 17, scope: !483)
!489 = !DILocation(line: 280, column: 34, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !15, line: 279, column: 17)
!491 = !DILocation(line: 280, column: 41, scope: !490)
!492 = !DILocation(line: 280, column: 21, scope: !490)
!493 = !DILocation(line: 281, column: 17, scope: !490)
!494 = !DILocation(line: 278, column: 37, scope: !486)
!495 = !DILocation(line: 278, column: 17, scope: !486)
!496 = distinct !{!496, !488, !497, !81}
!497 = !DILocation(line: 281, column: 17, scope: !483)
!498 = !DILocation(line: 282, column: 13, scope: !479)
!499 = !DILocation(line: 285, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !475, file: !15, line: 284, column: 13)
!501 = !DILocation(line: 287, column: 18, scope: !445)
!502 = !DILocation(line: 287, column: 13, scope: !445)
!503 = !DILocation(line: 290, column: 1, scope: !369)
