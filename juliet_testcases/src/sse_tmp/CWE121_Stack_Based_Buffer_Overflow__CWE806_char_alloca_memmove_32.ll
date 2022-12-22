; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32_bad() #0 !dbg !13 {
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
  %12 = load i8*, i8** %data2, align 8, !dbg !54
  %call = call i64 @strlen(i8* %12) #7, !dbg !55
  %mul = mul i64 %call, 1, !dbg !56
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %11, i64 %mul, i1 false), !dbg !52
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !57
  store i8 0, i8* %arrayidx3, align 1, !dbg !58
  %13 = load i8*, i8** %data2, align 8, !dbg !59
  call void @printLine(i8* %13), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32_good() #0 !dbg !62 {
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
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 100, align 16, !dbg !92
  store i8* %0, i8** %dataBuffer, align 8, !dbg !91
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  store i8* %1, i8** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !98
  %3 = load i8*, i8** %2, align 8, !dbg !99
  store i8* %3, i8** %data1, align 8, !dbg !97
  %4 = load i8*, i8** %data1, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !101
  %5 = load i8*, i8** %data1, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %6 = load i8*, i8** %data1, align 8, !dbg !104
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !105
  store i8* %6, i8** %7, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !107, metadata !DIExpression()), !dbg !109
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !110
  %9 = load i8*, i8** %8, align 8, !dbg !111
  store i8* %9, i8** %data2, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !115
  %11 = load i8*, i8** %data2, align 8, !dbg !116
  %12 = load i8*, i8** %data2, align 8, !dbg !117
  %call = call i64 @strlen(i8* %12) #7, !dbg !118
  %mul = mul i64 %call, 1, !dbg !119
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %11, i64 %mul, i1 false), !dbg !115
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !120
  store i8 0, i8* %arrayidx3, align 1, !dbg !121
  %13 = load i8*, i8** %data2, align 8, !dbg !122
  call void @printLine(i8* %13), !dbg !123
  ret void, !dbg !124
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32.c", directory: "/root/SSE-Assessment")
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
!52 = !DILocation(line: 42, column: 13, scope: !47)
!53 = !DILocation(line: 42, column: 27, scope: !47)
!54 = !DILocation(line: 42, column: 40, scope: !47)
!55 = !DILocation(line: 42, column: 33, scope: !47)
!56 = !DILocation(line: 42, column: 45, scope: !47)
!57 = !DILocation(line: 43, column: 13, scope: !47)
!58 = !DILocation(line: 43, column: 24, scope: !47)
!59 = !DILocation(line: 44, column: 23, scope: !47)
!60 = !DILocation(line: 44, column: 13, scope: !47)
!61 = !DILocation(line: 47, column: 1, scope: !13)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_32_good", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 82, column: 5, scope: !62)
!64 = !DILocation(line: 83, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !66, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !20}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !14, line: 94, type: !68)
!70 = !DILocation(line: 94, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !14, line: 94, type: !20)
!72 = !DILocation(line: 94, column: 27, scope: !65)
!73 = !DILocation(line: 97, column: 22, scope: !65)
!74 = !DILocation(line: 97, column: 12, scope: !65)
!75 = !DILocation(line: 97, column: 5, scope: !65)
!76 = !DILocation(line: 99, column: 5, scope: !65)
!77 = !DILocation(line: 100, column: 5, scope: !65)
!78 = !DILocation(line: 101, column: 5, scope: !65)
!79 = !DILocation(line: 104, column: 5, scope: !65)
!80 = !DILocation(line: 105, column: 5, scope: !65)
!81 = !DILocation(line: 106, column: 5, scope: !65)
!82 = !DILocation(line: 108, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 56, type: !4)
!85 = !DILocation(line: 56, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataPtr1", scope: !83, file: !14, line: 57, type: !20)
!87 = !DILocation(line: 57, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataPtr2", scope: !83, file: !14, line: 58, type: !20)
!89 = !DILocation(line: 58, column: 13, scope: !83)
!90 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !14, line: 59, type: !4)
!91 = !DILocation(line: 59, column: 12, scope: !83)
!92 = !DILocation(line: 59, column: 33, scope: !83)
!93 = !DILocation(line: 60, column: 12, scope: !83)
!94 = !DILocation(line: 60, column: 10, scope: !83)
!95 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 62, type: !4)
!96 = distinct !DILexicalBlock(scope: !83, file: !14, line: 61, column: 5)
!97 = !DILocation(line: 62, column: 16, scope: !96)
!98 = !DILocation(line: 62, column: 24, scope: !96)
!99 = !DILocation(line: 62, column: 23, scope: !96)
!100 = !DILocation(line: 64, column: 16, scope: !96)
!101 = !DILocation(line: 64, column: 9, scope: !96)
!102 = !DILocation(line: 65, column: 9, scope: !96)
!103 = !DILocation(line: 65, column: 20, scope: !96)
!104 = !DILocation(line: 66, column: 21, scope: !96)
!105 = !DILocation(line: 66, column: 10, scope: !96)
!106 = !DILocation(line: 66, column: 19, scope: !96)
!107 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 69, type: !4)
!108 = distinct !DILexicalBlock(scope: !83, file: !14, line: 68, column: 5)
!109 = !DILocation(line: 69, column: 16, scope: !108)
!110 = !DILocation(line: 69, column: 24, scope: !108)
!111 = !DILocation(line: 69, column: 23, scope: !108)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !14, line: 71, type: !48)
!113 = distinct !DILexicalBlock(scope: !108, file: !14, line: 70, column: 9)
!114 = !DILocation(line: 71, column: 18, scope: !113)
!115 = !DILocation(line: 73, column: 13, scope: !113)
!116 = !DILocation(line: 73, column: 27, scope: !113)
!117 = !DILocation(line: 73, column: 40, scope: !113)
!118 = !DILocation(line: 73, column: 33, scope: !113)
!119 = !DILocation(line: 73, column: 45, scope: !113)
!120 = !DILocation(line: 74, column: 13, scope: !113)
!121 = !DILocation(line: 74, column: 24, scope: !113)
!122 = !DILocation(line: 75, column: 23, scope: !113)
!123 = !DILocation(line: 75, column: 13, scope: !113)
!124 = !DILocation(line: 78, column: 1, scope: !83)
