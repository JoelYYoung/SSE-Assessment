; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_declare_memmove_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__char_declare_memmove_45_goodG2BData = internal global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx2, align 1, !dbg !39
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay3, i8** %data, align 8, !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  store i8* %0, i8** @CWE126_Buffer_Overread__char_declare_memmove_45_badData, align 8, !dbg !43
  call void @badSink(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_45_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #7, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #7, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__char_declare_memmove_45_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__char_declare_memmove_45_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_declare_memmove_45_badData, align 8, !dbg !71
  store i8* %0, i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !72, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !75
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  %1 = load i8*, i8** %data, align 8, !dbg !79
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  %call = call i64 @strlen(i8* %arraydecay2) #8, !dbg !81
  %mul = mul i64 %call, 1, !dbg !82
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !78
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx3, align 1, !dbg !84
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  call void @printLine(i8* %arraydecay4), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !95
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay3, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  store i8* %0, i8** @CWE126_Buffer_Overread__char_declare_memmove_45_goodG2BData, align 8, !dbg !104
  call void @goodG2BSink(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_declare_memmove_45_goodG2BData, align 8, !dbg !110
  store i8* %0, i8** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %call = call i64 @strlen(i8* %arraydecay2) #8, !dbg !120
  %mul = mul i64 %call, 1, !dbg !121
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx3, align 1, !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay4), !dbg !125
  ret void, !dbg !126
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
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_declare_memmove_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_declare_memmove_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_45_bad", scope: !10, file: !10, line: 41, type: !20, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 43, type: !11)
!23 = !DILocation(line: 43, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 44, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 44, column: 10, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 45, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 45, column: 10, scope: !19)
!34 = !DILocation(line: 46, column: 5, scope: !19)
!35 = !DILocation(line: 47, column: 5, scope: !19)
!36 = !DILocation(line: 47, column: 25, scope: !19)
!37 = !DILocation(line: 48, column: 5, scope: !19)
!38 = !DILocation(line: 49, column: 5, scope: !19)
!39 = !DILocation(line: 49, column: 27, scope: !19)
!40 = !DILocation(line: 51, column: 12, scope: !19)
!41 = !DILocation(line: 51, column: 10, scope: !19)
!42 = !DILocation(line: 52, column: 63, scope: !19)
!43 = !DILocation(line: 52, column: 61, scope: !19)
!44 = !DILocation(line: 53, column: 5, scope: !19)
!45 = !DILocation(line: 54, column: 1, scope: !19)
!46 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_45_good", scope: !10, file: !10, line: 91, type: !20, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 93, column: 5, scope: !46)
!48 = !DILocation(line: 94, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 105, type: !50, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !10, line: 105, type: !52)
!55 = !DILocation(line: 105, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !10, line: 105, type: !53)
!57 = !DILocation(line: 105, column: 27, scope: !49)
!58 = !DILocation(line: 108, column: 22, scope: !49)
!59 = !DILocation(line: 108, column: 12, scope: !49)
!60 = !DILocation(line: 108, column: 5, scope: !49)
!61 = !DILocation(line: 110, column: 5, scope: !49)
!62 = !DILocation(line: 111, column: 5, scope: !49)
!63 = !DILocation(line: 112, column: 5, scope: !49)
!64 = !DILocation(line: 115, column: 5, scope: !49)
!65 = !DILocation(line: 116, column: 5, scope: !49)
!66 = !DILocation(line: 117, column: 5, scope: !49)
!67 = !DILocation(line: 119, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 28, type: !11)
!70 = !DILocation(line: 28, column: 12, scope: !68)
!71 = !DILocation(line: 28, column: 19, scope: !68)
!72 = !DILocalVariable(name: "dest", scope: !73, file: !10, line: 30, type: !30)
!73 = distinct !DILexicalBlock(scope: !68, file: !10, line: 29, column: 5)
!74 = !DILocation(line: 30, column: 14, scope: !73)
!75 = !DILocation(line: 31, column: 9, scope: !73)
!76 = !DILocation(line: 32, column: 9, scope: !73)
!77 = !DILocation(line: 32, column: 21, scope: !73)
!78 = !DILocation(line: 35, column: 9, scope: !73)
!79 = !DILocation(line: 35, column: 23, scope: !73)
!80 = !DILocation(line: 35, column: 36, scope: !73)
!81 = !DILocation(line: 35, column: 29, scope: !73)
!82 = !DILocation(line: 35, column: 41, scope: !73)
!83 = !DILocation(line: 36, column: 9, scope: !73)
!84 = !DILocation(line: 36, column: 21, scope: !73)
!85 = !DILocation(line: 37, column: 19, scope: !73)
!86 = !DILocation(line: 37, column: 9, scope: !73)
!87 = !DILocation(line: 39, column: 1, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !10, line: 78, type: !11)
!90 = !DILocation(line: 78, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !10, line: 79, type: !25)
!92 = !DILocation(line: 79, column: 10, scope: !88)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !10, line: 80, type: !30)
!94 = !DILocation(line: 80, column: 10, scope: !88)
!95 = !DILocation(line: 81, column: 5, scope: !88)
!96 = !DILocation(line: 82, column: 5, scope: !88)
!97 = !DILocation(line: 82, column: 25, scope: !88)
!98 = !DILocation(line: 83, column: 5, scope: !88)
!99 = !DILocation(line: 84, column: 5, scope: !88)
!100 = !DILocation(line: 84, column: 27, scope: !88)
!101 = !DILocation(line: 86, column: 12, scope: !88)
!102 = !DILocation(line: 86, column: 10, scope: !88)
!103 = !DILocation(line: 87, column: 67, scope: !88)
!104 = !DILocation(line: 87, column: 65, scope: !88)
!105 = !DILocation(line: 88, column: 5, scope: !88)
!106 = !DILocation(line: 89, column: 1, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !10, line: 63, type: !11)
!109 = !DILocation(line: 63, column: 12, scope: !107)
!110 = !DILocation(line: 63, column: 19, scope: !107)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !10, line: 65, type: !30)
!112 = distinct !DILexicalBlock(scope: !107, file: !10, line: 64, column: 5)
!113 = !DILocation(line: 65, column: 14, scope: !112)
!114 = !DILocation(line: 66, column: 9, scope: !112)
!115 = !DILocation(line: 67, column: 9, scope: !112)
!116 = !DILocation(line: 67, column: 21, scope: !112)
!117 = !DILocation(line: 70, column: 9, scope: !112)
!118 = !DILocation(line: 70, column: 23, scope: !112)
!119 = !DILocation(line: 70, column: 36, scope: !112)
!120 = !DILocation(line: 70, column: 29, scope: !112)
!121 = !DILocation(line: 70, column: 41, scope: !112)
!122 = !DILocation(line: 71, column: 9, scope: !112)
!123 = !DILocation(line: 71, column: 21, scope: !112)
!124 = !DILocation(line: 72, column: 19, scope: !112)
!125 = !DILocation(line: 72, column: 9, scope: !112)
!126 = !DILocation(line: 74, column: 1, scope: !107)
