; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_alloca_memcpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__char_alloca_memcpy_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !38
  store i8* %6, i8** %data, align 8, !dbg !39
  %7 = load i8*, i8** %data, align 8, !dbg !40
  store i8* %7, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #7, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #7, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_45_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_45_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_45_badData, align 8, !dbg !69
  store i8* %0, i8** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !70, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !76
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  %1 = load i8*, i8** %data, align 8, !dbg !80
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  %call = call i64 @strlen(i8* %arraydecay2) #8, !dbg !82
  %mul = mul i64 %call, 1, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !79
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx3, align 1, !dbg !85
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay4), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 50, align 16, !dbg !94
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %1 = alloca i8, i64 100, align 16, !dbg !97
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !96
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !99
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !103
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !104
  store i8 0, i8* %arrayidx1, align 1, !dbg !105
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !106
  store i8* %6, i8** %data, align 8, !dbg !107
  %7 = load i8*, i8** %data, align 8, !dbg !108
  store i8* %7, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_45_goodG2BData, align 8, !dbg !109
  call void @goodG2BSink(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_45_goodG2BData, align 8, !dbg !115
  store i8* %0, i8** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  %1 = load i8*, i8** %data, align 8, !dbg !123
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  %call = call i64 @strlen(i8* %arraydecay2) #8, !dbg !125
  %mul = mul i64 %call, 1, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !122
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx3, align 1, !dbg !128
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @printLine(i8* %arraydecay4), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_memcpy_45_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_memcpy_45_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_45_bad", scope: !12, file: !12, line: 41, type: !20, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 43, type: !6)
!23 = !DILocation(line: 43, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 44, type: !6)
!25 = !DILocation(line: 44, column: 12, scope: !19)
!26 = !DILocation(line: 44, column: 36, scope: !19)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 45, type: !6)
!28 = !DILocation(line: 45, column: 12, scope: !19)
!29 = !DILocation(line: 45, column: 37, scope: !19)
!30 = !DILocation(line: 46, column: 12, scope: !19)
!31 = !DILocation(line: 46, column: 5, scope: !19)
!32 = !DILocation(line: 47, column: 5, scope: !19)
!33 = !DILocation(line: 47, column: 25, scope: !19)
!34 = !DILocation(line: 48, column: 12, scope: !19)
!35 = !DILocation(line: 48, column: 5, scope: !19)
!36 = !DILocation(line: 49, column: 5, scope: !19)
!37 = !DILocation(line: 49, column: 27, scope: !19)
!38 = !DILocation(line: 51, column: 12, scope: !19)
!39 = !DILocation(line: 51, column: 10, scope: !19)
!40 = !DILocation(line: 52, column: 61, scope: !19)
!41 = !DILocation(line: 52, column: 59, scope: !19)
!42 = !DILocation(line: 53, column: 5, scope: !19)
!43 = !DILocation(line: 54, column: 1, scope: !19)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_45_good", scope: !12, file: !12, line: 91, type: !20, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 93, column: 5, scope: !44)
!46 = !DILocation(line: 94, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !48, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 105, type: !50)
!53 = !DILocation(line: 105, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 105, type: !51)
!55 = !DILocation(line: 105, column: 27, scope: !47)
!56 = !DILocation(line: 108, column: 22, scope: !47)
!57 = !DILocation(line: 108, column: 12, scope: !47)
!58 = !DILocation(line: 108, column: 5, scope: !47)
!59 = !DILocation(line: 110, column: 5, scope: !47)
!60 = !DILocation(line: 111, column: 5, scope: !47)
!61 = !DILocation(line: 112, column: 5, scope: !47)
!62 = !DILocation(line: 115, column: 5, scope: !47)
!63 = !DILocation(line: 116, column: 5, scope: !47)
!64 = !DILocation(line: 117, column: 5, scope: !47)
!65 = !DILocation(line: 119, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 28, type: !6)
!68 = !DILocation(line: 28, column: 12, scope: !66)
!69 = !DILocation(line: 28, column: 19, scope: !66)
!70 = !DILocalVariable(name: "dest", scope: !71, file: !12, line: 30, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !12, line: 29, column: 5)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 100)
!75 = !DILocation(line: 30, column: 14, scope: !71)
!76 = !DILocation(line: 31, column: 9, scope: !71)
!77 = !DILocation(line: 32, column: 9, scope: !71)
!78 = !DILocation(line: 32, column: 21, scope: !71)
!79 = !DILocation(line: 35, column: 9, scope: !71)
!80 = !DILocation(line: 35, column: 22, scope: !71)
!81 = !DILocation(line: 35, column: 35, scope: !71)
!82 = !DILocation(line: 35, column: 28, scope: !71)
!83 = !DILocation(line: 35, column: 40, scope: !71)
!84 = !DILocation(line: 36, column: 9, scope: !71)
!85 = !DILocation(line: 36, column: 21, scope: !71)
!86 = !DILocation(line: 37, column: 19, scope: !71)
!87 = !DILocation(line: 37, column: 9, scope: !71)
!88 = !DILocation(line: 39, column: 1, scope: !66)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 78, type: !6)
!91 = !DILocation(line: 78, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !12, line: 79, type: !6)
!93 = !DILocation(line: 79, column: 12, scope: !89)
!94 = !DILocation(line: 79, column: 36, scope: !89)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !12, line: 80, type: !6)
!96 = !DILocation(line: 80, column: 12, scope: !89)
!97 = !DILocation(line: 80, column: 37, scope: !89)
!98 = !DILocation(line: 81, column: 12, scope: !89)
!99 = !DILocation(line: 81, column: 5, scope: !89)
!100 = !DILocation(line: 82, column: 5, scope: !89)
!101 = !DILocation(line: 82, column: 25, scope: !89)
!102 = !DILocation(line: 83, column: 12, scope: !89)
!103 = !DILocation(line: 83, column: 5, scope: !89)
!104 = !DILocation(line: 84, column: 5, scope: !89)
!105 = !DILocation(line: 84, column: 27, scope: !89)
!106 = !DILocation(line: 86, column: 12, scope: !89)
!107 = !DILocation(line: 86, column: 10, scope: !89)
!108 = !DILocation(line: 87, column: 65, scope: !89)
!109 = !DILocation(line: 87, column: 63, scope: !89)
!110 = !DILocation(line: 88, column: 5, scope: !89)
!111 = !DILocation(line: 89, column: 1, scope: !89)
!112 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 63, type: !6)
!114 = !DILocation(line: 63, column: 12, scope: !112)
!115 = !DILocation(line: 63, column: 19, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !12, line: 65, type: !72)
!117 = distinct !DILexicalBlock(scope: !112, file: !12, line: 64, column: 5)
!118 = !DILocation(line: 65, column: 14, scope: !117)
!119 = !DILocation(line: 66, column: 9, scope: !117)
!120 = !DILocation(line: 67, column: 9, scope: !117)
!121 = !DILocation(line: 67, column: 21, scope: !117)
!122 = !DILocation(line: 70, column: 9, scope: !117)
!123 = !DILocation(line: 70, column: 22, scope: !117)
!124 = !DILocation(line: 70, column: 35, scope: !117)
!125 = !DILocation(line: 70, column: 28, scope: !117)
!126 = !DILocation(line: 70, column: 40, scope: !117)
!127 = !DILocation(line: 71, column: 9, scope: !117)
!128 = !DILocation(line: 71, column: 21, scope: !117)
!129 = !DILocation(line: 72, column: 19, scope: !117)
!130 = !DILocation(line: 72, column: 9, scope: !117)
!131 = !DILocation(line: 74, column: 1, scope: !112)
