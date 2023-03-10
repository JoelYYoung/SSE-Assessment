; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType = type { %struct._twoIntsStruct* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b_badSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType* %myStruct, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType* %myStruct, i32 0, i32 0, !dbg !29
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structFirst, align 8, !dbg !29
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !28
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !31
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !32
  call void @free(i8* %3) #4, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b_goodG2BSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !35 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType* %myStruct, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !38, metadata !DIExpression()), !dbg !39
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType* %myStruct, i32 0, i32 0, !dbg !40
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structFirst, align 8, !dbg !40
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !42
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !43
  call void @free(i8* %3) #4, !dbg !44
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !19, line: 100, baseType: !20)
!19 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !19, line: 96, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !20, file: !19, line: 98, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !20, file: !19, line: 99, baseType: !23, size: 32, offset: 32)
!25 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!26 = !DILocation(line: 26, column: 130, scope: !9)
!27 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!28 = !DILocation(line: 28, column: 21, scope: !9)
!29 = !DILocation(line: 28, column: 37, scope: !9)
!30 = !DILocation(line: 30, column: 21, scope: !9)
!31 = !DILocation(line: 30, column: 5, scope: !9)
!32 = !DILocation(line: 31, column: 10, scope: !9)
!33 = !DILocation(line: 31, column: 5, scope: !9)
!34 = !DILocation(line: 32, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_67b_goodG2BSink", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "myStruct", arg: 1, scope: !35, file: !10, line: 39, type: !13)
!37 = !DILocation(line: 39, column: 134, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 41, type: !17)
!39 = !DILocation(line: 41, column: 21, scope: !35)
!40 = !DILocation(line: 41, column: 37, scope: !35)
!41 = !DILocation(line: 43, column: 21, scope: !35)
!42 = !DILocation(line: 43, column: 5, scope: !35)
!43 = !DILocation(line: 44, column: 10, scope: !35)
!44 = !DILocation(line: 44, column: 5, scope: !35)
!45 = !DILocation(line: 45, column: 1, scope: !35)
