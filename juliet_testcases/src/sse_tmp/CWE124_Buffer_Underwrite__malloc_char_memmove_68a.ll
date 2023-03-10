; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_68a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__malloc_char_memmove_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE124_Buffer_Underwrite__malloc_char_memmove_68_goodG2BData = dso_local global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !28
  store i8* %call, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !30
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 -8, !dbg !34
  store i8* %add.ptr, i8** %data, align 8, !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %3, i8** @CWE124_Buffer_Underwrite__malloc_char_memmove_68_badData, align 8, !dbg !37
  call void (...) @CWE124_Buffer_Underwrite__malloc_char_memmove_68b_badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_68b_badSink(...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_68_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #5, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #5, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_68_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_68_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i8* null, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !66, metadata !DIExpression()), !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !69
  store i8* %call, i8** %dataBuffer, align 8, !dbg !68
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !71
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  store i8* %2, i8** %data, align 8, !dbg !75
  %3 = load i8*, i8** %data, align 8, !dbg !76
  store i8* %3, i8** @CWE124_Buffer_Underwrite__malloc_char_memmove_68_goodG2BData, align 8, !dbg !77
  call void (...) @CWE124_Buffer_Underwrite__malloc_char_memmove_68b_goodG2BSink(), !dbg !78
  ret void, !dbg !79
}

declare dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_68b_goodG2BSink(...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_68_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_68_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_68_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 10, scope: !19)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !12, line: 34, type: !6)
!26 = distinct !DILexicalBlock(scope: !19, file: !12, line: 33, column: 5)
!27 = !DILocation(line: 34, column: 16, scope: !26)
!28 = !DILocation(line: 34, column: 37, scope: !26)
!29 = !DILocation(line: 35, column: 16, scope: !26)
!30 = !DILocation(line: 35, column: 9, scope: !26)
!31 = !DILocation(line: 36, column: 9, scope: !26)
!32 = !DILocation(line: 36, column: 27, scope: !26)
!33 = !DILocation(line: 38, column: 16, scope: !26)
!34 = !DILocation(line: 38, column: 27, scope: !26)
!35 = !DILocation(line: 38, column: 14, scope: !26)
!36 = !DILocation(line: 40, column: 64, scope: !19)
!37 = !DILocation(line: 40, column: 62, scope: !19)
!38 = !DILocation(line: 41, column: 5, scope: !19)
!39 = !DILocation(line: 42, column: 1, scope: !19)
!40 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_68_good", scope: !12, file: !12, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 69, column: 5, scope: !40)
!42 = !DILocation(line: 70, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !44, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 82, type: !46)
!49 = !DILocation(line: 82, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 82, type: !47)
!51 = !DILocation(line: 82, column: 27, scope: !43)
!52 = !DILocation(line: 85, column: 22, scope: !43)
!53 = !DILocation(line: 85, column: 12, scope: !43)
!54 = !DILocation(line: 85, column: 5, scope: !43)
!55 = !DILocation(line: 87, column: 5, scope: !43)
!56 = !DILocation(line: 88, column: 5, scope: !43)
!57 = !DILocation(line: 89, column: 5, scope: !43)
!58 = !DILocation(line: 92, column: 5, scope: !43)
!59 = !DILocation(line: 93, column: 5, scope: !43)
!60 = !DILocation(line: 94, column: 5, scope: !43)
!61 = !DILocation(line: 96, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "data", scope: !62, file: !12, line: 54, type: !6)
!64 = !DILocation(line: 54, column: 12, scope: !62)
!65 = !DILocation(line: 55, column: 10, scope: !62)
!66 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !12, line: 57, type: !6)
!67 = distinct !DILexicalBlock(scope: !62, file: !12, line: 56, column: 5)
!68 = !DILocation(line: 57, column: 16, scope: !67)
!69 = !DILocation(line: 57, column: 37, scope: !67)
!70 = !DILocation(line: 58, column: 16, scope: !67)
!71 = !DILocation(line: 58, column: 9, scope: !67)
!72 = !DILocation(line: 59, column: 9, scope: !67)
!73 = !DILocation(line: 59, column: 27, scope: !67)
!74 = !DILocation(line: 61, column: 16, scope: !67)
!75 = !DILocation(line: 61, column: 14, scope: !67)
!76 = !DILocation(line: 63, column: 68, scope: !62)
!77 = !DILocation(line: 63, column: 66, scope: !62)
!78 = !DILocation(line: 64, column: 5, scope: !62)
!79 = !DILocation(line: 65, column: 1, scope: !62)
