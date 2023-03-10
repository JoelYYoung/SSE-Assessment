; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !36
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx2, align 1, !dbg !38
  %1 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !40
  %2 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !41
  store i8 0, i8* %arrayidx4, align 1, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %3), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15_good() #0 !dbg !46 {
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
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !83
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx2, align 1, !dbg !85
  %1 = load i8*, i8** %data, align 8, !dbg !86
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !88
  store i8 0, i8* %arrayidx4, align 1, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* %3), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i8* %arraydecay, i8** %data, align 8, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx2, align 1, !dbg !109
  %1 = load i8*, i8** %data, align 8, !dbg !110
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !112
  store i8 0, i8* %arrayidx4, align 1, !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %3), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 16, scope: !11)
!30 = !DILocation(line: 33, column: 14, scope: !11)
!31 = !DILocation(line: 34, column: 9, scope: !11)
!32 = !DILocation(line: 34, column: 17, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 42, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!35 = !DILocation(line: 42, column: 14, scope: !34)
!36 = !DILocation(line: 43, column: 9, scope: !34)
!37 = !DILocation(line: 44, column: 9, scope: !34)
!38 = !DILocation(line: 44, column: 23, scope: !34)
!39 = !DILocation(line: 46, column: 16, scope: !34)
!40 = !DILocation(line: 46, column: 9, scope: !34)
!41 = !DILocation(line: 47, column: 9, scope: !34)
!42 = !DILocation(line: 47, column: 21, scope: !34)
!43 = !DILocation(line: 48, column: 19, scope: !34)
!44 = !DILocation(line: 48, column: 9, scope: !34)
!45 = !DILocation(line: 50, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_15_good", scope: !12, file: !12, line: 114, type: !13, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 116, column: 5, scope: !46)
!48 = !DILocation(line: 117, column: 5, scope: !46)
!49 = !DILocation(line: 118, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 130, type: !51, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 130, type: !53)
!56 = !DILocation(line: 130, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 130, type: !54)
!58 = !DILocation(line: 130, column: 27, scope: !50)
!59 = !DILocation(line: 133, column: 22, scope: !50)
!60 = !DILocation(line: 133, column: 12, scope: !50)
!61 = !DILocation(line: 133, column: 5, scope: !50)
!62 = !DILocation(line: 135, column: 5, scope: !50)
!63 = !DILocation(line: 136, column: 5, scope: !50)
!64 = !DILocation(line: 137, column: 5, scope: !50)
!65 = !DILocation(line: 140, column: 5, scope: !50)
!66 = !DILocation(line: 141, column: 5, scope: !50)
!67 = !DILocation(line: 142, column: 5, scope: !50)
!68 = !DILocation(line: 144, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 59, type: !16)
!71 = !DILocation(line: 59, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !12, line: 60, type: !20)
!73 = !DILocation(line: 60, column: 10, scope: !69)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !12, line: 61, type: !25)
!75 = !DILocation(line: 61, column: 10, scope: !69)
!76 = !DILocation(line: 70, column: 16, scope: !69)
!77 = !DILocation(line: 70, column: 14, scope: !69)
!78 = !DILocation(line: 71, column: 9, scope: !69)
!79 = !DILocation(line: 71, column: 17, scope: !69)
!80 = !DILocalVariable(name: "source", scope: !81, file: !12, line: 75, type: !25)
!81 = distinct !DILexicalBlock(scope: !69, file: !12, line: 74, column: 5)
!82 = !DILocation(line: 75, column: 14, scope: !81)
!83 = !DILocation(line: 76, column: 9, scope: !81)
!84 = !DILocation(line: 77, column: 9, scope: !81)
!85 = !DILocation(line: 77, column: 23, scope: !81)
!86 = !DILocation(line: 79, column: 16, scope: !81)
!87 = !DILocation(line: 79, column: 9, scope: !81)
!88 = !DILocation(line: 80, column: 9, scope: !81)
!89 = !DILocation(line: 80, column: 21, scope: !81)
!90 = !DILocation(line: 81, column: 19, scope: !81)
!91 = !DILocation(line: 81, column: 9, scope: !81)
!92 = !DILocation(line: 83, column: 1, scope: !69)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 88, type: !16)
!95 = !DILocation(line: 88, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 89, type: !20)
!97 = !DILocation(line: 89, column: 10, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 90, type: !25)
!99 = !DILocation(line: 90, column: 10, scope: !93)
!100 = !DILocation(line: 95, column: 16, scope: !93)
!101 = !DILocation(line: 95, column: 14, scope: !93)
!102 = !DILocation(line: 96, column: 9, scope: !93)
!103 = !DILocation(line: 96, column: 17, scope: !93)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 104, type: !25)
!105 = distinct !DILexicalBlock(scope: !93, file: !12, line: 103, column: 5)
!106 = !DILocation(line: 104, column: 14, scope: !105)
!107 = !DILocation(line: 105, column: 9, scope: !105)
!108 = !DILocation(line: 106, column: 9, scope: !105)
!109 = !DILocation(line: 106, column: 23, scope: !105)
!110 = !DILocation(line: 108, column: 16, scope: !105)
!111 = !DILocation(line: 108, column: 9, scope: !105)
!112 = !DILocation(line: 109, column: 9, scope: !105)
!113 = !DILocation(line: 109, column: 21, scope: !105)
!114 = !DILocation(line: 110, column: 19, scope: !105)
!115 = !DILocation(line: 110, column: 9, scope: !105)
!116 = !DILocation(line: 112, column: 1, scope: !93)
