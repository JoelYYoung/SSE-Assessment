; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b_badSink(i8* %dataVoidPtr) #0 !dbg !17 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !26
  %1 = bitcast i8* %0 to i64**, !dbg !27
  store i64** %1, i64*** %dataPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !30
  %3 = load i64*, i64** %2, align 8, !dbg !31
  store i64* %3, i64** %data, align 8, !dbg !29
  %4 = load i64*, i64** %data, align 8, !dbg !32
  %5 = load i64, i64* %4, align 8, !dbg !33
  call void @printLongLongLine(i64 %5), !dbg !34
  %6 = load i64*, i64** %data, align 8, !dbg !35
  %7 = bitcast i64* %6 to i8*, !dbg !35
  call void @free(i8* %7) #4, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !38 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !43
  %1 = bitcast i8* %0 to i64**, !dbg !44
  store i64** %1, i64*** %dataPtr, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64** %data, metadata !45, metadata !DIExpression()), !dbg !46
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !47
  %3 = load i64*, i64** %2, align 8, !dbg !48
  store i64* %3, i64** %data, align 8, !dbg !46
  %4 = load i64*, i64** %data, align 8, !dbg !49
  %5 = load i64, i64* %4, align 8, !dbg !50
  call void @printLongLongLine(i64 %5), !dbg !51
  %6 = load i64*, i64** %data, align 8, !dbg !52
  %7 = bitcast i64* %6 to i8*, !dbg !52
  call void @free(i8* %7) #4, !dbg !53
  ret void, !dbg !54
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b_badSink", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !17, file: !18, line: 21, type: !21)
!23 = !DILocation(line: 21, column: 75, scope: !17)
!24 = !DILocalVariable(name: "dataPtr", scope: !17, file: !18, line: 24, type: !4)
!25 = !DILocation(line: 24, column: 17, scope: !17)
!26 = !DILocation(line: 24, column: 40, scope: !17)
!27 = !DILocation(line: 24, column: 27, scope: !17)
!28 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !5)
!29 = !DILocation(line: 26, column: 15, scope: !17)
!30 = !DILocation(line: 26, column: 24, scope: !17)
!31 = !DILocation(line: 26, column: 23, scope: !17)
!32 = !DILocation(line: 28, column: 24, scope: !17)
!33 = !DILocation(line: 28, column: 23, scope: !17)
!34 = !DILocation(line: 28, column: 5, scope: !17)
!35 = !DILocation(line: 29, column: 10, scope: !17)
!36 = !DILocation(line: 29, column: 5, scope: !17)
!37 = !DILocation(line: 30, column: 1, scope: !17)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_64b_goodG2BSink", scope: !18, file: !18, line: 37, type: !19, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !38, file: !18, line: 37, type: !21)
!40 = !DILocation(line: 37, column: 79, scope: !38)
!41 = !DILocalVariable(name: "dataPtr", scope: !38, file: !18, line: 40, type: !4)
!42 = !DILocation(line: 40, column: 17, scope: !38)
!43 = !DILocation(line: 40, column: 40, scope: !38)
!44 = !DILocation(line: 40, column: 27, scope: !38)
!45 = !DILocalVariable(name: "data", scope: !38, file: !18, line: 42, type: !5)
!46 = !DILocation(line: 42, column: 15, scope: !38)
!47 = !DILocation(line: 42, column: 24, scope: !38)
!48 = !DILocation(line: 42, column: 23, scope: !38)
!49 = !DILocation(line: 44, column: 24, scope: !38)
!50 = !DILocation(line: 44, column: 23, scope: !38)
!51 = !DILocation(line: 44, column: 5, scope: !38)
!52 = !DILocation(line: 45, column: 10, scope: !38)
!53 = !DILocation(line: 45, column: 5, scope: !38)
!54 = !DILocation(line: 46, column: 1, scope: !38)
