; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_18_bad() #0 !dbg !13 {
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
  br label %source, !dbg !33

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !34), !dbg !35
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %6, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx2, align 1, !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !50
  %mul = mul i64 %call, 1, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !47
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx5, align 1, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay6), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_18_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #8, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #8, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_18_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_18_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 50, align 16, !dbg !84
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !86
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !89
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !93
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !94
  store i8 0, i8* %arrayidx1, align 1, !dbg !95
  br label %source, !dbg !96

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !97), !dbg !98
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  store i8* %6, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx2, align 1, !dbg !106
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  %7 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !110
  %mul = mul i64 %call, 1, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !107
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx5, align 1, !dbg !113
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @printLine(i8* %arraydecay6), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_18_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 32, column: 5, scope: !13)
!34 = !DILabel(scope: !13, name: "source", file: !14, line: 33)
!35 = !DILocation(line: 33, column: 1, scope: !13)
!36 = !DILocation(line: 35, column: 12, scope: !13)
!37 = !DILocation(line: 35, column: 10, scope: !13)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 37, type: !40)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 37, column: 14, scope: !39)
!44 = !DILocation(line: 38, column: 9, scope: !39)
!45 = !DILocation(line: 39, column: 9, scope: !39)
!46 = !DILocation(line: 39, column: 21, scope: !39)
!47 = !DILocation(line: 42, column: 9, scope: !39)
!48 = !DILocation(line: 42, column: 22, scope: !39)
!49 = !DILocation(line: 42, column: 35, scope: !39)
!50 = !DILocation(line: 42, column: 28, scope: !39)
!51 = !DILocation(line: 42, column: 40, scope: !39)
!52 = !DILocation(line: 43, column: 9, scope: !39)
!53 = !DILocation(line: 43, column: 21, scope: !39)
!54 = !DILocation(line: 44, column: 19, scope: !39)
!55 = !DILocation(line: 44, column: 9, scope: !39)
!56 = !DILocation(line: 46, column: 1, scope: !13)
!57 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_18_good", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 80, column: 5, scope: !57)
!59 = !DILocation(line: 81, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 93, type: !61, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !14, line: 93, type: !63)
!66 = !DILocation(line: 93, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !14, line: 93, type: !64)
!68 = !DILocation(line: 93, column: 27, scope: !60)
!69 = !DILocation(line: 96, column: 22, scope: !60)
!70 = !DILocation(line: 96, column: 12, scope: !60)
!71 = !DILocation(line: 96, column: 5, scope: !60)
!72 = !DILocation(line: 98, column: 5, scope: !60)
!73 = !DILocation(line: 99, column: 5, scope: !60)
!74 = !DILocation(line: 100, column: 5, scope: !60)
!75 = !DILocation(line: 103, column: 5, scope: !60)
!76 = !DILocation(line: 104, column: 5, scope: !60)
!77 = !DILocation(line: 105, column: 5, scope: !60)
!78 = !DILocation(line: 107, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 55, type: !4)
!81 = !DILocation(line: 55, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !14, line: 56, type: !4)
!83 = !DILocation(line: 56, column: 12, scope: !79)
!84 = !DILocation(line: 56, column: 36, scope: !79)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !14, line: 57, type: !4)
!86 = !DILocation(line: 57, column: 12, scope: !79)
!87 = !DILocation(line: 57, column: 37, scope: !79)
!88 = !DILocation(line: 58, column: 12, scope: !79)
!89 = !DILocation(line: 58, column: 5, scope: !79)
!90 = !DILocation(line: 59, column: 5, scope: !79)
!91 = !DILocation(line: 59, column: 25, scope: !79)
!92 = !DILocation(line: 60, column: 12, scope: !79)
!93 = !DILocation(line: 60, column: 5, scope: !79)
!94 = !DILocation(line: 61, column: 5, scope: !79)
!95 = !DILocation(line: 61, column: 27, scope: !79)
!96 = !DILocation(line: 62, column: 5, scope: !79)
!97 = !DILabel(scope: !79, name: "source", file: !14, line: 63)
!98 = !DILocation(line: 63, column: 1, scope: !79)
!99 = !DILocation(line: 65, column: 12, scope: !79)
!100 = !DILocation(line: 65, column: 10, scope: !79)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !14, line: 67, type: !40)
!102 = distinct !DILexicalBlock(scope: !79, file: !14, line: 66, column: 5)
!103 = !DILocation(line: 67, column: 14, scope: !102)
!104 = !DILocation(line: 68, column: 9, scope: !102)
!105 = !DILocation(line: 69, column: 9, scope: !102)
!106 = !DILocation(line: 69, column: 21, scope: !102)
!107 = !DILocation(line: 72, column: 9, scope: !102)
!108 = !DILocation(line: 72, column: 22, scope: !102)
!109 = !DILocation(line: 72, column: 35, scope: !102)
!110 = !DILocation(line: 72, column: 28, scope: !102)
!111 = !DILocation(line: 72, column: 40, scope: !102)
!112 = !DILocation(line: 73, column: 9, scope: !102)
!113 = !DILocation(line: 73, column: 21, scope: !102)
!114 = !DILocation(line: 74, column: 19, scope: !102)
!115 = !DILocation(line: 74, column: 9, scope: !102)
!116 = !DILocation(line: 76, column: 1, scope: !79)
