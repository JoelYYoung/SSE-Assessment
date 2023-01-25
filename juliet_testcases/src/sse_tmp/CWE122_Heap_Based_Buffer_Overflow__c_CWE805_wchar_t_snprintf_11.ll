; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx5, align 4, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %3, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %4), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %6 = bitcast i32* %5 to i8*, !dbg !54
  call void @free(i8* %6) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  %call = call i32 (...) @globalReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !88
  br label %if.end3, !dbg !90

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !91
  %0 = bitcast i8* %call1 to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then2, label %if.end, !dbg !98

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !107
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx5, align 4, !dbg !109
  %3 = load i32*, i32** %data, align 8, !dbg !110
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %3, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !112
  %4 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %4), !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  %6 = bitcast i32* %5 to i8*, !dbg !115
  call void @free(i8* %6) #5, !dbg !116
  ret void, !dbg !117
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i32* null, i32** %data, align 8, !dbg !121
  %call = call i32 (...) @globalReturnsTrue(), !dbg !122
  %tobool = icmp ne i32 %call, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end3, !dbg !124

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !125
  %0 = bitcast i8* %call1 to i32*, !dbg !127
  store i32* %0, i32** %data, align 8, !dbg !128
  %1 = load i32*, i32** %data, align 8, !dbg !129
  %cmp = icmp eq i32* %1, null, !dbg !131
  br i1 %cmp, label %if.then2, label %if.end, !dbg !132

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %if.end3, !dbg !137

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !142
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx5, align 4, !dbg !144
  %3 = load i32*, i32** %data, align 8, !dbg !145
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %3, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !147
  %4 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* %4), !dbg !149
  %5 = load i32*, i32** %data, align 8, !dbg !150
  %6 = bitcast i32* %5 to i8*, !dbg !150
  call void @free(i8* %6) #5, !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocation(line: 32, column: 10, scope: !16)
!23 = !DILocation(line: 33, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 8)
!25 = !DILocation(line: 33, column: 8, scope: !16)
!26 = !DILocation(line: 36, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 34, column: 5)
!28 = !DILocation(line: 36, column: 16, scope: !27)
!29 = !DILocation(line: 36, column: 14, scope: !27)
!30 = !DILocation(line: 37, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 37, column: 13)
!32 = !DILocation(line: 37, column: 18, scope: !31)
!33 = !DILocation(line: 37, column: 13, scope: !27)
!34 = !DILocation(line: 37, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 37, column: 27)
!36 = !DILocation(line: 38, column: 9, scope: !27)
!37 = !DILocation(line: 38, column: 17, scope: !27)
!38 = !DILocation(line: 39, column: 5, scope: !27)
!39 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 41, column: 17, scope: !40)
!45 = !DILocation(line: 42, column: 17, scope: !40)
!46 = !DILocation(line: 42, column: 9, scope: !40)
!47 = !DILocation(line: 43, column: 9, scope: !40)
!48 = !DILocation(line: 43, column: 23, scope: !40)
!49 = !DILocation(line: 45, column: 18, scope: !40)
!50 = !DILocation(line: 45, column: 36, scope: !40)
!51 = !DILocation(line: 45, column: 9, scope: !40)
!52 = !DILocation(line: 46, column: 20, scope: !40)
!53 = !DILocation(line: 46, column: 9, scope: !40)
!54 = !DILocation(line: 47, column: 14, scope: !40)
!55 = !DILocation(line: 47, column: 9, scope: !40)
!56 = !DILocation(line: 49, column: 1, scope: !16)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_11_good", scope: !17, file: !17, line: 106, type: !18, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 108, column: 5, scope: !57)
!59 = !DILocation(line: 109, column: 5, scope: !57)
!60 = !DILocation(line: 110, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 122, type: !62, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !17, line: 122, type: !7)
!68 = !DILocation(line: 122, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !17, line: 122, type: !64)
!70 = !DILocation(line: 122, column: 27, scope: !61)
!71 = !DILocation(line: 125, column: 22, scope: !61)
!72 = !DILocation(line: 125, column: 12, scope: !61)
!73 = !DILocation(line: 125, column: 5, scope: !61)
!74 = !DILocation(line: 127, column: 5, scope: !61)
!75 = !DILocation(line: 128, column: 5, scope: !61)
!76 = !DILocation(line: 129, column: 5, scope: !61)
!77 = !DILocation(line: 132, column: 5, scope: !61)
!78 = !DILocation(line: 133, column: 5, scope: !61)
!79 = !DILocation(line: 134, column: 5, scope: !61)
!80 = !DILocation(line: 136, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !17, line: 58, type: !4)
!83 = !DILocation(line: 58, column: 15, scope: !81)
!84 = !DILocation(line: 59, column: 10, scope: !81)
!85 = !DILocation(line: 60, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !17, line: 60, column: 8)
!87 = !DILocation(line: 60, column: 8, scope: !81)
!88 = !DILocation(line: 63, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !17, line: 61, column: 5)
!90 = !DILocation(line: 64, column: 5, scope: !89)
!91 = !DILocation(line: 68, column: 27, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !17, line: 66, column: 5)
!93 = !DILocation(line: 68, column: 16, scope: !92)
!94 = !DILocation(line: 68, column: 14, scope: !92)
!95 = !DILocation(line: 69, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 69, column: 13)
!97 = !DILocation(line: 69, column: 18, scope: !96)
!98 = !DILocation(line: 69, column: 13, scope: !92)
!99 = !DILocation(line: 69, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 69, column: 27)
!101 = !DILocation(line: 70, column: 9, scope: !92)
!102 = !DILocation(line: 70, column: 17, scope: !92)
!103 = !DILocalVariable(name: "source", scope: !104, file: !17, line: 73, type: !41)
!104 = distinct !DILexicalBlock(scope: !81, file: !17, line: 72, column: 5)
!105 = !DILocation(line: 73, column: 17, scope: !104)
!106 = !DILocation(line: 74, column: 17, scope: !104)
!107 = !DILocation(line: 74, column: 9, scope: !104)
!108 = !DILocation(line: 75, column: 9, scope: !104)
!109 = !DILocation(line: 75, column: 23, scope: !104)
!110 = !DILocation(line: 77, column: 18, scope: !104)
!111 = !DILocation(line: 77, column: 36, scope: !104)
!112 = !DILocation(line: 77, column: 9, scope: !104)
!113 = !DILocation(line: 78, column: 20, scope: !104)
!114 = !DILocation(line: 78, column: 9, scope: !104)
!115 = !DILocation(line: 79, column: 14, scope: !104)
!116 = !DILocation(line: 79, column: 9, scope: !104)
!117 = !DILocation(line: 81, column: 1, scope: !81)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !17, line: 86, type: !4)
!120 = !DILocation(line: 86, column: 15, scope: !118)
!121 = !DILocation(line: 87, column: 10, scope: !118)
!122 = !DILocation(line: 88, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !17, line: 88, column: 8)
!124 = !DILocation(line: 88, column: 8, scope: !118)
!125 = !DILocation(line: 91, column: 27, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !17, line: 89, column: 5)
!127 = !DILocation(line: 91, column: 16, scope: !126)
!128 = !DILocation(line: 91, column: 14, scope: !126)
!129 = !DILocation(line: 92, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 92, column: 13)
!131 = !DILocation(line: 92, column: 18, scope: !130)
!132 = !DILocation(line: 92, column: 13, scope: !126)
!133 = !DILocation(line: 92, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !17, line: 92, column: 27)
!135 = !DILocation(line: 93, column: 9, scope: !126)
!136 = !DILocation(line: 93, column: 17, scope: !126)
!137 = !DILocation(line: 94, column: 5, scope: !126)
!138 = !DILocalVariable(name: "source", scope: !139, file: !17, line: 96, type: !41)
!139 = distinct !DILexicalBlock(scope: !118, file: !17, line: 95, column: 5)
!140 = !DILocation(line: 96, column: 17, scope: !139)
!141 = !DILocation(line: 97, column: 17, scope: !139)
!142 = !DILocation(line: 97, column: 9, scope: !139)
!143 = !DILocation(line: 98, column: 9, scope: !139)
!144 = !DILocation(line: 98, column: 23, scope: !139)
!145 = !DILocation(line: 100, column: 18, scope: !139)
!146 = !DILocation(line: 100, column: 36, scope: !139)
!147 = !DILocation(line: 100, column: 9, scope: !139)
!148 = !DILocation(line: 101, column: 20, scope: !139)
!149 = !DILocation(line: 101, column: 9, scope: !139)
!150 = !DILocation(line: 102, column: 14, scope: !139)
!151 = !DILocation(line: 102, column: 9, scope: !139)
!152 = !DILocation(line: 104, column: 1, scope: !118)
