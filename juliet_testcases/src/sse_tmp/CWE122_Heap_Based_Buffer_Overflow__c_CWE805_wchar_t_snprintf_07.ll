; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07_bad() #0 !dbg !20 {
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
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !55
  %5 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %5), !dbg !57
  %6 = load i32*, i32** %data, align 8, !dbg !58
  %7 = bitcast i32* %6 to i8*, !dbg !58
  call void @free(i8* %7) #5, !dbg !59
  ret void, !dbg !60
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %0 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp ne i32 %0, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end3, !dbg !95

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !96
  %1 = bitcast i8* %call to i32*, !dbg !98
  store i32* %1, i32** %data, align 8, !dbg !99
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %cmp1 = icmp eq i32* %2, null, !dbg !102
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !103

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !112
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx5, align 4, !dbg !114
  %4 = load i32*, i32** %data, align 8, !dbg !115
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !117
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !127
  %cmp = icmp eq i32 %0, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.end3, !dbg !130

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !131
  %1 = bitcast i8* %call to i32*, !dbg !133
  store i32* %1, i32** %data, align 8, !dbg !134
  %2 = load i32*, i32** %data, align 8, !dbg !135
  %cmp1 = icmp eq i32* %2, null, !dbg !137
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !138

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  br label %if.end3, !dbg !143

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !147
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx5, align 4, !dbg !150
  %4 = load i32*, i32** %data, align 8, !dbg !151
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !152
  %call7 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %4, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay6) #5, !dbg !153
  %5 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %5), !dbg !155
  %6 = load i32*, i32** %data, align 8, !dbg !156
  %7 = bitcast i32* %6 to i8*, !dbg !156
  call void @free(i8* %7) #5, !dbg !157
  ret void, !dbg !158
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
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07_bad", scope: !13, file: !13, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 37, type: !6)
!24 = !DILocation(line: 37, column: 15, scope: !20)
!25 = !DILocation(line: 38, column: 10, scope: !20)
!26 = !DILocation(line: 39, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 39, column: 8)
!28 = !DILocation(line: 39, column: 18, scope: !27)
!29 = !DILocation(line: 39, column: 8, scope: !20)
!30 = !DILocation(line: 42, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 40, column: 5)
!32 = !DILocation(line: 42, column: 16, scope: !31)
!33 = !DILocation(line: 42, column: 14, scope: !31)
!34 = !DILocation(line: 43, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 43, column: 13)
!36 = !DILocation(line: 43, column: 18, scope: !35)
!37 = !DILocation(line: 43, column: 13, scope: !31)
!38 = !DILocation(line: 43, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 43, column: 27)
!40 = !DILocation(line: 44, column: 9, scope: !31)
!41 = !DILocation(line: 44, column: 17, scope: !31)
!42 = !DILocation(line: 45, column: 5, scope: !31)
!43 = !DILocalVariable(name: "source", scope: !44, file: !13, line: 47, type: !45)
!44 = distinct !DILexicalBlock(scope: !20, file: !13, line: 46, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 47, column: 17, scope: !44)
!49 = !DILocation(line: 48, column: 17, scope: !44)
!50 = !DILocation(line: 48, column: 9, scope: !44)
!51 = !DILocation(line: 49, column: 9, scope: !44)
!52 = !DILocation(line: 49, column: 23, scope: !44)
!53 = !DILocation(line: 51, column: 18, scope: !44)
!54 = !DILocation(line: 51, column: 36, scope: !44)
!55 = !DILocation(line: 51, column: 9, scope: !44)
!56 = !DILocation(line: 52, column: 20, scope: !44)
!57 = !DILocation(line: 52, column: 9, scope: !44)
!58 = !DILocation(line: 53, column: 14, scope: !44)
!59 = !DILocation(line: 53, column: 9, scope: !44)
!60 = !DILocation(line: 55, column: 1, scope: !20)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_07_good", scope: !13, file: !13, line: 112, type: !21, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 114, column: 5, scope: !61)
!63 = !DILocation(line: 115, column: 5, scope: !61)
!64 = !DILocation(line: 116, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 128, type: !66, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!9, !9, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !13, line: 128, type: !9)
!72 = !DILocation(line: 128, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !13, line: 128, type: !68)
!74 = !DILocation(line: 128, column: 27, scope: !65)
!75 = !DILocation(line: 131, column: 22, scope: !65)
!76 = !DILocation(line: 131, column: 12, scope: !65)
!77 = !DILocation(line: 131, column: 5, scope: !65)
!78 = !DILocation(line: 133, column: 5, scope: !65)
!79 = !DILocation(line: 134, column: 5, scope: !65)
!80 = !DILocation(line: 135, column: 5, scope: !65)
!81 = !DILocation(line: 138, column: 5, scope: !65)
!82 = !DILocation(line: 139, column: 5, scope: !65)
!83 = !DILocation(line: 140, column: 5, scope: !65)
!84 = !DILocation(line: 142, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !13, line: 64, type: !6)
!87 = !DILocation(line: 64, column: 15, scope: !85)
!88 = !DILocation(line: 65, column: 10, scope: !85)
!89 = !DILocation(line: 66, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !13, line: 66, column: 8)
!91 = !DILocation(line: 66, column: 18, scope: !90)
!92 = !DILocation(line: 66, column: 8, scope: !85)
!93 = !DILocation(line: 69, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !13, line: 67, column: 5)
!95 = !DILocation(line: 70, column: 5, scope: !94)
!96 = !DILocation(line: 74, column: 27, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !13, line: 72, column: 5)
!98 = !DILocation(line: 74, column: 16, scope: !97)
!99 = !DILocation(line: 74, column: 14, scope: !97)
!100 = !DILocation(line: 75, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 75, column: 13)
!102 = !DILocation(line: 75, column: 18, scope: !101)
!103 = !DILocation(line: 75, column: 13, scope: !97)
!104 = !DILocation(line: 75, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !13, line: 75, column: 27)
!106 = !DILocation(line: 76, column: 9, scope: !97)
!107 = !DILocation(line: 76, column: 17, scope: !97)
!108 = !DILocalVariable(name: "source", scope: !109, file: !13, line: 79, type: !45)
!109 = distinct !DILexicalBlock(scope: !85, file: !13, line: 78, column: 5)
!110 = !DILocation(line: 79, column: 17, scope: !109)
!111 = !DILocation(line: 80, column: 17, scope: !109)
!112 = !DILocation(line: 80, column: 9, scope: !109)
!113 = !DILocation(line: 81, column: 9, scope: !109)
!114 = !DILocation(line: 81, column: 23, scope: !109)
!115 = !DILocation(line: 83, column: 18, scope: !109)
!116 = !DILocation(line: 83, column: 36, scope: !109)
!117 = !DILocation(line: 83, column: 9, scope: !109)
!118 = !DILocation(line: 84, column: 20, scope: !109)
!119 = !DILocation(line: 84, column: 9, scope: !109)
!120 = !DILocation(line: 85, column: 14, scope: !109)
!121 = !DILocation(line: 85, column: 9, scope: !109)
!122 = !DILocation(line: 87, column: 1, scope: !85)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !13, line: 92, type: !6)
!125 = !DILocation(line: 92, column: 15, scope: !123)
!126 = !DILocation(line: 93, column: 10, scope: !123)
!127 = !DILocation(line: 94, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !13, line: 94, column: 8)
!129 = !DILocation(line: 94, column: 18, scope: !128)
!130 = !DILocation(line: 94, column: 8, scope: !123)
!131 = !DILocation(line: 97, column: 27, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !13, line: 95, column: 5)
!133 = !DILocation(line: 97, column: 16, scope: !132)
!134 = !DILocation(line: 97, column: 14, scope: !132)
!135 = !DILocation(line: 98, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 98, column: 13)
!137 = !DILocation(line: 98, column: 18, scope: !136)
!138 = !DILocation(line: 98, column: 13, scope: !132)
!139 = !DILocation(line: 98, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !13, line: 98, column: 27)
!141 = !DILocation(line: 99, column: 9, scope: !132)
!142 = !DILocation(line: 99, column: 17, scope: !132)
!143 = !DILocation(line: 100, column: 5, scope: !132)
!144 = !DILocalVariable(name: "source", scope: !145, file: !13, line: 102, type: !45)
!145 = distinct !DILexicalBlock(scope: !123, file: !13, line: 101, column: 5)
!146 = !DILocation(line: 102, column: 17, scope: !145)
!147 = !DILocation(line: 103, column: 17, scope: !145)
!148 = !DILocation(line: 103, column: 9, scope: !145)
!149 = !DILocation(line: 104, column: 9, scope: !145)
!150 = !DILocation(line: 104, column: 23, scope: !145)
!151 = !DILocation(line: 106, column: 18, scope: !145)
!152 = !DILocation(line: 106, column: 36, scope: !145)
!153 = !DILocation(line: 106, column: 9, scope: !145)
!154 = !DILocation(line: 107, column: 20, scope: !145)
!155 = !DILocation(line: 107, column: 9, scope: !145)
!156 = !DILocation(line: 108, column: 14, scope: !145)
!157 = !DILocation(line: 108, column: 9, scope: !145)
!158 = !DILocation(line: 110, column: 1, scope: !123)
