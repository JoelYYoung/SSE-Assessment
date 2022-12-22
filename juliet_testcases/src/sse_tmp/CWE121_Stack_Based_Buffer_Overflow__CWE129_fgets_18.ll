; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18.c"
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
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  br label %source, !dbg !20

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !21), !dbg !22
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !23, metadata !DIExpression()), !dbg !29
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !30
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !32
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !33
  %cmp = icmp ne i8* %call, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %source
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !38
  store i32 %call2, i32* %data, align 4, !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %source
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sink, !dbg !43

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !44), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %i, metadata !46, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !49, metadata !DIExpression()), !dbg !53
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !53
  %3 = load i32, i32* %data, align 4, !dbg !54
  %cmp3 = icmp sge i32 %3, 0, !dbg !56
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !57

if.then4:                                         ; preds = %sink
  %4 = load i32, i32* %data, align 4, !dbg !58
  %idxprom = sext i32 %4 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !65
  %cmp5 = icmp slt i32 %5, 10, !dbg !67
  br i1 %cmp5, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !69
  %idxprom6 = sext i32 %6 to i64, !dbg !71
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !71
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !71
  call void @printIntLine(i32 %7), !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %8, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !79

if.else8:                                         ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18_good() #0 !dbg !83 {
entry:
  call void @goodB2G(), !dbg !84
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  br label %source, !dbg !110

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !111), !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !115
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !116
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !118
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !119
  %cmp = icmp ne i8* %call, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %source
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !122
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !124
  store i32 %call2, i32* %data, align 4, !dbg !125
  br label %if.end, !dbg !126

if.else:                                          ; preds = %source
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sink, !dbg !129

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !130), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !136
  %3 = load i32, i32* %data, align 4, !dbg !137
  %cmp3 = icmp sge i32 %3, 0, !dbg !139
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !140

land.lhs.true:                                    ; preds = %sink
  %4 = load i32, i32* %data, align 4, !dbg !141
  %cmp4 = icmp slt i32 %4, 10, !dbg !142
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !143

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !144
  %idxprom = sext i32 %5 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !146
  store i32 1, i32* %arrayidx, align 4, !dbg !147
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !151
  %cmp6 = icmp slt i32 %6, 10, !dbg !153
  br i1 %cmp6, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !155
  %idxprom7 = sext i32 %7 to i64, !dbg !157
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !157
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !157
  call void @printIntLine(i32 %8), !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !160
  %inc = add nsw i32 %9, 1, !dbg !160
  store i32 %inc, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !164

if.else9:                                         ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !165
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !167
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !168 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 -1, i32* %data, align 4, !dbg !171
  br label %source, !dbg !172

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !173), !dbg !174
  store i32 7, i32* %data, align 4, !dbg !175
  br label %sink, !dbg !176

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !177), !dbg !178
  call void @llvm.dbg.declare(metadata i32* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !182, metadata !DIExpression()), !dbg !183
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !183
  %1 = load i32, i32* %data, align 4, !dbg !184
  %cmp = icmp sge i32 %1, 0, !dbg !186
  br i1 %cmp, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !188
  %idxprom = sext i32 %2 to i64, !dbg !190
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !190
  store i32 1, i32* %arrayidx, align 4, !dbg !191
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !195
  %cmp1 = icmp slt i32 %3, 10, !dbg !197
  br i1 %cmp1, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !199
  %idxprom2 = sext i32 %4 to i64, !dbg !201
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !201
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !201
  call void @printIntLine(i32 %5), !dbg !202
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !204
  %inc = add nsw i32 %6, 1, !dbg !204
  store i32 %inc, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !208

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !209
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !211
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 5, scope: !12)
!21 = !DILabel(scope: !12, name: "source", file: !13, line: 30)
!22 = !DILocation(line: 30, column: 1, scope: !12)
!23 = !DILocalVariable(name: "inputBuffer", scope: !24, file: !13, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !12, file: !13, line: 31, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 112, elements: !27)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !{!28}
!28 = !DISubrange(count: 14)
!29 = !DILocation(line: 32, column: 14, scope: !24)
!30 = !DILocation(line: 34, column: 19, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !13, line: 34, column: 13)
!32 = !DILocation(line: 34, column: 49, scope: !31)
!33 = !DILocation(line: 34, column: 13, scope: !31)
!34 = !DILocation(line: 34, column: 56, scope: !31)
!35 = !DILocation(line: 34, column: 13, scope: !24)
!36 = !DILocation(line: 37, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 35, column: 9)
!38 = !DILocation(line: 37, column: 20, scope: !37)
!39 = !DILocation(line: 37, column: 18, scope: !37)
!40 = !DILocation(line: 38, column: 9, scope: !37)
!41 = !DILocation(line: 41, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !13, line: 40, column: 9)
!43 = !DILocation(line: 44, column: 5, scope: !12)
!44 = !DILabel(scope: !12, name: "sink", file: !13, line: 45)
!45 = !DILocation(line: 45, column: 1, scope: !12)
!46 = !DILocalVariable(name: "i", scope: !47, file: !13, line: 47, type: !17)
!47 = distinct !DILexicalBlock(scope: !12, file: !13, line: 46, column: 5)
!48 = !DILocation(line: 47, column: 13, scope: !47)
!49 = !DILocalVariable(name: "buffer", scope: !47, file: !13, line: 48, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 10)
!53 = !DILocation(line: 48, column: 13, scope: !47)
!54 = !DILocation(line: 51, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !13, line: 51, column: 13)
!56 = !DILocation(line: 51, column: 18, scope: !55)
!57 = !DILocation(line: 51, column: 13, scope: !47)
!58 = !DILocation(line: 53, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !13, line: 52, column: 9)
!60 = !DILocation(line: 53, column: 13, scope: !59)
!61 = !DILocation(line: 53, column: 26, scope: !59)
!62 = !DILocation(line: 55, column: 19, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !13, line: 55, column: 13)
!64 = !DILocation(line: 55, column: 17, scope: !63)
!65 = !DILocation(line: 55, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !13, line: 55, column: 13)
!67 = !DILocation(line: 55, column: 26, scope: !66)
!68 = !DILocation(line: 55, column: 13, scope: !63)
!69 = !DILocation(line: 57, column: 37, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !13, line: 56, column: 13)
!71 = !DILocation(line: 57, column: 30, scope: !70)
!72 = !DILocation(line: 57, column: 17, scope: !70)
!73 = !DILocation(line: 58, column: 13, scope: !70)
!74 = !DILocation(line: 55, column: 33, scope: !66)
!75 = !DILocation(line: 55, column: 13, scope: !66)
!76 = distinct !{!76, !68, !77, !78}
!77 = !DILocation(line: 58, column: 13, scope: !63)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 59, column: 9, scope: !59)
!80 = !DILocation(line: 62, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !55, file: !13, line: 61, column: 9)
!82 = !DILocation(line: 65, column: 1, scope: !12)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_18_good", scope: !13, file: !13, line: 148, type: !14, scopeLine: 149, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 150, column: 5, scope: !83)
!85 = !DILocation(line: 151, column: 5, scope: !83)
!86 = !DILocation(line: 152, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 163, type: !88, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!17, !17, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !13, line: 163, type: !17)
!93 = !DILocation(line: 163, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !13, line: 163, type: !90)
!95 = !DILocation(line: 163, column: 27, scope: !87)
!96 = !DILocation(line: 166, column: 22, scope: !87)
!97 = !DILocation(line: 166, column: 12, scope: !87)
!98 = !DILocation(line: 166, column: 5, scope: !87)
!99 = !DILocation(line: 168, column: 5, scope: !87)
!100 = !DILocation(line: 169, column: 5, scope: !87)
!101 = !DILocation(line: 170, column: 5, scope: !87)
!102 = !DILocation(line: 173, column: 5, scope: !87)
!103 = !DILocation(line: 174, column: 5, scope: !87)
!104 = !DILocation(line: 175, column: 5, scope: !87)
!105 = !DILocation(line: 177, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 72, type: !14, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 74, type: !17)
!108 = !DILocation(line: 74, column: 9, scope: !106)
!109 = !DILocation(line: 76, column: 10, scope: !106)
!110 = !DILocation(line: 77, column: 5, scope: !106)
!111 = !DILabel(scope: !106, name: "source", file: !13, line: 78)
!112 = !DILocation(line: 78, column: 1, scope: !106)
!113 = !DILocalVariable(name: "inputBuffer", scope: !114, file: !13, line: 80, type: !25)
!114 = distinct !DILexicalBlock(scope: !106, file: !13, line: 79, column: 5)
!115 = !DILocation(line: 80, column: 14, scope: !114)
!116 = !DILocation(line: 82, column: 19, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !13, line: 82, column: 13)
!118 = !DILocation(line: 82, column: 49, scope: !117)
!119 = !DILocation(line: 82, column: 13, scope: !117)
!120 = !DILocation(line: 82, column: 56, scope: !117)
!121 = !DILocation(line: 82, column: 13, scope: !114)
!122 = !DILocation(line: 85, column: 25, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !13, line: 83, column: 9)
!124 = !DILocation(line: 85, column: 20, scope: !123)
!125 = !DILocation(line: 85, column: 18, scope: !123)
!126 = !DILocation(line: 86, column: 9, scope: !123)
!127 = !DILocation(line: 89, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !117, file: !13, line: 88, column: 9)
!129 = !DILocation(line: 92, column: 5, scope: !106)
!130 = !DILabel(scope: !106, name: "sink", file: !13, line: 93)
!131 = !DILocation(line: 93, column: 1, scope: !106)
!132 = !DILocalVariable(name: "i", scope: !133, file: !13, line: 95, type: !17)
!133 = distinct !DILexicalBlock(scope: !106, file: !13, line: 94, column: 5)
!134 = !DILocation(line: 95, column: 13, scope: !133)
!135 = !DILocalVariable(name: "buffer", scope: !133, file: !13, line: 96, type: !50)
!136 = !DILocation(line: 96, column: 13, scope: !133)
!137 = !DILocation(line: 98, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !13, line: 98, column: 13)
!139 = !DILocation(line: 98, column: 18, scope: !138)
!140 = !DILocation(line: 98, column: 23, scope: !138)
!141 = !DILocation(line: 98, column: 26, scope: !138)
!142 = !DILocation(line: 98, column: 31, scope: !138)
!143 = !DILocation(line: 98, column: 13, scope: !133)
!144 = !DILocation(line: 100, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !138, file: !13, line: 99, column: 9)
!146 = !DILocation(line: 100, column: 13, scope: !145)
!147 = !DILocation(line: 100, column: 26, scope: !145)
!148 = !DILocation(line: 102, column: 19, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !13, line: 102, column: 13)
!150 = !DILocation(line: 102, column: 17, scope: !149)
!151 = !DILocation(line: 102, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !13, line: 102, column: 13)
!153 = !DILocation(line: 102, column: 26, scope: !152)
!154 = !DILocation(line: 102, column: 13, scope: !149)
!155 = !DILocation(line: 104, column: 37, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !13, line: 103, column: 13)
!157 = !DILocation(line: 104, column: 30, scope: !156)
!158 = !DILocation(line: 104, column: 17, scope: !156)
!159 = !DILocation(line: 105, column: 13, scope: !156)
!160 = !DILocation(line: 102, column: 33, scope: !152)
!161 = !DILocation(line: 102, column: 13, scope: !152)
!162 = distinct !{!162, !154, !163, !78}
!163 = !DILocation(line: 105, column: 13, scope: !149)
!164 = !DILocation(line: 106, column: 9, scope: !145)
!165 = !DILocation(line: 109, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !138, file: !13, line: 108, column: 9)
!167 = !DILocation(line: 112, column: 1, scope: !106)
!168 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 115, type: !14, scopeLine: 116, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!169 = !DILocalVariable(name: "data", scope: !168, file: !13, line: 117, type: !17)
!170 = !DILocation(line: 117, column: 9, scope: !168)
!171 = !DILocation(line: 119, column: 10, scope: !168)
!172 = !DILocation(line: 120, column: 5, scope: !168)
!173 = !DILabel(scope: !168, name: "source", file: !13, line: 121)
!174 = !DILocation(line: 121, column: 1, scope: !168)
!175 = !DILocation(line: 124, column: 10, scope: !168)
!176 = !DILocation(line: 125, column: 5, scope: !168)
!177 = !DILabel(scope: !168, name: "sink", file: !13, line: 126)
!178 = !DILocation(line: 126, column: 1, scope: !168)
!179 = !DILocalVariable(name: "i", scope: !180, file: !13, line: 128, type: !17)
!180 = distinct !DILexicalBlock(scope: !168, file: !13, line: 127, column: 5)
!181 = !DILocation(line: 128, column: 13, scope: !180)
!182 = !DILocalVariable(name: "buffer", scope: !180, file: !13, line: 129, type: !50)
!183 = !DILocation(line: 129, column: 13, scope: !180)
!184 = !DILocation(line: 132, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !13, line: 132, column: 13)
!186 = !DILocation(line: 132, column: 18, scope: !185)
!187 = !DILocation(line: 132, column: 13, scope: !180)
!188 = !DILocation(line: 134, column: 20, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !13, line: 133, column: 9)
!190 = !DILocation(line: 134, column: 13, scope: !189)
!191 = !DILocation(line: 134, column: 26, scope: !189)
!192 = !DILocation(line: 136, column: 19, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !13, line: 136, column: 13)
!194 = !DILocation(line: 136, column: 17, scope: !193)
!195 = !DILocation(line: 136, column: 24, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !13, line: 136, column: 13)
!197 = !DILocation(line: 136, column: 26, scope: !196)
!198 = !DILocation(line: 136, column: 13, scope: !193)
!199 = !DILocation(line: 138, column: 37, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !13, line: 137, column: 13)
!201 = !DILocation(line: 138, column: 30, scope: !200)
!202 = !DILocation(line: 138, column: 17, scope: !200)
!203 = !DILocation(line: 139, column: 13, scope: !200)
!204 = !DILocation(line: 136, column: 33, scope: !196)
!205 = !DILocation(line: 136, column: 13, scope: !196)
!206 = distinct !{!206, !198, !207, !78}
!207 = !DILocation(line: 139, column: 13, scope: !193)
!208 = !DILocation(line: 140, column: 9, scope: !189)
!209 = !DILocation(line: 143, column: 13, scope: !210)
!210 = distinct !DILexicalBlock(scope: !185, file: !13, line: 142, column: 9)
!211 = !DILocation(line: 146, column: 1, scope: !168)
