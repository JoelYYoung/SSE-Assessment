; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 11, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call = call i8* @strcpy(i8* %6, i8* %arraydecay) #5, !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %7), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 10, align 16, !dbg !79
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %1 = alloca i8, i64 11, align 16, !dbg !82
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !81
  %2 = load i32, i32* @staticFalse, align 4, !dbg !83
  %tobool = icmp ne i32 %2, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

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
  %2 = load i32, i32* @staticTrue, align 4, !dbg !112
  %tobool = icmp ne i32 %2, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !115
  store i8* %3, i8** %data, align 8, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !123
  %6 = load i8*, i8** %data, align 8, !dbg !124
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !125
  %call = call i8* @strcpy(i8* %6, i8* %arraydecay) #5, !dbg !126
  %7 = load i8*, i8** %data, align 8, !dbg !127
  call void @printLine(i8* %7), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 30, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 31, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad", scope: !12, file: !12, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 37, type: !6)
!24 = !DILocation(line: 37, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 38, type: !6)
!26 = !DILocation(line: 38, column: 12, scope: !20)
!27 = !DILocation(line: 38, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 39, type: !6)
!29 = !DILocation(line: 39, column: 12, scope: !20)
!30 = !DILocation(line: 39, column: 37, scope: !20)
!31 = !DILocation(line: 40, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !12, line: 40, column: 8)
!33 = !DILocation(line: 40, column: 8, scope: !20)
!34 = !DILocation(line: 44, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 41, column: 5)
!36 = !DILocation(line: 44, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 9, scope: !35)
!38 = !DILocation(line: 45, column: 17, scope: !35)
!39 = !DILocation(line: 46, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 48, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 47, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 48, column: 14, scope: !41)
!46 = !DILocation(line: 50, column: 16, scope: !41)
!47 = !DILocation(line: 50, column: 22, scope: !41)
!48 = !DILocation(line: 50, column: 9, scope: !41)
!49 = !DILocation(line: 51, column: 19, scope: !41)
!50 = !DILocation(line: 51, column: 9, scope: !41)
!51 = !DILocation(line: 53, column: 1, scope: !20)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_good", scope: !12, file: !12, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 108, column: 5, scope: !52)
!54 = !DILocation(line: 109, column: 5, scope: !52)
!55 = !DILocation(line: 110, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 122, type: !57, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!13, !13, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 122, type: !13)
!61 = !DILocation(line: 122, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 122, type: !59)
!63 = !DILocation(line: 122, column: 27, scope: !56)
!64 = !DILocation(line: 125, column: 22, scope: !56)
!65 = !DILocation(line: 125, column: 12, scope: !56)
!66 = !DILocation(line: 125, column: 5, scope: !56)
!67 = !DILocation(line: 127, column: 5, scope: !56)
!68 = !DILocation(line: 128, column: 5, scope: !56)
!69 = !DILocation(line: 129, column: 5, scope: !56)
!70 = !DILocation(line: 132, column: 5, scope: !56)
!71 = !DILocation(line: 133, column: 5, scope: !56)
!72 = !DILocation(line: 134, column: 5, scope: !56)
!73 = !DILocation(line: 136, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 62, type: !6)
!76 = !DILocation(line: 62, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 63, type: !6)
!78 = !DILocation(line: 63, column: 12, scope: !74)
!79 = !DILocation(line: 63, column: 36, scope: !74)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 64, type: !6)
!81 = !DILocation(line: 64, column: 12, scope: !74)
!82 = !DILocation(line: 64, column: 37, scope: !74)
!83 = !DILocation(line: 65, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !12, line: 65, column: 8)
!85 = !DILocation(line: 65, column: 8, scope: !74)
!86 = !DILocation(line: 68, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 66, column: 5)
!88 = !DILocation(line: 69, column: 5, scope: !87)
!89 = !DILocation(line: 74, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !12, line: 71, column: 5)
!91 = !DILocation(line: 74, column: 14, scope: !90)
!92 = !DILocation(line: 75, column: 9, scope: !90)
!93 = !DILocation(line: 75, column: 17, scope: !90)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 78, type: !42)
!95 = distinct !DILexicalBlock(scope: !74, file: !12, line: 77, column: 5)
!96 = !DILocation(line: 78, column: 14, scope: !95)
!97 = !DILocation(line: 80, column: 16, scope: !95)
!98 = !DILocation(line: 80, column: 22, scope: !95)
!99 = !DILocation(line: 80, column: 9, scope: !95)
!100 = !DILocation(line: 81, column: 19, scope: !95)
!101 = !DILocation(line: 81, column: 9, scope: !95)
!102 = !DILocation(line: 83, column: 1, scope: !74)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 88, type: !6)
!105 = !DILocation(line: 88, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 89, type: !6)
!107 = !DILocation(line: 89, column: 12, scope: !103)
!108 = !DILocation(line: 89, column: 36, scope: !103)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 90, type: !6)
!110 = !DILocation(line: 90, column: 12, scope: !103)
!111 = !DILocation(line: 90, column: 37, scope: !103)
!112 = !DILocation(line: 91, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !103, file: !12, line: 91, column: 8)
!114 = !DILocation(line: 91, column: 8, scope: !103)
!115 = !DILocation(line: 95, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 92, column: 5)
!117 = !DILocation(line: 95, column: 14, scope: !116)
!118 = !DILocation(line: 96, column: 9, scope: !116)
!119 = !DILocation(line: 96, column: 17, scope: !116)
!120 = !DILocation(line: 97, column: 5, scope: !116)
!121 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 99, type: !42)
!122 = distinct !DILexicalBlock(scope: !103, file: !12, line: 98, column: 5)
!123 = !DILocation(line: 99, column: 14, scope: !122)
!124 = !DILocation(line: 101, column: 16, scope: !122)
!125 = !DILocation(line: 101, column: 22, scope: !122)
!126 = !DILocation(line: 101, column: 9, scope: !122)
!127 = !DILocation(line: 102, column: 19, scope: !122)
!128 = !DILocation(line: 102, column: 9, scope: !122)
!129 = !DILocation(line: 104, column: 1, scope: !103)
