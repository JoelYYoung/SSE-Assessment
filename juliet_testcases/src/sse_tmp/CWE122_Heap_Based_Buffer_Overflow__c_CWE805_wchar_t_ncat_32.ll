; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %5 = load i32*, i32** %data1, align 8, !dbg !44
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  store i32* %5, i32** %6, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !50
  %8 = load i32*, i32** %7, align 8, !dbg !51
  store i32* %8, i32** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx4, align 4, !dbg !61
  %9 = load i32*, i32** %data2, align 8, !dbg !62
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !63
  %call6 = call i32* @wcsncat(i32* %9, i32* %arraydecay5, i64 100) #5, !dbg !64
  %10 = load i32*, i32** %data2, align 8, !dbg !65
  call void @printWLine(i32* %10), !dbg !66
  %11 = load i32*, i32** %data2, align 8, !dbg !67
  %12 = bitcast i32* %11 to i8*, !dbg !67
  call void @free(i8* %12) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !96, metadata !DIExpression()), !dbg !97
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !98, metadata !DIExpression()), !dbg !99
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !99
  store i32* null, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !104
  %1 = load i32*, i32** %0, align 8, !dbg !105
  store i32* %1, i32** %data1, align 8, !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !106
  %2 = bitcast i8* %call to i32*, !dbg !107
  store i32* %2, i32** %data1, align 8, !dbg !108
  %3 = load i32*, i32** %data1, align 8, !dbg !109
  %cmp = icmp eq i32* %3, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %5 = load i32*, i32** %data1, align 8, !dbg !117
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !118
  store i32* %5, i32** %6, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !120, metadata !DIExpression()), !dbg !122
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !123
  %8 = load i32*, i32** %7, align 8, !dbg !124
  store i32* %8, i32** %data2, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !129
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx4, align 4, !dbg !131
  %9 = load i32*, i32** %data2, align 8, !dbg !132
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call6 = call i32* @wcsncat(i32* %9, i32* %arraydecay5, i64 100) #5, !dbg !134
  %10 = load i32*, i32** %data2, align 8, !dbg !135
  call void @printWLine(i32* %10), !dbg !136
  %11 = load i32*, i32** %data2, align 8, !dbg !137
  %12 = bitcast i32* %11 to i8*, !dbg !137
  call void @free(i8* %12) #5, !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 30, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocation(line: 32, column: 27, scope: !29)
!34 = !DILocation(line: 32, column: 16, scope: !29)
!35 = !DILocation(line: 32, column: 14, scope: !29)
!36 = !DILocation(line: 33, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !17, line: 33, column: 13)
!38 = !DILocation(line: 33, column: 18, scope: !37)
!39 = !DILocation(line: 33, column: 13, scope: !29)
!40 = !DILocation(line: 33, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 33, column: 27)
!42 = !DILocation(line: 34, column: 9, scope: !29)
!43 = !DILocation(line: 34, column: 17, scope: !29)
!44 = !DILocation(line: 35, column: 21, scope: !29)
!45 = !DILocation(line: 35, column: 10, scope: !29)
!46 = !DILocation(line: 35, column: 19, scope: !29)
!47 = !DILocalVariable(name: "data", scope: !48, file: !17, line: 38, type: !4)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 19, scope: !48)
!50 = !DILocation(line: 38, column: 27, scope: !48)
!51 = !DILocation(line: 38, column: 26, scope: !48)
!52 = !DILocalVariable(name: "source", scope: !53, file: !17, line: 40, type: !54)
!53 = distinct !DILexicalBlock(scope: !48, file: !17, line: 39, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 40, column: 21, scope: !53)
!58 = !DILocation(line: 41, column: 21, scope: !53)
!59 = !DILocation(line: 41, column: 13, scope: !53)
!60 = !DILocation(line: 42, column: 13, scope: !53)
!61 = !DILocation(line: 42, column: 27, scope: !53)
!62 = !DILocation(line: 44, column: 21, scope: !53)
!63 = !DILocation(line: 44, column: 27, scope: !53)
!64 = !DILocation(line: 44, column: 13, scope: !53)
!65 = !DILocation(line: 45, column: 24, scope: !53)
!66 = !DILocation(line: 45, column: 13, scope: !53)
!67 = !DILocation(line: 46, column: 18, scope: !53)
!68 = !DILocation(line: 46, column: 13, scope: !53)
!69 = !DILocation(line: 49, column: 1, scope: !16)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_32_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 86, column: 5, scope: !70)
!72 = !DILocation(line: 87, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 98, type: !74, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !17, line: 98, type: !7)
!80 = !DILocation(line: 98, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !17, line: 98, type: !76)
!82 = !DILocation(line: 98, column: 27, scope: !73)
!83 = !DILocation(line: 101, column: 22, scope: !73)
!84 = !DILocation(line: 101, column: 12, scope: !73)
!85 = !DILocation(line: 101, column: 5, scope: !73)
!86 = !DILocation(line: 103, column: 5, scope: !73)
!87 = !DILocation(line: 104, column: 5, scope: !73)
!88 = !DILocation(line: 105, column: 5, scope: !73)
!89 = !DILocation(line: 108, column: 5, scope: !73)
!90 = !DILocation(line: 109, column: 5, scope: !73)
!91 = !DILocation(line: 110, column: 5, scope: !73)
!92 = !DILocation(line: 112, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !17, line: 58, type: !4)
!95 = !DILocation(line: 58, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataPtr1", scope: !93, file: !17, line: 59, type: !23)
!97 = !DILocation(line: 59, column: 16, scope: !93)
!98 = !DILocalVariable(name: "dataPtr2", scope: !93, file: !17, line: 60, type: !23)
!99 = !DILocation(line: 60, column: 16, scope: !93)
!100 = !DILocation(line: 61, column: 10, scope: !93)
!101 = !DILocalVariable(name: "data", scope: !102, file: !17, line: 63, type: !4)
!102 = distinct !DILexicalBlock(scope: !93, file: !17, line: 62, column: 5)
!103 = !DILocation(line: 63, column: 19, scope: !102)
!104 = !DILocation(line: 63, column: 27, scope: !102)
!105 = !DILocation(line: 63, column: 26, scope: !102)
!106 = !DILocation(line: 65, column: 27, scope: !102)
!107 = !DILocation(line: 65, column: 16, scope: !102)
!108 = !DILocation(line: 65, column: 14, scope: !102)
!109 = !DILocation(line: 66, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !17, line: 66, column: 13)
!111 = !DILocation(line: 66, column: 18, scope: !110)
!112 = !DILocation(line: 66, column: 13, scope: !102)
!113 = !DILocation(line: 66, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 66, column: 27)
!115 = !DILocation(line: 67, column: 9, scope: !102)
!116 = !DILocation(line: 67, column: 17, scope: !102)
!117 = !DILocation(line: 68, column: 21, scope: !102)
!118 = !DILocation(line: 68, column: 10, scope: !102)
!119 = !DILocation(line: 68, column: 19, scope: !102)
!120 = !DILocalVariable(name: "data", scope: !121, file: !17, line: 71, type: !4)
!121 = distinct !DILexicalBlock(scope: !93, file: !17, line: 70, column: 5)
!122 = !DILocation(line: 71, column: 19, scope: !121)
!123 = !DILocation(line: 71, column: 27, scope: !121)
!124 = !DILocation(line: 71, column: 26, scope: !121)
!125 = !DILocalVariable(name: "source", scope: !126, file: !17, line: 73, type: !54)
!126 = distinct !DILexicalBlock(scope: !121, file: !17, line: 72, column: 9)
!127 = !DILocation(line: 73, column: 21, scope: !126)
!128 = !DILocation(line: 74, column: 21, scope: !126)
!129 = !DILocation(line: 74, column: 13, scope: !126)
!130 = !DILocation(line: 75, column: 13, scope: !126)
!131 = !DILocation(line: 75, column: 27, scope: !126)
!132 = !DILocation(line: 77, column: 21, scope: !126)
!133 = !DILocation(line: 77, column: 27, scope: !126)
!134 = !DILocation(line: 77, column: 13, scope: !126)
!135 = !DILocation(line: 78, column: 24, scope: !126)
!136 = !DILocation(line: 78, column: 13, scope: !126)
!137 = !DILocation(line: 79, column: 18, scope: !126)
!138 = !DILocation(line: 79, column: 13, scope: !126)
!139 = !DILocation(line: 82, column: 1, scope: !93)
