; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_41_badSink(i8* %data) #0 !dbg !13 {
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
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !31
  %mul = mul i64 %call, 1, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !28
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx3, align 1, !dbg !34
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @printLine(i8* %arraydecay4), !dbg !36
  ret void, !dbg !37
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
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = alloca i8, i64 50, align 16, !dbg !45
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !46, metadata !DIExpression()), !dbg !47
  %1 = alloca i8, i64 100, align 16, !dbg !48
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !47
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !50
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !51
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !54
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !55
  store i8 0, i8* %arrayidx1, align 1, !dbg !56
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !57
  store i8* %6, i8** %data, align 8, !dbg !58
  %7 = load i8*, i8** %data, align 8, !dbg !59
  call void @CWE126_Buffer_Overread__char_alloca_memmove_41_badSink(i8* %7), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_41_goodG2BSink(i8* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !65, metadata !DIExpression()), !dbg !67
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !68
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !71
  %0 = load i8*, i8** %data.addr, align 8, !dbg !72
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !74
  %mul = mul i64 %call, 1, !dbg !75
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !71
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx3, align 1, !dbg !77
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* %arraydecay4), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_41_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #8, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #8, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE126_Buffer_Overread__char_alloca_memmove_41_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__char_alloca_memmove_41_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 50, align 16, !dbg !108
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %1 = alloca i8, i64 100, align 16, !dbg !111
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !110
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !113
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !117
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !118
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !118
  store i8 0, i8* %arrayidx1, align 1, !dbg !119
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  store i8* %6, i8** %data, align 8, !dbg !121
  %7 = load i8*, i8** %data, align 8, !dbg !122
  call void @CWE126_Buffer_Overread__char_alloca_memmove_41_goodG2BSink(i8* %7), !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 68, scope: !13)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 27, column: 9, scope: !20)
!26 = !DILocation(line: 28, column: 9, scope: !20)
!27 = !DILocation(line: 28, column: 21, scope: !20)
!28 = !DILocation(line: 31, column: 9, scope: !20)
!29 = !DILocation(line: 31, column: 23, scope: !20)
!30 = !DILocation(line: 31, column: 36, scope: !20)
!31 = !DILocation(line: 31, column: 29, scope: !20)
!32 = !DILocation(line: 31, column: 41, scope: !20)
!33 = !DILocation(line: 32, column: 9, scope: !20)
!34 = !DILocation(line: 32, column: 21, scope: !20)
!35 = !DILocation(line: 33, column: 19, scope: !20)
!36 = !DILocation(line: 33, column: 9, scope: !20)
!37 = !DILocation(line: 35, column: 1, scope: !13)
!38 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_41_bad", scope: !14, file: !14, line: 37, type: !39, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !14, line: 39, type: !4)
!42 = !DILocation(line: 39, column: 12, scope: !38)
!43 = !DILocalVariable(name: "dataBadBuffer", scope: !38, file: !14, line: 40, type: !4)
!44 = !DILocation(line: 40, column: 12, scope: !38)
!45 = !DILocation(line: 40, column: 36, scope: !38)
!46 = !DILocalVariable(name: "dataGoodBuffer", scope: !38, file: !14, line: 41, type: !4)
!47 = !DILocation(line: 41, column: 12, scope: !38)
!48 = !DILocation(line: 41, column: 37, scope: !38)
!49 = !DILocation(line: 42, column: 12, scope: !38)
!50 = !DILocation(line: 42, column: 5, scope: !38)
!51 = !DILocation(line: 43, column: 5, scope: !38)
!52 = !DILocation(line: 43, column: 25, scope: !38)
!53 = !DILocation(line: 44, column: 12, scope: !38)
!54 = !DILocation(line: 44, column: 5, scope: !38)
!55 = !DILocation(line: 45, column: 5, scope: !38)
!56 = !DILocation(line: 45, column: 27, scope: !38)
!57 = !DILocation(line: 47, column: 12, scope: !38)
!58 = !DILocation(line: 47, column: 10, scope: !38)
!59 = !DILocation(line: 48, column: 60, scope: !38)
!60 = !DILocation(line: 48, column: 5, scope: !38)
!61 = !DILocation(line: 49, column: 1, scope: !38)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_41_goodG2BSink", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !14, line: 55, type: !4)
!64 = !DILocation(line: 55, column: 72, scope: !62)
!65 = !DILocalVariable(name: "dest", scope: !66, file: !14, line: 58, type: !21)
!66 = distinct !DILexicalBlock(scope: !62, file: !14, line: 57, column: 5)
!67 = !DILocation(line: 58, column: 14, scope: !66)
!68 = !DILocation(line: 59, column: 9, scope: !66)
!69 = !DILocation(line: 60, column: 9, scope: !66)
!70 = !DILocation(line: 60, column: 21, scope: !66)
!71 = !DILocation(line: 63, column: 9, scope: !66)
!72 = !DILocation(line: 63, column: 23, scope: !66)
!73 = !DILocation(line: 63, column: 36, scope: !66)
!74 = !DILocation(line: 63, column: 29, scope: !66)
!75 = !DILocation(line: 63, column: 41, scope: !66)
!76 = !DILocation(line: 64, column: 9, scope: !66)
!77 = !DILocation(line: 64, column: 21, scope: !66)
!78 = !DILocation(line: 65, column: 19, scope: !66)
!79 = !DILocation(line: 65, column: 9, scope: !66)
!80 = !DILocation(line: 67, column: 1, scope: !62)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_41_good", scope: !14, file: !14, line: 84, type: !39, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 86, column: 5, scope: !81)
!83 = !DILocation(line: 87, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !85, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !14, line: 99, type: !87)
!90 = !DILocation(line: 99, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !14, line: 99, type: !88)
!92 = !DILocation(line: 99, column: 27, scope: !84)
!93 = !DILocation(line: 102, column: 22, scope: !84)
!94 = !DILocation(line: 102, column: 12, scope: !84)
!95 = !DILocation(line: 102, column: 5, scope: !84)
!96 = !DILocation(line: 104, column: 5, scope: !84)
!97 = !DILocation(line: 105, column: 5, scope: !84)
!98 = !DILocation(line: 106, column: 5, scope: !84)
!99 = !DILocation(line: 109, column: 5, scope: !84)
!100 = !DILocation(line: 110, column: 5, scope: !84)
!101 = !DILocation(line: 111, column: 5, scope: !84)
!102 = !DILocation(line: 113, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 70, type: !39, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 72, type: !4)
!105 = !DILocation(line: 72, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !14, line: 73, type: !4)
!107 = !DILocation(line: 73, column: 12, scope: !103)
!108 = !DILocation(line: 73, column: 36, scope: !103)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !14, line: 74, type: !4)
!110 = !DILocation(line: 74, column: 12, scope: !103)
!111 = !DILocation(line: 74, column: 37, scope: !103)
!112 = !DILocation(line: 75, column: 12, scope: !103)
!113 = !DILocation(line: 75, column: 5, scope: !103)
!114 = !DILocation(line: 76, column: 5, scope: !103)
!115 = !DILocation(line: 76, column: 25, scope: !103)
!116 = !DILocation(line: 77, column: 12, scope: !103)
!117 = !DILocation(line: 77, column: 5, scope: !103)
!118 = !DILocation(line: 78, column: 5, scope: !103)
!119 = !DILocation(line: 78, column: 27, scope: !103)
!120 = !DILocation(line: 80, column: 12, scope: !103)
!121 = !DILocation(line: 80, column: 10, scope: !103)
!122 = !DILocation(line: 81, column: 64, scope: !103)
!123 = !DILocation(line: 81, column: 5, scope: !103)
!124 = !DILocation(line: 82, column: 1, scope: !103)
