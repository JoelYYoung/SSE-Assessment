; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02_bad() #0 !dbg !13 {
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
  %call = call i64 @strlen(i8* %5) #6, !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !39
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !40
  %7 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %7), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 100, align 16, !dbg !72
  store i8* %0, i8** %dataBuffer, align 8, !dbg !71
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  store i8* %1, i8** %data, align 8, !dbg !74
  %2 = load i8*, i8** %data, align 8, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !81, metadata !DIExpression()), !dbg !83
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !83
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !84
  %5 = load i8*, i8** %data, align 8, !dbg !85
  %call = call i64 @strlen(i8* %5) #6, !dbg !86
  %6 = load i8*, i8** %data, align 8, !dbg !87
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !88
  %7 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* %7), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 100, align 16, !dbg !97
  store i8* %0, i8** %dataBuffer, align 8, !dbg !96
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  store i8* %1, i8** %data, align 8, !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !109
  %5 = load i8*, i8** %data, align 8, !dbg !110
  %call = call i64 @strlen(i8* %5) #6, !dbg !111
  %6 = load i8*, i8** %data, align 8, !dbg !112
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !113
  %7 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %7), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 32, type: !4)
!20 = !DILocation(line: 32, column: 12, scope: !13)
!21 = !DILocation(line: 32, column: 33, scope: !13)
!22 = !DILocation(line: 33, column: 12, scope: !13)
!23 = !DILocation(line: 33, column: 10, scope: !13)
!24 = !DILocation(line: 37, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !14, line: 35, column: 5)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 8)
!27 = !DILocation(line: 37, column: 9, scope: !25)
!28 = !DILocation(line: 38, column: 9, scope: !25)
!29 = !DILocation(line: 38, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !14, line: 41, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 41, column: 14, scope: !31)
!36 = !DILocation(line: 43, column: 18, scope: !31)
!37 = !DILocation(line: 43, column: 31, scope: !31)
!38 = !DILocation(line: 43, column: 24, scope: !31)
!39 = !DILocation(line: 43, column: 44, scope: !31)
!40 = !DILocation(line: 43, column: 9, scope: !31)
!41 = !DILocation(line: 44, column: 19, scope: !31)
!42 = !DILocation(line: 44, column: 9, scope: !31)
!43 = !DILocation(line: 46, column: 1, scope: !13)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_02_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 99, column: 5, scope: !44)
!46 = !DILocation(line: 100, column: 5, scope: !44)
!47 = !DILocation(line: 101, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 113, type: !49, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !14, line: 113, type: !51)
!54 = !DILocation(line: 113, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !14, line: 113, type: !52)
!56 = !DILocation(line: 113, column: 27, scope: !48)
!57 = !DILocation(line: 116, column: 22, scope: !48)
!58 = !DILocation(line: 116, column: 12, scope: !48)
!59 = !DILocation(line: 116, column: 5, scope: !48)
!60 = !DILocation(line: 118, column: 5, scope: !48)
!61 = !DILocation(line: 119, column: 5, scope: !48)
!62 = !DILocation(line: 120, column: 5, scope: !48)
!63 = !DILocation(line: 123, column: 5, scope: !48)
!64 = !DILocation(line: 124, column: 5, scope: !48)
!65 = !DILocation(line: 125, column: 5, scope: !48)
!66 = !DILocation(line: 127, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !14, line: 55, type: !4)
!69 = !DILocation(line: 55, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !14, line: 56, type: !4)
!71 = !DILocation(line: 56, column: 12, scope: !67)
!72 = !DILocation(line: 56, column: 33, scope: !67)
!73 = !DILocation(line: 57, column: 12, scope: !67)
!74 = !DILocation(line: 57, column: 10, scope: !67)
!75 = !DILocation(line: 66, column: 16, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !14, line: 64, column: 5)
!77 = distinct !DILexicalBlock(scope: !67, file: !14, line: 58, column: 8)
!78 = !DILocation(line: 66, column: 9, scope: !76)
!79 = !DILocation(line: 67, column: 9, scope: !76)
!80 = !DILocation(line: 67, column: 20, scope: !76)
!81 = !DILocalVariable(name: "dest", scope: !82, file: !14, line: 70, type: !32)
!82 = distinct !DILexicalBlock(scope: !67, file: !14, line: 69, column: 5)
!83 = !DILocation(line: 70, column: 14, scope: !82)
!84 = !DILocation(line: 72, column: 18, scope: !82)
!85 = !DILocation(line: 72, column: 31, scope: !82)
!86 = !DILocation(line: 72, column: 24, scope: !82)
!87 = !DILocation(line: 72, column: 44, scope: !82)
!88 = !DILocation(line: 72, column: 9, scope: !82)
!89 = !DILocation(line: 73, column: 19, scope: !82)
!90 = !DILocation(line: 73, column: 9, scope: !82)
!91 = !DILocation(line: 75, column: 1, scope: !67)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 80, type: !4)
!94 = !DILocation(line: 80, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !14, line: 81, type: !4)
!96 = !DILocation(line: 81, column: 12, scope: !92)
!97 = !DILocation(line: 81, column: 33, scope: !92)
!98 = !DILocation(line: 82, column: 12, scope: !92)
!99 = !DILocation(line: 82, column: 10, scope: !92)
!100 = !DILocation(line: 86, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !14, line: 84, column: 5)
!102 = distinct !DILexicalBlock(scope: !92, file: !14, line: 83, column: 8)
!103 = !DILocation(line: 86, column: 9, scope: !101)
!104 = !DILocation(line: 87, column: 9, scope: !101)
!105 = !DILocation(line: 87, column: 20, scope: !101)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !14, line: 90, type: !32)
!107 = distinct !DILexicalBlock(scope: !92, file: !14, line: 89, column: 5)
!108 = !DILocation(line: 90, column: 14, scope: !107)
!109 = !DILocation(line: 92, column: 18, scope: !107)
!110 = !DILocation(line: 92, column: 31, scope: !107)
!111 = !DILocation(line: 92, column: 24, scope: !107)
!112 = !DILocation(line: 92, column: 44, scope: !107)
!113 = !DILocation(line: 92, column: 9, scope: !107)
!114 = !DILocation(line: 93, column: 19, scope: !107)
!115 = !DILocation(line: 93, column: 9, scope: !107)
!116 = !DILocation(line: 95, column: 1, scope: !92)
