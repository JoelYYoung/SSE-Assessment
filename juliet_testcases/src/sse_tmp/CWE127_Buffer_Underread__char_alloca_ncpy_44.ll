; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void %4(i8* %5), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %0 = load i8*, i8** %data.addr, align 8, !dbg !50
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !52
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %0, i64 %call) #7, !dbg !53
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx4, align 1, !dbg !55
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay5), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_44_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_44_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_44_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !84, metadata !DIExpression()), !dbg !85
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 100, align 16, !dbg !88
  store i8* %0, i8** %dataBuffer, align 8, !dbg !87
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !90
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  store i8* %3, i8** %data, align 8, !dbg !94
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  call void %4(i8* %5), !dbg !95
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  %0 = load i8*, i8** %data.addr, align 8, !dbg !108
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !110
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %0, i64 %call) #7, !dbg !111
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx4, align 1, !dbg !113
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @printLine(i8* %arraydecay5), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_44_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 41, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 42, type: !4)
!25 = !DILocation(line: 42, column: 12, scope: !13)
!26 = !DILocation(line: 42, column: 33, scope: !13)
!27 = !DILocation(line: 43, column: 12, scope: !13)
!28 = !DILocation(line: 43, column: 5, scope: !13)
!29 = !DILocation(line: 44, column: 5, scope: !13)
!30 = !DILocation(line: 44, column: 23, scope: !13)
!31 = !DILocation(line: 46, column: 12, scope: !13)
!32 = !DILocation(line: 46, column: 23, scope: !13)
!33 = !DILocation(line: 46, column: 10, scope: !13)
!34 = !DILocation(line: 48, column: 5, scope: !13)
!35 = !DILocation(line: 48, column: 13, scope: !13)
!36 = !DILocation(line: 49, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 23, type: !4)
!39 = !DILocation(line: 23, column: 28, scope: !37)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 26, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 25, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 26, column: 14, scope: !41)
!46 = !DILocation(line: 27, column: 9, scope: !41)
!47 = !DILocation(line: 28, column: 9, scope: !41)
!48 = !DILocation(line: 28, column: 21, scope: !41)
!49 = !DILocation(line: 30, column: 17, scope: !41)
!50 = !DILocation(line: 30, column: 23, scope: !41)
!51 = !DILocation(line: 30, column: 36, scope: !41)
!52 = !DILocation(line: 30, column: 29, scope: !41)
!53 = !DILocation(line: 30, column: 9, scope: !41)
!54 = !DILocation(line: 32, column: 9, scope: !41)
!55 = !DILocation(line: 32, column: 21, scope: !41)
!56 = !DILocation(line: 33, column: 19, scope: !41)
!57 = !DILocation(line: 33, column: 9, scope: !41)
!58 = !DILocation(line: 35, column: 1, scope: !37)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_44_good", scope: !14, file: !14, line: 82, type: !15, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 84, column: 5, scope: !59)
!61 = !DILocation(line: 85, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 96, type: !63, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 96, type: !65)
!68 = !DILocation(line: 96, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 96, type: !66)
!70 = !DILocation(line: 96, column: 27, scope: !62)
!71 = !DILocation(line: 99, column: 22, scope: !62)
!72 = !DILocation(line: 99, column: 12, scope: !62)
!73 = !DILocation(line: 99, column: 5, scope: !62)
!74 = !DILocation(line: 101, column: 5, scope: !62)
!75 = !DILocation(line: 102, column: 5, scope: !62)
!76 = !DILocation(line: 103, column: 5, scope: !62)
!77 = !DILocation(line: 106, column: 5, scope: !62)
!78 = !DILocation(line: 107, column: 5, scope: !62)
!79 = !DILocation(line: 108, column: 5, scope: !62)
!80 = !DILocation(line: 110, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !14, line: 72, type: !4)
!83 = !DILocation(line: 72, column: 12, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !14, line: 73, type: !20)
!85 = !DILocation(line: 73, column: 12, scope: !81)
!86 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !14, line: 74, type: !4)
!87 = !DILocation(line: 74, column: 12, scope: !81)
!88 = !DILocation(line: 74, column: 33, scope: !81)
!89 = !DILocation(line: 75, column: 12, scope: !81)
!90 = !DILocation(line: 75, column: 5, scope: !81)
!91 = !DILocation(line: 76, column: 5, scope: !81)
!92 = !DILocation(line: 76, column: 23, scope: !81)
!93 = !DILocation(line: 78, column: 12, scope: !81)
!94 = !DILocation(line: 78, column: 10, scope: !81)
!95 = !DILocation(line: 79, column: 5, scope: !81)
!96 = !DILocation(line: 79, column: 13, scope: !81)
!97 = !DILocation(line: 80, column: 1, scope: !81)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 56, type: !21, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !14, line: 56, type: !4)
!100 = !DILocation(line: 56, column: 32, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !14, line: 59, type: !42)
!102 = distinct !DILexicalBlock(scope: !98, file: !14, line: 58, column: 5)
!103 = !DILocation(line: 59, column: 14, scope: !102)
!104 = !DILocation(line: 60, column: 9, scope: !102)
!105 = !DILocation(line: 61, column: 9, scope: !102)
!106 = !DILocation(line: 61, column: 21, scope: !102)
!107 = !DILocation(line: 63, column: 17, scope: !102)
!108 = !DILocation(line: 63, column: 23, scope: !102)
!109 = !DILocation(line: 63, column: 36, scope: !102)
!110 = !DILocation(line: 63, column: 29, scope: !102)
!111 = !DILocation(line: 63, column: 9, scope: !102)
!112 = !DILocation(line: 65, column: 9, scope: !102)
!113 = !DILocation(line: 65, column: 21, scope: !102)
!114 = !DILocation(line: 66, column: 19, scope: !102)
!115 = !DILocation(line: 66, column: 9, scope: !102)
!116 = !DILocation(line: 68, column: 1, scope: !98)
