; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_badSource(%struct._twoIntsStruct* %data) #0 !dbg !19 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_badGlobal, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end2, !dbg !27

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !28
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !31
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !32
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !34
  br i1 %cmp, label %if.then1, label %if.end, !dbg !35

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !38
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !39
  store i32 1, i32* %intOne, align 4, !dbg !40
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !41
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !42
  store i32 2, i32* %intTwo, align 4, !dbg !43
  br label %if.end2, !dbg !44

if.end2:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !45
  ret %struct._twoIntsStruct* %5, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B1Source(%struct._twoIntsStruct* %data) #0 !dbg !47 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B1Global, align 4, !dbg !50
  %tobool = icmp ne i32 %0, 0, !dbg !50
  br i1 %tobool, label %if.then, label %if.else, !dbg !52

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !53
  br label %if.end2, !dbg !55

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !56
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !58
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !59
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !60
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !62
  br i1 %cmp, label %if.then1, label %if.end, !dbg !63

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !64
  unreachable, !dbg !64

if.end:                                           ; preds = %if.else
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !66
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !67
  store i32 1, i32* %intOne, align 4, !dbg !68
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !69
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !70
  store i32 2, i32* %intTwo, align 4, !dbg !71
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !72
  ret %struct._twoIntsStruct* %5, !dbg !73
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B2Source(%struct._twoIntsStruct* %data) #0 !dbg !74 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B2Global, align 4, !dbg !77
  %tobool = icmp ne i32 %0, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.end2, !dbg !79

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !80
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !82
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !83
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !84
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !86
  br i1 %cmp, label %if.then1, label %if.end, !dbg !87

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !90
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !91
  store i32 1, i32* %intOne, align 4, !dbg !92
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !93
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !94
  store i32 2, i32* %intTwo, align 4, !dbg !95
  br label %if.end2, !dbg !96

if.end2:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !97
  ret %struct._twoIntsStruct* %5, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_badSource", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22b.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{!4, !4}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !20, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 95, scope: !19)
!25 = !DILocation(line: 26, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!27 = !DILocation(line: 26, column: 8, scope: !19)
!28 = !DILocation(line: 30, column: 33, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !20, line: 27, column: 5)
!30 = !DILocation(line: 30, column: 16, scope: !29)
!31 = !DILocation(line: 30, column: 14, scope: !29)
!32 = !DILocation(line: 31, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !20, line: 31, column: 13)
!34 = !DILocation(line: 31, column: 18, scope: !33)
!35 = !DILocation(line: 31, column: 13, scope: !29)
!36 = !DILocation(line: 31, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !20, line: 31, column: 27)
!38 = !DILocation(line: 32, column: 9, scope: !29)
!39 = !DILocation(line: 32, column: 15, scope: !29)
!40 = !DILocation(line: 32, column: 22, scope: !29)
!41 = !DILocation(line: 33, column: 9, scope: !29)
!42 = !DILocation(line: 33, column: 15, scope: !29)
!43 = !DILocation(line: 33, column: 22, scope: !29)
!44 = !DILocation(line: 34, column: 5, scope: !29)
!45 = !DILocation(line: 35, column: 12, scope: !19)
!46 = !DILocation(line: 35, column: 5, scope: !19)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B1Source", scope: !20, file: !20, line: 47, type: !21, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocalVariable(name: "data", arg: 1, scope: !47, file: !20, line: 47, type: !4)
!49 = !DILocation(line: 47, column: 100, scope: !47)
!50 = !DILocation(line: 49, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !20, line: 49, column: 8)
!52 = !DILocation(line: 49, column: 8, scope: !47)
!53 = !DILocation(line: 52, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !20, line: 50, column: 5)
!55 = !DILocation(line: 53, column: 5, scope: !54)
!56 = !DILocation(line: 57, column: 33, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !20, line: 55, column: 5)
!58 = !DILocation(line: 57, column: 16, scope: !57)
!59 = !DILocation(line: 57, column: 14, scope: !57)
!60 = !DILocation(line: 58, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !20, line: 58, column: 13)
!62 = !DILocation(line: 58, column: 18, scope: !61)
!63 = !DILocation(line: 58, column: 13, scope: !57)
!64 = !DILocation(line: 58, column: 28, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !20, line: 58, column: 27)
!66 = !DILocation(line: 59, column: 9, scope: !57)
!67 = !DILocation(line: 59, column: 15, scope: !57)
!68 = !DILocation(line: 59, column: 22, scope: !57)
!69 = !DILocation(line: 60, column: 9, scope: !57)
!70 = !DILocation(line: 60, column: 15, scope: !57)
!71 = !DILocation(line: 60, column: 22, scope: !57)
!72 = !DILocation(line: 62, column: 12, scope: !47)
!73 = !DILocation(line: 62, column: 5, scope: !47)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_22_goodG2B2Source", scope: !20, file: !20, line: 66, type: !21, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", arg: 1, scope: !74, file: !20, line: 66, type: !4)
!76 = !DILocation(line: 66, column: 100, scope: !74)
!77 = !DILocation(line: 68, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !20, line: 68, column: 8)
!79 = !DILocation(line: 68, column: 8, scope: !74)
!80 = !DILocation(line: 71, column: 33, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !20, line: 69, column: 5)
!82 = !DILocation(line: 71, column: 16, scope: !81)
!83 = !DILocation(line: 71, column: 14, scope: !81)
!84 = !DILocation(line: 72, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !20, line: 72, column: 13)
!86 = !DILocation(line: 72, column: 18, scope: !85)
!87 = !DILocation(line: 72, column: 13, scope: !81)
!88 = !DILocation(line: 72, column: 28, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !20, line: 72, column: 27)
!90 = !DILocation(line: 73, column: 9, scope: !81)
!91 = !DILocation(line: 73, column: 15, scope: !81)
!92 = !DILocation(line: 73, column: 22, scope: !81)
!93 = !DILocation(line: 74, column: 9, scope: !81)
!94 = !DILocation(line: 74, column: 15, scope: !81)
!95 = !DILocation(line: 74, column: 22, scope: !81)
!96 = !DILocation(line: 75, column: 5, scope: !81)
!97 = !DILocation(line: 76, column: 12, scope: !74)
!98 = !DILocation(line: 76, column: 5, scope: !74)
