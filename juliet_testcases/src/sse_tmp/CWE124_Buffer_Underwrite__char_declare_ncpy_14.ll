; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_ncpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %0 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay4, i64 99) #5, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !45
  store i8 0, i8* %arrayidx5, align 1, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_ncpy_14_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
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
  call void @CWE124_Buffer_Underwrite__char_declare_ncpy_14_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__char_declare_ncpy_14_bad(), !dbg !70
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
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !78
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  %0 = load i32, i32* @globalFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay1, i8** %data, align 8, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !94
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx3, align 1, !dbg !96
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay4, i64 99) #5, !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !100
  store i8 0, i8* %arrayidx5, align 1, !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %3), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !110
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %0 = load i32, i32* @globalFive, align 4, !dbg !113
  %cmp = icmp eq i32 %0, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !117
  store i8* %arraydecay1, i8** %data, align 8, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx3, align 1, !dbg !126
  %1 = load i8*, i8** %data, align 8, !dbg !127
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay4, i64 99) #5, !dbg !129
  %2 = load i8*, i8** %data, align 8, !dbg !130
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !130
  store i8 0, i8* %arrayidx5, align 1, !dbg !131
  %3 = load i8*, i8** %data, align 8, !dbg !132
  call void @printLine(i8* %3), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_ncpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!29 = !DILocation(line: 29, column: 18, scope: !28)
!30 = !DILocation(line: 29, column: 8, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 32, column: 27, scope: !32)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 5, scope: !32)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 35, type: !20)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 9, scope: !37)
!40 = !DILocation(line: 37, column: 9, scope: !37)
!41 = !DILocation(line: 37, column: 23, scope: !37)
!42 = !DILocation(line: 39, column: 17, scope: !37)
!43 = !DILocation(line: 39, column: 23, scope: !37)
!44 = !DILocation(line: 39, column: 9, scope: !37)
!45 = !DILocation(line: 41, column: 9, scope: !37)
!46 = !DILocation(line: 41, column: 21, scope: !37)
!47 = !DILocation(line: 42, column: 19, scope: !37)
!48 = !DILocation(line: 42, column: 9, scope: !37)
!49 = !DILocation(line: 44, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_ncpy_14_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 105, column: 5, scope: !50)
!52 = !DILocation(line: 106, column: 5, scope: !50)
!53 = !DILocation(line: 107, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !55, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 119, type: !57)
!60 = !DILocation(line: 119, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 119, type: !58)
!62 = !DILocation(line: 119, column: 27, scope: !54)
!63 = !DILocation(line: 122, column: 22, scope: !54)
!64 = !DILocation(line: 122, column: 12, scope: !54)
!65 = !DILocation(line: 122, column: 5, scope: !54)
!66 = !DILocation(line: 124, column: 5, scope: !54)
!67 = !DILocation(line: 125, column: 5, scope: !54)
!68 = !DILocation(line: 126, column: 5, scope: !54)
!69 = !DILocation(line: 129, column: 5, scope: !54)
!70 = !DILocation(line: 130, column: 5, scope: !54)
!71 = !DILocation(line: 131, column: 5, scope: !54)
!72 = !DILocation(line: 133, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 53, type: !16)
!75 = !DILocation(line: 53, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 54, type: !20)
!77 = !DILocation(line: 54, column: 10, scope: !73)
!78 = !DILocation(line: 55, column: 5, scope: !73)
!79 = !DILocation(line: 56, column: 5, scope: !73)
!80 = !DILocation(line: 56, column: 23, scope: !73)
!81 = !DILocation(line: 57, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !12, line: 57, column: 8)
!83 = !DILocation(line: 57, column: 18, scope: !82)
!84 = !DILocation(line: 57, column: 8, scope: !73)
!85 = !DILocation(line: 60, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 58, column: 5)
!87 = !DILocation(line: 61, column: 5, scope: !86)
!88 = !DILocation(line: 65, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !12, line: 63, column: 5)
!90 = !DILocation(line: 65, column: 14, scope: !89)
!91 = !DILocalVariable(name: "source", scope: !92, file: !12, line: 68, type: !20)
!92 = distinct !DILexicalBlock(scope: !73, file: !12, line: 67, column: 5)
!93 = !DILocation(line: 68, column: 14, scope: !92)
!94 = !DILocation(line: 69, column: 9, scope: !92)
!95 = !DILocation(line: 70, column: 9, scope: !92)
!96 = !DILocation(line: 70, column: 23, scope: !92)
!97 = !DILocation(line: 72, column: 17, scope: !92)
!98 = !DILocation(line: 72, column: 23, scope: !92)
!99 = !DILocation(line: 72, column: 9, scope: !92)
!100 = !DILocation(line: 74, column: 9, scope: !92)
!101 = !DILocation(line: 74, column: 21, scope: !92)
!102 = !DILocation(line: 75, column: 19, scope: !92)
!103 = !DILocation(line: 75, column: 9, scope: !92)
!104 = !DILocation(line: 77, column: 1, scope: !73)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 82, type: !16)
!107 = !DILocation(line: 82, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 83, type: !20)
!109 = !DILocation(line: 83, column: 10, scope: !105)
!110 = !DILocation(line: 84, column: 5, scope: !105)
!111 = !DILocation(line: 85, column: 5, scope: !105)
!112 = !DILocation(line: 85, column: 23, scope: !105)
!113 = !DILocation(line: 86, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !105, file: !12, line: 86, column: 8)
!115 = !DILocation(line: 86, column: 18, scope: !114)
!116 = !DILocation(line: 86, column: 8, scope: !105)
!117 = !DILocation(line: 89, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 87, column: 5)
!119 = !DILocation(line: 89, column: 14, scope: !118)
!120 = !DILocation(line: 90, column: 5, scope: !118)
!121 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 92, type: !20)
!122 = distinct !DILexicalBlock(scope: !105, file: !12, line: 91, column: 5)
!123 = !DILocation(line: 92, column: 14, scope: !122)
!124 = !DILocation(line: 93, column: 9, scope: !122)
!125 = !DILocation(line: 94, column: 9, scope: !122)
!126 = !DILocation(line: 94, column: 23, scope: !122)
!127 = !DILocation(line: 96, column: 17, scope: !122)
!128 = !DILocation(line: 96, column: 23, scope: !122)
!129 = !DILocation(line: 96, column: 9, scope: !122)
!130 = !DILocation(line: 98, column: 9, scope: !122)
!131 = !DILocation(line: 98, column: 21, scope: !122)
!132 = !DILocation(line: 99, column: 19, scope: !122)
!133 = !DILocation(line: 99, column: 9, scope: !122)
!134 = !DILocation(line: 101, column: 1, scope: !105)
