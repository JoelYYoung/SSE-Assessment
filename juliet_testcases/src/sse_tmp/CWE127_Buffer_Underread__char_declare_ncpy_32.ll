; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !35
  %1 = load i8*, i8** %0, align 8, !dbg !36
  store i8* %1, i8** %data1, align 8, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay2, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data1, align 8, !dbg !39
  %2 = load i8*, i8** %data1, align 8, !dbg !40
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %2, i8** %3, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !43, metadata !DIExpression()), !dbg !45
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %5 = load i8*, i8** %4, align 8, !dbg !47
  store i8* %5, i8** %data3, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx5, align 1, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %6 = load i8*, i8** %data3, align 8, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay7) #6, !dbg !57
  %call8 = call i8* @strncpy(i8* %arraydecay6, i8* %6, i64 %call) #7, !dbg !58
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx9, align 1, !dbg !60
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay10), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #7, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #7, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__char_declare_ncpy_32_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__char_declare_ncpy_32_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !94
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !100
  %1 = load i8*, i8** %0, align 8, !dbg !101
  store i8* %1, i8** %data1, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay2, i8** %data1, align 8, !dbg !103
  %2 = load i8*, i8** %data1, align 8, !dbg !104
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !105
  store i8* %2, i8** %3, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !107, metadata !DIExpression()), !dbg !109
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !110
  %5 = load i8*, i8** %4, align 8, !dbg !111
  store i8* %5, i8** %data3, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx5, align 1, !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  %6 = load i8*, i8** %data3, align 8, !dbg !119
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  %call = call i64 @strlen(i8* %arraydecay7) #6, !dbg !121
  %call8 = call i8* @strncpy(i8* %arraydecay6, i8* %6, i64 %call) #7, !dbg !122
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx9, align 1, !dbg !124
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @printLine(i8* %arraydecay10), !dbg !126
  ret void, !dbg !127
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocation(line: 29, column: 5, scope: !11)
!30 = !DILocation(line: 30, column: 5, scope: !11)
!31 = !DILocation(line: 30, column: 23, scope: !11)
!32 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 32, type: !16)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 16, scope: !33)
!35 = !DILocation(line: 32, column: 24, scope: !33)
!36 = !DILocation(line: 32, column: 23, scope: !33)
!37 = !DILocation(line: 34, column: 16, scope: !33)
!38 = !DILocation(line: 34, column: 27, scope: !33)
!39 = !DILocation(line: 34, column: 14, scope: !33)
!40 = !DILocation(line: 35, column: 21, scope: !33)
!41 = !DILocation(line: 35, column: 10, scope: !33)
!42 = !DILocation(line: 35, column: 19, scope: !33)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 38, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 16, scope: !44)
!46 = !DILocation(line: 38, column: 24, scope: !44)
!47 = !DILocation(line: 38, column: 23, scope: !44)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 40, type: !25)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 39, column: 9)
!50 = !DILocation(line: 40, column: 18, scope: !49)
!51 = !DILocation(line: 41, column: 13, scope: !49)
!52 = !DILocation(line: 42, column: 13, scope: !49)
!53 = !DILocation(line: 42, column: 25, scope: !49)
!54 = !DILocation(line: 44, column: 21, scope: !49)
!55 = !DILocation(line: 44, column: 27, scope: !49)
!56 = !DILocation(line: 44, column: 40, scope: !49)
!57 = !DILocation(line: 44, column: 33, scope: !49)
!58 = !DILocation(line: 44, column: 13, scope: !49)
!59 = !DILocation(line: 46, column: 13, scope: !49)
!60 = !DILocation(line: 46, column: 25, scope: !49)
!61 = !DILocation(line: 47, column: 23, scope: !49)
!62 = !DILocation(line: 47, column: 13, scope: !49)
!63 = !DILocation(line: 50, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_32_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 88, column: 5, scope: !64)
!66 = !DILocation(line: 89, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !68, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !20}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 100, type: !70)
!72 = !DILocation(line: 100, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 100, type: !20)
!74 = !DILocation(line: 100, column: 27, scope: !67)
!75 = !DILocation(line: 103, column: 22, scope: !67)
!76 = !DILocation(line: 103, column: 12, scope: !67)
!77 = !DILocation(line: 103, column: 5, scope: !67)
!78 = !DILocation(line: 105, column: 5, scope: !67)
!79 = !DILocation(line: 106, column: 5, scope: !67)
!80 = !DILocation(line: 107, column: 5, scope: !67)
!81 = !DILocation(line: 110, column: 5, scope: !67)
!82 = !DILocation(line: 111, column: 5, scope: !67)
!83 = !DILocation(line: 112, column: 5, scope: !67)
!84 = !DILocation(line: 114, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 59, type: !16)
!87 = !DILocation(line: 59, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !12, line: 60, type: !20)
!89 = !DILocation(line: 60, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !12, line: 61, type: !20)
!91 = !DILocation(line: 61, column: 13, scope: !85)
!92 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !12, line: 62, type: !25)
!93 = !DILocation(line: 62, column: 10, scope: !85)
!94 = !DILocation(line: 63, column: 5, scope: !85)
!95 = !DILocation(line: 64, column: 5, scope: !85)
!96 = !DILocation(line: 64, column: 23, scope: !85)
!97 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 66, type: !16)
!98 = distinct !DILexicalBlock(scope: !85, file: !12, line: 65, column: 5)
!99 = !DILocation(line: 66, column: 16, scope: !98)
!100 = !DILocation(line: 66, column: 24, scope: !98)
!101 = !DILocation(line: 66, column: 23, scope: !98)
!102 = !DILocation(line: 68, column: 16, scope: !98)
!103 = !DILocation(line: 68, column: 14, scope: !98)
!104 = !DILocation(line: 69, column: 21, scope: !98)
!105 = !DILocation(line: 69, column: 10, scope: !98)
!106 = !DILocation(line: 69, column: 19, scope: !98)
!107 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 72, type: !16)
!108 = distinct !DILexicalBlock(scope: !85, file: !12, line: 71, column: 5)
!109 = !DILocation(line: 72, column: 16, scope: !108)
!110 = !DILocation(line: 72, column: 24, scope: !108)
!111 = !DILocation(line: 72, column: 23, scope: !108)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !12, line: 74, type: !25)
!113 = distinct !DILexicalBlock(scope: !108, file: !12, line: 73, column: 9)
!114 = !DILocation(line: 74, column: 18, scope: !113)
!115 = !DILocation(line: 75, column: 13, scope: !113)
!116 = !DILocation(line: 76, column: 13, scope: !113)
!117 = !DILocation(line: 76, column: 25, scope: !113)
!118 = !DILocation(line: 78, column: 21, scope: !113)
!119 = !DILocation(line: 78, column: 27, scope: !113)
!120 = !DILocation(line: 78, column: 40, scope: !113)
!121 = !DILocation(line: 78, column: 33, scope: !113)
!122 = !DILocation(line: 78, column: 13, scope: !113)
!123 = !DILocation(line: 80, column: 13, scope: !113)
!124 = !DILocation(line: 80, column: 25, scope: !113)
!125 = !DILocation(line: 81, column: 23, scope: !113)
!126 = !DILocation(line: 81, column: 13, scope: !113)
!127 = !DILocation(line: 84, column: 1, scope: !85)
