; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b_badSink(i8* %dataVoidPtr) #0 !dbg !19 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !28
  %1 = bitcast i8* %0 to %struct._twoIntsStruct**, !dbg !29
  store %struct._twoIntsStruct** %1, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !32
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %2, align 8, !dbg !33
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !35
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !36
  call void @free(i8* %6) #4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !39 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !44
  %1 = bitcast i8* %0 to %struct._twoIntsStruct**, !dbg !45
  store %struct._twoIntsStruct** %1, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !46, metadata !DIExpression()), !dbg !47
  %2 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !48
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %2, align 8, !dbg !49
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data, align 8, !dbg !47
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !50
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !51
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !52
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !52
  call void @free(i8* %6) #4, !dbg !53
  ret void, !dbg !54
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b_badSink", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !19, file: !20, line: 21, type: !23)
!25 = !DILocation(line: 21, column: 74, scope: !19)
!26 = !DILocalVariable(name: "dataPtr", scope: !19, file: !20, line: 24, type: !4)
!27 = !DILocation(line: 24, column: 23, scope: !19)
!28 = !DILocation(line: 24, column: 52, scope: !19)
!29 = !DILocation(line: 24, column: 33, scope: !19)
!30 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !5)
!31 = !DILocation(line: 26, column: 21, scope: !19)
!32 = !DILocation(line: 26, column: 30, scope: !19)
!33 = !DILocation(line: 26, column: 29, scope: !19)
!34 = !DILocation(line: 28, column: 21, scope: !19)
!35 = !DILocation(line: 28, column: 5, scope: !19)
!36 = !DILocation(line: 29, column: 10, scope: !19)
!37 = !DILocation(line: 29, column: 5, scope: !19)
!38 = !DILocation(line: 30, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_64b_goodG2BSink", scope: !20, file: !20, line: 37, type: !21, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !39, file: !20, line: 37, type: !23)
!41 = !DILocation(line: 37, column: 78, scope: !39)
!42 = !DILocalVariable(name: "dataPtr", scope: !39, file: !20, line: 40, type: !4)
!43 = !DILocation(line: 40, column: 23, scope: !39)
!44 = !DILocation(line: 40, column: 52, scope: !39)
!45 = !DILocation(line: 40, column: 33, scope: !39)
!46 = !DILocalVariable(name: "data", scope: !39, file: !20, line: 42, type: !5)
!47 = !DILocation(line: 42, column: 21, scope: !39)
!48 = !DILocation(line: 42, column: 30, scope: !39)
!49 = !DILocation(line: 42, column: 29, scope: !39)
!50 = !DILocation(line: 44, column: 21, scope: !39)
!51 = !DILocation(line: 44, column: 5, scope: !39)
!52 = !DILocation(line: 45, column: 10, scope: !39)
!53 = !DILocation(line: 45, column: 5, scope: !39)
!54 = !DILocation(line: 46, column: 1, scope: !39)
