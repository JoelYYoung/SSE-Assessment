; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %3, i32** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !40
  store i32* %4, i32** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %5 = load i32*, i32** %data1, align 8, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !53
  %6 = load i32*, i32** %data1, align 8, !dbg !54
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !54
  store i32 0, i32* %arrayidx6, align 4, !dbg !55
  %7 = load i32*, i32** %data1, align 8, !dbg !56
  call void @printWLine(i32* %7), !dbg !57
  %8 = load i32*, i32** %data1, align 8, !dbg !58
  %9 = bitcast i32* %8 to i8*, !dbg !58
  call void @free(i8* %9) #5, !dbg !59
  ret void, !dbg !60
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
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31_good() #0 !dbg !61 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %data, align 8, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  store i32* %3, i32** %dataCopy, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !103, metadata !DIExpression()), !dbg !104
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !105
  store i32* %4, i32** %data1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !110
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx3, align 4, !dbg !112
  %5 = load i32*, i32** %data1, align 8, !dbg !113
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !115
  %6 = load i32*, i32** %data1, align 8, !dbg !116
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !116
  store i32 0, i32* %arrayidx6, align 4, !dbg !117
  %7 = load i32*, i32** %data1, align 8, !dbg !118
  call void @printWLine(i32* %7), !dbg !119
  %8 = load i32*, i32** %data1, align 8, !dbg !120
  %9 = bitcast i32* %8 to i8*, !dbg !120
  call void @free(i8* %9) #5, !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 28, column: 23, scope: !16)
!24 = !DILocation(line: 28, column: 12, scope: !16)
!25 = !DILocation(line: 28, column: 10, scope: !16)
!26 = !DILocation(line: 29, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!28 = !DILocation(line: 29, column: 14, scope: !27)
!29 = !DILocation(line: 29, column: 9, scope: !16)
!30 = !DILocation(line: 29, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 29, column: 23)
!32 = !DILocation(line: 30, column: 5, scope: !16)
!33 = !DILocation(line: 30, column: 13, scope: !16)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !17, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !17, line: 33, type: !4)
!39 = !DILocation(line: 33, column: 19, scope: !35)
!40 = !DILocation(line: 33, column: 26, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !17, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !17, line: 34, column: 9)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 35, column: 21, scope: !42)
!47 = !DILocation(line: 36, column: 21, scope: !42)
!48 = !DILocation(line: 36, column: 13, scope: !42)
!49 = !DILocation(line: 37, column: 13, scope: !42)
!50 = !DILocation(line: 37, column: 27, scope: !42)
!51 = !DILocation(line: 39, column: 21, scope: !42)
!52 = !DILocation(line: 39, column: 27, scope: !42)
!53 = !DILocation(line: 39, column: 13, scope: !42)
!54 = !DILocation(line: 40, column: 13, scope: !42)
!55 = !DILocation(line: 40, column: 25, scope: !42)
!56 = !DILocation(line: 41, column: 24, scope: !42)
!57 = !DILocation(line: 41, column: 13, scope: !42)
!58 = !DILocation(line: 42, column: 18, scope: !42)
!59 = !DILocation(line: 42, column: 13, scope: !42)
!60 = !DILocation(line: 45, column: 1, scope: !16)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_31_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 78, column: 5, scope: !61)
!63 = !DILocation(line: 79, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 90, type: !65, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 90, type: !7)
!71 = !DILocation(line: 90, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 90, type: !67)
!73 = !DILocation(line: 90, column: 27, scope: !64)
!74 = !DILocation(line: 93, column: 22, scope: !64)
!75 = !DILocation(line: 93, column: 12, scope: !64)
!76 = !DILocation(line: 93, column: 5, scope: !64)
!77 = !DILocation(line: 95, column: 5, scope: !64)
!78 = !DILocation(line: 96, column: 5, scope: !64)
!79 = !DILocation(line: 97, column: 5, scope: !64)
!80 = !DILocation(line: 100, column: 5, scope: !64)
!81 = !DILocation(line: 101, column: 5, scope: !64)
!82 = !DILocation(line: 102, column: 5, scope: !64)
!83 = !DILocation(line: 104, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 54, type: !4)
!86 = !DILocation(line: 54, column: 15, scope: !84)
!87 = !DILocation(line: 55, column: 10, scope: !84)
!88 = !DILocation(line: 57, column: 23, scope: !84)
!89 = !DILocation(line: 57, column: 12, scope: !84)
!90 = !DILocation(line: 57, column: 10, scope: !84)
!91 = !DILocation(line: 58, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !17, line: 58, column: 9)
!93 = !DILocation(line: 58, column: 14, scope: !92)
!94 = !DILocation(line: 58, column: 9, scope: !84)
!95 = !DILocation(line: 58, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 58, column: 23)
!97 = !DILocation(line: 59, column: 5, scope: !84)
!98 = !DILocation(line: 59, column: 13, scope: !84)
!99 = !DILocalVariable(name: "dataCopy", scope: !100, file: !17, line: 61, type: !4)
!100 = distinct !DILexicalBlock(scope: !84, file: !17, line: 60, column: 5)
!101 = !DILocation(line: 61, column: 19, scope: !100)
!102 = !DILocation(line: 61, column: 30, scope: !100)
!103 = !DILocalVariable(name: "data", scope: !100, file: !17, line: 62, type: !4)
!104 = !DILocation(line: 62, column: 19, scope: !100)
!105 = !DILocation(line: 62, column: 26, scope: !100)
!106 = !DILocalVariable(name: "source", scope: !107, file: !17, line: 64, type: !43)
!107 = distinct !DILexicalBlock(scope: !100, file: !17, line: 63, column: 9)
!108 = !DILocation(line: 64, column: 21, scope: !107)
!109 = !DILocation(line: 65, column: 21, scope: !107)
!110 = !DILocation(line: 65, column: 13, scope: !107)
!111 = !DILocation(line: 66, column: 13, scope: !107)
!112 = !DILocation(line: 66, column: 27, scope: !107)
!113 = !DILocation(line: 68, column: 21, scope: !107)
!114 = !DILocation(line: 68, column: 27, scope: !107)
!115 = !DILocation(line: 68, column: 13, scope: !107)
!116 = !DILocation(line: 69, column: 13, scope: !107)
!117 = !DILocation(line: 69, column: 25, scope: !107)
!118 = !DILocation(line: 70, column: 24, scope: !107)
!119 = !DILocation(line: 70, column: 13, scope: !107)
!120 = !DILocation(line: 71, column: 18, scope: !107)
!121 = !DILocation(line: 71, column: 13, scope: !107)
!122 = !DILocation(line: 74, column: 1, scope: !84)
