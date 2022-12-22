; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !33
  %1 = load i64*, i64** %0, align 8, !dbg !34
  store i64* %1, i64** %data1, align 8, !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !35
  %2 = bitcast i8* %call to i64*, !dbg !36
  store i64* %2, i64** %data1, align 8, !dbg !37
  %3 = load i64*, i64** %data1, align 8, !dbg !38
  %cmp = icmp eq i64* %3, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  %4 = load i64*, i64** %data1, align 8, !dbg !44
  store i64 2147483643, i64* %4, align 8, !dbg !45
  %5 = load i64*, i64** %data1, align 8, !dbg !46
  %6 = load i64**, i64*** %dataPtr1, align 8, !dbg !47
  store i64* %5, i64** %6, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !49, metadata !DIExpression()), !dbg !51
  %7 = load i64**, i64*** %dataPtr2, align 8, !dbg !52
  %8 = load i64*, i64** %7, align 8, !dbg !53
  store i64* %8, i64** %data2, align 8, !dbg !51
  %9 = load i64*, i64** %data2, align 8, !dbg !54
  %10 = load i64, i64* %9, align 8, !dbg !55
  call void @printLongLongLine(i64 %10), !dbg !56
  %11 = load i64*, i64** %data2, align 8, !dbg !57
  %12 = bitcast i64* %11 to i8*, !dbg !57
  call void @free(i8* %12) #5, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !87, metadata !DIExpression()), !dbg !88
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !89, metadata !DIExpression()), !dbg !90
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !90
  store i64* null, i64** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !95
  %1 = load i64*, i64** %0, align 8, !dbg !96
  store i64* %1, i64** %data1, align 8, !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !97
  %2 = bitcast i8* %call to i64*, !dbg !98
  store i64* %2, i64** %data1, align 8, !dbg !99
  %3 = load i64*, i64** %data1, align 8, !dbg !100
  %cmp = icmp eq i64* %3, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %4 = load i64*, i64** %data1, align 8, !dbg !106
  store i64 2147483643, i64* %4, align 8, !dbg !107
  %5 = load i64*, i64** %data1, align 8, !dbg !108
  %6 = load i64**, i64*** %dataPtr1, align 8, !dbg !109
  store i64* %5, i64** %6, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !111, metadata !DIExpression()), !dbg !113
  %7 = load i64**, i64*** %dataPtr2, align 8, !dbg !114
  %8 = load i64*, i64** %7, align 8, !dbg !115
  store i64* %8, i64** %data2, align 8, !dbg !113
  %9 = load i64*, i64** %data2, align 8, !dbg !116
  %10 = load i64, i64* %9, align 8, !dbg !117
  call void @printLongLongLine(i64 %10), !dbg !118
  %11 = load i64*, i64** %data2, align 8, !dbg !119
  %12 = bitcast i64* %11 to i8*, !dbg !119
  call void @free(i8* %12) #5, !dbg !120
  ret void, !dbg !121
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 24, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!26 = !DILocation(line: 24, column: 16, scope: !18)
!27 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 25, type: !25)
!28 = !DILocation(line: 25, column: 16, scope: !18)
!29 = !DILocation(line: 27, column: 10, scope: !18)
!30 = !DILocalVariable(name: "data", scope: !31, file: !19, line: 29, type: !4)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 5)
!32 = !DILocation(line: 29, column: 19, scope: !31)
!33 = !DILocation(line: 29, column: 27, scope: !31)
!34 = !DILocation(line: 29, column: 26, scope: !31)
!35 = !DILocation(line: 32, column: 27, scope: !31)
!36 = !DILocation(line: 32, column: 16, scope: !31)
!37 = !DILocation(line: 32, column: 14, scope: !31)
!38 = !DILocation(line: 33, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !19, line: 33, column: 13)
!40 = !DILocation(line: 33, column: 18, scope: !39)
!41 = !DILocation(line: 33, column: 13, scope: !31)
!42 = !DILocation(line: 33, column: 28, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !19, line: 33, column: 27)
!44 = !DILocation(line: 34, column: 10, scope: !31)
!45 = !DILocation(line: 34, column: 15, scope: !31)
!46 = !DILocation(line: 35, column: 21, scope: !31)
!47 = !DILocation(line: 35, column: 10, scope: !31)
!48 = !DILocation(line: 35, column: 19, scope: !31)
!49 = !DILocalVariable(name: "data", scope: !50, file: !19, line: 38, type: !4)
!50 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!51 = !DILocation(line: 38, column: 19, scope: !50)
!52 = !DILocation(line: 38, column: 27, scope: !50)
!53 = !DILocation(line: 38, column: 26, scope: !50)
!54 = !DILocation(line: 40, column: 28, scope: !50)
!55 = !DILocation(line: 40, column: 27, scope: !50)
!56 = !DILocation(line: 40, column: 9, scope: !50)
!57 = !DILocation(line: 41, column: 14, scope: !50)
!58 = !DILocation(line: 41, column: 9, scope: !50)
!59 = !DILocation(line: 43, column: 1, scope: !18)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_32_good", scope: !19, file: !19, line: 73, type: !20, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 75, column: 5, scope: !60)
!62 = !DILocation(line: 76, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 87, type: !64, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !19, line: 87, type: !66)
!71 = !DILocation(line: 87, column: 14, scope: !63)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !19, line: 87, type: !67)
!73 = !DILocation(line: 87, column: 27, scope: !63)
!74 = !DILocation(line: 90, column: 22, scope: !63)
!75 = !DILocation(line: 90, column: 12, scope: !63)
!76 = !DILocation(line: 90, column: 5, scope: !63)
!77 = !DILocation(line: 92, column: 5, scope: !63)
!78 = !DILocation(line: 93, column: 5, scope: !63)
!79 = !DILocation(line: 94, column: 5, scope: !63)
!80 = !DILocation(line: 97, column: 5, scope: !63)
!81 = !DILocation(line: 98, column: 5, scope: !63)
!82 = !DILocation(line: 99, column: 5, scope: !63)
!83 = !DILocation(line: 101, column: 5, scope: !63)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !19, line: 52, type: !4)
!86 = !DILocation(line: 52, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataPtr1", scope: !84, file: !19, line: 53, type: !25)
!88 = !DILocation(line: 53, column: 16, scope: !84)
!89 = !DILocalVariable(name: "dataPtr2", scope: !84, file: !19, line: 54, type: !25)
!90 = !DILocation(line: 54, column: 16, scope: !84)
!91 = !DILocation(line: 56, column: 10, scope: !84)
!92 = !DILocalVariable(name: "data", scope: !93, file: !19, line: 58, type: !4)
!93 = distinct !DILexicalBlock(scope: !84, file: !19, line: 57, column: 5)
!94 = !DILocation(line: 58, column: 19, scope: !93)
!95 = !DILocation(line: 58, column: 27, scope: !93)
!96 = !DILocation(line: 58, column: 26, scope: !93)
!97 = !DILocation(line: 60, column: 27, scope: !93)
!98 = !DILocation(line: 60, column: 16, scope: !93)
!99 = !DILocation(line: 60, column: 14, scope: !93)
!100 = !DILocation(line: 61, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !93, file: !19, line: 61, column: 13)
!102 = !DILocation(line: 61, column: 18, scope: !101)
!103 = !DILocation(line: 61, column: 13, scope: !93)
!104 = !DILocation(line: 61, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !19, line: 61, column: 27)
!106 = !DILocation(line: 62, column: 10, scope: !93)
!107 = !DILocation(line: 62, column: 15, scope: !93)
!108 = !DILocation(line: 63, column: 21, scope: !93)
!109 = !DILocation(line: 63, column: 10, scope: !93)
!110 = !DILocation(line: 63, column: 19, scope: !93)
!111 = !DILocalVariable(name: "data", scope: !112, file: !19, line: 66, type: !4)
!112 = distinct !DILexicalBlock(scope: !84, file: !19, line: 65, column: 5)
!113 = !DILocation(line: 66, column: 19, scope: !112)
!114 = !DILocation(line: 66, column: 27, scope: !112)
!115 = !DILocation(line: 66, column: 26, scope: !112)
!116 = !DILocation(line: 68, column: 28, scope: !112)
!117 = !DILocation(line: 68, column: 27, scope: !112)
!118 = !DILocation(line: 68, column: 9, scope: !112)
!119 = !DILocation(line: 69, column: 14, scope: !112)
!120 = !DILocation(line: 69, column: 9, scope: !112)
!121 = !DILocation(line: 71, column: 1, scope: !84)
