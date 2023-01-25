; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end3, !dbg !27

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !28
  %0 = bitcast i8* %call1 to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load i64*, i64** %data, align 8, !dbg !32
  %cmp = icmp eq i64* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i64*, i64** %data, align 8, !dbg !38
  store i64 2147483643, i64* %2, align 8, !dbg !39
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data, align 8, !dbg !41
  %4 = load i64, i64* %3, align 8, !dbg !42
  call void @printLongLongLine(i64 %4), !dbg !43
  %5 = load i64*, i64** %data, align 8, !dbg !44
  %6 = bitcast i64* %5 to i8*, !dbg !44
  call void @free(i8* %6) #5, !dbg !45
  ret void, !dbg !46
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i64* null, i64** %data, align 8, !dbg !79
  %call = call i32 @staticReturnsFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end3, !dbg !85

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !86
  %0 = bitcast i8* %call1 to i64*, !dbg !88
  store i64* %0, i64** %data, align 8, !dbg !89
  %1 = load i64*, i64** %data, align 8, !dbg !90
  %cmp = icmp eq i64* %1, null, !dbg !92
  br i1 %cmp, label %if.then2, label %if.end, !dbg !93

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.else
  %2 = load i64*, i64** %data, align 8, !dbg !96
  store i64 2147483643, i64* %2, align 8, !dbg !97
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !98
  %4 = load i64, i64* %3, align 8, !dbg !99
  call void @printLongLongLine(i64 %4), !dbg !100
  %5 = load i64*, i64** %data, align 8, !dbg !101
  %6 = bitcast i64* %5 to i8*, !dbg !101
  call void @free(i8* %6) #5, !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !104 {
entry:
  ret i32 0, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i64* null, i64** %data, align 8, !dbg !109
  %call = call i32 @staticReturnsTrue(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end3, !dbg !112

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !113
  %0 = bitcast i8* %call1 to i64*, !dbg !115
  store i64* %0, i64** %data, align 8, !dbg !116
  %1 = load i64*, i64** %data, align 8, !dbg !117
  %cmp = icmp eq i64* %1, null, !dbg !119
  br i1 %cmp, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.then
  %2 = load i64*, i64** %data, align 8, !dbg !123
  store i64 2147483643, i64* %2, align 8, !dbg !124
  br label %if.end3, !dbg !125

if.end3:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data, align 8, !dbg !126
  %4 = load i64, i64* %3, align 8, !dbg !127
  call void @printLongLongLine(i64 %4), !dbg !128
  %5 = load i64*, i64** %data, align 8, !dbg !129
  %6 = bitcast i64* %5 to i8*, !dbg !129
  call void @free(i8* %6) #5, !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_bad", scope: !19, file: !19, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 37, type: !4)
!23 = !DILocation(line: 37, column: 15, scope: !18)
!24 = !DILocation(line: 39, column: 10, scope: !18)
!25 = !DILocation(line: 40, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 40, column: 8)
!27 = !DILocation(line: 40, column: 8, scope: !18)
!28 = !DILocation(line: 44, column: 27, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 41, column: 5)
!30 = !DILocation(line: 44, column: 16, scope: !29)
!31 = !DILocation(line: 44, column: 14, scope: !29)
!32 = !DILocation(line: 45, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 45, column: 13)
!34 = !DILocation(line: 45, column: 18, scope: !33)
!35 = !DILocation(line: 45, column: 13, scope: !29)
!36 = !DILocation(line: 45, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 45, column: 27)
!38 = !DILocation(line: 46, column: 10, scope: !29)
!39 = !DILocation(line: 46, column: 15, scope: !29)
!40 = !DILocation(line: 47, column: 5, scope: !29)
!41 = !DILocation(line: 49, column: 24, scope: !18)
!42 = !DILocation(line: 49, column: 23, scope: !18)
!43 = !DILocation(line: 49, column: 5, scope: !18)
!44 = !DILocation(line: 50, column: 10, scope: !18)
!45 = !DILocation(line: 50, column: 5, scope: !18)
!46 = !DILocation(line: 51, column: 1, scope: !18)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_08_good", scope: !19, file: !19, line: 98, type: !20, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 100, column: 5, scope: !47)
!49 = !DILocation(line: 101, column: 5, scope: !47)
!50 = !DILocation(line: 102, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 114, type: !52, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !19, line: 114, type: !54)
!59 = !DILocation(line: 114, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !19, line: 114, type: !55)
!61 = !DILocation(line: 114, column: 27, scope: !51)
!62 = !DILocation(line: 117, column: 22, scope: !51)
!63 = !DILocation(line: 117, column: 12, scope: !51)
!64 = !DILocation(line: 117, column: 5, scope: !51)
!65 = !DILocation(line: 119, column: 5, scope: !51)
!66 = !DILocation(line: 120, column: 5, scope: !51)
!67 = !DILocation(line: 121, column: 5, scope: !51)
!68 = !DILocation(line: 124, column: 5, scope: !51)
!69 = !DILocation(line: 125, column: 5, scope: !51)
!70 = !DILocation(line: 126, column: 5, scope: !51)
!71 = !DILocation(line: 128, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !19, file: !19, line: 23, type: !73, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!54}
!75 = !DILocation(line: 25, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !19, line: 60, type: !4)
!78 = !DILocation(line: 60, column: 15, scope: !76)
!79 = !DILocation(line: 62, column: 10, scope: !76)
!80 = !DILocation(line: 63, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !19, line: 63, column: 8)
!82 = !DILocation(line: 63, column: 8, scope: !76)
!83 = !DILocation(line: 66, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !19, line: 64, column: 5)
!85 = !DILocation(line: 67, column: 5, scope: !84)
!86 = !DILocation(line: 71, column: 27, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !19, line: 69, column: 5)
!88 = !DILocation(line: 71, column: 16, scope: !87)
!89 = !DILocation(line: 71, column: 14, scope: !87)
!90 = !DILocation(line: 72, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 72, column: 13)
!92 = !DILocation(line: 72, column: 18, scope: !91)
!93 = !DILocation(line: 72, column: 13, scope: !87)
!94 = !DILocation(line: 72, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 72, column: 27)
!96 = !DILocation(line: 73, column: 10, scope: !87)
!97 = !DILocation(line: 73, column: 15, scope: !87)
!98 = !DILocation(line: 76, column: 24, scope: !76)
!99 = !DILocation(line: 76, column: 23, scope: !76)
!100 = !DILocation(line: 76, column: 5, scope: !76)
!101 = !DILocation(line: 77, column: 10, scope: !76)
!102 = !DILocation(line: 77, column: 5, scope: !76)
!103 = !DILocation(line: 78, column: 1, scope: !76)
!104 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !19, file: !19, line: 28, type: !73, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocation(line: 30, column: 5, scope: !104)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !19, line: 83, type: !4)
!108 = !DILocation(line: 83, column: 15, scope: !106)
!109 = !DILocation(line: 85, column: 10, scope: !106)
!110 = !DILocation(line: 86, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !19, line: 86, column: 8)
!112 = !DILocation(line: 86, column: 8, scope: !106)
!113 = !DILocation(line: 89, column: 27, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !19, line: 87, column: 5)
!115 = !DILocation(line: 89, column: 16, scope: !114)
!116 = !DILocation(line: 89, column: 14, scope: !114)
!117 = !DILocation(line: 90, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !19, line: 90, column: 13)
!119 = !DILocation(line: 90, column: 18, scope: !118)
!120 = !DILocation(line: 90, column: 13, scope: !114)
!121 = !DILocation(line: 90, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !19, line: 90, column: 27)
!123 = !DILocation(line: 91, column: 10, scope: !114)
!124 = !DILocation(line: 91, column: 15, scope: !114)
!125 = !DILocation(line: 92, column: 5, scope: !114)
!126 = !DILocation(line: 94, column: 24, scope: !106)
!127 = !DILocation(line: 94, column: 23, scope: !106)
!128 = !DILocation(line: 94, column: 5, scope: !106)
!129 = !DILocation(line: 95, column: 10, scope: !106)
!130 = !DILocation(line: 95, column: 5, scope: !106)
!131 = !DILocation(line: 96, column: 1, scope: !106)
