; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_12_bad() #0 !dbg !13 {
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
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %6, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !40
  store i8* %7, i8** %data, align 8, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx2, align 1, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %8 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %call5 = call i64 @strlen(i8* %arraydecay4) #7, !dbg !55
  %mul = mul i64 %call5, 1, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !52
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx6, align 1, !dbg !58
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @printLine(i8* %arraydecay7), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_12_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #8, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #8, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_12_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_12_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 50, align 16, !dbg !89
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %1 = alloca i8, i64 100, align 16, !dbg !92
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !91
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !94
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !98
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !99
  store i8 0, i8* %arrayidx1, align 1, !dbg !100
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  store i8* %6, i8** %data, align 8, !dbg !106
  br label %if.end, !dbg !107

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !108
  store i8* %7, i8** %data, align 8, !dbg !110
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx2, align 1, !dbg !116
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %8 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %call5 = call i64 @strlen(i8* %arraydecay4) #7, !dbg !120
  %mul = mul i64 %call5, 1, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !117
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx6, align 1, !dbg !123
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay7), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 32, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!35 = !DILocation(line: 32, column: 8, scope: !13)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 5, scope: !37)
!40 = !DILocation(line: 40, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !14, line: 38, column: 5)
!42 = !DILocation(line: 40, column: 14, scope: !41)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !14, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 43, column: 14, scope: !44)
!49 = !DILocation(line: 44, column: 9, scope: !44)
!50 = !DILocation(line: 45, column: 9, scope: !44)
!51 = !DILocation(line: 45, column: 21, scope: !44)
!52 = !DILocation(line: 48, column: 9, scope: !44)
!53 = !DILocation(line: 48, column: 22, scope: !44)
!54 = !DILocation(line: 48, column: 35, scope: !44)
!55 = !DILocation(line: 48, column: 28, scope: !44)
!56 = !DILocation(line: 48, column: 40, scope: !44)
!57 = !DILocation(line: 49, column: 9, scope: !44)
!58 = !DILocation(line: 49, column: 21, scope: !44)
!59 = !DILocation(line: 50, column: 19, scope: !44)
!60 = !DILocation(line: 50, column: 9, scope: !44)
!61 = !DILocation(line: 52, column: 1, scope: !13)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_12_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 93, column: 5, scope: !62)
!64 = !DILocation(line: 94, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !66, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !14, line: 106, type: !68)
!71 = !DILocation(line: 106, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !14, line: 106, type: !69)
!73 = !DILocation(line: 106, column: 27, scope: !65)
!74 = !DILocation(line: 109, column: 22, scope: !65)
!75 = !DILocation(line: 109, column: 12, scope: !65)
!76 = !DILocation(line: 109, column: 5, scope: !65)
!77 = !DILocation(line: 111, column: 5, scope: !65)
!78 = !DILocation(line: 112, column: 5, scope: !65)
!79 = !DILocation(line: 113, column: 5, scope: !65)
!80 = !DILocation(line: 116, column: 5, scope: !65)
!81 = !DILocation(line: 117, column: 5, scope: !65)
!82 = !DILocation(line: 118, column: 5, scope: !65)
!83 = !DILocation(line: 120, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 62, type: !4)
!86 = !DILocation(line: 62, column: 12, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !14, line: 63, type: !4)
!88 = !DILocation(line: 63, column: 12, scope: !84)
!89 = !DILocation(line: 63, column: 36, scope: !84)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !14, line: 64, type: !4)
!91 = !DILocation(line: 64, column: 12, scope: !84)
!92 = !DILocation(line: 64, column: 37, scope: !84)
!93 = !DILocation(line: 65, column: 12, scope: !84)
!94 = !DILocation(line: 65, column: 5, scope: !84)
!95 = !DILocation(line: 66, column: 5, scope: !84)
!96 = !DILocation(line: 66, column: 25, scope: !84)
!97 = !DILocation(line: 67, column: 12, scope: !84)
!98 = !DILocation(line: 67, column: 5, scope: !84)
!99 = !DILocation(line: 68, column: 5, scope: !84)
!100 = !DILocation(line: 68, column: 27, scope: !84)
!101 = !DILocation(line: 69, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !84, file: !14, line: 69, column: 8)
!103 = !DILocation(line: 69, column: 8, scope: !84)
!104 = !DILocation(line: 72, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !14, line: 70, column: 5)
!106 = !DILocation(line: 72, column: 14, scope: !105)
!107 = !DILocation(line: 73, column: 5, scope: !105)
!108 = !DILocation(line: 77, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !14, line: 75, column: 5)
!110 = !DILocation(line: 77, column: 14, scope: !109)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !14, line: 80, type: !45)
!112 = distinct !DILexicalBlock(scope: !84, file: !14, line: 79, column: 5)
!113 = !DILocation(line: 80, column: 14, scope: !112)
!114 = !DILocation(line: 81, column: 9, scope: !112)
!115 = !DILocation(line: 82, column: 9, scope: !112)
!116 = !DILocation(line: 82, column: 21, scope: !112)
!117 = !DILocation(line: 85, column: 9, scope: !112)
!118 = !DILocation(line: 85, column: 22, scope: !112)
!119 = !DILocation(line: 85, column: 35, scope: !112)
!120 = !DILocation(line: 85, column: 28, scope: !112)
!121 = !DILocation(line: 85, column: 40, scope: !112)
!122 = !DILocation(line: 86, column: 9, scope: !112)
!123 = !DILocation(line: 86, column: 21, scope: !112)
!124 = !DILocation(line: 87, column: 19, scope: !112)
!125 = !DILocation(line: 87, column: 9, scope: !112)
!126 = !DILocation(line: 89, column: 1, scope: !84)
