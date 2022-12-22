; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_badSink(%struct._twoIntsStruct* %data) #0 !dbg !20 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !26
  call void @printStructLine(%struct._twoIntsStruct* %0), !dbg !27
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !28
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !28
  call void @free(i8* %2) #5, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_bad() #0 !dbg !31 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !34, metadata !DIExpression()), !dbg !35
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !37
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !46
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !47
  store i32 1, i32* %intOne, align 4, !dbg !48
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !49
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !50
  store i32 2, i32* %intTwo, align 4, !dbg !51
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_badSink(%struct._twoIntsStruct* %4), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !55 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !58
  call void @printStructLine(%struct._twoIntsStruct* %0), !dbg !59
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !60
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !60
  call void @free(i8* %2) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !87, metadata !DIExpression()), !dbg !88
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_goodG2BSink(%struct._twoIntsStruct* %4), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_badSink", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !21, line: 21, type: !4)
!25 = !DILocation(line: 21, column: 82, scope: !20)
!26 = !DILocation(line: 24, column: 21, scope: !20)
!27 = !DILocation(line: 24, column: 5, scope: !20)
!28 = !DILocation(line: 25, column: 10, scope: !20)
!29 = !DILocation(line: 25, column: 5, scope: !20)
!30 = !DILocation(line: 26, column: 1, scope: !20)
!31 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_bad", scope: !21, file: !21, line: 28, type: !32, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocalVariable(name: "data", scope: !31, file: !21, line: 30, type: !4)
!35 = !DILocation(line: 30, column: 21, scope: !31)
!36 = !DILocation(line: 32, column: 10, scope: !31)
!37 = !DILocation(line: 35, column: 29, scope: !31)
!38 = !DILocation(line: 35, column: 12, scope: !31)
!39 = !DILocation(line: 35, column: 10, scope: !31)
!40 = !DILocation(line: 36, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !31, file: !21, line: 36, column: 9)
!42 = !DILocation(line: 36, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 9, scope: !31)
!44 = !DILocation(line: 36, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !21, line: 36, column: 23)
!46 = !DILocation(line: 37, column: 5, scope: !31)
!47 = !DILocation(line: 37, column: 11, scope: !31)
!48 = !DILocation(line: 37, column: 18, scope: !31)
!49 = !DILocation(line: 38, column: 5, scope: !31)
!50 = !DILocation(line: 38, column: 11, scope: !31)
!51 = !DILocation(line: 38, column: 18, scope: !31)
!52 = !DILocation(line: 39, column: 65, scope: !31)
!53 = !DILocation(line: 39, column: 5, scope: !31)
!54 = !DILocation(line: 40, column: 1, scope: !31)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_goodG2BSink", scope: !21, file: !21, line: 46, type: !22, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !21, line: 46, type: !4)
!57 = !DILocation(line: 46, column: 86, scope: !55)
!58 = !DILocation(line: 49, column: 21, scope: !55)
!59 = !DILocation(line: 49, column: 5, scope: !55)
!60 = !DILocation(line: 50, column: 10, scope: !55)
!61 = !DILocation(line: 50, column: 5, scope: !55)
!62 = !DILocation(line: 51, column: 1, scope: !55)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_41_good", scope: !21, file: !21, line: 67, type: !32, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 69, column: 5, scope: !63)
!65 = !DILocation(line: 70, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 82, type: !67, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!10, !10, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !21, line: 82, type: !10)
!73 = !DILocation(line: 82, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !21, line: 82, type: !69)
!75 = !DILocation(line: 82, column: 27, scope: !66)
!76 = !DILocation(line: 85, column: 22, scope: !66)
!77 = !DILocation(line: 85, column: 12, scope: !66)
!78 = !DILocation(line: 85, column: 5, scope: !66)
!79 = !DILocation(line: 87, column: 5, scope: !66)
!80 = !DILocation(line: 88, column: 5, scope: !66)
!81 = !DILocation(line: 89, column: 5, scope: !66)
!82 = !DILocation(line: 92, column: 5, scope: !66)
!83 = !DILocation(line: 93, column: 5, scope: !66)
!84 = !DILocation(line: 94, column: 5, scope: !66)
!85 = !DILocation(line: 96, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 54, type: !32, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !21, line: 56, type: !4)
!88 = !DILocation(line: 56, column: 21, scope: !86)
!89 = !DILocation(line: 58, column: 10, scope: !86)
!90 = !DILocation(line: 60, column: 29, scope: !86)
!91 = !DILocation(line: 60, column: 12, scope: !86)
!92 = !DILocation(line: 60, column: 10, scope: !86)
!93 = !DILocation(line: 61, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !86, file: !21, line: 61, column: 9)
!95 = !DILocation(line: 61, column: 14, scope: !94)
!96 = !DILocation(line: 61, column: 9, scope: !86)
!97 = !DILocation(line: 61, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !21, line: 61, column: 23)
!99 = !DILocation(line: 62, column: 5, scope: !86)
!100 = !DILocation(line: 62, column: 11, scope: !86)
!101 = !DILocation(line: 62, column: 18, scope: !86)
!102 = !DILocation(line: 63, column: 5, scope: !86)
!103 = !DILocation(line: 63, column: 11, scope: !86)
!104 = !DILocation(line: 63, column: 18, scope: !86)
!105 = !DILocation(line: 64, column: 69, scope: !86)
!106 = !DILocation(line: 64, column: 5, scope: !86)
!107 = !DILocation(line: 65, column: 1, scope: !86)
