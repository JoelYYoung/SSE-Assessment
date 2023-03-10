; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_03.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_03_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !29
  store i8* %add.ptr, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !43
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !44
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx5, align 1, !dbg !46
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @printLine(i8* %arraydecay6), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_03_good() #0 !dbg !50 {
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
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_03_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_03_bad(), !dbg !70
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
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %0, i8** %dataBuffer, align 8, !dbg !77
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !80
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  store i8* %3, i8** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !90
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !91
  store i8 0, i8* %arrayidx1, align 1, !dbg !92
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !96
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !97
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx5, align 1, !dbg !99
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @printLine(i8* %arraydecay6), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 100, align 16, !dbg !108
  store i8* %0, i8** %dataBuffer, align 8, !dbg !107
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !110
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  store i8* %3, i8** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx1, align 1, !dbg !122
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !126
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !127
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx5, align 1, !dbg !129
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @printLine(i8* %arraydecay6), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_03_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 32, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !14, line: 30, column: 5)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!29 = !DILocation(line: 32, column: 27, scope: !27)
!30 = !DILocation(line: 32, column: 14, scope: !27)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !14, line: 35, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 35, column: 14, scope: !32)
!37 = !DILocation(line: 36, column: 9, scope: !32)
!38 = !DILocation(line: 37, column: 9, scope: !32)
!39 = !DILocation(line: 37, column: 21, scope: !32)
!40 = !DILocation(line: 39, column: 17, scope: !32)
!41 = !DILocation(line: 39, column: 23, scope: !32)
!42 = !DILocation(line: 39, column: 36, scope: !32)
!43 = !DILocation(line: 39, column: 29, scope: !32)
!44 = !DILocation(line: 39, column: 9, scope: !32)
!45 = !DILocation(line: 41, column: 9, scope: !32)
!46 = !DILocation(line: 41, column: 21, scope: !32)
!47 = !DILocation(line: 42, column: 19, scope: !32)
!48 = !DILocation(line: 42, column: 9, scope: !32)
!49 = !DILocation(line: 44, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_03_good", scope: !14, file: !14, line: 103, type: !15, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 105, column: 5, scope: !50)
!52 = !DILocation(line: 106, column: 5, scope: !50)
!53 = !DILocation(line: 107, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 119, type: !55, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 119, type: !57)
!60 = !DILocation(line: 119, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 119, type: !58)
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
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 53, type: !4)
!75 = !DILocation(line: 53, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !14, line: 54, type: !4)
!77 = !DILocation(line: 54, column: 12, scope: !73)
!78 = !DILocation(line: 54, column: 33, scope: !73)
!79 = !DILocation(line: 55, column: 12, scope: !73)
!80 = !DILocation(line: 55, column: 5, scope: !73)
!81 = !DILocation(line: 56, column: 5, scope: !73)
!82 = !DILocation(line: 56, column: 23, scope: !73)
!83 = !DILocation(line: 65, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !14, line: 63, column: 5)
!85 = distinct !DILexicalBlock(scope: !73, file: !14, line: 57, column: 8)
!86 = !DILocation(line: 65, column: 14, scope: !84)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !14, line: 68, type: !33)
!88 = distinct !DILexicalBlock(scope: !73, file: !14, line: 67, column: 5)
!89 = !DILocation(line: 68, column: 14, scope: !88)
!90 = !DILocation(line: 69, column: 9, scope: !88)
!91 = !DILocation(line: 70, column: 9, scope: !88)
!92 = !DILocation(line: 70, column: 21, scope: !88)
!93 = !DILocation(line: 72, column: 17, scope: !88)
!94 = !DILocation(line: 72, column: 23, scope: !88)
!95 = !DILocation(line: 72, column: 36, scope: !88)
!96 = !DILocation(line: 72, column: 29, scope: !88)
!97 = !DILocation(line: 72, column: 9, scope: !88)
!98 = !DILocation(line: 74, column: 9, scope: !88)
!99 = !DILocation(line: 74, column: 21, scope: !88)
!100 = !DILocation(line: 75, column: 19, scope: !88)
!101 = !DILocation(line: 75, column: 9, scope: !88)
!102 = !DILocation(line: 77, column: 1, scope: !73)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 82, type: !4)
!105 = !DILocation(line: 82, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !14, line: 83, type: !4)
!107 = !DILocation(line: 83, column: 12, scope: !103)
!108 = !DILocation(line: 83, column: 33, scope: !103)
!109 = !DILocation(line: 84, column: 12, scope: !103)
!110 = !DILocation(line: 84, column: 5, scope: !103)
!111 = !DILocation(line: 85, column: 5, scope: !103)
!112 = !DILocation(line: 85, column: 23, scope: !103)
!113 = !DILocation(line: 89, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !14, line: 87, column: 5)
!115 = distinct !DILexicalBlock(scope: !103, file: !14, line: 86, column: 8)
!116 = !DILocation(line: 89, column: 14, scope: !114)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !14, line: 92, type: !33)
!118 = distinct !DILexicalBlock(scope: !103, file: !14, line: 91, column: 5)
!119 = !DILocation(line: 92, column: 14, scope: !118)
!120 = !DILocation(line: 93, column: 9, scope: !118)
!121 = !DILocation(line: 94, column: 9, scope: !118)
!122 = !DILocation(line: 94, column: 21, scope: !118)
!123 = !DILocation(line: 96, column: 17, scope: !118)
!124 = !DILocation(line: 96, column: 23, scope: !118)
!125 = !DILocation(line: 96, column: 36, scope: !118)
!126 = !DILocation(line: 96, column: 29, scope: !118)
!127 = !DILocation(line: 96, column: 9, scope: !118)
!128 = !DILocation(line: 98, column: 9, scope: !118)
!129 = !DILocation(line: 98, column: 21, scope: !118)
!130 = !DILocation(line: 99, column: 19, scope: !118)
!131 = !DILocation(line: 99, column: 9, scope: !118)
!132 = !DILocation(line: 101, column: 1, scope: !103)
