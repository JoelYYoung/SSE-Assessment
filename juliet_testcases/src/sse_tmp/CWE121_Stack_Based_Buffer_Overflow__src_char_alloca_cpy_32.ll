; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !29, metadata !DIExpression()), !dbg !31
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !32
  %3 = load i8*, i8** %2, align 8, !dbg !33
  store i8* %3, i8** %data1, align 8, !dbg !31
  %4 = load i8*, i8** %data1, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %data1, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %6 = load i8*, i8** %data1, align 8, !dbg !38
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !39
  store i8* %6, i8** %7, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !41, metadata !DIExpression()), !dbg !43
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !44
  %9 = load i8*, i8** %8, align 8, !dbg !45
  store i8* %9, i8** %data2, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !52
  %11 = load i8*, i8** %data2, align 8, !dbg !53
  %call = call i8* @strcpy(i8* %arraydecay, i8* %11) #5, !dbg !54
  %12 = load i8*, i8** %data2, align 8, !dbg !55
  call void @printLine(i8* %12), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32_good() #0 !dbg !58 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 100, align 16, !dbg !88
  store i8* %0, i8** %dataBuffer, align 8, !dbg !87
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  store i8* %1, i8** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !91, metadata !DIExpression()), !dbg !93
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !94
  %3 = load i8*, i8** %2, align 8, !dbg !95
  store i8* %3, i8** %data1, align 8, !dbg !93
  %4 = load i8*, i8** %data1, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !97
  %5 = load i8*, i8** %data1, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %6 = load i8*, i8** %data1, align 8, !dbg !100
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !101
  store i8* %6, i8** %7, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !103, metadata !DIExpression()), !dbg !105
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !106
  %9 = load i8*, i8** %8, align 8, !dbg !107
  store i8* %9, i8** %data2, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !111
  %11 = load i8*, i8** %data2, align 8, !dbg !112
  %call = call i8* @strcpy(i8* %arraydecay, i8* %11) #5, !dbg !113
  %12 = load i8*, i8** %data2, align 8, !dbg !114
  call void @printLine(i8* %12), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 28, type: !4)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 33, scope: !13)
!27 = !DILocation(line: 29, column: 12, scope: !13)
!28 = !DILocation(line: 29, column: 10, scope: !13)
!29 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 31, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 31, column: 16, scope: !30)
!32 = !DILocation(line: 31, column: 24, scope: !30)
!33 = !DILocation(line: 31, column: 23, scope: !30)
!34 = !DILocation(line: 33, column: 16, scope: !30)
!35 = !DILocation(line: 33, column: 9, scope: !30)
!36 = !DILocation(line: 34, column: 9, scope: !30)
!37 = !DILocation(line: 34, column: 21, scope: !30)
!38 = !DILocation(line: 35, column: 21, scope: !30)
!39 = !DILocation(line: 35, column: 10, scope: !30)
!40 = !DILocation(line: 35, column: 19, scope: !30)
!41 = !DILocalVariable(name: "data", scope: !42, file: !14, line: 38, type: !4)
!42 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 16, scope: !42)
!44 = !DILocation(line: 38, column: 24, scope: !42)
!45 = !DILocation(line: 38, column: 23, scope: !42)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !42, file: !14, line: 39, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 40, column: 18, scope: !47)
!52 = !DILocation(line: 42, column: 20, scope: !47)
!53 = !DILocation(line: 42, column: 26, scope: !47)
!54 = !DILocation(line: 42, column: 13, scope: !47)
!55 = !DILocation(line: 43, column: 23, scope: !47)
!56 = !DILocation(line: 43, column: 13, scope: !47)
!57 = !DILocation(line: 46, column: 1, scope: !13)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_32_good", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 80, column: 5, scope: !58)
!60 = !DILocation(line: 81, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !62, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !20}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !14, line: 92, type: !64)
!66 = !DILocation(line: 92, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !14, line: 92, type: !20)
!68 = !DILocation(line: 92, column: 27, scope: !61)
!69 = !DILocation(line: 95, column: 22, scope: !61)
!70 = !DILocation(line: 95, column: 12, scope: !61)
!71 = !DILocation(line: 95, column: 5, scope: !61)
!72 = !DILocation(line: 97, column: 5, scope: !61)
!73 = !DILocation(line: 98, column: 5, scope: !61)
!74 = !DILocation(line: 99, column: 5, scope: !61)
!75 = !DILocation(line: 102, column: 5, scope: !61)
!76 = !DILocation(line: 103, column: 5, scope: !61)
!77 = !DILocation(line: 104, column: 5, scope: !61)
!78 = !DILocation(line: 106, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 55, type: !4)
!81 = !DILocation(line: 55, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataPtr1", scope: !79, file: !14, line: 56, type: !20)
!83 = !DILocation(line: 56, column: 13, scope: !79)
!84 = !DILocalVariable(name: "dataPtr2", scope: !79, file: !14, line: 57, type: !20)
!85 = !DILocation(line: 57, column: 13, scope: !79)
!86 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !14, line: 58, type: !4)
!87 = !DILocation(line: 58, column: 12, scope: !79)
!88 = !DILocation(line: 58, column: 33, scope: !79)
!89 = !DILocation(line: 59, column: 12, scope: !79)
!90 = !DILocation(line: 59, column: 10, scope: !79)
!91 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 61, type: !4)
!92 = distinct !DILexicalBlock(scope: !79, file: !14, line: 60, column: 5)
!93 = !DILocation(line: 61, column: 16, scope: !92)
!94 = !DILocation(line: 61, column: 24, scope: !92)
!95 = !DILocation(line: 61, column: 23, scope: !92)
!96 = !DILocation(line: 63, column: 16, scope: !92)
!97 = !DILocation(line: 63, column: 9, scope: !92)
!98 = !DILocation(line: 64, column: 9, scope: !92)
!99 = !DILocation(line: 64, column: 20, scope: !92)
!100 = !DILocation(line: 65, column: 21, scope: !92)
!101 = !DILocation(line: 65, column: 10, scope: !92)
!102 = !DILocation(line: 65, column: 19, scope: !92)
!103 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 68, type: !4)
!104 = distinct !DILexicalBlock(scope: !79, file: !14, line: 67, column: 5)
!105 = !DILocation(line: 68, column: 16, scope: !104)
!106 = !DILocation(line: 68, column: 24, scope: !104)
!107 = !DILocation(line: 68, column: 23, scope: !104)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !14, line: 70, type: !48)
!109 = distinct !DILexicalBlock(scope: !104, file: !14, line: 69, column: 9)
!110 = !DILocation(line: 70, column: 18, scope: !109)
!111 = !DILocation(line: 72, column: 20, scope: !109)
!112 = !DILocation(line: 72, column: 26, scope: !109)
!113 = !DILocation(line: 72, column: 13, scope: !109)
!114 = !DILocation(line: 73, column: 23, scope: !109)
!115 = !DILocation(line: 73, column: 13, scope: !109)
!116 = !DILocation(line: 76, column: 1, scope: !79)
