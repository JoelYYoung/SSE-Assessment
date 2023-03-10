; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !26
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !27
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !28
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !30
  store i32 1, i32* %intOne, align 4, !dbg !31
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !33
  store i32 2, i32* %intTwo, align 4, !dbg !34
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51b_badSink(%struct._twoIntsStruct* %3), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51b_badSink(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #4, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #4, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !64
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !65
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !66
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !69
  store i32 1, i32* %intOne, align 4, !dbg !70
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !72
  store i32 2, i32* %intTwo, align 4, !dbg !73
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51b_goodG2BSink(%struct._twoIntsStruct* %3), !dbg !75
  ret void, !dbg !76
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51b_goodG2BSink(%struct._twoIntsStruct*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_bad", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51a.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !4)
!24 = !DILocation(line: 26, column: 21, scope: !19)
!25 = !DILocation(line: 28, column: 10, scope: !19)
!26 = !DILocation(line: 31, column: 29, scope: !19)
!27 = !DILocation(line: 31, column: 12, scope: !19)
!28 = !DILocation(line: 31, column: 10, scope: !19)
!29 = !DILocation(line: 32, column: 5, scope: !19)
!30 = !DILocation(line: 32, column: 11, scope: !19)
!31 = !DILocation(line: 32, column: 18, scope: !19)
!32 = !DILocation(line: 33, column: 5, scope: !19)
!33 = !DILocation(line: 33, column: 11, scope: !19)
!34 = !DILocation(line: 33, column: 18, scope: !19)
!35 = !DILocation(line: 34, column: 66, scope: !19)
!36 = !DILocation(line: 34, column: 5, scope: !19)
!37 = !DILocation(line: 35, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_51_good", scope: !20, file: !20, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 59, column: 5, scope: !38)
!40 = !DILocation(line: 60, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 72, type: !42, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!10, !10, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !20, line: 72, type: !10)
!48 = !DILocation(line: 72, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !20, line: 72, type: !44)
!50 = !DILocation(line: 72, column: 27, scope: !41)
!51 = !DILocation(line: 75, column: 22, scope: !41)
!52 = !DILocation(line: 75, column: 12, scope: !41)
!53 = !DILocation(line: 75, column: 5, scope: !41)
!54 = !DILocation(line: 77, column: 5, scope: !41)
!55 = !DILocation(line: 78, column: 5, scope: !41)
!56 = !DILocation(line: 79, column: 5, scope: !41)
!57 = !DILocation(line: 82, column: 5, scope: !41)
!58 = !DILocation(line: 83, column: 5, scope: !41)
!59 = !DILocation(line: 84, column: 5, scope: !41)
!60 = !DILocation(line: 86, column: 5, scope: !41)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 45, type: !21, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", scope: !61, file: !20, line: 47, type: !4)
!63 = !DILocation(line: 47, column: 21, scope: !61)
!64 = !DILocation(line: 49, column: 10, scope: !61)
!65 = !DILocation(line: 51, column: 29, scope: !61)
!66 = !DILocation(line: 51, column: 12, scope: !61)
!67 = !DILocation(line: 51, column: 10, scope: !61)
!68 = !DILocation(line: 52, column: 5, scope: !61)
!69 = !DILocation(line: 52, column: 11, scope: !61)
!70 = !DILocation(line: 52, column: 18, scope: !61)
!71 = !DILocation(line: 53, column: 5, scope: !61)
!72 = !DILocation(line: 53, column: 11, scope: !61)
!73 = !DILocation(line: 53, column: 18, scope: !61)
!74 = !DILocation(line: 54, column: 70, scope: !61)
!75 = !DILocation(line: 54, column: 5, scope: !61)
!76 = !DILocation(line: 55, column: 1, scope: !61)
