; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b_badSink(%struct._twoIntsStruct** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct** %dataPtr, %struct._twoIntsStruct*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr.addr, align 8, !dbg !26
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !27
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !25
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !28
  call void @printStructLine(%struct._twoIntsStruct* %2), !dbg !29
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !30
  call void @free(i8* %4) #4, !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b_goodG2BSink(%struct._twoIntsStruct** %dataPtr) #0 !dbg !33 {
entry:
  %dataPtr.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct** %dataPtr, %struct._twoIntsStruct*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr.addr, align 8, !dbg !38
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !39
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  call void @printStructLine(%struct._twoIntsStruct* %2), !dbg !41
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !42
  call void @free(i8* %4) #4, !dbg !43
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !16, line: 100, baseType: !17)
!16 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !16, line: 96, size: 64, elements: !18)
!18 = !{!19, !21}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !17, file: !16, line: 98, baseType: !20, size: 32)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !17, file: !16, line: 99, baseType: !20, size: 32, offset: 32)
!22 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!23 = !DILocation(line: 21, column: 85, scope: !9)
!24 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 23, type: !14)
!25 = !DILocation(line: 23, column: 21, scope: !9)
!26 = !DILocation(line: 23, column: 29, scope: !9)
!27 = !DILocation(line: 23, column: 28, scope: !9)
!28 = !DILocation(line: 25, column: 21, scope: !9)
!29 = !DILocation(line: 25, column: 5, scope: !9)
!30 = !DILocation(line: 26, column: 10, scope: !9)
!31 = !DILocation(line: 26, column: 5, scope: !9)
!32 = !DILocation(line: 27, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_63b_goodG2BSink", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !33, file: !10, line: 34, type: !13)
!35 = !DILocation(line: 34, column: 89, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !10, line: 36, type: !14)
!37 = !DILocation(line: 36, column: 21, scope: !33)
!38 = !DILocation(line: 36, column: 29, scope: !33)
!39 = !DILocation(line: 36, column: 28, scope: !33)
!40 = !DILocation(line: 38, column: 21, scope: !33)
!41 = !DILocation(line: 38, column: 5, scope: !33)
!42 = !DILocation(line: 39, column: 10, scope: !33)
!43 = !DILocation(line: 39, column: 5, scope: !33)
!44 = !DILocation(line: 40, column: 1, scope: !33)
