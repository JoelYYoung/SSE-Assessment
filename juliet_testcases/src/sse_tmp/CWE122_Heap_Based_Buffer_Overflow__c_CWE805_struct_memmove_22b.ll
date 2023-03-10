; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badSource(%struct._twoIntsStruct* %data) #0 !dbg !19 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badGlobal, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end2, !dbg !27

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !31
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !32
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !34
  br i1 %cmp, label %if.then1, label %if.end, !dbg !35

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !38

if.end2:                                          ; preds = %if.end, %entry
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !39
  ret %struct._twoIntsStruct* %3, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Source(%struct._twoIntsStruct* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Global, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.else, !dbg !46

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end2, !dbg !49

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #5, !dbg !50
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !52
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !53
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !54
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !56
  br i1 %cmp, label %if.then1, label %if.end, !dbg !57

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !60
  ret %struct._twoIntsStruct* %3, !dbg !61
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Source(%struct._twoIntsStruct* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Global, align 4, !dbg !65
  %tobool = icmp ne i32 %0, 0, !dbg !65
  br i1 %tobool, label %if.then, label %if.end2, !dbg !67

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #5, !dbg !68
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !70
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !71
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !72
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !74
  br i1 %cmp, label %if.then1, label %if.end, !dbg !75

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !78

if.end2:                                          ; preds = %if.end, %entry
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !79
  ret %struct._twoIntsStruct* %3, !dbg !80
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22b.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badSource", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22b.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{!4, !4}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !20, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 105, scope: !19)
!25 = !DILocation(line: 26, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!27 = !DILocation(line: 26, column: 8, scope: !19)
!28 = !DILocation(line: 29, column: 33, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !20, line: 27, column: 5)
!30 = !DILocation(line: 29, column: 16, scope: !29)
!31 = !DILocation(line: 29, column: 14, scope: !29)
!32 = !DILocation(line: 30, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !20, line: 30, column: 13)
!34 = !DILocation(line: 30, column: 18, scope: !33)
!35 = !DILocation(line: 30, column: 13, scope: !29)
!36 = !DILocation(line: 30, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !20, line: 30, column: 27)
!38 = !DILocation(line: 31, column: 5, scope: !29)
!39 = !DILocation(line: 32, column: 12, scope: !19)
!40 = !DILocation(line: 32, column: 5, scope: !19)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Source", scope: !20, file: !20, line: 44, type: !21, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !20, line: 44, type: !4)
!43 = !DILocation(line: 44, column: 110, scope: !41)
!44 = !DILocation(line: 46, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !20, line: 46, column: 8)
!46 = !DILocation(line: 46, column: 8, scope: !41)
!47 = !DILocation(line: 49, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !20, line: 47, column: 5)
!49 = !DILocation(line: 50, column: 5, scope: !48)
!50 = !DILocation(line: 54, column: 33, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !20, line: 52, column: 5)
!52 = !DILocation(line: 54, column: 16, scope: !51)
!53 = !DILocation(line: 54, column: 14, scope: !51)
!54 = !DILocation(line: 55, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !20, line: 55, column: 13)
!56 = !DILocation(line: 55, column: 18, scope: !55)
!57 = !DILocation(line: 55, column: 13, scope: !51)
!58 = !DILocation(line: 55, column: 28, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !20, line: 55, column: 27)
!60 = !DILocation(line: 57, column: 12, scope: !41)
!61 = !DILocation(line: 57, column: 5, scope: !41)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Source", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !20, line: 61, type: !4)
!64 = !DILocation(line: 61, column: 110, scope: !62)
!65 = !DILocation(line: 63, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !20, line: 63, column: 8)
!67 = !DILocation(line: 63, column: 8, scope: !62)
!68 = !DILocation(line: 66, column: 33, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !20, line: 64, column: 5)
!70 = !DILocation(line: 66, column: 16, scope: !69)
!71 = !DILocation(line: 66, column: 14, scope: !69)
!72 = !DILocation(line: 67, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !20, line: 67, column: 13)
!74 = !DILocation(line: 67, column: 18, scope: !73)
!75 = !DILocation(line: 67, column: 13, scope: !69)
!76 = !DILocation(line: 67, column: 28, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !20, line: 67, column: 27)
!78 = !DILocation(line: 68, column: 5, scope: !69)
!79 = !DILocation(line: 69, column: 12, scope: !62)
!80 = !DILocation(line: 69, column: 5, scope: !62)
