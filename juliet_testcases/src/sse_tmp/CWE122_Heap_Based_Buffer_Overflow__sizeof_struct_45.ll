; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !17

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_bad() #0 !dbg !26 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !32
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !42
  store i32 1, i32* %intOne, align 4, !dbg !43
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !45
  store i32 2, i32* %intTwo, align 4, !dbg !46
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !47
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_badData, align 8, !dbg !48
  call void @badSink(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !74 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_badData, align 8, !dbg !77
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !79
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !80
  call void @free(i8* %3) #5, !dbg !81
  ret void, !dbg !82
}

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !87
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !88
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !90
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !97
  store i32 1, i32* %intOne, align 4, !dbg !98
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !100
  store i32 2, i32* %intTwo, align 4, !dbg !101
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_goodG2BData, align 8, !dbg !103
  call void @goodG2BSink(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !106 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_goodG2BData, align 8, !dbg !109
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !110
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !111
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !112
  call void @free(i8* %3) #5, !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_badData", scope: !2, file: !19, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14, !15}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0, !17}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_goodG2BData", scope: !2, file: !19, line: 20, type: !6, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_bad", scope: !19, file: !19, line: 32, type: !27, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !19, line: 34, type: !6)
!30 = !DILocation(line: 34, column: 21, scope: !26)
!31 = !DILocation(line: 36, column: 10, scope: !26)
!32 = !DILocation(line: 39, column: 29, scope: !26)
!33 = !DILocation(line: 39, column: 12, scope: !26)
!34 = !DILocation(line: 39, column: 10, scope: !26)
!35 = !DILocation(line: 40, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !19, line: 40, column: 9)
!37 = !DILocation(line: 40, column: 14, scope: !36)
!38 = !DILocation(line: 40, column: 9, scope: !26)
!39 = !DILocation(line: 40, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 40, column: 23)
!41 = !DILocation(line: 41, column: 5, scope: !26)
!42 = !DILocation(line: 41, column: 11, scope: !26)
!43 = !DILocation(line: 41, column: 18, scope: !26)
!44 = !DILocation(line: 42, column: 5, scope: !26)
!45 = !DILocation(line: 42, column: 11, scope: !26)
!46 = !DILocation(line: 42, column: 18, scope: !26)
!47 = !DILocation(line: 43, column: 67, scope: !26)
!48 = !DILocation(line: 43, column: 65, scope: !26)
!49 = !DILocation(line: 44, column: 5, scope: !26)
!50 = !DILocation(line: 45, column: 1, scope: !26)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_45_good", scope: !19, file: !19, line: 74, type: !27, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 76, column: 5, scope: !51)
!53 = !DILocation(line: 77, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 88, type: !55, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!12, !12, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !19, line: 88, type: !12)
!61 = !DILocation(line: 88, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !19, line: 88, type: !57)
!63 = !DILocation(line: 88, column: 27, scope: !54)
!64 = !DILocation(line: 91, column: 22, scope: !54)
!65 = !DILocation(line: 91, column: 12, scope: !54)
!66 = !DILocation(line: 91, column: 5, scope: !54)
!67 = !DILocation(line: 93, column: 5, scope: !54)
!68 = !DILocation(line: 94, column: 5, scope: !54)
!69 = !DILocation(line: 95, column: 5, scope: !54)
!70 = !DILocation(line: 98, column: 5, scope: !54)
!71 = !DILocation(line: 99, column: 5, scope: !54)
!72 = !DILocation(line: 100, column: 5, scope: !54)
!73 = !DILocation(line: 102, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 24, type: !27, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !19, line: 26, type: !6)
!76 = !DILocation(line: 26, column: 21, scope: !74)
!77 = !DILocation(line: 26, column: 28, scope: !74)
!78 = !DILocation(line: 28, column: 21, scope: !74)
!79 = !DILocation(line: 28, column: 5, scope: !74)
!80 = !DILocation(line: 29, column: 10, scope: !74)
!81 = !DILocation(line: 29, column: 5, scope: !74)
!82 = !DILocation(line: 30, column: 1, scope: !74)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 60, type: !27, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !19, line: 62, type: !6)
!85 = !DILocation(line: 62, column: 21, scope: !83)
!86 = !DILocation(line: 64, column: 10, scope: !83)
!87 = !DILocation(line: 66, column: 29, scope: !83)
!88 = !DILocation(line: 66, column: 12, scope: !83)
!89 = !DILocation(line: 66, column: 10, scope: !83)
!90 = !DILocation(line: 67, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !19, line: 67, column: 9)
!92 = !DILocation(line: 67, column: 14, scope: !91)
!93 = !DILocation(line: 67, column: 9, scope: !83)
!94 = !DILocation(line: 67, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 67, column: 23)
!96 = !DILocation(line: 68, column: 5, scope: !83)
!97 = !DILocation(line: 68, column: 11, scope: !83)
!98 = !DILocation(line: 68, column: 18, scope: !83)
!99 = !DILocation(line: 69, column: 5, scope: !83)
!100 = !DILocation(line: 69, column: 11, scope: !83)
!101 = !DILocation(line: 69, column: 18, scope: !83)
!102 = !DILocation(line: 70, column: 71, scope: !83)
!103 = !DILocation(line: 70, column: 69, scope: !83)
!104 = !DILocation(line: 71, column: 5, scope: !83)
!105 = !DILocation(line: 72, column: 1, scope: !83)
!106 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 52, type: !27, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !19, line: 54, type: !6)
!108 = !DILocation(line: 54, column: 21, scope: !106)
!109 = !DILocation(line: 54, column: 28, scope: !106)
!110 = !DILocation(line: 56, column: 21, scope: !106)
!111 = !DILocation(line: 56, column: 5, scope: !106)
!112 = !DILocation(line: 57, column: 10, scope: !106)
!113 = !DILocation(line: 57, column: 5, scope: !106)
!114 = !DILocation(line: 58, column: 1, scope: !106)
