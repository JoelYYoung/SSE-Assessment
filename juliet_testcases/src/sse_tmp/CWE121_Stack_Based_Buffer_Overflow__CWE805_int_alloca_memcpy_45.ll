; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData = internal global i32* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_good() #0 !dbg !38 {
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
  %call = call i64 @time(i64* null) #6, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #6, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData, align 8, !dbg !64
  store i32* %0, i32** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !65, metadata !DIExpression()), !dbg !70
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !70
  %2 = load i32*, i32** %data, align 8, !dbg !71
  %3 = bitcast i32* %2 to i8*, !dbg !72
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !72
  %4 = bitcast i32* %arraydecay to i8*, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !72
  %5 = load i32*, i32** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !73
  %6 = load i32, i32* %arrayidx, align 4, !dbg !73
  call void @printIntLine(i32 %6), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 200, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = alloca i8, i64 400, align 16, !dbg !85
  %3 = bitcast i8* %2 to i32*, !dbg !86
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !84
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !87
  store i32* %4, i32** %data, align 8, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !89
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData, align 8, !dbg !90
  call void @goodG2BSink(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData, align 8, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !99
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %3 = bitcast i32* %2 to i8*, !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %4 = bitcast i32* %arraydecay to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !102
  %6 = load i32, i32* %arrayidx, align 4, !dbg !102
  call void @printIntLine(i32 %6), !dbg !103
  ret void, !dbg !104
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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData", scope: !2, file: !12, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData", scope: !2, file: !12, line: 20, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_bad", scope: !12, file: !12, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 37, type: !6)
!23 = !DILocation(line: 37, column: 11, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 38, type: !6)
!25 = !DILocation(line: 38, column: 11, scope: !19)
!26 = !DILocation(line: 38, column: 34, scope: !19)
!27 = !DILocation(line: 38, column: 27, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 39, type: !6)
!29 = !DILocation(line: 39, column: 11, scope: !19)
!30 = !DILocation(line: 39, column: 35, scope: !19)
!31 = !DILocation(line: 39, column: 28, scope: !19)
!32 = !DILocation(line: 42, column: 12, scope: !19)
!33 = !DILocation(line: 42, column: 10, scope: !19)
!34 = !DILocation(line: 43, column: 79, scope: !19)
!35 = !DILocation(line: 43, column: 77, scope: !19)
!36 = !DILocation(line: 44, column: 5, scope: !19)
!37 = !DILocation(line: 45, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_good", scope: !12, file: !12, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 76, column: 5, scope: !38)
!40 = !DILocation(line: 77, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !42, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!7, !7, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 88, type: !7)
!48 = !DILocation(line: 88, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 88, type: !44)
!50 = !DILocation(line: 88, column: 27, scope: !41)
!51 = !DILocation(line: 91, column: 22, scope: !41)
!52 = !DILocation(line: 91, column: 12, scope: !41)
!53 = !DILocation(line: 91, column: 5, scope: !41)
!54 = !DILocation(line: 93, column: 5, scope: !41)
!55 = !DILocation(line: 94, column: 5, scope: !41)
!56 = !DILocation(line: 95, column: 5, scope: !41)
!57 = !DILocation(line: 98, column: 5, scope: !41)
!58 = !DILocation(line: 99, column: 5, scope: !41)
!59 = !DILocation(line: 100, column: 5, scope: !41)
!60 = !DILocation(line: 102, column: 5, scope: !41)
!61 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "data", scope: !61, file: !12, line: 26, type: !6)
!63 = !DILocation(line: 26, column: 11, scope: !61)
!64 = !DILocation(line: 26, column: 18, scope: !61)
!65 = !DILocalVariable(name: "source", scope: !66, file: !12, line: 28, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 27, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 100)
!70 = !DILocation(line: 28, column: 13, scope: !66)
!71 = !DILocation(line: 30, column: 16, scope: !66)
!72 = !DILocation(line: 30, column: 9, scope: !66)
!73 = !DILocation(line: 31, column: 22, scope: !66)
!74 = !DILocation(line: 31, column: 9, scope: !66)
!75 = !DILocation(line: 33, column: 1, scope: !61)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 65, type: !6)
!78 = !DILocation(line: 65, column: 11, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !12, line: 66, type: !6)
!80 = !DILocation(line: 66, column: 11, scope: !76)
!81 = !DILocation(line: 66, column: 34, scope: !76)
!82 = !DILocation(line: 66, column: 27, scope: !76)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !12, line: 67, type: !6)
!84 = !DILocation(line: 67, column: 11, scope: !76)
!85 = !DILocation(line: 67, column: 35, scope: !76)
!86 = !DILocation(line: 67, column: 28, scope: !76)
!87 = !DILocation(line: 69, column: 12, scope: !76)
!88 = !DILocation(line: 69, column: 10, scope: !76)
!89 = !DILocation(line: 70, column: 83, scope: !76)
!90 = !DILocation(line: 70, column: 81, scope: !76)
!91 = !DILocation(line: 71, column: 5, scope: !76)
!92 = !DILocation(line: 72, column: 1, scope: !76)
!93 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 54, type: !6)
!95 = !DILocation(line: 54, column: 11, scope: !93)
!96 = !DILocation(line: 54, column: 18, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !12, line: 56, type: !67)
!98 = distinct !DILexicalBlock(scope: !93, file: !12, line: 55, column: 5)
!99 = !DILocation(line: 56, column: 13, scope: !98)
!100 = !DILocation(line: 58, column: 16, scope: !98)
!101 = !DILocation(line: 58, column: 9, scope: !98)
!102 = !DILocation(line: 59, column: 22, scope: !98)
!103 = !DILocation(line: 59, column: 9, scope: !98)
!104 = !DILocation(line: 61, column: 1, scope: !93)
