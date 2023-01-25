; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 10, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !20, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* %data, align 4, !dbg !23
  store i32 %0, i32* %dataCopy, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !24, metadata !DIExpression()), !dbg !25
  %1 = load i32, i32* %dataCopy, align 4, !dbg !26
  store i32 %1, i32* %data1, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !27, metadata !DIExpression()), !dbg !32
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !32
  %3 = load i32, i32* %data1, align 4, !dbg !33
  %cmp = icmp sge i32 %3, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !37
  %idxprom = sext i32 %4 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !39
  %5 = load i32, i32* %arrayidx, align 4, !dbg !39
  call void @printIntLine(i32 %5), !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_31_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  call void @goodB2G(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE129_large_31_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE129_large_31_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %data, align 4, !dbg !72
  store i32 7, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !74, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* %data, align 4, !dbg !77
  store i32 %0, i32* %dataCopy, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !78, metadata !DIExpression()), !dbg !79
  %1 = load i32, i32* %dataCopy, align 4, !dbg !80
  store i32 %1, i32* %data1, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !81, metadata !DIExpression()), !dbg !83
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !83
  %3 = load i32, i32* %data1, align 4, !dbg !84
  %cmp = icmp sge i32 %3, 0, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !88
  %idxprom = sext i32 %4 to i64, !dbg !90
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !90
  %5 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 %5), !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32 -1, i32* %data, align 4, !dbg !99
  store i32 10, i32* %data, align 4, !dbg !100
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = load i32, i32* %data, align 4, !dbg !104
  store i32 %0, i32* %dataCopy, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !105, metadata !DIExpression()), !dbg !106
  %1 = load i32, i32* %dataCopy, align 4, !dbg !107
  store i32 %1, i32* %data1, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !110
  %3 = load i32, i32* %data1, align 4, !dbg !111
  %cmp = icmp sge i32 %3, 0, !dbg !113
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !114

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !115
  %cmp2 = icmp slt i32 %4, 10, !dbg !116
  br i1 %cmp2, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data1, align 4, !dbg !118
  %idxprom = sext i32 %5 to i64, !dbg !120
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !120
  %6 = load i32, i32* %arrayidx, align 4, !dbg !120
  call void @printIntLine(i32 %6), !dbg !121
  br label %if.end, !dbg !122

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !125
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_31_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 28, column: 10, scope: !11)
!20 = !DILocalVariable(name: "dataCopy", scope: !21, file: !12, line: 30, type: !16)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!22 = !DILocation(line: 30, column: 13, scope: !21)
!23 = !DILocation(line: 30, column: 24, scope: !21)
!24 = !DILocalVariable(name: "data", scope: !21, file: !12, line: 31, type: !16)
!25 = !DILocation(line: 31, column: 13, scope: !21)
!26 = !DILocation(line: 31, column: 20, scope: !21)
!27 = !DILocalVariable(name: "buffer", scope: !28, file: !12, line: 33, type: !29)
!28 = distinct !DILexicalBlock(scope: !21, file: !12, line: 32, column: 9)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 33, column: 17, scope: !28)
!33 = !DILocation(line: 36, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !12, line: 36, column: 17)
!35 = !DILocation(line: 36, column: 22, scope: !34)
!36 = !DILocation(line: 36, column: 17, scope: !28)
!37 = !DILocation(line: 38, column: 37, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 37, column: 13)
!39 = !DILocation(line: 38, column: 30, scope: !38)
!40 = !DILocation(line: 38, column: 17, scope: !38)
!41 = !DILocation(line: 39, column: 13, scope: !38)
!42 = !DILocation(line: 42, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !12, line: 41, column: 13)
!44 = !DILocation(line: 46, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_31_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 108, column: 5, scope: !45)
!47 = !DILocation(line: 109, column: 5, scope: !45)
!48 = !DILocation(line: 110, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !50, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!16, !16, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 120, type: !16)
!56 = !DILocation(line: 120, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 120, type: !52)
!58 = !DILocation(line: 120, column: 27, scope: !49)
!59 = !DILocation(line: 123, column: 22, scope: !49)
!60 = !DILocation(line: 123, column: 12, scope: !49)
!61 = !DILocation(line: 123, column: 5, scope: !49)
!62 = !DILocation(line: 125, column: 5, scope: !49)
!63 = !DILocation(line: 126, column: 5, scope: !49)
!64 = !DILocation(line: 127, column: 5, scope: !49)
!65 = !DILocation(line: 130, column: 5, scope: !49)
!66 = !DILocation(line: 131, column: 5, scope: !49)
!67 = !DILocation(line: 132, column: 5, scope: !49)
!68 = !DILocation(line: 134, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 55, type: !16)
!71 = !DILocation(line: 55, column: 9, scope: !69)
!72 = !DILocation(line: 57, column: 10, scope: !69)
!73 = !DILocation(line: 60, column: 10, scope: !69)
!74 = !DILocalVariable(name: "dataCopy", scope: !75, file: !12, line: 62, type: !16)
!75 = distinct !DILexicalBlock(scope: !69, file: !12, line: 61, column: 5)
!76 = !DILocation(line: 62, column: 13, scope: !75)
!77 = !DILocation(line: 62, column: 24, scope: !75)
!78 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 63, type: !16)
!79 = !DILocation(line: 63, column: 13, scope: !75)
!80 = !DILocation(line: 63, column: 20, scope: !75)
!81 = !DILocalVariable(name: "buffer", scope: !82, file: !12, line: 65, type: !29)
!82 = distinct !DILexicalBlock(scope: !75, file: !12, line: 64, column: 9)
!83 = !DILocation(line: 65, column: 17, scope: !82)
!84 = !DILocation(line: 68, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 68, column: 17)
!86 = !DILocation(line: 68, column: 22, scope: !85)
!87 = !DILocation(line: 68, column: 17, scope: !82)
!88 = !DILocation(line: 70, column: 37, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !12, line: 69, column: 13)
!90 = !DILocation(line: 70, column: 30, scope: !89)
!91 = !DILocation(line: 70, column: 17, scope: !89)
!92 = !DILocation(line: 71, column: 13, scope: !89)
!93 = !DILocation(line: 74, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !85, file: !12, line: 73, column: 13)
!95 = !DILocation(line: 78, column: 1, scope: !69)
!96 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 83, type: !16)
!98 = !DILocation(line: 83, column: 9, scope: !96)
!99 = !DILocation(line: 85, column: 10, scope: !96)
!100 = !DILocation(line: 87, column: 10, scope: !96)
!101 = !DILocalVariable(name: "dataCopy", scope: !102, file: !12, line: 89, type: !16)
!102 = distinct !DILexicalBlock(scope: !96, file: !12, line: 88, column: 5)
!103 = !DILocation(line: 89, column: 13, scope: !102)
!104 = !DILocation(line: 89, column: 24, scope: !102)
!105 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 90, type: !16)
!106 = !DILocation(line: 90, column: 13, scope: !102)
!107 = !DILocation(line: 90, column: 20, scope: !102)
!108 = !DILocalVariable(name: "buffer", scope: !109, file: !12, line: 92, type: !29)
!109 = distinct !DILexicalBlock(scope: !102, file: !12, line: 91, column: 9)
!110 = !DILocation(line: 92, column: 17, scope: !109)
!111 = !DILocation(line: 94, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 94, column: 17)
!113 = !DILocation(line: 94, column: 22, scope: !112)
!114 = !DILocation(line: 94, column: 27, scope: !112)
!115 = !DILocation(line: 94, column: 30, scope: !112)
!116 = !DILocation(line: 94, column: 35, scope: !112)
!117 = !DILocation(line: 94, column: 17, scope: !109)
!118 = !DILocation(line: 96, column: 37, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !12, line: 95, column: 13)
!120 = !DILocation(line: 96, column: 30, scope: !119)
!121 = !DILocation(line: 96, column: 17, scope: !119)
!122 = !DILocation(line: 97, column: 13, scope: !119)
!123 = !DILocation(line: 100, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !12, line: 99, column: 13)
!125 = !DILocation(line: 104, column: 1, scope: !96)
