; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end3, !dbg !26

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !27
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %data, align 8, !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %cmp1 = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !34

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end3, !dbg !39

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !47
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx5, align 4, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call7 = call i32* @wcsncpy(i32* %4, i32* %arraydecay6, i64 99) #5, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx8 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !53
  store i32 0, i32* %arrayidx8, align 4, !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %6), !dbg !56
  %7 = load i32*, i32** %data, align 8, !dbg !57
  %8 = bitcast i32* %7 to i8*, !dbg !57
  call void @free(i8* %8) #5, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end3, !dbg !94

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !95
  %1 = bitcast i8* %call to i32*, !dbg !97
  store i32* %1, i32** %data, align 8, !dbg !98
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %cmp1 = icmp eq i32* %2, null, !dbg !101
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !102

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !111
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx5, align 4, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call7 = call i32* @wcsncpy(i32* %4, i32* %arraydecay6, i64 99) #5, !dbg !116
  %5 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx8 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !117
  store i32 0, i32* %arrayidx8, align 4, !dbg !118
  %6 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %6), !dbg !120
  %7 = load i32*, i32** %data, align 8, !dbg !121
  %8 = bitcast i32* %7 to i8*, !dbg !121
  call void @free(i8* %8) #5, !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !124 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32* null, i32** %data, align 8, !dbg !127
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !128
  %cmp = icmp eq i32 %0, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.end3, !dbg !131

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !132
  %1 = bitcast i8* %call to i32*, !dbg !134
  store i32* %1, i32** %data, align 8, !dbg !135
  %2 = load i32*, i32** %data, align 8, !dbg !136
  %cmp1 = icmp eq i32* %2, null, !dbg !138
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !139

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !143
  br label %if.end3, !dbg !144

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !148
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !149
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx5, align 4, !dbg !151
  %4 = load i32*, i32** %data, align 8, !dbg !152
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !153
  %call7 = call i32* @wcsncpy(i32* %4, i32* %arraydecay6, i64 99) #5, !dbg !154
  %5 = load i32*, i32** %data, align 8, !dbg !155
  %arrayidx8 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !155
  store i32 0, i32* %arrayidx8, align 4, !dbg !156
  %6 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %6), !dbg !158
  %7 = load i32*, i32** %data, align 8, !dbg !159
  %8 = bitcast i32* %7 to i8*, !dbg !159
  call void @free(i8* %8) #5, !dbg !160
  ret void, !dbg !161
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 25, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocation(line: 30, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !28)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 9, scope: !28)
!38 = !DILocation(line: 32, column: 17, scope: !28)
!39 = !DILocation(line: 33, column: 5, scope: !28)
!40 = !DILocalVariable(name: "source", scope: !41, file: !17, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 35, column: 17, scope: !41)
!46 = !DILocation(line: 36, column: 17, scope: !41)
!47 = !DILocation(line: 36, column: 9, scope: !41)
!48 = !DILocation(line: 37, column: 9, scope: !41)
!49 = !DILocation(line: 37, column: 23, scope: !41)
!50 = !DILocation(line: 39, column: 17, scope: !41)
!51 = !DILocation(line: 39, column: 23, scope: !41)
!52 = !DILocation(line: 39, column: 9, scope: !41)
!53 = !DILocation(line: 40, column: 9, scope: !41)
!54 = !DILocation(line: 40, column: 21, scope: !41)
!55 = !DILocation(line: 41, column: 20, scope: !41)
!56 = !DILocation(line: 41, column: 9, scope: !41)
!57 = !DILocation(line: 42, column: 14, scope: !41)
!58 = !DILocation(line: 42, column: 9, scope: !41)
!59 = !DILocation(line: 44, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_13_good", scope: !17, file: !17, line: 103, type: !18, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 105, column: 5, scope: !60)
!62 = !DILocation(line: 106, column: 5, scope: !60)
!63 = !DILocation(line: 107, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 119, type: !65, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 119, type: !7)
!71 = !DILocation(line: 119, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 119, type: !67)
!73 = !DILocation(line: 119, column: 27, scope: !64)
!74 = !DILocation(line: 122, column: 22, scope: !64)
!75 = !DILocation(line: 122, column: 12, scope: !64)
!76 = !DILocation(line: 122, column: 5, scope: !64)
!77 = !DILocation(line: 124, column: 5, scope: !64)
!78 = !DILocation(line: 125, column: 5, scope: !64)
!79 = !DILocation(line: 126, column: 5, scope: !64)
!80 = !DILocation(line: 129, column: 5, scope: !64)
!81 = !DILocation(line: 130, column: 5, scope: !64)
!82 = !DILocation(line: 131, column: 5, scope: !64)
!83 = !DILocation(line: 133, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 53, type: !4)
!86 = !DILocation(line: 53, column: 15, scope: !84)
!87 = !DILocation(line: 54, column: 10, scope: !84)
!88 = !DILocation(line: 55, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !17, line: 55, column: 8)
!90 = !DILocation(line: 55, column: 25, scope: !89)
!91 = !DILocation(line: 55, column: 8, scope: !84)
!92 = !DILocation(line: 58, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 56, column: 5)
!94 = !DILocation(line: 59, column: 5, scope: !93)
!95 = !DILocation(line: 63, column: 27, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !17, line: 61, column: 5)
!97 = !DILocation(line: 63, column: 16, scope: !96)
!98 = !DILocation(line: 63, column: 14, scope: !96)
!99 = !DILocation(line: 64, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 64, column: 13)
!101 = !DILocation(line: 64, column: 18, scope: !100)
!102 = !DILocation(line: 64, column: 13, scope: !96)
!103 = !DILocation(line: 64, column: 28, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !17, line: 64, column: 27)
!105 = !DILocation(line: 65, column: 9, scope: !96)
!106 = !DILocation(line: 65, column: 17, scope: !96)
!107 = !DILocalVariable(name: "source", scope: !108, file: !17, line: 68, type: !42)
!108 = distinct !DILexicalBlock(scope: !84, file: !17, line: 67, column: 5)
!109 = !DILocation(line: 68, column: 17, scope: !108)
!110 = !DILocation(line: 69, column: 17, scope: !108)
!111 = !DILocation(line: 69, column: 9, scope: !108)
!112 = !DILocation(line: 70, column: 9, scope: !108)
!113 = !DILocation(line: 70, column: 23, scope: !108)
!114 = !DILocation(line: 72, column: 17, scope: !108)
!115 = !DILocation(line: 72, column: 23, scope: !108)
!116 = !DILocation(line: 72, column: 9, scope: !108)
!117 = !DILocation(line: 73, column: 9, scope: !108)
!118 = !DILocation(line: 73, column: 21, scope: !108)
!119 = !DILocation(line: 74, column: 20, scope: !108)
!120 = !DILocation(line: 74, column: 9, scope: !108)
!121 = !DILocation(line: 75, column: 14, scope: !108)
!122 = !DILocation(line: 75, column: 9, scope: !108)
!123 = !DILocation(line: 77, column: 1, scope: !84)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !17, line: 82, type: !4)
!126 = !DILocation(line: 82, column: 15, scope: !124)
!127 = !DILocation(line: 83, column: 10, scope: !124)
!128 = !DILocation(line: 84, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !17, line: 84, column: 8)
!130 = !DILocation(line: 84, column: 25, scope: !129)
!131 = !DILocation(line: 84, column: 8, scope: !124)
!132 = !DILocation(line: 87, column: 27, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 85, column: 5)
!134 = !DILocation(line: 87, column: 16, scope: !133)
!135 = !DILocation(line: 87, column: 14, scope: !133)
!136 = !DILocation(line: 88, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !17, line: 88, column: 13)
!138 = !DILocation(line: 88, column: 18, scope: !137)
!139 = !DILocation(line: 88, column: 13, scope: !133)
!140 = !DILocation(line: 88, column: 28, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !17, line: 88, column: 27)
!142 = !DILocation(line: 89, column: 9, scope: !133)
!143 = !DILocation(line: 89, column: 17, scope: !133)
!144 = !DILocation(line: 90, column: 5, scope: !133)
!145 = !DILocalVariable(name: "source", scope: !146, file: !17, line: 92, type: !42)
!146 = distinct !DILexicalBlock(scope: !124, file: !17, line: 91, column: 5)
!147 = !DILocation(line: 92, column: 17, scope: !146)
!148 = !DILocation(line: 93, column: 17, scope: !146)
!149 = !DILocation(line: 93, column: 9, scope: !146)
!150 = !DILocation(line: 94, column: 9, scope: !146)
!151 = !DILocation(line: 94, column: 23, scope: !146)
!152 = !DILocation(line: 96, column: 17, scope: !146)
!153 = !DILocation(line: 96, column: 23, scope: !146)
!154 = !DILocation(line: 96, column: 9, scope: !146)
!155 = !DILocation(line: 97, column: 9, scope: !146)
!156 = !DILocation(line: 97, column: 21, scope: !146)
!157 = !DILocation(line: 98, column: 20, scope: !146)
!158 = !DILocation(line: 98, column: 9, scope: !146)
!159 = !DILocation(line: 99, column: 14, scope: !146)
!160 = !DILocation(line: 99, column: 9, scope: !146)
!161 = !DILocation(line: 101, column: 1, scope: !124)
