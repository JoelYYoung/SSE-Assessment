; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b_badSink(i64** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !24
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !24
  store i64* %1, i64** %data, align 8, !dbg !23
  %2 = load i64*, i64** %data, align 8, !dbg !25
  %3 = load i64, i64* %2, align 8, !dbg !26
  call void @printLongLongLine(i64 %3), !dbg !27
  %4 = load i64*, i64** %data, align 8, !dbg !28
  %5 = bitcast i64* %4 to i8*, !dbg !28
  call void @free(i8* %5) #4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b_goodG2BSink(i64** %dataArray) #0 !dbg !31 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64** %data, metadata !34, metadata !DIExpression()), !dbg !35
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !36
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !36
  store i64* %1, i64** %data, align 8, !dbg !35
  %2 = load i64*, i64** %data, align 8, !dbg !37
  %3 = load i64, i64* %2, align 8, !dbg !38
  call void @printLongLongLine(i64 %3), !dbg !39
  %4 = load i64*, i64** %data, align 8, !dbg !40
  %5 = bitcast i64* %4 to i8*, !dbg !40
  call void @free(i8* %5) #4, !dbg !41
  ret void, !dbg !42
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!21 = !DILocation(line: 21, column: 78, scope: !9)
!22 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!23 = !DILocation(line: 24, column: 15, scope: !9)
!24 = !DILocation(line: 24, column: 22, scope: !9)
!25 = !DILocation(line: 26, column: 24, scope: !9)
!26 = !DILocation(line: 26, column: 23, scope: !9)
!27 = !DILocation(line: 26, column: 5, scope: !9)
!28 = !DILocation(line: 27, column: 10, scope: !9)
!29 = !DILocation(line: 27, column: 5, scope: !9)
!30 = !DILocation(line: 28, column: 1, scope: !9)
!31 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_66b_goodG2BSink", scope: !10, file: !10, line: 35, type: !11, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocalVariable(name: "dataArray", arg: 1, scope: !31, file: !10, line: 35, type: !13)
!33 = !DILocation(line: 35, column: 82, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !10, line: 37, type: !14)
!35 = !DILocation(line: 37, column: 15, scope: !31)
!36 = !DILocation(line: 37, column: 22, scope: !31)
!37 = !DILocation(line: 39, column: 24, scope: !31)
!38 = !DILocation(line: 39, column: 23, scope: !31)
!39 = !DILocation(line: 39, column: 5, scope: !31)
!40 = !DILocation(line: 40, column: 10, scope: !31)
!41 = !DILocation(line: 40, column: 5, scope: !31)
!42 = !DILocation(line: 41, column: 1, scope: !31)
