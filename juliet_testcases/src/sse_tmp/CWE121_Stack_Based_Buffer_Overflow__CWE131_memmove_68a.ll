; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_goodG2BData = dso_local global i32* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %data, align 8, !dbg !27
  %2 = load i32*, i32** %data, align 8, !dbg !28
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_badData, align 8, !dbg !29
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68b_badSink(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68b_badSink(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #4, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #4, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !56, metadata !DIExpression()), !dbg !57
  store i32* null, i32** %data, align 8, !dbg !58
  %0 = alloca i8, i64 40, align 16, !dbg !59
  %1 = bitcast i8* %0 to i32*, !dbg !60
  store i32* %1, i32** %data, align 8, !dbg !61
  %2 = load i32*, i32** %data, align 8, !dbg !62
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_goodG2BData, align 8, !dbg !63
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68b_goodG2BSink(), !dbg !64
  ret void, !dbg !65
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_badData", scope: !2, file: !12, line: 19, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_goodG2BData", scope: !2, file: !12, line: 20, type: !6, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_bad", scope: !12, file: !12, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 29, type: !6)
!23 = !DILocation(line: 29, column: 11, scope: !19)
!24 = !DILocation(line: 30, column: 10, scope: !19)
!25 = !DILocation(line: 32, column: 19, scope: !19)
!26 = !DILocation(line: 32, column: 12, scope: !19)
!27 = !DILocation(line: 32, column: 10, scope: !19)
!28 = !DILocation(line: 33, column: 69, scope: !19)
!29 = !DILocation(line: 33, column: 67, scope: !19)
!30 = !DILocation(line: 34, column: 5, scope: !19)
!31 = !DILocation(line: 35, column: 1, scope: !19)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_68_good", scope: !12, file: !12, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocation(line: 57, column: 5, scope: !32)
!34 = !DILocation(line: 58, column: 1, scope: !32)
!35 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 70, type: !36, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!7, !7, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !12, line: 70, type: !7)
!42 = !DILocation(line: 70, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !12, line: 70, type: !38)
!44 = !DILocation(line: 70, column: 27, scope: !35)
!45 = !DILocation(line: 73, column: 22, scope: !35)
!46 = !DILocation(line: 73, column: 12, scope: !35)
!47 = !DILocation(line: 73, column: 5, scope: !35)
!48 = !DILocation(line: 75, column: 5, scope: !35)
!49 = !DILocation(line: 76, column: 5, scope: !35)
!50 = !DILocation(line: 77, column: 5, scope: !35)
!51 = !DILocation(line: 80, column: 5, scope: !35)
!52 = !DILocation(line: 81, column: 5, scope: !35)
!53 = !DILocation(line: 82, column: 5, scope: !35)
!54 = !DILocation(line: 84, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 45, type: !20, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "data", scope: !55, file: !12, line: 47, type: !6)
!57 = !DILocation(line: 47, column: 11, scope: !55)
!58 = !DILocation(line: 48, column: 10, scope: !55)
!59 = !DILocation(line: 50, column: 19, scope: !55)
!60 = !DILocation(line: 50, column: 12, scope: !55)
!61 = !DILocation(line: 50, column: 10, scope: !55)
!62 = !DILocation(line: 51, column: 73, scope: !55)
!63 = !DILocation(line: 51, column: 71, scope: !55)
!64 = !DILocation(line: 52, column: 5, scope: !55)
!65 = !DILocation(line: 53, column: 1, scope: !55)
