; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !29
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %0 = load i32*, i32** %data.addr, align 8, !dbg !32
  %1 = bitcast i32* %0 to i8*, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !33
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !33
  %3 = load i32*, i32** %data.addr, align 8, !dbg !34
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !34
  store i32 0, i32* %arrayidx2, align 4, !dbg !35
  %4 = load i32*, i32** %data.addr, align 8, !dbg !36
  call void @printWLine(i32* %4), !dbg !37
  %5 = load i32*, i32** %data.addr, align 8, !dbg !38
  %6 = bitcast i32* %5 to i8*, !dbg !38
  call void @free(i8* %6) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_bad() #0 !dbg !41 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i32* null, i32** %data, align 8, !dbg !46
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !47
  %0 = bitcast i8* %call to i32*, !dbg !48
  store i32* %0, i32** %data, align 8, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  %cmp = icmp eq i32* %1, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !56
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %3 = load i32*, i32** %data, align 8, !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_badSink(i32* %3), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_goodG2BSink(i32* %data) #0 !dbg !61 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !64, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !67
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !68
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !70
  %0 = load i32*, i32** %data.addr, align 8, !dbg !71
  %1 = bitcast i32* %0 to i8*, !dbg !72
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !72
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !72
  %3 = load i32*, i32** %data.addr, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !73
  store i32 0, i32* %arrayidx2, align 4, !dbg !74
  %4 = load i32*, i32** %data.addr, align 8, !dbg !75
  call void @printWLine(i32* %4), !dbg !76
  %5 = load i32*, i32** %data.addr, align 8, !dbg !77
  %6 = bitcast i32* %5 to i8*, !dbg !77
  call void @free(i8* %6) #6, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #6, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #6, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %3 = load i32*, i32** %data, align 8, !dbg !118
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_goodG2BSink(i32* %3), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 86, scope: !16)
!22 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocation(line: 27, column: 17, scope: !23)
!29 = !DILocation(line: 27, column: 9, scope: !23)
!30 = !DILocation(line: 28, column: 9, scope: !23)
!31 = !DILocation(line: 28, column: 23, scope: !23)
!32 = !DILocation(line: 30, column: 16, scope: !23)
!33 = !DILocation(line: 30, column: 9, scope: !23)
!34 = !DILocation(line: 31, column: 9, scope: !23)
!35 = !DILocation(line: 31, column: 21, scope: !23)
!36 = !DILocation(line: 32, column: 20, scope: !23)
!37 = !DILocation(line: 32, column: 9, scope: !23)
!38 = !DILocation(line: 33, column: 14, scope: !23)
!39 = !DILocation(line: 33, column: 9, scope: !23)
!40 = !DILocation(line: 35, column: 1, scope: !16)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_bad", scope: !17, file: !17, line: 37, type: !42, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null}
!44 = !DILocalVariable(name: "data", scope: !41, file: !17, line: 39, type: !4)
!45 = !DILocation(line: 39, column: 15, scope: !41)
!46 = !DILocation(line: 40, column: 10, scope: !41)
!47 = !DILocation(line: 42, column: 23, scope: !41)
!48 = !DILocation(line: 42, column: 12, scope: !41)
!49 = !DILocation(line: 42, column: 10, scope: !41)
!50 = !DILocation(line: 43, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !41, file: !17, line: 43, column: 9)
!52 = !DILocation(line: 43, column: 14, scope: !51)
!53 = !DILocation(line: 43, column: 9, scope: !41)
!54 = !DILocation(line: 43, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !17, line: 43, column: 23)
!56 = !DILocation(line: 44, column: 5, scope: !41)
!57 = !DILocation(line: 44, column: 13, scope: !41)
!58 = !DILocation(line: 45, column: 75, scope: !41)
!59 = !DILocation(line: 45, column: 5, scope: !41)
!60 = !DILocation(line: 46, column: 1, scope: !41)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_goodG2BSink", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", arg: 1, scope: !61, file: !17, line: 52, type: !4)
!63 = !DILocation(line: 52, column: 90, scope: !61)
!64 = !DILocalVariable(name: "source", scope: !65, file: !17, line: 55, type: !24)
!65 = distinct !DILexicalBlock(scope: !61, file: !17, line: 54, column: 5)
!66 = !DILocation(line: 55, column: 17, scope: !65)
!67 = !DILocation(line: 56, column: 17, scope: !65)
!68 = !DILocation(line: 56, column: 9, scope: !65)
!69 = !DILocation(line: 57, column: 9, scope: !65)
!70 = !DILocation(line: 57, column: 23, scope: !65)
!71 = !DILocation(line: 59, column: 16, scope: !65)
!72 = !DILocation(line: 59, column: 9, scope: !65)
!73 = !DILocation(line: 60, column: 9, scope: !65)
!74 = !DILocation(line: 60, column: 21, scope: !65)
!75 = !DILocation(line: 61, column: 20, scope: !65)
!76 = !DILocation(line: 61, column: 9, scope: !65)
!77 = !DILocation(line: 62, column: 14, scope: !65)
!78 = !DILocation(line: 62, column: 9, scope: !65)
!79 = !DILocation(line: 64, column: 1, scope: !61)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_41_good", scope: !17, file: !17, line: 78, type: !42, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 80, column: 5, scope: !80)
!82 = !DILocation(line: 81, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 93, type: !84, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 93, type: !7)
!90 = !DILocation(line: 93, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 93, type: !86)
!92 = !DILocation(line: 93, column: 27, scope: !83)
!93 = !DILocation(line: 96, column: 22, scope: !83)
!94 = !DILocation(line: 96, column: 12, scope: !83)
!95 = !DILocation(line: 96, column: 5, scope: !83)
!96 = !DILocation(line: 98, column: 5, scope: !83)
!97 = !DILocation(line: 99, column: 5, scope: !83)
!98 = !DILocation(line: 100, column: 5, scope: !83)
!99 = !DILocation(line: 103, column: 5, scope: !83)
!100 = !DILocation(line: 104, column: 5, scope: !83)
!101 = !DILocation(line: 105, column: 5, scope: !83)
!102 = !DILocation(line: 107, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 67, type: !42, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !17, line: 69, type: !4)
!105 = !DILocation(line: 69, column: 15, scope: !103)
!106 = !DILocation(line: 70, column: 10, scope: !103)
!107 = !DILocation(line: 72, column: 23, scope: !103)
!108 = !DILocation(line: 72, column: 12, scope: !103)
!109 = !DILocation(line: 72, column: 10, scope: !103)
!110 = !DILocation(line: 73, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !17, line: 73, column: 9)
!112 = !DILocation(line: 73, column: 14, scope: !111)
!113 = !DILocation(line: 73, column: 9, scope: !103)
!114 = !DILocation(line: 73, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 73, column: 23)
!116 = !DILocation(line: 74, column: 5, scope: !103)
!117 = !DILocation(line: 74, column: 13, scope: !103)
!118 = !DILocation(line: 75, column: 79, scope: !103)
!119 = !DILocation(line: 75, column: 5, scope: !103)
!120 = !DILocation(line: 76, column: 1, scope: !103)
