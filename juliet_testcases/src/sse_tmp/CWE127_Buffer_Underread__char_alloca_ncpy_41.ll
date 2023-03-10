; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !25
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !28
  %0 = load i8*, i8** %data.addr, align 8, !dbg !29
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !30
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !31
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %0, i64 %call) #7, !dbg !32
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx4, align 1, !dbg !34
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @printLine(i8* %arraydecay5), !dbg !36
  ret void, !dbg !37
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = alloca i8, i64 100, align 16, !dbg !45
  store i8* %0, i8** %dataBuffer, align 8, !dbg !44
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !47
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !50
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !51
  store i8* %add.ptr, i8** %data, align 8, !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_41_badSink(i8* %4), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !59, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !62
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  %0 = load i8*, i8** %data.addr, align 8, !dbg !66
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !68
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %0, i64 %call) #7, !dbg !69
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !70
  store i8 0, i8* %arrayidx4, align 1, !dbg !71
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !72
  call void @printLine(i8* %arraydecay5), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_41_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_41_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_41_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 100, align 16, !dbg !102
  store i8* %0, i8** %dataBuffer, align 8, !dbg !101
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !104
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %3, i8** %data, align 8, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_41_goodG2BSink(i8* %4), !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 66, scope: !13)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 27, column: 9, scope: !20)
!26 = !DILocation(line: 28, column: 9, scope: !20)
!27 = !DILocation(line: 28, column: 21, scope: !20)
!28 = !DILocation(line: 30, column: 17, scope: !20)
!29 = !DILocation(line: 30, column: 23, scope: !20)
!30 = !DILocation(line: 30, column: 36, scope: !20)
!31 = !DILocation(line: 30, column: 29, scope: !20)
!32 = !DILocation(line: 30, column: 9, scope: !20)
!33 = !DILocation(line: 32, column: 9, scope: !20)
!34 = !DILocation(line: 32, column: 21, scope: !20)
!35 = !DILocation(line: 33, column: 19, scope: !20)
!36 = !DILocation(line: 33, column: 9, scope: !20)
!37 = !DILocation(line: 35, column: 1, scope: !13)
!38 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_41_bad", scope: !14, file: !14, line: 37, type: !39, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !14, line: 39, type: !4)
!42 = !DILocation(line: 39, column: 12, scope: !38)
!43 = !DILocalVariable(name: "dataBuffer", scope: !38, file: !14, line: 40, type: !4)
!44 = !DILocation(line: 40, column: 12, scope: !38)
!45 = !DILocation(line: 40, column: 33, scope: !38)
!46 = !DILocation(line: 41, column: 12, scope: !38)
!47 = !DILocation(line: 41, column: 5, scope: !38)
!48 = !DILocation(line: 42, column: 5, scope: !38)
!49 = !DILocation(line: 42, column: 23, scope: !38)
!50 = !DILocation(line: 44, column: 12, scope: !38)
!51 = !DILocation(line: 44, column: 23, scope: !38)
!52 = !DILocation(line: 44, column: 10, scope: !38)
!53 = !DILocation(line: 45, column: 58, scope: !38)
!54 = !DILocation(line: 45, column: 5, scope: !38)
!55 = !DILocation(line: 46, column: 1, scope: !38)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_41_goodG2BSink", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !14, line: 52, type: !4)
!58 = !DILocation(line: 52, column: 70, scope: !56)
!59 = !DILocalVariable(name: "dest", scope: !60, file: !14, line: 55, type: !21)
!60 = distinct !DILexicalBlock(scope: !56, file: !14, line: 54, column: 5)
!61 = !DILocation(line: 55, column: 14, scope: !60)
!62 = !DILocation(line: 56, column: 9, scope: !60)
!63 = !DILocation(line: 57, column: 9, scope: !60)
!64 = !DILocation(line: 57, column: 21, scope: !60)
!65 = !DILocation(line: 59, column: 17, scope: !60)
!66 = !DILocation(line: 59, column: 23, scope: !60)
!67 = !DILocation(line: 59, column: 36, scope: !60)
!68 = !DILocation(line: 59, column: 29, scope: !60)
!69 = !DILocation(line: 59, column: 9, scope: !60)
!70 = !DILocation(line: 61, column: 9, scope: !60)
!71 = !DILocation(line: 61, column: 21, scope: !60)
!72 = !DILocation(line: 62, column: 19, scope: !60)
!73 = !DILocation(line: 62, column: 9, scope: !60)
!74 = !DILocation(line: 64, column: 1, scope: !56)
!75 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_41_good", scope: !14, file: !14, line: 78, type: !39, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 80, column: 5, scope: !75)
!77 = !DILocation(line: 81, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 93, type: !79, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !14, line: 93, type: !81)
!84 = !DILocation(line: 93, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !14, line: 93, type: !82)
!86 = !DILocation(line: 93, column: 27, scope: !78)
!87 = !DILocation(line: 96, column: 22, scope: !78)
!88 = !DILocation(line: 96, column: 12, scope: !78)
!89 = !DILocation(line: 96, column: 5, scope: !78)
!90 = !DILocation(line: 98, column: 5, scope: !78)
!91 = !DILocation(line: 99, column: 5, scope: !78)
!92 = !DILocation(line: 100, column: 5, scope: !78)
!93 = !DILocation(line: 103, column: 5, scope: !78)
!94 = !DILocation(line: 104, column: 5, scope: !78)
!95 = !DILocation(line: 105, column: 5, scope: !78)
!96 = !DILocation(line: 107, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 67, type: !39, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 69, type: !4)
!99 = !DILocation(line: 69, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !14, line: 70, type: !4)
!101 = !DILocation(line: 70, column: 12, scope: !97)
!102 = !DILocation(line: 70, column: 33, scope: !97)
!103 = !DILocation(line: 71, column: 12, scope: !97)
!104 = !DILocation(line: 71, column: 5, scope: !97)
!105 = !DILocation(line: 72, column: 5, scope: !97)
!106 = !DILocation(line: 72, column: 23, scope: !97)
!107 = !DILocation(line: 74, column: 12, scope: !97)
!108 = !DILocation(line: 74, column: 10, scope: !97)
!109 = !DILocation(line: 75, column: 62, scope: !97)
!110 = !DILocation(line: 75, column: 5, scope: !97)
!111 = !DILocation(line: 76, column: 1, scope: !97)
