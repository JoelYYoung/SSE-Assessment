; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__CWE129_large_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@CWE126_Buffer_Overread__CWE129_large_45_goodG2BData = internal global i32 0, align 4, !dbg !8
@CWE126_Buffer_Overread__CWE129_large_45_goodB2GData = internal global i32 0, align 4, !dbg !12
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  store i32 10, i32* %data, align 4, !dbg !26
  %0 = load i32, i32* %data, align 4, !dbg !27
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_large_45_badData, align 4, !dbg !28
  call void @badSink(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_45_good() #0 !dbg !31 {
entry:
  call void @goodG2B(), !dbg !32
  call void @goodB2G(), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #5, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #5, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE126_Buffer_Overread__CWE129_large_45_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE126_Buffer_Overread__CWE129_large_45_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !55 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_large_45_badData, align 4, !dbg !58
  store i32 %0, i32* %data, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !59, metadata !DIExpression()), !dbg !64
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !64
  %2 = load i32, i32* %data, align 4, !dbg !65
  %cmp = icmp sge i32 %2, 0, !dbg !67
  br i1 %cmp, label %if.then, label %if.else, !dbg !68

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !69
  %idxprom = sext i32 %3 to i64, !dbg !71
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !71
  %4 = load i32, i32* %arrayidx, align 4, !dbg !71
  call void @printIntLine(i32 %4), !dbg !72
  br label %if.end, !dbg !73

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !76
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  store i32 7, i32* %data, align 4, !dbg !81
  %0 = load i32, i32* %data, align 4, !dbg !82
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_large_45_goodG2BData, align 4, !dbg !83
  call void @goodG2BSink(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !86 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_large_45_goodG2BData, align 4, !dbg !89
  store i32 %0, i32* %data, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !90, metadata !DIExpression()), !dbg !92
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !92
  %2 = load i32, i32* %data, align 4, !dbg !93
  %cmp = icmp sge i32 %2, 0, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !97
  %idxprom = sext i32 %3 to i64, !dbg !99
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !99
  %4 = load i32, i32* %arrayidx, align 4, !dbg !99
  call void @printIntLine(i32 %4), !dbg !100
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !105 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %data, align 4, !dbg !108
  store i32 10, i32* %data, align 4, !dbg !109
  %0 = load i32, i32* %data, align 4, !dbg !110
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_large_45_goodB2GData, align 4, !dbg !111
  call void @goodB2GSink(), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_large_45_goodB2GData, align 4, !dbg !117
  store i32 %0, i32* %data, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !118, metadata !DIExpression()), !dbg !120
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !120
  %2 = load i32, i32* %data, align 4, !dbg !121
  %cmp = icmp sge i32 %2, 0, !dbg !123
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !124

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !125
  %cmp1 = icmp slt i32 %3, 10, !dbg !126
  br i1 %cmp1, label %if.then, label %if.else, !dbg !127

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !128
  %idxprom = sext i32 %4 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !130
  %5 = load i32, i32* %arrayidx, align 4, !dbg !130
  call void @printIntLine(i32 %5), !dbg !131
  br label %if.end, !dbg !132

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_large_45_badData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_large_45_goodG2BData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_45.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_large_45_goodB2GData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_45_bad", scope: !10, file: !10, line: 44, type: !21, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 46, type: !11)
!24 = !DILocation(line: 46, column: 9, scope: !20)
!25 = !DILocation(line: 48, column: 10, scope: !20)
!26 = !DILocation(line: 50, column: 10, scope: !20)
!27 = !DILocation(line: 51, column: 55, scope: !20)
!28 = !DILocation(line: 51, column: 53, scope: !20)
!29 = !DILocation(line: 52, column: 5, scope: !20)
!30 = !DILocation(line: 53, column: 1, scope: !20)
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_45_good", scope: !10, file: !10, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocation(line: 121, column: 5, scope: !31)
!33 = !DILocation(line: 122, column: 5, scope: !31)
!34 = !DILocation(line: 123, column: 1, scope: !31)
!35 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 133, type: !36, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!11, !11, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !10, line: 133, type: !11)
!42 = !DILocation(line: 133, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !10, line: 133, type: !38)
!44 = !DILocation(line: 133, column: 27, scope: !35)
!45 = !DILocation(line: 136, column: 22, scope: !35)
!46 = !DILocation(line: 136, column: 12, scope: !35)
!47 = !DILocation(line: 136, column: 5, scope: !35)
!48 = !DILocation(line: 138, column: 5, scope: !35)
!49 = !DILocation(line: 139, column: 5, scope: !35)
!50 = !DILocation(line: 140, column: 5, scope: !35)
!51 = !DILocation(line: 143, column: 5, scope: !35)
!52 = !DILocation(line: 144, column: 5, scope: !35)
!53 = !DILocation(line: 145, column: 5, scope: !35)
!54 = !DILocation(line: 147, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "data", scope: !55, file: !10, line: 28, type: !11)
!57 = !DILocation(line: 28, column: 9, scope: !55)
!58 = !DILocation(line: 28, column: 16, scope: !55)
!59 = !DILocalVariable(name: "buffer", scope: !60, file: !10, line: 30, type: !61)
!60 = distinct !DILexicalBlock(scope: !55, file: !10, line: 29, column: 5)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 10)
!64 = !DILocation(line: 30, column: 13, scope: !60)
!65 = !DILocation(line: 33, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !10, line: 33, column: 13)
!67 = !DILocation(line: 33, column: 18, scope: !66)
!68 = !DILocation(line: 33, column: 13, scope: !60)
!69 = !DILocation(line: 35, column: 33, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !10, line: 34, column: 9)
!71 = !DILocation(line: 35, column: 26, scope: !70)
!72 = !DILocation(line: 35, column: 13, scope: !70)
!73 = !DILocation(line: 36, column: 9, scope: !70)
!74 = !DILocation(line: 39, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !66, file: !10, line: 38, column: 9)
!76 = !DILocation(line: 42, column: 1, scope: !55)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 80, type: !11)
!79 = !DILocation(line: 80, column: 9, scope: !77)
!80 = !DILocation(line: 82, column: 10, scope: !77)
!81 = !DILocation(line: 85, column: 10, scope: !77)
!82 = !DILocation(line: 86, column: 59, scope: !77)
!83 = !DILocation(line: 86, column: 57, scope: !77)
!84 = !DILocation(line: 87, column: 5, scope: !77)
!85 = !DILocation(line: 88, column: 1, scope: !77)
!86 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !10, line: 62, type: !11)
!88 = !DILocation(line: 62, column: 9, scope: !86)
!89 = !DILocation(line: 62, column: 16, scope: !86)
!90 = !DILocalVariable(name: "buffer", scope: !91, file: !10, line: 64, type: !61)
!91 = distinct !DILexicalBlock(scope: !86, file: !10, line: 63, column: 5)
!92 = !DILocation(line: 64, column: 13, scope: !91)
!93 = !DILocation(line: 67, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !10, line: 67, column: 13)
!95 = !DILocation(line: 67, column: 18, scope: !94)
!96 = !DILocation(line: 67, column: 13, scope: !91)
!97 = !DILocation(line: 69, column: 33, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !10, line: 68, column: 9)
!99 = !DILocation(line: 69, column: 26, scope: !98)
!100 = !DILocation(line: 69, column: 13, scope: !98)
!101 = !DILocation(line: 70, column: 9, scope: !98)
!102 = !DILocation(line: 73, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !94, file: !10, line: 72, column: 9)
!104 = !DILocation(line: 76, column: 1, scope: !86)
!105 = distinct !DISubprogram(name: "goodB2G", scope: !10, file: !10, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !10, line: 110, type: !11)
!107 = !DILocation(line: 110, column: 9, scope: !105)
!108 = !DILocation(line: 112, column: 10, scope: !105)
!109 = !DILocation(line: 114, column: 10, scope: !105)
!110 = !DILocation(line: 115, column: 59, scope: !105)
!111 = !DILocation(line: 115, column: 57, scope: !105)
!112 = !DILocation(line: 116, column: 5, scope: !105)
!113 = !DILocation(line: 117, column: 1, scope: !105)
!114 = distinct !DISubprogram(name: "goodB2GSink", scope: !10, file: !10, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !10, line: 93, type: !11)
!116 = !DILocation(line: 93, column: 9, scope: !114)
!117 = !DILocation(line: 93, column: 16, scope: !114)
!118 = !DILocalVariable(name: "buffer", scope: !119, file: !10, line: 95, type: !61)
!119 = distinct !DILexicalBlock(scope: !114, file: !10, line: 94, column: 5)
!120 = !DILocation(line: 95, column: 13, scope: !119)
!121 = !DILocation(line: 97, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !10, line: 97, column: 13)
!123 = !DILocation(line: 97, column: 18, scope: !122)
!124 = !DILocation(line: 97, column: 23, scope: !122)
!125 = !DILocation(line: 97, column: 26, scope: !122)
!126 = !DILocation(line: 97, column: 31, scope: !122)
!127 = !DILocation(line: 97, column: 13, scope: !119)
!128 = !DILocation(line: 99, column: 33, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !10, line: 98, column: 9)
!130 = !DILocation(line: 99, column: 26, scope: !129)
!131 = !DILocation(line: 99, column: 13, scope: !129)
!132 = !DILocation(line: 100, column: 9, scope: !129)
!133 = !DILocation(line: 103, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !122, file: !10, line: 102, column: 9)
!135 = !DILocation(line: 106, column: 1, scope: !114)
