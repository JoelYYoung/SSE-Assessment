; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 11, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  %2 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %2, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %3, i8** %data, align 8, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i8* @strcpy(i8* %6, i8* %arraydecay) #5, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

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
  %2 = load i32, i32* @staticFive, align 4, !dbg !82
  %cmp = icmp ne i32 %2, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  store i8* %3, i8** %data, align 8, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !96
  %6 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !98
  %call = call i8* @strcpy(i8* %6, i8* %arraydecay) #5, !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %7), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 10, align 16, !dbg !108
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %1 = alloca i8, i64 11, align 16, !dbg !111
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !110
  %2 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %2, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %3, i8** %data, align 8, !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !124
  %6 = load i8*, i8** %data, align 8, !dbg !125
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !126
  %call = call i8* @strcpy(i8* %6, i8* %arraydecay) #5, !dbg !127
  %7 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %7), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_bad", scope: !10, file: !10, line: 34, type: !19, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 36, type: !6)
!22 = !DILocation(line: 36, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 37, type: !6)
!24 = !DILocation(line: 37, column: 12, scope: !18)
!25 = !DILocation(line: 37, column: 36, scope: !18)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 38, type: !6)
!27 = !DILocation(line: 38, column: 12, scope: !18)
!28 = !DILocation(line: 38, column: 37, scope: !18)
!29 = !DILocation(line: 39, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 8)
!31 = !DILocation(line: 39, column: 18, scope: !30)
!32 = !DILocation(line: 39, column: 8, scope: !18)
!33 = !DILocation(line: 43, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 40, column: 5)
!35 = !DILocation(line: 43, column: 14, scope: !34)
!36 = !DILocation(line: 44, column: 9, scope: !34)
!37 = !DILocation(line: 44, column: 17, scope: !34)
!38 = !DILocation(line: 45, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 47, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 46, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 47, column: 14, scope: !40)
!45 = !DILocation(line: 49, column: 16, scope: !40)
!46 = !DILocation(line: 49, column: 22, scope: !40)
!47 = !DILocation(line: 49, column: 9, scope: !40)
!48 = !DILocation(line: 50, column: 19, scope: !40)
!49 = !DILocation(line: 50, column: 9, scope: !40)
!50 = !DILocation(line: 52, column: 1, scope: !18)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_07_good", scope: !10, file: !10, line: 105, type: !19, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 107, column: 5, scope: !51)
!53 = !DILocation(line: 108, column: 5, scope: !51)
!54 = !DILocation(line: 109, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 121, type: !56, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!11, !11, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !10, line: 121, type: !11)
!60 = !DILocation(line: 121, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !10, line: 121, type: !58)
!62 = !DILocation(line: 121, column: 27, scope: !55)
!63 = !DILocation(line: 124, column: 22, scope: !55)
!64 = !DILocation(line: 124, column: 12, scope: !55)
!65 = !DILocation(line: 124, column: 5, scope: !55)
!66 = !DILocation(line: 126, column: 5, scope: !55)
!67 = !DILocation(line: 127, column: 5, scope: !55)
!68 = !DILocation(line: 128, column: 5, scope: !55)
!69 = !DILocation(line: 131, column: 5, scope: !55)
!70 = !DILocation(line: 132, column: 5, scope: !55)
!71 = !DILocation(line: 133, column: 5, scope: !55)
!72 = !DILocation(line: 135, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !10, line: 61, type: !6)
!75 = !DILocation(line: 61, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !10, line: 62, type: !6)
!77 = !DILocation(line: 62, column: 12, scope: !73)
!78 = !DILocation(line: 62, column: 36, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !10, line: 63, type: !6)
!80 = !DILocation(line: 63, column: 12, scope: !73)
!81 = !DILocation(line: 63, column: 37, scope: !73)
!82 = !DILocation(line: 64, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !10, line: 64, column: 8)
!84 = !DILocation(line: 64, column: 18, scope: !83)
!85 = !DILocation(line: 64, column: 8, scope: !73)
!86 = !DILocation(line: 67, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !10, line: 65, column: 5)
!88 = !DILocation(line: 68, column: 5, scope: !87)
!89 = !DILocation(line: 73, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !10, line: 70, column: 5)
!91 = !DILocation(line: 73, column: 14, scope: !90)
!92 = !DILocation(line: 74, column: 9, scope: !90)
!93 = !DILocation(line: 74, column: 17, scope: !90)
!94 = !DILocalVariable(name: "source", scope: !95, file: !10, line: 77, type: !41)
!95 = distinct !DILexicalBlock(scope: !73, file: !10, line: 76, column: 5)
!96 = !DILocation(line: 77, column: 14, scope: !95)
!97 = !DILocation(line: 79, column: 16, scope: !95)
!98 = !DILocation(line: 79, column: 22, scope: !95)
!99 = !DILocation(line: 79, column: 9, scope: !95)
!100 = !DILocation(line: 80, column: 19, scope: !95)
!101 = !DILocation(line: 80, column: 9, scope: !95)
!102 = !DILocation(line: 82, column: 1, scope: !73)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 87, type: !6)
!105 = !DILocation(line: 87, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !10, line: 88, type: !6)
!107 = !DILocation(line: 88, column: 12, scope: !103)
!108 = !DILocation(line: 88, column: 36, scope: !103)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !10, line: 89, type: !6)
!110 = !DILocation(line: 89, column: 12, scope: !103)
!111 = !DILocation(line: 89, column: 37, scope: !103)
!112 = !DILocation(line: 90, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !103, file: !10, line: 90, column: 8)
!114 = !DILocation(line: 90, column: 18, scope: !113)
!115 = !DILocation(line: 90, column: 8, scope: !103)
!116 = !DILocation(line: 94, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !10, line: 91, column: 5)
!118 = !DILocation(line: 94, column: 14, scope: !117)
!119 = !DILocation(line: 95, column: 9, scope: !117)
!120 = !DILocation(line: 95, column: 17, scope: !117)
!121 = !DILocation(line: 96, column: 5, scope: !117)
!122 = !DILocalVariable(name: "source", scope: !123, file: !10, line: 98, type: !41)
!123 = distinct !DILexicalBlock(scope: !103, file: !10, line: 97, column: 5)
!124 = !DILocation(line: 98, column: 14, scope: !123)
!125 = !DILocation(line: 100, column: 16, scope: !123)
!126 = !DILocation(line: 100, column: 22, scope: !123)
!127 = !DILocation(line: 100, column: 9, scope: !123)
!128 = !DILocation(line: 101, column: 19, scope: !123)
!129 = !DILocation(line: 101, column: 9, scope: !123)
!130 = !DILocation(line: 103, column: 1, scope: !103)
