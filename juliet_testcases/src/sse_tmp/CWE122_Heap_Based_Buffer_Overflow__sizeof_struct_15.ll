; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !37
  store i32 1, i32* %intOne, align 4, !dbg !38
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !40
  store i32 2, i32* %intTwo, align 4, !dbg !41
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !43
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !44
  call void @free(i8* %6) #5, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !75
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !76
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !85
  store i32 1, i32* %intOne, align 4, !dbg !86
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !88
  store i32 2, i32* %intTwo, align 4, !dbg !89
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !90
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !91
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !92
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !92
  call void @free(i8* %6) #5, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !99
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !100
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !101
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !109
  store i32 1, i32* %intOne, align 4, !dbg !110
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !111
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !112
  store i32 2, i32* %intTwo, align 4, !dbg !113
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !114
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !115
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !116
  call void @free(i8* %6) #5, !dbg !117
  ret void, !dbg !118
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 25, column: 10, scope: !20)
!27 = !DILocation(line: 31, column: 33, scope: !20)
!28 = !DILocation(line: 31, column: 16, scope: !20)
!29 = !DILocation(line: 31, column: 14, scope: !20)
!30 = !DILocation(line: 32, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 32, column: 13)
!32 = !DILocation(line: 32, column: 18, scope: !31)
!33 = !DILocation(line: 32, column: 13, scope: !20)
!34 = !DILocation(line: 32, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 32, column: 27)
!36 = !DILocation(line: 33, column: 9, scope: !20)
!37 = !DILocation(line: 33, column: 15, scope: !20)
!38 = !DILocation(line: 33, column: 22, scope: !20)
!39 = !DILocation(line: 34, column: 9, scope: !20)
!40 = !DILocation(line: 34, column: 15, scope: !20)
!41 = !DILocation(line: 34, column: 22, scope: !20)
!42 = !DILocation(line: 42, column: 21, scope: !20)
!43 = !DILocation(line: 42, column: 5, scope: !20)
!44 = !DILocation(line: 43, column: 10, scope: !20)
!45 = !DILocation(line: 43, column: 5, scope: !20)
!46 = !DILocation(line: 44, column: 1, scope: !20)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_15_good", scope: !21, file: !21, line: 100, type: !22, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 102, column: 5, scope: !47)
!49 = !DILocation(line: 103, column: 5, scope: !47)
!50 = !DILocation(line: 104, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 116, type: !52, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!10, !10, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !21, line: 116, type: !10)
!58 = !DILocation(line: 116, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !21, line: 116, type: !54)
!60 = !DILocation(line: 116, column: 27, scope: !51)
!61 = !DILocation(line: 119, column: 22, scope: !51)
!62 = !DILocation(line: 119, column: 12, scope: !51)
!63 = !DILocation(line: 119, column: 5, scope: !51)
!64 = !DILocation(line: 121, column: 5, scope: !51)
!65 = !DILocation(line: 122, column: 5, scope: !51)
!66 = !DILocation(line: 123, column: 5, scope: !51)
!67 = !DILocation(line: 126, column: 5, scope: !51)
!68 = !DILocation(line: 127, column: 5, scope: !51)
!69 = !DILocation(line: 128, column: 5, scope: !51)
!70 = !DILocation(line: 130, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 51, type: !22, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !21, line: 53, type: !4)
!73 = !DILocation(line: 53, column: 21, scope: !71)
!74 = !DILocation(line: 55, column: 10, scope: !71)
!75 = !DILocation(line: 64, column: 33, scope: !71)
!76 = !DILocation(line: 64, column: 16, scope: !71)
!77 = !DILocation(line: 64, column: 14, scope: !71)
!78 = !DILocation(line: 65, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !21, line: 65, column: 13)
!80 = !DILocation(line: 65, column: 18, scope: !79)
!81 = !DILocation(line: 65, column: 13, scope: !71)
!82 = !DILocation(line: 65, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !21, line: 65, column: 27)
!84 = !DILocation(line: 66, column: 9, scope: !71)
!85 = !DILocation(line: 66, column: 15, scope: !71)
!86 = !DILocation(line: 66, column: 22, scope: !71)
!87 = !DILocation(line: 67, column: 9, scope: !71)
!88 = !DILocation(line: 67, column: 15, scope: !71)
!89 = !DILocation(line: 67, column: 22, scope: !71)
!90 = !DILocation(line: 71, column: 21, scope: !71)
!91 = !DILocation(line: 71, column: 5, scope: !71)
!92 = !DILocation(line: 72, column: 10, scope: !71)
!93 = !DILocation(line: 72, column: 5, scope: !71)
!94 = !DILocation(line: 73, column: 1, scope: !71)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 76, type: !22, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !21, line: 78, type: !4)
!97 = !DILocation(line: 78, column: 21, scope: !95)
!98 = !DILocation(line: 80, column: 10, scope: !95)
!99 = !DILocation(line: 85, column: 33, scope: !95)
!100 = !DILocation(line: 85, column: 16, scope: !95)
!101 = !DILocation(line: 85, column: 14, scope: !95)
!102 = !DILocation(line: 86, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !21, line: 86, column: 13)
!104 = !DILocation(line: 86, column: 18, scope: !103)
!105 = !DILocation(line: 86, column: 13, scope: !95)
!106 = !DILocation(line: 86, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !21, line: 86, column: 27)
!108 = !DILocation(line: 87, column: 9, scope: !95)
!109 = !DILocation(line: 87, column: 15, scope: !95)
!110 = !DILocation(line: 87, column: 22, scope: !95)
!111 = !DILocation(line: 88, column: 9, scope: !95)
!112 = !DILocation(line: 88, column: 15, scope: !95)
!113 = !DILocation(line: 88, column: 22, scope: !95)
!114 = !DILocation(line: 96, column: 21, scope: !95)
!115 = !DILocation(line: 96, column: 5, scope: !95)
!116 = !DILocation(line: 97, column: 10, scope: !95)
!117 = !DILocation(line: 97, column: 5, scope: !95)
!118 = !DILocation(line: 98, column: 1, scope: !95)
