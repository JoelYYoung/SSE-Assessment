; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %6 = load i8*, i8** %data, align 8, !dbg !38
  %call = call i64 @strlen(i8* %6) #7, !dbg !39
  %mul = mul i64 %call, 1, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !36
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %7 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #8, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #8, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 100, align 16, !dbg !74
  store i8* %0, i8** %dataBuffer, align 8, !dbg !73
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  store i8* %1, i8** %data, align 8, !dbg !76
  %2 = load i8*, i8** %data, align 8, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !80
  %3 = load i8*, i8** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !85
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !86
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %6 = load i8*, i8** %data, align 8, !dbg !88
  %call = call i64 @strlen(i8* %6) #7, !dbg !89
  %mul = mul i64 %call, 1, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !86
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !91
  store i8 0, i8* %arrayidx1, align 1, !dbg !92
  %7 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* %7), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %0, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %1, i8** %data, align 8, !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !115
  %call = call i64 @strlen(i8* %6) #7, !dbg !116
  %mul = mul i64 %call, 1, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !113
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx1, align 1, !dbg !119
  %7 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %7), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 31, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 31, column: 9, scope: !25)
!28 = !DILocation(line: 32, column: 9, scope: !25)
!29 = !DILocation(line: 32, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !14, line: 35, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 35, column: 14, scope: !31)
!36 = !DILocation(line: 37, column: 9, scope: !31)
!37 = !DILocation(line: 37, column: 22, scope: !31)
!38 = !DILocation(line: 37, column: 35, scope: !31)
!39 = !DILocation(line: 37, column: 28, scope: !31)
!40 = !DILocation(line: 37, column: 40, scope: !31)
!41 = !DILocation(line: 38, column: 9, scope: !31)
!42 = !DILocation(line: 38, column: 20, scope: !31)
!43 = !DILocation(line: 39, column: 19, scope: !31)
!44 = !DILocation(line: 39, column: 9, scope: !31)
!45 = !DILocation(line: 41, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_02_good", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 96, column: 5, scope: !46)
!48 = !DILocation(line: 97, column: 5, scope: !46)
!49 = !DILocation(line: 98, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 110, type: !51, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 110, type: !53)
!56 = !DILocation(line: 110, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 110, type: !54)
!58 = !DILocation(line: 110, column: 27, scope: !50)
!59 = !DILocation(line: 113, column: 22, scope: !50)
!60 = !DILocation(line: 113, column: 12, scope: !50)
!61 = !DILocation(line: 113, column: 5, scope: !50)
!62 = !DILocation(line: 115, column: 5, scope: !50)
!63 = !DILocation(line: 116, column: 5, scope: !50)
!64 = !DILocation(line: 117, column: 5, scope: !50)
!65 = !DILocation(line: 120, column: 5, scope: !50)
!66 = !DILocation(line: 121, column: 5, scope: !50)
!67 = !DILocation(line: 122, column: 5, scope: !50)
!68 = !DILocation(line: 124, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 50, type: !4)
!71 = !DILocation(line: 50, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !14, line: 51, type: !4)
!73 = !DILocation(line: 51, column: 12, scope: !69)
!74 = !DILocation(line: 51, column: 33, scope: !69)
!75 = !DILocation(line: 52, column: 12, scope: !69)
!76 = !DILocation(line: 52, column: 10, scope: !69)
!77 = !DILocation(line: 61, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !14, line: 59, column: 5)
!79 = distinct !DILexicalBlock(scope: !69, file: !14, line: 53, column: 8)
!80 = !DILocation(line: 61, column: 9, scope: !78)
!81 = !DILocation(line: 62, column: 9, scope: !78)
!82 = !DILocation(line: 62, column: 20, scope: !78)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !14, line: 65, type: !32)
!84 = distinct !DILexicalBlock(scope: !69, file: !14, line: 64, column: 5)
!85 = !DILocation(line: 65, column: 14, scope: !84)
!86 = !DILocation(line: 67, column: 9, scope: !84)
!87 = !DILocation(line: 67, column: 22, scope: !84)
!88 = !DILocation(line: 67, column: 35, scope: !84)
!89 = !DILocation(line: 67, column: 28, scope: !84)
!90 = !DILocation(line: 67, column: 40, scope: !84)
!91 = !DILocation(line: 68, column: 9, scope: !84)
!92 = !DILocation(line: 68, column: 20, scope: !84)
!93 = !DILocation(line: 69, column: 19, scope: !84)
!94 = !DILocation(line: 69, column: 9, scope: !84)
!95 = !DILocation(line: 71, column: 1, scope: !69)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 76, type: !4)
!98 = !DILocation(line: 76, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !14, line: 77, type: !4)
!100 = !DILocation(line: 77, column: 12, scope: !96)
!101 = !DILocation(line: 77, column: 33, scope: !96)
!102 = !DILocation(line: 78, column: 12, scope: !96)
!103 = !DILocation(line: 78, column: 10, scope: !96)
!104 = !DILocation(line: 82, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !14, line: 80, column: 5)
!106 = distinct !DILexicalBlock(scope: !96, file: !14, line: 79, column: 8)
!107 = !DILocation(line: 82, column: 9, scope: !105)
!108 = !DILocation(line: 83, column: 9, scope: !105)
!109 = !DILocation(line: 83, column: 20, scope: !105)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !14, line: 86, type: !32)
!111 = distinct !DILexicalBlock(scope: !96, file: !14, line: 85, column: 5)
!112 = !DILocation(line: 86, column: 14, scope: !111)
!113 = !DILocation(line: 88, column: 9, scope: !111)
!114 = !DILocation(line: 88, column: 22, scope: !111)
!115 = !DILocation(line: 88, column: 35, scope: !111)
!116 = !DILocation(line: 88, column: 28, scope: !111)
!117 = !DILocation(line: 88, column: 40, scope: !111)
!118 = !DILocation(line: 89, column: 9, scope: !111)
!119 = !DILocation(line: 89, column: 20, scope: !111)
!120 = !DILocation(line: 90, column: 19, scope: !111)
!121 = !DILocation(line: 90, column: 9, scope: !111)
!122 = !DILocation(line: 92, column: 1, scope: !96)
