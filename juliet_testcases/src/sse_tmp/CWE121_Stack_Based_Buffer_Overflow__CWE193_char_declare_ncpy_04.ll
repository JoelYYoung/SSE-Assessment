; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !39
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !40
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !41
  %add = add i64 %call, 1, !dbg !42
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay1, i64 %add) #7, !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %3), !dbg !45
  ret void, !dbg !46
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #7, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #7, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !77
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !87
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !88
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !89
  %add = add i64 %call, 1, !dbg !90
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay1, i64 %add) #7, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* %3), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay, i8** %data, align 8, !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !114
  %add = add i64 %call, 1, !dbg !115
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay1, i64 %add) #7, !dbg !116
  %3 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* %3), !dbg !118
  ret void, !dbg !119
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 37, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 38, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 39, column: 10, scope: !11)
!29 = !DILocation(line: 44, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 41, column: 5)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!32 = !DILocation(line: 44, column: 14, scope: !30)
!33 = !DILocation(line: 45, column: 9, scope: !30)
!34 = !DILocation(line: 45, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 48, type: !25)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 5)
!37 = !DILocation(line: 48, column: 14, scope: !36)
!38 = !DILocation(line: 51, column: 17, scope: !36)
!39 = !DILocation(line: 51, column: 23, scope: !36)
!40 = !DILocation(line: 51, column: 38, scope: !36)
!41 = !DILocation(line: 51, column: 31, scope: !36)
!42 = !DILocation(line: 51, column: 46, scope: !36)
!43 = !DILocation(line: 51, column: 9, scope: !36)
!44 = !DILocation(line: 52, column: 19, scope: !36)
!45 = !DILocation(line: 52, column: 9, scope: !36)
!46 = !DILocation(line: 54, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_04_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 111, column: 5, scope: !47)
!49 = !DILocation(line: 112, column: 5, scope: !47)
!50 = !DILocation(line: 113, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !52, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 125, type: !54)
!57 = !DILocation(line: 125, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 125, type: !55)
!59 = !DILocation(line: 125, column: 27, scope: !51)
!60 = !DILocation(line: 128, column: 22, scope: !51)
!61 = !DILocation(line: 128, column: 12, scope: !51)
!62 = !DILocation(line: 128, column: 5, scope: !51)
!63 = !DILocation(line: 130, column: 5, scope: !51)
!64 = !DILocation(line: 131, column: 5, scope: !51)
!65 = !DILocation(line: 132, column: 5, scope: !51)
!66 = !DILocation(line: 135, column: 5, scope: !51)
!67 = !DILocation(line: 136, column: 5, scope: !51)
!68 = !DILocation(line: 137, column: 5, scope: !51)
!69 = !DILocation(line: 139, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 63, type: !16)
!72 = !DILocation(line: 63, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 64, type: !20)
!74 = !DILocation(line: 64, column: 10, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 65, type: !25)
!76 = !DILocation(line: 65, column: 10, scope: !70)
!77 = !DILocation(line: 75, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !12, line: 72, column: 5)
!79 = distinct !DILexicalBlock(scope: !70, file: !12, line: 66, column: 8)
!80 = !DILocation(line: 75, column: 14, scope: !78)
!81 = !DILocation(line: 76, column: 9, scope: !78)
!82 = !DILocation(line: 76, column: 17, scope: !78)
!83 = !DILocalVariable(name: "source", scope: !84, file: !12, line: 79, type: !25)
!84 = distinct !DILexicalBlock(scope: !70, file: !12, line: 78, column: 5)
!85 = !DILocation(line: 79, column: 14, scope: !84)
!86 = !DILocation(line: 82, column: 17, scope: !84)
!87 = !DILocation(line: 82, column: 23, scope: !84)
!88 = !DILocation(line: 82, column: 38, scope: !84)
!89 = !DILocation(line: 82, column: 31, scope: !84)
!90 = !DILocation(line: 82, column: 46, scope: !84)
!91 = !DILocation(line: 82, column: 9, scope: !84)
!92 = !DILocation(line: 83, column: 19, scope: !84)
!93 = !DILocation(line: 83, column: 9, scope: !84)
!94 = !DILocation(line: 85, column: 1, scope: !70)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 90, type: !16)
!97 = !DILocation(line: 90, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 91, type: !20)
!99 = !DILocation(line: 91, column: 10, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 92, type: !25)
!101 = !DILocation(line: 92, column: 10, scope: !95)
!102 = !DILocation(line: 97, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !12, line: 94, column: 5)
!104 = distinct !DILexicalBlock(scope: !95, file: !12, line: 93, column: 8)
!105 = !DILocation(line: 97, column: 14, scope: !103)
!106 = !DILocation(line: 98, column: 9, scope: !103)
!107 = !DILocation(line: 98, column: 17, scope: !103)
!108 = !DILocalVariable(name: "source", scope: !109, file: !12, line: 101, type: !25)
!109 = distinct !DILexicalBlock(scope: !95, file: !12, line: 100, column: 5)
!110 = !DILocation(line: 101, column: 14, scope: !109)
!111 = !DILocation(line: 104, column: 17, scope: !109)
!112 = !DILocation(line: 104, column: 23, scope: !109)
!113 = !DILocation(line: 104, column: 38, scope: !109)
!114 = !DILocation(line: 104, column: 31, scope: !109)
!115 = !DILocation(line: 104, column: 46, scope: !109)
!116 = !DILocation(line: 104, column: 9, scope: !109)
!117 = !DILocation(line: 105, column: 19, scope: !109)
!118 = !DILocation(line: 105, column: 9, scope: !109)
!119 = !DILocation(line: 107, column: 1, scope: !95)
