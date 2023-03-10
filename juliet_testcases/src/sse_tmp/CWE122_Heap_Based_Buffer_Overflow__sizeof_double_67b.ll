; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType = type { double* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b_badSink(double* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType, align 8
  %data = alloca double*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType* %myStruct, i32 0, i32 0
  store double* %myStruct.coerce, double** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata double** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load double*, double** %structFirst, align 8, !dbg !23
  store double* %0, double** %data, align 8, !dbg !22
  %1 = load double*, double** %data, align 8, !dbg !24
  %2 = load double, double* %1, align 8, !dbg !25
  call void @printDoubleLine(double %2), !dbg !26
  %3 = load double*, double** %data, align 8, !dbg !27
  %4 = bitcast double* %3 to i8*, !dbg !27
  call void @free(i8* %4) #4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b_goodG2BSink(double* %myStruct.coerce) #0 !dbg !30 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType, align 8
  %data = alloca double*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType* %myStruct, i32 0, i32 0
  store double* %myStruct.coerce, double** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType* %myStruct, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata double** %data, metadata !33, metadata !DIExpression()), !dbg !34
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType* %myStruct, i32 0, i32 0, !dbg !35
  %0 = load double*, double** %structFirst, align 8, !dbg !35
  store double* %0, double** %data, align 8, !dbg !34
  %1 = load double*, double** %data, align 8, !dbg !36
  %2 = load double, double* %1, align 8, !dbg !37
  call void @printDoubleLine(double %2), !dbg !38
  %3 = load double*, double** %data, align 8, !dbg !39
  %4 = bitcast double* %3 to i8*, !dbg !39
  call void @free(i8* %4) #4, !dbg !40
  ret void, !dbg !41
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!20 = !DILocation(line: 26, column: 130, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!22 = !DILocation(line: 28, column: 14, scope: !9)
!23 = !DILocation(line: 28, column: 30, scope: !9)
!24 = !DILocation(line: 30, column: 22, scope: !9)
!25 = !DILocation(line: 30, column: 21, scope: !9)
!26 = !DILocation(line: 30, column: 5, scope: !9)
!27 = !DILocation(line: 31, column: 10, scope: !9)
!28 = !DILocation(line: 31, column: 5, scope: !9)
!29 = !DILocation(line: 32, column: 1, scope: !9)
!30 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_67b_goodG2BSink", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "myStruct", arg: 1, scope: !30, file: !10, line: 39, type: !13)
!32 = !DILocation(line: 39, column: 134, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !10, line: 41, type: !17)
!34 = !DILocation(line: 41, column: 14, scope: !30)
!35 = !DILocation(line: 41, column: 30, scope: !30)
!36 = !DILocation(line: 43, column: 22, scope: !30)
!37 = !DILocation(line: 43, column: 21, scope: !30)
!38 = !DILocation(line: 43, column: 5, scope: !30)
!39 = !DILocation(line: 44, column: 10, scope: !30)
!40 = !DILocation(line: 44, column: 5, scope: !30)
!41 = !DILocation(line: 45, column: 1, scope: !30)
