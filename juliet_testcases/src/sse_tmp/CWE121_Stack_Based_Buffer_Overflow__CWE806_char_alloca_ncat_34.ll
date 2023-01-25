; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %0, i8** %dataBuffer, align 8, !dbg !27
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  store i8* %1, i8** %data, align 8, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType* %myUnion to i8**, !dbg !36
  store i8* %4, i8** %unionFirst, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType* %myUnion to i8**, !dbg !41
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !41
  store i8* %5, i8** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %7 = load i8*, i8** %data1, align 8, !dbg !49
  %8 = load i8*, i8** %data1, align 8, !dbg !50
  %call = call i64 @strlen(i8* %8) #6, !dbg !51
  %call2 = call i8* @strncat(i8* %arraydecay, i8* %7, i64 %call) #7, !dbg !52
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !53
  store i8 0, i8* %arrayidx3, align 1, !dbg !54
  %9 = load i8*, i8** %data1, align 8, !dbg !55
  call void @printLine(i8* %9), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_good() #0 !dbg !58 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %0, i8** %dataBuffer, align 8, !dbg !86
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  store i8* %1, i8** %data, align 8, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType* %myUnion to i8**, !dbg !95
  store i8* %4, i8** %unionFirst, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType* %myUnion to i8**, !dbg !100
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !100
  store i8* %5, i8** %data1, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !104
  %7 = load i8*, i8** %data1, align 8, !dbg !105
  %8 = load i8*, i8** %data1, align 8, !dbg !106
  %call = call i64 @strlen(i8* %8) #6, !dbg !107
  %call2 = call i8* @strncat(i8* %arraydecay, i8* %7, i64 %call) #7, !dbg !108
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !109
  store i8 0, i8* %arrayidx3, align 1, !dbg !110
  %9 = load i8*, i8** %data1, align 8, !dbg !111
  call void @printLine(i8* %9), !dbg !112
  ret void, !dbg !113
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_unionType", file: !14, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 23, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 24, baseType: !4, size: 64)
!25 = !DILocation(line: 32, column: 78, scope: !13)
!26 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 33, scope: !13)
!29 = !DILocation(line: 34, column: 12, scope: !13)
!30 = !DILocation(line: 34, column: 10, scope: !13)
!31 = !DILocation(line: 36, column: 12, scope: !13)
!32 = !DILocation(line: 36, column: 5, scope: !13)
!33 = !DILocation(line: 37, column: 5, scope: !13)
!34 = !DILocation(line: 37, column: 17, scope: !13)
!35 = !DILocation(line: 38, column: 26, scope: !13)
!36 = !DILocation(line: 38, column: 13, scope: !13)
!37 = !DILocation(line: 38, column: 24, scope: !13)
!38 = !DILocalVariable(name: "data", scope: !39, file: !14, line: 40, type: !4)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!40 = !DILocation(line: 40, column: 16, scope: !39)
!41 = !DILocation(line: 40, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !14, line: 41, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 42, column: 18, scope: !43)
!48 = !DILocation(line: 44, column: 21, scope: !43)
!49 = !DILocation(line: 44, column: 27, scope: !43)
!50 = !DILocation(line: 44, column: 40, scope: !43)
!51 = !DILocation(line: 44, column: 33, scope: !43)
!52 = !DILocation(line: 44, column: 13, scope: !43)
!53 = !DILocation(line: 45, column: 13, scope: !43)
!54 = !DILocation(line: 45, column: 24, scope: !43)
!55 = !DILocation(line: 46, column: 23, scope: !43)
!56 = !DILocation(line: 46, column: 13, scope: !43)
!57 = !DILocation(line: 49, column: 1, scope: !13)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_34_good", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 80, column: 5, scope: !58)
!60 = !DILocation(line: 81, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !62, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !14, line: 92, type: !64)
!67 = !DILocation(line: 92, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !14, line: 92, type: !65)
!69 = !DILocation(line: 92, column: 27, scope: !61)
!70 = !DILocation(line: 95, column: 22, scope: !61)
!71 = !DILocation(line: 95, column: 12, scope: !61)
!72 = !DILocation(line: 95, column: 5, scope: !61)
!73 = !DILocation(line: 97, column: 5, scope: !61)
!74 = !DILocation(line: 98, column: 5, scope: !61)
!75 = !DILocation(line: 99, column: 5, scope: !61)
!76 = !DILocation(line: 102, column: 5, scope: !61)
!77 = !DILocation(line: 103, column: 5, scope: !61)
!78 = !DILocation(line: 104, column: 5, scope: !61)
!79 = !DILocation(line: 106, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !14, line: 58, type: !4)
!82 = !DILocation(line: 58, column: 12, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !14, line: 59, type: !20)
!84 = !DILocation(line: 59, column: 78, scope: !80)
!85 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !14, line: 60, type: !4)
!86 = !DILocation(line: 60, column: 12, scope: !80)
!87 = !DILocation(line: 60, column: 33, scope: !80)
!88 = !DILocation(line: 61, column: 12, scope: !80)
!89 = !DILocation(line: 61, column: 10, scope: !80)
!90 = !DILocation(line: 63, column: 12, scope: !80)
!91 = !DILocation(line: 63, column: 5, scope: !80)
!92 = !DILocation(line: 64, column: 5, scope: !80)
!93 = !DILocation(line: 64, column: 16, scope: !80)
!94 = !DILocation(line: 65, column: 26, scope: !80)
!95 = !DILocation(line: 65, column: 13, scope: !80)
!96 = !DILocation(line: 65, column: 24, scope: !80)
!97 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 67, type: !4)
!98 = distinct !DILexicalBlock(scope: !80, file: !14, line: 66, column: 5)
!99 = !DILocation(line: 67, column: 16, scope: !98)
!100 = !DILocation(line: 67, column: 31, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !14, line: 69, type: !44)
!102 = distinct !DILexicalBlock(scope: !98, file: !14, line: 68, column: 9)
!103 = !DILocation(line: 69, column: 18, scope: !102)
!104 = !DILocation(line: 71, column: 21, scope: !102)
!105 = !DILocation(line: 71, column: 27, scope: !102)
!106 = !DILocation(line: 71, column: 40, scope: !102)
!107 = !DILocation(line: 71, column: 33, scope: !102)
!108 = !DILocation(line: 71, column: 13, scope: !102)
!109 = !DILocation(line: 72, column: 13, scope: !102)
!110 = !DILocation(line: 72, column: 24, scope: !102)
!111 = !DILocation(line: 73, column: 23, scope: !102)
!112 = !DILocation(line: 73, column: 13, scope: !102)
!113 = !DILocation(line: 76, column: 1, scope: !80)
