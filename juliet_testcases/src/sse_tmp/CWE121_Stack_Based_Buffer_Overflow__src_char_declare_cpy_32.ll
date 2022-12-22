; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !34
  %1 = load i8*, i8** %0, align 8, !dbg !35
  store i8* %1, i8** %data1, align 8, !dbg !33
  %2 = load i8*, i8** %data1, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !37
  %3 = load i8*, i8** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !40
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %4, i8** %5, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %7 = load i8*, i8** %6, align 8, !dbg !47
  store i8* %7, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !53
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !54
  %9 = load i8*, i8** %data2, align 8, !dbg !55
  %call = call i8* @strcpy(i8* %arraydecay3, i8* %9) #5, !dbg !56
  %10 = load i8*, i8** %data2, align 8, !dbg !57
  call void @printLine(i8* %10), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32_good() #0 !dbg !60 {
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
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
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
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !95
  %1 = load i8*, i8** %0, align 8, !dbg !96
  store i8* %1, i8** %data1, align 8, !dbg !94
  %2 = load i8*, i8** %data1, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !98
  %3 = load i8*, i8** %data1, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %4 = load i8*, i8** %data1, align 8, !dbg !101
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !102
  store i8* %4, i8** %5, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !104, metadata !DIExpression()), !dbg !106
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !107
  %7 = load i8*, i8** %6, align 8, !dbg !108
  store i8* %7, i8** %data2, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !111
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !112
  %9 = load i8*, i8** %data2, align 8, !dbg !113
  %call = call i8* @strcpy(i8* %arraydecay3, i8* %9) #5, !dbg !114
  %10 = load i8*, i8** %data2, align 8, !dbg !115
  call void @printLine(i8* %10), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocation(line: 29, column: 12, scope: !11)
!30 = !DILocation(line: 29, column: 10, scope: !11)
!31 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 31, type: !16)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 31, column: 16, scope: !32)
!34 = !DILocation(line: 31, column: 24, scope: !32)
!35 = !DILocation(line: 31, column: 23, scope: !32)
!36 = !DILocation(line: 33, column: 16, scope: !32)
!37 = !DILocation(line: 33, column: 9, scope: !32)
!38 = !DILocation(line: 34, column: 9, scope: !32)
!39 = !DILocation(line: 34, column: 21, scope: !32)
!40 = !DILocation(line: 35, column: 21, scope: !32)
!41 = !DILocation(line: 35, column: 10, scope: !32)
!42 = !DILocation(line: 35, column: 19, scope: !32)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 38, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 16, scope: !44)
!46 = !DILocation(line: 38, column: 24, scope: !44)
!47 = !DILocation(line: 38, column: 23, scope: !44)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 39, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 40, column: 18, scope: !49)
!54 = !DILocation(line: 42, column: 20, scope: !49)
!55 = !DILocation(line: 42, column: 26, scope: !49)
!56 = !DILocation(line: 42, column: 13, scope: !49)
!57 = !DILocation(line: 43, column: 23, scope: !49)
!58 = !DILocation(line: 43, column: 13, scope: !49)
!59 = !DILocation(line: 46, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_32_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 80, column: 5, scope: !60)
!62 = !DILocation(line: 81, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !64, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !20}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 92, type: !66)
!68 = !DILocation(line: 92, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 92, type: !20)
!70 = !DILocation(line: 92, column: 27, scope: !63)
!71 = !DILocation(line: 95, column: 22, scope: !63)
!72 = !DILocation(line: 95, column: 12, scope: !63)
!73 = !DILocation(line: 95, column: 5, scope: !63)
!74 = !DILocation(line: 97, column: 5, scope: !63)
!75 = !DILocation(line: 98, column: 5, scope: !63)
!76 = !DILocation(line: 99, column: 5, scope: !63)
!77 = !DILocation(line: 102, column: 5, scope: !63)
!78 = !DILocation(line: 103, column: 5, scope: !63)
!79 = !DILocation(line: 104, column: 5, scope: !63)
!80 = !DILocation(line: 106, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 55, type: !16)
!83 = !DILocation(line: 55, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataPtr1", scope: !81, file: !12, line: 56, type: !20)
!85 = !DILocation(line: 56, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataPtr2", scope: !81, file: !12, line: 57, type: !20)
!87 = !DILocation(line: 57, column: 13, scope: !81)
!88 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 58, type: !25)
!89 = !DILocation(line: 58, column: 10, scope: !81)
!90 = !DILocation(line: 59, column: 12, scope: !81)
!91 = !DILocation(line: 59, column: 10, scope: !81)
!92 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 61, type: !16)
!93 = distinct !DILexicalBlock(scope: !81, file: !12, line: 60, column: 5)
!94 = !DILocation(line: 61, column: 16, scope: !93)
!95 = !DILocation(line: 61, column: 24, scope: !93)
!96 = !DILocation(line: 61, column: 23, scope: !93)
!97 = !DILocation(line: 63, column: 16, scope: !93)
!98 = !DILocation(line: 63, column: 9, scope: !93)
!99 = !DILocation(line: 64, column: 9, scope: !93)
!100 = !DILocation(line: 64, column: 20, scope: !93)
!101 = !DILocation(line: 65, column: 21, scope: !93)
!102 = !DILocation(line: 65, column: 10, scope: !93)
!103 = !DILocation(line: 65, column: 19, scope: !93)
!104 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 68, type: !16)
!105 = distinct !DILexicalBlock(scope: !81, file: !12, line: 67, column: 5)
!106 = !DILocation(line: 68, column: 16, scope: !105)
!107 = !DILocation(line: 68, column: 24, scope: !105)
!108 = !DILocation(line: 68, column: 23, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !12, line: 70, type: !50)
!110 = distinct !DILexicalBlock(scope: !105, file: !12, line: 69, column: 9)
!111 = !DILocation(line: 70, column: 18, scope: !110)
!112 = !DILocation(line: 72, column: 20, scope: !110)
!113 = !DILocation(line: 72, column: 26, scope: !110)
!114 = !DILocation(line: 72, column: 13, scope: !110)
!115 = !DILocation(line: 73, column: 23, scope: !110)
!116 = !DILocation(line: 73, column: 13, scope: !110)
!117 = !DILocation(line: 76, column: 1, scope: !81)
