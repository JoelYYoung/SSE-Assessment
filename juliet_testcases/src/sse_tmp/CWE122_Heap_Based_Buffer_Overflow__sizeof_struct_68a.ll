; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_badData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_goodG2BData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !31
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !35
  store i32 1, i32* %intOne, align 4, !dbg !36
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !38
  store i32 2, i32* %intTwo, align 4, !dbg !39
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_badData, align 8, !dbg !41
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68b_badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #4, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #4, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !71
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !72
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !75
  store i32 1, i32* %intOne, align 4, !dbg !76
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !78
  store i32 2, i32* %intTwo, align 4, !dbg !79
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_goodG2BData, align 8, !dbg !81
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68b_goodG2BSink(), !dbg !82
  ret void, !dbg !83
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_badData", scope: !2, file: !18, line: 19, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0, !16}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_goodG2BData", scope: !2, file: !18, line: 20, type: !6, isLocal: false, isDefinition: true)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_bad", scope: !18, file: !18, line: 27, type: !26, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !18, line: 29, type: !6)
!29 = !DILocation(line: 29, column: 21, scope: !25)
!30 = !DILocation(line: 31, column: 10, scope: !25)
!31 = !DILocation(line: 34, column: 29, scope: !25)
!32 = !DILocation(line: 34, column: 12, scope: !25)
!33 = !DILocation(line: 34, column: 10, scope: !25)
!34 = !DILocation(line: 35, column: 5, scope: !25)
!35 = !DILocation(line: 35, column: 11, scope: !25)
!36 = !DILocation(line: 35, column: 18, scope: !25)
!37 = !DILocation(line: 36, column: 5, scope: !25)
!38 = !DILocation(line: 36, column: 11, scope: !25)
!39 = !DILocation(line: 36, column: 18, scope: !25)
!40 = !DILocation(line: 37, column: 67, scope: !25)
!41 = !DILocation(line: 37, column: 65, scope: !25)
!42 = !DILocation(line: 38, column: 5, scope: !25)
!43 = !DILocation(line: 39, column: 1, scope: !25)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_68_good", scope: !18, file: !18, line: 62, type: !26, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 64, column: 5, scope: !44)
!46 = !DILocation(line: 65, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 77, type: !48, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!12, !12, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !18, line: 77, type: !12)
!54 = !DILocation(line: 77, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !18, line: 77, type: !50)
!56 = !DILocation(line: 77, column: 27, scope: !47)
!57 = !DILocation(line: 80, column: 22, scope: !47)
!58 = !DILocation(line: 80, column: 12, scope: !47)
!59 = !DILocation(line: 80, column: 5, scope: !47)
!60 = !DILocation(line: 82, column: 5, scope: !47)
!61 = !DILocation(line: 83, column: 5, scope: !47)
!62 = !DILocation(line: 84, column: 5, scope: !47)
!63 = !DILocation(line: 87, column: 5, scope: !47)
!64 = !DILocation(line: 88, column: 5, scope: !47)
!65 = !DILocation(line: 89, column: 5, scope: !47)
!66 = !DILocation(line: 91, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 49, type: !26, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !18, line: 51, type: !6)
!69 = !DILocation(line: 51, column: 21, scope: !67)
!70 = !DILocation(line: 53, column: 10, scope: !67)
!71 = !DILocation(line: 55, column: 29, scope: !67)
!72 = !DILocation(line: 55, column: 12, scope: !67)
!73 = !DILocation(line: 55, column: 10, scope: !67)
!74 = !DILocation(line: 56, column: 5, scope: !67)
!75 = !DILocation(line: 56, column: 11, scope: !67)
!76 = !DILocation(line: 56, column: 18, scope: !67)
!77 = !DILocation(line: 57, column: 5, scope: !67)
!78 = !DILocation(line: 57, column: 11, scope: !67)
!79 = !DILocation(line: 57, column: 18, scope: !67)
!80 = !DILocation(line: 58, column: 71, scope: !67)
!81 = !DILocation(line: 58, column: 69, scope: !67)
!82 = !DILocation(line: 59, column: 5, scope: !67)
!83 = !DILocation(line: 60, column: 1, scope: !67)
