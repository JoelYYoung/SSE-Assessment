; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badSource(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end2, !dbg !21

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #5, !dbg !22
  store i8* %call, i8** %data.addr, align 8, !dbg !24
  %1 = load i8*, i8** %data.addr, align 8, !dbg !25
  %cmp = icmp eq i8* %1, null, !dbg !27
  br i1 %cmp, label %if.then1, label %if.end, !dbg !28

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end2, !dbg !33

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !34
  ret i8* %3, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Source(i8* %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Global, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end2, !dbg !44

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !45
  store i8* %call, i8** %data.addr, align 8, !dbg !47
  %1 = load i8*, i8** %data.addr, align 8, !dbg !48
  %cmp = icmp eq i8* %1, null, !dbg !50
  br i1 %cmp, label %if.then1, label %if.end, !dbg !51

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !54
  store i8 0, i8* %arrayidx, align 1, !dbg !55
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !56
  ret i8* %3, !dbg !57
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Source(i8* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Global, align 4, !dbg !61
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.end2, !dbg !63

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !64
  store i8* %call, i8** %data.addr, align 8, !dbg !66
  %1 = load i8*, i8** %data.addr, align 8, !dbg !67
  %cmp = icmp eq i8* %1, null, !dbg !69
  br i1 %cmp, label %if.then1, label %if.end, !dbg !70

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  br label %if.end2, !dbg !75

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !76
  ret i8* %3, !dbg !77
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badSource", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 82, scope: !13)
!19 = !DILocation(line: 28, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!21 = !DILocation(line: 28, column: 8, scope: !13)
!22 = !DILocation(line: 31, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !14, line: 29, column: 5)
!24 = !DILocation(line: 31, column: 14, scope: !23)
!25 = !DILocation(line: 32, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !14, line: 32, column: 13)
!27 = !DILocation(line: 32, column: 18, scope: !26)
!28 = !DILocation(line: 32, column: 13, scope: !23)
!29 = !DILocation(line: 32, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !14, line: 32, column: 27)
!31 = !DILocation(line: 33, column: 9, scope: !23)
!32 = !DILocation(line: 33, column: 17, scope: !23)
!33 = !DILocation(line: 34, column: 5, scope: !23)
!34 = !DILocation(line: 35, column: 12, scope: !13)
!35 = !DILocation(line: 35, column: 5, scope: !13)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Source", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !14, line: 47, type: !4)
!38 = !DILocation(line: 47, column: 87, scope: !36)
!39 = !DILocation(line: 49, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 49, column: 8)
!41 = !DILocation(line: 49, column: 8, scope: !36)
!42 = !DILocation(line: 52, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !14, line: 50, column: 5)
!44 = !DILocation(line: 53, column: 5, scope: !43)
!45 = !DILocation(line: 57, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !14, line: 55, column: 5)
!47 = !DILocation(line: 57, column: 14, scope: !46)
!48 = !DILocation(line: 58, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !14, line: 58, column: 13)
!50 = !DILocation(line: 58, column: 18, scope: !49)
!51 = !DILocation(line: 58, column: 13, scope: !46)
!52 = !DILocation(line: 58, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !14, line: 58, column: 27)
!54 = !DILocation(line: 59, column: 9, scope: !46)
!55 = !DILocation(line: 59, column: 17, scope: !46)
!56 = !DILocation(line: 61, column: 12, scope: !36)
!57 = !DILocation(line: 61, column: 5, scope: !36)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Source", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !14, line: 65, type: !4)
!60 = !DILocation(line: 65, column: 87, scope: !58)
!61 = !DILocation(line: 67, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !14, line: 67, column: 8)
!63 = !DILocation(line: 67, column: 8, scope: !58)
!64 = !DILocation(line: 70, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !14, line: 68, column: 5)
!66 = !DILocation(line: 70, column: 14, scope: !65)
!67 = !DILocation(line: 71, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !14, line: 71, column: 13)
!69 = !DILocation(line: 71, column: 18, scope: !68)
!70 = !DILocation(line: 71, column: 13, scope: !65)
!71 = !DILocation(line: 71, column: 28, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !14, line: 71, column: 27)
!73 = !DILocation(line: 72, column: 9, scope: !65)
!74 = !DILocation(line: 72, column: 17, scope: !65)
!75 = !DILocation(line: 73, column: 5, scope: !65)
!76 = !DILocation(line: 74, column: 12, scope: !58)
!77 = !DILocation(line: 74, column: 5, scope: !58)
