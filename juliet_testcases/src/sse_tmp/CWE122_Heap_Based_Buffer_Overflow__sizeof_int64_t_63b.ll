; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b_badSink(i64** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i64** %dataPtr, i64*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataPtr.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64**, i64*** %dataPtr.addr, align 8, !dbg !24
  %1 = load i64*, i64** %0, align 8, !dbg !25
  store i64* %1, i64** %data, align 8, !dbg !23
  %2 = load i64*, i64** %data, align 8, !dbg !26
  %3 = load i64, i64* %2, align 8, !dbg !27
  call void @printLongLongLine(i64 %3), !dbg !28
  %4 = load i64*, i64** %data, align 8, !dbg !29
  %5 = bitcast i64* %4 to i8*, !dbg !29
  call void @free(i8* %5) #4, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b_goodG2BSink(i64** %dataPtr) #0 !dbg !32 {
entry:
  %dataPtr.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i64** %dataPtr, i64*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataPtr.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64** %data, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i64**, i64*** %dataPtr.addr, align 8, !dbg !37
  %1 = load i64*, i64** %0, align 8, !dbg !38
  store i64* %1, i64** %data, align 8, !dbg !36
  %2 = load i64*, i64** %data, align 8, !dbg !39
  %3 = load i64, i64* %2, align 8, !dbg !40
  call void @printLongLongLine(i64 %3), !dbg !41
  %4 = load i64*, i64** %data, align 8, !dbg !42
  %5 = bitcast i64* %4 to i8*, !dbg !42
  call void @free(i8* %5) #4, !dbg !43
  ret void, !dbg !44
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!21 = !DILocation(line: 21, column: 80, scope: !9)
!22 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 23, type: !14)
!23 = !DILocation(line: 23, column: 15, scope: !9)
!24 = !DILocation(line: 23, column: 23, scope: !9)
!25 = !DILocation(line: 23, column: 22, scope: !9)
!26 = !DILocation(line: 25, column: 24, scope: !9)
!27 = !DILocation(line: 25, column: 23, scope: !9)
!28 = !DILocation(line: 25, column: 5, scope: !9)
!29 = !DILocation(line: 26, column: 10, scope: !9)
!30 = !DILocation(line: 26, column: 5, scope: !9)
!31 = !DILocation(line: 27, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_63b_goodG2BSink", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !32, file: !10, line: 34, type: !13)
!34 = !DILocation(line: 34, column: 84, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !10, line: 36, type: !14)
!36 = !DILocation(line: 36, column: 15, scope: !32)
!37 = !DILocation(line: 36, column: 23, scope: !32)
!38 = !DILocation(line: 36, column: 22, scope: !32)
!39 = !DILocation(line: 38, column: 24, scope: !32)
!40 = !DILocation(line: 38, column: 23, scope: !32)
!41 = !DILocation(line: 38, column: 5, scope: !32)
!42 = !DILocation(line: 39, column: 10, scope: !32)
!43 = !DILocation(line: 39, column: 5, scope: !32)
!44 = !DILocation(line: 40, column: 1, scope: !32)
