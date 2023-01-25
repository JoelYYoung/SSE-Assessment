; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !25
  %0 = bitcast i8* %call to i64*, !dbg !26
  store i64* %0, i64** %data, align 8, !dbg !27
  %1 = load i64*, i64** %data, align 8, !dbg !28
  %cmp = icmp eq i64* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !34
  store i64 2147483643, i64* %2, align 8, !dbg !35
  %3 = load i64*, i64** %data, align 8, !dbg !36
  %4 = load i64, i64* %3, align 8, !dbg !37
  call void @printLongLongLine(i64 %4), !dbg !38
  %5 = load i64*, i64** %data, align 8, !dbg !39
  %6 = bitcast i64* %5 to i8*, !dbg !39
  call void @free(i8* %6) #5, !dbg !40
  ret void, !dbg !41
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i64* null, i64** %data, align 8, !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !71
  %0 = bitcast i8* %call to i64*, !dbg !72
  store i64* %0, i64** %data, align 8, !dbg !73
  %1 = load i64*, i64** %data, align 8, !dbg !74
  %cmp = icmp eq i64* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !80
  store i64 2147483643, i64* %2, align 8, !dbg !81
  %3 = load i64*, i64** %data, align 8, !dbg !82
  %4 = load i64, i64* %3, align 8, !dbg !83
  call void @printLongLongLine(i64 %4), !dbg !84
  %5 = load i64*, i64** %data, align 8, !dbg !85
  %6 = bitcast i64* %5 to i8*, !dbg !85
  call void @free(i8* %6) #5, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !88 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i64* null, i64** %data, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !92
  %0 = bitcast i8* %call to i64*, !dbg !93
  store i64* %0, i64** %data, align 8, !dbg !94
  %1 = load i64*, i64** %data, align 8, !dbg !95
  %cmp = icmp eq i64* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !101
  store i64 2147483643, i64* %2, align 8, !dbg !102
  %3 = load i64*, i64** %data, align 8, !dbg !103
  %4 = load i64, i64* %3, align 8, !dbg !104
  call void @printLongLongLine(i64 %4), !dbg !105
  %5 = load i64*, i64** %data, align 8, !dbg !106
  %6 = bitcast i64* %5 to i8*, !dbg !106
  call void @free(i8* %6) #5, !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 25, column: 10, scope: !18)
!25 = !DILocation(line: 31, column: 27, scope: !18)
!26 = !DILocation(line: 31, column: 16, scope: !18)
!27 = !DILocation(line: 31, column: 14, scope: !18)
!28 = !DILocation(line: 32, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 18, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !18)
!32 = !DILocation(line: 32, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 32, column: 27)
!34 = !DILocation(line: 33, column: 10, scope: !18)
!35 = !DILocation(line: 33, column: 15, scope: !18)
!36 = !DILocation(line: 41, column: 24, scope: !18)
!37 = !DILocation(line: 41, column: 23, scope: !18)
!38 = !DILocation(line: 41, column: 5, scope: !18)
!39 = !DILocation(line: 42, column: 10, scope: !18)
!40 = !DILocation(line: 42, column: 5, scope: !18)
!41 = !DILocation(line: 43, column: 1, scope: !18)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_15_good", scope: !19, file: !19, line: 97, type: !20, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 99, column: 5, scope: !42)
!44 = !DILocation(line: 100, column: 5, scope: !42)
!45 = !DILocation(line: 101, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 113, type: !47, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !19, line: 113, type: !49)
!54 = !DILocation(line: 113, column: 14, scope: !46)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !19, line: 113, type: !50)
!56 = !DILocation(line: 113, column: 27, scope: !46)
!57 = !DILocation(line: 116, column: 22, scope: !46)
!58 = !DILocation(line: 116, column: 12, scope: !46)
!59 = !DILocation(line: 116, column: 5, scope: !46)
!60 = !DILocation(line: 118, column: 5, scope: !46)
!61 = !DILocation(line: 119, column: 5, scope: !46)
!62 = !DILocation(line: 120, column: 5, scope: !46)
!63 = !DILocation(line: 123, column: 5, scope: !46)
!64 = !DILocation(line: 124, column: 5, scope: !46)
!65 = !DILocation(line: 125, column: 5, scope: !46)
!66 = !DILocation(line: 127, column: 5, scope: !46)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !19, line: 52, type: !4)
!69 = !DILocation(line: 52, column: 15, scope: !67)
!70 = !DILocation(line: 54, column: 10, scope: !67)
!71 = !DILocation(line: 63, column: 27, scope: !67)
!72 = !DILocation(line: 63, column: 16, scope: !67)
!73 = !DILocation(line: 63, column: 14, scope: !67)
!74 = !DILocation(line: 64, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !67, file: !19, line: 64, column: 13)
!76 = !DILocation(line: 64, column: 18, scope: !75)
!77 = !DILocation(line: 64, column: 13, scope: !67)
!78 = !DILocation(line: 64, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !19, line: 64, column: 27)
!80 = !DILocation(line: 65, column: 10, scope: !67)
!81 = !DILocation(line: 65, column: 15, scope: !67)
!82 = !DILocation(line: 69, column: 24, scope: !67)
!83 = !DILocation(line: 69, column: 23, scope: !67)
!84 = !DILocation(line: 69, column: 5, scope: !67)
!85 = !DILocation(line: 70, column: 10, scope: !67)
!86 = !DILocation(line: 70, column: 5, scope: !67)
!87 = !DILocation(line: 71, column: 1, scope: !67)
!88 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !19, line: 76, type: !4)
!90 = !DILocation(line: 76, column: 15, scope: !88)
!91 = !DILocation(line: 78, column: 10, scope: !88)
!92 = !DILocation(line: 83, column: 27, scope: !88)
!93 = !DILocation(line: 83, column: 16, scope: !88)
!94 = !DILocation(line: 83, column: 14, scope: !88)
!95 = !DILocation(line: 84, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !19, line: 84, column: 13)
!97 = !DILocation(line: 84, column: 18, scope: !96)
!98 = !DILocation(line: 84, column: 13, scope: !88)
!99 = !DILocation(line: 84, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !19, line: 84, column: 27)
!101 = !DILocation(line: 85, column: 10, scope: !88)
!102 = !DILocation(line: 85, column: 15, scope: !88)
!103 = !DILocation(line: 93, column: 24, scope: !88)
!104 = !DILocation(line: 93, column: 23, scope: !88)
!105 = !DILocation(line: 93, column: 5, scope: !88)
!106 = !DILocation(line: 94, column: 10, scope: !88)
!107 = !DILocation(line: 94, column: 5, scope: !88)
!108 = !DILocation(line: 95, column: 1, scope: !88)
