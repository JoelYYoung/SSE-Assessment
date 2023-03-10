; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_32_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data4 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32* %data, i32** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* %data, i32** %dataPtr2, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !28
  %1 = load i32, i32* %0, align 4, !dbg !29
  store i32 %1, i32* %data1, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  %2 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !39
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %3), !dbg !40
  %cmp = icmp ne i8* %call, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !43
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !45
  store i32 %call3, i32* %data1, align 4, !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %data1, align 4, !dbg !50
  %5 = load i32*, i32** %dataPtr1, align 8, !dbg !51
  store i32 %4, i32* %5, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %data4, metadata !53, metadata !DIExpression()), !dbg !55
  %6 = load i32*, i32** %dataPtr2, align 8, !dbg !56
  %7 = load i32, i32* %6, align 4, !dbg !57
  store i32 %7, i32* %data4, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %i, metadata !58, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !61, metadata !DIExpression()), !dbg !65
  %8 = bitcast [10 x i32]* %buffer to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !65
  %9 = load i32, i32* %data4, align 4, !dbg !66
  %cmp5 = icmp slt i32 %9, 10, !dbg !68
  br i1 %cmp5, label %if.then6, label %if.else10, !dbg !69

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %data4, align 4, !dbg !70
  %idxprom = sext i32 %10 to i64, !dbg !72
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !72
  store i32 1, i32* %arrayidx, align 4, !dbg !73
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %if.then6
  %11 = load i32, i32* %i, align 4, !dbg !77
  %cmp7 = icmp slt i32 %11, 10, !dbg !79
  br i1 %cmp7, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %12 = load i32, i32* %i, align 4, !dbg !81
  %idxprom8 = sext i32 %12 to i64, !dbg !83
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !83
  %13 = load i32, i32* %arrayidx9, align 4, !dbg !83
  call void @printIntLine(i32 %13), !dbg !84
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !86
  %inc = add nsw i32 %14, 1, !dbg !86
  store i32 %inc, i32* %i, align 4, !dbg !86
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  br label %if.end11, !dbg !91

if.else10:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %for.end
  ret void, !dbg !94
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_32_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  call void @goodB2G(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #7, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #7, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_32_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_32_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !121, metadata !DIExpression()), !dbg !122
  store i32* %data, i32** %dataPtr1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !123, metadata !DIExpression()), !dbg !124
  store i32* %data, i32** %dataPtr2, align 8, !dbg !124
  store i32 -1, i32* %data, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !129
  %1 = load i32, i32* %0, align 4, !dbg !130
  store i32 %1, i32* %data1, align 4, !dbg !128
  store i32 7, i32* %data1, align 4, !dbg !131
  %2 = load i32, i32* %data1, align 4, !dbg !132
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !133
  store i32 %2, i32* %3, align 4, !dbg !134
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !135, metadata !DIExpression()), !dbg !137
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !138
  %5 = load i32, i32* %4, align 4, !dbg !139
  store i32 %5, i32* %data2, align 4, !dbg !137
  call void @llvm.dbg.declare(metadata i32* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !143, metadata !DIExpression()), !dbg !144
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !144
  %7 = load i32, i32* %data2, align 4, !dbg !145
  %cmp = icmp slt i32 %7, 10, !dbg !147
  br i1 %cmp, label %if.then, label %if.else, !dbg !148

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !149
  %idxprom = sext i32 %8 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !151
  store i32 1, i32* %arrayidx, align 4, !dbg !152
  store i32 0, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !156
  %cmp3 = icmp slt i32 %9, 10, !dbg !158
  br i1 %cmp3, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !160
  %idxprom4 = sext i32 %10 to i64, !dbg !162
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !162
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !162
  call void @printIntLine(i32 %11), !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !165
  %inc = add nsw i32 %12, 1, !dbg !165
  store i32 %inc, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !169

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !173 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data4 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !176, metadata !DIExpression()), !dbg !177
  store i32* %data, i32** %dataPtr1, align 8, !dbg !177
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !178, metadata !DIExpression()), !dbg !179
  store i32* %data, i32** %dataPtr2, align 8, !dbg !179
  store i32 -1, i32* %data, align 4, !dbg !180
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !181, metadata !DIExpression()), !dbg !183
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !184
  %1 = load i32, i32* %0, align 4, !dbg !185
  store i32 %1, i32* %data1, align 4, !dbg !183
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !186, metadata !DIExpression()), !dbg !188
  %2 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !188
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !189
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !191
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %3), !dbg !192
  %cmp = icmp ne i8* %call, null, !dbg !193
  br i1 %cmp, label %if.then, label %if.else, !dbg !194

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !195
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !197
  store i32 %call3, i32* %data1, align 4, !dbg !198
  br label %if.end, !dbg !199

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !200
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %data1, align 4, !dbg !202
  %5 = load i32*, i32** %dataPtr1, align 8, !dbg !203
  store i32 %4, i32* %5, align 4, !dbg !204
  call void @llvm.dbg.declare(metadata i32* %data4, metadata !205, metadata !DIExpression()), !dbg !207
  %6 = load i32*, i32** %dataPtr2, align 8, !dbg !208
  %7 = load i32, i32* %6, align 4, !dbg !209
  store i32 %7, i32* %data4, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata i32* %i, metadata !210, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !213, metadata !DIExpression()), !dbg !214
  %8 = bitcast [10 x i32]* %buffer to i8*, !dbg !214
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !214
  %9 = load i32, i32* %data4, align 4, !dbg !215
  %cmp5 = icmp sge i32 %9, 0, !dbg !217
  br i1 %cmp5, label %land.lhs.true, label %if.else11, !dbg !218

land.lhs.true:                                    ; preds = %if.end
  %10 = load i32, i32* %data4, align 4, !dbg !219
  %cmp6 = icmp slt i32 %10, 10, !dbg !220
  br i1 %cmp6, label %if.then7, label %if.else11, !dbg !221

if.then7:                                         ; preds = %land.lhs.true
  %11 = load i32, i32* %data4, align 4, !dbg !222
  %idxprom = sext i32 %11 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !224
  store i32 1, i32* %arrayidx, align 4, !dbg !225
  store i32 0, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !228

for.cond:                                         ; preds = %for.inc, %if.then7
  %12 = load i32, i32* %i, align 4, !dbg !229
  %cmp8 = icmp slt i32 %12, 10, !dbg !231
  br i1 %cmp8, label %for.body, label %for.end, !dbg !232

for.body:                                         ; preds = %for.cond
  %13 = load i32, i32* %i, align 4, !dbg !233
  %idxprom9 = sext i32 %13 to i64, !dbg !235
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom9, !dbg !235
  %14 = load i32, i32* %arrayidx10, align 4, !dbg !235
  call void @printIntLine(i32 %14), !dbg !236
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !238
  %inc = add nsw i32 %15, 1, !dbg !238
  store i32 %inc, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !239, !llvm.loop !240

for.end:                                          ; preds = %for.cond
  br label %if.end12, !dbg !242

if.else11:                                        ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !243
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %for.end
  ret void, !dbg !245
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_32_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_32.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocalVariable(name: "dataPtr1", scope: !12, file: !13, line: 27, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!21 = !DILocation(line: 27, column: 10, scope: !12)
!22 = !DILocalVariable(name: "dataPtr2", scope: !12, file: !13, line: 28, type: !20)
!23 = !DILocation(line: 28, column: 10, scope: !12)
!24 = !DILocation(line: 30, column: 10, scope: !12)
!25 = !DILocalVariable(name: "data", scope: !26, file: !13, line: 32, type: !17)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 31, column: 5)
!27 = !DILocation(line: 32, column: 13, scope: !26)
!28 = !DILocation(line: 32, column: 21, scope: !26)
!29 = !DILocation(line: 32, column: 20, scope: !26)
!30 = !DILocalVariable(name: "inputBuffer", scope: !31, file: !13, line: 34, type: !32)
!31 = distinct !DILexicalBlock(scope: !26, file: !13, line: 33, column: 9)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 112, elements: !34)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !{!35}
!35 = !DISubrange(count: 14)
!36 = !DILocation(line: 34, column: 18, scope: !31)
!37 = !DILocation(line: 36, column: 23, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !13, line: 36, column: 17)
!39 = !DILocation(line: 36, column: 53, scope: !38)
!40 = !DILocation(line: 36, column: 17, scope: !38)
!41 = !DILocation(line: 36, column: 60, scope: !38)
!42 = !DILocation(line: 36, column: 17, scope: !31)
!43 = !DILocation(line: 39, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !13, line: 37, column: 13)
!45 = !DILocation(line: 39, column: 24, scope: !44)
!46 = !DILocation(line: 39, column: 22, scope: !44)
!47 = !DILocation(line: 40, column: 13, scope: !44)
!48 = !DILocation(line: 43, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !13, line: 42, column: 13)
!50 = !DILocation(line: 46, column: 21, scope: !26)
!51 = !DILocation(line: 46, column: 10, scope: !26)
!52 = !DILocation(line: 46, column: 19, scope: !26)
!53 = !DILocalVariable(name: "data", scope: !54, file: !13, line: 49, type: !17)
!54 = distinct !DILexicalBlock(scope: !12, file: !13, line: 48, column: 5)
!55 = !DILocation(line: 49, column: 13, scope: !54)
!56 = !DILocation(line: 49, column: 21, scope: !54)
!57 = !DILocation(line: 49, column: 20, scope: !54)
!58 = !DILocalVariable(name: "i", scope: !59, file: !13, line: 51, type: !17)
!59 = distinct !DILexicalBlock(scope: !54, file: !13, line: 50, column: 9)
!60 = !DILocation(line: 51, column: 17, scope: !59)
!61 = !DILocalVariable(name: "buffer", scope: !59, file: !13, line: 52, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 10)
!65 = !DILocation(line: 52, column: 17, scope: !59)
!66 = !DILocation(line: 55, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !59, file: !13, line: 55, column: 17)
!68 = !DILocation(line: 55, column: 22, scope: !67)
!69 = !DILocation(line: 55, column: 17, scope: !59)
!70 = !DILocation(line: 57, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !13, line: 56, column: 13)
!72 = !DILocation(line: 57, column: 17, scope: !71)
!73 = !DILocation(line: 57, column: 30, scope: !71)
!74 = !DILocation(line: 59, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !13, line: 59, column: 17)
!76 = !DILocation(line: 59, column: 21, scope: !75)
!77 = !DILocation(line: 59, column: 28, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !13, line: 59, column: 17)
!79 = !DILocation(line: 59, column: 30, scope: !78)
!80 = !DILocation(line: 59, column: 17, scope: !75)
!81 = !DILocation(line: 61, column: 41, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !13, line: 60, column: 17)
!83 = !DILocation(line: 61, column: 34, scope: !82)
!84 = !DILocation(line: 61, column: 21, scope: !82)
!85 = !DILocation(line: 62, column: 17, scope: !82)
!86 = !DILocation(line: 59, column: 37, scope: !78)
!87 = !DILocation(line: 59, column: 17, scope: !78)
!88 = distinct !{!88, !80, !89, !90}
!89 = !DILocation(line: 62, column: 17, scope: !75)
!90 = !{!"llvm.loop.mustprogress"}
!91 = !DILocation(line: 63, column: 13, scope: !71)
!92 = !DILocation(line: 66, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !67, file: !13, line: 65, column: 13)
!94 = !DILocation(line: 70, column: 1, scope: !12)
!95 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_32_good", scope: !13, file: !13, line: 163, type: !14, scopeLine: 164, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 165, column: 5, scope: !95)
!97 = !DILocation(line: 166, column: 5, scope: !95)
!98 = !DILocation(line: 167, column: 1, scope: !95)
!99 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 177, type: !100, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!17, !17, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !13, line: 177, type: !17)
!105 = !DILocation(line: 177, column: 14, scope: !99)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !13, line: 177, type: !102)
!107 = !DILocation(line: 177, column: 27, scope: !99)
!108 = !DILocation(line: 180, column: 22, scope: !99)
!109 = !DILocation(line: 180, column: 12, scope: !99)
!110 = !DILocation(line: 180, column: 5, scope: !99)
!111 = !DILocation(line: 182, column: 5, scope: !99)
!112 = !DILocation(line: 183, column: 5, scope: !99)
!113 = !DILocation(line: 184, column: 5, scope: !99)
!114 = !DILocation(line: 187, column: 5, scope: !99)
!115 = !DILocation(line: 188, column: 5, scope: !99)
!116 = !DILocation(line: 189, column: 5, scope: !99)
!117 = !DILocation(line: 191, column: 5, scope: !99)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 77, type: !14, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !13, line: 79, type: !17)
!120 = !DILocation(line: 79, column: 9, scope: !118)
!121 = !DILocalVariable(name: "dataPtr1", scope: !118, file: !13, line: 80, type: !20)
!122 = !DILocation(line: 80, column: 10, scope: !118)
!123 = !DILocalVariable(name: "dataPtr2", scope: !118, file: !13, line: 81, type: !20)
!124 = !DILocation(line: 81, column: 10, scope: !118)
!125 = !DILocation(line: 83, column: 10, scope: !118)
!126 = !DILocalVariable(name: "data", scope: !127, file: !13, line: 85, type: !17)
!127 = distinct !DILexicalBlock(scope: !118, file: !13, line: 84, column: 5)
!128 = !DILocation(line: 85, column: 13, scope: !127)
!129 = !DILocation(line: 85, column: 21, scope: !127)
!130 = !DILocation(line: 85, column: 20, scope: !127)
!131 = !DILocation(line: 88, column: 14, scope: !127)
!132 = !DILocation(line: 89, column: 21, scope: !127)
!133 = !DILocation(line: 89, column: 10, scope: !127)
!134 = !DILocation(line: 89, column: 19, scope: !127)
!135 = !DILocalVariable(name: "data", scope: !136, file: !13, line: 92, type: !17)
!136 = distinct !DILexicalBlock(scope: !118, file: !13, line: 91, column: 5)
!137 = !DILocation(line: 92, column: 13, scope: !136)
!138 = !DILocation(line: 92, column: 21, scope: !136)
!139 = !DILocation(line: 92, column: 20, scope: !136)
!140 = !DILocalVariable(name: "i", scope: !141, file: !13, line: 94, type: !17)
!141 = distinct !DILexicalBlock(scope: !136, file: !13, line: 93, column: 9)
!142 = !DILocation(line: 94, column: 17, scope: !141)
!143 = !DILocalVariable(name: "buffer", scope: !141, file: !13, line: 95, type: !62)
!144 = !DILocation(line: 95, column: 17, scope: !141)
!145 = !DILocation(line: 98, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !13, line: 98, column: 17)
!147 = !DILocation(line: 98, column: 22, scope: !146)
!148 = !DILocation(line: 98, column: 17, scope: !141)
!149 = !DILocation(line: 100, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !13, line: 99, column: 13)
!151 = !DILocation(line: 100, column: 17, scope: !150)
!152 = !DILocation(line: 100, column: 30, scope: !150)
!153 = !DILocation(line: 102, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !13, line: 102, column: 17)
!155 = !DILocation(line: 102, column: 21, scope: !154)
!156 = !DILocation(line: 102, column: 28, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !13, line: 102, column: 17)
!158 = !DILocation(line: 102, column: 30, scope: !157)
!159 = !DILocation(line: 102, column: 17, scope: !154)
!160 = !DILocation(line: 104, column: 41, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 103, column: 17)
!162 = !DILocation(line: 104, column: 34, scope: !161)
!163 = !DILocation(line: 104, column: 21, scope: !161)
!164 = !DILocation(line: 105, column: 17, scope: !161)
!165 = !DILocation(line: 102, column: 37, scope: !157)
!166 = !DILocation(line: 102, column: 17, scope: !157)
!167 = distinct !{!167, !159, !168, !90}
!168 = !DILocation(line: 105, column: 17, scope: !154)
!169 = !DILocation(line: 106, column: 13, scope: !150)
!170 = !DILocation(line: 109, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !146, file: !13, line: 108, column: 13)
!172 = !DILocation(line: 113, column: 1, scope: !118)
!173 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 116, type: !14, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!174 = !DILocalVariable(name: "data", scope: !173, file: !13, line: 118, type: !17)
!175 = !DILocation(line: 118, column: 9, scope: !173)
!176 = !DILocalVariable(name: "dataPtr1", scope: !173, file: !13, line: 119, type: !20)
!177 = !DILocation(line: 119, column: 10, scope: !173)
!178 = !DILocalVariable(name: "dataPtr2", scope: !173, file: !13, line: 120, type: !20)
!179 = !DILocation(line: 120, column: 10, scope: !173)
!180 = !DILocation(line: 122, column: 10, scope: !173)
!181 = !DILocalVariable(name: "data", scope: !182, file: !13, line: 124, type: !17)
!182 = distinct !DILexicalBlock(scope: !173, file: !13, line: 123, column: 5)
!183 = !DILocation(line: 124, column: 13, scope: !182)
!184 = !DILocation(line: 124, column: 21, scope: !182)
!185 = !DILocation(line: 124, column: 20, scope: !182)
!186 = !DILocalVariable(name: "inputBuffer", scope: !187, file: !13, line: 126, type: !32)
!187 = distinct !DILexicalBlock(scope: !182, file: !13, line: 125, column: 9)
!188 = !DILocation(line: 126, column: 18, scope: !187)
!189 = !DILocation(line: 128, column: 23, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !13, line: 128, column: 17)
!191 = !DILocation(line: 128, column: 53, scope: !190)
!192 = !DILocation(line: 128, column: 17, scope: !190)
!193 = !DILocation(line: 128, column: 60, scope: !190)
!194 = !DILocation(line: 128, column: 17, scope: !187)
!195 = !DILocation(line: 131, column: 29, scope: !196)
!196 = distinct !DILexicalBlock(scope: !190, file: !13, line: 129, column: 13)
!197 = !DILocation(line: 131, column: 24, scope: !196)
!198 = !DILocation(line: 131, column: 22, scope: !196)
!199 = !DILocation(line: 132, column: 13, scope: !196)
!200 = !DILocation(line: 135, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !190, file: !13, line: 134, column: 13)
!202 = !DILocation(line: 138, column: 21, scope: !182)
!203 = !DILocation(line: 138, column: 10, scope: !182)
!204 = !DILocation(line: 138, column: 19, scope: !182)
!205 = !DILocalVariable(name: "data", scope: !206, file: !13, line: 141, type: !17)
!206 = distinct !DILexicalBlock(scope: !173, file: !13, line: 140, column: 5)
!207 = !DILocation(line: 141, column: 13, scope: !206)
!208 = !DILocation(line: 141, column: 21, scope: !206)
!209 = !DILocation(line: 141, column: 20, scope: !206)
!210 = !DILocalVariable(name: "i", scope: !211, file: !13, line: 143, type: !17)
!211 = distinct !DILexicalBlock(scope: !206, file: !13, line: 142, column: 9)
!212 = !DILocation(line: 143, column: 17, scope: !211)
!213 = !DILocalVariable(name: "buffer", scope: !211, file: !13, line: 144, type: !62)
!214 = !DILocation(line: 144, column: 17, scope: !211)
!215 = !DILocation(line: 146, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !13, line: 146, column: 17)
!217 = !DILocation(line: 146, column: 22, scope: !216)
!218 = !DILocation(line: 146, column: 27, scope: !216)
!219 = !DILocation(line: 146, column: 30, scope: !216)
!220 = !DILocation(line: 146, column: 35, scope: !216)
!221 = !DILocation(line: 146, column: 17, scope: !211)
!222 = !DILocation(line: 148, column: 24, scope: !223)
!223 = distinct !DILexicalBlock(scope: !216, file: !13, line: 147, column: 13)
!224 = !DILocation(line: 148, column: 17, scope: !223)
!225 = !DILocation(line: 148, column: 30, scope: !223)
!226 = !DILocation(line: 150, column: 23, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !13, line: 150, column: 17)
!228 = !DILocation(line: 150, column: 21, scope: !227)
!229 = !DILocation(line: 150, column: 28, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !13, line: 150, column: 17)
!231 = !DILocation(line: 150, column: 30, scope: !230)
!232 = !DILocation(line: 150, column: 17, scope: !227)
!233 = !DILocation(line: 152, column: 41, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !13, line: 151, column: 17)
!235 = !DILocation(line: 152, column: 34, scope: !234)
!236 = !DILocation(line: 152, column: 21, scope: !234)
!237 = !DILocation(line: 153, column: 17, scope: !234)
!238 = !DILocation(line: 150, column: 37, scope: !230)
!239 = !DILocation(line: 150, column: 17, scope: !230)
!240 = distinct !{!240, !232, !241, !90}
!241 = !DILocation(line: 153, column: 17, scope: !227)
!242 = !DILocation(line: 154, column: 13, scope: !223)
!243 = !DILocation(line: 157, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !216, file: !13, line: 156, column: 13)
!245 = !DILocation(line: 161, column: 1, scope: !173)
