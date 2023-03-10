; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_41_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 -5, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  call void @badSink(i32 %0), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !23 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !28, metadata !DIExpression()), !dbg !33
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !33
  %1 = load i32, i32* %data.addr, align 4, !dbg !34
  %cmp = icmp slt i32 %1, 10, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !38
  %idxprom = sext i32 %2 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  %3 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %3), !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_41_good() #0 !dbg !46 {
entry:
  call void @goodB2G(), !dbg !47
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE127_Buffer_Underread__CWE839_negative_41_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__CWE839_negative_41_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  store i32 -5, i32* %data, align 4, !dbg !74
  %0 = load i32, i32* %data, align 4, !dbg !75
  call void @goodB2GSink(i32 %0), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !78 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !81, metadata !DIExpression()), !dbg !83
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !83
  %1 = load i32, i32* %data.addr, align 4, !dbg !84
  %cmp = icmp sge i32 %1, 0, !dbg !86
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !87

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !88
  %cmp1 = icmp slt i32 %2, 10, !dbg !89
  br i1 %cmp1, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !91
  %idxprom = sext i32 %3 to i64, !dbg !93
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !93
  %4 = load i32, i32* %arrayidx, align 4, !dbg !93
  call void @printIntLine(i32 %4), !dbg !94
  br label %if.end, !dbg !95

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %data, align 4, !dbg !102
  store i32 7, i32* %data, align 4, !dbg !103
  %0 = load i32, i32* %data, align 4, !dbg !104
  call void @goodG2BSink(i32 %0), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !107 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !110, metadata !DIExpression()), !dbg !112
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !112
  %1 = load i32, i32* %data.addr, align 4, !dbg !113
  %cmp = icmp slt i32 %1, 10, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !117
  %idxprom = sext i32 %2 to i64, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !119
  %3 = load i32, i32* %arrayidx, align 4, !dbg !119
  call void @printIntLine(i32 %3), !dbg !120
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_41_bad", scope: !12, file: !12, line: 39, type: !13, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 41, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 41, column: 9, scope: !11)
!18 = !DILocation(line: 43, column: 10, scope: !11)
!19 = !DILocation(line: 45, column: 10, scope: !11)
!20 = !DILocation(line: 46, column: 13, scope: !11)
!21 = !DILocation(line: 46, column: 5, scope: !11)
!22 = !DILocation(line: 47, column: 1, scope: !11)
!23 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 22, type: !24, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !16}
!26 = !DILocalVariable(name: "data", arg: 1, scope: !23, file: !12, line: 22, type: !16)
!27 = !DILocation(line: 22, column: 25, scope: !23)
!28 = !DILocalVariable(name: "buffer", scope: !29, file: !12, line: 25, type: !30)
!29 = distinct !DILexicalBlock(scope: !23, file: !12, line: 24, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 25, column: 13, scope: !29)
!34 = !DILocation(line: 28, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !12, line: 28, column: 13)
!36 = !DILocation(line: 28, column: 18, scope: !35)
!37 = !DILocation(line: 28, column: 13, scope: !29)
!38 = !DILocation(line: 30, column: 33, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 29, column: 9)
!40 = !DILocation(line: 30, column: 26, scope: !39)
!41 = !DILocation(line: 30, column: 13, scope: !39)
!42 = !DILocation(line: 31, column: 9, scope: !39)
!43 = !DILocation(line: 34, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !12, line: 33, column: 9)
!45 = !DILocation(line: 37, column: 1, scope: !23)
!46 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_41_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 111, column: 5, scope: !46)
!48 = !DILocation(line: 112, column: 5, scope: !46)
!49 = !DILocation(line: 113, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !51, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!16, !16, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 124, type: !16)
!57 = !DILocation(line: 124, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 124, type: !53)
!59 = !DILocation(line: 124, column: 27, scope: !50)
!60 = !DILocation(line: 127, column: 22, scope: !50)
!61 = !DILocation(line: 127, column: 12, scope: !50)
!62 = !DILocation(line: 127, column: 5, scope: !50)
!63 = !DILocation(line: 129, column: 5, scope: !50)
!64 = !DILocation(line: 130, column: 5, scope: !50)
!65 = !DILocation(line: 131, column: 5, scope: !50)
!66 = !DILocation(line: 134, column: 5, scope: !50)
!67 = !DILocation(line: 135, column: 5, scope: !50)
!68 = !DILocation(line: 136, column: 5, scope: !50)
!69 = !DILocation(line: 138, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 101, type: !16)
!72 = !DILocation(line: 101, column: 9, scope: !70)
!73 = !DILocation(line: 103, column: 10, scope: !70)
!74 = !DILocation(line: 105, column: 10, scope: !70)
!75 = !DILocation(line: 106, column: 17, scope: !70)
!76 = !DILocation(line: 106, column: 5, scope: !70)
!77 = !DILocation(line: 107, column: 1, scope: !70)
!78 = distinct !DISubprogram(name: "goodB2GSink", scope: !12, file: !12, line: 83, type: !24, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", arg: 1, scope: !78, file: !12, line: 83, type: !16)
!80 = !DILocation(line: 83, column: 29, scope: !78)
!81 = !DILocalVariable(name: "buffer", scope: !82, file: !12, line: 86, type: !30)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 85, column: 5)
!83 = !DILocation(line: 86, column: 13, scope: !82)
!84 = !DILocation(line: 88, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 88, column: 13)
!86 = !DILocation(line: 88, column: 18, scope: !85)
!87 = !DILocation(line: 88, column: 23, scope: !85)
!88 = !DILocation(line: 88, column: 26, scope: !85)
!89 = !DILocation(line: 88, column: 31, scope: !85)
!90 = !DILocation(line: 88, column: 13, scope: !82)
!91 = !DILocation(line: 90, column: 33, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !12, line: 89, column: 9)
!93 = !DILocation(line: 90, column: 26, scope: !92)
!94 = !DILocation(line: 90, column: 13, scope: !92)
!95 = !DILocation(line: 91, column: 9, scope: !92)
!96 = !DILocation(line: 94, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !85, file: !12, line: 93, column: 9)
!98 = !DILocation(line: 97, column: 1, scope: !78)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 73, type: !16)
!101 = !DILocation(line: 73, column: 9, scope: !99)
!102 = !DILocation(line: 75, column: 10, scope: !99)
!103 = !DILocation(line: 78, column: 10, scope: !99)
!104 = !DILocation(line: 79, column: 17, scope: !99)
!105 = !DILocation(line: 79, column: 5, scope: !99)
!106 = !DILocation(line: 80, column: 1, scope: !99)
!107 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 54, type: !24, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", arg: 1, scope: !107, file: !12, line: 54, type: !16)
!109 = !DILocation(line: 54, column: 29, scope: !107)
!110 = !DILocalVariable(name: "buffer", scope: !111, file: !12, line: 57, type: !30)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 56, column: 5)
!112 = !DILocation(line: 57, column: 13, scope: !111)
!113 = !DILocation(line: 60, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 60, column: 13)
!115 = !DILocation(line: 60, column: 18, scope: !114)
!116 = !DILocation(line: 60, column: 13, scope: !111)
!117 = !DILocation(line: 62, column: 33, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 61, column: 9)
!119 = !DILocation(line: 62, column: 26, scope: !118)
!120 = !DILocation(line: 62, column: 13, scope: !118)
!121 = !DILocation(line: 63, column: 9, scope: !118)
!122 = !DILocation(line: 66, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !114, file: !12, line: 65, column: 9)
!124 = !DILocation(line: 69, column: 1, scope: !107)
