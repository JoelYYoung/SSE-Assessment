; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !11
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !14
@goodG2BStatic = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 -1, i32* %data, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !39
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !40
  %cmp = icmp ne i8* %call, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !43
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !45
  store i32 %call2, i32* %data, align 4, !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @badStatic, align 4, !dbg !50
  %2 = load i32, i32* %data, align 4, !dbg !51
  call void @badSink(i32 %2), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end16, !dbg !61

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !62, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !68
  %1 = bitcast i8* %call to i32*, !dbg !69
  store i32* %1, i32** %buffer, align 8, !dbg !67
  %2 = load i32*, i32** %buffer, align 8, !dbg !70
  %cmp = icmp eq i32* %2, null, !dbg !72
  br i1 %cmp, label %if.then1, label %if.end, !dbg !73

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !79
  %cmp2 = icmp slt i32 %3, 10, !dbg !81
  br i1 %cmp2, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !83
  %5 = load i32, i32* %i, align 4, !dbg !85
  %idxprom = sext i32 %5 to i64, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !88
  %inc = add nsw i32 %6, 1, !dbg !88
  store i32 %inc, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !93
  %cmp3 = icmp sge i32 %7, 0, !dbg !95
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !96

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !97
  %9 = load i32, i32* %data.addr, align 4, !dbg !99
  %idxprom5 = sext i32 %9 to i64, !dbg !97
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !97
  store i32 1, i32* %arrayidx6, align 4, !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond7, !dbg !103

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !104
  %cmp8 = icmp slt i32 %10, 10, !dbg !106
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !107

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !108
  %12 = load i32, i32* %i, align 4, !dbg !110
  %idxprom10 = sext i32 %12 to i64, !dbg !108
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !108
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !108
  call void @printIntLine(i32 %13), !dbg !111
  br label %for.inc12, !dbg !112

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !113
  %inc13 = add nsw i32 %14, 1, !dbg !113
  store i32 %inc13, i32* %i, align 4, !dbg !113
  br label %for.cond7, !dbg !114, !llvm.loop !115

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !117

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !118
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !120
  %16 = bitcast i32* %15 to i8*, !dbg !120
  call void @free(i8* %16) #8, !dbg !121
  br label %if.end16, !dbg !122

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21_good() #0 !dbg !124 {
entry:
  call void @goodB2G1(), !dbg !125
  call void @goodB2G2(), !dbg !126
  call void @goodG2B(), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !129 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !134, metadata !DIExpression()), !dbg !135
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !136, metadata !DIExpression()), !dbg !137
  %call = call i64 @time(i64* null) #8, !dbg !138
  %conv = trunc i64 %call to i32, !dbg !139
  call void @srand(i32 %conv) #8, !dbg !140
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !141
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21_good(), !dbg !142
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !143
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !144
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21_bad(), !dbg !145
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !146
  ret i32 0, !dbg !147
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !152, metadata !DIExpression()), !dbg !154
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !154
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !157
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !158
  %cmp = icmp ne i8* %call, null, !dbg !159
  br i1 %cmp, label %if.then, label %if.else, !dbg !160

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !161
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !163
  store i32 %call2, i32* %data, align 4, !dbg !164
  br label %if.end, !dbg !165

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !166
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !168
  %2 = load i32, i32* %data, align 4, !dbg !169
  call void @goodB2G1Sink(i32 %2), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !172 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !175
  %tobool = icmp ne i32 %0, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.else, !dbg !177

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !178
  br label %if.end18, !dbg !180

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !181, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !185, metadata !DIExpression()), !dbg !186
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !187
  %1 = bitcast i8* %call to i32*, !dbg !188
  store i32* %1, i32** %buffer, align 8, !dbg !186
  %2 = load i32*, i32** %buffer, align 8, !dbg !189
  %cmp = icmp eq i32* %2, null, !dbg !191
  br i1 %cmp, label %if.then1, label %if.end, !dbg !192

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !193
  unreachable, !dbg !193

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !198
  %cmp2 = icmp slt i32 %3, 10, !dbg !200
  br i1 %cmp2, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !202
  %5 = load i32, i32* %i, align 4, !dbg !204
  %idxprom = sext i32 %5 to i64, !dbg !202
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !202
  store i32 0, i32* %arrayidx, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !207
  %inc = add nsw i32 %6, 1, !dbg !207
  store i32 %inc, i32* %i, align 4, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !211
  %cmp3 = icmp sge i32 %7, 0, !dbg !213
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !214

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !215
  %cmp4 = icmp slt i32 %8, 10, !dbg !216
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !217

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !218
  %10 = load i32, i32* %data.addr, align 4, !dbg !220
  %idxprom6 = sext i32 %10 to i64, !dbg !218
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !218
  store i32 1, i32* %arrayidx7, align 4, !dbg !221
  store i32 0, i32* %i, align 4, !dbg !222
  br label %for.cond8, !dbg !224

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !225
  %cmp9 = icmp slt i32 %11, 10, !dbg !227
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !228

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !229
  %13 = load i32, i32* %i, align 4, !dbg !231
  %idxprom11 = sext i32 %13 to i64, !dbg !229
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !229
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !229
  call void @printIntLine(i32 %14), !dbg !232
  br label %for.inc13, !dbg !233

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !234
  %inc14 = add nsw i32 %15, 1, !dbg !234
  store i32 %inc14, i32* %i, align 4, !dbg !234
  br label %for.cond8, !dbg !235, !llvm.loop !236

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !238

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !239
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !241
  %17 = bitcast i32* %16 to i8*, !dbg !241
  call void @free(i8* %17) #8, !dbg !242
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !244 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 -1, i32* %data, align 4, !dbg !247
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !248, metadata !DIExpression()), !dbg !250
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !250
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !250
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !251
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !253
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !254
  %cmp = icmp ne i8* %call, null, !dbg !255
  br i1 %cmp, label %if.then, label %if.else, !dbg !256

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !257
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !259
  store i32 %call2, i32* %data, align 4, !dbg !260
  br label %if.end, !dbg !261

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !262
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !264
  %2 = load i32, i32* %data, align 4, !dbg !265
  call void @goodB2G2Sink(i32 %2), !dbg !266
  ret void, !dbg !267
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !268 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !269, metadata !DIExpression()), !dbg !270
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !271
  %tobool = icmp ne i32 %0, 0, !dbg !271
  br i1 %tobool, label %if.then, label %if.end17, !dbg !273

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !274, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !278, metadata !DIExpression()), !dbg !279
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !280
  %1 = bitcast i8* %call to i32*, !dbg !281
  store i32* %1, i32** %buffer, align 8, !dbg !279
  %2 = load i32*, i32** %buffer, align 8, !dbg !282
  %cmp = icmp eq i32* %2, null, !dbg !284
  br i1 %cmp, label %if.then1, label %if.end, !dbg !285

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !286
  unreachable, !dbg !286

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !288
  br label %for.cond, !dbg !290

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !291
  %cmp2 = icmp slt i32 %3, 10, !dbg !293
  br i1 %cmp2, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !295
  %5 = load i32, i32* %i, align 4, !dbg !297
  %idxprom = sext i32 %5 to i64, !dbg !295
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !295
  store i32 0, i32* %arrayidx, align 4, !dbg !298
  br label %for.inc, !dbg !299

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !300
  %inc = add nsw i32 %6, 1, !dbg !300
  store i32 %inc, i32* %i, align 4, !dbg !300
  br label %for.cond, !dbg !301, !llvm.loop !302

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !304
  %cmp3 = icmp sge i32 %7, 0, !dbg !306
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !307

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !308
  %cmp4 = icmp slt i32 %8, 10, !dbg !309
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !310

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !311
  %10 = load i32, i32* %data.addr, align 4, !dbg !313
  %idxprom6 = sext i32 %10 to i64, !dbg !311
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !311
  store i32 1, i32* %arrayidx7, align 4, !dbg !314
  store i32 0, i32* %i, align 4, !dbg !315
  br label %for.cond8, !dbg !317

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !318
  %cmp9 = icmp slt i32 %11, 10, !dbg !320
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !321

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !322
  %13 = load i32, i32* %i, align 4, !dbg !324
  %idxprom11 = sext i32 %13 to i64, !dbg !322
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !322
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !322
  call void @printIntLine(i32 %14), !dbg !325
  br label %for.inc13, !dbg !326

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !327
  %inc14 = add nsw i32 %15, 1, !dbg !327
  store i32 %inc14, i32* %i, align 4, !dbg !327
  br label %for.cond8, !dbg !328, !llvm.loop !329

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !331

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !332
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !334
  %17 = bitcast i32* %16 to i8*, !dbg !334
  call void @free(i8* %17) #8, !dbg !335
  br label %if.end17, !dbg !336

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !337
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !338 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !339, metadata !DIExpression()), !dbg !340
  store i32 -1, i32* %data, align 4, !dbg !341
  store i32 7, i32* %data, align 4, !dbg !342
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !343
  %0 = load i32, i32* %data, align 4, !dbg !344
  call void @goodG2BSink(i32 %0), !dbg !345
  ret void, !dbg !346
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !347 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !348, metadata !DIExpression()), !dbg !349
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !350
  %tobool = icmp ne i32 %0, 0, !dbg !350
  br i1 %tobool, label %if.then, label %if.end16, !dbg !352

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !353, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !357, metadata !DIExpression()), !dbg !358
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !359
  %1 = bitcast i8* %call to i32*, !dbg !360
  store i32* %1, i32** %buffer, align 8, !dbg !358
  %2 = load i32*, i32** %buffer, align 8, !dbg !361
  %cmp = icmp eq i32* %2, null, !dbg !363
  br i1 %cmp, label %if.then1, label %if.end, !dbg !364

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !365
  unreachable, !dbg !365

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !367
  br label %for.cond, !dbg !369

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !370
  %cmp2 = icmp slt i32 %3, 10, !dbg !372
  br i1 %cmp2, label %for.body, label %for.end, !dbg !373

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !374
  %5 = load i32, i32* %i, align 4, !dbg !376
  %idxprom = sext i32 %5 to i64, !dbg !374
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !374
  store i32 0, i32* %arrayidx, align 4, !dbg !377
  br label %for.inc, !dbg !378

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !379
  %inc = add nsw i32 %6, 1, !dbg !379
  store i32 %inc, i32* %i, align 4, !dbg !379
  br label %for.cond, !dbg !380, !llvm.loop !381

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !383
  %cmp3 = icmp sge i32 %7, 0, !dbg !385
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !386

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !387
  %9 = load i32, i32* %data.addr, align 4, !dbg !389
  %idxprom5 = sext i32 %9 to i64, !dbg !387
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !387
  store i32 1, i32* %arrayidx6, align 4, !dbg !390
  store i32 0, i32* %i, align 4, !dbg !391
  br label %for.cond7, !dbg !393

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !394
  %cmp8 = icmp slt i32 %10, 10, !dbg !396
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !397

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !398
  %12 = load i32, i32* %i, align 4, !dbg !400
  %idxprom10 = sext i32 %12 to i64, !dbg !398
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !398
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !398
  call void @printIntLine(i32 %13), !dbg !401
  br label %for.inc12, !dbg !402

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !403
  %inc13 = add nsw i32 %14, 1, !dbg !403
  store i32 %inc13, i32* %i, align 4, !dbg !403
  br label %for.cond7, !dbg !404, !llvm.loop !405

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !407

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !408
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !410
  %16 = bitcast i32* %15 to i8*, !dbg !410
  call void @free(i8* %16) #8, !dbg !411
  br label %if.end16, !dbg !412

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !413
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!0, !11, !14, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !13, line: 87, type: !9, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !13, line: 88, type: !9, isLocal: true, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !13, line: 89, type: !9, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21_bad", scope: !13, file: !13, line: 60, type: !25, scopeLine: 61, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !13, line: 62, type: !9)
!28 = !DILocation(line: 62, column: 9, scope: !24)
!29 = !DILocation(line: 64, column: 10, scope: !24)
!30 = !DILocalVariable(name: "inputBuffer", scope: !31, file: !13, line: 66, type: !32)
!31 = distinct !DILexicalBlock(scope: !24, file: !13, line: 65, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 112, elements: !34)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !{!35}
!35 = !DISubrange(count: 14)
!36 = !DILocation(line: 66, column: 14, scope: !31)
!37 = !DILocation(line: 68, column: 19, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !13, line: 68, column: 13)
!39 = !DILocation(line: 68, column: 49, scope: !38)
!40 = !DILocation(line: 68, column: 13, scope: !38)
!41 = !DILocation(line: 68, column: 56, scope: !38)
!42 = !DILocation(line: 68, column: 13, scope: !31)
!43 = !DILocation(line: 71, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !13, line: 69, column: 9)
!45 = !DILocation(line: 71, column: 20, scope: !44)
!46 = !DILocation(line: 71, column: 18, scope: !44)
!47 = !DILocation(line: 72, column: 9, scope: !44)
!48 = !DILocation(line: 75, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !13, line: 74, column: 9)
!50 = !DILocation(line: 78, column: 15, scope: !24)
!51 = !DILocation(line: 79, column: 13, scope: !24)
!52 = !DILocation(line: 79, column: 5, scope: !24)
!53 = !DILocation(line: 80, column: 1, scope: !24)
!54 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 27, type: !55, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{null, !9}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !13, line: 27, type: !9)
!58 = !DILocation(line: 27, column: 25, scope: !54)
!59 = !DILocation(line: 29, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !13, line: 29, column: 8)
!61 = !DILocation(line: 29, column: 8, scope: !54)
!62 = !DILocalVariable(name: "i", scope: !63, file: !13, line: 32, type: !9)
!63 = distinct !DILexicalBlock(scope: !64, file: !13, line: 31, column: 9)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 30, column: 5)
!65 = !DILocation(line: 32, column: 17, scope: !63)
!66 = !DILocalVariable(name: "buffer", scope: !63, file: !13, line: 33, type: !8)
!67 = !DILocation(line: 33, column: 19, scope: !63)
!68 = !DILocation(line: 33, column: 35, scope: !63)
!69 = !DILocation(line: 33, column: 28, scope: !63)
!70 = !DILocation(line: 34, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !63, file: !13, line: 34, column: 17)
!72 = !DILocation(line: 34, column: 24, scope: !71)
!73 = !DILocation(line: 34, column: 17, scope: !63)
!74 = !DILocation(line: 34, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !13, line: 34, column: 33)
!76 = !DILocation(line: 36, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !63, file: !13, line: 36, column: 13)
!78 = !DILocation(line: 36, column: 18, scope: !77)
!79 = !DILocation(line: 36, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !13, line: 36, column: 13)
!81 = !DILocation(line: 36, column: 27, scope: !80)
!82 = !DILocation(line: 36, column: 13, scope: !77)
!83 = !DILocation(line: 38, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !13, line: 37, column: 13)
!85 = !DILocation(line: 38, column: 24, scope: !84)
!86 = !DILocation(line: 38, column: 27, scope: !84)
!87 = !DILocation(line: 39, column: 13, scope: !84)
!88 = !DILocation(line: 36, column: 34, scope: !80)
!89 = !DILocation(line: 36, column: 13, scope: !80)
!90 = distinct !{!90, !82, !91, !92}
!91 = !DILocation(line: 39, column: 13, scope: !77)
!92 = !{!"llvm.loop.mustprogress"}
!93 = !DILocation(line: 42, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !63, file: !13, line: 42, column: 17)
!95 = !DILocation(line: 42, column: 22, scope: !94)
!96 = !DILocation(line: 42, column: 17, scope: !63)
!97 = !DILocation(line: 44, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !13, line: 43, column: 13)
!99 = !DILocation(line: 44, column: 24, scope: !98)
!100 = !DILocation(line: 44, column: 30, scope: !98)
!101 = !DILocation(line: 46, column: 23, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !13, line: 46, column: 17)
!103 = !DILocation(line: 46, column: 21, scope: !102)
!104 = !DILocation(line: 46, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !13, line: 46, column: 17)
!106 = !DILocation(line: 46, column: 30, scope: !105)
!107 = !DILocation(line: 46, column: 17, scope: !102)
!108 = !DILocation(line: 48, column: 34, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !13, line: 47, column: 17)
!110 = !DILocation(line: 48, column: 41, scope: !109)
!111 = !DILocation(line: 48, column: 21, scope: !109)
!112 = !DILocation(line: 49, column: 17, scope: !109)
!113 = !DILocation(line: 46, column: 37, scope: !105)
!114 = !DILocation(line: 46, column: 17, scope: !105)
!115 = distinct !{!115, !107, !116, !92}
!116 = !DILocation(line: 49, column: 17, scope: !102)
!117 = !DILocation(line: 50, column: 13, scope: !98)
!118 = !DILocation(line: 53, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !94, file: !13, line: 52, column: 13)
!120 = !DILocation(line: 55, column: 18, scope: !63)
!121 = !DILocation(line: 55, column: 13, scope: !63)
!122 = !DILocation(line: 57, column: 5, scope: !64)
!123 = !DILocation(line: 58, column: 1, scope: !54)
!124 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_21_good", scope: !13, file: !13, line: 252, type: !25, scopeLine: 253, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocation(line: 254, column: 5, scope: !124)
!126 = !DILocation(line: 255, column: 5, scope: !124)
!127 = !DILocation(line: 256, column: 5, scope: !124)
!128 = !DILocation(line: 257, column: 1, scope: !124)
!129 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 268, type: !130, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DISubroutineType(types: !131)
!131 = !{!9, !9, !132}
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!134 = !DILocalVariable(name: "argc", arg: 1, scope: !129, file: !13, line: 268, type: !9)
!135 = !DILocation(line: 268, column: 14, scope: !129)
!136 = !DILocalVariable(name: "argv", arg: 2, scope: !129, file: !13, line: 268, type: !132)
!137 = !DILocation(line: 268, column: 27, scope: !129)
!138 = !DILocation(line: 271, column: 22, scope: !129)
!139 = !DILocation(line: 271, column: 12, scope: !129)
!140 = !DILocation(line: 271, column: 5, scope: !129)
!141 = !DILocation(line: 273, column: 5, scope: !129)
!142 = !DILocation(line: 274, column: 5, scope: !129)
!143 = !DILocation(line: 275, column: 5, scope: !129)
!144 = !DILocation(line: 278, column: 5, scope: !129)
!145 = !DILocation(line: 279, column: 5, scope: !129)
!146 = !DILocation(line: 280, column: 5, scope: !129)
!147 = !DILocation(line: 282, column: 5, scope: !129)
!148 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 129, type: !25, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", scope: !148, file: !13, line: 131, type: !9)
!150 = !DILocation(line: 131, column: 9, scope: !148)
!151 = !DILocation(line: 133, column: 10, scope: !148)
!152 = !DILocalVariable(name: "inputBuffer", scope: !153, file: !13, line: 135, type: !32)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 134, column: 5)
!154 = !DILocation(line: 135, column: 14, scope: !153)
!155 = !DILocation(line: 137, column: 19, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !13, line: 137, column: 13)
!157 = !DILocation(line: 137, column: 49, scope: !156)
!158 = !DILocation(line: 137, column: 13, scope: !156)
!159 = !DILocation(line: 137, column: 56, scope: !156)
!160 = !DILocation(line: 137, column: 13, scope: !153)
!161 = !DILocation(line: 140, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !156, file: !13, line: 138, column: 9)
!163 = !DILocation(line: 140, column: 20, scope: !162)
!164 = !DILocation(line: 140, column: 18, scope: !162)
!165 = !DILocation(line: 141, column: 9, scope: !162)
!166 = !DILocation(line: 144, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !156, file: !13, line: 143, column: 9)
!168 = !DILocation(line: 147, column: 20, scope: !148)
!169 = !DILocation(line: 148, column: 18, scope: !148)
!170 = !DILocation(line: 148, column: 5, scope: !148)
!171 = !DILocation(line: 149, column: 1, scope: !148)
!172 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !13, file: !13, line: 92, type: !55, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!173 = !DILocalVariable(name: "data", arg: 1, scope: !172, file: !13, line: 92, type: !9)
!174 = !DILocation(line: 92, column: 30, scope: !172)
!175 = !DILocation(line: 94, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 94, column: 8)
!177 = !DILocation(line: 94, column: 8, scope: !172)
!178 = !DILocation(line: 97, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !13, line: 95, column: 5)
!180 = !DILocation(line: 98, column: 5, scope: !179)
!181 = !DILocalVariable(name: "i", scope: !182, file: !13, line: 102, type: !9)
!182 = distinct !DILexicalBlock(scope: !183, file: !13, line: 101, column: 9)
!183 = distinct !DILexicalBlock(scope: !176, file: !13, line: 100, column: 5)
!184 = !DILocation(line: 102, column: 17, scope: !182)
!185 = !DILocalVariable(name: "buffer", scope: !182, file: !13, line: 103, type: !8)
!186 = !DILocation(line: 103, column: 19, scope: !182)
!187 = !DILocation(line: 103, column: 35, scope: !182)
!188 = !DILocation(line: 103, column: 28, scope: !182)
!189 = !DILocation(line: 104, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !182, file: !13, line: 104, column: 17)
!191 = !DILocation(line: 104, column: 24, scope: !190)
!192 = !DILocation(line: 104, column: 17, scope: !182)
!193 = !DILocation(line: 104, column: 34, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !13, line: 104, column: 33)
!195 = !DILocation(line: 106, column: 20, scope: !196)
!196 = distinct !DILexicalBlock(scope: !182, file: !13, line: 106, column: 13)
!197 = !DILocation(line: 106, column: 18, scope: !196)
!198 = !DILocation(line: 106, column: 25, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !13, line: 106, column: 13)
!200 = !DILocation(line: 106, column: 27, scope: !199)
!201 = !DILocation(line: 106, column: 13, scope: !196)
!202 = !DILocation(line: 108, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !13, line: 107, column: 13)
!204 = !DILocation(line: 108, column: 24, scope: !203)
!205 = !DILocation(line: 108, column: 27, scope: !203)
!206 = !DILocation(line: 109, column: 13, scope: !203)
!207 = !DILocation(line: 106, column: 34, scope: !199)
!208 = !DILocation(line: 106, column: 13, scope: !199)
!209 = distinct !{!209, !201, !210, !92}
!210 = !DILocation(line: 109, column: 13, scope: !196)
!211 = !DILocation(line: 111, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !182, file: !13, line: 111, column: 17)
!213 = !DILocation(line: 111, column: 22, scope: !212)
!214 = !DILocation(line: 111, column: 27, scope: !212)
!215 = !DILocation(line: 111, column: 30, scope: !212)
!216 = !DILocation(line: 111, column: 35, scope: !212)
!217 = !DILocation(line: 111, column: 17, scope: !182)
!218 = !DILocation(line: 113, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !212, file: !13, line: 112, column: 13)
!220 = !DILocation(line: 113, column: 24, scope: !219)
!221 = !DILocation(line: 113, column: 30, scope: !219)
!222 = !DILocation(line: 115, column: 23, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !13, line: 115, column: 17)
!224 = !DILocation(line: 115, column: 21, scope: !223)
!225 = !DILocation(line: 115, column: 28, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !13, line: 115, column: 17)
!227 = !DILocation(line: 115, column: 30, scope: !226)
!228 = !DILocation(line: 115, column: 17, scope: !223)
!229 = !DILocation(line: 117, column: 34, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !13, line: 116, column: 17)
!231 = !DILocation(line: 117, column: 41, scope: !230)
!232 = !DILocation(line: 117, column: 21, scope: !230)
!233 = !DILocation(line: 118, column: 17, scope: !230)
!234 = !DILocation(line: 115, column: 37, scope: !226)
!235 = !DILocation(line: 115, column: 17, scope: !226)
!236 = distinct !{!236, !228, !237, !92}
!237 = !DILocation(line: 118, column: 17, scope: !223)
!238 = !DILocation(line: 119, column: 13, scope: !219)
!239 = !DILocation(line: 122, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !212, file: !13, line: 121, column: 13)
!241 = !DILocation(line: 124, column: 18, scope: !182)
!242 = !DILocation(line: 124, column: 13, scope: !182)
!243 = !DILocation(line: 127, column: 1, scope: !172)
!244 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 184, type: !25, scopeLine: 185, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!245 = !DILocalVariable(name: "data", scope: !244, file: !13, line: 186, type: !9)
!246 = !DILocation(line: 186, column: 9, scope: !244)
!247 = !DILocation(line: 188, column: 10, scope: !244)
!248 = !DILocalVariable(name: "inputBuffer", scope: !249, file: !13, line: 190, type: !32)
!249 = distinct !DILexicalBlock(scope: !244, file: !13, line: 189, column: 5)
!250 = !DILocation(line: 190, column: 14, scope: !249)
!251 = !DILocation(line: 192, column: 19, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !13, line: 192, column: 13)
!253 = !DILocation(line: 192, column: 49, scope: !252)
!254 = !DILocation(line: 192, column: 13, scope: !252)
!255 = !DILocation(line: 192, column: 56, scope: !252)
!256 = !DILocation(line: 192, column: 13, scope: !249)
!257 = !DILocation(line: 195, column: 25, scope: !258)
!258 = distinct !DILexicalBlock(scope: !252, file: !13, line: 193, column: 9)
!259 = !DILocation(line: 195, column: 20, scope: !258)
!260 = !DILocation(line: 195, column: 18, scope: !258)
!261 = !DILocation(line: 196, column: 9, scope: !258)
!262 = !DILocation(line: 199, column: 13, scope: !263)
!263 = distinct !DILexicalBlock(scope: !252, file: !13, line: 198, column: 9)
!264 = !DILocation(line: 202, column: 20, scope: !244)
!265 = !DILocation(line: 203, column: 18, scope: !244)
!266 = !DILocation(line: 203, column: 5, scope: !244)
!267 = !DILocation(line: 204, column: 1, scope: !244)
!268 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !13, file: !13, line: 152, type: !55, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!269 = !DILocalVariable(name: "data", arg: 1, scope: !268, file: !13, line: 152, type: !9)
!270 = !DILocation(line: 152, column: 30, scope: !268)
!271 = !DILocation(line: 154, column: 8, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !13, line: 154, column: 8)
!273 = !DILocation(line: 154, column: 8, scope: !268)
!274 = !DILocalVariable(name: "i", scope: !275, file: !13, line: 157, type: !9)
!275 = distinct !DILexicalBlock(scope: !276, file: !13, line: 156, column: 9)
!276 = distinct !DILexicalBlock(scope: !272, file: !13, line: 155, column: 5)
!277 = !DILocation(line: 157, column: 17, scope: !275)
!278 = !DILocalVariable(name: "buffer", scope: !275, file: !13, line: 158, type: !8)
!279 = !DILocation(line: 158, column: 19, scope: !275)
!280 = !DILocation(line: 158, column: 35, scope: !275)
!281 = !DILocation(line: 158, column: 28, scope: !275)
!282 = !DILocation(line: 159, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !275, file: !13, line: 159, column: 17)
!284 = !DILocation(line: 159, column: 24, scope: !283)
!285 = !DILocation(line: 159, column: 17, scope: !275)
!286 = !DILocation(line: 159, column: 34, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !13, line: 159, column: 33)
!288 = !DILocation(line: 161, column: 20, scope: !289)
!289 = distinct !DILexicalBlock(scope: !275, file: !13, line: 161, column: 13)
!290 = !DILocation(line: 161, column: 18, scope: !289)
!291 = !DILocation(line: 161, column: 25, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !13, line: 161, column: 13)
!293 = !DILocation(line: 161, column: 27, scope: !292)
!294 = !DILocation(line: 161, column: 13, scope: !289)
!295 = !DILocation(line: 163, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !13, line: 162, column: 13)
!297 = !DILocation(line: 163, column: 24, scope: !296)
!298 = !DILocation(line: 163, column: 27, scope: !296)
!299 = !DILocation(line: 164, column: 13, scope: !296)
!300 = !DILocation(line: 161, column: 34, scope: !292)
!301 = !DILocation(line: 161, column: 13, scope: !292)
!302 = distinct !{!302, !294, !303, !92}
!303 = !DILocation(line: 164, column: 13, scope: !289)
!304 = !DILocation(line: 166, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !275, file: !13, line: 166, column: 17)
!306 = !DILocation(line: 166, column: 22, scope: !305)
!307 = !DILocation(line: 166, column: 27, scope: !305)
!308 = !DILocation(line: 166, column: 30, scope: !305)
!309 = !DILocation(line: 166, column: 35, scope: !305)
!310 = !DILocation(line: 166, column: 17, scope: !275)
!311 = !DILocation(line: 168, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !13, line: 167, column: 13)
!313 = !DILocation(line: 168, column: 24, scope: !312)
!314 = !DILocation(line: 168, column: 30, scope: !312)
!315 = !DILocation(line: 170, column: 23, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !13, line: 170, column: 17)
!317 = !DILocation(line: 170, column: 21, scope: !316)
!318 = !DILocation(line: 170, column: 28, scope: !319)
!319 = distinct !DILexicalBlock(scope: !316, file: !13, line: 170, column: 17)
!320 = !DILocation(line: 170, column: 30, scope: !319)
!321 = !DILocation(line: 170, column: 17, scope: !316)
!322 = !DILocation(line: 172, column: 34, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !13, line: 171, column: 17)
!324 = !DILocation(line: 172, column: 41, scope: !323)
!325 = !DILocation(line: 172, column: 21, scope: !323)
!326 = !DILocation(line: 173, column: 17, scope: !323)
!327 = !DILocation(line: 170, column: 37, scope: !319)
!328 = !DILocation(line: 170, column: 17, scope: !319)
!329 = distinct !{!329, !321, !330, !92}
!330 = !DILocation(line: 173, column: 17, scope: !316)
!331 = !DILocation(line: 174, column: 13, scope: !312)
!332 = !DILocation(line: 177, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !305, file: !13, line: 176, column: 13)
!334 = !DILocation(line: 179, column: 18, scope: !275)
!335 = !DILocation(line: 179, column: 13, scope: !275)
!336 = !DILocation(line: 181, column: 5, scope: !276)
!337 = !DILocation(line: 182, column: 1, scope: !268)
!338 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 240, type: !25, scopeLine: 241, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!339 = !DILocalVariable(name: "data", scope: !338, file: !13, line: 242, type: !9)
!340 = !DILocation(line: 242, column: 9, scope: !338)
!341 = !DILocation(line: 244, column: 10, scope: !338)
!342 = !DILocation(line: 247, column: 10, scope: !338)
!343 = !DILocation(line: 248, column: 19, scope: !338)
!344 = !DILocation(line: 249, column: 17, scope: !338)
!345 = !DILocation(line: 249, column: 5, scope: !338)
!346 = !DILocation(line: 250, column: 1, scope: !338)
!347 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 207, type: !55, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!348 = !DILocalVariable(name: "data", arg: 1, scope: !347, file: !13, line: 207, type: !9)
!349 = !DILocation(line: 207, column: 29, scope: !347)
!350 = !DILocation(line: 209, column: 8, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !13, line: 209, column: 8)
!352 = !DILocation(line: 209, column: 8, scope: !347)
!353 = !DILocalVariable(name: "i", scope: !354, file: !13, line: 212, type: !9)
!354 = distinct !DILexicalBlock(scope: !355, file: !13, line: 211, column: 9)
!355 = distinct !DILexicalBlock(scope: !351, file: !13, line: 210, column: 5)
!356 = !DILocation(line: 212, column: 17, scope: !354)
!357 = !DILocalVariable(name: "buffer", scope: !354, file: !13, line: 213, type: !8)
!358 = !DILocation(line: 213, column: 19, scope: !354)
!359 = !DILocation(line: 213, column: 35, scope: !354)
!360 = !DILocation(line: 213, column: 28, scope: !354)
!361 = !DILocation(line: 214, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !354, file: !13, line: 214, column: 17)
!363 = !DILocation(line: 214, column: 24, scope: !362)
!364 = !DILocation(line: 214, column: 17, scope: !354)
!365 = !DILocation(line: 214, column: 34, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !13, line: 214, column: 33)
!367 = !DILocation(line: 216, column: 20, scope: !368)
!368 = distinct !DILexicalBlock(scope: !354, file: !13, line: 216, column: 13)
!369 = !DILocation(line: 216, column: 18, scope: !368)
!370 = !DILocation(line: 216, column: 25, scope: !371)
!371 = distinct !DILexicalBlock(scope: !368, file: !13, line: 216, column: 13)
!372 = !DILocation(line: 216, column: 27, scope: !371)
!373 = !DILocation(line: 216, column: 13, scope: !368)
!374 = !DILocation(line: 218, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !13, line: 217, column: 13)
!376 = !DILocation(line: 218, column: 24, scope: !375)
!377 = !DILocation(line: 218, column: 27, scope: !375)
!378 = !DILocation(line: 219, column: 13, scope: !375)
!379 = !DILocation(line: 216, column: 34, scope: !371)
!380 = !DILocation(line: 216, column: 13, scope: !371)
!381 = distinct !{!381, !373, !382, !92}
!382 = !DILocation(line: 219, column: 13, scope: !368)
!383 = !DILocation(line: 222, column: 17, scope: !384)
!384 = distinct !DILexicalBlock(scope: !354, file: !13, line: 222, column: 17)
!385 = !DILocation(line: 222, column: 22, scope: !384)
!386 = !DILocation(line: 222, column: 17, scope: !354)
!387 = !DILocation(line: 224, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !13, line: 223, column: 13)
!389 = !DILocation(line: 224, column: 24, scope: !388)
!390 = !DILocation(line: 224, column: 30, scope: !388)
!391 = !DILocation(line: 226, column: 23, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !13, line: 226, column: 17)
!393 = !DILocation(line: 226, column: 21, scope: !392)
!394 = !DILocation(line: 226, column: 28, scope: !395)
!395 = distinct !DILexicalBlock(scope: !392, file: !13, line: 226, column: 17)
!396 = !DILocation(line: 226, column: 30, scope: !395)
!397 = !DILocation(line: 226, column: 17, scope: !392)
!398 = !DILocation(line: 228, column: 34, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !13, line: 227, column: 17)
!400 = !DILocation(line: 228, column: 41, scope: !399)
!401 = !DILocation(line: 228, column: 21, scope: !399)
!402 = !DILocation(line: 229, column: 17, scope: !399)
!403 = !DILocation(line: 226, column: 37, scope: !395)
!404 = !DILocation(line: 226, column: 17, scope: !395)
!405 = distinct !{!405, !397, !406, !92}
!406 = !DILocation(line: 229, column: 17, scope: !392)
!407 = !DILocation(line: 230, column: 13, scope: !388)
!408 = !DILocation(line: 233, column: 17, scope: !409)
!409 = distinct !DILexicalBlock(scope: !384, file: !13, line: 232, column: 13)
!410 = !DILocation(line: 235, column: 18, scope: !354)
!411 = !DILocation(line: 235, column: 13, scope: !354)
!412 = !DILocation(line: 237, column: 5, scope: !355)
!413 = !DILocation(line: 238, column: 1, scope: !347)
