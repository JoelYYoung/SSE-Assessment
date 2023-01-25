; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 50, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 100, align 16, !dbg !28
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay2) #5, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %6), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 50, align 16, !dbg !81
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %1 = alloca i8, i64 100, align 16, !dbg !84
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !83
  %2 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp ne i32 %2, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  store i8* %3, i8** %data, align 8, !dbg !94
  %4 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %5 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay2) #5, !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %6), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 50, align 16, !dbg !114
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %1 = alloca i8, i64 100, align 16, !dbg !117
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !116
  %2 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp = icmp eq i32 %2, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  store i8* %3, i8** %data, align 8, !dbg !124
  %4 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx1, align 1, !dbg !133
  %5 = load i8*, i8** %data, align 8, !dbg !134
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay2) #5, !dbg !136
  %6 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %6), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 31, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07_bad", scope: !10, file: !10, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 37, type: !6)
!22 = !DILocation(line: 37, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 38, type: !6)
!24 = !DILocation(line: 38, column: 12, scope: !18)
!25 = !DILocation(line: 38, column: 36, scope: !18)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 12, scope: !18)
!28 = !DILocation(line: 39, column: 37, scope: !18)
!29 = !DILocation(line: 40, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 8)
!31 = !DILocation(line: 40, column: 18, scope: !30)
!32 = !DILocation(line: 40, column: 8, scope: !18)
!33 = !DILocation(line: 44, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 41, column: 5)
!35 = !DILocation(line: 44, column: 14, scope: !34)
!36 = !DILocation(line: 45, column: 9, scope: !34)
!37 = !DILocation(line: 45, column: 17, scope: !34)
!38 = !DILocation(line: 46, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 48, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 47, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 48, column: 14, scope: !40)
!45 = !DILocation(line: 49, column: 9, scope: !40)
!46 = !DILocation(line: 50, column: 9, scope: !40)
!47 = !DILocation(line: 50, column: 23, scope: !40)
!48 = !DILocation(line: 52, column: 18, scope: !40)
!49 = !DILocation(line: 52, column: 35, scope: !40)
!50 = !DILocation(line: 52, column: 9, scope: !40)
!51 = !DILocation(line: 53, column: 19, scope: !40)
!52 = !DILocation(line: 53, column: 9, scope: !40)
!53 = !DILocation(line: 55, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_snprintf_07_good", scope: !10, file: !10, line: 110, type: !19, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 112, column: 5, scope: !54)
!56 = !DILocation(line: 113, column: 5, scope: !54)
!57 = !DILocation(line: 114, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 126, type: !59, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !10, line: 126, type: !11)
!63 = !DILocation(line: 126, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !10, line: 126, type: !61)
!65 = !DILocation(line: 126, column: 27, scope: !58)
!66 = !DILocation(line: 129, column: 22, scope: !58)
!67 = !DILocation(line: 129, column: 12, scope: !58)
!68 = !DILocation(line: 129, column: 5, scope: !58)
!69 = !DILocation(line: 131, column: 5, scope: !58)
!70 = !DILocation(line: 132, column: 5, scope: !58)
!71 = !DILocation(line: 133, column: 5, scope: !58)
!72 = !DILocation(line: 136, column: 5, scope: !58)
!73 = !DILocation(line: 137, column: 5, scope: !58)
!74 = !DILocation(line: 138, column: 5, scope: !58)
!75 = !DILocation(line: 140, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 64, type: !6)
!78 = !DILocation(line: 64, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !10, line: 65, type: !6)
!80 = !DILocation(line: 65, column: 12, scope: !76)
!81 = !DILocation(line: 65, column: 36, scope: !76)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !10, line: 66, type: !6)
!83 = !DILocation(line: 66, column: 12, scope: !76)
!84 = !DILocation(line: 66, column: 37, scope: !76)
!85 = !DILocation(line: 67, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !10, line: 67, column: 8)
!87 = !DILocation(line: 67, column: 18, scope: !86)
!88 = !DILocation(line: 67, column: 8, scope: !76)
!89 = !DILocation(line: 70, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !10, line: 68, column: 5)
!91 = !DILocation(line: 71, column: 5, scope: !90)
!92 = !DILocation(line: 75, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !10, line: 73, column: 5)
!94 = !DILocation(line: 75, column: 14, scope: !93)
!95 = !DILocation(line: 76, column: 9, scope: !93)
!96 = !DILocation(line: 76, column: 17, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !10, line: 79, type: !41)
!98 = distinct !DILexicalBlock(scope: !76, file: !10, line: 78, column: 5)
!99 = !DILocation(line: 79, column: 14, scope: !98)
!100 = !DILocation(line: 80, column: 9, scope: !98)
!101 = !DILocation(line: 81, column: 9, scope: !98)
!102 = !DILocation(line: 81, column: 23, scope: !98)
!103 = !DILocation(line: 83, column: 18, scope: !98)
!104 = !DILocation(line: 83, column: 35, scope: !98)
!105 = !DILocation(line: 83, column: 9, scope: !98)
!106 = !DILocation(line: 84, column: 19, scope: !98)
!107 = !DILocation(line: 84, column: 9, scope: !98)
!108 = !DILocation(line: 86, column: 1, scope: !76)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 89, type: !19, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !10, line: 91, type: !6)
!111 = !DILocation(line: 91, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !10, line: 92, type: !6)
!113 = !DILocation(line: 92, column: 12, scope: !109)
!114 = !DILocation(line: 92, column: 36, scope: !109)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !10, line: 93, type: !6)
!116 = !DILocation(line: 93, column: 12, scope: !109)
!117 = !DILocation(line: 93, column: 37, scope: !109)
!118 = !DILocation(line: 94, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !10, line: 94, column: 8)
!120 = !DILocation(line: 94, column: 18, scope: !119)
!121 = !DILocation(line: 94, column: 8, scope: !109)
!122 = !DILocation(line: 97, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !10, line: 95, column: 5)
!124 = !DILocation(line: 97, column: 14, scope: !123)
!125 = !DILocation(line: 98, column: 9, scope: !123)
!126 = !DILocation(line: 98, column: 17, scope: !123)
!127 = !DILocation(line: 99, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !10, line: 101, type: !41)
!129 = distinct !DILexicalBlock(scope: !109, file: !10, line: 100, column: 5)
!130 = !DILocation(line: 101, column: 14, scope: !129)
!131 = !DILocation(line: 102, column: 9, scope: !129)
!132 = !DILocation(line: 103, column: 9, scope: !129)
!133 = !DILocation(line: 103, column: 23, scope: !129)
!134 = !DILocation(line: 105, column: 18, scope: !129)
!135 = !DILocation(line: 105, column: 35, scope: !129)
!136 = !DILocation(line: 105, column: 9, scope: !129)
!137 = !DILocation(line: 106, column: 19, scope: !129)
!138 = !DILocation(line: 106, column: 9, scope: !129)
!139 = !DILocation(line: 108, column: 1, scope: !109)
