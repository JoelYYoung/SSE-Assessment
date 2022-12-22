; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_42.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* %data, align 4, !dbg !19
  %call = call i32 @badSource(i32 %0), !dbg !20
  store i32 %call, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !22, metadata !DIExpression()), !dbg !27
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !27
  %2 = load i32, i32* %data, align 4, !dbg !28
  %cmp = icmp sge i32 %2, 0, !dbg !30
  br i1 %cmp, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !32
  %idxprom = sext i32 %3 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !34
  %4 = load i32, i32* %arrayidx, align 4, !dbg !34
  call void @printIntLine(i32 %4), !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 10, i32* %data.addr, align 4, !dbg !45
  %0 = load i32, i32* %data.addr, align 4, !dbg !46
  ret i32 %0, !dbg !47
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_42_good() #0 !dbg !48 {
entry:
  call void @goodB2G(), !dbg !49
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE129_large_42_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__CWE129_large_42_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !72 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  %0 = load i32, i32* %data, align 4, !dbg !76
  %call = call i32 @goodB2GSource(i32 %0), !dbg !77
  store i32 %call, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !79, metadata !DIExpression()), !dbg !81
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !81
  %2 = load i32, i32* %data, align 4, !dbg !82
  %cmp = icmp sge i32 %2, 0, !dbg !84
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !85

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !86
  %cmp1 = icmp slt i32 %3, 10, !dbg !87
  br i1 %cmp1, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !89
  %idxprom = sext i32 %4 to i64, !dbg !91
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !91
  %5 = load i32, i32* %arrayidx, align 4, !dbg !91
  call void @printIntLine(i32 %5), !dbg !92
  br label %if.end, !dbg !93

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 10, i32* %data.addr, align 4, !dbg !100
  %0 = load i32, i32* %data.addr, align 4, !dbg !101
  ret i32 %0, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %data, align 4, !dbg !106
  %0 = load i32, i32* %data, align 4, !dbg !107
  %call = call i32 @goodG2BSource(i32 %0), !dbg !108
  store i32 %call, i32* %data, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !112
  %2 = load i32, i32* %data, align 4, !dbg !113
  %cmp = icmp sge i32 %2, 0, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !117
  %idxprom = sext i32 %3 to i64, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !119
  %4 = load i32, i32* %arrayidx, align 4, !dbg !119
  call void @printIntLine(i32 %4), !dbg !120
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !125 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 7, i32* %data.addr, align 4, !dbg !128
  %0 = load i32, i32* %data.addr, align 4, !dbg !129
  ret i32 %0, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_42_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 31, column: 9, scope: !11)
!18 = !DILocation(line: 33, column: 10, scope: !11)
!19 = !DILocation(line: 34, column: 22, scope: !11)
!20 = !DILocation(line: 34, column: 12, scope: !11)
!21 = !DILocation(line: 34, column: 10, scope: !11)
!22 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 36, type: !24)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 36, column: 13, scope: !23)
!28 = !DILocation(line: 39, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !12, line: 39, column: 13)
!30 = !DILocation(line: 39, column: 18, scope: !29)
!31 = !DILocation(line: 39, column: 13, scope: !23)
!32 = !DILocation(line: 41, column: 33, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 40, column: 9)
!34 = !DILocation(line: 41, column: 26, scope: !33)
!35 = !DILocation(line: 41, column: 13, scope: !33)
!36 = !DILocation(line: 42, column: 9, scope: !33)
!37 = !DILocation(line: 45, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !12, line: 44, column: 9)
!39 = !DILocation(line: 48, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 22, type: !41, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!16, !16}
!43 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !12, line: 22, type: !16)
!44 = !DILocation(line: 22, column: 26, scope: !40)
!45 = !DILocation(line: 25, column: 10, scope: !40)
!46 = !DILocation(line: 26, column: 12, scope: !40)
!47 = !DILocation(line: 26, column: 5, scope: !40)
!48 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_42_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 114, column: 5, scope: !48)
!50 = !DILocation(line: 115, column: 5, scope: !48)
!51 = !DILocation(line: 116, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !53, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!16, !16, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 127, type: !16)
!59 = !DILocation(line: 127, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 127, type: !55)
!61 = !DILocation(line: 127, column: 27, scope: !52)
!62 = !DILocation(line: 130, column: 22, scope: !52)
!63 = !DILocation(line: 130, column: 12, scope: !52)
!64 = !DILocation(line: 130, column: 5, scope: !52)
!65 = !DILocation(line: 132, column: 5, scope: !52)
!66 = !DILocation(line: 133, column: 5, scope: !52)
!67 = !DILocation(line: 134, column: 5, scope: !52)
!68 = !DILocation(line: 137, column: 5, scope: !52)
!69 = !DILocation(line: 138, column: 5, scope: !52)
!70 = !DILocation(line: 139, column: 5, scope: !52)
!71 = !DILocation(line: 141, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 94, type: !16)
!74 = !DILocation(line: 94, column: 9, scope: !72)
!75 = !DILocation(line: 96, column: 10, scope: !72)
!76 = !DILocation(line: 97, column: 26, scope: !72)
!77 = !DILocation(line: 97, column: 12, scope: !72)
!78 = !DILocation(line: 97, column: 10, scope: !72)
!79 = !DILocalVariable(name: "buffer", scope: !80, file: !12, line: 99, type: !24)
!80 = distinct !DILexicalBlock(scope: !72, file: !12, line: 98, column: 5)
!81 = !DILocation(line: 99, column: 13, scope: !80)
!82 = !DILocation(line: 101, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 101, column: 13)
!84 = !DILocation(line: 101, column: 18, scope: !83)
!85 = !DILocation(line: 101, column: 23, scope: !83)
!86 = !DILocation(line: 101, column: 26, scope: !83)
!87 = !DILocation(line: 101, column: 31, scope: !83)
!88 = !DILocation(line: 101, column: 13, scope: !80)
!89 = !DILocation(line: 103, column: 33, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !12, line: 102, column: 9)
!91 = !DILocation(line: 103, column: 26, scope: !90)
!92 = !DILocation(line: 103, column: 13, scope: !90)
!93 = !DILocation(line: 104, column: 9, scope: !90)
!94 = !DILocation(line: 107, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 106, column: 9)
!96 = !DILocation(line: 110, column: 1, scope: !72)
!97 = distinct !DISubprogram(name: "goodB2GSource", scope: !12, file: !12, line: 85, type: !41, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !12, line: 85, type: !16)
!99 = !DILocation(line: 85, column: 30, scope: !97)
!100 = !DILocation(line: 88, column: 10, scope: !97)
!101 = !DILocation(line: 89, column: 12, scope: !97)
!102 = !DILocation(line: 89, column: 5, scope: !97)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 65, type: !16)
!105 = !DILocation(line: 65, column: 9, scope: !103)
!106 = !DILocation(line: 67, column: 10, scope: !103)
!107 = !DILocation(line: 68, column: 26, scope: !103)
!108 = !DILocation(line: 68, column: 12, scope: !103)
!109 = !DILocation(line: 68, column: 10, scope: !103)
!110 = !DILocalVariable(name: "buffer", scope: !111, file: !12, line: 70, type: !24)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 69, column: 5)
!112 = !DILocation(line: 70, column: 13, scope: !111)
!113 = !DILocation(line: 73, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 73, column: 13)
!115 = !DILocation(line: 73, column: 18, scope: !114)
!116 = !DILocation(line: 73, column: 13, scope: !111)
!117 = !DILocation(line: 75, column: 33, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 74, column: 9)
!119 = !DILocation(line: 75, column: 26, scope: !118)
!120 = !DILocation(line: 75, column: 13, scope: !118)
!121 = !DILocation(line: 76, column: 9, scope: !118)
!122 = !DILocation(line: 79, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !114, file: !12, line: 78, column: 9)
!124 = !DILocation(line: 82, column: 1, scope: !103)
!125 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 55, type: !41, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", arg: 1, scope: !125, file: !12, line: 55, type: !16)
!127 = !DILocation(line: 55, column: 30, scope: !125)
!128 = !DILocation(line: 59, column: 10, scope: !125)
!129 = !DILocation(line: 60, column: 12, scope: !125)
!130 = !DILocation(line: 60, column: 5, scope: !125)
