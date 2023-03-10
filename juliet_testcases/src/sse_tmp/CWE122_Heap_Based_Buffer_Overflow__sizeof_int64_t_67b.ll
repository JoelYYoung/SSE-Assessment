; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType = type { i64* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_badSink(i64* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, align 8
  %data = alloca i64*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0, !dbg !27
  %0 = load i64*, i64** %structFirst, align 8, !dbg !27
  store i64* %0, i64** %data, align 8, !dbg !26
  %1 = load i64*, i64** %data, align 8, !dbg !28
  %2 = load i64, i64* %1, align 8, !dbg !29
  call void @printLongLongLine(i64 %2), !dbg !30
  %3 = load i64*, i64** %data, align 8, !dbg !31
  %4 = bitcast i64* %3 to i8*, !dbg !31
  call void @free(i8* %4) #4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_goodG2BSink(i64* %myStruct.coerce) #0 !dbg !34 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, align 8
  %data = alloca i64*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64** %data, metadata !37, metadata !DIExpression()), !dbg !38
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType* %myStruct, i32 0, i32 0, !dbg !39
  %0 = load i64*, i64** %structFirst, align 8, !dbg !39
  store i64* %0, i64** %data, align 8, !dbg !38
  %1 = load i64*, i64** %data, align 8, !dbg !40
  %2 = load i64, i64* %1, align 8, !dbg !41
  call void @printLongLongLine(i64 %2), !dbg !42
  %3 = load i64*, i64** %data, align 8, !dbg !43
  %4 = bitcast i64* %3 to i8*, !dbg !43
  call void @free(i8* %4) #4, !dbg !44
  ret void, !dbg !45
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 27, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !21, line: 44, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!22 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!23 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!24 = !DILocation(line: 26, column: 132, scope: !9)
!25 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!26 = !DILocation(line: 28, column: 15, scope: !9)
!27 = !DILocation(line: 28, column: 31, scope: !9)
!28 = !DILocation(line: 30, column: 24, scope: !9)
!29 = !DILocation(line: 30, column: 23, scope: !9)
!30 = !DILocation(line: 30, column: 5, scope: !9)
!31 = !DILocation(line: 31, column: 10, scope: !9)
!32 = !DILocation(line: 31, column: 5, scope: !9)
!33 = !DILocation(line: 32, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_67b_goodG2BSink", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "myStruct", arg: 1, scope: !34, file: !10, line: 39, type: !13)
!36 = !DILocation(line: 39, column: 136, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !10, line: 41, type: !17)
!38 = !DILocation(line: 41, column: 15, scope: !34)
!39 = !DILocation(line: 41, column: 31, scope: !34)
!40 = !DILocation(line: 43, column: 24, scope: !34)
!41 = !DILocation(line: 43, column: 23, scope: !34)
!42 = !DILocation(line: 43, column: 5, scope: !34)
!43 = !DILocation(line: 44, column: 10, scope: !34)
!44 = !DILocation(line: 44, column: 5, scope: !34)
!45 = !DILocation(line: 45, column: 1, scope: !34)
