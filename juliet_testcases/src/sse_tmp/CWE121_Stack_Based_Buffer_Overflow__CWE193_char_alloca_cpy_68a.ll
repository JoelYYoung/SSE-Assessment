; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_goodG2BData = dso_local global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_badData, align 8, !dbg !35
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68b_badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68b_badSink(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_good() #0 !dbg !38 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #4, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #4, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = alloca i8, i64 10, align 16, !dbg !65
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %1 = alloca i8, i64 11, align 16, !dbg !68
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !67
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !69
  store i8* %2, i8** %data, align 8, !dbg !70
  %3 = load i8*, i8** %data, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %4 = load i8*, i8** %data, align 8, !dbg !73
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_goodG2BData, align 8, !dbg !74
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68b_goodG2BSink(), !dbg !75
  ret void, !dbg !76
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_badData", scope: !2, file: !12, line: 26, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_goodG2BData", scope: !2, file: !12, line: 27, type: !6, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_bad", scope: !12, file: !12, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 36, type: !6)
!23 = !DILocation(line: 36, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 37, type: !6)
!25 = !DILocation(line: 37, column: 12, scope: !19)
!26 = !DILocation(line: 37, column: 36, scope: !19)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 38, type: !6)
!28 = !DILocation(line: 38, column: 12, scope: !19)
!29 = !DILocation(line: 38, column: 37, scope: !19)
!30 = !DILocation(line: 41, column: 12, scope: !19)
!31 = !DILocation(line: 41, column: 10, scope: !19)
!32 = !DILocation(line: 42, column: 5, scope: !19)
!33 = !DILocation(line: 42, column: 13, scope: !19)
!34 = !DILocation(line: 43, column: 77, scope: !19)
!35 = !DILocation(line: 43, column: 75, scope: !19)
!36 = !DILocation(line: 44, column: 5, scope: !19)
!37 = !DILocation(line: 45, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_68_good", scope: !12, file: !12, line: 68, type: !20, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 70, column: 5, scope: !38)
!40 = !DILocation(line: 71, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !42, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 83, type: !44)
!47 = !DILocation(line: 83, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 83, type: !45)
!49 = !DILocation(line: 83, column: 27, scope: !41)
!50 = !DILocation(line: 86, column: 22, scope: !41)
!51 = !DILocation(line: 86, column: 12, scope: !41)
!52 = !DILocation(line: 86, column: 5, scope: !41)
!53 = !DILocation(line: 88, column: 5, scope: !41)
!54 = !DILocation(line: 89, column: 5, scope: !41)
!55 = !DILocation(line: 90, column: 5, scope: !41)
!56 = !DILocation(line: 93, column: 5, scope: !41)
!57 = !DILocation(line: 94, column: 5, scope: !41)
!58 = !DILocation(line: 95, column: 5, scope: !41)
!59 = !DILocation(line: 97, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 57, type: !6)
!62 = !DILocation(line: 57, column: 12, scope: !60)
!63 = !DILocalVariable(name: "dataBadBuffer", scope: !60, file: !12, line: 58, type: !6)
!64 = !DILocation(line: 58, column: 12, scope: !60)
!65 = !DILocation(line: 58, column: 36, scope: !60)
!66 = !DILocalVariable(name: "dataGoodBuffer", scope: !60, file: !12, line: 59, type: !6)
!67 = !DILocation(line: 59, column: 12, scope: !60)
!68 = !DILocation(line: 59, column: 37, scope: !60)
!69 = !DILocation(line: 62, column: 12, scope: !60)
!70 = !DILocation(line: 62, column: 10, scope: !60)
!71 = !DILocation(line: 63, column: 5, scope: !60)
!72 = !DILocation(line: 63, column: 13, scope: !60)
!73 = !DILocation(line: 64, column: 81, scope: !60)
!74 = !DILocation(line: 64, column: 79, scope: !60)
!75 = !DILocation(line: 65, column: 5, scope: !60)
!76 = !DILocation(line: 66, column: 1, scope: !60)
