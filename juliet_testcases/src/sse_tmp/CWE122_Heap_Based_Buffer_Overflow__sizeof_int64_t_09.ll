; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end2, !dbg !27

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !28
  %1 = bitcast i8* %call to i64*, !dbg !30
  store i64* %1, i64** %data, align 8, !dbg !31
  %2 = load i64*, i64** %data, align 8, !dbg !32
  %cmp = icmp eq i64* %2, null, !dbg !34
  br i1 %cmp, label %if.then1, label %if.end, !dbg !35

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !38
  store i64 2147483643, i64* %3, align 8, !dbg !39
  br label %if.end2, !dbg !40

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !41
  %5 = load i64, i64* %4, align 8, !dbg !42
  call void @printLongLongLine(i64 %5), !dbg !43
  %6 = load i64*, i64** %data, align 8, !dbg !44
  %7 = bitcast i64* %6 to i8*, !dbg !44
  call void @free(i8* %7) #5, !dbg !45
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_good() #0 !dbg !47 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i64* null, i64** %data, align 8, !dbg !75
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !76
  %tobool = icmp ne i32 %0, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  br label %if.end2, !dbg !81

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !82
  %1 = bitcast i8* %call to i64*, !dbg !84
  store i64* %1, i64** %data, align 8, !dbg !85
  %2 = load i64*, i64** %data, align 8, !dbg !86
  %cmp = icmp eq i64* %2, null, !dbg !88
  br i1 %cmp, label %if.then1, label %if.end, !dbg !89

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %if.else
  %3 = load i64*, i64** %data, align 8, !dbg !92
  store i64 2147483643, i64* %3, align 8, !dbg !93
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i64*, i64** %data, align 8, !dbg !94
  %5 = load i64, i64* %4, align 8, !dbg !95
  call void @printLongLongLine(i64 %5), !dbg !96
  %6 = load i64*, i64** %data, align 8, !dbg !97
  %7 = bitcast i64* %6 to i8*, !dbg !97
  call void @free(i8* %7) #5, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i64* null, i64** %data, align 8, !dbg !103
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !104
  %tobool = icmp ne i32 %0, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.end2, !dbg !106

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !107
  %1 = bitcast i8* %call to i64*, !dbg !109
  store i64* %1, i64** %data, align 8, !dbg !110
  %2 = load i64*, i64** %data, align 8, !dbg !111
  %cmp = icmp eq i64* %2, null, !dbg !113
  br i1 %cmp, label %if.then1, label %if.end, !dbg !114

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !117
  store i64 2147483643, i64* %3, align 8, !dbg !118
  br label %if.end2, !dbg !119

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !120
  %5 = load i64, i64* %4, align 8, !dbg !121
  call void @printLongLongLine(i64 %5), !dbg !122
  %6 = load i64*, i64** %data, align 8, !dbg !123
  %7 = bitcast i64* %6 to i8*, !dbg !123
  call void @free(i8* %7) #5, !dbg !124
  ret void, !dbg !125
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 25, column: 10, scope: !18)
!25 = !DILocation(line: 26, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 26, column: 8)
!27 = !DILocation(line: 26, column: 8, scope: !18)
!28 = !DILocation(line: 30, column: 27, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 27, column: 5)
!30 = !DILocation(line: 30, column: 16, scope: !29)
!31 = !DILocation(line: 30, column: 14, scope: !29)
!32 = !DILocation(line: 31, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 31, column: 13)
!34 = !DILocation(line: 31, column: 18, scope: !33)
!35 = !DILocation(line: 31, column: 13, scope: !29)
!36 = !DILocation(line: 31, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 31, column: 27)
!38 = !DILocation(line: 32, column: 10, scope: !29)
!39 = !DILocation(line: 32, column: 15, scope: !29)
!40 = !DILocation(line: 33, column: 5, scope: !29)
!41 = !DILocation(line: 35, column: 24, scope: !18)
!42 = !DILocation(line: 35, column: 23, scope: !18)
!43 = !DILocation(line: 35, column: 5, scope: !18)
!44 = !DILocation(line: 36, column: 10, scope: !18)
!45 = !DILocation(line: 36, column: 5, scope: !18)
!46 = !DILocation(line: 37, column: 1, scope: !18)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_09_good", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 86, column: 5, scope: !47)
!49 = !DILocation(line: 87, column: 5, scope: !47)
!50 = !DILocation(line: 88, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 100, type: !52, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !19, line: 100, type: !54)
!59 = !DILocation(line: 100, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !19, line: 100, type: !55)
!61 = !DILocation(line: 100, column: 27, scope: !51)
!62 = !DILocation(line: 103, column: 22, scope: !51)
!63 = !DILocation(line: 103, column: 12, scope: !51)
!64 = !DILocation(line: 103, column: 5, scope: !51)
!65 = !DILocation(line: 105, column: 5, scope: !51)
!66 = !DILocation(line: 106, column: 5, scope: !51)
!67 = !DILocation(line: 107, column: 5, scope: !51)
!68 = !DILocation(line: 110, column: 5, scope: !51)
!69 = !DILocation(line: 111, column: 5, scope: !51)
!70 = !DILocation(line: 112, column: 5, scope: !51)
!71 = !DILocation(line: 114, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 44, type: !20, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !19, line: 46, type: !4)
!74 = !DILocation(line: 46, column: 15, scope: !72)
!75 = !DILocation(line: 48, column: 10, scope: !72)
!76 = !DILocation(line: 49, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !19, line: 49, column: 8)
!78 = !DILocation(line: 49, column: 8, scope: !72)
!79 = !DILocation(line: 52, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !19, line: 50, column: 5)
!81 = !DILocation(line: 53, column: 5, scope: !80)
!82 = !DILocation(line: 57, column: 27, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !19, line: 55, column: 5)
!84 = !DILocation(line: 57, column: 16, scope: !83)
!85 = !DILocation(line: 57, column: 14, scope: !83)
!86 = !DILocation(line: 58, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !19, line: 58, column: 13)
!88 = !DILocation(line: 58, column: 18, scope: !87)
!89 = !DILocation(line: 58, column: 13, scope: !83)
!90 = !DILocation(line: 58, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 58, column: 27)
!92 = !DILocation(line: 59, column: 10, scope: !83)
!93 = !DILocation(line: 59, column: 15, scope: !83)
!94 = !DILocation(line: 62, column: 24, scope: !72)
!95 = !DILocation(line: 62, column: 23, scope: !72)
!96 = !DILocation(line: 62, column: 5, scope: !72)
!97 = !DILocation(line: 63, column: 10, scope: !72)
!98 = !DILocation(line: 63, column: 5, scope: !72)
!99 = !DILocation(line: 64, column: 1, scope: !72)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !19, line: 69, type: !4)
!102 = !DILocation(line: 69, column: 15, scope: !100)
!103 = !DILocation(line: 71, column: 10, scope: !100)
!104 = !DILocation(line: 72, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !19, line: 72, column: 8)
!106 = !DILocation(line: 72, column: 8, scope: !100)
!107 = !DILocation(line: 75, column: 27, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !19, line: 73, column: 5)
!109 = !DILocation(line: 75, column: 16, scope: !108)
!110 = !DILocation(line: 75, column: 14, scope: !108)
!111 = !DILocation(line: 76, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !19, line: 76, column: 13)
!113 = !DILocation(line: 76, column: 18, scope: !112)
!114 = !DILocation(line: 76, column: 13, scope: !108)
!115 = !DILocation(line: 76, column: 28, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !19, line: 76, column: 27)
!117 = !DILocation(line: 77, column: 10, scope: !108)
!118 = !DILocation(line: 77, column: 15, scope: !108)
!119 = !DILocation(line: 78, column: 5, scope: !108)
!120 = !DILocation(line: 80, column: 24, scope: !100)
!121 = !DILocation(line: 80, column: 23, scope: !100)
!122 = !DILocation(line: 80, column: 5, scope: !100)
!123 = !DILocation(line: 81, column: 10, scope: !100)
!124 = !DILocation(line: 81, column: 5, scope: !100)
!125 = !DILocation(line: 82, column: 1, scope: !100)
