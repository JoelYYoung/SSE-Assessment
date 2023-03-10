; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_68a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_goodG2BData = dso_local global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 200) #4, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 49) #4, !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %3, i32** @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_badData, align 8, !dbg !35
  call void (...) @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68b_badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #4, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #4, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store i32* null, i32** %data, align 8, !dbg !64
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !65
  %0 = bitcast i8* %call to i32*, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !67
  %1 = load i32*, i32** %data, align 8, !dbg !68
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !69
  %2 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !70
  store i32 0, i32* %arrayidx, align 4, !dbg !71
  %3 = load i32*, i32** %data, align 8, !dbg !72
  store i32* %3, i32** @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_goodG2BData, align 8, !dbg !73
  call void (...) @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68b_goodG2BSink(), !dbg !74
  ret void, !dbg !75
}

declare dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_bad", scope: !14, file: !14, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 31, type: !6)
!25 = !DILocation(line: 31, column: 15, scope: !21)
!26 = !DILocation(line: 32, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 23, scope: !21)
!28 = !DILocation(line: 34, column: 12, scope: !21)
!29 = !DILocation(line: 34, column: 10, scope: !21)
!30 = !DILocation(line: 35, column: 13, scope: !21)
!31 = !DILocation(line: 35, column: 5, scope: !21)
!32 = !DILocation(line: 36, column: 5, scope: !21)
!33 = !DILocation(line: 36, column: 16, scope: !21)
!34 = !DILocation(line: 37, column: 65, scope: !21)
!35 = !DILocation(line: 37, column: 63, scope: !21)
!36 = !DILocation(line: 38, column: 5, scope: !21)
!37 = !DILocation(line: 39, column: 1, scope: !21)
!38 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_68_good", scope: !14, file: !14, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 63, column: 5, scope: !38)
!40 = !DILocation(line: 64, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 76, type: !42, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!9, !9, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !14, line: 76, type: !9)
!48 = !DILocation(line: 76, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !14, line: 76, type: !44)
!50 = !DILocation(line: 76, column: 27, scope: !41)
!51 = !DILocation(line: 79, column: 22, scope: !41)
!52 = !DILocation(line: 79, column: 12, scope: !41)
!53 = !DILocation(line: 79, column: 5, scope: !41)
!54 = !DILocation(line: 81, column: 5, scope: !41)
!55 = !DILocation(line: 82, column: 5, scope: !41)
!56 = !DILocation(line: 83, column: 5, scope: !41)
!57 = !DILocation(line: 86, column: 5, scope: !41)
!58 = !DILocation(line: 87, column: 5, scope: !41)
!59 = !DILocation(line: 88, column: 5, scope: !41)
!60 = !DILocation(line: 90, column: 5, scope: !41)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 49, type: !22, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "data", scope: !61, file: !14, line: 51, type: !6)
!63 = !DILocation(line: 51, column: 15, scope: !61)
!64 = !DILocation(line: 52, column: 10, scope: !61)
!65 = !DILocation(line: 54, column: 23, scope: !61)
!66 = !DILocation(line: 54, column: 12, scope: !61)
!67 = !DILocation(line: 54, column: 10, scope: !61)
!68 = !DILocation(line: 55, column: 13, scope: !61)
!69 = !DILocation(line: 55, column: 5, scope: !61)
!70 = !DILocation(line: 56, column: 5, scope: !61)
!71 = !DILocation(line: 56, column: 17, scope: !61)
!72 = !DILocation(line: 57, column: 69, scope: !61)
!73 = !DILocation(line: 57, column: 67, scope: !61)
!74 = !DILocation(line: 58, column: 5, scope: !61)
!75 = !DILocation(line: 59, column: 1, scope: !61)
