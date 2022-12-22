; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32_bad() #0 !dbg !13 {
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
  %call = call i64 @strlen(i8* %11) #6, !dbg !54
  %12 = load i8*, i8** %data2, align 8, !dbg !55
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %12) #7, !dbg !56
  %13 = load i8*, i8** %data2, align 8, !dbg !57
  call void @printLine(i8* %13), !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 100, align 16, !dbg !90
  store i8* %0, i8** %dataBuffer, align 8, !dbg !89
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !91
  store i8* %1, i8** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !93, metadata !DIExpression()), !dbg !95
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !96
  %3 = load i8*, i8** %2, align 8, !dbg !97
  store i8* %3, i8** %data1, align 8, !dbg !95
  %4 = load i8*, i8** %data1, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !99
  %5 = load i8*, i8** %data1, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %6 = load i8*, i8** %data1, align 8, !dbg !102
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !103
  store i8* %6, i8** %7, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !105, metadata !DIExpression()), !dbg !107
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !108
  %9 = load i8*, i8** %8, align 8, !dbg !109
  store i8* %9, i8** %data2, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !113
  %11 = load i8*, i8** %data2, align 8, !dbg !114
  %call = call i64 @strlen(i8* %11) #6, !dbg !115
  %12 = load i8*, i8** %data2, align 8, !dbg !116
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %12) #7, !dbg !117
  %13 = load i8*, i8** %data2, align 8, !dbg !118
  call void @printLine(i8* %13), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 32, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 33, type: !20)
!23 = !DILocation(line: 33, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 34, type: !4)
!25 = !DILocation(line: 34, column: 12, scope: !13)
!26 = !DILocation(line: 34, column: 33, scope: !13)
!27 = !DILocation(line: 35, column: 12, scope: !13)
!28 = !DILocation(line: 35, column: 10, scope: !13)
!29 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 37, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!31 = !DILocation(line: 37, column: 16, scope: !30)
!32 = !DILocation(line: 37, column: 24, scope: !30)
!33 = !DILocation(line: 37, column: 23, scope: !30)
!34 = !DILocation(line: 39, column: 16, scope: !30)
!35 = !DILocation(line: 39, column: 9, scope: !30)
!36 = !DILocation(line: 40, column: 9, scope: !30)
!37 = !DILocation(line: 40, column: 21, scope: !30)
!38 = !DILocation(line: 41, column: 21, scope: !30)
!39 = !DILocation(line: 41, column: 10, scope: !30)
!40 = !DILocation(line: 41, column: 19, scope: !30)
!41 = !DILocalVariable(name: "data", scope: !42, file: !14, line: 44, type: !4)
!42 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!43 = !DILocation(line: 44, column: 16, scope: !42)
!44 = !DILocation(line: 44, column: 24, scope: !42)
!45 = !DILocation(line: 44, column: 23, scope: !42)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 46, type: !48)
!47 = distinct !DILexicalBlock(scope: !42, file: !14, line: 45, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 46, column: 18, scope: !47)
!52 = !DILocation(line: 48, column: 22, scope: !47)
!53 = !DILocation(line: 48, column: 35, scope: !47)
!54 = !DILocation(line: 48, column: 28, scope: !47)
!55 = !DILocation(line: 48, column: 48, scope: !47)
!56 = !DILocation(line: 48, column: 13, scope: !47)
!57 = !DILocation(line: 49, column: 23, scope: !47)
!58 = !DILocation(line: 49, column: 13, scope: !47)
!59 = !DILocation(line: 52, column: 1, scope: !13)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_32_good", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 86, column: 5, scope: !60)
!62 = !DILocation(line: 87, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 98, type: !64, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !20}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 98, type: !66)
!68 = !DILocation(line: 98, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 98, type: !20)
!70 = !DILocation(line: 98, column: 27, scope: !63)
!71 = !DILocation(line: 101, column: 22, scope: !63)
!72 = !DILocation(line: 101, column: 12, scope: !63)
!73 = !DILocation(line: 101, column: 5, scope: !63)
!74 = !DILocation(line: 103, column: 5, scope: !63)
!75 = !DILocation(line: 104, column: 5, scope: !63)
!76 = !DILocation(line: 105, column: 5, scope: !63)
!77 = !DILocation(line: 108, column: 5, scope: !63)
!78 = !DILocation(line: 109, column: 5, scope: !63)
!79 = !DILocation(line: 110, column: 5, scope: !63)
!80 = !DILocation(line: 112, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !14, line: 61, type: !4)
!83 = !DILocation(line: 61, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataPtr1", scope: !81, file: !14, line: 62, type: !20)
!85 = !DILocation(line: 62, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataPtr2", scope: !81, file: !14, line: 63, type: !20)
!87 = !DILocation(line: 63, column: 13, scope: !81)
!88 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !14, line: 64, type: !4)
!89 = !DILocation(line: 64, column: 12, scope: !81)
!90 = !DILocation(line: 64, column: 33, scope: !81)
!91 = !DILocation(line: 65, column: 12, scope: !81)
!92 = !DILocation(line: 65, column: 10, scope: !81)
!93 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 67, type: !4)
!94 = distinct !DILexicalBlock(scope: !81, file: !14, line: 66, column: 5)
!95 = !DILocation(line: 67, column: 16, scope: !94)
!96 = !DILocation(line: 67, column: 24, scope: !94)
!97 = !DILocation(line: 67, column: 23, scope: !94)
!98 = !DILocation(line: 69, column: 16, scope: !94)
!99 = !DILocation(line: 69, column: 9, scope: !94)
!100 = !DILocation(line: 70, column: 9, scope: !94)
!101 = !DILocation(line: 70, column: 20, scope: !94)
!102 = !DILocation(line: 71, column: 21, scope: !94)
!103 = !DILocation(line: 71, column: 10, scope: !94)
!104 = !DILocation(line: 71, column: 19, scope: !94)
!105 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 74, type: !4)
!106 = distinct !DILexicalBlock(scope: !81, file: !14, line: 73, column: 5)
!107 = !DILocation(line: 74, column: 16, scope: !106)
!108 = !DILocation(line: 74, column: 24, scope: !106)
!109 = !DILocation(line: 74, column: 23, scope: !106)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !14, line: 76, type: !48)
!111 = distinct !DILexicalBlock(scope: !106, file: !14, line: 75, column: 9)
!112 = !DILocation(line: 76, column: 18, scope: !111)
!113 = !DILocation(line: 78, column: 22, scope: !111)
!114 = !DILocation(line: 78, column: 35, scope: !111)
!115 = !DILocation(line: 78, column: 28, scope: !111)
!116 = !DILocation(line: 78, column: 48, scope: !111)
!117 = !DILocation(line: 78, column: 13, scope: !111)
!118 = !DILocation(line: 79, column: 23, scope: !111)
!119 = !DILocation(line: 79, column: 13, scope: !111)
!120 = !DILocation(line: 82, column: 1, scope: !81)
