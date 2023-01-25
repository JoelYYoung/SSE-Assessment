; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !35
  %5 = load i32*, i32** %4, align 8, !dbg !36
  store i32* %5, i32** %data1, align 8, !dbg !34
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %6, i32** %data1, align 8, !dbg !38
  %7 = load i32*, i32** %data1, align 8, !dbg !39
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !40
  store i32* %7, i32** %8, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !45
  %10 = load i32*, i32** %9, align 8, !dbg !46
  store i32* %10, i32** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %11 = bitcast [100 x i32]* %source to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 400, i1 false), !dbg !52
  %12 = load i32*, i32** %data2, align 8, !dbg !53
  %13 = bitcast i32* %12 to i8*, !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %14 = bitcast i32* %arraydecay to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 16 %14, i64 400, i1 false), !dbg !54
  %15 = load i32*, i32** %data2, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 0, !dbg !55
  %16 = load i32, i32* %arrayidx, align 4, !dbg !55
  call void @printIntLine(i32 %16), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !84, metadata !DIExpression()), !dbg !85
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !86, metadata !DIExpression()), !dbg !87
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 200, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 400, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !99
  %5 = load i32*, i32** %4, align 8, !dbg !100
  store i32* %5, i32** %data1, align 8, !dbg !98
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !101
  store i32* %6, i32** %data1, align 8, !dbg !102
  %7 = load i32*, i32** %data1, align 8, !dbg !103
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !104
  store i32* %7, i32** %8, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !106, metadata !DIExpression()), !dbg !108
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !109
  %10 = load i32*, i32** %9, align 8, !dbg !110
  store i32* %10, i32** %data2, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %11 = bitcast [100 x i32]* %source to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 400, i1 false), !dbg !113
  %12 = load i32*, i32** %data2, align 8, !dbg !114
  %13 = bitcast i32* %12 to i8*, !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %14 = bitcast i32* %arraydecay to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 16 %14, i64 400, i1 false), !dbg !115
  %15 = load i32*, i32** %data2, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 0, !dbg !116
  %16 = load i32, i32* %arrayidx, align 4, !dbg !116
  call void @printIntLine(i32 %16), !dbg !117
  ret void, !dbg !118
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 24, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 25, type: !20)
!23 = !DILocation(line: 25, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!25 = !DILocation(line: 26, column: 11, scope: !13)
!26 = !DILocation(line: 26, column: 34, scope: !13)
!27 = !DILocation(line: 26, column: 27, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!29 = !DILocation(line: 27, column: 11, scope: !13)
!30 = !DILocation(line: 27, column: 35, scope: !13)
!31 = !DILocation(line: 27, column: 28, scope: !13)
!32 = !DILocalVariable(name: "data", scope: !33, file: !14, line: 29, type: !4)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 5)
!34 = !DILocation(line: 29, column: 15, scope: !33)
!35 = !DILocation(line: 29, column: 23, scope: !33)
!36 = !DILocation(line: 29, column: 22, scope: !33)
!37 = !DILocation(line: 32, column: 16, scope: !33)
!38 = !DILocation(line: 32, column: 14, scope: !33)
!39 = !DILocation(line: 33, column: 21, scope: !33)
!40 = !DILocation(line: 33, column: 10, scope: !33)
!41 = !DILocation(line: 33, column: 19, scope: !33)
!42 = !DILocalVariable(name: "data", scope: !43, file: !14, line: 36, type: !4)
!43 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!44 = !DILocation(line: 36, column: 15, scope: !43)
!45 = !DILocation(line: 36, column: 23, scope: !43)
!46 = !DILocation(line: 36, column: 22, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 38, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !14, line: 37, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 38, column: 17, scope: !48)
!53 = !DILocation(line: 40, column: 20, scope: !48)
!54 = !DILocation(line: 40, column: 13, scope: !48)
!55 = !DILocation(line: 41, column: 26, scope: !48)
!56 = !DILocation(line: 41, column: 13, scope: !48)
!57 = !DILocation(line: 44, column: 1, scope: !13)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_32_good", scope: !14, file: !14, line: 75, type: !15, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 77, column: 5, scope: !58)
!60 = !DILocation(line: 78, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 89, type: !62, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!5, !5, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !14, line: 89, type: !5)
!68 = !DILocation(line: 89, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !14, line: 89, type: !64)
!70 = !DILocation(line: 89, column: 27, scope: !61)
!71 = !DILocation(line: 92, column: 22, scope: !61)
!72 = !DILocation(line: 92, column: 12, scope: !61)
!73 = !DILocation(line: 92, column: 5, scope: !61)
!74 = !DILocation(line: 94, column: 5, scope: !61)
!75 = !DILocation(line: 95, column: 5, scope: !61)
!76 = !DILocation(line: 96, column: 5, scope: !61)
!77 = !DILocation(line: 99, column: 5, scope: !61)
!78 = !DILocation(line: 100, column: 5, scope: !61)
!79 = !DILocation(line: 101, column: 5, scope: !61)
!80 = !DILocation(line: 103, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !14, line: 53, type: !4)
!83 = !DILocation(line: 53, column: 11, scope: !81)
!84 = !DILocalVariable(name: "dataPtr1", scope: !81, file: !14, line: 54, type: !20)
!85 = !DILocation(line: 54, column: 12, scope: !81)
!86 = !DILocalVariable(name: "dataPtr2", scope: !81, file: !14, line: 55, type: !20)
!87 = !DILocation(line: 55, column: 12, scope: !81)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !14, line: 56, type: !4)
!89 = !DILocation(line: 56, column: 11, scope: !81)
!90 = !DILocation(line: 56, column: 34, scope: !81)
!91 = !DILocation(line: 56, column: 27, scope: !81)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !14, line: 57, type: !4)
!93 = !DILocation(line: 57, column: 11, scope: !81)
!94 = !DILocation(line: 57, column: 35, scope: !81)
!95 = !DILocation(line: 57, column: 28, scope: !81)
!96 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 59, type: !4)
!97 = distinct !DILexicalBlock(scope: !81, file: !14, line: 58, column: 5)
!98 = !DILocation(line: 59, column: 15, scope: !97)
!99 = !DILocation(line: 59, column: 23, scope: !97)
!100 = !DILocation(line: 59, column: 22, scope: !97)
!101 = !DILocation(line: 61, column: 16, scope: !97)
!102 = !DILocation(line: 61, column: 14, scope: !97)
!103 = !DILocation(line: 62, column: 21, scope: !97)
!104 = !DILocation(line: 62, column: 10, scope: !97)
!105 = !DILocation(line: 62, column: 19, scope: !97)
!106 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 65, type: !4)
!107 = distinct !DILexicalBlock(scope: !81, file: !14, line: 64, column: 5)
!108 = !DILocation(line: 65, column: 15, scope: !107)
!109 = !DILocation(line: 65, column: 23, scope: !107)
!110 = !DILocation(line: 65, column: 22, scope: !107)
!111 = !DILocalVariable(name: "source", scope: !112, file: !14, line: 67, type: !49)
!112 = distinct !DILexicalBlock(scope: !107, file: !14, line: 66, column: 9)
!113 = !DILocation(line: 67, column: 17, scope: !112)
!114 = !DILocation(line: 69, column: 20, scope: !112)
!115 = !DILocation(line: 69, column: 13, scope: !112)
!116 = !DILocation(line: 70, column: 26, scope: !112)
!117 = !DILocation(line: 70, column: 13, scope: !112)
!118 = !DILocation(line: 73, column: 1, scope: !81)
