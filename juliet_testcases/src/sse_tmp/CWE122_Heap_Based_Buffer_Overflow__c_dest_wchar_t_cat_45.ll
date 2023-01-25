; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_badData, align 8, !dbg !69
  store i32* %0, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !70, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !76
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !77
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !81
  %call2 = call i32* @wcscat(i32* %1, i32* %arraydecay1) #5, !dbg !82
  %2 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %2), !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %4 = bitcast i32* %3 to i8*, !dbg !85
  call void @free(i8* %4) #5, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_goodG2BData, align 8, !dbg !104
  call void @goodG2BSink(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_goodG2BData, align 8, !dbg !110
  store i32* %0, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !115
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call2 = call i32* @wcscat(i32* %1, i32* %arraydecay1) #5, !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  call void @printWLine(i32* %2), !dbg !122
  %3 = load i32*, i32** %data, align 8, !dbg !123
  %4 = bitcast i32* %3 to i8*, !dbg !123
  call void @free(i8* %4) #5, !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_bad", scope: !15, file: !15, line: 40, type: !23, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 42, type: !6)
!26 = !DILocation(line: 42, column: 15, scope: !22)
!27 = !DILocation(line: 43, column: 10, scope: !22)
!28 = !DILocation(line: 45, column: 23, scope: !22)
!29 = !DILocation(line: 45, column: 12, scope: !22)
!30 = !DILocation(line: 45, column: 10, scope: !22)
!31 = !DILocation(line: 46, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 46, column: 9)
!33 = !DILocation(line: 46, column: 14, scope: !32)
!34 = !DILocation(line: 46, column: 9, scope: !22)
!35 = !DILocation(line: 46, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 46, column: 23)
!37 = !DILocation(line: 47, column: 5, scope: !22)
!38 = !DILocation(line: 47, column: 13, scope: !22)
!39 = !DILocation(line: 48, column: 72, scope: !22)
!40 = !DILocation(line: 48, column: 70, scope: !22)
!41 = !DILocation(line: 49, column: 5, scope: !22)
!42 = !DILocation(line: 50, column: 1, scope: !22)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_45_good", scope: !15, file: !15, line: 83, type: !23, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 85, column: 5, scope: !43)
!45 = !DILocation(line: 86, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 97, type: !47, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!9, !9, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 97, type: !9)
!53 = !DILocation(line: 97, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 97, type: !49)
!55 = !DILocation(line: 97, column: 27, scope: !46)
!56 = !DILocation(line: 100, column: 22, scope: !46)
!57 = !DILocation(line: 100, column: 12, scope: !46)
!58 = !DILocation(line: 100, column: 5, scope: !46)
!59 = !DILocation(line: 102, column: 5, scope: !46)
!60 = !DILocation(line: 103, column: 5, scope: !46)
!61 = !DILocation(line: 104, column: 5, scope: !46)
!62 = !DILocation(line: 107, column: 5, scope: !46)
!63 = !DILocation(line: 108, column: 5, scope: !46)
!64 = !DILocation(line: 109, column: 5, scope: !46)
!65 = !DILocation(line: 111, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 28, type: !6)
!68 = !DILocation(line: 28, column: 15, scope: !66)
!69 = !DILocation(line: 28, column: 22, scope: !66)
!70 = !DILocalVariable(name: "source", scope: !71, file: !15, line: 30, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !15, line: 29, column: 5)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 100)
!75 = !DILocation(line: 30, column: 17, scope: !71)
!76 = !DILocation(line: 31, column: 17, scope: !71)
!77 = !DILocation(line: 31, column: 9, scope: !71)
!78 = !DILocation(line: 32, column: 9, scope: !71)
!79 = !DILocation(line: 32, column: 23, scope: !71)
!80 = !DILocation(line: 34, column: 16, scope: !71)
!81 = !DILocation(line: 34, column: 22, scope: !71)
!82 = !DILocation(line: 34, column: 9, scope: !71)
!83 = !DILocation(line: 35, column: 20, scope: !71)
!84 = !DILocation(line: 35, column: 9, scope: !71)
!85 = !DILocation(line: 36, column: 14, scope: !71)
!86 = !DILocation(line: 36, column: 9, scope: !71)
!87 = !DILocation(line: 38, column: 1, scope: !66)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 71, type: !23, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 73, type: !6)
!90 = !DILocation(line: 73, column: 15, scope: !88)
!91 = !DILocation(line: 74, column: 10, scope: !88)
!92 = !DILocation(line: 76, column: 23, scope: !88)
!93 = !DILocation(line: 76, column: 12, scope: !88)
!94 = !DILocation(line: 76, column: 10, scope: !88)
!95 = !DILocation(line: 77, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !15, line: 77, column: 9)
!97 = !DILocation(line: 77, column: 14, scope: !96)
!98 = !DILocation(line: 77, column: 9, scope: !88)
!99 = !DILocation(line: 77, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 77, column: 23)
!101 = !DILocation(line: 78, column: 5, scope: !88)
!102 = !DILocation(line: 78, column: 13, scope: !88)
!103 = !DILocation(line: 79, column: 76, scope: !88)
!104 = !DILocation(line: 79, column: 74, scope: !88)
!105 = !DILocation(line: 80, column: 5, scope: !88)
!106 = !DILocation(line: 81, column: 1, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 57, type: !23, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 59, type: !6)
!109 = !DILocation(line: 59, column: 15, scope: !107)
!110 = !DILocation(line: 59, column: 22, scope: !107)
!111 = !DILocalVariable(name: "source", scope: !112, file: !15, line: 61, type: !72)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 60, column: 5)
!113 = !DILocation(line: 61, column: 17, scope: !112)
!114 = !DILocation(line: 62, column: 17, scope: !112)
!115 = !DILocation(line: 62, column: 9, scope: !112)
!116 = !DILocation(line: 63, column: 9, scope: !112)
!117 = !DILocation(line: 63, column: 23, scope: !112)
!118 = !DILocation(line: 65, column: 16, scope: !112)
!119 = !DILocation(line: 65, column: 22, scope: !112)
!120 = !DILocation(line: 65, column: 9, scope: !112)
!121 = !DILocation(line: 66, column: 20, scope: !112)
!122 = !DILocation(line: 66, column: 9, scope: !112)
!123 = !DILocation(line: 67, column: 14, scope: !112)
!124 = !DILocation(line: 67, column: 9, scope: !112)
!125 = !DILocation(line: 69, column: 1, scope: !107)
