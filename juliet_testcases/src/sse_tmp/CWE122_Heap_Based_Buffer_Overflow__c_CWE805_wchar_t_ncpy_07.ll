; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end3, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !50
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx5, align 4, !dbg !52
  %4 = load i32*, i32** %data, align 8, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call7 = call i32* @wcsncpy(i32* %4, i32* %arraydecay6, i64 99) #5, !dbg !55
  %5 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx8 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !56
  store i32 0, i32* %arrayidx8, align 4, !dbg !57
  %6 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %6), !dbg !59
  %7 = load i32*, i32** %data, align 8, !dbg !60
  %8 = bitcast i32* %7 to i8*, !dbg !60
  call void @free(i8* %8) #5, !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp = icmp ne i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end3, !dbg !97

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !98
  %1 = bitcast i8* %call to i32*, !dbg !100
  store i32* %1, i32** %data, align 8, !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  %cmp1 = icmp eq i32* %2, null, !dbg !104
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !105

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !114
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx5, align 4, !dbg !116
  %4 = load i32*, i32** %data, align 8, !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call7 = call i32* @wcsncpy(i32* %4, i32* %arraydecay6, i64 99) #5, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx8 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !120
  store i32 0, i32* %arrayidx8, align 4, !dbg !121
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !131
  %cmp = icmp eq i32 %0, 5, !dbg !133
  br i1 %cmp, label %if.then, label %if.end3, !dbg !134

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !135
  %1 = bitcast i8* %call to i32*, !dbg !137
  store i32* %1, i32** %data, align 8, !dbg !138
  %2 = load i32*, i32** %data, align 8, !dbg !139
  %cmp1 = icmp eq i32* %2, null, !dbg !141
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !142

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  br label %if.end3, !dbg !147

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !152
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %4 = load i32*, i32** %data, align 8, !dbg !155
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !156
  %call7 = call i32* @wcsncpy(i32* %4, i32* %arraydecay6, i64 99) #5, !dbg !157
  %5 = load i32*, i32** %data, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !158
  store i32 0, i32* %arrayidx8, align 4, !dbg !159
  %6 = load i32*, i32** %data, align 8, !dbg !160
  call void @printWLine(i32* %6), !dbg !161
  %7 = load i32*, i32** %data, align 8, !dbg !162
  %8 = bitcast i32* %7 to i8*, !dbg !162
  call void @free(i8* %8) #5, !dbg !163
  ret void, !dbg !164
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocation(line: 36, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 14, scope: !31)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !31)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 9, scope: !31)
!41 = !DILocation(line: 38, column: 17, scope: !31)
!42 = !DILocation(line: 39, column: 5, scope: !31)
!43 = !DILocalVariable(name: "source", scope: !44, file: !13, line: 41, type: !45)
!44 = distinct !DILexicalBlock(scope: !20, file: !13, line: 40, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 41, column: 17, scope: !44)
!49 = !DILocation(line: 42, column: 17, scope: !44)
!50 = !DILocation(line: 42, column: 9, scope: !44)
!51 = !DILocation(line: 43, column: 9, scope: !44)
!52 = !DILocation(line: 43, column: 23, scope: !44)
!53 = !DILocation(line: 45, column: 17, scope: !44)
!54 = !DILocation(line: 45, column: 23, scope: !44)
!55 = !DILocation(line: 45, column: 9, scope: !44)
!56 = !DILocation(line: 46, column: 9, scope: !44)
!57 = !DILocation(line: 46, column: 21, scope: !44)
!58 = !DILocation(line: 47, column: 20, scope: !44)
!59 = !DILocation(line: 47, column: 9, scope: !44)
!60 = !DILocation(line: 48, column: 14, scope: !44)
!61 = !DILocation(line: 48, column: 9, scope: !44)
!62 = !DILocation(line: 50, column: 1, scope: !20)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_07_good", scope: !13, file: !13, line: 109, type: !21, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 111, column: 5, scope: !63)
!65 = !DILocation(line: 112, column: 5, scope: !63)
!66 = !DILocation(line: 113, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 125, type: !68, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!9, !9, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !13, line: 125, type: !9)
!74 = !DILocation(line: 125, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !13, line: 125, type: !70)
!76 = !DILocation(line: 125, column: 27, scope: !67)
!77 = !DILocation(line: 128, column: 22, scope: !67)
!78 = !DILocation(line: 128, column: 12, scope: !67)
!79 = !DILocation(line: 128, column: 5, scope: !67)
!80 = !DILocation(line: 130, column: 5, scope: !67)
!81 = !DILocation(line: 131, column: 5, scope: !67)
!82 = !DILocation(line: 132, column: 5, scope: !67)
!83 = !DILocation(line: 135, column: 5, scope: !67)
!84 = !DILocation(line: 136, column: 5, scope: !67)
!85 = !DILocation(line: 137, column: 5, scope: !67)
!86 = !DILocation(line: 139, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !13, line: 59, type: !6)
!89 = !DILocation(line: 59, column: 15, scope: !87)
!90 = !DILocation(line: 60, column: 10, scope: !87)
!91 = !DILocation(line: 61, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !13, line: 61, column: 8)
!93 = !DILocation(line: 61, column: 18, scope: !92)
!94 = !DILocation(line: 61, column: 8, scope: !87)
!95 = !DILocation(line: 64, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !13, line: 62, column: 5)
!97 = !DILocation(line: 65, column: 5, scope: !96)
!98 = !DILocation(line: 69, column: 27, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !13, line: 67, column: 5)
!100 = !DILocation(line: 69, column: 16, scope: !99)
!101 = !DILocation(line: 69, column: 14, scope: !99)
!102 = !DILocation(line: 70, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !13, line: 70, column: 13)
!104 = !DILocation(line: 70, column: 18, scope: !103)
!105 = !DILocation(line: 70, column: 13, scope: !99)
!106 = !DILocation(line: 70, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !13, line: 70, column: 27)
!108 = !DILocation(line: 71, column: 9, scope: !99)
!109 = !DILocation(line: 71, column: 17, scope: !99)
!110 = !DILocalVariable(name: "source", scope: !111, file: !13, line: 74, type: !45)
!111 = distinct !DILexicalBlock(scope: !87, file: !13, line: 73, column: 5)
!112 = !DILocation(line: 74, column: 17, scope: !111)
!113 = !DILocation(line: 75, column: 17, scope: !111)
!114 = !DILocation(line: 75, column: 9, scope: !111)
!115 = !DILocation(line: 76, column: 9, scope: !111)
!116 = !DILocation(line: 76, column: 23, scope: !111)
!117 = !DILocation(line: 78, column: 17, scope: !111)
!118 = !DILocation(line: 78, column: 23, scope: !111)
!119 = !DILocation(line: 78, column: 9, scope: !111)
!120 = !DILocation(line: 79, column: 9, scope: !111)
!121 = !DILocation(line: 79, column: 21, scope: !111)
!122 = !DILocation(line: 80, column: 20, scope: !111)
!123 = !DILocation(line: 80, column: 9, scope: !111)
!124 = !DILocation(line: 81, column: 14, scope: !111)
!125 = !DILocation(line: 81, column: 9, scope: !111)
!126 = !DILocation(line: 83, column: 1, scope: !87)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !13, line: 88, type: !6)
!129 = !DILocation(line: 88, column: 15, scope: !127)
!130 = !DILocation(line: 89, column: 10, scope: !127)
!131 = !DILocation(line: 90, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !13, line: 90, column: 8)
!133 = !DILocation(line: 90, column: 18, scope: !132)
!134 = !DILocation(line: 90, column: 8, scope: !127)
!135 = !DILocation(line: 93, column: 27, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 91, column: 5)
!137 = !DILocation(line: 93, column: 16, scope: !136)
!138 = !DILocation(line: 93, column: 14, scope: !136)
!139 = !DILocation(line: 94, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !13, line: 94, column: 13)
!141 = !DILocation(line: 94, column: 18, scope: !140)
!142 = !DILocation(line: 94, column: 13, scope: !136)
!143 = !DILocation(line: 94, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !13, line: 94, column: 27)
!145 = !DILocation(line: 95, column: 9, scope: !136)
!146 = !DILocation(line: 95, column: 17, scope: !136)
!147 = !DILocation(line: 96, column: 5, scope: !136)
!148 = !DILocalVariable(name: "source", scope: !149, file: !13, line: 98, type: !45)
!149 = distinct !DILexicalBlock(scope: !127, file: !13, line: 97, column: 5)
!150 = !DILocation(line: 98, column: 17, scope: !149)
!151 = !DILocation(line: 99, column: 17, scope: !149)
!152 = !DILocation(line: 99, column: 9, scope: !149)
!153 = !DILocation(line: 100, column: 9, scope: !149)
!154 = !DILocation(line: 100, column: 23, scope: !149)
!155 = !DILocation(line: 102, column: 17, scope: !149)
!156 = !DILocation(line: 102, column: 23, scope: !149)
!157 = !DILocation(line: 102, column: 9, scope: !149)
!158 = !DILocation(line: 103, column: 9, scope: !149)
!159 = !DILocation(line: 103, column: 21, scope: !149)
!160 = !DILocation(line: 104, column: 20, scope: !149)
!161 = !DILocation(line: 104, column: 9, scope: !149)
!162 = !DILocation(line: 105, column: 14, scope: !149)
!163 = !DILocation(line: 105, column: 9, scope: !149)
!164 = !DILocation(line: 107, column: 1, scope: !127)
