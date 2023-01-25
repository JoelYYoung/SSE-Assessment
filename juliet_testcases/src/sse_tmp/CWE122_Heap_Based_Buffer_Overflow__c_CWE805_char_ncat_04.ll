; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx1, align 1, !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  %call3 = call i8* @strncat(i8* %2, i8* %arraydecay2, i64 100) #6, !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %3), !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* %4) #6, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i8* null, i8** %data, align 8, !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !77
  store i8* %call, i8** %data, align 8, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %cmp = icmp eq i8* %0, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !92
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx1, align 1, !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  %call3 = call i8* @strncat(i8* %2, i8* %arraydecay2, i64 100) #6, !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %3), !dbg !99
  %4 = load i8*, i8** %data, align 8, !dbg !100
  call void @free(i8* %4) #6, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  %cmp = icmp eq i8* %0, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx1, align 1, !dbg !124
  %2 = load i8*, i8** %data, align 8, !dbg !125
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  %call3 = call i8* @strncat(i8* %2, i8* %arraydecay2, i64 100) #6, !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %3), !dbg !129
  %4 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* %4) #6, !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !4)
!19 = !DILocation(line: 32, column: 12, scope: !14)
!20 = !DILocation(line: 33, column: 10, scope: !14)
!21 = !DILocation(line: 37, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 8)
!24 = !DILocation(line: 37, column: 14, scope: !22)
!25 = !DILocation(line: 38, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 38, column: 13)
!27 = !DILocation(line: 38, column: 18, scope: !26)
!28 = !DILocation(line: 38, column: 13, scope: !22)
!29 = !DILocation(line: 38, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 38, column: 27)
!31 = !DILocation(line: 39, column: 9, scope: !22)
!32 = !DILocation(line: 39, column: 17, scope: !22)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 42, column: 14, scope: !34)
!39 = !DILocation(line: 43, column: 9, scope: !34)
!40 = !DILocation(line: 44, column: 9, scope: !34)
!41 = !DILocation(line: 44, column: 23, scope: !34)
!42 = !DILocation(line: 46, column: 17, scope: !34)
!43 = !DILocation(line: 46, column: 23, scope: !34)
!44 = !DILocation(line: 46, column: 9, scope: !34)
!45 = !DILocation(line: 47, column: 19, scope: !34)
!46 = !DILocation(line: 47, column: 9, scope: !34)
!47 = !DILocation(line: 48, column: 14, scope: !34)
!48 = !DILocation(line: 48, column: 9, scope: !34)
!49 = !DILocation(line: 50, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_04_good", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 109, column: 5, scope: !50)
!52 = !DILocation(line: 110, column: 5, scope: !50)
!53 = !DILocation(line: 111, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 123, type: !55, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 123, type: !57)
!60 = !DILocation(line: 123, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 123, type: !58)
!62 = !DILocation(line: 123, column: 27, scope: !54)
!63 = !DILocation(line: 126, column: 22, scope: !54)
!64 = !DILocation(line: 126, column: 12, scope: !54)
!65 = !DILocation(line: 126, column: 5, scope: !54)
!66 = !DILocation(line: 128, column: 5, scope: !54)
!67 = !DILocation(line: 129, column: 5, scope: !54)
!68 = !DILocation(line: 130, column: 5, scope: !54)
!69 = !DILocation(line: 133, column: 5, scope: !54)
!70 = !DILocation(line: 134, column: 5, scope: !54)
!71 = !DILocation(line: 135, column: 5, scope: !54)
!72 = !DILocation(line: 137, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 59, type: !4)
!75 = !DILocation(line: 59, column: 12, scope: !73)
!76 = !DILocation(line: 60, column: 10, scope: !73)
!77 = !DILocation(line: 69, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !15, line: 67, column: 5)
!79 = distinct !DILexicalBlock(scope: !73, file: !15, line: 61, column: 8)
!80 = !DILocation(line: 69, column: 14, scope: !78)
!81 = !DILocation(line: 70, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 70, column: 13)
!83 = !DILocation(line: 70, column: 18, scope: !82)
!84 = !DILocation(line: 70, column: 13, scope: !78)
!85 = !DILocation(line: 70, column: 28, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 70, column: 27)
!87 = !DILocation(line: 71, column: 9, scope: !78)
!88 = !DILocation(line: 71, column: 17, scope: !78)
!89 = !DILocalVariable(name: "source", scope: !90, file: !15, line: 74, type: !35)
!90 = distinct !DILexicalBlock(scope: !73, file: !15, line: 73, column: 5)
!91 = !DILocation(line: 74, column: 14, scope: !90)
!92 = !DILocation(line: 75, column: 9, scope: !90)
!93 = !DILocation(line: 76, column: 9, scope: !90)
!94 = !DILocation(line: 76, column: 23, scope: !90)
!95 = !DILocation(line: 78, column: 17, scope: !90)
!96 = !DILocation(line: 78, column: 23, scope: !90)
!97 = !DILocation(line: 78, column: 9, scope: !90)
!98 = !DILocation(line: 79, column: 19, scope: !90)
!99 = !DILocation(line: 79, column: 9, scope: !90)
!100 = !DILocation(line: 80, column: 14, scope: !90)
!101 = !DILocation(line: 80, column: 9, scope: !90)
!102 = !DILocation(line: 82, column: 1, scope: !73)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 85, type: !16, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 87, type: !4)
!105 = !DILocation(line: 87, column: 12, scope: !103)
!106 = !DILocation(line: 88, column: 10, scope: !103)
!107 = !DILocation(line: 92, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !15, line: 90, column: 5)
!109 = distinct !DILexicalBlock(scope: !103, file: !15, line: 89, column: 8)
!110 = !DILocation(line: 92, column: 14, scope: !108)
!111 = !DILocation(line: 93, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 93, column: 13)
!113 = !DILocation(line: 93, column: 18, scope: !112)
!114 = !DILocation(line: 93, column: 13, scope: !108)
!115 = !DILocation(line: 93, column: 28, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 93, column: 27)
!117 = !DILocation(line: 94, column: 9, scope: !108)
!118 = !DILocation(line: 94, column: 17, scope: !108)
!119 = !DILocalVariable(name: "source", scope: !120, file: !15, line: 97, type: !35)
!120 = distinct !DILexicalBlock(scope: !103, file: !15, line: 96, column: 5)
!121 = !DILocation(line: 97, column: 14, scope: !120)
!122 = !DILocation(line: 98, column: 9, scope: !120)
!123 = !DILocation(line: 99, column: 9, scope: !120)
!124 = !DILocation(line: 99, column: 23, scope: !120)
!125 = !DILocation(line: 101, column: 17, scope: !120)
!126 = !DILocation(line: 101, column: 23, scope: !120)
!127 = !DILocation(line: 101, column: 9, scope: !120)
!128 = !DILocation(line: 102, column: 19, scope: !120)
!129 = !DILocation(line: 102, column: 9, scope: !120)
!130 = !DILocation(line: 103, column: 14, scope: !120)
!131 = !DILocation(line: 103, column: 9, scope: !120)
!132 = !DILocation(line: 105, column: 1, scope: !103)
