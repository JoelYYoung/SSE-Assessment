; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_goodG2BData = dso_local global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_badData, align 8, !dbg !40
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68b_badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68b_badSink(...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
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
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %3 = load i32*, i32** %data, align 8, !dbg !81
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_goodG2BData, align 8, !dbg !82
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68b_goodG2BSink(), !dbg !83
  ret void, !dbg !84
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68b_goodG2BSink(...) #4

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
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_badData", scope: !2, file: !15, line: 27, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68a.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_goodG2BData", scope: !2, file: !15, line: 28, type: !6, isLocal: false, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68a.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_bad", scope: !15, file: !15, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 37, type: !6)
!26 = !DILocation(line: 37, column: 15, scope: !22)
!27 = !DILocation(line: 38, column: 10, scope: !22)
!28 = !DILocation(line: 40, column: 23, scope: !22)
!29 = !DILocation(line: 40, column: 12, scope: !22)
!30 = !DILocation(line: 40, column: 10, scope: !22)
!31 = !DILocation(line: 41, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 9)
!33 = !DILocation(line: 41, column: 14, scope: !32)
!34 = !DILocation(line: 41, column: 9, scope: !22)
!35 = !DILocation(line: 41, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 41, column: 23)
!37 = !DILocation(line: 42, column: 5, scope: !22)
!38 = !DILocation(line: 42, column: 13, scope: !22)
!39 = !DILocation(line: 43, column: 79, scope: !22)
!40 = !DILocation(line: 43, column: 77, scope: !22)
!41 = !DILocation(line: 44, column: 5, scope: !22)
!42 = !DILocation(line: 45, column: 1, scope: !22)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_68_good", scope: !15, file: !15, line: 67, type: !23, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 69, column: 5, scope: !43)
!45 = !DILocation(line: 70, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 82, type: !47, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!9, !9, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 82, type: !9)
!53 = !DILocation(line: 82, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 82, type: !49)
!55 = !DILocation(line: 82, column: 27, scope: !46)
!56 = !DILocation(line: 85, column: 22, scope: !46)
!57 = !DILocation(line: 85, column: 12, scope: !46)
!58 = !DILocation(line: 85, column: 5, scope: !46)
!59 = !DILocation(line: 87, column: 5, scope: !46)
!60 = !DILocation(line: 88, column: 5, scope: !46)
!61 = !DILocation(line: 89, column: 5, scope: !46)
!62 = !DILocation(line: 92, column: 5, scope: !46)
!63 = !DILocation(line: 93, column: 5, scope: !46)
!64 = !DILocation(line: 94, column: 5, scope: !46)
!65 = !DILocation(line: 96, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !23, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 57, type: !6)
!68 = !DILocation(line: 57, column: 15, scope: !66)
!69 = !DILocation(line: 58, column: 10, scope: !66)
!70 = !DILocation(line: 60, column: 23, scope: !66)
!71 = !DILocation(line: 60, column: 12, scope: !66)
!72 = !DILocation(line: 60, column: 10, scope: !66)
!73 = !DILocation(line: 61, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !66, file: !15, line: 61, column: 9)
!75 = !DILocation(line: 61, column: 14, scope: !74)
!76 = !DILocation(line: 61, column: 9, scope: !66)
!77 = !DILocation(line: 61, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 61, column: 23)
!79 = !DILocation(line: 62, column: 5, scope: !66)
!80 = !DILocation(line: 62, column: 13, scope: !66)
!81 = !DILocation(line: 63, column: 83, scope: !66)
!82 = !DILocation(line: 63, column: 81, scope: !66)
!83 = !DILocation(line: 64, column: 5, scope: !66)
!84 = !DILocation(line: 65, column: 1, scope: !66)
