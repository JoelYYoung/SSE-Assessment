; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_badData = external dso_local global i64*, align 8
@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_goodG2BData = external dso_local global i64*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !13, metadata !DIExpression()), !dbg !20
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_badData, align 8, !dbg !21
  store i64* %0, i64** %data, align 8, !dbg !20
  %1 = load i64*, i64** %data, align 8, !dbg !22
  %2 = load i64, i64* %1, align 8, !dbg !23
  call void @printLongLongLine(i64 %2), !dbg !24
  %3 = load i64*, i64** %data, align 8, !dbg !25
  %4 = bitcast i64* %3 to i8*, !dbg !25
  call void @free(i8* %4) #4, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b_goodG2BSink() #0 !dbg !28 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68_goodG2BData, align 8, !dbg !31
  store i64* %0, i64** %data, align 8, !dbg !30
  %1 = load i64*, i64** %data, align 8, !dbg !32
  %2 = load i64, i64* %1, align 8, !dbg !33
  call void @printLongLongLine(i64 %2), !dbg !34
  %3 = load i64*, i64** %data, align 8, !dbg !35
  %4 = bitcast i64* %3 to i8*, !dbg !35
  call void @free(i8* %4) #4, !dbg !36
  ret void, !dbg !37
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !9)
!21 = !DILocation(line: 28, column: 22, scope: !9)
!22 = !DILocation(line: 30, column: 24, scope: !9)
!23 = !DILocation(line: 30, column: 23, scope: !9)
!24 = !DILocation(line: 30, column: 5, scope: !9)
!25 = !DILocation(line: 31, column: 10, scope: !9)
!26 = !DILocation(line: 31, column: 5, scope: !9)
!27 = !DILocation(line: 32, column: 1, scope: !9)
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_68b_goodG2BSink", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocalVariable(name: "data", scope: !28, file: !10, line: 41, type: !14)
!30 = !DILocation(line: 41, column: 15, scope: !28)
!31 = !DILocation(line: 41, column: 22, scope: !28)
!32 = !DILocation(line: 43, column: 24, scope: !28)
!33 = !DILocation(line: 43, column: 23, scope: !28)
!34 = !DILocation(line: 43, column: 5, scope: !28)
!35 = !DILocation(line: 44, column: 10, scope: !28)
!36 = !DILocation(line: 44, column: 5, scope: !28)
!37 = !DILocation(line: 45, column: 1, scope: !28)
