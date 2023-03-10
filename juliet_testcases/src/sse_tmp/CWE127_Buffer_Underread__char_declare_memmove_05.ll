; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_05.c"
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
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %1 = load i8*, i8** %data, align 8, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %1, i64 100, i1 false), !dbg !47
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx5, align 1, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay6), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_05_good() #0 !dbg !54 {
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
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__char_declare_memmove_05_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__char_declare_memmove_05_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !81
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %0 = load i32, i32* @staticFalse, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay1, i8** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx3, align 1, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %1 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %1, i64 100, i1 false), !dbg !99
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx5, align 1, !dbg !102
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @printLine(i8* %arraydecay6), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !111
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %0 = load i32, i32* @staticTrue, align 4, !dbg !114
  %tobool = icmp ne i32 %0, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !117
  store i8* %arraydecay1, i8** %data, align 8, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx3, align 1, !dbg !126
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %1 = load i8*, i8** %data, align 8, !dbg !128
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %1, i64 100, i1 false), !dbg !127
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx5, align 1, !dbg !130
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @printLine(i8* %arraydecay6), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!41 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 42, type: !26)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!43 = !DILocation(line: 42, column: 14, scope: !42)
!44 = !DILocation(line: 43, column: 9, scope: !42)
!45 = !DILocation(line: 44, column: 9, scope: !42)
!46 = !DILocation(line: 44, column: 21, scope: !42)
!47 = !DILocation(line: 46, column: 9, scope: !42)
!48 = !DILocation(line: 46, column: 23, scope: !42)
!49 = !DILocation(line: 48, column: 9, scope: !42)
!50 = !DILocation(line: 48, column: 21, scope: !42)
!51 = !DILocation(line: 49, column: 19, scope: !42)
!52 = !DILocation(line: 49, column: 9, scope: !42)
!53 = !DILocation(line: 51, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_05_good", scope: !10, file: !10, line: 110, type: !19, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 112, column: 5, scope: !54)
!56 = !DILocation(line: 113, column: 5, scope: !54)
!57 = !DILocation(line: 114, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 126, type: !59, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
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
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 60, type: !22)
!78 = !DILocation(line: 60, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !10, line: 61, type: !26)
!80 = !DILocation(line: 61, column: 10, scope: !76)
!81 = !DILocation(line: 62, column: 5, scope: !76)
!82 = !DILocation(line: 63, column: 5, scope: !76)
!83 = !DILocation(line: 63, column: 23, scope: !76)
!84 = !DILocation(line: 64, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !76, file: !10, line: 64, column: 8)
!86 = !DILocation(line: 64, column: 8, scope: !76)
!87 = !DILocation(line: 67, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 65, column: 5)
!89 = !DILocation(line: 68, column: 5, scope: !88)
!90 = !DILocation(line: 72, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !10, line: 70, column: 5)
!92 = !DILocation(line: 72, column: 14, scope: !91)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !10, line: 75, type: !26)
!94 = distinct !DILexicalBlock(scope: !76, file: !10, line: 74, column: 5)
!95 = !DILocation(line: 75, column: 14, scope: !94)
!96 = !DILocation(line: 76, column: 9, scope: !94)
!97 = !DILocation(line: 77, column: 9, scope: !94)
!98 = !DILocation(line: 77, column: 21, scope: !94)
!99 = !DILocation(line: 79, column: 9, scope: !94)
!100 = !DILocation(line: 79, column: 23, scope: !94)
!101 = !DILocation(line: 81, column: 9, scope: !94)
!102 = !DILocation(line: 81, column: 21, scope: !94)
!103 = !DILocation(line: 82, column: 19, scope: !94)
!104 = !DILocation(line: 82, column: 9, scope: !94)
!105 = !DILocation(line: 84, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !10, line: 89, type: !22)
!108 = !DILocation(line: 89, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !10, line: 90, type: !26)
!110 = !DILocation(line: 90, column: 10, scope: !106)
!111 = !DILocation(line: 91, column: 5, scope: !106)
!112 = !DILocation(line: 92, column: 5, scope: !106)
!113 = !DILocation(line: 92, column: 23, scope: !106)
!114 = !DILocation(line: 93, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !10, line: 93, column: 8)
!116 = !DILocation(line: 93, column: 8, scope: !106)
!117 = !DILocation(line: 96, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !10, line: 94, column: 5)
!119 = !DILocation(line: 96, column: 14, scope: !118)
!120 = !DILocation(line: 97, column: 5, scope: !118)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !10, line: 99, type: !26)
!122 = distinct !DILexicalBlock(scope: !106, file: !10, line: 98, column: 5)
!123 = !DILocation(line: 99, column: 14, scope: !122)
!124 = !DILocation(line: 100, column: 9, scope: !122)
!125 = !DILocation(line: 101, column: 9, scope: !122)
!126 = !DILocation(line: 101, column: 21, scope: !122)
!127 = !DILocation(line: 103, column: 9, scope: !122)
!128 = !DILocation(line: 103, column: 23, scope: !122)
!129 = !DILocation(line: 105, column: 9, scope: !122)
!130 = !DILocation(line: 105, column: 21, scope: !122)
!131 = !DILocation(line: 106, column: 19, scope: !122)
!132 = !DILocation(line: 106, column: 9, scope: !122)
!133 = !DILocation(line: 108, column: 1, scope: !106)
