; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05_bad() #0 !dbg !22 {
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
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay5) #5, !dbg !56
  %5 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %5), !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  %7 = bitcast i32* %6 to i8*, !dbg !59
  call void @free(i8* %7) #5, !dbg !60
  ret void, !dbg !61
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32* null, i32** %data, align 8, !dbg !89
  %0 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %0, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end2, !dbg !95

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !96
  %1 = bitcast i8* %call to i32*, !dbg !98
  store i32* %1, i32** %data, align 8, !dbg !99
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %cmp = icmp eq i32* %2, null, !dbg !102
  br i1 %cmp, label %if.then1, label %if.end, !dbg !103

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !112
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx4, align 4, !dbg !114
  %4 = load i32*, i32** %data, align 8, !dbg !115
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay5) #5, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %5), !dbg !119
  %6 = load i32*, i32** %data, align 8, !dbg !120
  %7 = bitcast i32* %6 to i8*, !dbg !120
  call void @free(i8* %7) #5, !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32* null, i32** %data, align 8, !dbg !126
  %0 = load i32, i32* @staticTrue, align 4, !dbg !127
  %tobool = icmp ne i32 %0, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end2, !dbg !129

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !130
  %1 = bitcast i8* %call to i32*, !dbg !132
  store i32* %1, i32** %data, align 8, !dbg !133
  %2 = load i32*, i32** %data, align 8, !dbg !134
  %cmp = icmp eq i32* %2, null, !dbg !136
  br i1 %cmp, label %if.then1, label %if.end, !dbg !137

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  br label %if.end2, !dbg !142

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !147
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx4, align 4, !dbg !149
  %4 = load i32*, i32** %data, align 8, !dbg !150
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay5) #5, !dbg !152
  %5 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %5), !dbg !154
  %6 = load i32*, i32** %data, align 8, !dbg !155
  %7 = bitcast i32* %6 to i8*, !dbg !155
  call void @free(i8* %7) #5, !dbg !156
  ret void, !dbg !157
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 32, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05_bad", scope: !15, file: !15, line: 36, type: !23, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 38, type: !6)
!26 = !DILocation(line: 38, column: 15, scope: !22)
!27 = !DILocation(line: 39, column: 10, scope: !22)
!28 = !DILocation(line: 40, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 40, column: 8)
!30 = !DILocation(line: 40, column: 8, scope: !22)
!31 = !DILocation(line: 43, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 41, column: 5)
!33 = !DILocation(line: 43, column: 16, scope: !32)
!34 = !DILocation(line: 43, column: 14, scope: !32)
!35 = !DILocation(line: 44, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 44, column: 13)
!37 = !DILocation(line: 44, column: 18, scope: !36)
!38 = !DILocation(line: 44, column: 13, scope: !32)
!39 = !DILocation(line: 44, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 44, column: 27)
!41 = !DILocation(line: 45, column: 9, scope: !32)
!42 = !DILocation(line: 45, column: 17, scope: !32)
!43 = !DILocation(line: 46, column: 5, scope: !32)
!44 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 48, type: !46)
!45 = distinct !DILexicalBlock(scope: !22, file: !15, line: 47, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 48, column: 17, scope: !45)
!50 = !DILocation(line: 49, column: 17, scope: !45)
!51 = !DILocation(line: 49, column: 9, scope: !45)
!52 = !DILocation(line: 50, column: 9, scope: !45)
!53 = !DILocation(line: 50, column: 23, scope: !45)
!54 = !DILocation(line: 52, column: 18, scope: !45)
!55 = !DILocation(line: 52, column: 36, scope: !45)
!56 = !DILocation(line: 52, column: 9, scope: !45)
!57 = !DILocation(line: 53, column: 20, scope: !45)
!58 = !DILocation(line: 53, column: 9, scope: !45)
!59 = !DILocation(line: 54, column: 14, scope: !45)
!60 = !DILocation(line: 54, column: 9, scope: !45)
!61 = !DILocation(line: 56, column: 1, scope: !22)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_05_good", scope: !15, file: !15, line: 113, type: !23, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 115, column: 5, scope: !62)
!64 = !DILocation(line: 116, column: 5, scope: !62)
!65 = !DILocation(line: 117, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 129, type: !67, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!9, !9, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 129, type: !9)
!73 = !DILocation(line: 129, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 129, type: !69)
!75 = !DILocation(line: 129, column: 27, scope: !66)
!76 = !DILocation(line: 132, column: 22, scope: !66)
!77 = !DILocation(line: 132, column: 12, scope: !66)
!78 = !DILocation(line: 132, column: 5, scope: !66)
!79 = !DILocation(line: 134, column: 5, scope: !66)
!80 = !DILocation(line: 135, column: 5, scope: !66)
!81 = !DILocation(line: 136, column: 5, scope: !66)
!82 = !DILocation(line: 139, column: 5, scope: !66)
!83 = !DILocation(line: 140, column: 5, scope: !66)
!84 = !DILocation(line: 141, column: 5, scope: !66)
!85 = !DILocation(line: 143, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 63, type: !23, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 65, type: !6)
!88 = !DILocation(line: 65, column: 15, scope: !86)
!89 = !DILocation(line: 66, column: 10, scope: !86)
!90 = !DILocation(line: 67, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !15, line: 67, column: 8)
!92 = !DILocation(line: 67, column: 8, scope: !86)
!93 = !DILocation(line: 70, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 68, column: 5)
!95 = !DILocation(line: 71, column: 5, scope: !94)
!96 = !DILocation(line: 75, column: 27, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !15, line: 73, column: 5)
!98 = !DILocation(line: 75, column: 16, scope: !97)
!99 = !DILocation(line: 75, column: 14, scope: !97)
!100 = !DILocation(line: 76, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 76, column: 13)
!102 = !DILocation(line: 76, column: 18, scope: !101)
!103 = !DILocation(line: 76, column: 13, scope: !97)
!104 = !DILocation(line: 76, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 76, column: 27)
!106 = !DILocation(line: 77, column: 9, scope: !97)
!107 = !DILocation(line: 77, column: 17, scope: !97)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 80, type: !46)
!109 = distinct !DILexicalBlock(scope: !86, file: !15, line: 79, column: 5)
!110 = !DILocation(line: 80, column: 17, scope: !109)
!111 = !DILocation(line: 81, column: 17, scope: !109)
!112 = !DILocation(line: 81, column: 9, scope: !109)
!113 = !DILocation(line: 82, column: 9, scope: !109)
!114 = !DILocation(line: 82, column: 23, scope: !109)
!115 = !DILocation(line: 84, column: 18, scope: !109)
!116 = !DILocation(line: 84, column: 36, scope: !109)
!117 = !DILocation(line: 84, column: 9, scope: !109)
!118 = !DILocation(line: 85, column: 20, scope: !109)
!119 = !DILocation(line: 85, column: 9, scope: !109)
!120 = !DILocation(line: 86, column: 14, scope: !109)
!121 = !DILocation(line: 86, column: 9, scope: !109)
!122 = !DILocation(line: 88, column: 1, scope: !86)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 91, type: !23, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !15, line: 93, type: !6)
!125 = !DILocation(line: 93, column: 15, scope: !123)
!126 = !DILocation(line: 94, column: 10, scope: !123)
!127 = !DILocation(line: 95, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !15, line: 95, column: 8)
!129 = !DILocation(line: 95, column: 8, scope: !123)
!130 = !DILocation(line: 98, column: 27, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 96, column: 5)
!132 = !DILocation(line: 98, column: 16, scope: !131)
!133 = !DILocation(line: 98, column: 14, scope: !131)
!134 = !DILocation(line: 99, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 99, column: 13)
!136 = !DILocation(line: 99, column: 18, scope: !135)
!137 = !DILocation(line: 99, column: 13, scope: !131)
!138 = !DILocation(line: 99, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 99, column: 27)
!140 = !DILocation(line: 100, column: 9, scope: !131)
!141 = !DILocation(line: 100, column: 17, scope: !131)
!142 = !DILocation(line: 101, column: 5, scope: !131)
!143 = !DILocalVariable(name: "source", scope: !144, file: !15, line: 103, type: !46)
!144 = distinct !DILexicalBlock(scope: !123, file: !15, line: 102, column: 5)
!145 = !DILocation(line: 103, column: 17, scope: !144)
!146 = !DILocation(line: 104, column: 17, scope: !144)
!147 = !DILocation(line: 104, column: 9, scope: !144)
!148 = !DILocation(line: 105, column: 9, scope: !144)
!149 = !DILocation(line: 105, column: 23, scope: !144)
!150 = !DILocation(line: 107, column: 18, scope: !144)
!151 = !DILocation(line: 107, column: 36, scope: !144)
!152 = !DILocation(line: 107, column: 9, scope: !144)
!153 = !DILocation(line: 108, column: 20, scope: !144)
!154 = !DILocation(line: 108, column: 9, scope: !144)
!155 = !DILocation(line: 109, column: 14, scope: !144)
!156 = !DILocation(line: 109, column: 9, scope: !144)
!157 = !DILocation(line: 111, column: 1, scope: !123)
