; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !39
  store i32 1, i32* %intOne, align 4, !dbg !40
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !42
  store i32 2, i32* %intTwo, align 4, !dbg !43
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !45
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !46
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !46
  call void @free(i8* %6) #5, !dbg !47
  ret void, !dbg !48
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !77
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !80
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !89
  store i32 1, i32* %intOne, align 4, !dbg !90
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !91
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !92
  store i32 2, i32* %intTwo, align 4, !dbg !93
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !95
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !96
  call void @free(i8* %6) #5, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !103
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !106
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !115
  store i32 1, i32* %intOne, align 4, !dbg !116
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !118
  store i32 2, i32* %intTwo, align 4, !dbg !119
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  call void @printStructLine(%struct._twoIntsStruct* %4), !dbg !121
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !122
  call void @free(i8* %6) #5, !dbg !123
  ret void, !dbg !124
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 25, column: 10, scope: !20)
!27 = !DILocation(line: 30, column: 33, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !21, line: 27, column: 5)
!29 = distinct !DILexicalBlock(scope: !20, file: !21, line: 26, column: 8)
!30 = !DILocation(line: 30, column: 16, scope: !28)
!31 = !DILocation(line: 30, column: 14, scope: !28)
!32 = !DILocation(line: 31, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !21, line: 31, column: 13)
!34 = !DILocation(line: 31, column: 18, scope: !33)
!35 = !DILocation(line: 31, column: 13, scope: !28)
!36 = !DILocation(line: 31, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !21, line: 31, column: 27)
!38 = !DILocation(line: 32, column: 9, scope: !28)
!39 = !DILocation(line: 32, column: 15, scope: !28)
!40 = !DILocation(line: 32, column: 22, scope: !28)
!41 = !DILocation(line: 33, column: 9, scope: !28)
!42 = !DILocation(line: 33, column: 15, scope: !28)
!43 = !DILocation(line: 33, column: 22, scope: !28)
!44 = !DILocation(line: 36, column: 21, scope: !20)
!45 = !DILocation(line: 36, column: 5, scope: !20)
!46 = !DILocation(line: 37, column: 10, scope: !20)
!47 = !DILocation(line: 37, column: 5, scope: !20)
!48 = !DILocation(line: 38, column: 1, scope: !20)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_03_good", scope: !21, file: !21, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 89, column: 5, scope: !49)
!51 = !DILocation(line: 90, column: 5, scope: !49)
!52 = !DILocation(line: 91, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 103, type: !54, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!10, !10, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !21, line: 103, type: !10)
!60 = !DILocation(line: 103, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !21, line: 103, type: !56)
!62 = !DILocation(line: 103, column: 27, scope: !53)
!63 = !DILocation(line: 106, column: 22, scope: !53)
!64 = !DILocation(line: 106, column: 12, scope: !53)
!65 = !DILocation(line: 106, column: 5, scope: !53)
!66 = !DILocation(line: 108, column: 5, scope: !53)
!67 = !DILocation(line: 109, column: 5, scope: !53)
!68 = !DILocation(line: 110, column: 5, scope: !53)
!69 = !DILocation(line: 113, column: 5, scope: !53)
!70 = !DILocation(line: 114, column: 5, scope: !53)
!71 = !DILocation(line: 115, column: 5, scope: !53)
!72 = !DILocation(line: 117, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 45, type: !22, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !21, line: 47, type: !4)
!75 = !DILocation(line: 47, column: 21, scope: !73)
!76 = !DILocation(line: 49, column: 10, scope: !73)
!77 = !DILocation(line: 58, column: 33, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !21, line: 56, column: 5)
!79 = distinct !DILexicalBlock(scope: !73, file: !21, line: 50, column: 8)
!80 = !DILocation(line: 58, column: 16, scope: !78)
!81 = !DILocation(line: 58, column: 14, scope: !78)
!82 = !DILocation(line: 59, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !21, line: 59, column: 13)
!84 = !DILocation(line: 59, column: 18, scope: !83)
!85 = !DILocation(line: 59, column: 13, scope: !78)
!86 = !DILocation(line: 59, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !21, line: 59, column: 27)
!88 = !DILocation(line: 60, column: 9, scope: !78)
!89 = !DILocation(line: 60, column: 15, scope: !78)
!90 = !DILocation(line: 60, column: 22, scope: !78)
!91 = !DILocation(line: 61, column: 9, scope: !78)
!92 = !DILocation(line: 61, column: 15, scope: !78)
!93 = !DILocation(line: 61, column: 22, scope: !78)
!94 = !DILocation(line: 64, column: 21, scope: !73)
!95 = !DILocation(line: 64, column: 5, scope: !73)
!96 = !DILocation(line: 65, column: 10, scope: !73)
!97 = !DILocation(line: 65, column: 5, scope: !73)
!98 = !DILocation(line: 66, column: 1, scope: !73)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 69, type: !22, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !21, line: 71, type: !4)
!101 = !DILocation(line: 71, column: 21, scope: !99)
!102 = !DILocation(line: 73, column: 10, scope: !99)
!103 = !DILocation(line: 77, column: 33, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !21, line: 75, column: 5)
!105 = distinct !DILexicalBlock(scope: !99, file: !21, line: 74, column: 8)
!106 = !DILocation(line: 77, column: 16, scope: !104)
!107 = !DILocation(line: 77, column: 14, scope: !104)
!108 = !DILocation(line: 78, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !21, line: 78, column: 13)
!110 = !DILocation(line: 78, column: 18, scope: !109)
!111 = !DILocation(line: 78, column: 13, scope: !104)
!112 = !DILocation(line: 78, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !21, line: 78, column: 27)
!114 = !DILocation(line: 79, column: 9, scope: !104)
!115 = !DILocation(line: 79, column: 15, scope: !104)
!116 = !DILocation(line: 79, column: 22, scope: !104)
!117 = !DILocation(line: 80, column: 9, scope: !104)
!118 = !DILocation(line: 80, column: 15, scope: !104)
!119 = !DILocation(line: 80, column: 22, scope: !104)
!120 = !DILocation(line: 83, column: 21, scope: !99)
!121 = !DILocation(line: 83, column: 5, scope: !99)
!122 = !DILocation(line: 84, column: 10, scope: !99)
!123 = !DILocation(line: 84, column: 5, scope: !99)
!124 = !DILocation(line: 85, column: 1, scope: !99)
