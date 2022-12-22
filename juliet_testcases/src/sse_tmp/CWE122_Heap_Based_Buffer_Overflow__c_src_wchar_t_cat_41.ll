; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !27
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !28
  %1 = load i32*, i32** %data.addr, align 8, !dbg !29
  %call = call i32* @wcscat(i32* %arraydecay, i32* %1) #6, !dbg !30
  %2 = load i32*, i32** %data.addr, align 8, !dbg !31
  call void @printWLine(i32* %2), !dbg !32
  %3 = load i32*, i32** %data.addr, align 8, !dbg !33
  %4 = bitcast i32* %3 to i8*, !dbg !33
  call void @free(i8* %4) #6, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !41
  %0 = bitcast i8* %call to i32*, !dbg !42
  store i32* %0, i32** %data, align 8, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %cmp = icmp eq i32* %1, null, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !50
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !51
  %3 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !52
  store i32 0, i32* %arrayidx, align 4, !dbg !53
  %4 = load i32*, i32** %data, align 8, !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_badSink(i32* %4), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_goodG2BSink(i32* %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !60, metadata !DIExpression()), !dbg !62
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !62
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !63
  %1 = load i32*, i32** %data.addr, align 8, !dbg !64
  %call = call i32* @wcscat(i32* %arraydecay, i32* %1) #6, !dbg !65
  %2 = load i32*, i32** %data.addr, align 8, !dbg !66
  call void @printWLine(i32* %2), !dbg !67
  %3 = load i32*, i32** %data.addr, align 8, !dbg !68
  %4 = bitcast i32* %3 to i8*, !dbg !68
  call void @free(i8* %4) #6, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #6, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #6, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !97
  %0 = bitcast i8* %call to i32*, !dbg !98
  store i32* %0, i32** %data, align 8, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %cmp = icmp eq i32* %1, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !107
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %4 = load i32*, i32** %data, align 8, !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_goodG2BSink(i32* %4), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 80, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocation(line: 28, column: 16, scope: !23)
!29 = !DILocation(line: 28, column: 22, scope: !23)
!30 = !DILocation(line: 28, column: 9, scope: !23)
!31 = !DILocation(line: 29, column: 20, scope: !23)
!32 = !DILocation(line: 29, column: 9, scope: !23)
!33 = !DILocation(line: 30, column: 14, scope: !23)
!34 = !DILocation(line: 30, column: 9, scope: !23)
!35 = !DILocation(line: 32, column: 1, scope: !16)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_bad", scope: !17, file: !17, line: 34, type: !37, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !17, line: 36, type: !4)
!40 = !DILocation(line: 36, column: 15, scope: !36)
!41 = !DILocation(line: 37, column: 23, scope: !36)
!42 = !DILocation(line: 37, column: 12, scope: !36)
!43 = !DILocation(line: 37, column: 10, scope: !36)
!44 = !DILocation(line: 38, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !17, line: 38, column: 9)
!46 = !DILocation(line: 38, column: 14, scope: !45)
!47 = !DILocation(line: 38, column: 9, scope: !36)
!48 = !DILocation(line: 38, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !17, line: 38, column: 23)
!50 = !DILocation(line: 40, column: 13, scope: !36)
!51 = !DILocation(line: 40, column: 5, scope: !36)
!52 = !DILocation(line: 41, column: 5, scope: !36)
!53 = !DILocation(line: 41, column: 17, scope: !36)
!54 = !DILocation(line: 42, column: 69, scope: !36)
!55 = !DILocation(line: 42, column: 5, scope: !36)
!56 = !DILocation(line: 43, column: 1, scope: !36)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_goodG2BSink", scope: !17, file: !17, line: 49, type: !18, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !17, line: 49, type: !4)
!59 = !DILocation(line: 49, column: 84, scope: !57)
!60 = !DILocalVariable(name: "dest", scope: !61, file: !17, line: 52, type: !24)
!61 = distinct !DILexicalBlock(scope: !57, file: !17, line: 51, column: 5)
!62 = !DILocation(line: 52, column: 17, scope: !61)
!63 = !DILocation(line: 54, column: 16, scope: !61)
!64 = !DILocation(line: 54, column: 22, scope: !61)
!65 = !DILocation(line: 54, column: 9, scope: !61)
!66 = !DILocation(line: 55, column: 20, scope: !61)
!67 = !DILocation(line: 55, column: 9, scope: !61)
!68 = !DILocation(line: 56, column: 14, scope: !61)
!69 = !DILocation(line: 56, column: 9, scope: !61)
!70 = !DILocation(line: 58, column: 1, scope: !57)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_41_good", scope: !17, file: !17, line: 72, type: !37, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 74, column: 5, scope: !71)
!73 = !DILocation(line: 75, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 87, type: !75, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !17, line: 87, type: !7)
!81 = !DILocation(line: 87, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !17, line: 87, type: !77)
!83 = !DILocation(line: 87, column: 27, scope: !74)
!84 = !DILocation(line: 90, column: 22, scope: !74)
!85 = !DILocation(line: 90, column: 12, scope: !74)
!86 = !DILocation(line: 90, column: 5, scope: !74)
!87 = !DILocation(line: 92, column: 5, scope: !74)
!88 = !DILocation(line: 93, column: 5, scope: !74)
!89 = !DILocation(line: 94, column: 5, scope: !74)
!90 = !DILocation(line: 97, column: 5, scope: !74)
!91 = !DILocation(line: 98, column: 5, scope: !74)
!92 = !DILocation(line: 99, column: 5, scope: !74)
!93 = !DILocation(line: 101, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !37, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !17, line: 63, type: !4)
!96 = !DILocation(line: 63, column: 15, scope: !94)
!97 = !DILocation(line: 64, column: 23, scope: !94)
!98 = !DILocation(line: 64, column: 12, scope: !94)
!99 = !DILocation(line: 64, column: 10, scope: !94)
!100 = !DILocation(line: 65, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !17, line: 65, column: 9)
!102 = !DILocation(line: 65, column: 14, scope: !101)
!103 = !DILocation(line: 65, column: 9, scope: !94)
!104 = !DILocation(line: 65, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !17, line: 65, column: 23)
!106 = !DILocation(line: 67, column: 13, scope: !94)
!107 = !DILocation(line: 67, column: 5, scope: !94)
!108 = !DILocation(line: 68, column: 5, scope: !94)
!109 = !DILocation(line: 68, column: 16, scope: !94)
!110 = !DILocation(line: 69, column: 73, scope: !94)
!111 = !DILocation(line: 69, column: 5, scope: !94)
!112 = !DILocation(line: 70, column: 1, scope: !94)
