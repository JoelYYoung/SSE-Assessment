; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__CWE129_large_34_unionType = type { i32 }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion, metadata !18, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  store i32 10, i32* %data, align 4, !dbg !26
  %0 = load i32, i32* %data, align 4, !dbg !27
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion to i32*, !dbg !28
  store i32 %0, i32* %unionFirst, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion to i32*, !dbg !33
  %1 = load i32, i32* %unionSecond, align 4, !dbg !33
  store i32 %1, i32* %data1, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !39
  %3 = load i32, i32* %data1, align 4, !dbg !40
  %cmp = icmp sge i32 %3, 0, !dbg !42
  br i1 %cmp, label %if.then, label %if.else, !dbg !43

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !44
  %idxprom = sext i32 %4 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  %5 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 %5), !dbg !47
  br label %if.end, !dbg !48

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !49
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_34_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  call void @goodB2G(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__CWE129_large_34_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__CWE129_large_34_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 -1, i32* %data, align 4, !dbg !81
  store i32 7, i32* %data, align 4, !dbg !82
  %0 = load i32, i32* %data, align 4, !dbg !83
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion to i32*, !dbg !84
  store i32 %0, i32* %unionFirst, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !86, metadata !DIExpression()), !dbg !88
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion to i32*, !dbg !89
  %1 = load i32, i32* %unionSecond, align 4, !dbg !89
  store i32 %1, i32* %data1, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !90, metadata !DIExpression()), !dbg !92
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !92
  %3 = load i32, i32* %data1, align 4, !dbg !93
  %cmp = icmp sge i32 %3, 0, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !97
  %idxprom = sext i32 %4 to i64, !dbg !99
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !99
  %5 = load i32, i32* %arrayidx, align 4, !dbg !99
  call void @printIntLine(i32 %5), !dbg !100
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !105 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %data, align 4, !dbg !110
  store i32 10, i32* %data, align 4, !dbg !111
  %0 = load i32, i32* %data, align 4, !dbg !112
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion to i32*, !dbg !113
  store i32 %0, i32* %unionFirst, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !115, metadata !DIExpression()), !dbg !117
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_large_34_unionType* %myUnion to i32*, !dbg !118
  %1 = load i32, i32* %unionSecond, align 4, !dbg !118
  store i32 %1, i32* %data1, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !119, metadata !DIExpression()), !dbg !121
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !121
  %3 = load i32, i32* %data1, align 4, !dbg !122
  %cmp = icmp sge i32 %3, 0, !dbg !124
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !125

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !126
  %cmp2 = icmp slt i32 %4, 10, !dbg !127
  br i1 %cmp2, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data1, align 4, !dbg !129
  %idxprom = sext i32 %5 to i64, !dbg !131
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !131
  %6 = load i32, i32* %arrayidx, align 4, !dbg !131
  call void @printIntLine(i32 %6), !dbg !132
  br label %if.end, !dbg !133

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !134
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !136
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_34_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__CWE129_large_34_unionType", file: !12, line: 24, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 20, size: 32, elements: !21)
!21 = !{!22, !23}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !20, file: !12, line: 22, baseType: !16, size: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !20, file: !12, line: 23, baseType: !16, size: 32)
!24 = !DILocation(line: 31, column: 55, scope: !11)
!25 = !DILocation(line: 33, column: 10, scope: !11)
!26 = !DILocation(line: 35, column: 10, scope: !11)
!27 = !DILocation(line: 36, column: 26, scope: !11)
!28 = !DILocation(line: 36, column: 13, scope: !11)
!29 = !DILocation(line: 36, column: 24, scope: !11)
!30 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 38, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!32 = !DILocation(line: 38, column: 13, scope: !31)
!33 = !DILocation(line: 38, column: 28, scope: !31)
!34 = !DILocalVariable(name: "buffer", scope: !35, file: !12, line: 40, type: !36)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 39, column: 9)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 40, column: 17, scope: !35)
!40 = !DILocation(line: 43, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !12, line: 43, column: 17)
!42 = !DILocation(line: 43, column: 22, scope: !41)
!43 = !DILocation(line: 43, column: 17, scope: !35)
!44 = !DILocation(line: 45, column: 37, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 44, column: 13)
!46 = !DILocation(line: 45, column: 30, scope: !45)
!47 = !DILocation(line: 45, column: 17, scope: !45)
!48 = !DILocation(line: 46, column: 13, scope: !45)
!49 = !DILocation(line: 49, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !12, line: 48, column: 13)
!51 = !DILocation(line: 53, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_34_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 117, column: 5, scope: !52)
!54 = !DILocation(line: 118, column: 5, scope: !52)
!55 = !DILocation(line: 119, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !57, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!16, !16, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 129, type: !16)
!63 = !DILocation(line: 129, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 129, type: !59)
!65 = !DILocation(line: 129, column: 27, scope: !56)
!66 = !DILocation(line: 132, column: 22, scope: !56)
!67 = !DILocation(line: 132, column: 12, scope: !56)
!68 = !DILocation(line: 132, column: 5, scope: !56)
!69 = !DILocation(line: 134, column: 5, scope: !56)
!70 = !DILocation(line: 135, column: 5, scope: !56)
!71 = !DILocation(line: 136, column: 5, scope: !56)
!72 = !DILocation(line: 139, column: 5, scope: !56)
!73 = !DILocation(line: 140, column: 5, scope: !56)
!74 = !DILocation(line: 141, column: 5, scope: !56)
!75 = !DILocation(line: 143, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 62, type: !16)
!78 = !DILocation(line: 62, column: 9, scope: !76)
!79 = !DILocalVariable(name: "myUnion", scope: !76, file: !12, line: 63, type: !19)
!80 = !DILocation(line: 63, column: 55, scope: !76)
!81 = !DILocation(line: 65, column: 10, scope: !76)
!82 = !DILocation(line: 68, column: 10, scope: !76)
!83 = !DILocation(line: 69, column: 26, scope: !76)
!84 = !DILocation(line: 69, column: 13, scope: !76)
!85 = !DILocation(line: 69, column: 24, scope: !76)
!86 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 71, type: !16)
!87 = distinct !DILexicalBlock(scope: !76, file: !12, line: 70, column: 5)
!88 = !DILocation(line: 71, column: 13, scope: !87)
!89 = !DILocation(line: 71, column: 28, scope: !87)
!90 = !DILocalVariable(name: "buffer", scope: !91, file: !12, line: 73, type: !36)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 72, column: 9)
!92 = !DILocation(line: 73, column: 17, scope: !91)
!93 = !DILocation(line: 76, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !12, line: 76, column: 17)
!95 = !DILocation(line: 76, column: 22, scope: !94)
!96 = !DILocation(line: 76, column: 17, scope: !91)
!97 = !DILocation(line: 78, column: 37, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !12, line: 77, column: 13)
!99 = !DILocation(line: 78, column: 30, scope: !98)
!100 = !DILocation(line: 78, column: 17, scope: !98)
!101 = !DILocation(line: 79, column: 13, scope: !98)
!102 = !DILocation(line: 82, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !94, file: !12, line: 81, column: 13)
!104 = !DILocation(line: 86, column: 1, scope: !76)
!105 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 89, type: !13, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 91, type: !16)
!107 = !DILocation(line: 91, column: 9, scope: !105)
!108 = !DILocalVariable(name: "myUnion", scope: !105, file: !12, line: 92, type: !19)
!109 = !DILocation(line: 92, column: 55, scope: !105)
!110 = !DILocation(line: 94, column: 10, scope: !105)
!111 = !DILocation(line: 96, column: 10, scope: !105)
!112 = !DILocation(line: 97, column: 26, scope: !105)
!113 = !DILocation(line: 97, column: 13, scope: !105)
!114 = !DILocation(line: 97, column: 24, scope: !105)
!115 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 99, type: !16)
!116 = distinct !DILexicalBlock(scope: !105, file: !12, line: 98, column: 5)
!117 = !DILocation(line: 99, column: 13, scope: !116)
!118 = !DILocation(line: 99, column: 28, scope: !116)
!119 = !DILocalVariable(name: "buffer", scope: !120, file: !12, line: 101, type: !36)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 100, column: 9)
!121 = !DILocation(line: 101, column: 17, scope: !120)
!122 = !DILocation(line: 103, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 103, column: 17)
!124 = !DILocation(line: 103, column: 22, scope: !123)
!125 = !DILocation(line: 103, column: 27, scope: !123)
!126 = !DILocation(line: 103, column: 30, scope: !123)
!127 = !DILocation(line: 103, column: 35, scope: !123)
!128 = !DILocation(line: 103, column: 17, scope: !120)
!129 = !DILocation(line: 105, column: 37, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !12, line: 104, column: 13)
!131 = !DILocation(line: 105, column: 30, scope: !130)
!132 = !DILocation(line: 105, column: 17, scope: !130)
!133 = !DILocation(line: 106, column: 13, scope: !130)
!134 = !DILocation(line: 109, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !123, file: !12, line: 108, column: 13)
!136 = !DILocation(line: 113, column: 1, scope: !105)
