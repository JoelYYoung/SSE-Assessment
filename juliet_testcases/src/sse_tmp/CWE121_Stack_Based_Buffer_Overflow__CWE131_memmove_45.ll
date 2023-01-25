; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %data, align 8, !dbg !27
  %2 = load i32*, i32** %data, align 8, !dbg !28
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData, align 8, !dbg !29
  call void @badSink(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_good() #0 !dbg !32 {
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
  %call = call i64 @time(i64* null) #6, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #6, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData, align 8, !dbg !58
  store i32* %0, i32** %data, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !59, metadata !DIExpression()), !dbg !64
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !64
  %2 = load i32*, i32** %data, align 8, !dbg !65
  %3 = bitcast i32* %2 to i8*, !dbg !66
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !66
  %4 = bitcast i32* %arraydecay to i8*, !dbg !66
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 40, i1 false), !dbg !66
  %5 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !67
  %6 = load i32, i32* %arrayidx, align 4, !dbg !67
  call void @printIntLine(i32 %6), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %0 = alloca i8, i64 40, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %data, align 8, !dbg !76
  %2 = load i32*, i32** %data, align 8, !dbg !77
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData, align 8, !dbg !78
  call void @goodG2BSink(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData, align 8, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !87
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %3 = bitcast i32* %2 to i8*, !dbg !89
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !89
  %4 = bitcast i32* %arraydecay to i8*, !dbg !89
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 40, i1 false), !dbg !89
  %5 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !90
  %6 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 %6), !dbg !91
  ret void, !dbg !92
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_badData", scope: !2, file: !12, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData", scope: !2, file: !12, line: 20, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_bad", scope: !12, file: !12, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 37, type: !6)
!23 = !DILocation(line: 37, column: 11, scope: !19)
!24 = !DILocation(line: 38, column: 10, scope: !19)
!25 = !DILocation(line: 40, column: 19, scope: !19)
!26 = !DILocation(line: 40, column: 12, scope: !19)
!27 = !DILocation(line: 40, column: 10, scope: !19)
!28 = !DILocation(line: 41, column: 69, scope: !19)
!29 = !DILocation(line: 41, column: 67, scope: !19)
!30 = !DILocation(line: 42, column: 5, scope: !19)
!31 = !DILocation(line: 43, column: 1, scope: !19)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_45_good", scope: !12, file: !12, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocation(line: 73, column: 5, scope: !32)
!34 = !DILocation(line: 74, column: 1, scope: !32)
!35 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !36, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!7, !7, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !12, line: 85, type: !7)
!42 = !DILocation(line: 85, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !12, line: 85, type: !38)
!44 = !DILocation(line: 85, column: 27, scope: !35)
!45 = !DILocation(line: 88, column: 22, scope: !35)
!46 = !DILocation(line: 88, column: 12, scope: !35)
!47 = !DILocation(line: 88, column: 5, scope: !35)
!48 = !DILocation(line: 90, column: 5, scope: !35)
!49 = !DILocation(line: 91, column: 5, scope: !35)
!50 = !DILocation(line: 92, column: 5, scope: !35)
!51 = !DILocation(line: 95, column: 5, scope: !35)
!52 = !DILocation(line: 96, column: 5, scope: !35)
!53 = !DILocation(line: 97, column: 5, scope: !35)
!54 = !DILocation(line: 99, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "data", scope: !55, file: !12, line: 26, type: !6)
!57 = !DILocation(line: 26, column: 11, scope: !55)
!58 = !DILocation(line: 26, column: 18, scope: !55)
!59 = !DILocalVariable(name: "source", scope: !60, file: !12, line: 28, type: !61)
!60 = distinct !DILexicalBlock(scope: !55, file: !12, line: 27, column: 5)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 10)
!64 = !DILocation(line: 28, column: 13, scope: !60)
!65 = !DILocation(line: 30, column: 17, scope: !60)
!66 = !DILocation(line: 30, column: 9, scope: !60)
!67 = !DILocation(line: 31, column: 22, scope: !60)
!68 = !DILocation(line: 31, column: 9, scope: !60)
!69 = !DILocation(line: 33, column: 1, scope: !55)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 63, type: !6)
!72 = !DILocation(line: 63, column: 11, scope: !70)
!73 = !DILocation(line: 64, column: 10, scope: !70)
!74 = !DILocation(line: 66, column: 19, scope: !70)
!75 = !DILocation(line: 66, column: 12, scope: !70)
!76 = !DILocation(line: 66, column: 10, scope: !70)
!77 = !DILocation(line: 67, column: 73, scope: !70)
!78 = !DILocation(line: 67, column: 71, scope: !70)
!79 = !DILocation(line: 68, column: 5, scope: !70)
!80 = !DILocation(line: 69, column: 1, scope: !70)
!81 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 52, type: !6)
!83 = !DILocation(line: 52, column: 11, scope: !81)
!84 = !DILocation(line: 52, column: 18, scope: !81)
!85 = !DILocalVariable(name: "source", scope: !86, file: !12, line: 54, type: !61)
!86 = distinct !DILexicalBlock(scope: !81, file: !12, line: 53, column: 5)
!87 = !DILocation(line: 54, column: 13, scope: !86)
!88 = !DILocation(line: 56, column: 17, scope: !86)
!89 = !DILocation(line: 56, column: 9, scope: !86)
!90 = !DILocation(line: 57, column: 22, scope: !86)
!91 = !DILocation(line: 57, column: 9, scope: !86)
!92 = !DILocation(line: 59, column: 1, scope: !81)
