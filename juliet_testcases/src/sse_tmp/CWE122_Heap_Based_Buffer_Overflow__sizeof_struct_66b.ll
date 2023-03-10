; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_badSink(%struct._twoIntsStruct** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct** %dataArray, %struct._twoIntsStruct*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataArray.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataArray.addr, align 8, !dbg !26
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, i64 2, !dbg !26
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %arrayidx, align 8, !dbg !26
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !25
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !27
  call void @printStructLine(%struct._twoIntsStruct* %2), !dbg !28
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !29
  call void @free(i8* %4) #4, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_goodG2BSink(%struct._twoIntsStruct** %dataArray) #0 !dbg !32 {
entry:
  %dataArray.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct** %dataArray, %struct._twoIntsStruct*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataArray.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataArray.addr, align 8, !dbg !37
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, i64 2, !dbg !37
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %arrayidx, align 8, !dbg !37
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  call void @printStructLine(%struct._twoIntsStruct* %2), !dbg !39
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !40
  call void @free(i8* %4) #4, !dbg !41
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b.c", directory: "/home/joelyang/SSE-Assessment")
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
!22 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!23 = !DILocation(line: 21, column: 83, scope: !9)
!24 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!25 = !DILocation(line: 24, column: 21, scope: !9)
!26 = !DILocation(line: 24, column: 28, scope: !9)
!27 = !DILocation(line: 26, column: 21, scope: !9)
!28 = !DILocation(line: 26, column: 5, scope: !9)
!29 = !DILocation(line: 27, column: 10, scope: !9)
!30 = !DILocation(line: 27, column: 5, scope: !9)
!31 = !DILocation(line: 28, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_66b_goodG2BSink", scope: !10, file: !10, line: 35, type: !11, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocalVariable(name: "dataArray", arg: 1, scope: !32, file: !10, line: 35, type: !13)
!34 = !DILocation(line: 35, column: 87, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !10, line: 37, type: !14)
!36 = !DILocation(line: 37, column: 21, scope: !32)
!37 = !DILocation(line: 37, column: 28, scope: !32)
!38 = !DILocation(line: 39, column: 21, scope: !32)
!39 = !DILocation(line: 39, column: 5, scope: !32)
!40 = !DILocation(line: 40, column: 10, scope: !32)
!41 = !DILocation(line: 40, column: 5, scope: !32)
!42 = !DILocation(line: 41, column: 1, scope: !32)
