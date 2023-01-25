; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @globalFive, align 4, !dbg !23
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
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %5), !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %7 = bitcast i32* %6 to i8*, !dbg !55
  call void @free(i8* %7) #5, !dbg !56
  ret void, !dbg !57
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
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %0 = load i32, i32* @globalFive, align 4, !dbg !86
  %cmp = icmp ne i32 %0, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  br label %if.end3, !dbg !92

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !93
  %1 = bitcast i8* %call to i32*, !dbg !95
  store i32* %1, i32** %data, align 8, !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %cmp1 = icmp eq i32* %2, null, !dbg !99
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !109
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx5, align 4, !dbg !111
  %4 = load i32*, i32** %data, align 8, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %5), !dbg !116
  %6 = load i32*, i32** %data, align 8, !dbg !117
  %7 = bitcast i32* %6 to i8*, !dbg !117
  call void @free(i8* %7) #5, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i32* null, i32** %data, align 8, !dbg !123
  %0 = load i32, i32* @globalFive, align 4, !dbg !124
  %cmp = icmp eq i32 %0, 5, !dbg !126
  br i1 %cmp, label %if.then, label %if.end3, !dbg !127

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !128
  %1 = bitcast i8* %call to i32*, !dbg !130
  store i32* %1, i32** %data, align 8, !dbg !131
  %2 = load i32*, i32** %data, align 8, !dbg !132
  %cmp1 = icmp eq i32* %2, null, !dbg !134
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !135

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end3, !dbg !140

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !145
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx5, align 4, !dbg !147
  %4 = load i32*, i32** %data, align 8, !dbg !148
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !150
  %5 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* %5), !dbg !152
  %6 = load i32*, i32** %data, align 8, !dbg !153
  %7 = bitcast i32* %6 to i8*, !dbg !153
  call void @free(i8* %7) #5, !dbg !154
  ret void, !dbg !155
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocation(line: 32, column: 10, scope: !16)
!23 = !DILocation(line: 33, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 8)
!25 = !DILocation(line: 33, column: 18, scope: !24)
!26 = !DILocation(line: 33, column: 8, scope: !16)
!27 = !DILocation(line: 36, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 34, column: 5)
!29 = !DILocation(line: 36, column: 16, scope: !28)
!30 = !DILocation(line: 36, column: 14, scope: !28)
!31 = !DILocation(line: 37, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 37, column: 13)
!33 = !DILocation(line: 37, column: 18, scope: !32)
!34 = !DILocation(line: 37, column: 13, scope: !28)
!35 = !DILocation(line: 37, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 37, column: 27)
!37 = !DILocation(line: 38, column: 9, scope: !28)
!38 = !DILocation(line: 38, column: 17, scope: !28)
!39 = !DILocation(line: 39, column: 5, scope: !28)
!40 = !DILocalVariable(name: "source", scope: !41, file: !17, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 41, column: 17, scope: !41)
!46 = !DILocation(line: 42, column: 17, scope: !41)
!47 = !DILocation(line: 42, column: 9, scope: !41)
!48 = !DILocation(line: 43, column: 9, scope: !41)
!49 = !DILocation(line: 43, column: 23, scope: !41)
!50 = !DILocation(line: 45, column: 18, scope: !41)
!51 = !DILocation(line: 45, column: 36, scope: !41)
!52 = !DILocation(line: 45, column: 9, scope: !41)
!53 = !DILocation(line: 46, column: 20, scope: !41)
!54 = !DILocation(line: 46, column: 9, scope: !41)
!55 = !DILocation(line: 47, column: 14, scope: !41)
!56 = !DILocation(line: 47, column: 9, scope: !41)
!57 = !DILocation(line: 49, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_14_good", scope: !17, file: !17, line: 106, type: !18, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 108, column: 5, scope: !58)
!60 = !DILocation(line: 109, column: 5, scope: !58)
!61 = !DILocation(line: 110, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 122, type: !63, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 122, type: !7)
!69 = !DILocation(line: 122, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 122, type: !65)
!71 = !DILocation(line: 122, column: 27, scope: !62)
!72 = !DILocation(line: 125, column: 22, scope: !62)
!73 = !DILocation(line: 125, column: 12, scope: !62)
!74 = !DILocation(line: 125, column: 5, scope: !62)
!75 = !DILocation(line: 127, column: 5, scope: !62)
!76 = !DILocation(line: 128, column: 5, scope: !62)
!77 = !DILocation(line: 129, column: 5, scope: !62)
!78 = !DILocation(line: 132, column: 5, scope: !62)
!79 = !DILocation(line: 133, column: 5, scope: !62)
!80 = !DILocation(line: 134, column: 5, scope: !62)
!81 = !DILocation(line: 136, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 58, type: !4)
!84 = !DILocation(line: 58, column: 15, scope: !82)
!85 = !DILocation(line: 59, column: 10, scope: !82)
!86 = !DILocation(line: 60, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !17, line: 60, column: 8)
!88 = !DILocation(line: 60, column: 18, scope: !87)
!89 = !DILocation(line: 60, column: 8, scope: !82)
!90 = !DILocation(line: 63, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !17, line: 61, column: 5)
!92 = !DILocation(line: 64, column: 5, scope: !91)
!93 = !DILocation(line: 68, column: 27, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !17, line: 66, column: 5)
!95 = !DILocation(line: 68, column: 16, scope: !94)
!96 = !DILocation(line: 68, column: 14, scope: !94)
!97 = !DILocation(line: 69, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !17, line: 69, column: 13)
!99 = !DILocation(line: 69, column: 18, scope: !98)
!100 = !DILocation(line: 69, column: 13, scope: !94)
!101 = !DILocation(line: 69, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 69, column: 27)
!103 = !DILocation(line: 70, column: 9, scope: !94)
!104 = !DILocation(line: 70, column: 17, scope: !94)
!105 = !DILocalVariable(name: "source", scope: !106, file: !17, line: 73, type: !42)
!106 = distinct !DILexicalBlock(scope: !82, file: !17, line: 72, column: 5)
!107 = !DILocation(line: 73, column: 17, scope: !106)
!108 = !DILocation(line: 74, column: 17, scope: !106)
!109 = !DILocation(line: 74, column: 9, scope: !106)
!110 = !DILocation(line: 75, column: 9, scope: !106)
!111 = !DILocation(line: 75, column: 23, scope: !106)
!112 = !DILocation(line: 77, column: 18, scope: !106)
!113 = !DILocation(line: 77, column: 36, scope: !106)
!114 = !DILocation(line: 77, column: 9, scope: !106)
!115 = !DILocation(line: 78, column: 20, scope: !106)
!116 = !DILocation(line: 78, column: 9, scope: !106)
!117 = !DILocation(line: 79, column: 14, scope: !106)
!118 = !DILocation(line: 79, column: 9, scope: !106)
!119 = !DILocation(line: 81, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !17, line: 86, type: !4)
!122 = !DILocation(line: 86, column: 15, scope: !120)
!123 = !DILocation(line: 87, column: 10, scope: !120)
!124 = !DILocation(line: 88, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !17, line: 88, column: 8)
!126 = !DILocation(line: 88, column: 18, scope: !125)
!127 = !DILocation(line: 88, column: 8, scope: !120)
!128 = !DILocation(line: 91, column: 27, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 89, column: 5)
!130 = !DILocation(line: 91, column: 16, scope: !129)
!131 = !DILocation(line: 91, column: 14, scope: !129)
!132 = !DILocation(line: 92, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 92, column: 13)
!134 = !DILocation(line: 92, column: 18, scope: !133)
!135 = !DILocation(line: 92, column: 13, scope: !129)
!136 = !DILocation(line: 92, column: 28, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !17, line: 92, column: 27)
!138 = !DILocation(line: 93, column: 9, scope: !129)
!139 = !DILocation(line: 93, column: 17, scope: !129)
!140 = !DILocation(line: 94, column: 5, scope: !129)
!141 = !DILocalVariable(name: "source", scope: !142, file: !17, line: 96, type: !42)
!142 = distinct !DILexicalBlock(scope: !120, file: !17, line: 95, column: 5)
!143 = !DILocation(line: 96, column: 17, scope: !142)
!144 = !DILocation(line: 97, column: 17, scope: !142)
!145 = !DILocation(line: 97, column: 9, scope: !142)
!146 = !DILocation(line: 98, column: 9, scope: !142)
!147 = !DILocation(line: 98, column: 23, scope: !142)
!148 = !DILocation(line: 100, column: 18, scope: !142)
!149 = !DILocation(line: 100, column: 36, scope: !142)
!150 = !DILocation(line: 100, column: 9, scope: !142)
!151 = !DILocation(line: 101, column: 20, scope: !142)
!152 = !DILocation(line: 101, column: 9, scope: !142)
!153 = !DILocation(line: 102, column: 14, scope: !142)
!154 = !DILocation(line: 102, column: 9, scope: !142)
!155 = !DILocation(line: 104, column: 1, scope: !120)
