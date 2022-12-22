; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i64*, i64** %data, align 8, !dbg !25
  %call = call i64* @badSource(i64* %0), !dbg !26
  store i64* %call, i64** %data, align 8, !dbg !27
  %1 = load i64*, i64** %data, align 8, !dbg !28
  %2 = load i64, i64* %1, align 8, !dbg !29
  call void @printLongLongLine(i64 %2), !dbg !30
  %3 = load i64*, i64** %data, align 8, !dbg !31
  %4 = bitcast i64* %3 to i8*, !dbg !31
  call void @free(i8* %4) #5, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i64* @badSource(i64* %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !39
  %0 = bitcast i8* %call to i64*, !dbg !40
  store i64* %0, i64** %data.addr, align 8, !dbg !41
  %1 = load i64*, i64** %data.addr, align 8, !dbg !42
  %cmp = icmp eq i64* %1, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !48
  store i64 2147483643, i64* %2, align 8, !dbg !49
  %3 = load i64*, i64** %data.addr, align 8, !dbg !50
  ret i64* %3, !dbg !51
}

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i64* null, i64** %data, align 8, !dbg !79
  %0 = load i64*, i64** %data, align 8, !dbg !80
  %call = call i64* @goodG2BSource(i64* %0), !dbg !81
  store i64* %call, i64** %data, align 8, !dbg !82
  %1 = load i64*, i64** %data, align 8, !dbg !83
  %2 = load i64, i64* %1, align 8, !dbg !84
  call void @printLongLongLine(i64 %2), !dbg !85
  %3 = load i64*, i64** %data, align 8, !dbg !86
  %4 = bitcast i64* %3 to i8*, !dbg !86
  call void @free(i8* %4) #5, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2BSource(i64* %data) #0 !dbg !89 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !92
  %0 = bitcast i8* %call to i64*, !dbg !93
  store i64* %0, i64** %data.addr, align 8, !dbg !94
  %1 = load i64*, i64** %data.addr, align 8, !dbg !95
  %cmp = icmp eq i64* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !101
  store i64 2147483643, i64* %2, align 8, !dbg !102
  %3 = load i64*, i64** %data.addr, align 8, !dbg !103
  ret i64* %3, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !11}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 43, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_bad", scope: !19, file: !19, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 33, type: !5)
!23 = !DILocation(line: 33, column: 15, scope: !18)
!24 = !DILocation(line: 35, column: 10, scope: !18)
!25 = !DILocation(line: 36, column: 22, scope: !18)
!26 = !DILocation(line: 36, column: 12, scope: !18)
!27 = !DILocation(line: 36, column: 10, scope: !18)
!28 = !DILocation(line: 38, column: 24, scope: !18)
!29 = !DILocation(line: 38, column: 23, scope: !18)
!30 = !DILocation(line: 38, column: 5, scope: !18)
!31 = !DILocation(line: 39, column: 10, scope: !18)
!32 = !DILocation(line: 39, column: 5, scope: !18)
!33 = !DILocation(line: 40, column: 1, scope: !18)
!34 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 21, type: !35, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!5, !5}
!37 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !19, line: 21, type: !5)
!38 = !DILocation(line: 21, column: 38, scope: !34)
!39 = !DILocation(line: 25, column: 23, scope: !34)
!40 = !DILocation(line: 25, column: 12, scope: !34)
!41 = !DILocation(line: 25, column: 10, scope: !34)
!42 = !DILocation(line: 26, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !19, line: 26, column: 9)
!44 = !DILocation(line: 26, column: 14, scope: !43)
!45 = !DILocation(line: 26, column: 9, scope: !34)
!46 = !DILocation(line: 26, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !19, line: 26, column: 23)
!48 = !DILocation(line: 27, column: 6, scope: !34)
!49 = !DILocation(line: 27, column: 11, scope: !34)
!50 = !DILocation(line: 28, column: 12, scope: !34)
!51 = !DILocation(line: 28, column: 5, scope: !34)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_42_good", scope: !19, file: !19, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 69, column: 5, scope: !52)
!54 = !DILocation(line: 70, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 82, type: !56, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !19, line: 82, type: !58)
!63 = !DILocation(line: 82, column: 14, scope: !55)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !19, line: 82, type: !59)
!65 = !DILocation(line: 82, column: 27, scope: !55)
!66 = !DILocation(line: 85, column: 22, scope: !55)
!67 = !DILocation(line: 85, column: 12, scope: !55)
!68 = !DILocation(line: 85, column: 5, scope: !55)
!69 = !DILocation(line: 87, column: 5, scope: !55)
!70 = !DILocation(line: 88, column: 5, scope: !55)
!71 = !DILocation(line: 89, column: 5, scope: !55)
!72 = !DILocation(line: 92, column: 5, scope: !55)
!73 = !DILocation(line: 93, column: 5, scope: !55)
!74 = !DILocation(line: 94, column: 5, scope: !55)
!75 = !DILocation(line: 96, column: 5, scope: !55)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !19, line: 58, type: !5)
!78 = !DILocation(line: 58, column: 15, scope: !76)
!79 = !DILocation(line: 60, column: 10, scope: !76)
!80 = !DILocation(line: 61, column: 26, scope: !76)
!81 = !DILocation(line: 61, column: 12, scope: !76)
!82 = !DILocation(line: 61, column: 10, scope: !76)
!83 = !DILocation(line: 63, column: 24, scope: !76)
!84 = !DILocation(line: 63, column: 23, scope: !76)
!85 = !DILocation(line: 63, column: 5, scope: !76)
!86 = !DILocation(line: 64, column: 10, scope: !76)
!87 = !DILocation(line: 64, column: 5, scope: !76)
!88 = !DILocation(line: 65, column: 1, scope: !76)
!89 = distinct !DISubprogram(name: "goodG2BSource", scope: !19, file: !19, line: 46, type: !35, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", arg: 1, scope: !89, file: !19, line: 46, type: !5)
!91 = !DILocation(line: 46, column: 42, scope: !89)
!92 = !DILocation(line: 49, column: 23, scope: !89)
!93 = !DILocation(line: 49, column: 12, scope: !89)
!94 = !DILocation(line: 49, column: 10, scope: !89)
!95 = !DILocation(line: 50, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !19, line: 50, column: 9)
!97 = !DILocation(line: 50, column: 14, scope: !96)
!98 = !DILocation(line: 50, column: 9, scope: !89)
!99 = !DILocation(line: 50, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !19, line: 50, column: 23)
!101 = !DILocation(line: 51, column: 6, scope: !89)
!102 = !DILocation(line: 51, column: 11, scope: !89)
!103 = !DILocation(line: 52, column: 12, scope: !89)
!104 = !DILocation(line: 52, column: 5, scope: !89)
