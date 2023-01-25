; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  call void %4(i32* %5), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !52
  %1 = load i32*, i32** %data.addr, align 8, !dbg !53
  %call = call i32* @wcscat(i32* %arraydecay, i32* %1) #6, !dbg !54
  %2 = load i32*, i32** %data.addr, align 8, !dbg !55
  call void @printWLine(i32* %2), !dbg !56
  %3 = load i32*, i32** %data.addr, align 8, !dbg !57
  %4 = bitcast i32* %3 to i8*, !dbg !57
  call void @free(i8* %4) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !86, metadata !DIExpression()), !dbg !87
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %data, align 8, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !102
  call void %4(i32* %5), !dbg !101
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !104 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !110
  %1 = load i32*, i32** %data.addr, align 8, !dbg !111
  %call = call i32* @wcscat(i32* %arraydecay, i32* %1) #6, !dbg !112
  %2 = load i32*, i32** %data.addr, align 8, !dbg !113
  call void @printWLine(i32* %2), !dbg !114
  %3 = load i32*, i32** %data.addr, align 8, !dbg !115
  %4 = bitcast i32* %3 to i8*, !dbg !115
  call void @free(i8* %4) #6, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 36, type: !4)
!21 = !DILocation(line: 36, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 38, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 38, column: 12, scope: !16)
!27 = !DILocation(line: 39, column: 23, scope: !16)
!28 = !DILocation(line: 39, column: 12, scope: !16)
!29 = !DILocation(line: 39, column: 10, scope: !16)
!30 = !DILocation(line: 40, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 9)
!32 = !DILocation(line: 40, column: 14, scope: !31)
!33 = !DILocation(line: 40, column: 9, scope: !16)
!34 = !DILocation(line: 40, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 40, column: 23)
!36 = !DILocation(line: 42, column: 13, scope: !16)
!37 = !DILocation(line: 42, column: 5, scope: !16)
!38 = !DILocation(line: 43, column: 5, scope: !16)
!39 = !DILocation(line: 43, column: 17, scope: !16)
!40 = !DILocation(line: 45, column: 5, scope: !16)
!41 = !DILocation(line: 45, column: 13, scope: !16)
!42 = !DILocation(line: 46, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !17, line: 23, type: !4)
!45 = !DILocation(line: 23, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 26, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !17, line: 25, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 26, column: 17, scope: !47)
!52 = !DILocation(line: 28, column: 16, scope: !47)
!53 = !DILocation(line: 28, column: 22, scope: !47)
!54 = !DILocation(line: 28, column: 9, scope: !47)
!55 = !DILocation(line: 29, column: 20, scope: !47)
!56 = !DILocation(line: 29, column: 9, scope: !47)
!57 = !DILocation(line: 30, column: 14, scope: !47)
!58 = !DILocation(line: 30, column: 9, scope: !47)
!59 = !DILocation(line: 32, column: 1, scope: !43)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_44_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 78, column: 5, scope: !60)
!62 = !DILocation(line: 79, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 90, type: !64, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 90, type: !7)
!70 = !DILocation(line: 90, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 90, type: !66)
!72 = !DILocation(line: 90, column: 27, scope: !63)
!73 = !DILocation(line: 93, column: 22, scope: !63)
!74 = !DILocation(line: 93, column: 12, scope: !63)
!75 = !DILocation(line: 93, column: 5, scope: !63)
!76 = !DILocation(line: 95, column: 5, scope: !63)
!77 = !DILocation(line: 96, column: 5, scope: !63)
!78 = !DILocation(line: 97, column: 5, scope: !63)
!79 = !DILocation(line: 100, column: 5, scope: !63)
!80 = !DILocation(line: 101, column: 5, scope: !63)
!81 = !DILocation(line: 102, column: 5, scope: !63)
!82 = !DILocation(line: 104, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 66, type: !4)
!85 = !DILocation(line: 66, column: 15, scope: !83)
!86 = !DILocalVariable(name: "funcPtr", scope: !83, file: !17, line: 67, type: !23)
!87 = !DILocation(line: 67, column: 12, scope: !83)
!88 = !DILocation(line: 68, column: 23, scope: !83)
!89 = !DILocation(line: 68, column: 12, scope: !83)
!90 = !DILocation(line: 68, column: 10, scope: !83)
!91 = !DILocation(line: 69, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !83, file: !17, line: 69, column: 9)
!93 = !DILocation(line: 69, column: 14, scope: !92)
!94 = !DILocation(line: 69, column: 9, scope: !83)
!95 = !DILocation(line: 69, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 69, column: 23)
!97 = !DILocation(line: 71, column: 13, scope: !83)
!98 = !DILocation(line: 71, column: 5, scope: !83)
!99 = !DILocation(line: 72, column: 5, scope: !83)
!100 = !DILocation(line: 72, column: 16, scope: !83)
!101 = !DILocation(line: 73, column: 5, scope: !83)
!102 = !DILocation(line: 73, column: 13, scope: !83)
!103 = !DILocation(line: 74, column: 1, scope: !83)
!104 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 53, type: !24, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", arg: 1, scope: !104, file: !17, line: 53, type: !4)
!106 = !DILocation(line: 53, column: 35, scope: !104)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !17, line: 56, type: !48)
!108 = distinct !DILexicalBlock(scope: !104, file: !17, line: 55, column: 5)
!109 = !DILocation(line: 56, column: 17, scope: !108)
!110 = !DILocation(line: 58, column: 16, scope: !108)
!111 = !DILocation(line: 58, column: 22, scope: !108)
!112 = !DILocation(line: 58, column: 9, scope: !108)
!113 = !DILocation(line: 59, column: 20, scope: !108)
!114 = !DILocation(line: 59, column: 9, scope: !108)
!115 = !DILocation(line: 60, column: 14, scope: !108)
!116 = !DILocation(line: 60, column: 9, scope: !108)
!117 = !DILocation(line: 62, column: 1, scope: !104)
