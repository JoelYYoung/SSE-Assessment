; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !34
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !44
  store i32 1, i32* %intOne, align 4, !dbg !45
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !46
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !47
  store i32 2, i32* %intTwo, align 4, !dbg !48
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !49
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !50
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !52, metadata !DIExpression()), !dbg !54
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !55
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !55
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !54
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !56
  call void @printStructLine(%struct._twoIntsStruct* %6), !dbg !57
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !58
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !58
  call void @free(i8* %8) #5, !dbg !59
  ret void, !dbg !60
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType* %myUnion, metadata !87, metadata !DIExpression()), !dbg !88
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !90
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !91
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !92
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !100
  store i32 1, i32* %intOne, align 4, !dbg !101
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !103
  store i32 2, i32* %intTwo, align 4, !dbg !104
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !105
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !106
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !108, metadata !DIExpression()), !dbg !110
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !111
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !111
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !110
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !112
  call void @printStructLine(%struct._twoIntsStruct* %6), !dbg !113
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !114
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !114
  call void @free(i8* %8) #5, !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_bad", scope: !21, file: !21, line: 27, type: !22, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 29, type: !4)
!25 = !DILocation(line: 29, column: 21, scope: !20)
!26 = !DILocalVariable(name: "myUnion", scope: !20, file: !21, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_unionType", file: !21, line: 23, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !21, line: 19, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !21, line: 21, baseType: !4, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !21, line: 22, baseType: !4, size: 64)
!32 = !DILocation(line: 30, column: 67, scope: !20)
!33 = !DILocation(line: 32, column: 10, scope: !20)
!34 = !DILocation(line: 35, column: 29, scope: !20)
!35 = !DILocation(line: 35, column: 12, scope: !20)
!36 = !DILocation(line: 35, column: 10, scope: !20)
!37 = !DILocation(line: 36, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !20, file: !21, line: 36, column: 9)
!39 = !DILocation(line: 36, column: 14, scope: !38)
!40 = !DILocation(line: 36, column: 9, scope: !20)
!41 = !DILocation(line: 36, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !21, line: 36, column: 23)
!43 = !DILocation(line: 37, column: 5, scope: !20)
!44 = !DILocation(line: 37, column: 11, scope: !20)
!45 = !DILocation(line: 37, column: 18, scope: !20)
!46 = !DILocation(line: 38, column: 5, scope: !20)
!47 = !DILocation(line: 38, column: 11, scope: !20)
!48 = !DILocation(line: 38, column: 18, scope: !20)
!49 = !DILocation(line: 39, column: 26, scope: !20)
!50 = !DILocation(line: 39, column: 13, scope: !20)
!51 = !DILocation(line: 39, column: 24, scope: !20)
!52 = !DILocalVariable(name: "data", scope: !53, file: !21, line: 41, type: !4)
!53 = distinct !DILexicalBlock(scope: !20, file: !21, line: 40, column: 5)
!54 = !DILocation(line: 41, column: 25, scope: !53)
!55 = !DILocation(line: 41, column: 40, scope: !53)
!56 = !DILocation(line: 43, column: 25, scope: !53)
!57 = !DILocation(line: 43, column: 9, scope: !53)
!58 = !DILocation(line: 44, column: 14, scope: !53)
!59 = !DILocation(line: 44, column: 9, scope: !53)
!60 = !DILocation(line: 46, column: 1, scope: !20)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_34_good", scope: !21, file: !21, line: 73, type: !22, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 75, column: 5, scope: !61)
!63 = !DILocation(line: 76, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 87, type: !65, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!10, !10, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !21, line: 87, type: !10)
!71 = !DILocation(line: 87, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !21, line: 87, type: !67)
!73 = !DILocation(line: 87, column: 27, scope: !64)
!74 = !DILocation(line: 90, column: 22, scope: !64)
!75 = !DILocation(line: 90, column: 12, scope: !64)
!76 = !DILocation(line: 90, column: 5, scope: !64)
!77 = !DILocation(line: 92, column: 5, scope: !64)
!78 = !DILocation(line: 93, column: 5, scope: !64)
!79 = !DILocation(line: 94, column: 5, scope: !64)
!80 = !DILocation(line: 97, column: 5, scope: !64)
!81 = !DILocation(line: 98, column: 5, scope: !64)
!82 = !DILocation(line: 99, column: 5, scope: !64)
!83 = !DILocation(line: 101, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 53, type: !22, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !21, line: 55, type: !4)
!86 = !DILocation(line: 55, column: 21, scope: !84)
!87 = !DILocalVariable(name: "myUnion", scope: !84, file: !21, line: 56, type: !27)
!88 = !DILocation(line: 56, column: 67, scope: !84)
!89 = !DILocation(line: 58, column: 10, scope: !84)
!90 = !DILocation(line: 60, column: 29, scope: !84)
!91 = !DILocation(line: 60, column: 12, scope: !84)
!92 = !DILocation(line: 60, column: 10, scope: !84)
!93 = !DILocation(line: 61, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !84, file: !21, line: 61, column: 9)
!95 = !DILocation(line: 61, column: 14, scope: !94)
!96 = !DILocation(line: 61, column: 9, scope: !84)
!97 = !DILocation(line: 61, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !21, line: 61, column: 23)
!99 = !DILocation(line: 62, column: 5, scope: !84)
!100 = !DILocation(line: 62, column: 11, scope: !84)
!101 = !DILocation(line: 62, column: 18, scope: !84)
!102 = !DILocation(line: 63, column: 5, scope: !84)
!103 = !DILocation(line: 63, column: 11, scope: !84)
!104 = !DILocation(line: 63, column: 18, scope: !84)
!105 = !DILocation(line: 64, column: 26, scope: !84)
!106 = !DILocation(line: 64, column: 13, scope: !84)
!107 = !DILocation(line: 64, column: 24, scope: !84)
!108 = !DILocalVariable(name: "data", scope: !109, file: !21, line: 66, type: !4)
!109 = distinct !DILexicalBlock(scope: !84, file: !21, line: 65, column: 5)
!110 = !DILocation(line: 66, column: 25, scope: !109)
!111 = !DILocation(line: 66, column: 40, scope: !109)
!112 = !DILocation(line: 68, column: 25, scope: !109)
!113 = !DILocation(line: 68, column: 9, scope: !109)
!114 = !DILocation(line: 69, column: 14, scope: !109)
!115 = !DILocation(line: 69, column: 9, scope: !109)
!116 = !DILocation(line: 71, column: 1, scope: !84)
