; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
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
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %3 = load i32*, i32** %2, align 8, !dbg !40
  store i32* %3, i32** %data1, align 8, !dbg !38
  %4 = load i32*, i32** %data1, align 8, !dbg !41
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !42
  %5 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %6 = load i32*, i32** %data1, align 8, !dbg !45
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %6, i32** %7, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !48, metadata !DIExpression()), !dbg !50
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %9 = load i32*, i32** %8, align 8, !dbg !52
  store i32* %9, i32** %data3, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !58
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !58
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !59
  %11 = load i32*, i32** %data3, align 8, !dbg !60
  %call4 = call i32* @wcscat(i32* %arraydecay, i32* %11) #6, !dbg !61
  %12 = load i32*, i32** %data3, align 8, !dbg !62
  call void @printWLine(i32* %12), !dbg !63
  %13 = load i32*, i32** %data3, align 8, !dbg !64
  %14 = bitcast i32* %13 to i8*, !dbg !64
  call void @free(i8* %14) #6, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !96
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
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  %3 = load i32*, i32** %2, align 8, !dbg !110
  store i32* %3, i32** %data1, align 8, !dbg !108
  %4 = load i32*, i32** %data1, align 8, !dbg !111
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !112
  %5 = load i32*, i32** %data1, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %6 = load i32*, i32** %data1, align 8, !dbg !115
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !116
  store i32* %6, i32** %7, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !118, metadata !DIExpression()), !dbg !120
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !121
  %9 = load i32*, i32** %8, align 8, !dbg !122
  store i32* %9, i32** %data3, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !125
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !126
  %11 = load i32*, i32** %data3, align 8, !dbg !127
  %call4 = call i32* @wcscat(i32* %arraydecay, i32* %11) #6, !dbg !128
  %12 = load i32*, i32** %data3, align 8, !dbg !129
  call void @printWLine(i32* %12), !dbg !130
  %13 = load i32*, i32** %data3, align 8, !dbg !131
  %14 = bitcast i32* %13 to i8*, !dbg !131
  call void @free(i8* %14) #6, !dbg !132
  ret void, !dbg !133
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 23, scope: !16)
!28 = !DILocation(line: 28, column: 12, scope: !16)
!29 = !DILocation(line: 28, column: 10, scope: !16)
!30 = !DILocation(line: 29, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!32 = !DILocation(line: 29, column: 14, scope: !31)
!33 = !DILocation(line: 29, column: 9, scope: !16)
!34 = !DILocation(line: 29, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 29, column: 23)
!36 = !DILocalVariable(name: "data", scope: !37, file: !17, line: 31, type: !4)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!38 = !DILocation(line: 31, column: 19, scope: !37)
!39 = !DILocation(line: 31, column: 27, scope: !37)
!40 = !DILocation(line: 31, column: 26, scope: !37)
!41 = !DILocation(line: 33, column: 17, scope: !37)
!42 = !DILocation(line: 33, column: 9, scope: !37)
!43 = !DILocation(line: 34, column: 9, scope: !37)
!44 = !DILocation(line: 34, column: 21, scope: !37)
!45 = !DILocation(line: 35, column: 21, scope: !37)
!46 = !DILocation(line: 35, column: 10, scope: !37)
!47 = !DILocation(line: 35, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !17, line: 38, type: !4)
!49 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!50 = !DILocation(line: 38, column: 19, scope: !49)
!51 = !DILocation(line: 38, column: 27, scope: !49)
!52 = !DILocation(line: 38, column: 26, scope: !49)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !17, line: 40, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !17, line: 39, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 50)
!58 = !DILocation(line: 40, column: 21, scope: !54)
!59 = !DILocation(line: 42, column: 20, scope: !54)
!60 = !DILocation(line: 42, column: 26, scope: !54)
!61 = !DILocation(line: 42, column: 13, scope: !54)
!62 = !DILocation(line: 43, column: 24, scope: !54)
!63 = !DILocation(line: 43, column: 13, scope: !54)
!64 = !DILocation(line: 44, column: 18, scope: !54)
!65 = !DILocation(line: 44, column: 13, scope: !54)
!66 = !DILocation(line: 47, column: 1, scope: !16)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_32_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 82, column: 5, scope: !67)
!69 = !DILocation(line: 83, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 94, type: !71, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 94, type: !7)
!77 = !DILocation(line: 94, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 94, type: !73)
!79 = !DILocation(line: 94, column: 27, scope: !70)
!80 = !DILocation(line: 97, column: 22, scope: !70)
!81 = !DILocation(line: 97, column: 12, scope: !70)
!82 = !DILocation(line: 97, column: 5, scope: !70)
!83 = !DILocation(line: 99, column: 5, scope: !70)
!84 = !DILocation(line: 100, column: 5, scope: !70)
!85 = !DILocation(line: 101, column: 5, scope: !70)
!86 = !DILocation(line: 104, column: 5, scope: !70)
!87 = !DILocation(line: 105, column: 5, scope: !70)
!88 = !DILocation(line: 106, column: 5, scope: !70)
!89 = !DILocation(line: 108, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 56, type: !4)
!92 = !DILocation(line: 56, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataPtr1", scope: !90, file: !17, line: 57, type: !23)
!94 = !DILocation(line: 57, column: 16, scope: !90)
!95 = !DILocalVariable(name: "dataPtr2", scope: !90, file: !17, line: 58, type: !23)
!96 = !DILocation(line: 58, column: 16, scope: !90)
!97 = !DILocation(line: 59, column: 23, scope: !90)
!98 = !DILocation(line: 59, column: 12, scope: !90)
!99 = !DILocation(line: 59, column: 10, scope: !90)
!100 = !DILocation(line: 60, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !90, file: !17, line: 60, column: 9)
!102 = !DILocation(line: 60, column: 14, scope: !101)
!103 = !DILocation(line: 60, column: 9, scope: !90)
!104 = !DILocation(line: 60, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !17, line: 60, column: 23)
!106 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 62, type: !4)
!107 = distinct !DILexicalBlock(scope: !90, file: !17, line: 61, column: 5)
!108 = !DILocation(line: 62, column: 19, scope: !107)
!109 = !DILocation(line: 62, column: 27, scope: !107)
!110 = !DILocation(line: 62, column: 26, scope: !107)
!111 = !DILocation(line: 64, column: 17, scope: !107)
!112 = !DILocation(line: 64, column: 9, scope: !107)
!113 = !DILocation(line: 65, column: 9, scope: !107)
!114 = !DILocation(line: 65, column: 20, scope: !107)
!115 = !DILocation(line: 66, column: 21, scope: !107)
!116 = !DILocation(line: 66, column: 10, scope: !107)
!117 = !DILocation(line: 66, column: 19, scope: !107)
!118 = !DILocalVariable(name: "data", scope: !119, file: !17, line: 69, type: !4)
!119 = distinct !DILexicalBlock(scope: !90, file: !17, line: 68, column: 5)
!120 = !DILocation(line: 69, column: 19, scope: !119)
!121 = !DILocation(line: 69, column: 27, scope: !119)
!122 = !DILocation(line: 69, column: 26, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !17, line: 71, type: !55)
!124 = distinct !DILexicalBlock(scope: !119, file: !17, line: 70, column: 9)
!125 = !DILocation(line: 71, column: 21, scope: !124)
!126 = !DILocation(line: 73, column: 20, scope: !124)
!127 = !DILocation(line: 73, column: 26, scope: !124)
!128 = !DILocation(line: 73, column: 13, scope: !124)
!129 = !DILocation(line: 74, column: 24, scope: !124)
!130 = !DILocation(line: 74, column: 13, scope: !124)
!131 = !DILocation(line: 75, column: 18, scope: !124)
!132 = !DILocation(line: 75, column: 13, scope: !124)
!133 = !DILocation(line: 78, column: 1, scope: !90)
