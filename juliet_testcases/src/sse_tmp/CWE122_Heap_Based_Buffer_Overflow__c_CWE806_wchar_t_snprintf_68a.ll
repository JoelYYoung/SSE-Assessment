; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_goodG2BData = dso_local global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_badData, align 8, !dbg !41
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68b_badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68b_badSink(...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !70
  %0 = bitcast i8* %call to i32*, !dbg !71
  store i32* %0, i32** %data, align 8, !dbg !72
  %1 = load i32*, i32** %data, align 8, !dbg !73
  %cmp = icmp eq i32* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !77
  unreachable, !dbg !77

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !79
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #5, !dbg !80
  %3 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  %4 = load i32*, i32** %data, align 8, !dbg !83
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_goodG2BData, align 8, !dbg !84
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68b_goodG2BSink(), !dbg !85
  ret void, !dbg !86
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68b_goodG2BSink(...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_badData", scope: !2, file: !15, line: 27, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_goodG2BData", scope: !2, file: !15, line: 28, type: !6, isLocal: false, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68a.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_bad", scope: !15, file: !15, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 37, type: !6)
!26 = !DILocation(line: 37, column: 15, scope: !22)
!27 = !DILocation(line: 38, column: 23, scope: !22)
!28 = !DILocation(line: 38, column: 12, scope: !22)
!29 = !DILocation(line: 38, column: 10, scope: !22)
!30 = !DILocation(line: 39, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 9)
!32 = !DILocation(line: 39, column: 14, scope: !31)
!33 = !DILocation(line: 39, column: 9, scope: !22)
!34 = !DILocation(line: 39, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 39, column: 23)
!36 = !DILocation(line: 41, column: 13, scope: !22)
!37 = !DILocation(line: 41, column: 5, scope: !22)
!38 = !DILocation(line: 42, column: 5, scope: !22)
!39 = !DILocation(line: 42, column: 17, scope: !22)
!40 = !DILocation(line: 43, column: 79, scope: !22)
!41 = !DILocation(line: 43, column: 77, scope: !22)
!42 = !DILocation(line: 44, column: 5, scope: !22)
!43 = !DILocation(line: 45, column: 1, scope: !22)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_68_good", scope: !15, file: !15, line: 67, type: !23, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 69, column: 5, scope: !44)
!46 = !DILocation(line: 70, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 82, type: !48, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!9, !9, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 82, type: !9)
!54 = !DILocation(line: 82, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 82, type: !50)
!56 = !DILocation(line: 82, column: 27, scope: !47)
!57 = !DILocation(line: 85, column: 22, scope: !47)
!58 = !DILocation(line: 85, column: 12, scope: !47)
!59 = !DILocation(line: 85, column: 5, scope: !47)
!60 = !DILocation(line: 87, column: 5, scope: !47)
!61 = !DILocation(line: 88, column: 5, scope: !47)
!62 = !DILocation(line: 89, column: 5, scope: !47)
!63 = !DILocation(line: 92, column: 5, scope: !47)
!64 = !DILocation(line: 93, column: 5, scope: !47)
!65 = !DILocation(line: 94, column: 5, scope: !47)
!66 = !DILocation(line: 96, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !23, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !15, line: 57, type: !6)
!69 = !DILocation(line: 57, column: 15, scope: !67)
!70 = !DILocation(line: 58, column: 23, scope: !67)
!71 = !DILocation(line: 58, column: 12, scope: !67)
!72 = !DILocation(line: 58, column: 10, scope: !67)
!73 = !DILocation(line: 59, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !67, file: !15, line: 59, column: 9)
!75 = !DILocation(line: 59, column: 14, scope: !74)
!76 = !DILocation(line: 59, column: 9, scope: !67)
!77 = !DILocation(line: 59, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 59, column: 23)
!79 = !DILocation(line: 61, column: 13, scope: !67)
!80 = !DILocation(line: 61, column: 5, scope: !67)
!81 = !DILocation(line: 62, column: 5, scope: !67)
!82 = !DILocation(line: 62, column: 16, scope: !67)
!83 = !DILocation(line: 63, column: 83, scope: !67)
!84 = !DILocation(line: 63, column: 81, scope: !67)
!85 = !DILocation(line: 64, column: 5, scope: !67)
!86 = !DILocation(line: 65, column: 1, scope: !67)
