; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx2, align 1, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !47
  %mul = mul i64 %call, 1, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !44
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_01_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #8, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #8, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__char_alloca_memmove_01_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__char_alloca_memmove_01_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 50, align 16, !dbg !81
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %1 = alloca i8, i64 100, align 16, !dbg !84
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !83
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !86
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !90
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !91
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !91
  store i8 0, i8* %arrayidx1, align 1, !dbg !92
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !93
  store i8* %6, i8** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  %7 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !104
  %mul = mul i64 %call, 1, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !101
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx5, align 1, !dbg !107
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @printLine(i8* %arraydecay6), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_01.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_01.c", directory: "/root/SSE-Assessment")
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
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 36, column: 9, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 37, column: 21, scope: !36)
!44 = !DILocation(line: 40, column: 9, scope: !36)
!45 = !DILocation(line: 40, column: 23, scope: !36)
!46 = !DILocation(line: 40, column: 36, scope: !36)
!47 = !DILocation(line: 40, column: 29, scope: !36)
!48 = !DILocation(line: 40, column: 41, scope: !36)
!49 = !DILocation(line: 41, column: 9, scope: !36)
!50 = !DILocation(line: 41, column: 21, scope: !36)
!51 = !DILocation(line: 42, column: 19, scope: !36)
!52 = !DILocation(line: 42, column: 9, scope: !36)
!53 = !DILocation(line: 44, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_01_good", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 76, column: 5, scope: !54)
!56 = !DILocation(line: 77, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 89, type: !58, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 89, type: !60)
!63 = !DILocation(line: 89, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 89, type: !61)
!65 = !DILocation(line: 89, column: 27, scope: !57)
!66 = !DILocation(line: 92, column: 22, scope: !57)
!67 = !DILocation(line: 92, column: 12, scope: !57)
!68 = !DILocation(line: 92, column: 5, scope: !57)
!69 = !DILocation(line: 94, column: 5, scope: !57)
!70 = !DILocation(line: 95, column: 5, scope: !57)
!71 = !DILocation(line: 96, column: 5, scope: !57)
!72 = !DILocation(line: 99, column: 5, scope: !57)
!73 = !DILocation(line: 100, column: 5, scope: !57)
!74 = !DILocation(line: 101, column: 5, scope: !57)
!75 = !DILocation(line: 103, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 53, type: !4)
!78 = !DILocation(line: 53, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !14, line: 54, type: !4)
!80 = !DILocation(line: 54, column: 12, scope: !76)
!81 = !DILocation(line: 54, column: 36, scope: !76)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !14, line: 55, type: !4)
!83 = !DILocation(line: 55, column: 12, scope: !76)
!84 = !DILocation(line: 55, column: 37, scope: !76)
!85 = !DILocation(line: 56, column: 12, scope: !76)
!86 = !DILocation(line: 56, column: 5, scope: !76)
!87 = !DILocation(line: 57, column: 5, scope: !76)
!88 = !DILocation(line: 57, column: 25, scope: !76)
!89 = !DILocation(line: 58, column: 12, scope: !76)
!90 = !DILocation(line: 58, column: 5, scope: !76)
!91 = !DILocation(line: 59, column: 5, scope: !76)
!92 = !DILocation(line: 59, column: 27, scope: !76)
!93 = !DILocation(line: 61, column: 12, scope: !76)
!94 = !DILocation(line: 61, column: 10, scope: !76)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !14, line: 63, type: !37)
!96 = distinct !DILexicalBlock(scope: !76, file: !14, line: 62, column: 5)
!97 = !DILocation(line: 63, column: 14, scope: !96)
!98 = !DILocation(line: 64, column: 9, scope: !96)
!99 = !DILocation(line: 65, column: 9, scope: !96)
!100 = !DILocation(line: 65, column: 21, scope: !96)
!101 = !DILocation(line: 68, column: 9, scope: !96)
!102 = !DILocation(line: 68, column: 23, scope: !96)
!103 = !DILocation(line: 68, column: 36, scope: !96)
!104 = !DILocation(line: 68, column: 29, scope: !96)
!105 = !DILocation(line: 68, column: 41, scope: !96)
!106 = !DILocation(line: 69, column: 9, scope: !96)
!107 = !DILocation(line: 69, column: 21, scope: !96)
!108 = !DILocation(line: 70, column: 19, scope: !96)
!109 = !DILocation(line: 70, column: 9, scope: !96)
!110 = !DILocation(line: 72, column: 1, scope: !76)
