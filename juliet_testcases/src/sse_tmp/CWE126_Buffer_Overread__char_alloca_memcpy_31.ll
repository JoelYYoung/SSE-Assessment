; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %7 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %7, i8** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !39, metadata !DIExpression()), !dbg !40
  %8 = load i8*, i8** %dataCopy, align 8, !dbg !41
  store i8* %8, i8** %data2, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx3, align 1, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %9 = load i8*, i8** %data2, align 8, !dbg !52
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* %arraydecay5) #7, !dbg !54
  %mul = mul i64 %call, 1, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %9, i64 %mul, i1 false), !dbg !51
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx6, align 1, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @printLine(i8* %arraydecay7), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_31_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_31_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_31_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 50, align 16, !dbg !88
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %1 = alloca i8, i64 100, align 16, !dbg !91
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !90
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !93
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !97
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !98
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !98
  store i8 0, i8* %arrayidx1, align 1, !dbg !99
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !100
  store i8* %6, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !102, metadata !DIExpression()), !dbg !104
  %7 = load i8*, i8** %data, align 8, !dbg !105
  store i8* %7, i8** %dataCopy, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !106, metadata !DIExpression()), !dbg !107
  %8 = load i8*, i8** %dataCopy, align 8, !dbg !108
  store i8* %8, i8** %data2, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx3, align 1, !dbg !114
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  %9 = load i8*, i8** %data2, align 8, !dbg !116
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %call = call i64 @strlen(i8* %arraydecay5) #7, !dbg !118
  %mul = mul i64 %call, 1, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %9, i64 %mul, i1 false), !dbg !115
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx6, align 1, !dbg !121
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  call void @printLine(i8* %arraydecay7), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_31.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 33, column: 12, scope: !13)
!34 = !DILocation(line: 33, column: 10, scope: !13)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !14, line: 35, type: !4)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DILocation(line: 35, column: 16, scope: !36)
!38 = !DILocation(line: 35, column: 27, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !14, line: 36, type: !4)
!40 = !DILocation(line: 36, column: 16, scope: !36)
!41 = !DILocation(line: 36, column: 23, scope: !36)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 38, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !14, line: 37, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 38, column: 18, scope: !43)
!48 = !DILocation(line: 39, column: 13, scope: !43)
!49 = !DILocation(line: 40, column: 13, scope: !43)
!50 = !DILocation(line: 40, column: 25, scope: !43)
!51 = !DILocation(line: 43, column: 13, scope: !43)
!52 = !DILocation(line: 43, column: 26, scope: !43)
!53 = !DILocation(line: 43, column: 39, scope: !43)
!54 = !DILocation(line: 43, column: 32, scope: !43)
!55 = !DILocation(line: 43, column: 44, scope: !43)
!56 = !DILocation(line: 44, column: 13, scope: !43)
!57 = !DILocation(line: 44, column: 25, scope: !43)
!58 = !DILocation(line: 45, column: 23, scope: !43)
!59 = !DILocation(line: 45, column: 13, scope: !43)
!60 = !DILocation(line: 48, column: 1, scope: !13)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_31_good", scope: !14, file: !14, line: 82, type: !15, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 84, column: 5, scope: !61)
!63 = !DILocation(line: 85, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 96, type: !65, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !14, line: 96, type: !67)
!70 = !DILocation(line: 96, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !14, line: 96, type: !68)
!72 = !DILocation(line: 96, column: 27, scope: !64)
!73 = !DILocation(line: 99, column: 22, scope: !64)
!74 = !DILocation(line: 99, column: 12, scope: !64)
!75 = !DILocation(line: 99, column: 5, scope: !64)
!76 = !DILocation(line: 101, column: 5, scope: !64)
!77 = !DILocation(line: 102, column: 5, scope: !64)
!78 = !DILocation(line: 103, column: 5, scope: !64)
!79 = !DILocation(line: 106, column: 5, scope: !64)
!80 = !DILocation(line: 107, column: 5, scope: !64)
!81 = !DILocation(line: 108, column: 5, scope: !64)
!82 = !DILocation(line: 110, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 57, type: !4)
!85 = !DILocation(line: 57, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !14, line: 58, type: !4)
!87 = !DILocation(line: 58, column: 12, scope: !83)
!88 = !DILocation(line: 58, column: 36, scope: !83)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !14, line: 59, type: !4)
!90 = !DILocation(line: 59, column: 12, scope: !83)
!91 = !DILocation(line: 59, column: 37, scope: !83)
!92 = !DILocation(line: 60, column: 12, scope: !83)
!93 = !DILocation(line: 60, column: 5, scope: !83)
!94 = !DILocation(line: 61, column: 5, scope: !83)
!95 = !DILocation(line: 61, column: 25, scope: !83)
!96 = !DILocation(line: 62, column: 12, scope: !83)
!97 = !DILocation(line: 62, column: 5, scope: !83)
!98 = !DILocation(line: 63, column: 5, scope: !83)
!99 = !DILocation(line: 63, column: 27, scope: !83)
!100 = !DILocation(line: 65, column: 12, scope: !83)
!101 = !DILocation(line: 65, column: 10, scope: !83)
!102 = !DILocalVariable(name: "dataCopy", scope: !103, file: !14, line: 67, type: !4)
!103 = distinct !DILexicalBlock(scope: !83, file: !14, line: 66, column: 5)
!104 = !DILocation(line: 67, column: 16, scope: !103)
!105 = !DILocation(line: 67, column: 27, scope: !103)
!106 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 68, type: !4)
!107 = !DILocation(line: 68, column: 16, scope: !103)
!108 = !DILocation(line: 68, column: 23, scope: !103)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !14, line: 70, type: !44)
!110 = distinct !DILexicalBlock(scope: !103, file: !14, line: 69, column: 9)
!111 = !DILocation(line: 70, column: 18, scope: !110)
!112 = !DILocation(line: 71, column: 13, scope: !110)
!113 = !DILocation(line: 72, column: 13, scope: !110)
!114 = !DILocation(line: 72, column: 25, scope: !110)
!115 = !DILocation(line: 75, column: 13, scope: !110)
!116 = !DILocation(line: 75, column: 26, scope: !110)
!117 = !DILocation(line: 75, column: 39, scope: !110)
!118 = !DILocation(line: 75, column: 32, scope: !110)
!119 = !DILocation(line: 75, column: 44, scope: !110)
!120 = !DILocation(line: 76, column: 13, scope: !110)
!121 = !DILocation(line: 76, column: 25, scope: !110)
!122 = !DILocation(line: 77, column: 23, scope: !110)
!123 = !DILocation(line: 77, column: 13, scope: !110)
!124 = !DILocation(line: 80, column: 1, scope: !83)
