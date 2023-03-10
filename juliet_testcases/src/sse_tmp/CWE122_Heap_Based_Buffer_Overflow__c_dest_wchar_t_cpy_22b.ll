; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badSource(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badGlobal, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !24
  %1 = bitcast i8* %call to i32*, !dbg !26
  store i32* %1, i32** %data.addr, align 8, !dbg !27
  %2 = load i32*, i32** %data.addr, align 8, !dbg !28
  %cmp = icmp eq i32* %2, null, !dbg !30
  br i1 %cmp, label %if.then1, label %if.end, !dbg !31

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end2, !dbg !36

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !37
  ret i32* %4, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Source(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Global, align 4, !dbg !42
  %tobool = icmp ne i32 %0, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.else, !dbg !44

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !45
  br label %if.end2, !dbg !47

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !48
  %1 = bitcast i8* %call to i32*, !dbg !50
  store i32* %1, i32** %data.addr, align 8, !dbg !51
  %2 = load i32*, i32** %data.addr, align 8, !dbg !52
  %cmp = icmp eq i32* %2, null, !dbg !54
  br i1 %cmp, label %if.then1, label %if.end, !dbg !55

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i32*, i32** %data.addr, align 8, !dbg !60
  ret i32* %4, !dbg !61
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Source(i32* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Global, align 4, !dbg !65
  %tobool = icmp ne i32 %0, 0, !dbg !65
  br i1 %tobool, label %if.then, label %if.end2, !dbg !67

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !68
  %1 = bitcast i8* %call to i32*, !dbg !70
  store i32* %1, i32** %data.addr, align 8, !dbg !71
  %2 = load i32*, i32** %data.addr, align 8, !dbg !72
  %cmp = icmp eq i32* %2, null, !dbg !74
  br i1 %cmp, label %if.then1, label %if.end, !dbg !75

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  br label %if.end2, !dbg !80

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !81
  ret i32* %4, !dbg !82
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badSource", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 88, scope: !15)
!21 = !DILocation(line: 28, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!23 = !DILocation(line: 28, column: 8, scope: !15)
!24 = !DILocation(line: 31, column: 27, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !16, line: 29, column: 5)
!26 = !DILocation(line: 31, column: 16, scope: !25)
!27 = !DILocation(line: 31, column: 14, scope: !25)
!28 = !DILocation(line: 32, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !16, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 18, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !25)
!32 = !DILocation(line: 32, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !16, line: 32, column: 27)
!34 = !DILocation(line: 33, column: 9, scope: !25)
!35 = !DILocation(line: 33, column: 17, scope: !25)
!36 = !DILocation(line: 34, column: 5, scope: !25)
!37 = !DILocation(line: 35, column: 12, scope: !15)
!38 = !DILocation(line: 35, column: 5, scope: !15)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Source", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !16, line: 47, type: !4)
!41 = !DILocation(line: 47, column: 93, scope: !39)
!42 = !DILocation(line: 49, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !16, line: 49, column: 8)
!44 = !DILocation(line: 49, column: 8, scope: !39)
!45 = !DILocation(line: 52, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !16, line: 50, column: 5)
!47 = !DILocation(line: 53, column: 5, scope: !46)
!48 = !DILocation(line: 57, column: 27, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !16, line: 55, column: 5)
!50 = !DILocation(line: 57, column: 16, scope: !49)
!51 = !DILocation(line: 57, column: 14, scope: !49)
!52 = !DILocation(line: 58, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !16, line: 58, column: 13)
!54 = !DILocation(line: 58, column: 18, scope: !53)
!55 = !DILocation(line: 58, column: 13, scope: !49)
!56 = !DILocation(line: 58, column: 28, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !16, line: 58, column: 27)
!58 = !DILocation(line: 59, column: 9, scope: !49)
!59 = !DILocation(line: 59, column: 17, scope: !49)
!60 = !DILocation(line: 61, column: 12, scope: !39)
!61 = !DILocation(line: 61, column: 5, scope: !39)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Source", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !16, line: 65, type: !4)
!64 = !DILocation(line: 65, column: 93, scope: !62)
!65 = !DILocation(line: 67, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !16, line: 67, column: 8)
!67 = !DILocation(line: 67, column: 8, scope: !62)
!68 = !DILocation(line: 70, column: 27, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !16, line: 68, column: 5)
!70 = !DILocation(line: 70, column: 16, scope: !69)
!71 = !DILocation(line: 70, column: 14, scope: !69)
!72 = !DILocation(line: 71, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !16, line: 71, column: 13)
!74 = !DILocation(line: 71, column: 18, scope: !73)
!75 = !DILocation(line: 71, column: 13, scope: !69)
!76 = !DILocation(line: 71, column: 28, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !16, line: 71, column: 27)
!78 = !DILocation(line: 72, column: 9, scope: !69)
!79 = !DILocation(line: 72, column: 17, scope: !69)
!80 = !DILocation(line: 73, column: 5, scope: !69)
!81 = !DILocation(line: 74, column: 12, scope: !62)
!82 = !DILocation(line: 74, column: 5, scope: !62)
