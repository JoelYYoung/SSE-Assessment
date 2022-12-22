; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !37
  %1 = load i8*, i8** %0, align 8, !dbg !38
  store i8* %1, i8** %data1, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data1, align 8, !dbg !40
  %2 = load i8*, i8** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %3 = load i8*, i8** %data1, align 8, !dbg !43
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  store i8* %3, i8** %4, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !49
  %6 = load i8*, i8** %5, align 8, !dbg !50
  store i8* %6, i8** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx4, align 1, !dbg !56
  %7 = load i8*, i8** %data2, align 8, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !58
  %8 = load i8*, i8** %data2, align 8, !dbg !59
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !59
  store i8 0, i8* %arrayidx6, align 1, !dbg !60
  %9 = load i8*, i8** %data2, align 8, !dbg !61
  call void @printLine(i8* %9), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !99
  %1 = load i8*, i8** %0, align 8, !dbg !100
  store i8* %1, i8** %data1, align 8, !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data1, align 8, !dbg !102
  %2 = load i8*, i8** %data1, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %3 = load i8*, i8** %data1, align 8, !dbg !105
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !106
  store i8* %3, i8** %4, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !108, metadata !DIExpression()), !dbg !110
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !111
  %6 = load i8*, i8** %5, align 8, !dbg !112
  store i8* %6, i8** %data2, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx4, align 1, !dbg !118
  %7 = load i8*, i8** %data2, align 8, !dbg !119
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !120
  %8 = load i8*, i8** %data2, align 8, !dbg !121
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !121
  store i8 0, i8* %arrayidx6, align 1, !dbg !122
  %9 = load i8*, i8** %data2, align 8, !dbg !123
  call void @printLine(i8* %9), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32.c", directory: "/root/SSE-Assessment")
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
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 29, column: 10, scope: !11)
!34 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 31, type: !16)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!36 = !DILocation(line: 31, column: 16, scope: !35)
!37 = !DILocation(line: 31, column: 24, scope: !35)
!38 = !DILocation(line: 31, column: 23, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 14, scope: !35)
!41 = !DILocation(line: 35, column: 9, scope: !35)
!42 = !DILocation(line: 35, column: 17, scope: !35)
!43 = !DILocation(line: 36, column: 21, scope: !35)
!44 = !DILocation(line: 36, column: 10, scope: !35)
!45 = !DILocation(line: 36, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !12, line: 39, type: !16)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 16, scope: !47)
!49 = !DILocation(line: 39, column: 24, scope: !47)
!50 = !DILocation(line: 39, column: 23, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 41, type: !30)
!52 = distinct !DILexicalBlock(scope: !47, file: !12, line: 40, column: 9)
!53 = !DILocation(line: 41, column: 18, scope: !52)
!54 = !DILocation(line: 42, column: 13, scope: !52)
!55 = !DILocation(line: 43, column: 13, scope: !52)
!56 = !DILocation(line: 43, column: 27, scope: !52)
!57 = !DILocation(line: 45, column: 21, scope: !52)
!58 = !DILocation(line: 45, column: 13, scope: !52)
!59 = !DILocation(line: 46, column: 13, scope: !52)
!60 = !DILocation(line: 46, column: 25, scope: !52)
!61 = !DILocation(line: 47, column: 23, scope: !52)
!62 = !DILocation(line: 47, column: 13, scope: !52)
!63 = !DILocation(line: 50, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_32_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 87, column: 5, scope: !64)
!66 = !DILocation(line: 88, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !68, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !20}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 99, type: !70)
!72 = !DILocation(line: 99, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 99, type: !20)
!74 = !DILocation(line: 99, column: 27, scope: !67)
!75 = !DILocation(line: 102, column: 22, scope: !67)
!76 = !DILocation(line: 102, column: 12, scope: !67)
!77 = !DILocation(line: 102, column: 5, scope: !67)
!78 = !DILocation(line: 104, column: 5, scope: !67)
!79 = !DILocation(line: 105, column: 5, scope: !67)
!80 = !DILocation(line: 106, column: 5, scope: !67)
!81 = !DILocation(line: 109, column: 5, scope: !67)
!82 = !DILocation(line: 110, column: 5, scope: !67)
!83 = !DILocation(line: 111, column: 5, scope: !67)
!84 = !DILocation(line: 113, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 59, type: !16)
!87 = !DILocation(line: 59, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !12, line: 60, type: !20)
!89 = !DILocation(line: 60, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !12, line: 61, type: !20)
!91 = !DILocation(line: 61, column: 13, scope: !85)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 62, type: !25)
!93 = !DILocation(line: 62, column: 10, scope: !85)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 63, type: !30)
!95 = !DILocation(line: 63, column: 10, scope: !85)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 65, type: !16)
!97 = distinct !DILexicalBlock(scope: !85, file: !12, line: 64, column: 5)
!98 = !DILocation(line: 65, column: 16, scope: !97)
!99 = !DILocation(line: 65, column: 24, scope: !97)
!100 = !DILocation(line: 65, column: 23, scope: !97)
!101 = !DILocation(line: 67, column: 16, scope: !97)
!102 = !DILocation(line: 67, column: 14, scope: !97)
!103 = !DILocation(line: 68, column: 9, scope: !97)
!104 = !DILocation(line: 68, column: 17, scope: !97)
!105 = !DILocation(line: 69, column: 21, scope: !97)
!106 = !DILocation(line: 69, column: 10, scope: !97)
!107 = !DILocation(line: 69, column: 19, scope: !97)
!108 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 72, type: !16)
!109 = distinct !DILexicalBlock(scope: !85, file: !12, line: 71, column: 5)
!110 = !DILocation(line: 72, column: 16, scope: !109)
!111 = !DILocation(line: 72, column: 24, scope: !109)
!112 = !DILocation(line: 72, column: 23, scope: !109)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 74, type: !30)
!114 = distinct !DILexicalBlock(scope: !109, file: !12, line: 73, column: 9)
!115 = !DILocation(line: 74, column: 18, scope: !114)
!116 = !DILocation(line: 75, column: 13, scope: !114)
!117 = !DILocation(line: 76, column: 13, scope: !114)
!118 = !DILocation(line: 76, column: 27, scope: !114)
!119 = !DILocation(line: 78, column: 21, scope: !114)
!120 = !DILocation(line: 78, column: 13, scope: !114)
!121 = !DILocation(line: 79, column: 13, scope: !114)
!122 = !DILocation(line: 79, column: 25, scope: !114)
!123 = !DILocation(line: 80, column: 23, scope: !114)
!124 = !DILocation(line: 80, column: 13, scope: !114)
!125 = !DILocation(line: 83, column: 1, scope: !85)
