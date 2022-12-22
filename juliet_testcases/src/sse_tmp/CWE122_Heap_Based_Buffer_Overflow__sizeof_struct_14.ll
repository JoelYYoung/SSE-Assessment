; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !31
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !38

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !42
  store i32 1, i32* %intOne, align 4, !dbg !43
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !45
  store i32 2, i32* %intTwo, align 4, !dbg !46
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !48
  call void @printStructLine(%struct._twoIntsStruct* %5), !dbg !49
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !50
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !50
  call void @free(i8* %7) #5, !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %0 = load i32, i32* @globalFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end3, !dbg !87

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !88
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !90
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !91
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !92
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !94
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !95

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.else
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !98
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !99
  store i32 1, i32* %intOne, align 4, !dbg !100
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !101
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !102
  store i32 2, i32* %intTwo, align 4, !dbg !103
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !104
  call void @printStructLine(%struct._twoIntsStruct* %5), !dbg !105
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !106
  call void @free(i8* %7) #5, !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %0 = load i32, i32* @globalFive, align 4, !dbg !113
  %cmp = icmp eq i32 %0, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.end3, !dbg !116

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !117
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !119
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !123
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !124

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !128
  store i32 1, i32* %intOne, align 4, !dbg !129
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !131
  store i32 2, i32* %intTwo, align 4, !dbg !132
  br label %if.end3, !dbg !133

if.end3:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !134
  call void @printStructLine(%struct._twoIntsStruct* %5), !dbg !135
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !136
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !136
  call void @free(i8* %7) #5, !dbg !137
  ret void, !dbg !138
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 25, column: 10, scope: !20)
!27 = !DILocation(line: 26, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 26, column: 8)
!29 = !DILocation(line: 26, column: 18, scope: !28)
!30 = !DILocation(line: 26, column: 8, scope: !20)
!31 = !DILocation(line: 30, column: 33, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !21, line: 27, column: 5)
!33 = !DILocation(line: 30, column: 16, scope: !32)
!34 = !DILocation(line: 30, column: 14, scope: !32)
!35 = !DILocation(line: 31, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !21, line: 31, column: 13)
!37 = !DILocation(line: 31, column: 18, scope: !36)
!38 = !DILocation(line: 31, column: 13, scope: !32)
!39 = !DILocation(line: 31, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !21, line: 31, column: 27)
!41 = !DILocation(line: 32, column: 9, scope: !32)
!42 = !DILocation(line: 32, column: 15, scope: !32)
!43 = !DILocation(line: 32, column: 22, scope: !32)
!44 = !DILocation(line: 33, column: 9, scope: !32)
!45 = !DILocation(line: 33, column: 15, scope: !32)
!46 = !DILocation(line: 33, column: 22, scope: !32)
!47 = !DILocation(line: 34, column: 5, scope: !32)
!48 = !DILocation(line: 36, column: 21, scope: !20)
!49 = !DILocation(line: 36, column: 5, scope: !20)
!50 = !DILocation(line: 37, column: 10, scope: !20)
!51 = !DILocation(line: 37, column: 5, scope: !20)
!52 = !DILocation(line: 38, column: 1, scope: !20)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_14_good", scope: !21, file: !21, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 89, column: 5, scope: !53)
!55 = !DILocation(line: 90, column: 5, scope: !53)
!56 = !DILocation(line: 91, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 103, type: !58, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!10, !10, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !21, line: 103, type: !10)
!64 = !DILocation(line: 103, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !21, line: 103, type: !60)
!66 = !DILocation(line: 103, column: 27, scope: !57)
!67 = !DILocation(line: 106, column: 22, scope: !57)
!68 = !DILocation(line: 106, column: 12, scope: !57)
!69 = !DILocation(line: 106, column: 5, scope: !57)
!70 = !DILocation(line: 108, column: 5, scope: !57)
!71 = !DILocation(line: 109, column: 5, scope: !57)
!72 = !DILocation(line: 110, column: 5, scope: !57)
!73 = !DILocation(line: 113, column: 5, scope: !57)
!74 = !DILocation(line: 114, column: 5, scope: !57)
!75 = !DILocation(line: 115, column: 5, scope: !57)
!76 = !DILocation(line: 117, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 45, type: !22, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !21, line: 47, type: !4)
!79 = !DILocation(line: 47, column: 21, scope: !77)
!80 = !DILocation(line: 49, column: 10, scope: !77)
!81 = !DILocation(line: 50, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !21, line: 50, column: 8)
!83 = !DILocation(line: 50, column: 18, scope: !82)
!84 = !DILocation(line: 50, column: 8, scope: !77)
!85 = !DILocation(line: 53, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !21, line: 51, column: 5)
!87 = !DILocation(line: 54, column: 5, scope: !86)
!88 = !DILocation(line: 58, column: 33, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !21, line: 56, column: 5)
!90 = !DILocation(line: 58, column: 16, scope: !89)
!91 = !DILocation(line: 58, column: 14, scope: !89)
!92 = !DILocation(line: 59, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !21, line: 59, column: 13)
!94 = !DILocation(line: 59, column: 18, scope: !93)
!95 = !DILocation(line: 59, column: 13, scope: !89)
!96 = !DILocation(line: 59, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !21, line: 59, column: 27)
!98 = !DILocation(line: 60, column: 9, scope: !89)
!99 = !DILocation(line: 60, column: 15, scope: !89)
!100 = !DILocation(line: 60, column: 22, scope: !89)
!101 = !DILocation(line: 61, column: 9, scope: !89)
!102 = !DILocation(line: 61, column: 15, scope: !89)
!103 = !DILocation(line: 61, column: 22, scope: !89)
!104 = !DILocation(line: 64, column: 21, scope: !77)
!105 = !DILocation(line: 64, column: 5, scope: !77)
!106 = !DILocation(line: 65, column: 10, scope: !77)
!107 = !DILocation(line: 65, column: 5, scope: !77)
!108 = !DILocation(line: 66, column: 1, scope: !77)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 69, type: !22, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !21, line: 71, type: !4)
!111 = !DILocation(line: 71, column: 21, scope: !109)
!112 = !DILocation(line: 73, column: 10, scope: !109)
!113 = !DILocation(line: 74, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !21, line: 74, column: 8)
!115 = !DILocation(line: 74, column: 18, scope: !114)
!116 = !DILocation(line: 74, column: 8, scope: !109)
!117 = !DILocation(line: 77, column: 33, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !21, line: 75, column: 5)
!119 = !DILocation(line: 77, column: 16, scope: !118)
!120 = !DILocation(line: 77, column: 14, scope: !118)
!121 = !DILocation(line: 78, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !21, line: 78, column: 13)
!123 = !DILocation(line: 78, column: 18, scope: !122)
!124 = !DILocation(line: 78, column: 13, scope: !118)
!125 = !DILocation(line: 78, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !21, line: 78, column: 27)
!127 = !DILocation(line: 79, column: 9, scope: !118)
!128 = !DILocation(line: 79, column: 15, scope: !118)
!129 = !DILocation(line: 79, column: 22, scope: !118)
!130 = !DILocation(line: 80, column: 9, scope: !118)
!131 = !DILocation(line: 80, column: 15, scope: !118)
!132 = !DILocation(line: 80, column: 22, scope: !118)
!133 = !DILocation(line: 81, column: 5, scope: !118)
!134 = !DILocation(line: 83, column: 21, scope: !109)
!135 = !DILocation(line: 83, column: 5, scope: !109)
!136 = !DILocation(line: 84, column: 10, scope: !109)
!137 = !DILocation(line: 84, column: 5, scope: !109)
!138 = !DILocation(line: 85, column: 1, scope: !109)
