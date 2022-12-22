; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !26
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !27
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !30
  %cmp = icmp ne i8* %call, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !35
  store i32 %call2, i32* %data, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !43, metadata !DIExpression()), !dbg !47
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !47
  %3 = load i32, i32* %data, align 4, !dbg !48
  %cmp3 = icmp sge i32 %3, 0, !dbg !50
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !51

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !52
  %idxprom = sext i32 %4 to i64, !dbg !54
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !54
  store i32 1, i32* %arrayidx, align 4, !dbg !55
  store i32 0, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !59
  %cmp5 = icmp slt i32 %5, 10, !dbg !61
  br i1 %cmp5, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !63
  %idxprom6 = sext i32 %6 to i64, !dbg !65
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !65
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !65
  call void @printIntLine(i32 %7), !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !68
  %inc = add nsw i32 %8, 1, !dbg !68
  store i32 %inc, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !73

if.else8:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  ret void, !dbg !76
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  call void @goodB2G(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32 -1, i32* %data, align 4, !dbg !103
  store i32 7, i32* %data, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %i, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !109
  %1 = load i32, i32* %data, align 4, !dbg !110
  %cmp = icmp sge i32 %1, 0, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !114
  %idxprom = sext i32 %2 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !116
  store i32 1, i32* %arrayidx, align 4, !dbg !117
  store i32 0, i32* %i, align 4, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !121
  %cmp1 = icmp slt i32 %3, 10, !dbg !123
  br i1 %cmp1, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !125
  %idxprom2 = sext i32 %4 to i64, !dbg !127
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !127
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !127
  call void @printIntLine(i32 %5), !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !130
  %inc = add nsw i32 %6, 1, !dbg !130
  store i32 %inc, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !135
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !138 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !139, metadata !DIExpression()), !dbg !140
  store i32 -1, i32* %data, align 4, !dbg !141
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !142, metadata !DIExpression()), !dbg !144
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !144
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !145
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !147
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !148
  %cmp = icmp ne i8* %call, null, !dbg !149
  br i1 %cmp, label %if.then, label %if.else, !dbg !150

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !151
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !153
  store i32 %call2, i32* %data, align 4, !dbg !154
  br label %if.end, !dbg !155

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !156
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !161, metadata !DIExpression()), !dbg !162
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !162
  %3 = load i32, i32* %data, align 4, !dbg !163
  %cmp3 = icmp sge i32 %3, 0, !dbg !165
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !166

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !167
  %cmp4 = icmp slt i32 %4, 10, !dbg !168
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !169

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !170
  %idxprom = sext i32 %5 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !172
  store i32 1, i32* %arrayidx, align 4, !dbg !173
  store i32 0, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !177
  %cmp6 = icmp slt i32 %6, 10, !dbg !179
  br i1 %cmp6, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !181
  %idxprom7 = sext i32 %7 to i64, !dbg !183
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !183
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !183
  call void @printIntLine(i32 %8), !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !186
  %inc = add nsw i32 %9, 1, !dbg !186
  store i32 %inc, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !190

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !191
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !193
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 30, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 30, column: 14, scope: !21)
!27 = !DILocation(line: 32, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 32, column: 13)
!29 = !DILocation(line: 32, column: 49, scope: !28)
!30 = !DILocation(line: 32, column: 13, scope: !28)
!31 = !DILocation(line: 32, column: 56, scope: !28)
!32 = !DILocation(line: 32, column: 13, scope: !21)
!33 = !DILocation(line: 35, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 33, column: 9)
!35 = !DILocation(line: 35, column: 20, scope: !34)
!36 = !DILocation(line: 35, column: 18, scope: !34)
!37 = !DILocation(line: 36, column: 9, scope: !34)
!38 = !DILocation(line: 39, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 38, column: 9)
!40 = !DILocalVariable(name: "i", scope: !41, file: !13, line: 43, type: !17)
!41 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 5)
!42 = !DILocation(line: 43, column: 13, scope: !41)
!43 = !DILocalVariable(name: "buffer", scope: !41, file: !13, line: 44, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DILocation(line: 44, column: 13, scope: !41)
!48 = !DILocation(line: 47, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !13, line: 47, column: 13)
!50 = !DILocation(line: 47, column: 18, scope: !49)
!51 = !DILocation(line: 47, column: 13, scope: !41)
!52 = !DILocation(line: 49, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !13, line: 48, column: 9)
!54 = !DILocation(line: 49, column: 13, scope: !53)
!55 = !DILocation(line: 49, column: 26, scope: !53)
!56 = !DILocation(line: 51, column: 19, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !13, line: 51, column: 13)
!58 = !DILocation(line: 51, column: 17, scope: !57)
!59 = !DILocation(line: 51, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !13, line: 51, column: 13)
!61 = !DILocation(line: 51, column: 26, scope: !60)
!62 = !DILocation(line: 51, column: 13, scope: !57)
!63 = !DILocation(line: 53, column: 37, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 52, column: 13)
!65 = !DILocation(line: 53, column: 30, scope: !64)
!66 = !DILocation(line: 53, column: 17, scope: !64)
!67 = !DILocation(line: 54, column: 13, scope: !64)
!68 = !DILocation(line: 51, column: 33, scope: !60)
!69 = !DILocation(line: 51, column: 13, scope: !60)
!70 = distinct !{!70, !62, !71, !72}
!71 = !DILocation(line: 54, column: 13, scope: !57)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 55, column: 9, scope: !53)
!74 = !DILocation(line: 58, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !49, file: !13, line: 57, column: 9)
!76 = !DILocation(line: 61, column: 1, scope: !12)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_good", scope: !13, file: !13, line: 136, type: !14, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 138, column: 5, scope: !77)
!79 = !DILocation(line: 139, column: 5, scope: !77)
!80 = !DILocation(line: 140, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 151, type: !82, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!17, !17, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !13, line: 151, type: !17)
!87 = !DILocation(line: 151, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !13, line: 151, type: !84)
!89 = !DILocation(line: 151, column: 27, scope: !81)
!90 = !DILocation(line: 154, column: 22, scope: !81)
!91 = !DILocation(line: 154, column: 12, scope: !81)
!92 = !DILocation(line: 154, column: 5, scope: !81)
!93 = !DILocation(line: 156, column: 5, scope: !81)
!94 = !DILocation(line: 157, column: 5, scope: !81)
!95 = !DILocation(line: 158, column: 5, scope: !81)
!96 = !DILocation(line: 161, column: 5, scope: !81)
!97 = !DILocation(line: 162, column: 5, scope: !81)
!98 = !DILocation(line: 163, column: 5, scope: !81)
!99 = !DILocation(line: 165, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !13, line: 70, type: !17)
!102 = !DILocation(line: 70, column: 9, scope: !100)
!103 = !DILocation(line: 72, column: 10, scope: !100)
!104 = !DILocation(line: 75, column: 10, scope: !100)
!105 = !DILocalVariable(name: "i", scope: !106, file: !13, line: 77, type: !17)
!106 = distinct !DILexicalBlock(scope: !100, file: !13, line: 76, column: 5)
!107 = !DILocation(line: 77, column: 13, scope: !106)
!108 = !DILocalVariable(name: "buffer", scope: !106, file: !13, line: 78, type: !44)
!109 = !DILocation(line: 78, column: 13, scope: !106)
!110 = !DILocation(line: 81, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !13, line: 81, column: 13)
!112 = !DILocation(line: 81, column: 18, scope: !111)
!113 = !DILocation(line: 81, column: 13, scope: !106)
!114 = !DILocation(line: 83, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !13, line: 82, column: 9)
!116 = !DILocation(line: 83, column: 13, scope: !115)
!117 = !DILocation(line: 83, column: 26, scope: !115)
!118 = !DILocation(line: 85, column: 19, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !13, line: 85, column: 13)
!120 = !DILocation(line: 85, column: 17, scope: !119)
!121 = !DILocation(line: 85, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !13, line: 85, column: 13)
!123 = !DILocation(line: 85, column: 26, scope: !122)
!124 = !DILocation(line: 85, column: 13, scope: !119)
!125 = !DILocation(line: 87, column: 37, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 86, column: 13)
!127 = !DILocation(line: 87, column: 30, scope: !126)
!128 = !DILocation(line: 87, column: 17, scope: !126)
!129 = !DILocation(line: 88, column: 13, scope: !126)
!130 = !DILocation(line: 85, column: 33, scope: !122)
!131 = !DILocation(line: 85, column: 13, scope: !122)
!132 = distinct !{!132, !124, !133, !72}
!133 = !DILocation(line: 88, column: 13, scope: !119)
!134 = !DILocation(line: 89, column: 9, scope: !115)
!135 = !DILocation(line: 92, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !111, file: !13, line: 91, column: 9)
!137 = !DILocation(line: 95, column: 1, scope: !100)
!138 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 98, type: !14, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !13, line: 100, type: !17)
!140 = !DILocation(line: 100, column: 9, scope: !138)
!141 = !DILocation(line: 102, column: 10, scope: !138)
!142 = !DILocalVariable(name: "inputBuffer", scope: !143, file: !13, line: 104, type: !22)
!143 = distinct !DILexicalBlock(scope: !138, file: !13, line: 103, column: 5)
!144 = !DILocation(line: 104, column: 14, scope: !143)
!145 = !DILocation(line: 106, column: 19, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !13, line: 106, column: 13)
!147 = !DILocation(line: 106, column: 49, scope: !146)
!148 = !DILocation(line: 106, column: 13, scope: !146)
!149 = !DILocation(line: 106, column: 56, scope: !146)
!150 = !DILocation(line: 106, column: 13, scope: !143)
!151 = !DILocation(line: 109, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !13, line: 107, column: 9)
!153 = !DILocation(line: 109, column: 20, scope: !152)
!154 = !DILocation(line: 109, column: 18, scope: !152)
!155 = !DILocation(line: 110, column: 9, scope: !152)
!156 = !DILocation(line: 113, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !146, file: !13, line: 112, column: 9)
!158 = !DILocalVariable(name: "i", scope: !159, file: !13, line: 117, type: !17)
!159 = distinct !DILexicalBlock(scope: !138, file: !13, line: 116, column: 5)
!160 = !DILocation(line: 117, column: 13, scope: !159)
!161 = !DILocalVariable(name: "buffer", scope: !159, file: !13, line: 118, type: !44)
!162 = !DILocation(line: 118, column: 13, scope: !159)
!163 = !DILocation(line: 120, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !13, line: 120, column: 13)
!165 = !DILocation(line: 120, column: 18, scope: !164)
!166 = !DILocation(line: 120, column: 23, scope: !164)
!167 = !DILocation(line: 120, column: 26, scope: !164)
!168 = !DILocation(line: 120, column: 31, scope: !164)
!169 = !DILocation(line: 120, column: 13, scope: !159)
!170 = !DILocation(line: 122, column: 20, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !13, line: 121, column: 9)
!172 = !DILocation(line: 122, column: 13, scope: !171)
!173 = !DILocation(line: 122, column: 26, scope: !171)
!174 = !DILocation(line: 124, column: 19, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !13, line: 124, column: 13)
!176 = !DILocation(line: 124, column: 17, scope: !175)
!177 = !DILocation(line: 124, column: 24, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !13, line: 124, column: 13)
!179 = !DILocation(line: 124, column: 26, scope: !178)
!180 = !DILocation(line: 124, column: 13, scope: !175)
!181 = !DILocation(line: 126, column: 37, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !13, line: 125, column: 13)
!183 = !DILocation(line: 126, column: 30, scope: !182)
!184 = !DILocation(line: 126, column: 17, scope: !182)
!185 = !DILocation(line: 127, column: 13, scope: !182)
!186 = !DILocation(line: 124, column: 33, scope: !178)
!187 = !DILocation(line: 124, column: 13, scope: !178)
!188 = distinct !{!188, !180, !189, !72}
!189 = !DILocation(line: 127, column: 13, scope: !175)
!190 = !DILocation(line: 128, column: 9, scope: !171)
!191 = !DILocation(line: 131, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !164, file: !13, line: 130, column: 9)
!193 = !DILocation(line: 134, column: 1, scope: !138)
