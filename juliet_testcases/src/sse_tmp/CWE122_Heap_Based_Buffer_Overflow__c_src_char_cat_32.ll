; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !36
  %2 = load i8*, i8** %1, align 8, !dbg !37
  store i8* %2, i8** %data1, align 8, !dbg !35
  %3 = load i8*, i8** %data1, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %5 = load i8*, i8** %data1, align 8, !dbg !42
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %5, i8** %6, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %8 = load i8*, i8** %7, align 8, !dbg !49
  store i8* %8, i8** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %9 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 50, i1 false), !dbg !55
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !56
  %10 = load i8*, i8** %data2, align 8, !dbg !57
  %call3 = call i8* @strcat(i8* %arraydecay, i8* %10) #6, !dbg !58
  %11 = load i8*, i8** %data2, align 8, !dbg !59
  call void @printLine(i8* %11), !dbg !60
  %12 = load i8*, i8** %data2, align 8, !dbg !61
  call void @free(i8* %12) #6, !dbg !62
  ret void, !dbg !63
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
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %cmp = icmp eq i8* %0, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !103
  %2 = load i8*, i8** %1, align 8, !dbg !104
  store i8* %2, i8** %data1, align 8, !dbg !102
  %3 = load i8*, i8** %data1, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !106
  %4 = load i8*, i8** %data1, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %5 = load i8*, i8** %data1, align 8, !dbg !109
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !110
  store i8* %5, i8** %6, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !112, metadata !DIExpression()), !dbg !114
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !115
  %8 = load i8*, i8** %7, align 8, !dbg !116
  store i8* %8, i8** %data2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %9 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 50, i1 false), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !120
  %10 = load i8*, i8** %data2, align 8, !dbg !121
  %call3 = call i8* @strcat(i8* %arraydecay, i8* %10) #6, !dbg !122
  %11 = load i8*, i8** %data2, align 8, !dbg !123
  call void @printLine(i8* %11), !dbg !124
  %12 = load i8*, i8** %data2, align 8, !dbg !125
  call void @free(i8* %12) #6, !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 20, scope: !14)
!26 = !DILocation(line: 28, column: 10, scope: !14)
!27 = !DILocation(line: 29, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!29 = !DILocation(line: 29, column: 14, scope: !28)
!30 = !DILocation(line: 29, column: 9, scope: !14)
!31 = !DILocation(line: 29, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 23)
!33 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 31, type: !4)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!35 = !DILocation(line: 31, column: 16, scope: !34)
!36 = !DILocation(line: 31, column: 24, scope: !34)
!37 = !DILocation(line: 31, column: 23, scope: !34)
!38 = !DILocation(line: 33, column: 16, scope: !34)
!39 = !DILocation(line: 33, column: 9, scope: !34)
!40 = !DILocation(line: 34, column: 9, scope: !34)
!41 = !DILocation(line: 34, column: 21, scope: !34)
!42 = !DILocation(line: 35, column: 21, scope: !34)
!43 = !DILocation(line: 35, column: 10, scope: !34)
!44 = !DILocation(line: 35, column: 19, scope: !34)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 16, scope: !46)
!48 = !DILocation(line: 38, column: 24, scope: !46)
!49 = !DILocation(line: 38, column: 23, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 40, column: 18, scope: !51)
!56 = !DILocation(line: 42, column: 20, scope: !51)
!57 = !DILocation(line: 42, column: 26, scope: !51)
!58 = !DILocation(line: 42, column: 13, scope: !51)
!59 = !DILocation(line: 43, column: 23, scope: !51)
!60 = !DILocation(line: 43, column: 13, scope: !51)
!61 = !DILocation(line: 44, column: 18, scope: !51)
!62 = !DILocation(line: 44, column: 13, scope: !51)
!63 = !DILocation(line: 47, column: 1, scope: !14)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_32_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 82, column: 5, scope: !64)
!66 = !DILocation(line: 83, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 94, type: !68, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !21}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 94, type: !70)
!72 = !DILocation(line: 94, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 94, type: !21)
!74 = !DILocation(line: 94, column: 27, scope: !67)
!75 = !DILocation(line: 97, column: 22, scope: !67)
!76 = !DILocation(line: 97, column: 12, scope: !67)
!77 = !DILocation(line: 97, column: 5, scope: !67)
!78 = !DILocation(line: 99, column: 5, scope: !67)
!79 = !DILocation(line: 100, column: 5, scope: !67)
!80 = !DILocation(line: 101, column: 5, scope: !67)
!81 = !DILocation(line: 104, column: 5, scope: !67)
!82 = !DILocation(line: 105, column: 5, scope: !67)
!83 = !DILocation(line: 106, column: 5, scope: !67)
!84 = !DILocation(line: 108, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 56, type: !4)
!87 = !DILocation(line: 56, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !15, line: 57, type: !21)
!89 = !DILocation(line: 57, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !15, line: 58, type: !21)
!91 = !DILocation(line: 58, column: 13, scope: !85)
!92 = !DILocation(line: 59, column: 20, scope: !85)
!93 = !DILocation(line: 59, column: 10, scope: !85)
!94 = !DILocation(line: 60, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !15, line: 60, column: 9)
!96 = !DILocation(line: 60, column: 14, scope: !95)
!97 = !DILocation(line: 60, column: 9, scope: !85)
!98 = !DILocation(line: 60, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 60, column: 23)
!100 = !DILocalVariable(name: "data", scope: !101, file: !15, line: 62, type: !4)
!101 = distinct !DILexicalBlock(scope: !85, file: !15, line: 61, column: 5)
!102 = !DILocation(line: 62, column: 16, scope: !101)
!103 = !DILocation(line: 62, column: 24, scope: !101)
!104 = !DILocation(line: 62, column: 23, scope: !101)
!105 = !DILocation(line: 64, column: 16, scope: !101)
!106 = !DILocation(line: 64, column: 9, scope: !101)
!107 = !DILocation(line: 65, column: 9, scope: !101)
!108 = !DILocation(line: 65, column: 20, scope: !101)
!109 = !DILocation(line: 66, column: 21, scope: !101)
!110 = !DILocation(line: 66, column: 10, scope: !101)
!111 = !DILocation(line: 66, column: 19, scope: !101)
!112 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 69, type: !4)
!113 = distinct !DILexicalBlock(scope: !85, file: !15, line: 68, column: 5)
!114 = !DILocation(line: 69, column: 16, scope: !113)
!115 = !DILocation(line: 69, column: 24, scope: !113)
!116 = !DILocation(line: 69, column: 23, scope: !113)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !15, line: 71, type: !52)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 70, column: 9)
!119 = !DILocation(line: 71, column: 18, scope: !118)
!120 = !DILocation(line: 73, column: 20, scope: !118)
!121 = !DILocation(line: 73, column: 26, scope: !118)
!122 = !DILocation(line: 73, column: 13, scope: !118)
!123 = !DILocation(line: 74, column: 23, scope: !118)
!124 = !DILocation(line: 74, column: 13, scope: !118)
!125 = !DILocation(line: 75, column: 18, scope: !118)
!126 = !DILocation(line: 75, column: 13, scope: !118)
!127 = !DILocation(line: 78, column: 1, scope: !85)
