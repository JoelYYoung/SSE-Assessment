; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

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
  br label %if.end7, !dbg !40

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !41
  %3 = bitcast i8* %call3 to i64*, !dbg !43
  store i64* %3, i64** %data, align 8, !dbg !44
  %4 = load i64*, i64** %data, align 8, !dbg !45
  %cmp4 = icmp eq i64* %4, null, !dbg !47
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !48

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !49
  unreachable, !dbg !49

if.end6:                                          ; preds = %if.else
  %5 = load i64*, i64** %data, align 8, !dbg !51
  store i64 2147483643, i64* %5, align 8, !dbg !52
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %6 = load i64*, i64** %data, align 8, !dbg !53
  %7 = load i64, i64* %6, align 8, !dbg !54
  call void @printLongLongLine(i64 %7), !dbg !55
  %8 = load i64*, i64** %data, align 8, !dbg !56
  %9 = bitcast i64* %8 to i8*, !dbg !56
  call void @free(i8* %9) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i64* null, i64** %data, align 8, !dbg !86
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !90
  %0 = bitcast i8* %call1 to i64*, !dbg !92
  store i64* %0, i64** %data, align 8, !dbg !93
  %1 = load i64*, i64** %data, align 8, !dbg !94
  %cmp = icmp eq i64* %1, null, !dbg !96
  br i1 %cmp, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %if.then
  %2 = load i64*, i64** %data, align 8, !dbg !100
  store i64 2147483643, i64* %2, align 8, !dbg !101
  br label %if.end7, !dbg !102

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !103
  %3 = bitcast i8* %call3 to i64*, !dbg !105
  store i64* %3, i64** %data, align 8, !dbg !106
  %4 = load i64*, i64** %data, align 8, !dbg !107
  %cmp4 = icmp eq i64* %4, null, !dbg !109
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !110

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !111
  unreachable, !dbg !111

if.end6:                                          ; preds = %if.else
  %5 = load i64*, i64** %data, align 8, !dbg !113
  store i64 2147483643, i64* %5, align 8, !dbg !114
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %6 = load i64*, i64** %data, align 8, !dbg !115
  %7 = load i64, i64* %6, align 8, !dbg !116
  call void @printLongLongLine(i64 %7), !dbg !117
  %8 = load i64*, i64** %data, align 8, !dbg !118
  %9 = bitcast i64* %8 to i8*, !dbg !118
  call void @free(i8* %9) #5, !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12.c", directory: "/root/SSE-Assessment")
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
!41 = !DILocation(line: 37, column: 27, scope: !42)
!42 = distinct !DILexicalBlock(scope: !26, file: !19, line: 35, column: 5)
!43 = !DILocation(line: 37, column: 16, scope: !42)
!44 = !DILocation(line: 37, column: 14, scope: !42)
!45 = !DILocation(line: 38, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !19, line: 38, column: 13)
!47 = !DILocation(line: 38, column: 18, scope: !46)
!48 = !DILocation(line: 38, column: 13, scope: !42)
!49 = !DILocation(line: 38, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !19, line: 38, column: 27)
!51 = !DILocation(line: 39, column: 10, scope: !42)
!52 = !DILocation(line: 39, column: 15, scope: !42)
!53 = !DILocation(line: 42, column: 24, scope: !18)
!54 = !DILocation(line: 42, column: 23, scope: !18)
!55 = !DILocation(line: 42, column: 5, scope: !18)
!56 = !DILocation(line: 43, column: 10, scope: !18)
!57 = !DILocation(line: 43, column: 5, scope: !18)
!58 = !DILocation(line: 44, column: 1, scope: !18)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_12_good", scope: !19, file: !19, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 78, column: 5, scope: !59)
!61 = !DILocation(line: 79, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 91, type: !63, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !19, line: 91, type: !65)
!70 = !DILocation(line: 91, column: 14, scope: !62)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !19, line: 91, type: !66)
!72 = !DILocation(line: 91, column: 27, scope: !62)
!73 = !DILocation(line: 94, column: 22, scope: !62)
!74 = !DILocation(line: 94, column: 12, scope: !62)
!75 = !DILocation(line: 94, column: 5, scope: !62)
!76 = !DILocation(line: 96, column: 5, scope: !62)
!77 = !DILocation(line: 97, column: 5, scope: !62)
!78 = !DILocation(line: 98, column: 5, scope: !62)
!79 = !DILocation(line: 101, column: 5, scope: !62)
!80 = !DILocation(line: 102, column: 5, scope: !62)
!81 = !DILocation(line: 103, column: 5, scope: !62)
!82 = !DILocation(line: 105, column: 5, scope: !62)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !19, line: 54, type: !4)
!85 = !DILocation(line: 54, column: 15, scope: !83)
!86 = !DILocation(line: 56, column: 10, scope: !83)
!87 = !DILocation(line: 57, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !19, line: 57, column: 8)
!89 = !DILocation(line: 57, column: 8, scope: !83)
!90 = !DILocation(line: 60, column: 27, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !19, line: 58, column: 5)
!92 = !DILocation(line: 60, column: 16, scope: !91)
!93 = !DILocation(line: 60, column: 14, scope: !91)
!94 = !DILocation(line: 61, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 61, column: 13)
!96 = !DILocation(line: 61, column: 18, scope: !95)
!97 = !DILocation(line: 61, column: 13, scope: !91)
!98 = !DILocation(line: 61, column: 28, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !19, line: 61, column: 27)
!100 = !DILocation(line: 62, column: 10, scope: !91)
!101 = !DILocation(line: 62, column: 15, scope: !91)
!102 = !DILocation(line: 63, column: 5, scope: !91)
!103 = !DILocation(line: 67, column: 27, scope: !104)
!104 = distinct !DILexicalBlock(scope: !88, file: !19, line: 65, column: 5)
!105 = !DILocation(line: 67, column: 16, scope: !104)
!106 = !DILocation(line: 67, column: 14, scope: !104)
!107 = !DILocation(line: 68, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !19, line: 68, column: 13)
!109 = !DILocation(line: 68, column: 18, scope: !108)
!110 = !DILocation(line: 68, column: 13, scope: !104)
!111 = !DILocation(line: 68, column: 28, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !19, line: 68, column: 27)
!113 = !DILocation(line: 69, column: 10, scope: !104)
!114 = !DILocation(line: 69, column: 15, scope: !104)
!115 = !DILocation(line: 72, column: 24, scope: !83)
!116 = !DILocation(line: 72, column: 23, scope: !83)
!117 = !DILocation(line: 72, column: 5, scope: !83)
!118 = !DILocation(line: 73, column: 10, scope: !83)
!119 = !DILocation(line: 73, column: 5, scope: !83)
!120 = !DILocation(line: 74, column: 1, scope: !83)
