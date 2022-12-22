; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  %2 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !52
  %3 = load i8*, i8** %data, align 8, !dbg !53
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !53
  store i8 0, i8* %arrayidx4, align 1, !dbg !54
  %4 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %4), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %0, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay, i8** %data, align 8, !dbg !95
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx2, align 1, !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %4), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @staticTrue, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  store i8* %arraydecay, i8** %data, align 8, !dbg !124
  %1 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx2, align 1, !dbg !133
  %2 = load i8*, i8** %data, align 8, !dbg !134
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !136
  %3 = load i8*, i8** %data, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !137
  store i8 0, i8* %arrayidx4, align 1, !dbg !138
  %4 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %4), !dbg !140
  ret void, !dbg !141
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 34, column: 10, scope: !18)
!35 = !DILocation(line: 35, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!37 = !DILocation(line: 35, column: 8, scope: !18)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 36, column: 5)
!40 = !DILocation(line: 39, column: 14, scope: !39)
!41 = !DILocation(line: 40, column: 9, scope: !39)
!42 = !DILocation(line: 40, column: 17, scope: !39)
!43 = !DILocation(line: 41, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !10, line: 43, type: !31)
!45 = distinct !DILexicalBlock(scope: !18, file: !10, line: 42, column: 5)
!46 = !DILocation(line: 43, column: 14, scope: !45)
!47 = !DILocation(line: 44, column: 9, scope: !45)
!48 = !DILocation(line: 45, column: 9, scope: !45)
!49 = !DILocation(line: 45, column: 23, scope: !45)
!50 = !DILocation(line: 47, column: 17, scope: !45)
!51 = !DILocation(line: 47, column: 23, scope: !45)
!52 = !DILocation(line: 47, column: 9, scope: !45)
!53 = !DILocation(line: 48, column: 9, scope: !45)
!54 = !DILocation(line: 48, column: 21, scope: !45)
!55 = !DILocation(line: 49, column: 19, scope: !45)
!56 = !DILocation(line: 49, column: 9, scope: !45)
!57 = !DILocation(line: 51, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_05_good", scope: !10, file: !10, line: 108, type: !19, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 110, column: 5, scope: !58)
!60 = !DILocation(line: 111, column: 5, scope: !58)
!61 = !DILocation(line: 112, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 124, type: !63, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!11, !11, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !10, line: 124, type: !11)
!67 = !DILocation(line: 124, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !10, line: 124, type: !65)
!69 = !DILocation(line: 124, column: 27, scope: !62)
!70 = !DILocation(line: 127, column: 22, scope: !62)
!71 = !DILocation(line: 127, column: 12, scope: !62)
!72 = !DILocation(line: 127, column: 5, scope: !62)
!73 = !DILocation(line: 129, column: 5, scope: !62)
!74 = !DILocation(line: 130, column: 5, scope: !62)
!75 = !DILocation(line: 131, column: 5, scope: !62)
!76 = !DILocation(line: 134, column: 5, scope: !62)
!77 = !DILocation(line: 135, column: 5, scope: !62)
!78 = !DILocation(line: 136, column: 5, scope: !62)
!79 = !DILocation(line: 138, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 60, type: !22)
!82 = !DILocation(line: 60, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !10, line: 61, type: !26)
!84 = !DILocation(line: 61, column: 10, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !10, line: 62, type: !31)
!86 = !DILocation(line: 62, column: 10, scope: !80)
!87 = !DILocation(line: 63, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !10, line: 63, column: 8)
!89 = !DILocation(line: 63, column: 8, scope: !80)
!90 = !DILocation(line: 66, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !10, line: 64, column: 5)
!92 = !DILocation(line: 67, column: 5, scope: !91)
!93 = !DILocation(line: 71, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !10, line: 69, column: 5)
!95 = !DILocation(line: 71, column: 14, scope: !94)
!96 = !DILocation(line: 72, column: 9, scope: !94)
!97 = !DILocation(line: 72, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !10, line: 75, type: !31)
!99 = distinct !DILexicalBlock(scope: !80, file: !10, line: 74, column: 5)
!100 = !DILocation(line: 75, column: 14, scope: !99)
!101 = !DILocation(line: 76, column: 9, scope: !99)
!102 = !DILocation(line: 77, column: 9, scope: !99)
!103 = !DILocation(line: 77, column: 23, scope: !99)
!104 = !DILocation(line: 79, column: 17, scope: !99)
!105 = !DILocation(line: 79, column: 23, scope: !99)
!106 = !DILocation(line: 79, column: 9, scope: !99)
!107 = !DILocation(line: 80, column: 9, scope: !99)
!108 = !DILocation(line: 80, column: 21, scope: !99)
!109 = !DILocation(line: 81, column: 19, scope: !99)
!110 = !DILocation(line: 81, column: 9, scope: !99)
!111 = !DILocation(line: 83, column: 1, scope: !80)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !10, line: 88, type: !22)
!114 = !DILocation(line: 88, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !10, line: 89, type: !26)
!116 = !DILocation(line: 89, column: 10, scope: !112)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !10, line: 90, type: !31)
!118 = !DILocation(line: 90, column: 10, scope: !112)
!119 = !DILocation(line: 91, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !10, line: 91, column: 8)
!121 = !DILocation(line: 91, column: 8, scope: !112)
!122 = !DILocation(line: 94, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !10, line: 92, column: 5)
!124 = !DILocation(line: 94, column: 14, scope: !123)
!125 = !DILocation(line: 95, column: 9, scope: !123)
!126 = !DILocation(line: 95, column: 17, scope: !123)
!127 = !DILocation(line: 96, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !10, line: 98, type: !31)
!129 = distinct !DILexicalBlock(scope: !112, file: !10, line: 97, column: 5)
!130 = !DILocation(line: 98, column: 14, scope: !129)
!131 = !DILocation(line: 99, column: 9, scope: !129)
!132 = !DILocation(line: 100, column: 9, scope: !129)
!133 = !DILocation(line: 100, column: 23, scope: !129)
!134 = !DILocation(line: 102, column: 17, scope: !129)
!135 = !DILocation(line: 102, column: 23, scope: !129)
!136 = !DILocation(line: 102, column: 9, scope: !129)
!137 = !DILocation(line: 103, column: 9, scope: !129)
!138 = !DILocation(line: 103, column: 21, scope: !129)
!139 = !DILocation(line: 104, column: 19, scope: !129)
!140 = !DILocation(line: 104, column: 9, scope: !129)
!141 = !DILocation(line: 106, column: 1, scope: !112)
