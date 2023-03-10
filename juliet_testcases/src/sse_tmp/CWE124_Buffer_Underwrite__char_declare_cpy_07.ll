; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !28
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !37
  store i8* %add.ptr, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  %1 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay4) #5, !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %2), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_07_good() #0 !dbg !52 {
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
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_07_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_07_bad(), !dbg !71
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
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !79
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %0 = load i32, i32* @staticFive, align 4, !dbg !82
  %cmp = icmp ne i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay1, i8** %data, align 8, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx3, align 1, !dbg !97
  %1 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay4) #5, !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %2), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !109
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay1, i8** %data, align 8, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx3, align 1, !dbg !125
  %1 = load i8*, i8** %data, align 8, !dbg !126
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay4) #5, !dbg !128
  %2 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* %2), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocation(line: 33, column: 5, scope: !16)
!29 = !DILocation(line: 34, column: 5, scope: !16)
!30 = !DILocation(line: 34, column: 23, scope: !16)
!31 = !DILocation(line: 35, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !8, line: 35, column: 8)
!33 = !DILocation(line: 35, column: 18, scope: !32)
!34 = !DILocation(line: 35, column: 8, scope: !16)
!35 = !DILocation(line: 38, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 36, column: 5)
!37 = !DILocation(line: 38, column: 27, scope: !36)
!38 = !DILocation(line: 38, column: 14, scope: !36)
!39 = !DILocation(line: 39, column: 5, scope: !36)
!40 = !DILocalVariable(name: "source", scope: !41, file: !8, line: 41, type: !24)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 14, scope: !41)
!43 = !DILocation(line: 42, column: 9, scope: !41)
!44 = !DILocation(line: 43, column: 9, scope: !41)
!45 = !DILocation(line: 43, column: 23, scope: !41)
!46 = !DILocation(line: 45, column: 16, scope: !41)
!47 = !DILocation(line: 45, column: 22, scope: !41)
!48 = !DILocation(line: 45, column: 9, scope: !41)
!49 = !DILocation(line: 46, column: 19, scope: !41)
!50 = !DILocation(line: 46, column: 9, scope: !41)
!51 = !DILocation(line: 48, column: 1, scope: !16)
!52 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_07_good", scope: !8, file: !8, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 105, column: 5, scope: !52)
!54 = !DILocation(line: 106, column: 5, scope: !52)
!55 = !DILocation(line: 107, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 119, type: !57, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9, !9, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !8, line: 119, type: !9)
!61 = !DILocation(line: 119, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !8, line: 119, type: !59)
!63 = !DILocation(line: 119, column: 27, scope: !56)
!64 = !DILocation(line: 122, column: 22, scope: !56)
!65 = !DILocation(line: 122, column: 12, scope: !56)
!66 = !DILocation(line: 122, column: 5, scope: !56)
!67 = !DILocation(line: 124, column: 5, scope: !56)
!68 = !DILocation(line: 125, column: 5, scope: !56)
!69 = !DILocation(line: 126, column: 5, scope: !56)
!70 = !DILocation(line: 129, column: 5, scope: !56)
!71 = !DILocation(line: 130, column: 5, scope: !56)
!72 = !DILocation(line: 131, column: 5, scope: !56)
!73 = !DILocation(line: 133, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 57, type: !20)
!76 = !DILocation(line: 57, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !8, line: 58, type: !24)
!78 = !DILocation(line: 58, column: 10, scope: !74)
!79 = !DILocation(line: 59, column: 5, scope: !74)
!80 = !DILocation(line: 60, column: 5, scope: !74)
!81 = !DILocation(line: 60, column: 23, scope: !74)
!82 = !DILocation(line: 61, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !8, line: 61, column: 8)
!84 = !DILocation(line: 61, column: 18, scope: !83)
!85 = !DILocation(line: 61, column: 8, scope: !74)
!86 = !DILocation(line: 64, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !8, line: 62, column: 5)
!88 = !DILocation(line: 65, column: 5, scope: !87)
!89 = !DILocation(line: 69, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !8, line: 67, column: 5)
!91 = !DILocation(line: 69, column: 14, scope: !90)
!92 = !DILocalVariable(name: "source", scope: !93, file: !8, line: 72, type: !24)
!93 = distinct !DILexicalBlock(scope: !74, file: !8, line: 71, column: 5)
!94 = !DILocation(line: 72, column: 14, scope: !93)
!95 = !DILocation(line: 73, column: 9, scope: !93)
!96 = !DILocation(line: 74, column: 9, scope: !93)
!97 = !DILocation(line: 74, column: 23, scope: !93)
!98 = !DILocation(line: 76, column: 16, scope: !93)
!99 = !DILocation(line: 76, column: 22, scope: !93)
!100 = !DILocation(line: 76, column: 9, scope: !93)
!101 = !DILocation(line: 77, column: 19, scope: !93)
!102 = !DILocation(line: 77, column: 9, scope: !93)
!103 = !DILocation(line: 79, column: 1, scope: !74)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !8, line: 84, type: !20)
!106 = !DILocation(line: 84, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !8, line: 85, type: !24)
!108 = !DILocation(line: 85, column: 10, scope: !104)
!109 = !DILocation(line: 86, column: 5, scope: !104)
!110 = !DILocation(line: 87, column: 5, scope: !104)
!111 = !DILocation(line: 87, column: 23, scope: !104)
!112 = !DILocation(line: 88, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !8, line: 88, column: 8)
!114 = !DILocation(line: 88, column: 18, scope: !113)
!115 = !DILocation(line: 88, column: 8, scope: !104)
!116 = !DILocation(line: 91, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !8, line: 89, column: 5)
!118 = !DILocation(line: 91, column: 14, scope: !117)
!119 = !DILocation(line: 92, column: 5, scope: !117)
!120 = !DILocalVariable(name: "source", scope: !121, file: !8, line: 94, type: !24)
!121 = distinct !DILexicalBlock(scope: !104, file: !8, line: 93, column: 5)
!122 = !DILocation(line: 94, column: 14, scope: !121)
!123 = !DILocation(line: 95, column: 9, scope: !121)
!124 = !DILocation(line: 96, column: 9, scope: !121)
!125 = !DILocation(line: 96, column: 23, scope: !121)
!126 = !DILocation(line: 98, column: 16, scope: !121)
!127 = !DILocation(line: 98, column: 22, scope: !121)
!128 = !DILocation(line: 98, column: 9, scope: !121)
!129 = !DILocation(line: 99, column: 19, scope: !121)
!130 = !DILocation(line: 99, column: 9, scope: !121)
!131 = !DILocation(line: 101, column: 1, scope: !104)
