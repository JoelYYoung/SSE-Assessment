; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %3, i8** %4, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %6 = load i8*, i8** %5, align 8, !dbg !46
  store i8* %6, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  %8 = load i8*, i8** %data2, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i8* @strcpy(i8* %8, i8* %arraydecay) #6, !dbg !55
  %9 = load i8*, i8** %data2, align 8, !dbg !56
  call void @printLine(i8* %9), !dbg !57
  %10 = load i8*, i8** %data2, align 8, !dbg !58
  call void @free(i8* %10) #6, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !90, metadata !DIExpression()), !dbg !92
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !93
  %1 = load i8*, i8** %0, align 8, !dbg !94
  store i8* %1, i8** %data1, align 8, !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !95
  store i8* %call, i8** %data1, align 8, !dbg !96
  %2 = load i8*, i8** %data1, align 8, !dbg !97
  %cmp = icmp eq i8* %2, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !103
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !104
  store i8* %3, i8** %4, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !109
  %6 = load i8*, i8** %5, align 8, !dbg !110
  store i8* %6, i8** %data2, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !113
  %8 = load i8*, i8** %data2, align 8, !dbg !114
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !115
  %call3 = call i8* @strcpy(i8* %8, i8* %arraydecay) #6, !dbg !116
  %9 = load i8*, i8** %data2, align 8, !dbg !117
  call void @printLine(i8* %9), !dbg !118
  %10 = load i8*, i8** %data2, align 8, !dbg !119
  call void @free(i8* %10) #6, !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 31, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 32, type: !21)
!24 = !DILocation(line: 32, column: 13, scope: !14)
!25 = !DILocation(line: 33, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 35, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!28 = !DILocation(line: 35, column: 16, scope: !27)
!29 = !DILocation(line: 35, column: 24, scope: !27)
!30 = !DILocation(line: 35, column: 23, scope: !27)
!31 = !DILocation(line: 37, column: 24, scope: !27)
!32 = !DILocation(line: 37, column: 14, scope: !27)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 18, scope: !34)
!36 = !DILocation(line: 38, column: 13, scope: !27)
!37 = !DILocation(line: 38, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 38, column: 27)
!39 = !DILocation(line: 39, column: 21, scope: !27)
!40 = !DILocation(line: 39, column: 10, scope: !27)
!41 = !DILocation(line: 39, column: 19, scope: !27)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 42, type: !4)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!44 = !DILocation(line: 42, column: 16, scope: !43)
!45 = !DILocation(line: 42, column: 24, scope: !43)
!46 = !DILocation(line: 42, column: 23, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !15, line: 44, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !15, line: 43, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 44, column: 18, scope: !48)
!53 = !DILocation(line: 46, column: 20, scope: !48)
!54 = !DILocation(line: 46, column: 26, scope: !48)
!55 = !DILocation(line: 46, column: 13, scope: !48)
!56 = !DILocation(line: 47, column: 23, scope: !48)
!57 = !DILocation(line: 47, column: 13, scope: !48)
!58 = !DILocation(line: 48, column: 18, scope: !48)
!59 = !DILocation(line: 48, column: 13, scope: !48)
!60 = !DILocation(line: 51, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_32_good", scope: !15, file: !15, line: 83, type: !16, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 85, column: 5, scope: !61)
!63 = !DILocation(line: 86, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 97, type: !65, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !21}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !15, line: 97, type: !67)
!69 = !DILocation(line: 97, column: 14, scope: !64)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !15, line: 97, type: !21)
!71 = !DILocation(line: 97, column: 27, scope: !64)
!72 = !DILocation(line: 100, column: 22, scope: !64)
!73 = !DILocation(line: 100, column: 12, scope: !64)
!74 = !DILocation(line: 100, column: 5, scope: !64)
!75 = !DILocation(line: 102, column: 5, scope: !64)
!76 = !DILocation(line: 103, column: 5, scope: !64)
!77 = !DILocation(line: 104, column: 5, scope: !64)
!78 = !DILocation(line: 107, column: 5, scope: !64)
!79 = !DILocation(line: 108, column: 5, scope: !64)
!80 = !DILocation(line: 109, column: 5, scope: !64)
!81 = !DILocation(line: 111, column: 5, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 60, type: !4)
!84 = !DILocation(line: 60, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataPtr1", scope: !82, file: !15, line: 61, type: !21)
!86 = !DILocation(line: 61, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataPtr2", scope: !82, file: !15, line: 62, type: !21)
!88 = !DILocation(line: 62, column: 13, scope: !82)
!89 = !DILocation(line: 63, column: 10, scope: !82)
!90 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 65, type: !4)
!91 = distinct !DILexicalBlock(scope: !82, file: !15, line: 64, column: 5)
!92 = !DILocation(line: 65, column: 16, scope: !91)
!93 = !DILocation(line: 65, column: 24, scope: !91)
!94 = !DILocation(line: 65, column: 23, scope: !91)
!95 = !DILocation(line: 67, column: 24, scope: !91)
!96 = !DILocation(line: 67, column: 14, scope: !91)
!97 = !DILocation(line: 68, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !15, line: 68, column: 13)
!99 = !DILocation(line: 68, column: 18, scope: !98)
!100 = !DILocation(line: 68, column: 13, scope: !91)
!101 = !DILocation(line: 68, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 68, column: 27)
!103 = !DILocation(line: 69, column: 21, scope: !91)
!104 = !DILocation(line: 69, column: 10, scope: !91)
!105 = !DILocation(line: 69, column: 19, scope: !91)
!106 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 72, type: !4)
!107 = distinct !DILexicalBlock(scope: !82, file: !15, line: 71, column: 5)
!108 = !DILocation(line: 72, column: 16, scope: !107)
!109 = !DILocation(line: 72, column: 24, scope: !107)
!110 = !DILocation(line: 72, column: 23, scope: !107)
!111 = !DILocalVariable(name: "source", scope: !112, file: !15, line: 74, type: !49)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 73, column: 9)
!113 = !DILocation(line: 74, column: 18, scope: !112)
!114 = !DILocation(line: 76, column: 20, scope: !112)
!115 = !DILocation(line: 76, column: 26, scope: !112)
!116 = !DILocation(line: 76, column: 13, scope: !112)
!117 = !DILocation(line: 77, column: 23, scope: !112)
!118 = !DILocation(line: 77, column: 13, scope: !112)
!119 = !DILocation(line: 78, column: 18, scope: !112)
!120 = !DILocation(line: 78, column: 13, scope: !112)
!121 = !DILocation(line: 81, column: 1, scope: !82)
