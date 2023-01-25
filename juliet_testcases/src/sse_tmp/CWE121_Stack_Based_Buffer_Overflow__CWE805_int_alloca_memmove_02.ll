; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !27
  store i32* %4, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  %7 = bitcast i32* %6 to i8*, !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !38
  %8 = bitcast i32* %arraydecay to i8*, !dbg !38
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !38
  %9 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !39
  %10 = load i32, i32* %arrayidx, align 4, !dbg !39
  call void @printIntLine(i32 %10), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
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
  %call = call i64 @time(i64* null) #6, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #6, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 200, align 16, !dbg !71
  %1 = bitcast i8* %0 to i32*, !dbg !72
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = alloca i8, i64 400, align 16, !dbg !75
  %3 = bitcast i8* %2 to i32*, !dbg !76
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !74
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !77
  store i32* %4, i32** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !83
  %6 = load i32*, i32** %data, align 8, !dbg !84
  %7 = bitcast i32* %6 to i8*, !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !85
  %8 = bitcast i32* %arraydecay to i8*, !dbg !85
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !85
  %9 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !86
  %10 = load i32, i32* %arrayidx, align 4, !dbg !86
  call void @printIntLine(i32 %10), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 200, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %2 = alloca i8, i64 400, align 16, !dbg !98
  %3 = bitcast i8* %2 to i32*, !dbg !99
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !97
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !100
  store i32* %4, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !106
  %6 = load i32*, i32** %data, align 8, !dbg !107
  %7 = bitcast i32* %6 to i8*, !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %8 = bitcast i32* %arraydecay to i8*, !dbg !108
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !108
  %9 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !109
  %10 = load i32, i32* %arrayidx, align 4, !dbg !109
  call void @printIntLine(i32 %10), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 30, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !14, line: 27, column: 5)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocalVariable(name: "source", scope: !32, file: !14, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 13, scope: !32)
!37 = !DILocation(line: 35, column: 17, scope: !32)
!38 = !DILocation(line: 35, column: 9, scope: !32)
!39 = !DILocation(line: 36, column: 22, scope: !32)
!40 = !DILocation(line: 36, column: 9, scope: !32)
!41 = !DILocation(line: 38, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 89, column: 5, scope: !42)
!44 = !DILocation(line: 90, column: 5, scope: !42)
!45 = !DILocation(line: 91, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !47, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!5, !5, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 103, type: !5)
!53 = !DILocation(line: 103, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 103, type: !49)
!55 = !DILocation(line: 103, column: 27, scope: !46)
!56 = !DILocation(line: 106, column: 22, scope: !46)
!57 = !DILocation(line: 106, column: 12, scope: !46)
!58 = !DILocation(line: 106, column: 5, scope: !46)
!59 = !DILocation(line: 108, column: 5, scope: !46)
!60 = !DILocation(line: 109, column: 5, scope: !46)
!61 = !DILocation(line: 110, column: 5, scope: !46)
!62 = !DILocation(line: 113, column: 5, scope: !46)
!63 = !DILocation(line: 114, column: 5, scope: !46)
!64 = !DILocation(line: 115, column: 5, scope: !46)
!65 = !DILocation(line: 117, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 45, type: !15, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 47, type: !4)
!68 = !DILocation(line: 47, column: 11, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !14, line: 48, type: !4)
!70 = !DILocation(line: 48, column: 11, scope: !66)
!71 = !DILocation(line: 48, column: 34, scope: !66)
!72 = !DILocation(line: 48, column: 27, scope: !66)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !14, line: 49, type: !4)
!74 = !DILocation(line: 49, column: 11, scope: !66)
!75 = !DILocation(line: 49, column: 35, scope: !66)
!76 = !DILocation(line: 49, column: 28, scope: !66)
!77 = !DILocation(line: 58, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !14, line: 56, column: 5)
!79 = distinct !DILexicalBlock(scope: !66, file: !14, line: 50, column: 8)
!80 = !DILocation(line: 58, column: 14, scope: !78)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 61, type: !33)
!82 = distinct !DILexicalBlock(scope: !66, file: !14, line: 60, column: 5)
!83 = !DILocation(line: 61, column: 13, scope: !82)
!84 = !DILocation(line: 63, column: 17, scope: !82)
!85 = !DILocation(line: 63, column: 9, scope: !82)
!86 = !DILocation(line: 64, column: 22, scope: !82)
!87 = !DILocation(line: 64, column: 9, scope: !82)
!88 = !DILocation(line: 66, column: 1, scope: !66)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !14, line: 71, type: !4)
!91 = !DILocation(line: 71, column: 11, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !14, line: 72, type: !4)
!93 = !DILocation(line: 72, column: 11, scope: !89)
!94 = !DILocation(line: 72, column: 34, scope: !89)
!95 = !DILocation(line: 72, column: 27, scope: !89)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !14, line: 73, type: !4)
!97 = !DILocation(line: 73, column: 11, scope: !89)
!98 = !DILocation(line: 73, column: 35, scope: !89)
!99 = !DILocation(line: 73, column: 28, scope: !89)
!100 = !DILocation(line: 77, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !14, line: 75, column: 5)
!102 = distinct !DILexicalBlock(scope: !89, file: !14, line: 74, column: 8)
!103 = !DILocation(line: 77, column: 14, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !14, line: 80, type: !33)
!105 = distinct !DILexicalBlock(scope: !89, file: !14, line: 79, column: 5)
!106 = !DILocation(line: 80, column: 13, scope: !105)
!107 = !DILocation(line: 82, column: 17, scope: !105)
!108 = !DILocation(line: 82, column: 9, scope: !105)
!109 = !DILocation(line: 83, column: 22, scope: !105)
!110 = !DILocation(line: 83, column: 9, scope: !105)
!111 = !DILocation(line: 85, column: 1, scope: !89)
