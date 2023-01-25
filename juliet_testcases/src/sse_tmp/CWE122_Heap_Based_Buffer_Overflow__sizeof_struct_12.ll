; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !30
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !36
  br i1 %cmp, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !41
  store i32 1, i32* %intOne, align 4, !dbg !42
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !44
  store i32 2, i32* %intTwo, align 4, !dbg !45
  br label %if.end9, !dbg !46

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !47
  %4 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !49
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !50
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !51
  %cmp4 = icmp eq %struct._twoIntsStruct* %5, null, !dbg !53
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !54

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !55
  unreachable, !dbg !55

if.end6:                                          ; preds = %if.else
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !57
  %intOne7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i32 0, i32 0, !dbg !58
  store i32 1, i32* %intOne7, align 4, !dbg !59
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !60
  %intTwo8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i32 0, i32 1, !dbg !61
  store i32 2, i32* %intTwo8, align 4, !dbg !62
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %if.end
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !63
  call void @printStructLine(%struct._twoIntsStruct* %8), !dbg !64
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !65
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !65
  call void @free(i8* %10) #5, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !95
  %tobool = icmp ne i32 %call, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !98
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !100
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !101
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !104
  br i1 %cmp, label %if.then2, label %if.end, !dbg !105

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.then
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !109
  store i32 1, i32* %intOne, align 4, !dbg !110
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !111
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !112
  store i32 2, i32* %intTwo, align 4, !dbg !113
  br label %if.end9, !dbg !114

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !115
  %4 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !117
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !118
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !119
  %cmp4 = icmp eq %struct._twoIntsStruct* %5, null, !dbg !121
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !122

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !123
  unreachable, !dbg !123

if.end6:                                          ; preds = %if.else
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %intOne7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i32 0, i32 0, !dbg !126
  store i32 1, i32* %intOne7, align 4, !dbg !127
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %intTwo8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i32 0, i32 1, !dbg !129
  store i32 2, i32* %intTwo8, align 4, !dbg !130
  br label %if.end9

if.end9:                                          ; preds = %if.end6, %if.end
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  call void @printStructLine(%struct._twoIntsStruct* %8), !dbg !132
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !133
  call void @free(i8* %10) #5, !dbg !134
  ret void, !dbg !135
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 25, column: 10, scope: !20)
!27 = !DILocation(line: 26, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 26, column: 8)
!29 = !DILocation(line: 26, column: 8, scope: !20)
!30 = !DILocation(line: 30, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !21, line: 27, column: 5)
!32 = !DILocation(line: 30, column: 16, scope: !31)
!33 = !DILocation(line: 30, column: 14, scope: !31)
!34 = !DILocation(line: 31, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 31, column: 13)
!36 = !DILocation(line: 31, column: 18, scope: !35)
!37 = !DILocation(line: 31, column: 13, scope: !31)
!38 = !DILocation(line: 31, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !21, line: 31, column: 27)
!40 = !DILocation(line: 32, column: 9, scope: !31)
!41 = !DILocation(line: 32, column: 15, scope: !31)
!42 = !DILocation(line: 32, column: 22, scope: !31)
!43 = !DILocation(line: 33, column: 9, scope: !31)
!44 = !DILocation(line: 33, column: 15, scope: !31)
!45 = !DILocation(line: 33, column: 22, scope: !31)
!46 = !DILocation(line: 34, column: 5, scope: !31)
!47 = !DILocation(line: 38, column: 33, scope: !48)
!48 = distinct !DILexicalBlock(scope: !28, file: !21, line: 36, column: 5)
!49 = !DILocation(line: 38, column: 16, scope: !48)
!50 = !DILocation(line: 38, column: 14, scope: !48)
!51 = !DILocation(line: 39, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !21, line: 39, column: 13)
!53 = !DILocation(line: 39, column: 18, scope: !52)
!54 = !DILocation(line: 39, column: 13, scope: !48)
!55 = !DILocation(line: 39, column: 28, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !21, line: 39, column: 27)
!57 = !DILocation(line: 40, column: 9, scope: !48)
!58 = !DILocation(line: 40, column: 15, scope: !48)
!59 = !DILocation(line: 40, column: 22, scope: !48)
!60 = !DILocation(line: 41, column: 9, scope: !48)
!61 = !DILocation(line: 41, column: 15, scope: !48)
!62 = !DILocation(line: 41, column: 22, scope: !48)
!63 = !DILocation(line: 44, column: 21, scope: !20)
!64 = !DILocation(line: 44, column: 5, scope: !20)
!65 = !DILocation(line: 45, column: 10, scope: !20)
!66 = !DILocation(line: 45, column: 5, scope: !20)
!67 = !DILocation(line: 46, column: 1, scope: !20)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_12_good", scope: !21, file: !21, line: 80, type: !22, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 82, column: 5, scope: !68)
!70 = !DILocation(line: 83, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 95, type: !72, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!10, !10, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !21, line: 95, type: !10)
!78 = !DILocation(line: 95, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !21, line: 95, type: !74)
!80 = !DILocation(line: 95, column: 27, scope: !71)
!81 = !DILocation(line: 98, column: 22, scope: !71)
!82 = !DILocation(line: 98, column: 12, scope: !71)
!83 = !DILocation(line: 98, column: 5, scope: !71)
!84 = !DILocation(line: 100, column: 5, scope: !71)
!85 = !DILocation(line: 101, column: 5, scope: !71)
!86 = !DILocation(line: 102, column: 5, scope: !71)
!87 = !DILocation(line: 105, column: 5, scope: !71)
!88 = !DILocation(line: 106, column: 5, scope: !71)
!89 = !DILocation(line: 107, column: 5, scope: !71)
!90 = !DILocation(line: 109, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !21, line: 56, type: !4)
!93 = !DILocation(line: 56, column: 21, scope: !91)
!94 = !DILocation(line: 58, column: 10, scope: !91)
!95 = !DILocation(line: 59, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !21, line: 59, column: 8)
!97 = !DILocation(line: 59, column: 8, scope: !91)
!98 = !DILocation(line: 62, column: 33, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !21, line: 60, column: 5)
!100 = !DILocation(line: 62, column: 16, scope: !99)
!101 = !DILocation(line: 62, column: 14, scope: !99)
!102 = !DILocation(line: 63, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !21, line: 63, column: 13)
!104 = !DILocation(line: 63, column: 18, scope: !103)
!105 = !DILocation(line: 63, column: 13, scope: !99)
!106 = !DILocation(line: 63, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !21, line: 63, column: 27)
!108 = !DILocation(line: 64, column: 9, scope: !99)
!109 = !DILocation(line: 64, column: 15, scope: !99)
!110 = !DILocation(line: 64, column: 22, scope: !99)
!111 = !DILocation(line: 65, column: 9, scope: !99)
!112 = !DILocation(line: 65, column: 15, scope: !99)
!113 = !DILocation(line: 65, column: 22, scope: !99)
!114 = !DILocation(line: 66, column: 5, scope: !99)
!115 = !DILocation(line: 70, column: 33, scope: !116)
!116 = distinct !DILexicalBlock(scope: !96, file: !21, line: 68, column: 5)
!117 = !DILocation(line: 70, column: 16, scope: !116)
!118 = !DILocation(line: 70, column: 14, scope: !116)
!119 = !DILocation(line: 71, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !21, line: 71, column: 13)
!121 = !DILocation(line: 71, column: 18, scope: !120)
!122 = !DILocation(line: 71, column: 13, scope: !116)
!123 = !DILocation(line: 71, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !21, line: 71, column: 27)
!125 = !DILocation(line: 72, column: 9, scope: !116)
!126 = !DILocation(line: 72, column: 15, scope: !116)
!127 = !DILocation(line: 72, column: 22, scope: !116)
!128 = !DILocation(line: 73, column: 9, scope: !116)
!129 = !DILocation(line: 73, column: 15, scope: !116)
!130 = !DILocation(line: 73, column: 22, scope: !116)
!131 = !DILocation(line: 76, column: 21, scope: !91)
!132 = !DILocation(line: 76, column: 5, scope: !91)
!133 = !DILocation(line: 77, column: 10, scope: !91)
!134 = !DILocation(line: 77, column: 5, scope: !91)
!135 = !DILocation(line: 78, column: 1, scope: !91)
