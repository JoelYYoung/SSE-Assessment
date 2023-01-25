; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  %5 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %call1 = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %6), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_good() #0 !dbg !46 {
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
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !69 {
entry:
  ret i32 1, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 10, align 16, !dbg !78
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %1 = alloca i8, i64 11, align 16, !dbg !81
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !80
  %call = call i32 @staticReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %2, i8** %data, align 8, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !97
  %call1 = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !98
  %6 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* %6), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !102 {
entry:
  ret i32 0, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 10, align 16, !dbg !109
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %1 = alloca i8, i64 11, align 16, !dbg !112
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !111
  %call = call i32 @staticReturnsTrue(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %2, i8** %data, align 8, !dbg !118
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !124
  %5 = load i8*, i8** %data, align 8, !dbg !125
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !126
  %call1 = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %6), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad", scope: !14, file: !14, line: 42, type: !15, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 44, type: !4)
!18 = !DILocation(line: 44, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 45, type: !4)
!20 = !DILocation(line: 45, column: 12, scope: !13)
!21 = !DILocation(line: 45, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 46, type: !4)
!23 = !DILocation(line: 46, column: 12, scope: !13)
!24 = !DILocation(line: 46, column: 37, scope: !13)
!25 = !DILocation(line: 47, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 47, column: 8)
!27 = !DILocation(line: 47, column: 8, scope: !13)
!28 = !DILocation(line: 51, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 48, column: 5)
!30 = !DILocation(line: 51, column: 14, scope: !29)
!31 = !DILocation(line: 52, column: 9, scope: !29)
!32 = !DILocation(line: 52, column: 17, scope: !29)
!33 = !DILocation(line: 53, column: 5, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 55, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 54, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 55, column: 14, scope: !35)
!40 = !DILocation(line: 57, column: 16, scope: !35)
!41 = !DILocation(line: 57, column: 22, scope: !35)
!42 = !DILocation(line: 57, column: 9, scope: !35)
!43 = !DILocation(line: 58, column: 19, scope: !35)
!44 = !DILocation(line: 58, column: 9, scope: !35)
!45 = !DILocation(line: 60, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_good", scope: !14, file: !14, line: 113, type: !15, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 115, column: 5, scope: !46)
!48 = !DILocation(line: 116, column: 5, scope: !46)
!49 = !DILocation(line: 117, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 129, type: !51, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 129, type: !53)
!56 = !DILocation(line: 129, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 129, type: !54)
!58 = !DILocation(line: 129, column: 27, scope: !50)
!59 = !DILocation(line: 132, column: 22, scope: !50)
!60 = !DILocation(line: 132, column: 12, scope: !50)
!61 = !DILocation(line: 132, column: 5, scope: !50)
!62 = !DILocation(line: 134, column: 5, scope: !50)
!63 = !DILocation(line: 135, column: 5, scope: !50)
!64 = !DILocation(line: 136, column: 5, scope: !50)
!65 = !DILocation(line: 139, column: 5, scope: !50)
!66 = !DILocation(line: 140, column: 5, scope: !50)
!67 = !DILocation(line: 141, column: 5, scope: !50)
!68 = !DILocation(line: 143, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 30, type: !70, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!53}
!72 = !DILocation(line: 32, column: 5, scope: !69)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 69, type: !4)
!75 = !DILocation(line: 69, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !14, line: 70, type: !4)
!77 = !DILocation(line: 70, column: 12, scope: !73)
!78 = !DILocation(line: 70, column: 36, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !14, line: 71, type: !4)
!80 = !DILocation(line: 71, column: 12, scope: !73)
!81 = !DILocation(line: 71, column: 37, scope: !73)
!82 = !DILocation(line: 72, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !14, line: 72, column: 8)
!84 = !DILocation(line: 72, column: 8, scope: !73)
!85 = !DILocation(line: 75, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 73, column: 5)
!87 = !DILocation(line: 76, column: 5, scope: !86)
!88 = !DILocation(line: 81, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !14, line: 78, column: 5)
!90 = !DILocation(line: 81, column: 14, scope: !89)
!91 = !DILocation(line: 82, column: 9, scope: !89)
!92 = !DILocation(line: 82, column: 17, scope: !89)
!93 = !DILocalVariable(name: "source", scope: !94, file: !14, line: 85, type: !36)
!94 = distinct !DILexicalBlock(scope: !73, file: !14, line: 84, column: 5)
!95 = !DILocation(line: 85, column: 14, scope: !94)
!96 = !DILocation(line: 87, column: 16, scope: !94)
!97 = !DILocation(line: 87, column: 22, scope: !94)
!98 = !DILocation(line: 87, column: 9, scope: !94)
!99 = !DILocation(line: 88, column: 19, scope: !94)
!100 = !DILocation(line: 88, column: 9, scope: !94)
!101 = !DILocation(line: 90, column: 1, scope: !73)
!102 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 35, type: !70, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocation(line: 37, column: 5, scope: !102)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 95, type: !4)
!106 = !DILocation(line: 95, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !14, line: 96, type: !4)
!108 = !DILocation(line: 96, column: 12, scope: !104)
!109 = !DILocation(line: 96, column: 36, scope: !104)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !14, line: 97, type: !4)
!111 = !DILocation(line: 97, column: 12, scope: !104)
!112 = !DILocation(line: 97, column: 37, scope: !104)
!113 = !DILocation(line: 98, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !14, line: 98, column: 8)
!115 = !DILocation(line: 98, column: 8, scope: !104)
!116 = !DILocation(line: 102, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !14, line: 99, column: 5)
!118 = !DILocation(line: 102, column: 14, scope: !117)
!119 = !DILocation(line: 103, column: 9, scope: !117)
!120 = !DILocation(line: 103, column: 17, scope: !117)
!121 = !DILocation(line: 104, column: 5, scope: !117)
!122 = !DILocalVariable(name: "source", scope: !123, file: !14, line: 106, type: !36)
!123 = distinct !DILexicalBlock(scope: !104, file: !14, line: 105, column: 5)
!124 = !DILocation(line: 106, column: 14, scope: !123)
!125 = !DILocation(line: 108, column: 16, scope: !123)
!126 = !DILocation(line: 108, column: 22, scope: !123)
!127 = !DILocation(line: 108, column: 9, scope: !123)
!128 = !DILocation(line: 109, column: 19, scope: !123)
!129 = !DILocation(line: 109, column: 9, scope: !123)
!130 = !DILocation(line: 111, column: 1, scope: !104)
