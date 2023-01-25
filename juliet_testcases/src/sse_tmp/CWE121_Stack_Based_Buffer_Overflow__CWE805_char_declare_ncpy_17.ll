; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data, align 8, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %2, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !52
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx2, align 1, !dbg !55
  %3 = load i8*, i8** %data, align 8, !dbg !56
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !57
  %call = call i8* @strncpy(i8* %3, i8* %arraydecay3, i64 99) #5, !dbg !58
  %4 = load i8*, i8** %data, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !59
  store i8 0, i8* %arrayidx4, align 1, !dbg !60
  %5 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* %5), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  store i32 0, i32* %h, align 4, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !97
  %cmp = icmp slt i32 %0, 1, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data, align 8, !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !107
  %inc = add nsw i32 %2, 1, !dbg !107
  store i32 %inc, i32* %h, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx2, align 1, !dbg !116
  %3 = load i8*, i8** %data, align 8, !dbg !117
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  %call = call i8* @strncpy(i8* %3, i8* %arraydecay3, i64 99) #5, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !120
  store i8 0, i8* %arrayidx4, align 1, !dbg !121
  %5 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* %5), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 26, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 28, column: 10, scope: !11)
!32 = !DILocation(line: 29, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 9, scope: !33)
!35 = !DILocation(line: 29, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 29, column: 18, scope: !36)
!38 = !DILocation(line: 29, column: 5, scope: !33)
!39 = !DILocation(line: 33, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 30, column: 5)
!41 = !DILocation(line: 33, column: 14, scope: !40)
!42 = !DILocation(line: 34, column: 9, scope: !40)
!43 = !DILocation(line: 34, column: 17, scope: !40)
!44 = !DILocation(line: 35, column: 5, scope: !40)
!45 = !DILocation(line: 29, column: 24, scope: !36)
!46 = !DILocation(line: 29, column: 5, scope: !36)
!47 = distinct !{!47, !38, !48, !49}
!48 = !DILocation(line: 35, column: 5, scope: !33)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "source", scope: !51, file: !12, line: 37, type: !28)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!52 = !DILocation(line: 37, column: 14, scope: !51)
!53 = !DILocation(line: 38, column: 9, scope: !51)
!54 = !DILocation(line: 39, column: 9, scope: !51)
!55 = !DILocation(line: 39, column: 23, scope: !51)
!56 = !DILocation(line: 41, column: 17, scope: !51)
!57 = !DILocation(line: 41, column: 23, scope: !51)
!58 = !DILocation(line: 41, column: 9, scope: !51)
!59 = !DILocation(line: 42, column: 9, scope: !51)
!60 = !DILocation(line: 42, column: 21, scope: !51)
!61 = !DILocation(line: 43, column: 19, scope: !51)
!62 = !DILocation(line: 43, column: 9, scope: !51)
!63 = !DILocation(line: 45, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_17_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 77, column: 5, scope: !64)
!66 = !DILocation(line: 78, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !68, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!16, !16, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 90, type: !16)
!72 = !DILocation(line: 90, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 90, type: !70)
!74 = !DILocation(line: 90, column: 27, scope: !67)
!75 = !DILocation(line: 93, column: 22, scope: !67)
!76 = !DILocation(line: 93, column: 12, scope: !67)
!77 = !DILocation(line: 93, column: 5, scope: !67)
!78 = !DILocation(line: 95, column: 5, scope: !67)
!79 = !DILocation(line: 96, column: 5, scope: !67)
!80 = !DILocation(line: 97, column: 5, scope: !67)
!81 = !DILocation(line: 100, column: 5, scope: !67)
!82 = !DILocation(line: 101, column: 5, scope: !67)
!83 = !DILocation(line: 102, column: 5, scope: !67)
!84 = !DILocation(line: 104, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "h", scope: !85, file: !12, line: 54, type: !16)
!87 = !DILocation(line: 54, column: 9, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 55, type: !19)
!89 = !DILocation(line: 55, column: 12, scope: !85)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 56, type: !23)
!91 = !DILocation(line: 56, column: 10, scope: !85)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 57, type: !28)
!93 = !DILocation(line: 57, column: 10, scope: !85)
!94 = !DILocation(line: 58, column: 11, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !12, line: 58, column: 5)
!96 = !DILocation(line: 58, column: 9, scope: !95)
!97 = !DILocation(line: 58, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 58, column: 5)
!99 = !DILocation(line: 58, column: 18, scope: !98)
!100 = !DILocation(line: 58, column: 5, scope: !95)
!101 = !DILocation(line: 61, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 59, column: 5)
!103 = !DILocation(line: 61, column: 14, scope: !102)
!104 = !DILocation(line: 62, column: 9, scope: !102)
!105 = !DILocation(line: 62, column: 17, scope: !102)
!106 = !DILocation(line: 63, column: 5, scope: !102)
!107 = !DILocation(line: 58, column: 24, scope: !98)
!108 = !DILocation(line: 58, column: 5, scope: !98)
!109 = distinct !{!109, !100, !110, !49}
!110 = !DILocation(line: 63, column: 5, scope: !95)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 65, type: !28)
!112 = distinct !DILexicalBlock(scope: !85, file: !12, line: 64, column: 5)
!113 = !DILocation(line: 65, column: 14, scope: !112)
!114 = !DILocation(line: 66, column: 9, scope: !112)
!115 = !DILocation(line: 67, column: 9, scope: !112)
!116 = !DILocation(line: 67, column: 23, scope: !112)
!117 = !DILocation(line: 69, column: 17, scope: !112)
!118 = !DILocation(line: 69, column: 23, scope: !112)
!119 = !DILocation(line: 69, column: 9, scope: !112)
!120 = !DILocation(line: 70, column: 9, scope: !112)
!121 = !DILocation(line: 70, column: 21, scope: !112)
!122 = !DILocation(line: 71, column: 19, scope: !112)
!123 = !DILocation(line: 71, column: 9, scope: !112)
!124 = !DILocation(line: 73, column: 1, scope: !85)
