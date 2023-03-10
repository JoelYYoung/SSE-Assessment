; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_goodG2BData = dso_local global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 200) #4, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_badData, align 8, !dbg !33
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68b_badSink(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_good() #0 !dbg !36 {
entry:
  call void @goodG2B(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #4, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #4, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i32* null, i32** %data, align 8, !dbg !62
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !63
  %0 = bitcast i8* %call to i32*, !dbg !64
  store i32* %0, i32** %data, align 8, !dbg !65
  %1 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  %2 = load i32*, i32** %data, align 8, !dbg !68
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_goodG2BData, align 8, !dbg !69
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68b_goodG2BSink(), !dbg !70
  ret void, !dbg !71
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_bad", scope: !14, file: !14, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 31, type: !6)
!25 = !DILocation(line: 31, column: 15, scope: !21)
!26 = !DILocation(line: 32, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 23, scope: !21)
!28 = !DILocation(line: 34, column: 12, scope: !21)
!29 = !DILocation(line: 34, column: 10, scope: !21)
!30 = !DILocation(line: 35, column: 5, scope: !21)
!31 = !DILocation(line: 35, column: 13, scope: !21)
!32 = !DILocation(line: 36, column: 78, scope: !21)
!33 = !DILocation(line: 36, column: 76, scope: !21)
!34 = !DILocation(line: 37, column: 5, scope: !21)
!35 = !DILocation(line: 38, column: 1, scope: !21)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_68_good", scope: !14, file: !14, line: 59, type: !22, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DILocation(line: 61, column: 5, scope: !36)
!38 = !DILocation(line: 62, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 74, type: !40, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!9, !9, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !14, line: 74, type: !9)
!46 = !DILocation(line: 74, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !14, line: 74, type: !42)
!48 = !DILocation(line: 74, column: 27, scope: !39)
!49 = !DILocation(line: 77, column: 22, scope: !39)
!50 = !DILocation(line: 77, column: 12, scope: !39)
!51 = !DILocation(line: 77, column: 5, scope: !39)
!52 = !DILocation(line: 79, column: 5, scope: !39)
!53 = !DILocation(line: 80, column: 5, scope: !39)
!54 = !DILocation(line: 81, column: 5, scope: !39)
!55 = !DILocation(line: 84, column: 5, scope: !39)
!56 = !DILocation(line: 85, column: 5, scope: !39)
!57 = !DILocation(line: 86, column: 5, scope: !39)
!58 = !DILocation(line: 88, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !22, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocalVariable(name: "data", scope: !59, file: !14, line: 50, type: !6)
!61 = !DILocation(line: 50, column: 15, scope: !59)
!62 = !DILocation(line: 51, column: 10, scope: !59)
!63 = !DILocation(line: 53, column: 23, scope: !59)
!64 = !DILocation(line: 53, column: 12, scope: !59)
!65 = !DILocation(line: 53, column: 10, scope: !59)
!66 = !DILocation(line: 54, column: 5, scope: !59)
!67 = !DILocation(line: 54, column: 13, scope: !59)
!68 = !DILocation(line: 55, column: 82, scope: !59)
!69 = !DILocation(line: 55, column: 80, scope: !59)
!70 = !DILocation(line: 56, column: 5, scope: !59)
!71 = !DILocation(line: 57, column: 1, scope: !59)
