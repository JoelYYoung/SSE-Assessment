; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32_bad() #0 !dbg !16 {
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
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %3 = load i32*, i32** %2, align 8, !dbg !40
  store i32* %3, i32** %data1, align 8, !dbg !38
  %4 = load i32*, i32** %data1, align 8, !dbg !41
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #7, !dbg !42
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
  %call4 = call i64 @wcslen(i32* %11) #9, !dbg !61
  %12 = load i32*, i32** %data3, align 8, !dbg !62
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %12) #7, !dbg !63
  %13 = load i32*, i32** %data3, align 8, !dbg !64
  call void @printWLine(i32* %13), !dbg !65
  %14 = load i32*, i32** %data3, align 8, !dbg !66
  %15 = bitcast i32* %14 to i8*, !dbg !66
  call void @free(i8* %15) #7, !dbg !67
  ret void, !dbg !68
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
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !97, metadata !DIExpression()), !dbg !98
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !99
  %0 = bitcast i8* %call to i32*, !dbg !100
  store i32* %0, i32** %data, align 8, !dbg !101
  %1 = load i32*, i32** %data, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !111
  %3 = load i32*, i32** %2, align 8, !dbg !112
  store i32* %3, i32** %data1, align 8, !dbg !110
  %4 = load i32*, i32** %data1, align 8, !dbg !113
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !114
  %5 = load i32*, i32** %data1, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %6 = load i32*, i32** %data1, align 8, !dbg !117
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !118
  store i32* %6, i32** %7, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !120, metadata !DIExpression()), !dbg !122
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !123
  %9 = load i32*, i32** %8, align 8, !dbg !124
  store i32* %9, i32** %data3, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !128
  %11 = load i32*, i32** %data3, align 8, !dbg !129
  %call4 = call i64 @wcslen(i32* %11) #9, !dbg !130
  %12 = load i32*, i32** %data3, align 8, !dbg !131
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %12) #7, !dbg !132
  %13 = load i32*, i32** %data3, align 8, !dbg !133
  call void @printWLine(i32* %13), !dbg !134
  %14 = load i32*, i32** %data3, align 8, !dbg !135
  %15 = bitcast i32* %14 to i8*, !dbg !135
  call void @free(i8* %15) #7, !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 32, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 33, type: !23)
!26 = !DILocation(line: 33, column: 16, scope: !16)
!27 = !DILocation(line: 34, column: 23, scope: !16)
!28 = !DILocation(line: 34, column: 12, scope: !16)
!29 = !DILocation(line: 34, column: 10, scope: !16)
!30 = !DILocation(line: 35, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 9)
!32 = !DILocation(line: 35, column: 14, scope: !31)
!33 = !DILocation(line: 35, column: 9, scope: !16)
!34 = !DILocation(line: 35, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 35, column: 23)
!36 = !DILocalVariable(name: "data", scope: !37, file: !17, line: 37, type: !4)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 5)
!38 = !DILocation(line: 37, column: 19, scope: !37)
!39 = !DILocation(line: 37, column: 27, scope: !37)
!40 = !DILocation(line: 37, column: 26, scope: !37)
!41 = !DILocation(line: 39, column: 17, scope: !37)
!42 = !DILocation(line: 39, column: 9, scope: !37)
!43 = !DILocation(line: 40, column: 9, scope: !37)
!44 = !DILocation(line: 40, column: 21, scope: !37)
!45 = !DILocation(line: 41, column: 21, scope: !37)
!46 = !DILocation(line: 41, column: 10, scope: !37)
!47 = !DILocation(line: 41, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !17, line: 44, type: !4)
!49 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!50 = !DILocation(line: 44, column: 19, scope: !49)
!51 = !DILocation(line: 44, column: 27, scope: !49)
!52 = !DILocation(line: 44, column: 26, scope: !49)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !17, line: 46, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !17, line: 45, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 50)
!58 = !DILocation(line: 46, column: 21, scope: !54)
!59 = !DILocation(line: 48, column: 22, scope: !54)
!60 = !DILocation(line: 48, column: 35, scope: !54)
!61 = !DILocation(line: 48, column: 28, scope: !54)
!62 = !DILocation(line: 48, column: 49, scope: !54)
!63 = !DILocation(line: 48, column: 13, scope: !54)
!64 = !DILocation(line: 49, column: 24, scope: !54)
!65 = !DILocation(line: 49, column: 13, scope: !54)
!66 = !DILocation(line: 50, column: 18, scope: !54)
!67 = !DILocation(line: 50, column: 13, scope: !54)
!68 = !DILocation(line: 53, column: 1, scope: !16)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_32_good", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 88, column: 5, scope: !69)
!71 = !DILocation(line: 89, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 100, type: !73, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!7, !7, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !17, line: 100, type: !7)
!79 = !DILocation(line: 100, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !17, line: 100, type: !75)
!81 = !DILocation(line: 100, column: 27, scope: !72)
!82 = !DILocation(line: 103, column: 22, scope: !72)
!83 = !DILocation(line: 103, column: 12, scope: !72)
!84 = !DILocation(line: 103, column: 5, scope: !72)
!85 = !DILocation(line: 105, column: 5, scope: !72)
!86 = !DILocation(line: 106, column: 5, scope: !72)
!87 = !DILocation(line: 107, column: 5, scope: !72)
!88 = !DILocation(line: 110, column: 5, scope: !72)
!89 = !DILocation(line: 111, column: 5, scope: !72)
!90 = !DILocation(line: 112, column: 5, scope: !72)
!91 = !DILocation(line: 114, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !17, line: 62, type: !4)
!94 = !DILocation(line: 62, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataPtr1", scope: !92, file: !17, line: 63, type: !23)
!96 = !DILocation(line: 63, column: 16, scope: !92)
!97 = !DILocalVariable(name: "dataPtr2", scope: !92, file: !17, line: 64, type: !23)
!98 = !DILocation(line: 64, column: 16, scope: !92)
!99 = !DILocation(line: 65, column: 23, scope: !92)
!100 = !DILocation(line: 65, column: 12, scope: !92)
!101 = !DILocation(line: 65, column: 10, scope: !92)
!102 = !DILocation(line: 66, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !92, file: !17, line: 66, column: 9)
!104 = !DILocation(line: 66, column: 14, scope: !103)
!105 = !DILocation(line: 66, column: 9, scope: !92)
!106 = !DILocation(line: 66, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !17, line: 66, column: 23)
!108 = !DILocalVariable(name: "data", scope: !109, file: !17, line: 68, type: !4)
!109 = distinct !DILexicalBlock(scope: !92, file: !17, line: 67, column: 5)
!110 = !DILocation(line: 68, column: 19, scope: !109)
!111 = !DILocation(line: 68, column: 27, scope: !109)
!112 = !DILocation(line: 68, column: 26, scope: !109)
!113 = !DILocation(line: 70, column: 17, scope: !109)
!114 = !DILocation(line: 70, column: 9, scope: !109)
!115 = !DILocation(line: 71, column: 9, scope: !109)
!116 = !DILocation(line: 71, column: 20, scope: !109)
!117 = !DILocation(line: 72, column: 21, scope: !109)
!118 = !DILocation(line: 72, column: 10, scope: !109)
!119 = !DILocation(line: 72, column: 19, scope: !109)
!120 = !DILocalVariable(name: "data", scope: !121, file: !17, line: 75, type: !4)
!121 = distinct !DILexicalBlock(scope: !92, file: !17, line: 74, column: 5)
!122 = !DILocation(line: 75, column: 19, scope: !121)
!123 = !DILocation(line: 75, column: 27, scope: !121)
!124 = !DILocation(line: 75, column: 26, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !17, line: 77, type: !55)
!126 = distinct !DILexicalBlock(scope: !121, file: !17, line: 76, column: 9)
!127 = !DILocation(line: 77, column: 21, scope: !126)
!128 = !DILocation(line: 79, column: 22, scope: !126)
!129 = !DILocation(line: 79, column: 35, scope: !126)
!130 = !DILocation(line: 79, column: 28, scope: !126)
!131 = !DILocation(line: 79, column: 49, scope: !126)
!132 = !DILocation(line: 79, column: 13, scope: !126)
!133 = !DILocation(line: 80, column: 24, scope: !126)
!134 = !DILocation(line: 80, column: 13, scope: !126)
!135 = !DILocation(line: 81, column: 18, scope: !126)
!136 = !DILocation(line: 81, column: 13, scope: !126)
!137 = !DILocation(line: 84, column: 1, scope: !92)
