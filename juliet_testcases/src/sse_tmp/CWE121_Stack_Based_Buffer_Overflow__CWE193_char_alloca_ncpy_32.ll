; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %3 = load i8*, i8** %2, align 8, !dbg !34
  store i8* %3, i8** %data1, align 8, !dbg !32
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %4, i8** %data1, align 8, !dbg !36
  %5 = load i8*, i8** %data1, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %6 = load i8*, i8** %data1, align 8, !dbg !39
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %6, i8** %7, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %9 = load i8*, i8** %8, align 8, !dbg !46
  store i8* %9, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  %11 = load i8*, i8** %data2, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !56
  %add = add i64 %call, 1, !dbg !57
  %call4 = call i8* @strncpy(i8* %11, i8* %arraydecay, i64 %add) #7, !dbg !58
  %12 = load i8*, i8** %data2, align 8, !dbg !59
  call void @printLine(i8* %12), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #7, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #7, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 10, align 16, !dbg !92
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = alloca i8, i64 11, align 16, !dbg !95
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !99
  %3 = load i8*, i8** %2, align 8, !dbg !100
  store i8* %3, i8** %data1, align 8, !dbg !98
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !101
  store i8* %4, i8** %data1, align 8, !dbg !102
  %5 = load i8*, i8** %data1, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %6 = load i8*, i8** %data1, align 8, !dbg !105
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !106
  store i8* %6, i8** %7, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !108, metadata !DIExpression()), !dbg !110
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !111
  %9 = load i8*, i8** %8, align 8, !dbg !112
  store i8* %9, i8** %data2, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !115
  %11 = load i8*, i8** %data2, align 8, !dbg !116
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !117
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !118
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !119
  %add = add i64 %call, 1, !dbg !120
  %call4 = call i8* @strncpy(i8* %11, i8* %arraydecay, i64 %add) #7, !dbg !121
  %12 = load i8*, i8** %data2, align 8, !dbg !122
  call void @printLine(i8* %12), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 31, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 32, type: !20)
!23 = !DILocation(line: 32, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !4)
!25 = !DILocation(line: 33, column: 12, scope: !13)
!26 = !DILocation(line: 33, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !4)
!28 = !DILocation(line: 34, column: 12, scope: !13)
!29 = !DILocation(line: 34, column: 37, scope: !13)
!30 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 36, type: !4)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 24, scope: !31)
!34 = !DILocation(line: 36, column: 23, scope: !31)
!35 = !DILocation(line: 39, column: 16, scope: !31)
!36 = !DILocation(line: 39, column: 14, scope: !31)
!37 = !DILocation(line: 40, column: 9, scope: !31)
!38 = !DILocation(line: 40, column: 17, scope: !31)
!39 = !DILocation(line: 41, column: 21, scope: !31)
!40 = !DILocation(line: 41, column: 10, scope: !31)
!41 = !DILocation(line: 41, column: 19, scope: !31)
!42 = !DILocalVariable(name: "data", scope: !43, file: !14, line: 44, type: !4)
!43 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!44 = !DILocation(line: 44, column: 16, scope: !43)
!45 = !DILocation(line: 44, column: 24, scope: !43)
!46 = !DILocation(line: 44, column: 23, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 46, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !14, line: 45, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 46, column: 18, scope: !48)
!53 = !DILocation(line: 49, column: 21, scope: !48)
!54 = !DILocation(line: 49, column: 27, scope: !48)
!55 = !DILocation(line: 49, column: 42, scope: !48)
!56 = !DILocation(line: 49, column: 35, scope: !48)
!57 = !DILocation(line: 49, column: 50, scope: !48)
!58 = !DILocation(line: 49, column: 13, scope: !48)
!59 = !DILocation(line: 50, column: 23, scope: !48)
!60 = !DILocation(line: 50, column: 13, scope: !48)
!61 = !DILocation(line: 53, column: 1, scope: !13)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 89, column: 5, scope: !62)
!64 = !DILocation(line: 90, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !66, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !20}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !14, line: 101, type: !68)
!70 = !DILocation(line: 101, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !14, line: 101, type: !20)
!72 = !DILocation(line: 101, column: 27, scope: !65)
!73 = !DILocation(line: 104, column: 22, scope: !65)
!74 = !DILocation(line: 104, column: 12, scope: !65)
!75 = !DILocation(line: 104, column: 5, scope: !65)
!76 = !DILocation(line: 106, column: 5, scope: !65)
!77 = !DILocation(line: 107, column: 5, scope: !65)
!78 = !DILocation(line: 108, column: 5, scope: !65)
!79 = !DILocation(line: 111, column: 5, scope: !65)
!80 = !DILocation(line: 112, column: 5, scope: !65)
!81 = !DILocation(line: 113, column: 5, scope: !65)
!82 = !DILocation(line: 115, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 62, type: !4)
!85 = !DILocation(line: 62, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataPtr1", scope: !83, file: !14, line: 63, type: !20)
!87 = !DILocation(line: 63, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataPtr2", scope: !83, file: !14, line: 64, type: !20)
!89 = !DILocation(line: 64, column: 13, scope: !83)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !14, line: 65, type: !4)
!91 = !DILocation(line: 65, column: 12, scope: !83)
!92 = !DILocation(line: 65, column: 36, scope: !83)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !14, line: 66, type: !4)
!94 = !DILocation(line: 66, column: 12, scope: !83)
!95 = !DILocation(line: 66, column: 37, scope: !83)
!96 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 68, type: !4)
!97 = distinct !DILexicalBlock(scope: !83, file: !14, line: 67, column: 5)
!98 = !DILocation(line: 68, column: 16, scope: !97)
!99 = !DILocation(line: 68, column: 24, scope: !97)
!100 = !DILocation(line: 68, column: 23, scope: !97)
!101 = !DILocation(line: 71, column: 16, scope: !97)
!102 = !DILocation(line: 71, column: 14, scope: !97)
!103 = !DILocation(line: 72, column: 9, scope: !97)
!104 = !DILocation(line: 72, column: 17, scope: !97)
!105 = !DILocation(line: 73, column: 21, scope: !97)
!106 = !DILocation(line: 73, column: 10, scope: !97)
!107 = !DILocation(line: 73, column: 19, scope: !97)
!108 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 76, type: !4)
!109 = distinct !DILexicalBlock(scope: !83, file: !14, line: 75, column: 5)
!110 = !DILocation(line: 76, column: 16, scope: !109)
!111 = !DILocation(line: 76, column: 24, scope: !109)
!112 = !DILocation(line: 76, column: 23, scope: !109)
!113 = !DILocalVariable(name: "source", scope: !114, file: !14, line: 78, type: !49)
!114 = distinct !DILexicalBlock(scope: !109, file: !14, line: 77, column: 9)
!115 = !DILocation(line: 78, column: 18, scope: !114)
!116 = !DILocation(line: 81, column: 21, scope: !114)
!117 = !DILocation(line: 81, column: 27, scope: !114)
!118 = !DILocation(line: 81, column: 42, scope: !114)
!119 = !DILocation(line: 81, column: 35, scope: !114)
!120 = !DILocation(line: 81, column: 50, scope: !114)
!121 = !DILocation(line: 81, column: 13, scope: !114)
!122 = !DILocation(line: 82, column: 23, scope: !114)
!123 = !DILocation(line: 82, column: 13, scope: !114)
!124 = !DILocation(line: 85, column: 1, scope: !83)
