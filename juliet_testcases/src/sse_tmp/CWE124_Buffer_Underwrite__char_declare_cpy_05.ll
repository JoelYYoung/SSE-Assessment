; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_05.c"
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
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !36
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %1 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay4) #5, !dbg !49
  %2 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %2), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_05_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_05_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_05_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %0 = load i32, i32* @staticFalse, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i8* %arraydecay1, i8** %data, align 8, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx3, align 1, !dbg !124
  %1 = load i8*, i8** %data, align 8, !dbg !125
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay4) #5, !dbg !127
  %2 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %2), !dbg !129
  ret void, !dbg !130
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocation(line: 34, column: 5, scope: !18)
!31 = !DILocation(line: 35, column: 5, scope: !18)
!32 = !DILocation(line: 35, column: 23, scope: !18)
!33 = !DILocation(line: 36, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!35 = !DILocation(line: 36, column: 8, scope: !18)
!36 = !DILocation(line: 39, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 37, column: 5)
!38 = !DILocation(line: 39, column: 27, scope: !37)
!39 = !DILocation(line: 39, column: 14, scope: !37)
!40 = !DILocation(line: 40, column: 5, scope: !37)
!41 = !DILocalVariable(name: "source", scope: !42, file: !10, line: 42, type: !26)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!43 = !DILocation(line: 42, column: 14, scope: !42)
!44 = !DILocation(line: 43, column: 9, scope: !42)
!45 = !DILocation(line: 44, column: 9, scope: !42)
!46 = !DILocation(line: 44, column: 23, scope: !42)
!47 = !DILocation(line: 46, column: 16, scope: !42)
!48 = !DILocation(line: 46, column: 22, scope: !42)
!49 = !DILocation(line: 46, column: 9, scope: !42)
!50 = !DILocation(line: 47, column: 19, scope: !42)
!51 = !DILocation(line: 47, column: 9, scope: !42)
!52 = !DILocation(line: 49, column: 1, scope: !18)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_05_good", scope: !10, file: !10, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 106, column: 5, scope: !53)
!55 = !DILocation(line: 107, column: 5, scope: !53)
!56 = !DILocation(line: 108, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 120, type: !58, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!11, !11, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !10, line: 120, type: !11)
!62 = !DILocation(line: 120, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !10, line: 120, type: !60)
!64 = !DILocation(line: 120, column: 27, scope: !57)
!65 = !DILocation(line: 123, column: 22, scope: !57)
!66 = !DILocation(line: 123, column: 12, scope: !57)
!67 = !DILocation(line: 123, column: 5, scope: !57)
!68 = !DILocation(line: 125, column: 5, scope: !57)
!69 = !DILocation(line: 126, column: 5, scope: !57)
!70 = !DILocation(line: 127, column: 5, scope: !57)
!71 = !DILocation(line: 130, column: 5, scope: !57)
!72 = !DILocation(line: 131, column: 5, scope: !57)
!73 = !DILocation(line: 132, column: 5, scope: !57)
!74 = !DILocation(line: 134, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 58, type: !22)
!77 = !DILocation(line: 58, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !10, line: 59, type: !26)
!79 = !DILocation(line: 59, column: 10, scope: !75)
!80 = !DILocation(line: 60, column: 5, scope: !75)
!81 = !DILocation(line: 61, column: 5, scope: !75)
!82 = !DILocation(line: 61, column: 23, scope: !75)
!83 = !DILocation(line: 62, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !10, line: 62, column: 8)
!85 = !DILocation(line: 62, column: 8, scope: !75)
!86 = !DILocation(line: 65, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 63, column: 5)
!88 = !DILocation(line: 66, column: 5, scope: !87)
!89 = !DILocation(line: 70, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !10, line: 68, column: 5)
!91 = !DILocation(line: 70, column: 14, scope: !90)
!92 = !DILocalVariable(name: "source", scope: !93, file: !10, line: 73, type: !26)
!93 = distinct !DILexicalBlock(scope: !75, file: !10, line: 72, column: 5)
!94 = !DILocation(line: 73, column: 14, scope: !93)
!95 = !DILocation(line: 74, column: 9, scope: !93)
!96 = !DILocation(line: 75, column: 9, scope: !93)
!97 = !DILocation(line: 75, column: 23, scope: !93)
!98 = !DILocation(line: 77, column: 16, scope: !93)
!99 = !DILocation(line: 77, column: 22, scope: !93)
!100 = !DILocation(line: 77, column: 9, scope: !93)
!101 = !DILocation(line: 78, column: 19, scope: !93)
!102 = !DILocation(line: 78, column: 9, scope: !93)
!103 = !DILocation(line: 80, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !10, line: 85, type: !22)
!106 = !DILocation(line: 85, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !10, line: 86, type: !26)
!108 = !DILocation(line: 86, column: 10, scope: !104)
!109 = !DILocation(line: 87, column: 5, scope: !104)
!110 = !DILocation(line: 88, column: 5, scope: !104)
!111 = !DILocation(line: 88, column: 23, scope: !104)
!112 = !DILocation(line: 89, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !10, line: 89, column: 8)
!114 = !DILocation(line: 89, column: 8, scope: !104)
!115 = !DILocation(line: 92, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !10, line: 90, column: 5)
!117 = !DILocation(line: 92, column: 14, scope: !116)
!118 = !DILocation(line: 93, column: 5, scope: !116)
!119 = !DILocalVariable(name: "source", scope: !120, file: !10, line: 95, type: !26)
!120 = distinct !DILexicalBlock(scope: !104, file: !10, line: 94, column: 5)
!121 = !DILocation(line: 95, column: 14, scope: !120)
!122 = !DILocation(line: 96, column: 9, scope: !120)
!123 = !DILocation(line: 97, column: 9, scope: !120)
!124 = !DILocation(line: 97, column: 23, scope: !120)
!125 = !DILocation(line: 99, column: 16, scope: !120)
!126 = !DILocation(line: 99, column: 22, scope: !120)
!127 = !DILocation(line: 99, column: 9, scope: !120)
!128 = !DILocation(line: 100, column: 19, scope: !120)
!129 = !DILocation(line: 100, column: 9, scope: !120)
!130 = !DILocation(line: 102, column: 1, scope: !104)
