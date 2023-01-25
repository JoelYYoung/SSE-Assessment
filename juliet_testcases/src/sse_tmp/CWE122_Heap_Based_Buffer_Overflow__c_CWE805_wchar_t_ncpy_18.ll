; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %source, !dbg !23

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !24), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !48
  %call5 = call i32* @wcsncpy(i32* %3, i32* %arraydecay4, i64 99) #5, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !50
  store i32 0, i32* %arrayidx6, align 4, !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %5), !dbg !53
  %6 = load i32*, i32** %data, align 8, !dbg !54
  %7 = bitcast i32* %6 to i8*, !dbg !54
  call void @free(i8* %7) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32* null, i32** %data, align 8, !dbg !83
  br label %source, !dbg !84

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !85), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !87
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !101
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !102
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx3, align 4, !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !106
  %call5 = call i32* @wcsncpy(i32* %3, i32* %arraydecay4, i64 99) #5, !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !108
  store i32 0, i32* %arrayidx6, align 4, !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %5), !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  %7 = bitcast i32* %6 to i8*, !dbg !112
  call void @free(i8* %7) #5, !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILabel(scope: !16, name: "source", file: !17, line: 28)
!25 = !DILocation(line: 28, column: 1, scope: !16)
!26 = !DILocation(line: 30, column: 23, scope: !16)
!27 = !DILocation(line: 30, column: 12, scope: !16)
!28 = !DILocation(line: 30, column: 10, scope: !16)
!29 = !DILocation(line: 31, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 9)
!31 = !DILocation(line: 31, column: 14, scope: !30)
!32 = !DILocation(line: 31, column: 9, scope: !16)
!33 = !DILocation(line: 31, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !17, line: 31, column: 23)
!35 = !DILocation(line: 32, column: 5, scope: !16)
!36 = !DILocation(line: 32, column: 13, scope: !16)
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 34, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 34, column: 17, scope: !38)
!43 = !DILocation(line: 35, column: 17, scope: !38)
!44 = !DILocation(line: 35, column: 9, scope: !38)
!45 = !DILocation(line: 36, column: 9, scope: !38)
!46 = !DILocation(line: 36, column: 23, scope: !38)
!47 = !DILocation(line: 38, column: 17, scope: !38)
!48 = !DILocation(line: 38, column: 23, scope: !38)
!49 = !DILocation(line: 38, column: 9, scope: !38)
!50 = !DILocation(line: 39, column: 9, scope: !38)
!51 = !DILocation(line: 39, column: 21, scope: !38)
!52 = !DILocation(line: 40, column: 20, scope: !38)
!53 = !DILocation(line: 40, column: 9, scope: !38)
!54 = !DILocation(line: 41, column: 14, scope: !38)
!55 = !DILocation(line: 41, column: 9, scope: !38)
!56 = !DILocation(line: 43, column: 1, scope: !16)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_18_good", scope: !17, file: !17, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 74, column: 5, scope: !57)
!59 = !DILocation(line: 75, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 87, type: !61, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !17, line: 87, type: !7)
!67 = !DILocation(line: 87, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !17, line: 87, type: !63)
!69 = !DILocation(line: 87, column: 27, scope: !60)
!70 = !DILocation(line: 90, column: 22, scope: !60)
!71 = !DILocation(line: 90, column: 12, scope: !60)
!72 = !DILocation(line: 90, column: 5, scope: !60)
!73 = !DILocation(line: 92, column: 5, scope: !60)
!74 = !DILocation(line: 93, column: 5, scope: !60)
!75 = !DILocation(line: 94, column: 5, scope: !60)
!76 = !DILocation(line: 97, column: 5, scope: !60)
!77 = !DILocation(line: 98, column: 5, scope: !60)
!78 = !DILocation(line: 99, column: 5, scope: !60)
!79 = !DILocation(line: 101, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 50, type: !18, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !17, line: 52, type: !4)
!82 = !DILocation(line: 52, column: 15, scope: !80)
!83 = !DILocation(line: 53, column: 10, scope: !80)
!84 = !DILocation(line: 54, column: 5, scope: !80)
!85 = !DILabel(scope: !80, name: "source", file: !17, line: 55)
!86 = !DILocation(line: 55, column: 1, scope: !80)
!87 = !DILocation(line: 57, column: 23, scope: !80)
!88 = !DILocation(line: 57, column: 12, scope: !80)
!89 = !DILocation(line: 57, column: 10, scope: !80)
!90 = !DILocation(line: 58, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !17, line: 58, column: 9)
!92 = !DILocation(line: 58, column: 14, scope: !91)
!93 = !DILocation(line: 58, column: 9, scope: !80)
!94 = !DILocation(line: 58, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !17, line: 58, column: 23)
!96 = !DILocation(line: 59, column: 5, scope: !80)
!97 = !DILocation(line: 59, column: 13, scope: !80)
!98 = !DILocalVariable(name: "source", scope: !99, file: !17, line: 61, type: !39)
!99 = distinct !DILexicalBlock(scope: !80, file: !17, line: 60, column: 5)
!100 = !DILocation(line: 61, column: 17, scope: !99)
!101 = !DILocation(line: 62, column: 17, scope: !99)
!102 = !DILocation(line: 62, column: 9, scope: !99)
!103 = !DILocation(line: 63, column: 9, scope: !99)
!104 = !DILocation(line: 63, column: 23, scope: !99)
!105 = !DILocation(line: 65, column: 17, scope: !99)
!106 = !DILocation(line: 65, column: 23, scope: !99)
!107 = !DILocation(line: 65, column: 9, scope: !99)
!108 = !DILocation(line: 66, column: 9, scope: !99)
!109 = !DILocation(line: 66, column: 21, scope: !99)
!110 = !DILocation(line: 67, column: 20, scope: !99)
!111 = !DILocation(line: 67, column: 9, scope: !99)
!112 = !DILocation(line: 68, column: 14, scope: !99)
!113 = !DILocation(line: 68, column: 9, scope: !99)
!114 = !DILocation(line: 70, column: 1, scope: !80)
