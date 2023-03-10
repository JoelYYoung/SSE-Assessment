; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_goodG2BData = dso_local global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %5, i32** @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_badData, align 8, !dbg !38
  call void (...) @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68b_badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #4, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #4, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = alloca i8, i64 400, align 16, !dbg !69
  %1 = bitcast i8* %0 to i32*, !dbg !70
  store i32* %1, i32** %dataBuffer, align 8, !dbg !68
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !72
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  store i32* %4, i32** %data, align 8, !dbg !76
  %5 = load i32*, i32** %data, align 8, !dbg !77
  store i32* %5, i32** @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_goodG2BData, align 8, !dbg !78
  call void (...) @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68b_goodG2BSink(), !dbg !79
  ret void, !dbg !80
}

declare dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_bad", scope: !14, file: !14, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 31, type: !6)
!25 = !DILocation(line: 31, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 32, type: !6)
!27 = !DILocation(line: 32, column: 15, scope: !21)
!28 = !DILocation(line: 32, column: 39, scope: !21)
!29 = !DILocation(line: 32, column: 28, scope: !21)
!30 = !DILocation(line: 33, column: 13, scope: !21)
!31 = !DILocation(line: 33, column: 5, scope: !21)
!32 = !DILocation(line: 34, column: 5, scope: !21)
!33 = !DILocation(line: 34, column: 23, scope: !21)
!34 = !DILocation(line: 36, column: 12, scope: !21)
!35 = !DILocation(line: 36, column: 23, scope: !21)
!36 = !DILocation(line: 36, column: 10, scope: !21)
!37 = !DILocation(line: 37, column: 64, scope: !21)
!38 = !DILocation(line: 37, column: 62, scope: !21)
!39 = !DILocation(line: 38, column: 5, scope: !21)
!40 = !DILocation(line: 39, column: 1, scope: !21)
!41 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_68_good", scope: !14, file: !14, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 63, column: 5, scope: !41)
!43 = !DILocation(line: 64, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 76, type: !45, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 76, type: !9)
!51 = !DILocation(line: 76, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 76, type: !47)
!53 = !DILocation(line: 76, column: 27, scope: !44)
!54 = !DILocation(line: 79, column: 22, scope: !44)
!55 = !DILocation(line: 79, column: 12, scope: !44)
!56 = !DILocation(line: 79, column: 5, scope: !44)
!57 = !DILocation(line: 81, column: 5, scope: !44)
!58 = !DILocation(line: 82, column: 5, scope: !44)
!59 = !DILocation(line: 83, column: 5, scope: !44)
!60 = !DILocation(line: 86, column: 5, scope: !44)
!61 = !DILocation(line: 87, column: 5, scope: !44)
!62 = !DILocation(line: 88, column: 5, scope: !44)
!63 = !DILocation(line: 90, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 49, type: !22, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 51, type: !6)
!66 = !DILocation(line: 51, column: 15, scope: !64)
!67 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !14, line: 52, type: !6)
!68 = !DILocation(line: 52, column: 15, scope: !64)
!69 = !DILocation(line: 52, column: 39, scope: !64)
!70 = !DILocation(line: 52, column: 28, scope: !64)
!71 = !DILocation(line: 53, column: 13, scope: !64)
!72 = !DILocation(line: 53, column: 5, scope: !64)
!73 = !DILocation(line: 54, column: 5, scope: !64)
!74 = !DILocation(line: 54, column: 23, scope: !64)
!75 = !DILocation(line: 56, column: 12, scope: !64)
!76 = !DILocation(line: 56, column: 10, scope: !64)
!77 = !DILocation(line: 57, column: 68, scope: !64)
!78 = !DILocation(line: 57, column: 66, scope: !64)
!79 = !DILocation(line: 58, column: 5, scope: !64)
!80 = !DILocation(line: 59, column: 1, scope: !64)
