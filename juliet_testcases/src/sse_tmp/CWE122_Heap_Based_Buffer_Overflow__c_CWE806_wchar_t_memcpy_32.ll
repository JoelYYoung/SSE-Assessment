; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_bad() #0 !dbg !16 {
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
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %3 = load i32*, i32** %2, align 8, !dbg !40
  store i32* %3, i32** %data1, align 8, !dbg !38
  %4 = load i32*, i32** %data1, align 8, !dbg !41
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #8, !dbg !42
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
  %11 = bitcast i32* %arraydecay to i8*, !dbg !59
  %12 = load i32*, i32** %data3, align 8, !dbg !60
  %13 = bitcast i32* %12 to i8*, !dbg !59
  %14 = load i32*, i32** %data3, align 8, !dbg !61
  %call4 = call i64 @wcslen(i32* %14) #10, !dbg !62
  %mul = mul i64 %call4, 4, !dbg !63
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !59
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !64
  store i32 0, i32* %arrayidx5, align 4, !dbg !65
  %15 = load i32*, i32** %data3, align 8, !dbg !66
  call void @printWLine(i32* %15), !dbg !67
  %16 = load i32*, i32** %data3, align 8, !dbg !68
  %17 = bitcast i32* %16 to i8*, !dbg !68
  call void @free(i8* %17) #8, !dbg !69
  ret void, !dbg !70
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_good() #0 !dbg !71 {
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
  %call = call i64 @time(i64* null) #8, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #8, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !97, metadata !DIExpression()), !dbg !98
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !99, metadata !DIExpression()), !dbg !100
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !110, metadata !DIExpression()), !dbg !112
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !113
  %3 = load i32*, i32** %2, align 8, !dbg !114
  store i32* %3, i32** %data1, align 8, !dbg !112
  %4 = load i32*, i32** %data1, align 8, !dbg !115
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #8, !dbg !116
  %5 = load i32*, i32** %data1, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %6 = load i32*, i32** %data1, align 8, !dbg !119
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !120
  store i32* %6, i32** %7, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !122, metadata !DIExpression()), !dbg !124
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !125
  %9 = load i32*, i32** %8, align 8, !dbg !126
  store i32* %9, i32** %data3, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !130
  %11 = bitcast i32* %arraydecay to i8*, !dbg !130
  %12 = load i32*, i32** %data3, align 8, !dbg !131
  %13 = bitcast i32* %12 to i8*, !dbg !130
  %14 = load i32*, i32** %data3, align 8, !dbg !132
  %call4 = call i64 @wcslen(i32* %14) #10, !dbg !133
  %mul = mul i64 %call4, 4, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !130
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !135
  store i32 0, i32* %arrayidx5, align 4, !dbg !136
  %15 = load i32*, i32** %data3, align 8, !dbg !137
  call void @printWLine(i32* %15), !dbg !138
  %16 = load i32*, i32** %data3, align 8, !dbg !139
  %17 = bitcast i32* %16 to i8*, !dbg !139
  call void @free(i8* %17) #8, !dbg !140
  ret void, !dbg !141
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!59 = !DILocation(line: 42, column: 13, scope: !54)
!60 = !DILocation(line: 42, column: 26, scope: !54)
!61 = !DILocation(line: 42, column: 39, scope: !54)
!62 = !DILocation(line: 42, column: 32, scope: !54)
!63 = !DILocation(line: 42, column: 44, scope: !54)
!64 = !DILocation(line: 43, column: 13, scope: !54)
!65 = !DILocation(line: 43, column: 24, scope: !54)
!66 = !DILocation(line: 44, column: 24, scope: !54)
!67 = !DILocation(line: 44, column: 13, scope: !54)
!68 = !DILocation(line: 45, column: 18, scope: !54)
!69 = !DILocation(line: 45, column: 13, scope: !54)
!70 = !DILocation(line: 48, column: 1, scope: !16)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_good", scope: !17, file: !17, line: 82, type: !18, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 84, column: 5, scope: !71)
!73 = !DILocation(line: 85, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 96, type: !75, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !17, line: 96, type: !7)
!81 = !DILocation(line: 96, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !17, line: 96, type: !77)
!83 = !DILocation(line: 96, column: 27, scope: !74)
!84 = !DILocation(line: 99, column: 22, scope: !74)
!85 = !DILocation(line: 99, column: 12, scope: !74)
!86 = !DILocation(line: 99, column: 5, scope: !74)
!87 = !DILocation(line: 101, column: 5, scope: !74)
!88 = !DILocation(line: 102, column: 5, scope: !74)
!89 = !DILocation(line: 103, column: 5, scope: !74)
!90 = !DILocation(line: 106, column: 5, scope: !74)
!91 = !DILocation(line: 107, column: 5, scope: !74)
!92 = !DILocation(line: 108, column: 5, scope: !74)
!93 = !DILocation(line: 110, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !17, line: 57, type: !4)
!96 = !DILocation(line: 57, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataPtr1", scope: !94, file: !17, line: 58, type: !23)
!98 = !DILocation(line: 58, column: 16, scope: !94)
!99 = !DILocalVariable(name: "dataPtr2", scope: !94, file: !17, line: 59, type: !23)
!100 = !DILocation(line: 59, column: 16, scope: !94)
!101 = !DILocation(line: 60, column: 23, scope: !94)
!102 = !DILocation(line: 60, column: 12, scope: !94)
!103 = !DILocation(line: 60, column: 10, scope: !94)
!104 = !DILocation(line: 61, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !94, file: !17, line: 61, column: 9)
!106 = !DILocation(line: 61, column: 14, scope: !105)
!107 = !DILocation(line: 61, column: 9, scope: !94)
!108 = !DILocation(line: 61, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 61, column: 23)
!110 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 63, type: !4)
!111 = distinct !DILexicalBlock(scope: !94, file: !17, line: 62, column: 5)
!112 = !DILocation(line: 63, column: 19, scope: !111)
!113 = !DILocation(line: 63, column: 27, scope: !111)
!114 = !DILocation(line: 63, column: 26, scope: !111)
!115 = !DILocation(line: 65, column: 17, scope: !111)
!116 = !DILocation(line: 65, column: 9, scope: !111)
!117 = !DILocation(line: 66, column: 9, scope: !111)
!118 = !DILocation(line: 66, column: 20, scope: !111)
!119 = !DILocation(line: 67, column: 21, scope: !111)
!120 = !DILocation(line: 67, column: 10, scope: !111)
!121 = !DILocation(line: 67, column: 19, scope: !111)
!122 = !DILocalVariable(name: "data", scope: !123, file: !17, line: 70, type: !4)
!123 = distinct !DILexicalBlock(scope: !94, file: !17, line: 69, column: 5)
!124 = !DILocation(line: 70, column: 19, scope: !123)
!125 = !DILocation(line: 70, column: 27, scope: !123)
!126 = !DILocation(line: 70, column: 26, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !17, line: 72, type: !55)
!128 = distinct !DILexicalBlock(scope: !123, file: !17, line: 71, column: 9)
!129 = !DILocation(line: 72, column: 21, scope: !128)
!130 = !DILocation(line: 74, column: 13, scope: !128)
!131 = !DILocation(line: 74, column: 26, scope: !128)
!132 = !DILocation(line: 74, column: 39, scope: !128)
!133 = !DILocation(line: 74, column: 32, scope: !128)
!134 = !DILocation(line: 74, column: 44, scope: !128)
!135 = !DILocation(line: 75, column: 13, scope: !128)
!136 = !DILocation(line: 75, column: 24, scope: !128)
!137 = !DILocation(line: 76, column: 24, scope: !128)
!138 = !DILocation(line: 76, column: 13, scope: !128)
!139 = !DILocation(line: 77, column: 18, scope: !128)
!140 = !DILocation(line: 77, column: 13, scope: !128)
!141 = !DILocation(line: 80, column: 1, scope: !94)
