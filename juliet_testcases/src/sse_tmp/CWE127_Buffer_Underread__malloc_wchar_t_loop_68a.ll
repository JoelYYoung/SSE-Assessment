; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_68a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_wchar_t_loop_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__malloc_wchar_t_loop_68_goodG2BData = dso_local global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !33
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %3, i64 -8, !dbg !37
  store i32* %add.ptr, i32** %data, align 8, !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %4, i32** @CWE127_Buffer_Underread__malloc_wchar_t_loop_68_badData, align 8, !dbg !40
  call void (...) @CWE127_Buffer_Underread__malloc_wchar_t_loop_68b_badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_68_good() #0 !dbg !43 {
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
  %call = call i64 @time(i64* null) #4, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #4, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_68_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_68_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !72
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !73
  %0 = bitcast i8* %call to i32*, !dbg !74
  store i32* %0, i32** %dataBuffer, align 8, !dbg !72
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !76
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  store i32* %3, i32** %data, align 8, !dbg !80
  %4 = load i32*, i32** %data, align 8, !dbg !81
  store i32* %4, i32** @CWE127_Buffer_Underread__malloc_wchar_t_loop_68_goodG2BData, align 8, !dbg !82
  call void (...) @CWE127_Buffer_Underread__malloc_wchar_t_loop_68b_goodG2BSink(), !dbg !83
  ret void, !dbg !84
}

declare dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_68_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_68_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_68_bad", scope: !14, file: !14, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 31, type: !6)
!25 = !DILocation(line: 31, column: 15, scope: !21)
!26 = !DILocation(line: 32, column: 10, scope: !21)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !14, line: 34, type: !6)
!28 = distinct !DILexicalBlock(scope: !21, file: !14, line: 33, column: 5)
!29 = !DILocation(line: 34, column: 19, scope: !28)
!30 = !DILocation(line: 34, column: 43, scope: !28)
!31 = !DILocation(line: 34, column: 32, scope: !28)
!32 = !DILocation(line: 35, column: 17, scope: !28)
!33 = !DILocation(line: 35, column: 9, scope: !28)
!34 = !DILocation(line: 36, column: 9, scope: !28)
!35 = !DILocation(line: 36, column: 27, scope: !28)
!36 = !DILocation(line: 38, column: 16, scope: !28)
!37 = !DILocation(line: 38, column: 27, scope: !28)
!38 = !DILocation(line: 38, column: 14, scope: !28)
!39 = !DILocation(line: 40, column: 63, scope: !21)
!40 = !DILocation(line: 40, column: 61, scope: !21)
!41 = !DILocation(line: 41, column: 5, scope: !21)
!42 = !DILocation(line: 42, column: 1, scope: !21)
!43 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_68_good", scope: !14, file: !14, line: 67, type: !22, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 69, column: 5, scope: !43)
!45 = !DILocation(line: 70, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !47, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!9, !9, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 82, type: !9)
!53 = !DILocation(line: 82, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 82, type: !49)
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
!66 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !22, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 54, type: !6)
!68 = !DILocation(line: 54, column: 15, scope: !66)
!69 = !DILocation(line: 55, column: 10, scope: !66)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !14, line: 57, type: !6)
!71 = distinct !DILexicalBlock(scope: !66, file: !14, line: 56, column: 5)
!72 = !DILocation(line: 57, column: 19, scope: !71)
!73 = !DILocation(line: 57, column: 43, scope: !71)
!74 = !DILocation(line: 57, column: 32, scope: !71)
!75 = !DILocation(line: 58, column: 17, scope: !71)
!76 = !DILocation(line: 58, column: 9, scope: !71)
!77 = !DILocation(line: 59, column: 9, scope: !71)
!78 = !DILocation(line: 59, column: 27, scope: !71)
!79 = !DILocation(line: 61, column: 16, scope: !71)
!80 = !DILocation(line: 61, column: 14, scope: !71)
!81 = !DILocation(line: 63, column: 67, scope: !66)
!82 = !DILocation(line: 63, column: 65, scope: !66)
!83 = !DILocation(line: 64, column: 5, scope: !66)
!84 = !DILocation(line: 65, column: 1, scope: !66)
