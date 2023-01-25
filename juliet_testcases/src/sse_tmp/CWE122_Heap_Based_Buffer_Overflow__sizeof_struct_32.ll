; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !26, metadata !DIExpression()), !dbg !28
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !35
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !36
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !37
  %2 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data1, align 8, !dbg !39
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !40
  %cmp = icmp eq %struct._twoIntsStruct* %3, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !46
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 0, !dbg !47
  store i32 1, i32* %intOne, align 4, !dbg !48
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !49
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i32 0, i32 1, !dbg !50
  store i32 2, i32* %intTwo, align 4, !dbg !51
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !52
  %7 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !53
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %7, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !55, metadata !DIExpression()), !dbg !57
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !58
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %8, align 8, !dbg !59
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data2, align 8, !dbg !57
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !60
  call void @printStructLine(%struct._twoIntsStruct* %10), !dbg !61
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !62
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !62
  call void @free(i8* %12) #5, !dbg !63
  ret void, !dbg !64
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !91, metadata !DIExpression()), !dbg !92
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !93, metadata !DIExpression()), !dbg !94
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !94
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !99
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !100
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !101
  %2 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !102
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data1, align 8, !dbg !103
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !104
  %cmp = icmp eq %struct._twoIntsStruct* %3, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !110
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 0, !dbg !111
  store i32 1, i32* %intOne, align 4, !dbg !112
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !113
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i32 0, i32 1, !dbg !114
  store i32 2, i32* %intTwo, align 4, !dbg !115
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !116
  %7 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !117
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %7, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !119, metadata !DIExpression()), !dbg !121
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !122
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %8, align 8, !dbg !123
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data2, align 8, !dbg !121
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !124
  call void @printStructLine(%struct._twoIntsStruct* %10), !dbg !125
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !126
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !126
  call void @free(i8* %12) #5, !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocalVariable(name: "dataPtr1", scope: !20, file: !21, line: 24, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!28 = !DILocation(line: 24, column: 22, scope: !20)
!29 = !DILocalVariable(name: "dataPtr2", scope: !20, file: !21, line: 25, type: !27)
!30 = !DILocation(line: 25, column: 22, scope: !20)
!31 = !DILocation(line: 27, column: 10, scope: !20)
!32 = !DILocalVariable(name: "data", scope: !33, file: !21, line: 29, type: !4)
!33 = distinct !DILexicalBlock(scope: !20, file: !21, line: 28, column: 5)
!34 = !DILocation(line: 29, column: 25, scope: !33)
!35 = !DILocation(line: 29, column: 33, scope: !33)
!36 = !DILocation(line: 29, column: 32, scope: !33)
!37 = !DILocation(line: 32, column: 33, scope: !33)
!38 = !DILocation(line: 32, column: 16, scope: !33)
!39 = !DILocation(line: 32, column: 14, scope: !33)
!40 = !DILocation(line: 33, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !21, line: 33, column: 13)
!42 = !DILocation(line: 33, column: 18, scope: !41)
!43 = !DILocation(line: 33, column: 13, scope: !33)
!44 = !DILocation(line: 33, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !21, line: 33, column: 27)
!46 = !DILocation(line: 34, column: 9, scope: !33)
!47 = !DILocation(line: 34, column: 15, scope: !33)
!48 = !DILocation(line: 34, column: 22, scope: !33)
!49 = !DILocation(line: 35, column: 9, scope: !33)
!50 = !DILocation(line: 35, column: 15, scope: !33)
!51 = !DILocation(line: 35, column: 22, scope: !33)
!52 = !DILocation(line: 36, column: 21, scope: !33)
!53 = !DILocation(line: 36, column: 10, scope: !33)
!54 = !DILocation(line: 36, column: 19, scope: !33)
!55 = !DILocalVariable(name: "data", scope: !56, file: !21, line: 39, type: !4)
!56 = distinct !DILexicalBlock(scope: !20, file: !21, line: 38, column: 5)
!57 = !DILocation(line: 39, column: 25, scope: !56)
!58 = !DILocation(line: 39, column: 33, scope: !56)
!59 = !DILocation(line: 39, column: 32, scope: !56)
!60 = !DILocation(line: 41, column: 25, scope: !56)
!61 = !DILocation(line: 41, column: 9, scope: !56)
!62 = !DILocation(line: 42, column: 14, scope: !56)
!63 = !DILocation(line: 42, column: 9, scope: !56)
!64 = !DILocation(line: 44, column: 1, scope: !20)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_32_good", scope: !21, file: !21, line: 75, type: !22, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 77, column: 5, scope: !65)
!67 = !DILocation(line: 78, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 89, type: !69, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!10, !10, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !21, line: 89, type: !10)
!75 = !DILocation(line: 89, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !21, line: 89, type: !71)
!77 = !DILocation(line: 89, column: 27, scope: !68)
!78 = !DILocation(line: 92, column: 22, scope: !68)
!79 = !DILocation(line: 92, column: 12, scope: !68)
!80 = !DILocation(line: 92, column: 5, scope: !68)
!81 = !DILocation(line: 94, column: 5, scope: !68)
!82 = !DILocation(line: 95, column: 5, scope: !68)
!83 = !DILocation(line: 96, column: 5, scope: !68)
!84 = !DILocation(line: 99, column: 5, scope: !68)
!85 = !DILocation(line: 100, column: 5, scope: !68)
!86 = !DILocation(line: 101, column: 5, scope: !68)
!87 = !DILocation(line: 103, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 51, type: !22, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !21, line: 53, type: !4)
!90 = !DILocation(line: 53, column: 21, scope: !88)
!91 = !DILocalVariable(name: "dataPtr1", scope: !88, file: !21, line: 54, type: !27)
!92 = !DILocation(line: 54, column: 22, scope: !88)
!93 = !DILocalVariable(name: "dataPtr2", scope: !88, file: !21, line: 55, type: !27)
!94 = !DILocation(line: 55, column: 22, scope: !88)
!95 = !DILocation(line: 57, column: 10, scope: !88)
!96 = !DILocalVariable(name: "data", scope: !97, file: !21, line: 59, type: !4)
!97 = distinct !DILexicalBlock(scope: !88, file: !21, line: 58, column: 5)
!98 = !DILocation(line: 59, column: 25, scope: !97)
!99 = !DILocation(line: 59, column: 33, scope: !97)
!100 = !DILocation(line: 59, column: 32, scope: !97)
!101 = !DILocation(line: 61, column: 33, scope: !97)
!102 = !DILocation(line: 61, column: 16, scope: !97)
!103 = !DILocation(line: 61, column: 14, scope: !97)
!104 = !DILocation(line: 62, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !21, line: 62, column: 13)
!106 = !DILocation(line: 62, column: 18, scope: !105)
!107 = !DILocation(line: 62, column: 13, scope: !97)
!108 = !DILocation(line: 62, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !21, line: 62, column: 27)
!110 = !DILocation(line: 63, column: 9, scope: !97)
!111 = !DILocation(line: 63, column: 15, scope: !97)
!112 = !DILocation(line: 63, column: 22, scope: !97)
!113 = !DILocation(line: 64, column: 9, scope: !97)
!114 = !DILocation(line: 64, column: 15, scope: !97)
!115 = !DILocation(line: 64, column: 22, scope: !97)
!116 = !DILocation(line: 65, column: 21, scope: !97)
!117 = !DILocation(line: 65, column: 10, scope: !97)
!118 = !DILocation(line: 65, column: 19, scope: !97)
!119 = !DILocalVariable(name: "data", scope: !120, file: !21, line: 68, type: !4)
!120 = distinct !DILexicalBlock(scope: !88, file: !21, line: 67, column: 5)
!121 = !DILocation(line: 68, column: 25, scope: !120)
!122 = !DILocation(line: 68, column: 33, scope: !120)
!123 = !DILocation(line: 68, column: 32, scope: !120)
!124 = !DILocation(line: 70, column: 25, scope: !120)
!125 = !DILocation(line: 70, column: 9, scope: !120)
!126 = !DILocation(line: 71, column: 14, scope: !120)
!127 = !DILocation(line: 71, column: 9, scope: !120)
!128 = !DILocation(line: 73, column: 1, scope: !88)
