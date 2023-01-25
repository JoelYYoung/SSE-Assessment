; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end2, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end2, !dbg !43

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx4, align 4, !dbg !53
  %4 = load i32*, i32** %data, align 8, !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call6 = call i32* @wcsncpy(i32* %4, i32* %arraydecay5, i64 99) #5, !dbg !56
  %5 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !57
  store i32 0, i32* %arrayidx7, align 4, !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %6), !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %8 = bitcast i32* %7 to i8*, !dbg !61
  call void @free(i8* %8) #5, !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %0 = load i32, i32* @staticFalse, align 4, !dbg !92
  %tobool = icmp ne i32 %0, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end2, !dbg !97

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !98
  %1 = bitcast i8* %call to i32*, !dbg !100
  store i32* %1, i32** %data, align 8, !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  %cmp = icmp eq i32* %2, null, !dbg !104
  br i1 %cmp, label %if.then1, label %if.end, !dbg !105

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !114
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx4, align 4, !dbg !116
  %4 = load i32*, i32** %data, align 8, !dbg !117
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call6 = call i32* @wcsncpy(i32* %4, i32* %arraydecay5, i64 99) #5, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !120
  store i32 0, i32* %arrayidx7, align 4, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  call void @printWLine(i32* %6), !dbg !123
  %7 = load i32*, i32** %data, align 8, !dbg !124
  %8 = bitcast i32* %7 to i8*, !dbg !124
  call void @free(i8* %8) #5, !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i32* null, i32** %data, align 8, !dbg !130
  %0 = load i32, i32* @staticTrue, align 4, !dbg !131
  %tobool = icmp ne i32 %0, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.end2, !dbg !133

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !134
  %1 = bitcast i8* %call to i32*, !dbg !136
  store i32* %1, i32** %data, align 8, !dbg !137
  %2 = load i32*, i32** %data, align 8, !dbg !138
  %cmp = icmp eq i32* %2, null, !dbg !140
  br i1 %cmp, label %if.then1, label %if.end, !dbg !141

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !145
  br label %if.end2, !dbg !146

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !147, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !150
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !151
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !152
  store i32 0, i32* %arrayidx4, align 4, !dbg !153
  %4 = load i32*, i32** %data, align 8, !dbg !154
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !155
  %call6 = call i32* @wcsncpy(i32* %4, i32* %arraydecay5, i64 99) #5, !dbg !156
  %5 = load i32*, i32** %data, align 8, !dbg !157
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !157
  store i32 0, i32* %arrayidx7, align 4, !dbg !158
  %6 = load i32*, i32** %data, align 8, !dbg !159
  call void @printWLine(i32* %6), !dbg !160
  %7 = load i32*, i32** %data, align 8, !dbg !161
  %8 = bitcast i32* %7 to i8*, !dbg !161
  call void @free(i8* %8) #5, !dbg !162
  ret void, !dbg !163
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocation(line: 37, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 16, scope: !32)
!34 = !DILocation(line: 37, column: 14, scope: !32)
!35 = !DILocation(line: 38, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 13)
!37 = !DILocation(line: 38, column: 18, scope: !36)
!38 = !DILocation(line: 38, column: 13, scope: !32)
!39 = !DILocation(line: 38, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 38, column: 27)
!41 = !DILocation(line: 39, column: 9, scope: !32)
!42 = !DILocation(line: 39, column: 17, scope: !32)
!43 = !DILocation(line: 40, column: 5, scope: !32)
!44 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 42, column: 17, scope: !45)
!50 = !DILocation(line: 43, column: 17, scope: !45)
!51 = !DILocation(line: 43, column: 9, scope: !45)
!52 = !DILocation(line: 44, column: 9, scope: !45)
!53 = !DILocation(line: 44, column: 23, scope: !45)
!54 = !DILocation(line: 46, column: 17, scope: !45)
!55 = !DILocation(line: 46, column: 23, scope: !45)
!56 = !DILocation(line: 46, column: 9, scope: !45)
!57 = !DILocation(line: 47, column: 9, scope: !45)
!58 = !DILocation(line: 47, column: 21, scope: !45)
!59 = !DILocation(line: 48, column: 20, scope: !45)
!60 = !DILocation(line: 48, column: 9, scope: !45)
!61 = !DILocation(line: 49, column: 14, scope: !45)
!62 = !DILocation(line: 49, column: 9, scope: !45)
!63 = !DILocation(line: 51, column: 1, scope: !22)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_05_good", scope: !15, file: !15, line: 110, type: !23, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 112, column: 5, scope: !64)
!66 = !DILocation(line: 113, column: 5, scope: !64)
!67 = !DILocation(line: 114, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 126, type: !69, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!9, !9, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !15, line: 126, type: !9)
!75 = !DILocation(line: 126, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !15, line: 126, type: !71)
!77 = !DILocation(line: 126, column: 27, scope: !68)
!78 = !DILocation(line: 129, column: 22, scope: !68)
!79 = !DILocation(line: 129, column: 12, scope: !68)
!80 = !DILocation(line: 129, column: 5, scope: !68)
!81 = !DILocation(line: 131, column: 5, scope: !68)
!82 = !DILocation(line: 132, column: 5, scope: !68)
!83 = !DILocation(line: 133, column: 5, scope: !68)
!84 = !DILocation(line: 136, column: 5, scope: !68)
!85 = !DILocation(line: 137, column: 5, scope: !68)
!86 = !DILocation(line: 138, column: 5, scope: !68)
!87 = !DILocation(line: 140, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !23, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 60, type: !6)
!90 = !DILocation(line: 60, column: 15, scope: !88)
!91 = !DILocation(line: 61, column: 10, scope: !88)
!92 = !DILocation(line: 62, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !15, line: 62, column: 8)
!94 = !DILocation(line: 62, column: 8, scope: !88)
!95 = !DILocation(line: 65, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !15, line: 63, column: 5)
!97 = !DILocation(line: 66, column: 5, scope: !96)
!98 = !DILocation(line: 70, column: 27, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !15, line: 68, column: 5)
!100 = !DILocation(line: 70, column: 16, scope: !99)
!101 = !DILocation(line: 70, column: 14, scope: !99)
!102 = !DILocation(line: 71, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 71, column: 13)
!104 = !DILocation(line: 71, column: 18, scope: !103)
!105 = !DILocation(line: 71, column: 13, scope: !99)
!106 = !DILocation(line: 71, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 71, column: 27)
!108 = !DILocation(line: 72, column: 9, scope: !99)
!109 = !DILocation(line: 72, column: 17, scope: !99)
!110 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 75, type: !46)
!111 = distinct !DILexicalBlock(scope: !88, file: !15, line: 74, column: 5)
!112 = !DILocation(line: 75, column: 17, scope: !111)
!113 = !DILocation(line: 76, column: 17, scope: !111)
!114 = !DILocation(line: 76, column: 9, scope: !111)
!115 = !DILocation(line: 77, column: 9, scope: !111)
!116 = !DILocation(line: 77, column: 23, scope: !111)
!117 = !DILocation(line: 79, column: 17, scope: !111)
!118 = !DILocation(line: 79, column: 23, scope: !111)
!119 = !DILocation(line: 79, column: 9, scope: !111)
!120 = !DILocation(line: 80, column: 9, scope: !111)
!121 = !DILocation(line: 80, column: 21, scope: !111)
!122 = !DILocation(line: 81, column: 20, scope: !111)
!123 = !DILocation(line: 81, column: 9, scope: !111)
!124 = !DILocation(line: 82, column: 14, scope: !111)
!125 = !DILocation(line: 82, column: 9, scope: !111)
!126 = !DILocation(line: 84, column: 1, scope: !88)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 87, type: !23, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !15, line: 89, type: !6)
!129 = !DILocation(line: 89, column: 15, scope: !127)
!130 = !DILocation(line: 90, column: 10, scope: !127)
!131 = !DILocation(line: 91, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !15, line: 91, column: 8)
!133 = !DILocation(line: 91, column: 8, scope: !127)
!134 = !DILocation(line: 94, column: 27, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !15, line: 92, column: 5)
!136 = !DILocation(line: 94, column: 16, scope: !135)
!137 = !DILocation(line: 94, column: 14, scope: !135)
!138 = !DILocation(line: 95, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 95, column: 13)
!140 = !DILocation(line: 95, column: 18, scope: !139)
!141 = !DILocation(line: 95, column: 13, scope: !135)
!142 = !DILocation(line: 95, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !15, line: 95, column: 27)
!144 = !DILocation(line: 96, column: 9, scope: !135)
!145 = !DILocation(line: 96, column: 17, scope: !135)
!146 = !DILocation(line: 97, column: 5, scope: !135)
!147 = !DILocalVariable(name: "source", scope: !148, file: !15, line: 99, type: !46)
!148 = distinct !DILexicalBlock(scope: !127, file: !15, line: 98, column: 5)
!149 = !DILocation(line: 99, column: 17, scope: !148)
!150 = !DILocation(line: 100, column: 17, scope: !148)
!151 = !DILocation(line: 100, column: 9, scope: !148)
!152 = !DILocation(line: 101, column: 9, scope: !148)
!153 = !DILocation(line: 101, column: 23, scope: !148)
!154 = !DILocation(line: 103, column: 17, scope: !148)
!155 = !DILocation(line: 103, column: 23, scope: !148)
!156 = !DILocation(line: 103, column: 9, scope: !148)
!157 = !DILocation(line: 104, column: 9, scope: !148)
!158 = !DILocation(line: 104, column: 21, scope: !148)
!159 = !DILocation(line: 105, column: 20, scope: !148)
!160 = !DILocation(line: 105, column: 9, scope: !148)
!161 = !DILocation(line: 106, column: 14, scope: !148)
!162 = !DILocation(line: 106, column: 9, scope: !148)
!163 = !DILocation(line: 108, column: 1, scope: !127)
