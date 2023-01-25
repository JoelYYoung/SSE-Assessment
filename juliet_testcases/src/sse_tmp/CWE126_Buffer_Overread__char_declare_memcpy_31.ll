; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data4 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay3, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = load i8*, i8** %data, align 8, !dbg !40
  store i8* %0, i8** %dataCopy, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !41, metadata !DIExpression()), !dbg !42
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !43
  store i8* %1, i8** %data4, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx6, align 1, !dbg !49
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %2 = load i8*, i8** %data4, align 8, !dbg !51
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %call = call i64 @strlen(i8* %arraydecay8) #7, !dbg !53
  %mul = mul i64 %call, 1, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay7, i8* align 1 %2, i64 %mul, i1 false), !dbg !50
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx9, align 1, !dbg !56
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @printLine(i8* %arraydecay10), !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_31_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__char_declare_memcpy_31_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__char_declare_memcpy_31_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data4 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !89
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !92
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx2, align 1, !dbg !94
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  store i8* %arraydecay3, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !97, metadata !DIExpression()), !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  store i8* %0, i8** %dataCopy, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !101, metadata !DIExpression()), !dbg !102
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !103
  store i8* %1, i8** %data4, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx6, align 1, !dbg !109
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  %2 = load i8*, i8** %data4, align 8, !dbg !111
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  %call = call i64 @strlen(i8* %arraydecay8) #7, !dbg !113
  %mul = mul i64 %call, 1, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay7, i8* align 1 %2, i64 %mul, i1 false), !dbg !110
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx9, align 1, !dbg !116
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  call void @printLine(i8* %arraydecay10), !dbg !118
  ret void, !dbg !119
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 33, column: 12, scope: !11)
!36 = !DILocation(line: 33, column: 10, scope: !11)
!37 = !DILocalVariable(name: "dataCopy", scope: !38, file: !12, line: 35, type: !16)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!39 = !DILocation(line: 35, column: 16, scope: !38)
!40 = !DILocation(line: 35, column: 27, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !12, line: 36, type: !16)
!42 = !DILocation(line: 36, column: 16, scope: !38)
!43 = !DILocation(line: 36, column: 23, scope: !38)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 38, type: !25)
!45 = distinct !DILexicalBlock(scope: !38, file: !12, line: 37, column: 9)
!46 = !DILocation(line: 38, column: 18, scope: !45)
!47 = !DILocation(line: 39, column: 13, scope: !45)
!48 = !DILocation(line: 40, column: 13, scope: !45)
!49 = !DILocation(line: 40, column: 25, scope: !45)
!50 = !DILocation(line: 43, column: 13, scope: !45)
!51 = !DILocation(line: 43, column: 26, scope: !45)
!52 = !DILocation(line: 43, column: 39, scope: !45)
!53 = !DILocation(line: 43, column: 32, scope: !45)
!54 = !DILocation(line: 43, column: 44, scope: !45)
!55 = !DILocation(line: 44, column: 13, scope: !45)
!56 = !DILocation(line: 44, column: 25, scope: !45)
!57 = !DILocation(line: 45, column: 23, scope: !45)
!58 = !DILocation(line: 45, column: 13, scope: !45)
!59 = !DILocation(line: 48, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_31_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 84, column: 5, scope: !60)
!62 = !DILocation(line: 85, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !64, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 96, type: !66)
!69 = !DILocation(line: 96, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 96, type: !67)
!71 = !DILocation(line: 96, column: 27, scope: !63)
!72 = !DILocation(line: 99, column: 22, scope: !63)
!73 = !DILocation(line: 99, column: 12, scope: !63)
!74 = !DILocation(line: 99, column: 5, scope: !63)
!75 = !DILocation(line: 101, column: 5, scope: !63)
!76 = !DILocation(line: 102, column: 5, scope: !63)
!77 = !DILocation(line: 103, column: 5, scope: !63)
!78 = !DILocation(line: 106, column: 5, scope: !63)
!79 = !DILocation(line: 107, column: 5, scope: !63)
!80 = !DILocation(line: 108, column: 5, scope: !63)
!81 = !DILocation(line: 110, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 57, type: !16)
!84 = !DILocation(line: 57, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 58, type: !20)
!86 = !DILocation(line: 58, column: 10, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 59, type: !25)
!88 = !DILocation(line: 59, column: 10, scope: !82)
!89 = !DILocation(line: 60, column: 5, scope: !82)
!90 = !DILocation(line: 61, column: 5, scope: !82)
!91 = !DILocation(line: 61, column: 25, scope: !82)
!92 = !DILocation(line: 62, column: 5, scope: !82)
!93 = !DILocation(line: 63, column: 5, scope: !82)
!94 = !DILocation(line: 63, column: 27, scope: !82)
!95 = !DILocation(line: 65, column: 12, scope: !82)
!96 = !DILocation(line: 65, column: 10, scope: !82)
!97 = !DILocalVariable(name: "dataCopy", scope: !98, file: !12, line: 67, type: !16)
!98 = distinct !DILexicalBlock(scope: !82, file: !12, line: 66, column: 5)
!99 = !DILocation(line: 67, column: 16, scope: !98)
!100 = !DILocation(line: 67, column: 27, scope: !98)
!101 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 68, type: !16)
!102 = !DILocation(line: 68, column: 16, scope: !98)
!103 = !DILocation(line: 68, column: 23, scope: !98)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !12, line: 70, type: !25)
!105 = distinct !DILexicalBlock(scope: !98, file: !12, line: 69, column: 9)
!106 = !DILocation(line: 70, column: 18, scope: !105)
!107 = !DILocation(line: 71, column: 13, scope: !105)
!108 = !DILocation(line: 72, column: 13, scope: !105)
!109 = !DILocation(line: 72, column: 25, scope: !105)
!110 = !DILocation(line: 75, column: 13, scope: !105)
!111 = !DILocation(line: 75, column: 26, scope: !105)
!112 = !DILocation(line: 75, column: 39, scope: !105)
!113 = !DILocation(line: 75, column: 32, scope: !105)
!114 = !DILocation(line: 75, column: 44, scope: !105)
!115 = !DILocation(line: 76, column: 13, scope: !105)
!116 = !DILocation(line: 76, column: 25, scope: !105)
!117 = !DILocation(line: 77, column: 23, scope: !105)
!118 = !DILocation(line: 77, column: 13, scope: !105)
!119 = !DILocation(line: 80, column: 1, scope: !82)
