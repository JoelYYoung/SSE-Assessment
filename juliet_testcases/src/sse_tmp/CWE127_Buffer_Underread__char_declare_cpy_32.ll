; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 199, i1 false), !dbg !54
  %arrayidx5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !55
  store i8 0, i8* %arrayidx5, align 1, !dbg !56
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !57
  %6 = load i8*, i8** %data3, align 8, !dbg !58
  %call = call i8* @strcpy(i8* %arraydecay6, i8* %6) #5, !dbg !59
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay7), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_32_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__char_declare_cpy_32_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE127_Buffer_Underread__char_declare_cpy_32_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !93
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !99
  %1 = load i8*, i8** %0, align 8, !dbg !100
  store i8* %1, i8** %data1, align 8, !dbg !98
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay2, i8** %data1, align 8, !dbg !102
  %2 = load i8*, i8** %data1, align 8, !dbg !103
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !104
  store i8* %2, i8** %3, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !106, metadata !DIExpression()), !dbg !108
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !109
  %5 = load i8*, i8** %4, align 8, !dbg !110
  store i8* %5, i8** %data3, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 199, i1 false), !dbg !114
  %arrayidx5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !115
  store i8 0, i8* %arrayidx5, align 1, !dbg !116
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !117
  %6 = load i8*, i8** %data3, align 8, !dbg !118
  %call = call i8* @strcpy(i8* %arraydecay6, i8* %6) #5, !dbg !119
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @printLine(i8* %arraydecay7), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 39, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 200)
!53 = !DILocation(line: 40, column: 18, scope: !49)
!54 = !DILocation(line: 41, column: 13, scope: !49)
!55 = !DILocation(line: 42, column: 13, scope: !49)
!56 = !DILocation(line: 42, column: 27, scope: !49)
!57 = !DILocation(line: 44, column: 20, scope: !49)
!58 = !DILocation(line: 44, column: 26, scope: !49)
!59 = !DILocation(line: 44, column: 13, scope: !49)
!60 = !DILocation(line: 45, column: 23, scope: !49)
!61 = !DILocation(line: 45, column: 13, scope: !49)
!62 = !DILocation(line: 48, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_32_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 84, column: 5, scope: !63)
!65 = !DILocation(line: 85, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !67, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !20}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 96, type: !69)
!71 = !DILocation(line: 96, column: 14, scope: !66)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 96, type: !20)
!73 = !DILocation(line: 96, column: 27, scope: !66)
!74 = !DILocation(line: 99, column: 22, scope: !66)
!75 = !DILocation(line: 99, column: 12, scope: !66)
!76 = !DILocation(line: 99, column: 5, scope: !66)
!77 = !DILocation(line: 101, column: 5, scope: !66)
!78 = !DILocation(line: 102, column: 5, scope: !66)
!79 = !DILocation(line: 103, column: 5, scope: !66)
!80 = !DILocation(line: 106, column: 5, scope: !66)
!81 = !DILocation(line: 107, column: 5, scope: !66)
!82 = !DILocation(line: 108, column: 5, scope: !66)
!83 = !DILocation(line: 110, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 57, type: !16)
!86 = !DILocation(line: 57, column: 12, scope: !84)
!87 = !DILocalVariable(name: "dataPtr1", scope: !84, file: !12, line: 58, type: !20)
!88 = !DILocation(line: 58, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataPtr2", scope: !84, file: !12, line: 59, type: !20)
!90 = !DILocation(line: 59, column: 13, scope: !84)
!91 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !12, line: 60, type: !25)
!92 = !DILocation(line: 60, column: 10, scope: !84)
!93 = !DILocation(line: 61, column: 5, scope: !84)
!94 = !DILocation(line: 62, column: 5, scope: !84)
!95 = !DILocation(line: 62, column: 23, scope: !84)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 64, type: !16)
!97 = distinct !DILexicalBlock(scope: !84, file: !12, line: 63, column: 5)
!98 = !DILocation(line: 64, column: 16, scope: !97)
!99 = !DILocation(line: 64, column: 24, scope: !97)
!100 = !DILocation(line: 64, column: 23, scope: !97)
!101 = !DILocation(line: 66, column: 16, scope: !97)
!102 = !DILocation(line: 66, column: 14, scope: !97)
!103 = !DILocation(line: 67, column: 21, scope: !97)
!104 = !DILocation(line: 67, column: 10, scope: !97)
!105 = !DILocation(line: 67, column: 19, scope: !97)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 70, type: !16)
!107 = distinct !DILexicalBlock(scope: !84, file: !12, line: 69, column: 5)
!108 = !DILocation(line: 70, column: 16, scope: !107)
!109 = !DILocation(line: 70, column: 24, scope: !107)
!110 = !DILocation(line: 70, column: 23, scope: !107)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 72, type: !50)
!112 = distinct !DILexicalBlock(scope: !107, file: !12, line: 71, column: 9)
!113 = !DILocation(line: 72, column: 18, scope: !112)
!114 = !DILocation(line: 73, column: 13, scope: !112)
!115 = !DILocation(line: 74, column: 13, scope: !112)
!116 = !DILocation(line: 74, column: 27, scope: !112)
!117 = !DILocation(line: 76, column: 20, scope: !112)
!118 = !DILocation(line: 76, column: 26, scope: !112)
!119 = !DILocation(line: 76, column: 13, scope: !112)
!120 = !DILocation(line: 77, column: 23, scope: !112)
!121 = !DILocation(line: 77, column: 13, scope: !112)
!122 = !DILocation(line: 80, column: 1, scope: !84)
