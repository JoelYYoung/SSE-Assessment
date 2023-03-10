; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !30
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !36
  br i1 %cmp, label %if.then1, label %if.end, !dbg !37

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !41
  store i32 1, i32* %intOne, align 4, !dbg !42
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !44
  store i32 2, i32* %intTwo, align 4, !dbg !45
  br label %if.end2, !dbg !46

if.end2:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !47
  call void @printStructLine(%struct._twoIntsStruct* %5), !dbg !48
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !49
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !49
  call void @free(i8* %7) #5, !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %0 = load i32, i32* @globalFalse, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end2, !dbg !85

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !86
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !88
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !90
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !92
  br i1 %cmp, label %if.then1, label %if.end, !dbg !93

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.else
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !97
  store i32 1, i32* %intOne, align 4, !dbg !98
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !100
  store i32 2, i32* %intTwo, align 4, !dbg !101
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  call void @printStructLine(%struct._twoIntsStruct* %5), !dbg !103
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !104
  call void @free(i8* %7) #5, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !110
  %0 = load i32, i32* @globalTrue, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.end2, !dbg !113

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !114
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !116
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !118
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !120
  br i1 %cmp, label %if.then1, label %if.end, !dbg !121

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !125
  store i32 1, i32* %intOne, align 4, !dbg !126
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !128
  store i32 2, i32* %intTwo, align 4, !dbg !129
  br label %if.end2, !dbg !130

if.end2:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  call void @printStructLine(%struct._twoIntsStruct* %5), !dbg !132
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !133
  call void @free(i8* %7) #5, !dbg !134
  ret void, !dbg !135
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !DILocation(line: 36, column: 21, scope: !20)
!48 = !DILocation(line: 36, column: 5, scope: !20)
!49 = !DILocation(line: 37, column: 10, scope: !20)
!50 = !DILocation(line: 37, column: 5, scope: !20)
!51 = !DILocation(line: 38, column: 1, scope: !20)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_10_good", scope: !21, file: !21, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 89, column: 5, scope: !52)
!54 = !DILocation(line: 90, column: 5, scope: !52)
!55 = !DILocation(line: 91, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 103, type: !57, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!10, !10, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !21, line: 103, type: !10)
!63 = !DILocation(line: 103, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !21, line: 103, type: !59)
!65 = !DILocation(line: 103, column: 27, scope: !56)
!66 = !DILocation(line: 106, column: 22, scope: !56)
!67 = !DILocation(line: 106, column: 12, scope: !56)
!68 = !DILocation(line: 106, column: 5, scope: !56)
!69 = !DILocation(line: 108, column: 5, scope: !56)
!70 = !DILocation(line: 109, column: 5, scope: !56)
!71 = !DILocation(line: 110, column: 5, scope: !56)
!72 = !DILocation(line: 113, column: 5, scope: !56)
!73 = !DILocation(line: 114, column: 5, scope: !56)
!74 = !DILocation(line: 115, column: 5, scope: !56)
!75 = !DILocation(line: 117, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 45, type: !22, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !21, line: 47, type: !4)
!78 = !DILocation(line: 47, column: 21, scope: !76)
!79 = !DILocation(line: 49, column: 10, scope: !76)
!80 = !DILocation(line: 50, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !21, line: 50, column: 8)
!82 = !DILocation(line: 50, column: 8, scope: !76)
!83 = !DILocation(line: 53, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !21, line: 51, column: 5)
!85 = !DILocation(line: 54, column: 5, scope: !84)
!86 = !DILocation(line: 58, column: 33, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !21, line: 56, column: 5)
!88 = !DILocation(line: 58, column: 16, scope: !87)
!89 = !DILocation(line: 58, column: 14, scope: !87)
!90 = !DILocation(line: 59, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !21, line: 59, column: 13)
!92 = !DILocation(line: 59, column: 18, scope: !91)
!93 = !DILocation(line: 59, column: 13, scope: !87)
!94 = !DILocation(line: 59, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !21, line: 59, column: 27)
!96 = !DILocation(line: 60, column: 9, scope: !87)
!97 = !DILocation(line: 60, column: 15, scope: !87)
!98 = !DILocation(line: 60, column: 22, scope: !87)
!99 = !DILocation(line: 61, column: 9, scope: !87)
!100 = !DILocation(line: 61, column: 15, scope: !87)
!101 = !DILocation(line: 61, column: 22, scope: !87)
!102 = !DILocation(line: 64, column: 21, scope: !76)
!103 = !DILocation(line: 64, column: 5, scope: !76)
!104 = !DILocation(line: 65, column: 10, scope: !76)
!105 = !DILocation(line: 65, column: 5, scope: !76)
!106 = !DILocation(line: 66, column: 1, scope: !76)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 69, type: !22, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !21, line: 71, type: !4)
!109 = !DILocation(line: 71, column: 21, scope: !107)
!110 = !DILocation(line: 73, column: 10, scope: !107)
!111 = !DILocation(line: 74, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !21, line: 74, column: 8)
!113 = !DILocation(line: 74, column: 8, scope: !107)
!114 = !DILocation(line: 77, column: 33, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !21, line: 75, column: 5)
!116 = !DILocation(line: 77, column: 16, scope: !115)
!117 = !DILocation(line: 77, column: 14, scope: !115)
!118 = !DILocation(line: 78, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !21, line: 78, column: 13)
!120 = !DILocation(line: 78, column: 18, scope: !119)
!121 = !DILocation(line: 78, column: 13, scope: !115)
!122 = !DILocation(line: 78, column: 28, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !21, line: 78, column: 27)
!124 = !DILocation(line: 79, column: 9, scope: !115)
!125 = !DILocation(line: 79, column: 15, scope: !115)
!126 = !DILocation(line: 79, column: 22, scope: !115)
!127 = !DILocation(line: 80, column: 9, scope: !115)
!128 = !DILocation(line: 80, column: 15, scope: !115)
!129 = !DILocation(line: 80, column: 22, scope: !115)
!130 = !DILocation(line: 81, column: 5, scope: !115)
!131 = !DILocation(line: 83, column: 21, scope: !107)
!132 = !DILocation(line: 83, column: 5, scope: !107)
!133 = !DILocation(line: 84, column: 10, scope: !107)
!134 = !DILocation(line: 84, column: 5, scope: !107)
!135 = !DILocation(line: 85, column: 1, scope: !107)
