; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %5 = load i32*, i32** %data1, align 8, !dbg !44
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  store i32* %5, i32** %6, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !50
  %8 = load i32*, i32** %7, align 8, !dbg !51
  store i32* %8, i32** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx4, align 4, !dbg !61
  %9 = load i32*, i32** %data2, align 8, !dbg !62
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !63
  %call6 = call i32* @wcsncpy(i32* %9, i32* %arraydecay5, i64 99) #5, !dbg !64
  %10 = load i32*, i32** %data2, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !65
  store i32 0, i32* %arrayidx7, align 4, !dbg !66
  %11 = load i32*, i32** %data2, align 8, !dbg !67
  call void @printWLine(i32* %11), !dbg !68
  %12 = load i32*, i32** %data2, align 8, !dbg !69
  %13 = bitcast i32* %12 to i8*, !dbg !69
  call void @free(i8* %13) #5, !dbg !70
  ret void, !dbg !71
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !98, metadata !DIExpression()), !dbg !99
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !100, metadata !DIExpression()), !dbg !101
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !103, metadata !DIExpression()), !dbg !105
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !106
  %1 = load i32*, i32** %0, align 8, !dbg !107
  store i32* %1, i32** %data1, align 8, !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !108
  %2 = bitcast i8* %call to i32*, !dbg !109
  store i32* %2, i32** %data1, align 8, !dbg !110
  %3 = load i32*, i32** %data1, align 8, !dbg !111
  %cmp = icmp eq i32* %3, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %5 = load i32*, i32** %data1, align 8, !dbg !119
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !120
  store i32* %5, i32** %6, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !122, metadata !DIExpression()), !dbg !124
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !125
  %8 = load i32*, i32** %7, align 8, !dbg !126
  store i32* %8, i32** %data2, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !131
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx4, align 4, !dbg !133
  %9 = load i32*, i32** %data2, align 8, !dbg !134
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call6 = call i32* @wcsncpy(i32* %9, i32* %arraydecay5, i64 99) #5, !dbg !136
  %10 = load i32*, i32** %data2, align 8, !dbg !137
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !137
  store i32 0, i32* %arrayidx7, align 4, !dbg !138
  %11 = load i32*, i32** %data2, align 8, !dbg !139
  call void @printWLine(i32* %11), !dbg !140
  %12 = load i32*, i32** %data2, align 8, !dbg !141
  %13 = bitcast i32* %12 to i8*, !dbg !141
  call void @free(i8* %13) #5, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 30, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocation(line: 32, column: 27, scope: !29)
!34 = !DILocation(line: 32, column: 16, scope: !29)
!35 = !DILocation(line: 32, column: 14, scope: !29)
!36 = !DILocation(line: 33, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !17, line: 33, column: 13)
!38 = !DILocation(line: 33, column: 18, scope: !37)
!39 = !DILocation(line: 33, column: 13, scope: !29)
!40 = !DILocation(line: 33, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 33, column: 27)
!42 = !DILocation(line: 34, column: 9, scope: !29)
!43 = !DILocation(line: 34, column: 17, scope: !29)
!44 = !DILocation(line: 35, column: 21, scope: !29)
!45 = !DILocation(line: 35, column: 10, scope: !29)
!46 = !DILocation(line: 35, column: 19, scope: !29)
!47 = !DILocalVariable(name: "data", scope: !48, file: !17, line: 38, type: !4)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 19, scope: !48)
!50 = !DILocation(line: 38, column: 27, scope: !48)
!51 = !DILocation(line: 38, column: 26, scope: !48)
!52 = !DILocalVariable(name: "source", scope: !53, file: !17, line: 40, type: !54)
!53 = distinct !DILexicalBlock(scope: !48, file: !17, line: 39, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 40, column: 21, scope: !53)
!58 = !DILocation(line: 41, column: 21, scope: !53)
!59 = !DILocation(line: 41, column: 13, scope: !53)
!60 = !DILocation(line: 42, column: 13, scope: !53)
!61 = !DILocation(line: 42, column: 27, scope: !53)
!62 = !DILocation(line: 44, column: 21, scope: !53)
!63 = !DILocation(line: 44, column: 27, scope: !53)
!64 = !DILocation(line: 44, column: 13, scope: !53)
!65 = !DILocation(line: 45, column: 13, scope: !53)
!66 = !DILocation(line: 45, column: 25, scope: !53)
!67 = !DILocation(line: 46, column: 24, scope: !53)
!68 = !DILocation(line: 46, column: 13, scope: !53)
!69 = !DILocation(line: 47, column: 18, scope: !53)
!70 = !DILocation(line: 47, column: 13, scope: !53)
!71 = !DILocation(line: 50, column: 1, scope: !16)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_good", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 88, column: 5, scope: !72)
!74 = !DILocation(line: 89, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 100, type: !76, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!7, !7, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !17, line: 100, type: !7)
!82 = !DILocation(line: 100, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !17, line: 100, type: !78)
!84 = !DILocation(line: 100, column: 27, scope: !75)
!85 = !DILocation(line: 103, column: 22, scope: !75)
!86 = !DILocation(line: 103, column: 12, scope: !75)
!87 = !DILocation(line: 103, column: 5, scope: !75)
!88 = !DILocation(line: 105, column: 5, scope: !75)
!89 = !DILocation(line: 106, column: 5, scope: !75)
!90 = !DILocation(line: 107, column: 5, scope: !75)
!91 = !DILocation(line: 110, column: 5, scope: !75)
!92 = !DILocation(line: 111, column: 5, scope: !75)
!93 = !DILocation(line: 112, column: 5, scope: !75)
!94 = !DILocation(line: 114, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !17, line: 59, type: !4)
!97 = !DILocation(line: 59, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataPtr1", scope: !95, file: !17, line: 60, type: !23)
!99 = !DILocation(line: 60, column: 16, scope: !95)
!100 = !DILocalVariable(name: "dataPtr2", scope: !95, file: !17, line: 61, type: !23)
!101 = !DILocation(line: 61, column: 16, scope: !95)
!102 = !DILocation(line: 62, column: 10, scope: !95)
!103 = !DILocalVariable(name: "data", scope: !104, file: !17, line: 64, type: !4)
!104 = distinct !DILexicalBlock(scope: !95, file: !17, line: 63, column: 5)
!105 = !DILocation(line: 64, column: 19, scope: !104)
!106 = !DILocation(line: 64, column: 27, scope: !104)
!107 = !DILocation(line: 64, column: 26, scope: !104)
!108 = !DILocation(line: 66, column: 27, scope: !104)
!109 = !DILocation(line: 66, column: 16, scope: !104)
!110 = !DILocation(line: 66, column: 14, scope: !104)
!111 = !DILocation(line: 67, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !17, line: 67, column: 13)
!113 = !DILocation(line: 67, column: 18, scope: !112)
!114 = !DILocation(line: 67, column: 13, scope: !104)
!115 = !DILocation(line: 67, column: 28, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !17, line: 67, column: 27)
!117 = !DILocation(line: 68, column: 9, scope: !104)
!118 = !DILocation(line: 68, column: 17, scope: !104)
!119 = !DILocation(line: 69, column: 21, scope: !104)
!120 = !DILocation(line: 69, column: 10, scope: !104)
!121 = !DILocation(line: 69, column: 19, scope: !104)
!122 = !DILocalVariable(name: "data", scope: !123, file: !17, line: 72, type: !4)
!123 = distinct !DILexicalBlock(scope: !95, file: !17, line: 71, column: 5)
!124 = !DILocation(line: 72, column: 19, scope: !123)
!125 = !DILocation(line: 72, column: 27, scope: !123)
!126 = !DILocation(line: 72, column: 26, scope: !123)
!127 = !DILocalVariable(name: "source", scope: !128, file: !17, line: 74, type: !54)
!128 = distinct !DILexicalBlock(scope: !123, file: !17, line: 73, column: 9)
!129 = !DILocation(line: 74, column: 21, scope: !128)
!130 = !DILocation(line: 75, column: 21, scope: !128)
!131 = !DILocation(line: 75, column: 13, scope: !128)
!132 = !DILocation(line: 76, column: 13, scope: !128)
!133 = !DILocation(line: 76, column: 27, scope: !128)
!134 = !DILocation(line: 78, column: 21, scope: !128)
!135 = !DILocation(line: 78, column: 27, scope: !128)
!136 = !DILocation(line: 78, column: 13, scope: !128)
!137 = !DILocation(line: 79, column: 13, scope: !128)
!138 = !DILocation(line: 79, column: 25, scope: !128)
!139 = !DILocation(line: 80, column: 24, scope: !128)
!140 = !DILocation(line: 80, column: 13, scope: !128)
!141 = !DILocation(line: 81, column: 18, scope: !128)
!142 = !DILocation(line: 81, column: 13, scope: !128)
!143 = !DILocation(line: 84, column: 1, scope: !95)
