; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

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
  br label %if.end8, !dbg !38

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !39
  %3 = bitcast i8* %call3 to i32*, !dbg !41
  store i32* %3, i32** %data, align 8, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %cmp4 = icmp eq i32* %4, null, !dbg !45
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !46

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !47
  unreachable, !dbg !47

if.end6:                                          ; preds = %if.else
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 0, !dbg !49
  store i32 0, i32* %arrayidx7, align 4, !dbg !50
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call9 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !58
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx10, align 4, !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !62
  %call12 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %6, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay11) #5, !dbg !63
  %7 = load i32*, i32** %data, align 8, !dbg !64
  call void @printWLine(i32* %7), !dbg !65
  %8 = load i32*, i32** %data, align 8, !dbg !66
  %9 = bitcast i32* %8 to i8*, !dbg !66
  call void @free(i8* %9) #5, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12_good() #0 !dbg !69 {
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
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !99
  %0 = bitcast i8* %call1 to i32*, !dbg !101
  store i32* %0, i32** %data, align 8, !dbg !102
  %1 = load i32*, i32** %data, align 8, !dbg !103
  %cmp = icmp eq i32* %1, null, !dbg !105
  br i1 %cmp, label %if.then2, label %if.end, !dbg !106

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  br label %if.end8, !dbg !111

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !112
  %3 = bitcast i8* %call3 to i32*, !dbg !114
  store i32* %3, i32** %data, align 8, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %cmp4 = icmp eq i32* %4, null, !dbg !118
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !119

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !120
  unreachable, !dbg !120

if.end6:                                          ; preds = %if.else
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 0, !dbg !122
  store i32 0, i32* %arrayidx7, align 4, !dbg !123
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call9 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !128
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx10, align 4, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call12 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %6, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay11) #5, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %7), !dbg !135
  %8 = load i32*, i32** %data, align 8, !dbg !136
  %9 = bitcast i32* %8 to i8*, !dbg !136
  call void @free(i8* %9) #5, !dbg !137
  ret void, !dbg !138
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!39 = !DILocation(line: 43, column: 27, scope: !40)
!40 = distinct !DILexicalBlock(scope: !24, file: !17, line: 41, column: 5)
!41 = !DILocation(line: 43, column: 16, scope: !40)
!42 = !DILocation(line: 43, column: 14, scope: !40)
!43 = !DILocation(line: 44, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 44, column: 13)
!45 = !DILocation(line: 44, column: 18, scope: !44)
!46 = !DILocation(line: 44, column: 13, scope: !40)
!47 = !DILocation(line: 44, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !17, line: 44, column: 27)
!49 = !DILocation(line: 45, column: 9, scope: !40)
!50 = !DILocation(line: 45, column: 17, scope: !40)
!51 = !DILocalVariable(name: "source", scope: !52, file: !17, line: 48, type: !53)
!52 = distinct !DILexicalBlock(scope: !16, file: !17, line: 47, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 48, column: 17, scope: !52)
!57 = !DILocation(line: 49, column: 17, scope: !52)
!58 = !DILocation(line: 49, column: 9, scope: !52)
!59 = !DILocation(line: 50, column: 9, scope: !52)
!60 = !DILocation(line: 50, column: 23, scope: !52)
!61 = !DILocation(line: 52, column: 18, scope: !52)
!62 = !DILocation(line: 52, column: 36, scope: !52)
!63 = !DILocation(line: 52, column: 9, scope: !52)
!64 = !DILocation(line: 53, column: 20, scope: !52)
!65 = !DILocation(line: 53, column: 9, scope: !52)
!66 = !DILocation(line: 54, column: 14, scope: !52)
!67 = !DILocation(line: 54, column: 9, scope: !52)
!68 = !DILocation(line: 56, column: 1, scope: !16)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_12_good", scope: !17, file: !17, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 95, column: 5, scope: !69)
!71 = !DILocation(line: 96, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 108, type: !73, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!7, !7, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !17, line: 108, type: !7)
!79 = !DILocation(line: 108, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !17, line: 108, type: !75)
!81 = !DILocation(line: 108, column: 27, scope: !72)
!82 = !DILocation(line: 111, column: 22, scope: !72)
!83 = !DILocation(line: 111, column: 12, scope: !72)
!84 = !DILocation(line: 111, column: 5, scope: !72)
!85 = !DILocation(line: 113, column: 5, scope: !72)
!86 = !DILocation(line: 114, column: 5, scope: !72)
!87 = !DILocation(line: 115, column: 5, scope: !72)
!88 = !DILocation(line: 118, column: 5, scope: !72)
!89 = !DILocation(line: 119, column: 5, scope: !72)
!90 = !DILocation(line: 120, column: 5, scope: !72)
!91 = !DILocation(line: 122, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !17, line: 66, type: !4)
!94 = !DILocation(line: 66, column: 15, scope: !92)
!95 = !DILocation(line: 67, column: 10, scope: !92)
!96 = !DILocation(line: 68, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !17, line: 68, column: 8)
!98 = !DILocation(line: 68, column: 8, scope: !92)
!99 = !DILocation(line: 71, column: 27, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !17, line: 69, column: 5)
!101 = !DILocation(line: 71, column: 16, scope: !100)
!102 = !DILocation(line: 71, column: 14, scope: !100)
!103 = !DILocation(line: 72, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !17, line: 72, column: 13)
!105 = !DILocation(line: 72, column: 18, scope: !104)
!106 = !DILocation(line: 72, column: 13, scope: !100)
!107 = !DILocation(line: 72, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !17, line: 72, column: 27)
!109 = !DILocation(line: 73, column: 9, scope: !100)
!110 = !DILocation(line: 73, column: 17, scope: !100)
!111 = !DILocation(line: 74, column: 5, scope: !100)
!112 = !DILocation(line: 78, column: 27, scope: !113)
!113 = distinct !DILexicalBlock(scope: !97, file: !17, line: 76, column: 5)
!114 = !DILocation(line: 78, column: 16, scope: !113)
!115 = !DILocation(line: 78, column: 14, scope: !113)
!116 = !DILocation(line: 79, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 79, column: 13)
!118 = !DILocation(line: 79, column: 18, scope: !117)
!119 = !DILocation(line: 79, column: 13, scope: !113)
!120 = !DILocation(line: 79, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 79, column: 27)
!122 = !DILocation(line: 80, column: 9, scope: !113)
!123 = !DILocation(line: 80, column: 17, scope: !113)
!124 = !DILocalVariable(name: "source", scope: !125, file: !17, line: 83, type: !53)
!125 = distinct !DILexicalBlock(scope: !92, file: !17, line: 82, column: 5)
!126 = !DILocation(line: 83, column: 17, scope: !125)
!127 = !DILocation(line: 84, column: 17, scope: !125)
!128 = !DILocation(line: 84, column: 9, scope: !125)
!129 = !DILocation(line: 85, column: 9, scope: !125)
!130 = !DILocation(line: 85, column: 23, scope: !125)
!131 = !DILocation(line: 87, column: 18, scope: !125)
!132 = !DILocation(line: 87, column: 36, scope: !125)
!133 = !DILocation(line: 87, column: 9, scope: !125)
!134 = !DILocation(line: 88, column: 20, scope: !125)
!135 = !DILocation(line: 88, column: 9, scope: !125)
!136 = !DILocation(line: 89, column: 14, scope: !125)
!137 = !DILocation(line: 89, column: 9, scope: !125)
!138 = !DILocation(line: 91, column: 1, scope: !92)
