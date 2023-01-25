; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !39
  store i32 0, i32* %arrayidx4, align 4, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* %3), !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %5 = bitcast i32* %4 to i8*, !dbg !43
  call void @free(i8* %5) #5, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !51
  %0 = bitcast i8* %call to i32*, !dbg !52
  store i32* %0, i32** %data.addr, align 8, !dbg !53
  %1 = load i32*, i32** %data.addr, align 8, !dbg !54
  %cmp = icmp eq i32* %1, null, !dbg !56
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %3 = load i32*, i32** %data.addr, align 8, !dbg !62
  ret i32* %3, !dbg !63
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42_good() #0 !dbg !64 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @goodG2BSource(i32* %0), !dbg !92
  store i32* %call, i32** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !98
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !103
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !104
  store i32 0, i32* %arrayidx4, align 4, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %3), !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  %5 = bitcast i32* %4 to i8*, !dbg !108
  call void @free(i8* %5) #5, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %data.addr, align 8, !dbg !116
  %1 = load i32*, i32** %data.addr, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %3 = load i32*, i32** %data.addr, align 8, !dbg !125
  ret i32* %3, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !5)
!21 = !DILocation(line: 34, column: 15, scope: !16)
!22 = !DILocation(line: 35, column: 10, scope: !16)
!23 = !DILocation(line: 36, column: 22, scope: !16)
!24 = !DILocation(line: 36, column: 12, scope: !16)
!25 = !DILocation(line: 36, column: 10, scope: !16)
!26 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 38, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 38, column: 17, scope: !27)
!32 = !DILocation(line: 39, column: 17, scope: !27)
!33 = !DILocation(line: 39, column: 9, scope: !27)
!34 = !DILocation(line: 40, column: 9, scope: !27)
!35 = !DILocation(line: 40, column: 23, scope: !27)
!36 = !DILocation(line: 42, column: 17, scope: !27)
!37 = !DILocation(line: 42, column: 23, scope: !27)
!38 = !DILocation(line: 42, column: 9, scope: !27)
!39 = !DILocation(line: 43, column: 9, scope: !27)
!40 = !DILocation(line: 43, column: 21, scope: !27)
!41 = !DILocation(line: 44, column: 20, scope: !27)
!42 = !DILocation(line: 44, column: 9, scope: !27)
!43 = !DILocation(line: 45, column: 14, scope: !27)
!44 = !DILocation(line: 45, column: 9, scope: !27)
!45 = !DILocation(line: 47, column: 1, scope: !16)
!46 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !47, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!5, !5}
!49 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !17, line: 23, type: !5)
!50 = !DILocation(line: 23, column: 38, scope: !46)
!51 = !DILocation(line: 26, column: 23, scope: !46)
!52 = !DILocation(line: 26, column: 12, scope: !46)
!53 = !DILocation(line: 26, column: 10, scope: !46)
!54 = !DILocation(line: 27, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !46, file: !17, line: 27, column: 9)
!56 = !DILocation(line: 27, column: 14, scope: !55)
!57 = !DILocation(line: 27, column: 9, scope: !46)
!58 = !DILocation(line: 27, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !17, line: 27, column: 23)
!60 = !DILocation(line: 28, column: 5, scope: !46)
!61 = !DILocation(line: 28, column: 13, scope: !46)
!62 = !DILocation(line: 29, column: 12, scope: !46)
!63 = !DILocation(line: 29, column: 5, scope: !46)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_42_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 82, column: 5, scope: !64)
!66 = !DILocation(line: 83, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !68, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!8, !8, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 95, type: !8)
!74 = !DILocation(line: 95, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 95, type: !70)
!76 = !DILocation(line: 95, column: 27, scope: !67)
!77 = !DILocation(line: 98, column: 22, scope: !67)
!78 = !DILocation(line: 98, column: 12, scope: !67)
!79 = !DILocation(line: 98, column: 5, scope: !67)
!80 = !DILocation(line: 100, column: 5, scope: !67)
!81 = !DILocation(line: 101, column: 5, scope: !67)
!82 = !DILocation(line: 102, column: 5, scope: !67)
!83 = !DILocation(line: 105, column: 5, scope: !67)
!84 = !DILocation(line: 106, column: 5, scope: !67)
!85 = !DILocation(line: 107, column: 5, scope: !67)
!86 = !DILocation(line: 109, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 65, type: !5)
!89 = !DILocation(line: 65, column: 15, scope: !87)
!90 = !DILocation(line: 66, column: 10, scope: !87)
!91 = !DILocation(line: 67, column: 26, scope: !87)
!92 = !DILocation(line: 67, column: 12, scope: !87)
!93 = !DILocation(line: 67, column: 10, scope: !87)
!94 = !DILocalVariable(name: "source", scope: !95, file: !17, line: 69, type: !28)
!95 = distinct !DILexicalBlock(scope: !87, file: !17, line: 68, column: 5)
!96 = !DILocation(line: 69, column: 17, scope: !95)
!97 = !DILocation(line: 70, column: 17, scope: !95)
!98 = !DILocation(line: 70, column: 9, scope: !95)
!99 = !DILocation(line: 71, column: 9, scope: !95)
!100 = !DILocation(line: 71, column: 23, scope: !95)
!101 = !DILocation(line: 73, column: 17, scope: !95)
!102 = !DILocation(line: 73, column: 23, scope: !95)
!103 = !DILocation(line: 73, column: 9, scope: !95)
!104 = !DILocation(line: 74, column: 9, scope: !95)
!105 = !DILocation(line: 74, column: 21, scope: !95)
!106 = !DILocation(line: 75, column: 20, scope: !95)
!107 = !DILocation(line: 75, column: 9, scope: !95)
!108 = !DILocation(line: 76, column: 14, scope: !95)
!109 = !DILocation(line: 76, column: 9, scope: !95)
!110 = !DILocation(line: 78, column: 1, scope: !87)
!111 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 53, type: !47, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !17, line: 53, type: !5)
!113 = !DILocation(line: 53, column: 42, scope: !111)
!114 = !DILocation(line: 56, column: 23, scope: !111)
!115 = !DILocation(line: 56, column: 12, scope: !111)
!116 = !DILocation(line: 56, column: 10, scope: !111)
!117 = !DILocation(line: 57, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !17, line: 57, column: 9)
!119 = !DILocation(line: 57, column: 14, scope: !118)
!120 = !DILocation(line: 57, column: 9, scope: !111)
!121 = !DILocation(line: 57, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 57, column: 23)
!123 = !DILocation(line: 58, column: 5, scope: !111)
!124 = !DILocation(line: 58, column: 13, scope: !111)
!125 = !DILocation(line: 59, column: 12, scope: !111)
!126 = !DILocation(line: 59, column: 5, scope: !111)
