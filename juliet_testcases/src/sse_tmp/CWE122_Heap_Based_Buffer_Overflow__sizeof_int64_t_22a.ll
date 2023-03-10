; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !23, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badGlobal, align 4, !dbg !32
  %0 = load i64*, i64** %data, align 8, !dbg !33
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badSource(i64* %0), !dbg !34
  store i64* %call, i64** %data, align 8, !dbg !35
  %1 = load i64*, i64** %data, align 8, !dbg !36
  %2 = load i64, i64* %1, align 8, !dbg !37
  call void @printLongLongLine(i64 %2), !dbg !38
  %3 = load i64*, i64** %data, align 8, !dbg !39
  %4 = bitcast i64* %3 to i8*, !dbg !39
  call void @free(i8* %4) #4, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badSource(i64*) #2

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_good() #0 !dbg !42 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #4, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #4, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i64* null, i64** %data, align 8, !dbg !69
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Global, align 4, !dbg !70
  %0 = load i64*, i64** %data, align 8, !dbg !71
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Source(i64* %0), !dbg !72
  store i64* %call, i64** %data, align 8, !dbg !73
  %1 = load i64*, i64** %data, align 8, !dbg !74
  %2 = load i64, i64* %1, align 8, !dbg !75
  call void @printLongLongLine(i64 %2), !dbg !76
  %3 = load i64*, i64** %data, align 8, !dbg !77
  %4 = bitcast i64* %3 to i8*, !dbg !77
  call void @free(i8* %4) #4, !dbg !78
  ret void, !dbg !79
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Source(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !80 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i64* null, i64** %data, align 8, !dbg !83
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Global, align 4, !dbg !84
  %0 = load i64*, i64** %data, align 8, !dbg !85
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Source(i64* %0), !dbg !86
  store i64* %call, i64** %data, align 8, !dbg !87
  %1 = load i64*, i64** %data, align 8, !dbg !88
  %2 = load i64, i64* %1, align 8, !dbg !89
  call void @printLongLongLine(i64 %2), !dbg !90
  %3 = load i64*, i64** %data, align 8, !dbg !91
  %4 = bitcast i64* %3 to i8*, !dbg !91
  call void @free(i8* %4) #4, !dbg !92
  ret void, !dbg !93
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Source(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Global", scope: !2, file: !10, line: 43, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Global", scope: !2, file: !10, line: 44, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !26, line: 27, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !28, line: 44, baseType: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!29 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!30 = !DILocation(line: 28, column: 15, scope: !20)
!31 = !DILocation(line: 30, column: 10, scope: !20)
!32 = !DILocation(line: 31, column: 68, scope: !20)
!33 = !DILocation(line: 32, column: 75, scope: !20)
!34 = !DILocation(line: 32, column: 12, scope: !20)
!35 = !DILocation(line: 32, column: 10, scope: !20)
!36 = !DILocation(line: 34, column: 24, scope: !20)
!37 = !DILocation(line: 34, column: 23, scope: !20)
!38 = !DILocation(line: 34, column: 5, scope: !20)
!39 = !DILocation(line: 35, column: 10, scope: !20)
!40 = !DILocation(line: 35, column: 5, scope: !20)
!41 = !DILocation(line: 36, column: 1, scope: !20)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_good", scope: !10, file: !10, line: 76, type: !21, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 78, column: 5, scope: !42)
!44 = !DILocation(line: 79, column: 5, scope: !42)
!45 = !DILocation(line: 80, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 92, type: !47, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!11, !11, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !10, line: 92, type: !11)
!53 = !DILocation(line: 92, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !10, line: 92, type: !49)
!55 = !DILocation(line: 92, column: 27, scope: !46)
!56 = !DILocation(line: 95, column: 22, scope: !46)
!57 = !DILocation(line: 95, column: 12, scope: !46)
!58 = !DILocation(line: 95, column: 5, scope: !46)
!59 = !DILocation(line: 97, column: 5, scope: !46)
!60 = !DILocation(line: 98, column: 5, scope: !46)
!61 = !DILocation(line: 99, column: 5, scope: !46)
!62 = !DILocation(line: 102, column: 5, scope: !46)
!63 = !DILocation(line: 103, column: 5, scope: !46)
!64 = !DILocation(line: 104, column: 5, scope: !46)
!65 = !DILocation(line: 106, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 49, type: !21, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !10, line: 51, type: !24)
!68 = !DILocation(line: 51, column: 15, scope: !66)
!69 = !DILocation(line: 53, column: 10, scope: !66)
!70 = !DILocation(line: 54, column: 73, scope: !66)
!71 = !DILocation(line: 55, column: 80, scope: !66)
!72 = !DILocation(line: 55, column: 12, scope: !66)
!73 = !DILocation(line: 55, column: 10, scope: !66)
!74 = !DILocation(line: 57, column: 24, scope: !66)
!75 = !DILocation(line: 57, column: 23, scope: !66)
!76 = !DILocation(line: 57, column: 5, scope: !66)
!77 = !DILocation(line: 58, column: 10, scope: !66)
!78 = !DILocation(line: 58, column: 5, scope: !66)
!79 = !DILocation(line: 59, column: 1, scope: !66)
!80 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 64, type: !21, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 66, type: !24)
!82 = !DILocation(line: 66, column: 15, scope: !80)
!83 = !DILocation(line: 68, column: 10, scope: !80)
!84 = !DILocation(line: 69, column: 73, scope: !80)
!85 = !DILocation(line: 70, column: 80, scope: !80)
!86 = !DILocation(line: 70, column: 12, scope: !80)
!87 = !DILocation(line: 70, column: 10, scope: !80)
!88 = !DILocation(line: 72, column: 24, scope: !80)
!89 = !DILocation(line: 72, column: 23, scope: !80)
!90 = !DILocation(line: 72, column: 5, scope: !80)
!91 = !DILocation(line: 73, column: 10, scope: !80)
!92 = !DILocation(line: 73, column: 5, scope: !80)
!93 = !DILocation(line: 74, column: 1, scope: !80)
