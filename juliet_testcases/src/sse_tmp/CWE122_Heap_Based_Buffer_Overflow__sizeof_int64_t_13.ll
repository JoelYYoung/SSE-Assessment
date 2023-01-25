; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !29
  %1 = bitcast i8* %call to i64*, !dbg !31
  store i64* %1, i64** %data, align 8, !dbg !32
  %2 = load i64*, i64** %data, align 8, !dbg !33
  %cmp1 = icmp eq i64* %2, null, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !39
  store i64 2147483643, i64* %3, align 8, !dbg !40
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !42
  %5 = load i64, i64* %4, align 8, !dbg !43
  call void @printLongLongLine(i64 %5), !dbg !44
  %6 = load i64*, i64** %data, align 8, !dbg !45
  %7 = bitcast i64* %6 to i8*, !dbg !45
  call void @free(i8* %7) #5, !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i64* null, i64** %data, align 8, !dbg !76
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !77
  %cmp = icmp ne i32 %0, 5, !dbg !79
  br i1 %cmp, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  br label %if.end3, !dbg !83

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !84
  %1 = bitcast i8* %call to i64*, !dbg !86
  store i64* %1, i64** %data, align 8, !dbg !87
  %2 = load i64*, i64** %data, align 8, !dbg !88
  %cmp1 = icmp eq i64* %2, null, !dbg !90
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !91

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %if.else
  %3 = load i64*, i64** %data, align 8, !dbg !94
  store i64 2147483643, i64* %3, align 8, !dbg !95
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load i64*, i64** %data, align 8, !dbg !96
  %5 = load i64, i64* %4, align 8, !dbg !97
  call void @printLongLongLine(i64 %5), !dbg !98
  %6 = load i64*, i64** %data, align 8, !dbg !99
  %7 = bitcast i64* %6 to i8*, !dbg !99
  call void @free(i8* %7) #5, !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i64* null, i64** %data, align 8, !dbg !105
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !106
  %cmp = icmp eq i32 %0, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.end3, !dbg !109

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !110
  %1 = bitcast i8* %call to i64*, !dbg !112
  store i64* %1, i64** %data, align 8, !dbg !113
  %2 = load i64*, i64** %data, align 8, !dbg !114
  %cmp1 = icmp eq i64* %2, null, !dbg !116
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !120
  store i64 2147483643, i64* %3, align 8, !dbg !121
  br label %if.end3, !dbg !122

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !123
  %5 = load i64, i64* %4, align 8, !dbg !124
  call void @printLongLongLine(i64 %5), !dbg !125
  %6 = load i64*, i64** %data, align 8, !dbg !126
  %7 = bitcast i64* %6 to i8*, !dbg !126
  call void @free(i8* %7) #5, !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 25, column: 10, scope: !18)
!25 = !DILocation(line: 26, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 26, column: 8)
!27 = !DILocation(line: 26, column: 25, scope: !26)
!28 = !DILocation(line: 26, column: 8, scope: !18)
!29 = !DILocation(line: 30, column: 27, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !19, line: 27, column: 5)
!31 = !DILocation(line: 30, column: 16, scope: !30)
!32 = !DILocation(line: 30, column: 14, scope: !30)
!33 = !DILocation(line: 31, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 31, column: 13)
!35 = !DILocation(line: 31, column: 18, scope: !34)
!36 = !DILocation(line: 31, column: 13, scope: !30)
!37 = !DILocation(line: 31, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 31, column: 27)
!39 = !DILocation(line: 32, column: 10, scope: !30)
!40 = !DILocation(line: 32, column: 15, scope: !30)
!41 = !DILocation(line: 33, column: 5, scope: !30)
!42 = !DILocation(line: 35, column: 24, scope: !18)
!43 = !DILocation(line: 35, column: 23, scope: !18)
!44 = !DILocation(line: 35, column: 5, scope: !18)
!45 = !DILocation(line: 36, column: 10, scope: !18)
!46 = !DILocation(line: 36, column: 5, scope: !18)
!47 = !DILocation(line: 37, column: 1, scope: !18)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_13_good", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 86, column: 5, scope: !48)
!50 = !DILocation(line: 87, column: 5, scope: !48)
!51 = !DILocation(line: 88, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 100, type: !53, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !19, line: 100, type: !55)
!60 = !DILocation(line: 100, column: 14, scope: !52)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !19, line: 100, type: !56)
!62 = !DILocation(line: 100, column: 27, scope: !52)
!63 = !DILocation(line: 103, column: 22, scope: !52)
!64 = !DILocation(line: 103, column: 12, scope: !52)
!65 = !DILocation(line: 103, column: 5, scope: !52)
!66 = !DILocation(line: 105, column: 5, scope: !52)
!67 = !DILocation(line: 106, column: 5, scope: !52)
!68 = !DILocation(line: 107, column: 5, scope: !52)
!69 = !DILocation(line: 110, column: 5, scope: !52)
!70 = !DILocation(line: 111, column: 5, scope: !52)
!71 = !DILocation(line: 112, column: 5, scope: !52)
!72 = !DILocation(line: 114, column: 5, scope: !52)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 44, type: !20, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !19, line: 46, type: !4)
!75 = !DILocation(line: 46, column: 15, scope: !73)
!76 = !DILocation(line: 48, column: 10, scope: !73)
!77 = !DILocation(line: 49, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !19, line: 49, column: 8)
!79 = !DILocation(line: 49, column: 25, scope: !78)
!80 = !DILocation(line: 49, column: 8, scope: !73)
!81 = !DILocation(line: 52, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !19, line: 50, column: 5)
!83 = !DILocation(line: 53, column: 5, scope: !82)
!84 = !DILocation(line: 57, column: 27, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !19, line: 55, column: 5)
!86 = !DILocation(line: 57, column: 16, scope: !85)
!87 = !DILocation(line: 57, column: 14, scope: !85)
!88 = !DILocation(line: 58, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !19, line: 58, column: 13)
!90 = !DILocation(line: 58, column: 18, scope: !89)
!91 = !DILocation(line: 58, column: 13, scope: !85)
!92 = !DILocation(line: 58, column: 28, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !19, line: 58, column: 27)
!94 = !DILocation(line: 59, column: 10, scope: !85)
!95 = !DILocation(line: 59, column: 15, scope: !85)
!96 = !DILocation(line: 62, column: 24, scope: !73)
!97 = !DILocation(line: 62, column: 23, scope: !73)
!98 = !DILocation(line: 62, column: 5, scope: !73)
!99 = !DILocation(line: 63, column: 10, scope: !73)
!100 = !DILocation(line: 63, column: 5, scope: !73)
!101 = !DILocation(line: 64, column: 1, scope: !73)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !19, line: 69, type: !4)
!104 = !DILocation(line: 69, column: 15, scope: !102)
!105 = !DILocation(line: 71, column: 10, scope: !102)
!106 = !DILocation(line: 72, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !19, line: 72, column: 8)
!108 = !DILocation(line: 72, column: 25, scope: !107)
!109 = !DILocation(line: 72, column: 8, scope: !102)
!110 = !DILocation(line: 75, column: 27, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !19, line: 73, column: 5)
!112 = !DILocation(line: 75, column: 16, scope: !111)
!113 = !DILocation(line: 75, column: 14, scope: !111)
!114 = !DILocation(line: 76, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !19, line: 76, column: 13)
!116 = !DILocation(line: 76, column: 18, scope: !115)
!117 = !DILocation(line: 76, column: 13, scope: !111)
!118 = !DILocation(line: 76, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !19, line: 76, column: 27)
!120 = !DILocation(line: 77, column: 10, scope: !111)
!121 = !DILocation(line: 77, column: 15, scope: !111)
!122 = !DILocation(line: 78, column: 5, scope: !111)
!123 = !DILocation(line: 80, column: 24, scope: !102)
!124 = !DILocation(line: 80, column: 23, scope: !102)
!125 = !DILocation(line: 80, column: 5, scope: !102)
!126 = !DILocation(line: 81, column: 10, scope: !102)
!127 = !DILocation(line: 81, column: 5, scope: !102)
!128 = !DILocation(line: 82, column: 1, scope: !102)
