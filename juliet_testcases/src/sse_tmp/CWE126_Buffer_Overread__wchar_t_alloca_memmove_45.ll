; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  store i32* %8, i32** %data, align 8, !dbg !43
  %9 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_badData, align 8, !dbg !45
  call void @badSink(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_badData, align 8, !dbg !74
  store i32* %0, i32** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !75, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !81
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !82
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !85
  %2 = load i32*, i32** %data, align 8, !dbg !86
  %3 = bitcast i32* %2 to i8*, !dbg !85
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !88
  %mul = mul i64 %call3, 4, !dbg !89
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !85
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx4, align 4, !dbg !91
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !92
  call void @printWLine(i32* %arraydecay5), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 200, align 16, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %2 = alloca i8, i64 400, align 16, !dbg !104
  %3 = bitcast i8* %2 to i32*, !dbg !105
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !103
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !107
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !111
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !112
  store i32 0, i32* %arrayidx2, align 4, !dbg !113
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %8, i32** %data, align 8, !dbg !115
  %9 = load i32*, i32** %data, align 8, !dbg !116
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_goodG2BData, align 8, !dbg !117
  call void @goodG2BSink(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_goodG2BData, align 8, !dbg !123
  store i32* %0, i32** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !131
  %2 = load i32*, i32** %data, align 8, !dbg !132
  %3 = bitcast i32* %2 to i8*, !dbg !131
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !134
  %mul = mul i64 %call3, 4, !dbg !135
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !131
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx4, align 4, !dbg !137
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  call void @printWLine(i32* %arraydecay5), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_bad", scope: !14, file: !14, line: 41, type: !22, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 43, type: !6)
!25 = !DILocation(line: 43, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 44, type: !6)
!27 = !DILocation(line: 44, column: 15, scope: !21)
!28 = !DILocation(line: 44, column: 42, scope: !21)
!29 = !DILocation(line: 44, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 45, type: !6)
!31 = !DILocation(line: 45, column: 15, scope: !21)
!32 = !DILocation(line: 45, column: 43, scope: !21)
!33 = !DILocation(line: 45, column: 32, scope: !21)
!34 = !DILocation(line: 46, column: 13, scope: !21)
!35 = !DILocation(line: 46, column: 5, scope: !21)
!36 = !DILocation(line: 47, column: 5, scope: !21)
!37 = !DILocation(line: 47, column: 25, scope: !21)
!38 = !DILocation(line: 48, column: 13, scope: !21)
!39 = !DILocation(line: 48, column: 5, scope: !21)
!40 = !DILocation(line: 49, column: 5, scope: !21)
!41 = !DILocation(line: 49, column: 27, scope: !21)
!42 = !DILocation(line: 51, column: 12, scope: !21)
!43 = !DILocation(line: 51, column: 10, scope: !21)
!44 = !DILocation(line: 52, column: 65, scope: !21)
!45 = !DILocation(line: 52, column: 63, scope: !21)
!46 = !DILocation(line: 53, column: 5, scope: !21)
!47 = !DILocation(line: 54, column: 1, scope: !21)
!48 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_45_good", scope: !14, file: !14, line: 91, type: !22, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 93, column: 5, scope: !48)
!50 = !DILocation(line: 94, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 105, type: !52, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!9, !9, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 105, type: !9)
!58 = !DILocation(line: 105, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 105, type: !54)
!60 = !DILocation(line: 105, column: 27, scope: !51)
!61 = !DILocation(line: 108, column: 22, scope: !51)
!62 = !DILocation(line: 108, column: 12, scope: !51)
!63 = !DILocation(line: 108, column: 5, scope: !51)
!64 = !DILocation(line: 110, column: 5, scope: !51)
!65 = !DILocation(line: 111, column: 5, scope: !51)
!66 = !DILocation(line: 112, column: 5, scope: !51)
!67 = !DILocation(line: 115, column: 5, scope: !51)
!68 = !DILocation(line: 116, column: 5, scope: !51)
!69 = !DILocation(line: 117, column: 5, scope: !51)
!70 = !DILocation(line: 119, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 28, type: !6)
!73 = !DILocation(line: 28, column: 15, scope: !71)
!74 = !DILocation(line: 28, column: 22, scope: !71)
!75 = !DILocalVariable(name: "dest", scope: !76, file: !14, line: 30, type: !77)
!76 = distinct !DILexicalBlock(scope: !71, file: !14, line: 29, column: 5)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 100)
!80 = !DILocation(line: 30, column: 17, scope: !76)
!81 = !DILocation(line: 31, column: 17, scope: !76)
!82 = !DILocation(line: 31, column: 9, scope: !76)
!83 = !DILocation(line: 32, column: 9, scope: !76)
!84 = !DILocation(line: 32, column: 21, scope: !76)
!85 = !DILocation(line: 35, column: 9, scope: !76)
!86 = !DILocation(line: 35, column: 23, scope: !76)
!87 = !DILocation(line: 35, column: 36, scope: !76)
!88 = !DILocation(line: 35, column: 29, scope: !76)
!89 = !DILocation(line: 35, column: 41, scope: !76)
!90 = !DILocation(line: 36, column: 9, scope: !76)
!91 = !DILocation(line: 36, column: 21, scope: !76)
!92 = !DILocation(line: 37, column: 20, scope: !76)
!93 = !DILocation(line: 37, column: 9, scope: !76)
!94 = !DILocation(line: 39, column: 1, scope: !71)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 76, type: !22, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 78, type: !6)
!97 = !DILocation(line: 78, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !14, line: 79, type: !6)
!99 = !DILocation(line: 79, column: 15, scope: !95)
!100 = !DILocation(line: 79, column: 42, scope: !95)
!101 = !DILocation(line: 79, column: 31, scope: !95)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !14, line: 80, type: !6)
!103 = !DILocation(line: 80, column: 15, scope: !95)
!104 = !DILocation(line: 80, column: 43, scope: !95)
!105 = !DILocation(line: 80, column: 32, scope: !95)
!106 = !DILocation(line: 81, column: 13, scope: !95)
!107 = !DILocation(line: 81, column: 5, scope: !95)
!108 = !DILocation(line: 82, column: 5, scope: !95)
!109 = !DILocation(line: 82, column: 25, scope: !95)
!110 = !DILocation(line: 83, column: 13, scope: !95)
!111 = !DILocation(line: 83, column: 5, scope: !95)
!112 = !DILocation(line: 84, column: 5, scope: !95)
!113 = !DILocation(line: 84, column: 27, scope: !95)
!114 = !DILocation(line: 86, column: 12, scope: !95)
!115 = !DILocation(line: 86, column: 10, scope: !95)
!116 = !DILocation(line: 87, column: 69, scope: !95)
!117 = !DILocation(line: 87, column: 67, scope: !95)
!118 = !DILocation(line: 88, column: 5, scope: !95)
!119 = !DILocation(line: 89, column: 1, scope: !95)
!120 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !14, line: 63, type: !6)
!122 = !DILocation(line: 63, column: 15, scope: !120)
!123 = !DILocation(line: 63, column: 22, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !14, line: 65, type: !77)
!125 = distinct !DILexicalBlock(scope: !120, file: !14, line: 64, column: 5)
!126 = !DILocation(line: 65, column: 17, scope: !125)
!127 = !DILocation(line: 66, column: 17, scope: !125)
!128 = !DILocation(line: 66, column: 9, scope: !125)
!129 = !DILocation(line: 67, column: 9, scope: !125)
!130 = !DILocation(line: 67, column: 21, scope: !125)
!131 = !DILocation(line: 70, column: 9, scope: !125)
!132 = !DILocation(line: 70, column: 23, scope: !125)
!133 = !DILocation(line: 70, column: 36, scope: !125)
!134 = !DILocation(line: 70, column: 29, scope: !125)
!135 = !DILocation(line: 70, column: 41, scope: !125)
!136 = !DILocation(line: 71, column: 9, scope: !125)
!137 = !DILocation(line: 71, column: 21, scope: !125)
!138 = !DILocation(line: 72, column: 20, scope: !125)
!139 = !DILocation(line: 72, column: 9, scope: !125)
!140 = !DILocation(line: 74, column: 1, scope: !120)
