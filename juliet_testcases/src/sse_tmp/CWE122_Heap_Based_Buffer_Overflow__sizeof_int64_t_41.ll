; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_badSink(i64* %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64*, i64** %data.addr, align 8, !dbg !24
  %1 = load i64, i64* %0, align 8, !dbg !25
  call void @printLongLongLine(i64 %1), !dbg !26
  %2 = load i64*, i64** %data.addr, align 8, !dbg !27
  %3 = bitcast i64* %2 to i8*, !dbg !27
  call void @free(i8* %3) #5, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_bad() #0 !dbg !30 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !33, metadata !DIExpression()), !dbg !34
  store i64* null, i64** %data, align 8, !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !36
  %0 = bitcast i8* %call to i64*, !dbg !37
  store i64* %0, i64** %data, align 8, !dbg !38
  %1 = load i64*, i64** %data, align 8, !dbg !39
  %cmp = icmp eq i64* %1, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !45
  store i64 2147483643, i64* %2, align 8, !dbg !46
  %3 = load i64*, i64** %data, align 8, !dbg !47
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_badSink(i64* %3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_goodG2BSink(i64* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i64*, i64** %data.addr, align 8, !dbg !53
  %1 = load i64, i64* %0, align 8, !dbg !54
  call void @printLongLongLine(i64 %1), !dbg !55
  %2 = load i64*, i64** %data.addr, align 8, !dbg !56
  %3 = bitcast i64* %2 to i8*, !dbg !56
  call void @free(i8* %3) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_good() #0 !dbg !59 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_bad(), !dbg !80
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
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !87
  %0 = bitcast i8* %call to i64*, !dbg !88
  store i64* %0, i64** %data, align 8, !dbg !89
  %1 = load i64*, i64** %data, align 8, !dbg !90
  %cmp = icmp eq i64* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !96
  store i64 2147483643, i64* %2, align 8, !dbg !97
  %3 = load i64*, i64** %data, align 8, !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_goodG2BSink(i64* %3), !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_badSink", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !4}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 21, type: !4)
!23 = !DILocation(line: 21, column: 77, scope: !18)
!24 = !DILocation(line: 24, column: 24, scope: !18)
!25 = !DILocation(line: 24, column: 23, scope: !18)
!26 = !DILocation(line: 24, column: 5, scope: !18)
!27 = !DILocation(line: 25, column: 10, scope: !18)
!28 = !DILocation(line: 25, column: 5, scope: !18)
!29 = !DILocation(line: 26, column: 1, scope: !18)
!30 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_bad", scope: !19, file: !19, line: 28, type: !31, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocalVariable(name: "data", scope: !30, file: !19, line: 30, type: !4)
!34 = !DILocation(line: 30, column: 15, scope: !30)
!35 = !DILocation(line: 32, column: 10, scope: !30)
!36 = !DILocation(line: 35, column: 23, scope: !30)
!37 = !DILocation(line: 35, column: 12, scope: !30)
!38 = !DILocation(line: 35, column: 10, scope: !30)
!39 = !DILocation(line: 36, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !30, file: !19, line: 36, column: 9)
!41 = !DILocation(line: 36, column: 14, scope: !40)
!42 = !DILocation(line: 36, column: 9, scope: !30)
!43 = !DILocation(line: 36, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 36, column: 23)
!45 = !DILocation(line: 37, column: 6, scope: !30)
!46 = !DILocation(line: 37, column: 11, scope: !30)
!47 = !DILocation(line: 38, column: 66, scope: !30)
!48 = !DILocation(line: 38, column: 5, scope: !30)
!49 = !DILocation(line: 39, column: 1, scope: !30)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_goodG2BSink", scope: !19, file: !19, line: 45, type: !20, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !19, line: 45, type: !4)
!52 = !DILocation(line: 45, column: 81, scope: !50)
!53 = !DILocation(line: 48, column: 24, scope: !50)
!54 = !DILocation(line: 48, column: 23, scope: !50)
!55 = !DILocation(line: 48, column: 5, scope: !50)
!56 = !DILocation(line: 49, column: 10, scope: !50)
!57 = !DILocation(line: 49, column: 5, scope: !50)
!58 = !DILocation(line: 50, column: 1, scope: !50)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_41_good", scope: !19, file: !19, line: 65, type: !31, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 67, column: 5, scope: !59)
!61 = !DILocation(line: 68, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 80, type: !63, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !19, line: 80, type: !65)
!70 = !DILocation(line: 80, column: 14, scope: !62)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !19, line: 80, type: !66)
!72 = !DILocation(line: 80, column: 27, scope: !62)
!73 = !DILocation(line: 83, column: 22, scope: !62)
!74 = !DILocation(line: 83, column: 12, scope: !62)
!75 = !DILocation(line: 83, column: 5, scope: !62)
!76 = !DILocation(line: 85, column: 5, scope: !62)
!77 = !DILocation(line: 86, column: 5, scope: !62)
!78 = !DILocation(line: 87, column: 5, scope: !62)
!79 = !DILocation(line: 90, column: 5, scope: !62)
!80 = !DILocation(line: 91, column: 5, scope: !62)
!81 = !DILocation(line: 92, column: 5, scope: !62)
!82 = !DILocation(line: 94, column: 5, scope: !62)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 53, type: !31, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !19, line: 55, type: !4)
!85 = !DILocation(line: 55, column: 15, scope: !83)
!86 = !DILocation(line: 57, column: 10, scope: !83)
!87 = !DILocation(line: 59, column: 23, scope: !83)
!88 = !DILocation(line: 59, column: 12, scope: !83)
!89 = !DILocation(line: 59, column: 10, scope: !83)
!90 = !DILocation(line: 60, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !19, line: 60, column: 9)
!92 = !DILocation(line: 60, column: 14, scope: !91)
!93 = !DILocation(line: 60, column: 9, scope: !83)
!94 = !DILocation(line: 60, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 60, column: 23)
!96 = !DILocation(line: 61, column: 6, scope: !83)
!97 = !DILocation(line: 61, column: 11, scope: !83)
!98 = !DILocation(line: 62, column: 70, scope: !83)
!99 = !DILocation(line: 62, column: 5, scope: !83)
!100 = !DILocation(line: 63, column: 1, scope: !83)
