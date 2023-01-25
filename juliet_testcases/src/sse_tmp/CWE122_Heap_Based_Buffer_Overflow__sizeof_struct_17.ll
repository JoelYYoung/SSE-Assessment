; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_bad() #0 !dbg !20 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !36
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !42
  br i1 %cmp1, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %for.body
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !46
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !47
  store i32 1, i32* %intOne, align 4, !dbg !48
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !49
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !50
  store i32 2, i32* %intTwo, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %5, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !58
  call void @printStructLine(%struct._twoIntsStruct* %6), !dbg !59
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !60
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !60
  call void @free(i8* %8) #5, !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_good() #0 !dbg !63 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !91
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %0, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !99
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !101
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !103
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !105
  br i1 %cmp1, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %for.body
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !110
  store i32 1, i32* %intOne, align 4, !dbg !111
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !113
  store i32 2, i32* %intTwo, align 4, !dbg !114
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !116
  %inc = add nsw i32 %5, 1, !dbg !116
  store i32 %inc, i32* %h, align 4, !dbg !116
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  call void @printStructLine(%struct._twoIntsStruct* %6), !dbg !121
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !122
  call void @free(i8* %8) #5, !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "i", scope: !20, file: !21, line: 23, type: !10)
!25 = !DILocation(line: 23, column: 9, scope: !20)
!26 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 24, type: !4)
!27 = !DILocation(line: 24, column: 21, scope: !20)
!28 = !DILocation(line: 26, column: 10, scope: !20)
!29 = !DILocation(line: 27, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 5)
!31 = !DILocation(line: 27, column: 9, scope: !30)
!32 = !DILocation(line: 27, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !21, line: 27, column: 5)
!34 = !DILocation(line: 27, column: 18, scope: !33)
!35 = !DILocation(line: 27, column: 5, scope: !30)
!36 = !DILocation(line: 31, column: 33, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !21, line: 28, column: 5)
!38 = !DILocation(line: 31, column: 16, scope: !37)
!39 = !DILocation(line: 31, column: 14, scope: !37)
!40 = !DILocation(line: 32, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !21, line: 32, column: 13)
!42 = !DILocation(line: 32, column: 18, scope: !41)
!43 = !DILocation(line: 32, column: 13, scope: !37)
!44 = !DILocation(line: 32, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !21, line: 32, column: 27)
!46 = !DILocation(line: 33, column: 9, scope: !37)
!47 = !DILocation(line: 33, column: 15, scope: !37)
!48 = !DILocation(line: 33, column: 22, scope: !37)
!49 = !DILocation(line: 34, column: 9, scope: !37)
!50 = !DILocation(line: 34, column: 15, scope: !37)
!51 = !DILocation(line: 34, column: 22, scope: !37)
!52 = !DILocation(line: 35, column: 5, scope: !37)
!53 = !DILocation(line: 27, column: 24, scope: !33)
!54 = !DILocation(line: 27, column: 5, scope: !33)
!55 = distinct !{!55, !35, !56, !57}
!56 = !DILocation(line: 35, column: 5, scope: !30)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 37, column: 21, scope: !20)
!59 = !DILocation(line: 37, column: 5, scope: !20)
!60 = !DILocation(line: 38, column: 10, scope: !20)
!61 = !DILocation(line: 38, column: 5, scope: !20)
!62 = !DILocation(line: 39, column: 1, scope: !20)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_17_good", scope: !21, file: !21, line: 65, type: !22, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 67, column: 5, scope: !63)
!65 = !DILocation(line: 68, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 80, type: !67, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!10, !10, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !21, line: 80, type: !10)
!73 = !DILocation(line: 80, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !21, line: 80, type: !69)
!75 = !DILocation(line: 80, column: 27, scope: !66)
!76 = !DILocation(line: 83, column: 22, scope: !66)
!77 = !DILocation(line: 83, column: 12, scope: !66)
!78 = !DILocation(line: 83, column: 5, scope: !66)
!79 = !DILocation(line: 85, column: 5, scope: !66)
!80 = !DILocation(line: 86, column: 5, scope: !66)
!81 = !DILocation(line: 87, column: 5, scope: !66)
!82 = !DILocation(line: 90, column: 5, scope: !66)
!83 = !DILocation(line: 91, column: 5, scope: !66)
!84 = !DILocation(line: 92, column: 5, scope: !66)
!85 = !DILocation(line: 94, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 46, type: !22, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "h", scope: !86, file: !21, line: 48, type: !10)
!88 = !DILocation(line: 48, column: 9, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !21, line: 49, type: !4)
!90 = !DILocation(line: 49, column: 21, scope: !86)
!91 = !DILocation(line: 51, column: 10, scope: !86)
!92 = !DILocation(line: 52, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !21, line: 52, column: 5)
!94 = !DILocation(line: 52, column: 9, scope: !93)
!95 = !DILocation(line: 52, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !21, line: 52, column: 5)
!97 = !DILocation(line: 52, column: 18, scope: !96)
!98 = !DILocation(line: 52, column: 5, scope: !93)
!99 = !DILocation(line: 55, column: 33, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !21, line: 53, column: 5)
!101 = !DILocation(line: 55, column: 16, scope: !100)
!102 = !DILocation(line: 55, column: 14, scope: !100)
!103 = !DILocation(line: 56, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !21, line: 56, column: 13)
!105 = !DILocation(line: 56, column: 18, scope: !104)
!106 = !DILocation(line: 56, column: 13, scope: !100)
!107 = !DILocation(line: 56, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !21, line: 56, column: 27)
!109 = !DILocation(line: 57, column: 9, scope: !100)
!110 = !DILocation(line: 57, column: 15, scope: !100)
!111 = !DILocation(line: 57, column: 22, scope: !100)
!112 = !DILocation(line: 58, column: 9, scope: !100)
!113 = !DILocation(line: 58, column: 15, scope: !100)
!114 = !DILocation(line: 58, column: 22, scope: !100)
!115 = !DILocation(line: 59, column: 5, scope: !100)
!116 = !DILocation(line: 52, column: 24, scope: !96)
!117 = !DILocation(line: 52, column: 5, scope: !96)
!118 = distinct !{!118, !98, !119, !57}
!119 = !DILocation(line: 59, column: 5, scope: !93)
!120 = !DILocation(line: 61, column: 21, scope: !86)
!121 = !DILocation(line: 61, column: 5, scope: !86)
!122 = !DILocation(line: 62, column: 10, scope: !86)
!123 = !DILocation(line: 62, column: 5, scope: !86)
!124 = !DILocation(line: 63, column: 1, scope: !86)
