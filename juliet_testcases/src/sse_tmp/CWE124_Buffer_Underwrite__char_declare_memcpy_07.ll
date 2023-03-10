; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memcpy_07_bad() #0 !dbg !16 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !47
  %2 = load i8*, i8** %data, align 8, !dbg !48
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !48
  store i8 0, i8* %arrayidx5, align 1, !dbg !49
  %3 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %3), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memcpy_07_good() #0 !dbg !53 {
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
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE124_Buffer_Underwrite__char_declare_memcpy_07_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE124_Buffer_Underwrite__char_declare_memcpy_07_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

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
  %0 = load i32, i32* @staticFive, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay1, i8** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx3, align 1, !dbg !98
  %1 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !101
  store i8 0, i8* %arrayidx5, align 1, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %3), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !111
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %0 = load i32, i32* @staticFive, align 4, !dbg !114
  %cmp = icmp eq i32 %0, 5, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !118
  store i8* %arraydecay1, i8** %data, align 8, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx3, align 1, !dbg !127
  %1 = load i8*, i8** %data, align 8, !dbg !128
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !129
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
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memcpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!47 = !DILocation(line: 45, column: 9, scope: !41)
!48 = !DILocation(line: 47, column: 9, scope: !41)
!49 = !DILocation(line: 47, column: 21, scope: !41)
!50 = !DILocation(line: 48, column: 19, scope: !41)
!51 = !DILocation(line: 48, column: 9, scope: !41)
!52 = !DILocation(line: 50, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memcpy_07_good", scope: !8, file: !8, line: 109, type: !17, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 111, column: 5, scope: !53)
!55 = !DILocation(line: 112, column: 5, scope: !53)
!56 = !DILocation(line: 113, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 125, type: !58, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!9, !9, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !8, line: 125, type: !9)
!62 = !DILocation(line: 125, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !8, line: 125, type: !60)
!64 = !DILocation(line: 125, column: 27, scope: !57)
!65 = !DILocation(line: 128, column: 22, scope: !57)
!66 = !DILocation(line: 128, column: 12, scope: !57)
!67 = !DILocation(line: 128, column: 5, scope: !57)
!68 = !DILocation(line: 130, column: 5, scope: !57)
!69 = !DILocation(line: 131, column: 5, scope: !57)
!70 = !DILocation(line: 132, column: 5, scope: !57)
!71 = !DILocation(line: 135, column: 5, scope: !57)
!72 = !DILocation(line: 136, column: 5, scope: !57)
!73 = !DILocation(line: 137, column: 5, scope: !57)
!74 = !DILocation(line: 139, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !8, line: 59, type: !20)
!77 = !DILocation(line: 59, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !8, line: 60, type: !24)
!79 = !DILocation(line: 60, column: 10, scope: !75)
!80 = !DILocation(line: 61, column: 5, scope: !75)
!81 = !DILocation(line: 62, column: 5, scope: !75)
!82 = !DILocation(line: 62, column: 23, scope: !75)
!83 = !DILocation(line: 63, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !8, line: 63, column: 8)
!85 = !DILocation(line: 63, column: 18, scope: !84)
!86 = !DILocation(line: 63, column: 8, scope: !75)
!87 = !DILocation(line: 66, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !8, line: 64, column: 5)
!89 = !DILocation(line: 67, column: 5, scope: !88)
!90 = !DILocation(line: 71, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !8, line: 69, column: 5)
!92 = !DILocation(line: 71, column: 14, scope: !91)
!93 = !DILocalVariable(name: "source", scope: !94, file: !8, line: 74, type: !24)
!94 = distinct !DILexicalBlock(scope: !75, file: !8, line: 73, column: 5)
!95 = !DILocation(line: 74, column: 14, scope: !94)
!96 = !DILocation(line: 75, column: 9, scope: !94)
!97 = !DILocation(line: 76, column: 9, scope: !94)
!98 = !DILocation(line: 76, column: 23, scope: !94)
!99 = !DILocation(line: 78, column: 16, scope: !94)
!100 = !DILocation(line: 78, column: 9, scope: !94)
!101 = !DILocation(line: 80, column: 9, scope: !94)
!102 = !DILocation(line: 80, column: 21, scope: !94)
!103 = !DILocation(line: 81, column: 19, scope: !94)
!104 = !DILocation(line: 81, column: 9, scope: !94)
!105 = !DILocation(line: 83, column: 1, scope: !75)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !8, line: 88, type: !20)
!108 = !DILocation(line: 88, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !8, line: 89, type: !24)
!110 = !DILocation(line: 89, column: 10, scope: !106)
!111 = !DILocation(line: 90, column: 5, scope: !106)
!112 = !DILocation(line: 91, column: 5, scope: !106)
!113 = !DILocation(line: 91, column: 23, scope: !106)
!114 = !DILocation(line: 92, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !8, line: 92, column: 8)
!116 = !DILocation(line: 92, column: 18, scope: !115)
!117 = !DILocation(line: 92, column: 8, scope: !106)
!118 = !DILocation(line: 95, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !8, line: 93, column: 5)
!120 = !DILocation(line: 95, column: 14, scope: !119)
!121 = !DILocation(line: 96, column: 5, scope: !119)
!122 = !DILocalVariable(name: "source", scope: !123, file: !8, line: 98, type: !24)
!123 = distinct !DILexicalBlock(scope: !106, file: !8, line: 97, column: 5)
!124 = !DILocation(line: 98, column: 14, scope: !123)
!125 = !DILocation(line: 99, column: 9, scope: !123)
!126 = !DILocation(line: 100, column: 9, scope: !123)
!127 = !DILocation(line: 100, column: 23, scope: !123)
!128 = !DILocation(line: 102, column: 16, scope: !123)
!129 = !DILocation(line: 102, column: 9, scope: !123)
!130 = !DILocation(line: 104, column: 9, scope: !123)
!131 = !DILocation(line: 104, column: 21, scope: !123)
!132 = !DILocation(line: 105, column: 19, scope: !123)
!133 = !DILocation(line: 105, column: 9, scope: !123)
!134 = !DILocation(line: 107, column: 1, scope: !106)
