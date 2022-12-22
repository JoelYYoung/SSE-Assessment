; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %0 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end3, !dbg !32

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !33
  %1 = bitcast i8* %call to i64*, !dbg !35
  store i64* %1, i64** %data, align 8, !dbg !36
  %2 = load i64*, i64** %data, align 8, !dbg !37
  %cmp1 = icmp eq i64* %2, null, !dbg !39
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !40

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !43
  store i64 2147483643, i64* %3, align 8, !dbg !44
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !46
  %5 = load i64, i64* %4, align 8, !dbg !47
  call void @printLongLongLine(i64 %5), !dbg !48
  %6 = load i64*, i64** %data, align 8, !dbg !49
  %7 = bitcast i64* %6 to i8*, !dbg !49
  call void @free(i8* %7) #5, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i64* null, i64** %data, align 8, !dbg !79
  %0 = load i32, i32* @staticFive, align 4, !dbg !80
  %cmp = icmp ne i32 %0, 5, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end3, !dbg !86

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !87
  %1 = bitcast i8* %call to i64*, !dbg !89
  store i64* %1, i64** %data, align 8, !dbg !90
  %2 = load i64*, i64** %data, align 8, !dbg !91
  %cmp1 = icmp eq i64* %2, null, !dbg !93
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !94

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %if.else
  %3 = load i64*, i64** %data, align 8, !dbg !97
  store i64 2147483643, i64* %3, align 8, !dbg !98
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load i64*, i64** %data, align 8, !dbg !99
  %5 = load i64, i64* %4, align 8, !dbg !100
  call void @printLongLongLine(i64 %5), !dbg !101
  %6 = load i64*, i64** %data, align 8, !dbg !102
  %7 = bitcast i64* %6 to i8*, !dbg !102
  call void @free(i8* %7) #5, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i64* null, i64** %data, align 8, !dbg !108
  %0 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp eq i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end3, !dbg !112

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !113
  %1 = bitcast i8* %call to i64*, !dbg !115
  store i64* %1, i64** %data, align 8, !dbg !116
  %2 = load i64*, i64** %data, align 8, !dbg !117
  %cmp1 = icmp eq i64* %2, null, !dbg !119
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !123
  store i64 2147483643, i64* %3, align 8, !dbg !124
  br label %if.end3, !dbg !125

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !126
  %5 = load i64, i64* %4, align 8, !dbg !127
  call void @printLongLongLine(i64 %5), !dbg !128
  %6 = load i64*, i64** %data, align 8, !dbg !129
  %7 = bitcast i64* %6 to i8*, !dbg !129
  call void @free(i8* %7) #5, !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !15, line: 23, type: !16, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0}
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07.c", directory: "/root/SSE-Assessment")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_bad", scope: !15, file: !15, line: 27, type: !24, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 29, type: !6)
!27 = !DILocation(line: 29, column: 15, scope: !23)
!28 = !DILocation(line: 31, column: 10, scope: !23)
!29 = !DILocation(line: 32, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !15, line: 32, column: 8)
!31 = !DILocation(line: 32, column: 18, scope: !30)
!32 = !DILocation(line: 32, column: 8, scope: !23)
!33 = !DILocation(line: 36, column: 27, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 33, column: 5)
!35 = !DILocation(line: 36, column: 16, scope: !34)
!36 = !DILocation(line: 36, column: 14, scope: !34)
!37 = !DILocation(line: 37, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 37, column: 13)
!39 = !DILocation(line: 37, column: 18, scope: !38)
!40 = !DILocation(line: 37, column: 13, scope: !34)
!41 = !DILocation(line: 37, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 37, column: 27)
!43 = !DILocation(line: 38, column: 10, scope: !34)
!44 = !DILocation(line: 38, column: 15, scope: !34)
!45 = !DILocation(line: 39, column: 5, scope: !34)
!46 = !DILocation(line: 41, column: 24, scope: !23)
!47 = !DILocation(line: 41, column: 23, scope: !23)
!48 = !DILocation(line: 41, column: 5, scope: !23)
!49 = !DILocation(line: 42, column: 10, scope: !23)
!50 = !DILocation(line: 42, column: 5, scope: !23)
!51 = !DILocation(line: 43, column: 1, scope: !23)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_07_good", scope: !15, file: !15, line: 90, type: !24, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 92, column: 5, scope: !52)
!54 = !DILocation(line: 93, column: 5, scope: !52)
!55 = !DILocation(line: 94, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 106, type: !57, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!16, !16, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 106, type: !16)
!63 = !DILocation(line: 106, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 106, type: !59)
!65 = !DILocation(line: 106, column: 27, scope: !56)
!66 = !DILocation(line: 109, column: 22, scope: !56)
!67 = !DILocation(line: 109, column: 12, scope: !56)
!68 = !DILocation(line: 109, column: 5, scope: !56)
!69 = !DILocation(line: 111, column: 5, scope: !56)
!70 = !DILocation(line: 112, column: 5, scope: !56)
!71 = !DILocation(line: 113, column: 5, scope: !56)
!72 = !DILocation(line: 116, column: 5, scope: !56)
!73 = !DILocation(line: 117, column: 5, scope: !56)
!74 = !DILocation(line: 118, column: 5, scope: !56)
!75 = !DILocation(line: 120, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 50, type: !24, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 52, type: !6)
!78 = !DILocation(line: 52, column: 15, scope: !76)
!79 = !DILocation(line: 54, column: 10, scope: !76)
!80 = !DILocation(line: 55, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !15, line: 55, column: 8)
!82 = !DILocation(line: 55, column: 18, scope: !81)
!83 = !DILocation(line: 55, column: 8, scope: !76)
!84 = !DILocation(line: 58, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 56, column: 5)
!86 = !DILocation(line: 59, column: 5, scope: !85)
!87 = !DILocation(line: 63, column: 27, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !15, line: 61, column: 5)
!89 = !DILocation(line: 63, column: 16, scope: !88)
!90 = !DILocation(line: 63, column: 14, scope: !88)
!91 = !DILocation(line: 64, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 64, column: 13)
!93 = !DILocation(line: 64, column: 18, scope: !92)
!94 = !DILocation(line: 64, column: 13, scope: !88)
!95 = !DILocation(line: 64, column: 28, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 64, column: 27)
!97 = !DILocation(line: 65, column: 10, scope: !88)
!98 = !DILocation(line: 65, column: 15, scope: !88)
!99 = !DILocation(line: 68, column: 24, scope: !76)
!100 = !DILocation(line: 68, column: 23, scope: !76)
!101 = !DILocation(line: 68, column: 5, scope: !76)
!102 = !DILocation(line: 69, column: 10, scope: !76)
!103 = !DILocation(line: 69, column: 5, scope: !76)
!104 = !DILocation(line: 70, column: 1, scope: !76)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 73, type: !24, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 75, type: !6)
!107 = !DILocation(line: 75, column: 15, scope: !105)
!108 = !DILocation(line: 77, column: 10, scope: !105)
!109 = !DILocation(line: 78, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !15, line: 78, column: 8)
!111 = !DILocation(line: 78, column: 18, scope: !110)
!112 = !DILocation(line: 78, column: 8, scope: !105)
!113 = !DILocation(line: 81, column: 27, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 79, column: 5)
!115 = !DILocation(line: 81, column: 16, scope: !114)
!116 = !DILocation(line: 81, column: 14, scope: !114)
!117 = !DILocation(line: 82, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 82, column: 13)
!119 = !DILocation(line: 82, column: 18, scope: !118)
!120 = !DILocation(line: 82, column: 13, scope: !114)
!121 = !DILocation(line: 82, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 82, column: 27)
!123 = !DILocation(line: 83, column: 10, scope: !114)
!124 = !DILocation(line: 83, column: 15, scope: !114)
!125 = !DILocation(line: 84, column: 5, scope: !114)
!126 = !DILocation(line: 86, column: 24, scope: !105)
!127 = !DILocation(line: 86, column: 23, scope: !105)
!128 = !DILocation(line: 86, column: 5, scope: !105)
!129 = !DILocation(line: 87, column: 10, scope: !105)
!130 = !DILocation(line: 87, column: 5, scope: !105)
!131 = !DILocation(line: 88, column: 1, scope: !105)
