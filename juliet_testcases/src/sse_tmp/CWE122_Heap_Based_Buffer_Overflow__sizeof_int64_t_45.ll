; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_goodG2BData = internal global i64* null, align 8, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_bad() #0 !dbg !24 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !30
  %0 = bitcast i8* %call to i64*, !dbg !31
  store i64* %0, i64** %data, align 8, !dbg !32
  %1 = load i64*, i64** %data, align 8, !dbg !33
  %cmp = icmp eq i64* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !39
  store i64 2147483643, i64* %2, align 8, !dbg !40
  %3 = load i64*, i64** %data, align 8, !dbg !41
  store i64* %3, i64** @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_badData, align 8, !dbg !42
  call void @badSink(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_badData, align 8, !dbg !72
  store i64* %0, i64** %data, align 8, !dbg !71
  %1 = load i64*, i64** %data, align 8, !dbg !73
  %2 = load i64, i64* %1, align 8, !dbg !74
  call void @printLongLongLine(i64 %2), !dbg !75
  %3 = load i64*, i64** %data, align 8, !dbg !76
  %4 = bitcast i64* %3 to i8*, !dbg !76
  call void @free(i8* %4) #5, !dbg !77
  ret void, !dbg !78
}

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i64* null, i64** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !83
  %0 = bitcast i8* %call to i64*, !dbg !84
  store i64* %0, i64** %data, align 8, !dbg !85
  %1 = load i64*, i64** %data, align 8, !dbg !86
  %cmp = icmp eq i64* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !92
  store i64 2147483643, i64* %2, align 8, !dbg !93
  %3 = load i64*, i64** %data, align 8, !dbg !94
  store i64* %3, i64** @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_goodG2BData, align 8, !dbg !95
  call void @goodG2BSink(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_goodG2BData, align 8, !dbg !101
  store i64* %0, i64** %data, align 8, !dbg !100
  %1 = load i64*, i64** %data, align 8, !dbg !102
  %2 = load i64, i64* %1, align 8, !dbg !103
  call void @printLongLongLine(i64 %2), !dbg !104
  %3 = load i64*, i64** %data, align 8, !dbg !105
  %4 = bitcast i64* %3 to i8*, !dbg !105
  call void @free(i8* %4) #5, !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_badData", scope: !2, file: !17, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_goodG2BData", scope: !2, file: !17, line: 20, type: !6, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_bad", scope: !17, file: !17, line: 32, type: !25, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !17, line: 34, type: !6)
!28 = !DILocation(line: 34, column: 15, scope: !24)
!29 = !DILocation(line: 36, column: 10, scope: !24)
!30 = !DILocation(line: 39, column: 23, scope: !24)
!31 = !DILocation(line: 39, column: 12, scope: !24)
!32 = !DILocation(line: 39, column: 10, scope: !24)
!33 = !DILocation(line: 40, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !17, line: 40, column: 9)
!35 = !DILocation(line: 40, column: 14, scope: !34)
!36 = !DILocation(line: 40, column: 9, scope: !24)
!37 = !DILocation(line: 40, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 40, column: 23)
!39 = !DILocation(line: 41, column: 6, scope: !24)
!40 = !DILocation(line: 41, column: 11, scope: !24)
!41 = !DILocation(line: 42, column: 68, scope: !24)
!42 = !DILocation(line: 42, column: 66, scope: !24)
!43 = !DILocation(line: 43, column: 5, scope: !24)
!44 = !DILocation(line: 44, column: 1, scope: !24)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_45_good", scope: !17, file: !17, line: 72, type: !25, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DILocation(line: 74, column: 5, scope: !45)
!47 = !DILocation(line: 75, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 86, type: !49, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !17, line: 86, type: !51)
!56 = !DILocation(line: 86, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !17, line: 86, type: !52)
!58 = !DILocation(line: 86, column: 27, scope: !48)
!59 = !DILocation(line: 89, column: 22, scope: !48)
!60 = !DILocation(line: 89, column: 12, scope: !48)
!61 = !DILocation(line: 89, column: 5, scope: !48)
!62 = !DILocation(line: 91, column: 5, scope: !48)
!63 = !DILocation(line: 92, column: 5, scope: !48)
!64 = !DILocation(line: 93, column: 5, scope: !48)
!65 = !DILocation(line: 96, column: 5, scope: !48)
!66 = !DILocation(line: 97, column: 5, scope: !48)
!67 = !DILocation(line: 98, column: 5, scope: !48)
!68 = !DILocation(line: 100, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 24, type: !25, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocalVariable(name: "data", scope: !69, file: !17, line: 26, type: !6)
!71 = !DILocation(line: 26, column: 15, scope: !69)
!72 = !DILocation(line: 26, column: 22, scope: !69)
!73 = !DILocation(line: 28, column: 24, scope: !69)
!74 = !DILocation(line: 28, column: 23, scope: !69)
!75 = !DILocation(line: 28, column: 5, scope: !69)
!76 = !DILocation(line: 29, column: 10, scope: !69)
!77 = !DILocation(line: 29, column: 5, scope: !69)
!78 = !DILocation(line: 30, column: 1, scope: !69)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !25, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 61, type: !6)
!81 = !DILocation(line: 61, column: 15, scope: !79)
!82 = !DILocation(line: 63, column: 10, scope: !79)
!83 = !DILocation(line: 65, column: 23, scope: !79)
!84 = !DILocation(line: 65, column: 12, scope: !79)
!85 = !DILocation(line: 65, column: 10, scope: !79)
!86 = !DILocation(line: 66, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !17, line: 66, column: 9)
!88 = !DILocation(line: 66, column: 14, scope: !87)
!89 = !DILocation(line: 66, column: 9, scope: !79)
!90 = !DILocation(line: 66, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !17, line: 66, column: 23)
!92 = !DILocation(line: 67, column: 6, scope: !79)
!93 = !DILocation(line: 67, column: 11, scope: !79)
!94 = !DILocation(line: 68, column: 72, scope: !79)
!95 = !DILocation(line: 68, column: 70, scope: !79)
!96 = !DILocation(line: 69, column: 5, scope: !79)
!97 = !DILocation(line: 70, column: 1, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 51, type: !25, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 53, type: !6)
!100 = !DILocation(line: 53, column: 15, scope: !98)
!101 = !DILocation(line: 53, column: 22, scope: !98)
!102 = !DILocation(line: 55, column: 24, scope: !98)
!103 = !DILocation(line: 55, column: 23, scope: !98)
!104 = !DILocation(line: 55, column: 5, scope: !98)
!105 = !DILocation(line: 56, column: 10, scope: !98)
!106 = !DILocation(line: 56, column: 5, scope: !98)
!107 = !DILocation(line: 57, column: 1, scope: !98)
