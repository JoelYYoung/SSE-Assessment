; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !26, metadata !DIExpression()), !dbg !30
  store void (%struct._twoIntsStruct*)* @badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !30
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
  %4 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !47
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !48
  call void %4(%struct._twoIntsStruct* %5), !dbg !47
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(%struct._twoIntsStruct* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !53
  call void @printStructLine(%struct._twoIntsStruct* %0), !dbg !54
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !55
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !55
  call void @free(i8* %2) #5, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !84, metadata !DIExpression()), !dbg !85
  store void (%struct._twoIntsStruct*)* @goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !85
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
  %4 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !102
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !103
  call void %4(%struct._twoIntsStruct* %5), !dbg !102
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !105 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !108
  call void @printStructLine(%struct._twoIntsStruct* %0), !dbg !109
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !110
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !110
  call void @free(i8* %2) #5, !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_bad", scope: !21, file: !21, line: 28, type: !22, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 30, type: !4)
!25 = !DILocation(line: 30, column: 21, scope: !20)
!26 = !DILocalVariable(name: "funcPtr", scope: !20, file: !21, line: 32, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !4}
!30 = !DILocation(line: 32, column: 12, scope: !20)
!31 = !DILocation(line: 34, column: 10, scope: !20)
!32 = !DILocation(line: 37, column: 29, scope: !20)
!33 = !DILocation(line: 37, column: 12, scope: !20)
!34 = !DILocation(line: 37, column: 10, scope: !20)
!35 = !DILocation(line: 38, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !20, file: !21, line: 38, column: 9)
!37 = !DILocation(line: 38, column: 14, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !20)
!39 = !DILocation(line: 38, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !21, line: 38, column: 23)
!41 = !DILocation(line: 39, column: 5, scope: !20)
!42 = !DILocation(line: 39, column: 11, scope: !20)
!43 = !DILocation(line: 39, column: 18, scope: !20)
!44 = !DILocation(line: 40, column: 5, scope: !20)
!45 = !DILocation(line: 40, column: 11, scope: !20)
!46 = !DILocation(line: 40, column: 18, scope: !20)
!47 = !DILocation(line: 42, column: 5, scope: !20)
!48 = !DILocation(line: 42, column: 13, scope: !20)
!49 = !DILocation(line: 43, column: 1, scope: !20)
!50 = distinct !DISubprogram(name: "badSink", scope: !21, file: !21, line: 21, type: !28, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !21, line: 21, type: !4)
!52 = !DILocation(line: 21, column: 37, scope: !50)
!53 = !DILocation(line: 24, column: 21, scope: !50)
!54 = !DILocation(line: 24, column: 5, scope: !50)
!55 = !DILocation(line: 25, column: 10, scope: !50)
!56 = !DILocation(line: 25, column: 5, scope: !50)
!57 = !DILocation(line: 26, column: 1, scope: !50)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_44_good", scope: !21, file: !21, line: 71, type: !22, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 73, column: 5, scope: !58)
!60 = !DILocation(line: 74, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 85, type: !62, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!10, !10, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !21, line: 85, type: !10)
!68 = !DILocation(line: 85, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !21, line: 85, type: !64)
!70 = !DILocation(line: 85, column: 27, scope: !61)
!71 = !DILocation(line: 88, column: 22, scope: !61)
!72 = !DILocation(line: 88, column: 12, scope: !61)
!73 = !DILocation(line: 88, column: 5, scope: !61)
!74 = !DILocation(line: 90, column: 5, scope: !61)
!75 = !DILocation(line: 91, column: 5, scope: !61)
!76 = !DILocation(line: 92, column: 5, scope: !61)
!77 = !DILocation(line: 95, column: 5, scope: !61)
!78 = !DILocation(line: 96, column: 5, scope: !61)
!79 = !DILocation(line: 97, column: 5, scope: !61)
!80 = !DILocation(line: 99, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !21, line: 59, type: !4)
!83 = !DILocation(line: 59, column: 21, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !21, line: 60, type: !27)
!85 = !DILocation(line: 60, column: 12, scope: !81)
!86 = !DILocation(line: 62, column: 10, scope: !81)
!87 = !DILocation(line: 64, column: 29, scope: !81)
!88 = !DILocation(line: 64, column: 12, scope: !81)
!89 = !DILocation(line: 64, column: 10, scope: !81)
!90 = !DILocation(line: 65, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !21, line: 65, column: 9)
!92 = !DILocation(line: 65, column: 14, scope: !91)
!93 = !DILocation(line: 65, column: 9, scope: !81)
!94 = !DILocation(line: 65, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !21, line: 65, column: 23)
!96 = !DILocation(line: 66, column: 5, scope: !81)
!97 = !DILocation(line: 66, column: 11, scope: !81)
!98 = !DILocation(line: 66, column: 18, scope: !81)
!99 = !DILocation(line: 67, column: 5, scope: !81)
!100 = !DILocation(line: 67, column: 11, scope: !81)
!101 = !DILocation(line: 67, column: 18, scope: !81)
!102 = !DILocation(line: 68, column: 5, scope: !81)
!103 = !DILocation(line: 68, column: 13, scope: !81)
!104 = !DILocation(line: 69, column: 1, scope: !81)
!105 = distinct !DISubprogram(name: "goodG2BSink", scope: !21, file: !21, line: 50, type: !28, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", arg: 1, scope: !105, file: !21, line: 50, type: !4)
!107 = !DILocation(line: 50, column: 41, scope: !105)
!108 = !DILocation(line: 53, column: 21, scope: !105)
!109 = !DILocation(line: 53, column: 5, scope: !105)
!110 = !DILocation(line: 54, column: 10, scope: !105)
!111 = !DILocation(line: 54, column: 5, scope: !105)
!112 = !DILocation(line: 55, column: 1, scope: !105)
