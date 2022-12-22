; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !32
  %0 = bitcast i8* %call to i64*, !dbg !33
  store i64* %0, i64** %data, align 8, !dbg !34
  %1 = load i64*, i64** %data, align 8, !dbg !35
  %cmp = icmp eq i64* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !41
  store i64 2147483643, i64* %2, align 8, !dbg !42
  %3 = load i64*, i64** %data, align 8, !dbg !43
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType* %myUnion to i64**, !dbg !44
  store i64* %3, i64** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType* %myUnion to i64**, !dbg !49
  %4 = load i64*, i64** %unionSecond, align 8, !dbg !49
  store i64* %4, i64** %data1, align 8, !dbg !48
  %5 = load i64*, i64** %data1, align 8, !dbg !50
  %6 = load i64, i64* %5, align 8, !dbg !51
  call void @printLongLongLine(i64 %6), !dbg !52
  %7 = load i64*, i64** %data1, align 8, !dbg !53
  %8 = bitcast i64* %7 to i8*, !dbg !53
  call void @free(i8* %8) #5, !dbg !54
  ret void, !dbg !55
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  store i64* null, i64** %data, align 8, !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !86
  %0 = bitcast i8* %call to i64*, !dbg !87
  store i64* %0, i64** %data, align 8, !dbg !88
  %1 = load i64*, i64** %data, align 8, !dbg !89
  %cmp = icmp eq i64* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !95
  store i64 2147483643, i64* %2, align 8, !dbg !96
  %3 = load i64*, i64** %data, align 8, !dbg !97
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType* %myUnion to i64**, !dbg !98
  store i64* %3, i64** %unionFirst, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType* %myUnion to i64**, !dbg !103
  %4 = load i64*, i64** %unionSecond, align 8, !dbg !103
  store i64* %4, i64** %data1, align 8, !dbg !102
  %5 = load i64*, i64** %data1, align 8, !dbg !104
  %6 = load i64, i64* %5, align 8, !dbg !105
  call void @printLongLongLine(i64 %6), !dbg !106
  %7 = load i64*, i64** %data1, align 8, !dbg !107
  %8 = bitcast i64* %7 to i8*, !dbg !107
  call void @free(i8* %8) #5, !dbg !108
  ret void, !dbg !109
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 15, scope: !18)
!24 = !DILocalVariable(name: "myUnion", scope: !18, file: !19, line: 30, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_unionType", file: !19, line: 23, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !19, line: 19, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !19, line: 21, baseType: !4, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !19, line: 22, baseType: !4, size: 64)
!30 = !DILocation(line: 30, column: 68, scope: !18)
!31 = !DILocation(line: 32, column: 10, scope: !18)
!32 = !DILocation(line: 35, column: 23, scope: !18)
!33 = !DILocation(line: 35, column: 12, scope: !18)
!34 = !DILocation(line: 35, column: 10, scope: !18)
!35 = !DILocation(line: 36, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 9)
!37 = !DILocation(line: 36, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 9, scope: !18)
!39 = !DILocation(line: 36, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 36, column: 23)
!41 = !DILocation(line: 37, column: 6, scope: !18)
!42 = !DILocation(line: 37, column: 11, scope: !18)
!43 = !DILocation(line: 38, column: 26, scope: !18)
!44 = !DILocation(line: 38, column: 13, scope: !18)
!45 = !DILocation(line: 38, column: 24, scope: !18)
!46 = !DILocalVariable(name: "data", scope: !47, file: !19, line: 40, type: !4)
!47 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 5)
!48 = !DILocation(line: 40, column: 19, scope: !47)
!49 = !DILocation(line: 40, column: 34, scope: !47)
!50 = !DILocation(line: 42, column: 28, scope: !47)
!51 = !DILocation(line: 42, column: 27, scope: !47)
!52 = !DILocation(line: 42, column: 9, scope: !47)
!53 = !DILocation(line: 43, column: 14, scope: !47)
!54 = !DILocation(line: 43, column: 9, scope: !47)
!55 = !DILocation(line: 45, column: 1, scope: !18)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_34_good", scope: !19, file: !19, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 73, column: 5, scope: !56)
!58 = !DILocation(line: 74, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 85, type: !60, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !19, line: 85, type: !62)
!67 = !DILocation(line: 85, column: 14, scope: !59)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !19, line: 85, type: !63)
!69 = !DILocation(line: 85, column: 27, scope: !59)
!70 = !DILocation(line: 88, column: 22, scope: !59)
!71 = !DILocation(line: 88, column: 12, scope: !59)
!72 = !DILocation(line: 88, column: 5, scope: !59)
!73 = !DILocation(line: 90, column: 5, scope: !59)
!74 = !DILocation(line: 91, column: 5, scope: !59)
!75 = !DILocation(line: 92, column: 5, scope: !59)
!76 = !DILocation(line: 95, column: 5, scope: !59)
!77 = !DILocation(line: 96, column: 5, scope: !59)
!78 = !DILocation(line: 97, column: 5, scope: !59)
!79 = !DILocation(line: 99, column: 5, scope: !59)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !19, line: 54, type: !4)
!82 = !DILocation(line: 54, column: 15, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !19, line: 55, type: !25)
!84 = !DILocation(line: 55, column: 68, scope: !80)
!85 = !DILocation(line: 57, column: 10, scope: !80)
!86 = !DILocation(line: 59, column: 23, scope: !80)
!87 = !DILocation(line: 59, column: 12, scope: !80)
!88 = !DILocation(line: 59, column: 10, scope: !80)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !19, line: 60, column: 9)
!91 = !DILocation(line: 60, column: 14, scope: !90)
!92 = !DILocation(line: 60, column: 9, scope: !80)
!93 = !DILocation(line: 60, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !19, line: 60, column: 23)
!95 = !DILocation(line: 61, column: 6, scope: !80)
!96 = !DILocation(line: 61, column: 11, scope: !80)
!97 = !DILocation(line: 62, column: 26, scope: !80)
!98 = !DILocation(line: 62, column: 13, scope: !80)
!99 = !DILocation(line: 62, column: 24, scope: !80)
!100 = !DILocalVariable(name: "data", scope: !101, file: !19, line: 64, type: !4)
!101 = distinct !DILexicalBlock(scope: !80, file: !19, line: 63, column: 5)
!102 = !DILocation(line: 64, column: 19, scope: !101)
!103 = !DILocation(line: 64, column: 34, scope: !101)
!104 = !DILocation(line: 66, column: 28, scope: !101)
!105 = !DILocation(line: 66, column: 27, scope: !101)
!106 = !DILocation(line: 66, column: 9, scope: !101)
!107 = !DILocation(line: 67, column: 14, scope: !101)
!108 = !DILocation(line: 67, column: 9, scope: !101)
!109 = !DILocation(line: 69, column: 1, scope: !80)
