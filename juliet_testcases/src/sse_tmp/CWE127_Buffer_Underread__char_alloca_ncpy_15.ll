; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_15_bad() #0 !dbg !13 {
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
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !27
  store i8* %add.ptr, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !41
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx5, align 1, !dbg !44
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @printLine(i8* %arraydecay6), !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_15_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_15_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_15_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 100, align 16, !dbg !76
  store i8* %0, i8** %dataBuffer, align 8, !dbg !75
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !78
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  store i8* %3, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !86
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !87
  store i8 0, i8* %arrayidx1, align 1, !dbg !88
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !91
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !92
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !93
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx5, align 1, !dbg !95
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @printLine(i8* %arraydecay6), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 100, align 16, !dbg !104
  store i8* %0, i8** %dataBuffer, align 8, !dbg !103
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !106
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  store i8* %3, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx1, align 1, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !120
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !121
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx5, align 1, !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay6), !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!26 = !DILocation(line: 33, column: 16, scope: !13)
!27 = !DILocation(line: 33, column: 27, scope: !13)
!28 = !DILocation(line: 33, column: 14, scope: !13)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !14, line: 41, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 41, column: 14, scope: !30)
!35 = !DILocation(line: 42, column: 9, scope: !30)
!36 = !DILocation(line: 43, column: 9, scope: !30)
!37 = !DILocation(line: 43, column: 21, scope: !30)
!38 = !DILocation(line: 45, column: 17, scope: !30)
!39 = !DILocation(line: 45, column: 23, scope: !30)
!40 = !DILocation(line: 45, column: 36, scope: !30)
!41 = !DILocation(line: 45, column: 29, scope: !30)
!42 = !DILocation(line: 45, column: 9, scope: !30)
!43 = !DILocation(line: 47, column: 9, scope: !30)
!44 = !DILocation(line: 47, column: 21, scope: !30)
!45 = !DILocation(line: 48, column: 19, scope: !30)
!46 = !DILocation(line: 48, column: 9, scope: !30)
!47 = !DILocation(line: 50, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_15_good", scope: !14, file: !14, line: 116, type: !15, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 118, column: 5, scope: !48)
!50 = !DILocation(line: 119, column: 5, scope: !48)
!51 = !DILocation(line: 120, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 132, type: !53, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 132, type: !55)
!58 = !DILocation(line: 132, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 132, type: !56)
!60 = !DILocation(line: 132, column: 27, scope: !52)
!61 = !DILocation(line: 135, column: 22, scope: !52)
!62 = !DILocation(line: 135, column: 12, scope: !52)
!63 = !DILocation(line: 135, column: 5, scope: !52)
!64 = !DILocation(line: 137, column: 5, scope: !52)
!65 = !DILocation(line: 138, column: 5, scope: !52)
!66 = !DILocation(line: 139, column: 5, scope: !52)
!67 = !DILocation(line: 142, column: 5, scope: !52)
!68 = !DILocation(line: 143, column: 5, scope: !52)
!69 = !DILocation(line: 144, column: 5, scope: !52)
!70 = !DILocation(line: 146, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 59, type: !4)
!73 = !DILocation(line: 59, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !14, line: 60, type: !4)
!75 = !DILocation(line: 60, column: 12, scope: !71)
!76 = !DILocation(line: 60, column: 33, scope: !71)
!77 = !DILocation(line: 61, column: 12, scope: !71)
!78 = !DILocation(line: 61, column: 5, scope: !71)
!79 = !DILocation(line: 62, column: 5, scope: !71)
!80 = !DILocation(line: 62, column: 23, scope: !71)
!81 = !DILocation(line: 71, column: 16, scope: !71)
!82 = !DILocation(line: 71, column: 14, scope: !71)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !14, line: 75, type: !31)
!84 = distinct !DILexicalBlock(scope: !71, file: !14, line: 74, column: 5)
!85 = !DILocation(line: 75, column: 14, scope: !84)
!86 = !DILocation(line: 76, column: 9, scope: !84)
!87 = !DILocation(line: 77, column: 9, scope: !84)
!88 = !DILocation(line: 77, column: 21, scope: !84)
!89 = !DILocation(line: 79, column: 17, scope: !84)
!90 = !DILocation(line: 79, column: 23, scope: !84)
!91 = !DILocation(line: 79, column: 36, scope: !84)
!92 = !DILocation(line: 79, column: 29, scope: !84)
!93 = !DILocation(line: 79, column: 9, scope: !84)
!94 = !DILocation(line: 81, column: 9, scope: !84)
!95 = !DILocation(line: 81, column: 21, scope: !84)
!96 = !DILocation(line: 82, column: 19, scope: !84)
!97 = !DILocation(line: 82, column: 9, scope: !84)
!98 = !DILocation(line: 84, column: 1, scope: !71)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 89, type: !4)
!101 = !DILocation(line: 89, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !14, line: 90, type: !4)
!103 = !DILocation(line: 90, column: 12, scope: !99)
!104 = !DILocation(line: 90, column: 33, scope: !99)
!105 = !DILocation(line: 91, column: 12, scope: !99)
!106 = !DILocation(line: 91, column: 5, scope: !99)
!107 = !DILocation(line: 92, column: 5, scope: !99)
!108 = !DILocation(line: 92, column: 23, scope: !99)
!109 = !DILocation(line: 97, column: 16, scope: !99)
!110 = !DILocation(line: 97, column: 14, scope: !99)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !14, line: 105, type: !31)
!112 = distinct !DILexicalBlock(scope: !99, file: !14, line: 104, column: 5)
!113 = !DILocation(line: 105, column: 14, scope: !112)
!114 = !DILocation(line: 106, column: 9, scope: !112)
!115 = !DILocation(line: 107, column: 9, scope: !112)
!116 = !DILocation(line: 107, column: 21, scope: !112)
!117 = !DILocation(line: 109, column: 17, scope: !112)
!118 = !DILocation(line: 109, column: 23, scope: !112)
!119 = !DILocation(line: 109, column: 36, scope: !112)
!120 = !DILocation(line: 109, column: 29, scope: !112)
!121 = !DILocation(line: 109, column: 9, scope: !112)
!122 = !DILocation(line: 111, column: 9, scope: !112)
!123 = !DILocation(line: 111, column: 21, scope: !112)
!124 = !DILocation(line: 112, column: 19, scope: !112)
!125 = !DILocation(line: 112, column: 9, scope: !112)
!126 = !DILocation(line: 114, column: 1, scope: !99)
