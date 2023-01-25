; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !28
  %1 = load i32*, i32** %0, align 8, !dbg !29
  store i32* %1, i32** %data1, align 8, !dbg !27
  %2 = alloca i8, i64 10, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %data1, align 8, !dbg !32
  %4 = load i32*, i32** %data1, align 8, !dbg !33
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !34
  store i32* %4, i32** %5, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !36, metadata !DIExpression()), !dbg !38
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !39
  %7 = load i32*, i32** %6, align 8, !dbg !40
  store i32* %7, i32** %data2, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %8 = bitcast [10 x i32]* %source to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !46
  %9 = load i32*, i32** %data2, align 8, !dbg !47
  %10 = bitcast i32* %9 to i8*, !dbg !48
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !48
  %11 = bitcast i32* %arraydecay to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 40, i1 false), !dbg !48
  %12 = load i32*, i32** %data2, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !49
  %13 = load i32, i32* %arrayidx, align 4, !dbg !49
  call void @printIntLine(i32 %13), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !78, metadata !DIExpression()), !dbg !79
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !80, metadata !DIExpression()), !dbg !81
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !83, metadata !DIExpression()), !dbg !85
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !86
  %1 = load i32*, i32** %0, align 8, !dbg !87
  store i32* %1, i32** %data1, align 8, !dbg !85
  %2 = alloca i8, i64 40, align 16, !dbg !88
  %3 = bitcast i8* %2 to i32*, !dbg !89
  store i32* %3, i32** %data1, align 8, !dbg !90
  %4 = load i32*, i32** %data1, align 8, !dbg !91
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !92
  store i32* %4, i32** %5, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !97
  %7 = load i32*, i32** %6, align 8, !dbg !98
  store i32* %7, i32** %data2, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %8 = bitcast [10 x i32]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !101
  %9 = load i32*, i32** %data2, align 8, !dbg !102
  %10 = bitcast i32* %9 to i8*, !dbg !103
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !103
  %11 = bitcast i32* %arraydecay to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 40, i1 false), !dbg !103
  %12 = load i32*, i32** %data2, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !104
  %13 = load i32, i32* %arrayidx, align 4, !dbg !104
  call void @printIntLine(i32 %13), !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 24, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 25, type: !20)
!23 = !DILocation(line: 25, column: 12, scope: !13)
!24 = !DILocation(line: 26, column: 10, scope: !13)
!25 = !DILocalVariable(name: "data", scope: !26, file: !14, line: 28, type: !4)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!27 = !DILocation(line: 28, column: 15, scope: !26)
!28 = !DILocation(line: 28, column: 23, scope: !26)
!29 = !DILocation(line: 28, column: 22, scope: !26)
!30 = !DILocation(line: 30, column: 23, scope: !26)
!31 = !DILocation(line: 30, column: 16, scope: !26)
!32 = !DILocation(line: 30, column: 14, scope: !26)
!33 = !DILocation(line: 31, column: 21, scope: !26)
!34 = !DILocation(line: 31, column: 10, scope: !26)
!35 = !DILocation(line: 31, column: 19, scope: !26)
!36 = !DILocalVariable(name: "data", scope: !37, file: !14, line: 34, type: !4)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 34, column: 15, scope: !37)
!39 = !DILocation(line: 34, column: 23, scope: !37)
!40 = !DILocation(line: 34, column: 22, scope: !37)
!41 = !DILocalVariable(name: "source", scope: !42, file: !14, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !37, file: !14, line: 35, column: 9)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 10)
!46 = !DILocation(line: 36, column: 17, scope: !42)
!47 = !DILocation(line: 38, column: 20, scope: !42)
!48 = !DILocation(line: 38, column: 13, scope: !42)
!49 = !DILocation(line: 39, column: 26, scope: !42)
!50 = !DILocation(line: 39, column: 13, scope: !42)
!51 = !DILocation(line: 42, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_good", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 74, column: 5, scope: !52)
!54 = !DILocation(line: 75, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 86, type: !56, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!5, !5, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 86, type: !5)
!62 = !DILocation(line: 86, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 86, type: !58)
!64 = !DILocation(line: 86, column: 27, scope: !55)
!65 = !DILocation(line: 89, column: 22, scope: !55)
!66 = !DILocation(line: 89, column: 12, scope: !55)
!67 = !DILocation(line: 89, column: 5, scope: !55)
!68 = !DILocation(line: 91, column: 5, scope: !55)
!69 = !DILocation(line: 92, column: 5, scope: !55)
!70 = !DILocation(line: 93, column: 5, scope: !55)
!71 = !DILocation(line: 96, column: 5, scope: !55)
!72 = !DILocation(line: 97, column: 5, scope: !55)
!73 = !DILocation(line: 98, column: 5, scope: !55)
!74 = !DILocation(line: 100, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !14, line: 51, type: !4)
!77 = !DILocation(line: 51, column: 11, scope: !75)
!78 = !DILocalVariable(name: "dataPtr1", scope: !75, file: !14, line: 52, type: !20)
!79 = !DILocation(line: 52, column: 12, scope: !75)
!80 = !DILocalVariable(name: "dataPtr2", scope: !75, file: !14, line: 53, type: !20)
!81 = !DILocation(line: 53, column: 12, scope: !75)
!82 = !DILocation(line: 54, column: 10, scope: !75)
!83 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 56, type: !4)
!84 = distinct !DILexicalBlock(scope: !75, file: !14, line: 55, column: 5)
!85 = !DILocation(line: 56, column: 15, scope: !84)
!86 = !DILocation(line: 56, column: 23, scope: !84)
!87 = !DILocation(line: 56, column: 22, scope: !84)
!88 = !DILocation(line: 58, column: 23, scope: !84)
!89 = !DILocation(line: 58, column: 16, scope: !84)
!90 = !DILocation(line: 58, column: 14, scope: !84)
!91 = !DILocation(line: 59, column: 21, scope: !84)
!92 = !DILocation(line: 59, column: 10, scope: !84)
!93 = !DILocation(line: 59, column: 19, scope: !84)
!94 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 62, type: !4)
!95 = distinct !DILexicalBlock(scope: !75, file: !14, line: 61, column: 5)
!96 = !DILocation(line: 62, column: 15, scope: !95)
!97 = !DILocation(line: 62, column: 23, scope: !95)
!98 = !DILocation(line: 62, column: 22, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 64, type: !43)
!100 = distinct !DILexicalBlock(scope: !95, file: !14, line: 63, column: 9)
!101 = !DILocation(line: 64, column: 17, scope: !100)
!102 = !DILocation(line: 66, column: 20, scope: !100)
!103 = !DILocation(line: 66, column: 13, scope: !100)
!104 = !DILocation(line: 67, column: 26, scope: !100)
!105 = !DILocation(line: 67, column: 13, scope: !100)
!106 = !DILocation(line: 70, column: 1, scope: !75)
