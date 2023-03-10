; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fscanf_41_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !19
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !20
  %1 = load i32, i32* %data, align 4, !dbg !21
  call void @badSink(i32 %1), !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !24 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !29, metadata !DIExpression()), !dbg !34
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !34
  %1 = load i32, i32* %data.addr, align 4, !dbg !35
  %cmp = icmp slt i32 %1, 10, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !39
  %idxprom = sext i32 %2 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  %3 = load i32, i32* %arrayidx, align 4, !dbg !41
  call void @printIntLine(i32 %3), !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fscanf_41_good() #0 !dbg !47 {
entry:
  call void @goodB2G(), !dbg !48
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__CWE839_fscanf_41_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__CWE839_fscanf_41_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !71 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 -1, i32* %data, align 4, !dbg !74
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !75
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !76
  %1 = load i32, i32* %data, align 4, !dbg !77
  call void @goodB2GSink(i32 %1), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !80 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !83, metadata !DIExpression()), !dbg !85
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !85
  %1 = load i32, i32* %data.addr, align 4, !dbg !86
  %cmp = icmp sge i32 %1, 0, !dbg !88
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !89

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !90
  %cmp1 = icmp slt i32 %2, 10, !dbg !91
  br i1 %cmp1, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !93
  %idxprom = sext i32 %3 to i64, !dbg !95
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !95
  %4 = load i32, i32* %arrayidx, align 4, !dbg !95
  call void @printIntLine(i32 %4), !dbg !96
  br label %if.end, !dbg !97

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %data, align 4, !dbg !104
  store i32 7, i32* %data, align 4, !dbg !105
  %0 = load i32, i32* %data, align 4, !dbg !106
  call void @goodG2BSink(i32 %0), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !109 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !112, metadata !DIExpression()), !dbg !114
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !114
  %1 = load i32, i32* %data.addr, align 4, !dbg !115
  %cmp = icmp slt i32 %1, 10, !dbg !117
  br i1 %cmp, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !119
  %idxprom = sext i32 %2 to i64, !dbg !121
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !121
  %3 = load i32, i32* %arrayidx, align 4, !dbg !121
  call void @printIntLine(i32 %3), !dbg !122
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fscanf_41_bad", scope: !12, file: !12, line: 39, type: !13, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 41, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 41, column: 9, scope: !11)
!18 = !DILocation(line: 43, column: 10, scope: !11)
!19 = !DILocation(line: 45, column: 12, scope: !11)
!20 = !DILocation(line: 45, column: 5, scope: !11)
!21 = !DILocation(line: 46, column: 13, scope: !11)
!22 = !DILocation(line: 46, column: 5, scope: !11)
!23 = !DILocation(line: 47, column: 1, scope: !11)
!24 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 22, type: !25, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !16}
!27 = !DILocalVariable(name: "data", arg: 1, scope: !24, file: !12, line: 22, type: !16)
!28 = !DILocation(line: 22, column: 25, scope: !24)
!29 = !DILocalVariable(name: "buffer", scope: !30, file: !12, line: 25, type: !31)
!30 = distinct !DILexicalBlock(scope: !24, file: !12, line: 24, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 25, column: 13, scope: !30)
!35 = !DILocation(line: 28, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !12, line: 28, column: 13)
!37 = !DILocation(line: 28, column: 18, scope: !36)
!38 = !DILocation(line: 28, column: 13, scope: !30)
!39 = !DILocation(line: 30, column: 33, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 29, column: 9)
!41 = !DILocation(line: 30, column: 26, scope: !40)
!42 = !DILocation(line: 30, column: 13, scope: !40)
!43 = !DILocation(line: 31, column: 9, scope: !40)
!44 = !DILocation(line: 34, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 9)
!46 = !DILocation(line: 37, column: 1, scope: !24)
!47 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fscanf_41_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 111, column: 5, scope: !47)
!49 = !DILocation(line: 112, column: 5, scope: !47)
!50 = !DILocation(line: 113, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !52, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!16, !16, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 124, type: !16)
!58 = !DILocation(line: 124, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 124, type: !54)
!60 = !DILocation(line: 124, column: 27, scope: !51)
!61 = !DILocation(line: 127, column: 22, scope: !51)
!62 = !DILocation(line: 127, column: 12, scope: !51)
!63 = !DILocation(line: 127, column: 5, scope: !51)
!64 = !DILocation(line: 129, column: 5, scope: !51)
!65 = !DILocation(line: 130, column: 5, scope: !51)
!66 = !DILocation(line: 131, column: 5, scope: !51)
!67 = !DILocation(line: 134, column: 5, scope: !51)
!68 = !DILocation(line: 135, column: 5, scope: !51)
!69 = !DILocation(line: 136, column: 5, scope: !51)
!70 = !DILocation(line: 138, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 101, type: !16)
!73 = !DILocation(line: 101, column: 9, scope: !71)
!74 = !DILocation(line: 103, column: 10, scope: !71)
!75 = !DILocation(line: 105, column: 12, scope: !71)
!76 = !DILocation(line: 105, column: 5, scope: !71)
!77 = !DILocation(line: 106, column: 17, scope: !71)
!78 = !DILocation(line: 106, column: 5, scope: !71)
!79 = !DILocation(line: 107, column: 1, scope: !71)
!80 = distinct !DISubprogram(name: "goodB2GSink", scope: !12, file: !12, line: 83, type: !25, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !12, line: 83, type: !16)
!82 = !DILocation(line: 83, column: 29, scope: !80)
!83 = !DILocalVariable(name: "buffer", scope: !84, file: !12, line: 86, type: !31)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 85, column: 5)
!85 = !DILocation(line: 86, column: 13, scope: !84)
!86 = !DILocation(line: 88, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 88, column: 13)
!88 = !DILocation(line: 88, column: 18, scope: !87)
!89 = !DILocation(line: 88, column: 23, scope: !87)
!90 = !DILocation(line: 88, column: 26, scope: !87)
!91 = !DILocation(line: 88, column: 31, scope: !87)
!92 = !DILocation(line: 88, column: 13, scope: !84)
!93 = !DILocation(line: 90, column: 33, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !12, line: 89, column: 9)
!95 = !DILocation(line: 90, column: 26, scope: !94)
!96 = !DILocation(line: 90, column: 13, scope: !94)
!97 = !DILocation(line: 91, column: 9, scope: !94)
!98 = !DILocation(line: 94, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !87, file: !12, line: 93, column: 9)
!100 = !DILocation(line: 97, column: 1, scope: !80)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 73, type: !16)
!103 = !DILocation(line: 73, column: 9, scope: !101)
!104 = !DILocation(line: 75, column: 10, scope: !101)
!105 = !DILocation(line: 78, column: 10, scope: !101)
!106 = !DILocation(line: 79, column: 17, scope: !101)
!107 = !DILocation(line: 79, column: 5, scope: !101)
!108 = !DILocation(line: 80, column: 1, scope: !101)
!109 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 54, type: !25, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", arg: 1, scope: !109, file: !12, line: 54, type: !16)
!111 = !DILocation(line: 54, column: 29, scope: !109)
!112 = !DILocalVariable(name: "buffer", scope: !113, file: !12, line: 57, type: !31)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 56, column: 5)
!114 = !DILocation(line: 57, column: 13, scope: !113)
!115 = !DILocation(line: 60, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 60, column: 13)
!117 = !DILocation(line: 60, column: 18, scope: !116)
!118 = !DILocation(line: 60, column: 13, scope: !113)
!119 = !DILocation(line: 62, column: 33, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 61, column: 9)
!121 = !DILocation(line: 62, column: 26, scope: !120)
!122 = !DILocation(line: 62, column: 13, scope: !120)
!123 = !DILocation(line: 63, column: 9, scope: !120)
!124 = !DILocation(line: 66, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !116, file: !12, line: 65, column: 9)
!126 = !DILocation(line: 69, column: 1, scope: !109)
