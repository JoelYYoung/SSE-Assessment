; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i8* %arraydecay, i8** %data, align 8, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call = call i8* @strcpy(i8* %3, i8* %arraydecay1) #5, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %4), !dbg !50
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_good() #0 !dbg !52 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_bad(), !dbg !71
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
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = load i32, i32* @staticFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay, i8** %data, align 8, !dbg !90
  %1 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !97
  %call = call i8* @strcpy(i8* %3, i8* %arraydecay1) #5, !dbg !98
  %4 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* %4), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp eq i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i8* %arraydecay, i8** %data, align 8, !dbg !115
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !121
  %3 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !123
  %call = call i8* @strcpy(i8* %3, i8* %arraydecay1) #5, !dbg !124
  %4 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %4), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_bad", scope: !8, file: !8, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 36, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 36, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 37, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 80, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 37, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 38, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 88, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 11)
!32 = !DILocation(line: 38, column: 10, scope: !16)
!33 = !DILocation(line: 39, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 39, column: 8)
!35 = !DILocation(line: 39, column: 18, scope: !34)
!36 = !DILocation(line: 39, column: 8, scope: !16)
!37 = !DILocation(line: 43, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 40, column: 5)
!39 = !DILocation(line: 43, column: 14, scope: !38)
!40 = !DILocation(line: 44, column: 9, scope: !38)
!41 = !DILocation(line: 44, column: 17, scope: !38)
!42 = !DILocation(line: 45, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !8, line: 47, type: !29)
!44 = distinct !DILexicalBlock(scope: !16, file: !8, line: 46, column: 5)
!45 = !DILocation(line: 47, column: 14, scope: !44)
!46 = !DILocation(line: 49, column: 16, scope: !44)
!47 = !DILocation(line: 49, column: 22, scope: !44)
!48 = !DILocation(line: 49, column: 9, scope: !44)
!49 = !DILocation(line: 50, column: 19, scope: !44)
!50 = !DILocation(line: 50, column: 9, scope: !44)
!51 = !DILocation(line: 52, column: 1, scope: !16)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_07_good", scope: !8, file: !8, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 107, column: 5, scope: !52)
!54 = !DILocation(line: 108, column: 5, scope: !52)
!55 = !DILocation(line: 109, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 121, type: !57, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9, !9, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !8, line: 121, type: !9)
!61 = !DILocation(line: 121, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !8, line: 121, type: !59)
!63 = !DILocation(line: 121, column: 27, scope: !56)
!64 = !DILocation(line: 124, column: 22, scope: !56)
!65 = !DILocation(line: 124, column: 12, scope: !56)
!66 = !DILocation(line: 124, column: 5, scope: !56)
!67 = !DILocation(line: 126, column: 5, scope: !56)
!68 = !DILocation(line: 127, column: 5, scope: !56)
!69 = !DILocation(line: 128, column: 5, scope: !56)
!70 = !DILocation(line: 131, column: 5, scope: !56)
!71 = !DILocation(line: 132, column: 5, scope: !56)
!72 = !DILocation(line: 133, column: 5, scope: !56)
!73 = !DILocation(line: 135, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 61, type: !20)
!76 = !DILocation(line: 61, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !8, line: 62, type: !24)
!78 = !DILocation(line: 62, column: 10, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !8, line: 63, type: !29)
!80 = !DILocation(line: 63, column: 10, scope: !74)
!81 = !DILocation(line: 64, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !8, line: 64, column: 8)
!83 = !DILocation(line: 64, column: 18, scope: !82)
!84 = !DILocation(line: 64, column: 8, scope: !74)
!85 = !DILocation(line: 67, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !8, line: 65, column: 5)
!87 = !DILocation(line: 68, column: 5, scope: !86)
!88 = !DILocation(line: 73, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !8, line: 70, column: 5)
!90 = !DILocation(line: 73, column: 14, scope: !89)
!91 = !DILocation(line: 74, column: 9, scope: !89)
!92 = !DILocation(line: 74, column: 17, scope: !89)
!93 = !DILocalVariable(name: "source", scope: !94, file: !8, line: 77, type: !29)
!94 = distinct !DILexicalBlock(scope: !74, file: !8, line: 76, column: 5)
!95 = !DILocation(line: 77, column: 14, scope: !94)
!96 = !DILocation(line: 79, column: 16, scope: !94)
!97 = !DILocation(line: 79, column: 22, scope: !94)
!98 = !DILocation(line: 79, column: 9, scope: !94)
!99 = !DILocation(line: 80, column: 19, scope: !94)
!100 = !DILocation(line: 80, column: 9, scope: !94)
!101 = !DILocation(line: 82, column: 1, scope: !74)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !8, line: 87, type: !20)
!104 = !DILocation(line: 87, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !8, line: 88, type: !24)
!106 = !DILocation(line: 88, column: 10, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !8, line: 89, type: !29)
!108 = !DILocation(line: 89, column: 10, scope: !102)
!109 = !DILocation(line: 90, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !8, line: 90, column: 8)
!111 = !DILocation(line: 90, column: 18, scope: !110)
!112 = !DILocation(line: 90, column: 8, scope: !102)
!113 = !DILocation(line: 94, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 91, column: 5)
!115 = !DILocation(line: 94, column: 14, scope: !114)
!116 = !DILocation(line: 95, column: 9, scope: !114)
!117 = !DILocation(line: 95, column: 17, scope: !114)
!118 = !DILocation(line: 96, column: 5, scope: !114)
!119 = !DILocalVariable(name: "source", scope: !120, file: !8, line: 98, type: !29)
!120 = distinct !DILexicalBlock(scope: !102, file: !8, line: 97, column: 5)
!121 = !DILocation(line: 98, column: 14, scope: !120)
!122 = !DILocation(line: 100, column: 16, scope: !120)
!123 = !DILocation(line: 100, column: 22, scope: !120)
!124 = !DILocation(line: 100, column: 9, scope: !120)
!125 = !DILocation(line: 101, column: 19, scope: !120)
!126 = !DILocation(line: 101, column: 9, scope: !120)
!127 = !DILocation(line: 103, column: 1, scope: !102)
