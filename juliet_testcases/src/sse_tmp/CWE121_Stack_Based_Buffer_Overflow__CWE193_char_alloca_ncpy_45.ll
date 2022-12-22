; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData = internal global i8* null, align 8, !dbg !10
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #6, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #6, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !64, metadata !DIExpression()), !dbg !69
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !69
  %2 = load i8*, i8** %data, align 8, !dbg !70
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !71
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !72
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !73
  %add = add i64 %call, 1, !dbg !74
  %call2 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #6, !dbg !75
  %3 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %3), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 10, align 16, !dbg !84
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = alloca i8, i64 11, align 16, !dbg !87
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !86
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %2, i8** %data, align 8, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !93
  call void @goodG2BSink(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !99
  store i8* %0, i8** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !104
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !106
  %add = add i64 %call, 1, !dbg !107
  %call2 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #6, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %3), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_badData", scope: !2, file: !12, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_goodG2BData", scope: !2, file: !12, line: 27, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_bad", scope: !12, file: !12, line: 43, type: !20, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 45, type: !6)
!23 = !DILocation(line: 45, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 46, type: !6)
!25 = !DILocation(line: 46, column: 12, scope: !19)
!26 = !DILocation(line: 46, column: 36, scope: !19)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 47, type: !6)
!28 = !DILocation(line: 47, column: 12, scope: !19)
!29 = !DILocation(line: 47, column: 37, scope: !19)
!30 = !DILocation(line: 50, column: 12, scope: !19)
!31 = !DILocation(line: 50, column: 10, scope: !19)
!32 = !DILocation(line: 51, column: 5, scope: !19)
!33 = !DILocation(line: 51, column: 13, scope: !19)
!34 = !DILocation(line: 52, column: 78, scope: !19)
!35 = !DILocation(line: 52, column: 76, scope: !19)
!36 = !DILocation(line: 53, column: 5, scope: !19)
!37 = !DILocation(line: 54, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_45_good", scope: !12, file: !12, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 88, column: 5, scope: !38)
!40 = !DILocation(line: 89, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !42, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 100, type: !44)
!47 = !DILocation(line: 100, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 100, type: !45)
!49 = !DILocation(line: 100, column: 27, scope: !41)
!50 = !DILocation(line: 103, column: 22, scope: !41)
!51 = !DILocation(line: 103, column: 12, scope: !41)
!52 = !DILocation(line: 103, column: 5, scope: !41)
!53 = !DILocation(line: 105, column: 5, scope: !41)
!54 = !DILocation(line: 106, column: 5, scope: !41)
!55 = !DILocation(line: 107, column: 5, scope: !41)
!56 = !DILocation(line: 110, column: 5, scope: !41)
!57 = !DILocation(line: 111, column: 5, scope: !41)
!58 = !DILocation(line: 112, column: 5, scope: !41)
!59 = !DILocation(line: 114, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 33, type: !6)
!62 = !DILocation(line: 33, column: 12, scope: !60)
!63 = !DILocation(line: 33, column: 19, scope: !60)
!64 = !DILocalVariable(name: "source", scope: !65, file: !12, line: 35, type: !66)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 34, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 11)
!69 = !DILocation(line: 35, column: 14, scope: !65)
!70 = !DILocation(line: 38, column: 17, scope: !65)
!71 = !DILocation(line: 38, column: 23, scope: !65)
!72 = !DILocation(line: 38, column: 38, scope: !65)
!73 = !DILocation(line: 38, column: 31, scope: !65)
!74 = !DILocation(line: 38, column: 46, scope: !65)
!75 = !DILocation(line: 38, column: 9, scope: !65)
!76 = !DILocation(line: 39, column: 19, scope: !65)
!77 = !DILocation(line: 39, column: 9, scope: !65)
!78 = !DILocation(line: 41, column: 1, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 73, type: !20, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 75, type: !6)
!81 = !DILocation(line: 75, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 76, type: !6)
!83 = !DILocation(line: 76, column: 12, scope: !79)
!84 = !DILocation(line: 76, column: 36, scope: !79)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 77, type: !6)
!86 = !DILocation(line: 77, column: 12, scope: !79)
!87 = !DILocation(line: 77, column: 37, scope: !79)
!88 = !DILocation(line: 80, column: 12, scope: !79)
!89 = !DILocation(line: 80, column: 10, scope: !79)
!90 = !DILocation(line: 81, column: 5, scope: !79)
!91 = !DILocation(line: 81, column: 13, scope: !79)
!92 = !DILocation(line: 82, column: 82, scope: !79)
!93 = !DILocation(line: 82, column: 80, scope: !79)
!94 = !DILocation(line: 83, column: 5, scope: !79)
!95 = !DILocation(line: 84, column: 1, scope: !79)
!96 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 63, type: !6)
!98 = !DILocation(line: 63, column: 12, scope: !96)
!99 = !DILocation(line: 63, column: 19, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 65, type: !66)
!101 = distinct !DILexicalBlock(scope: !96, file: !12, line: 64, column: 5)
!102 = !DILocation(line: 65, column: 14, scope: !101)
!103 = !DILocation(line: 68, column: 17, scope: !101)
!104 = !DILocation(line: 68, column: 23, scope: !101)
!105 = !DILocation(line: 68, column: 38, scope: !101)
!106 = !DILocation(line: 68, column: 31, scope: !101)
!107 = !DILocation(line: 68, column: 46, scope: !101)
!108 = !DILocation(line: 68, column: 9, scope: !101)
!109 = !DILocation(line: 69, column: 19, scope: !101)
!110 = !DILocation(line: 69, column: 9, scope: !101)
!111 = !DILocation(line: 71, column: 1, scope: !96)
