; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
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
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !52
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !56
  %add = add i64 %call, 1, !dbg !57
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay1, i64 %add) #7, !dbg !58
  %5 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %5), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_good() #0 !dbg !62 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #7, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #7, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %h, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %0, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay, i8** %data, align 8, !dbg !101
  %1 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !105
  %inc = add nsw i32 %2, 1, !dbg !105
  store i32 %inc, i32* %h, align 4, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !114
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !115
  %add = add i64 %call, 1, !dbg !116
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay1, i64 %add) #7, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  call void @printLine(i8* %5), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 31, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 80, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 32, column: 10, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 88, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocation(line: 34, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!34 = !DILocation(line: 34, column: 9, scope: !33)
!35 = !DILocation(line: 34, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 34, column: 18, scope: !36)
!38 = !DILocation(line: 34, column: 5, scope: !33)
!39 = !DILocation(line: 38, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 38, column: 14, scope: !40)
!42 = !DILocation(line: 39, column: 9, scope: !40)
!43 = !DILocation(line: 39, column: 17, scope: !40)
!44 = !DILocation(line: 40, column: 5, scope: !40)
!45 = !DILocation(line: 34, column: 24, scope: !36)
!46 = !DILocation(line: 34, column: 5, scope: !36)
!47 = distinct !{!47, !38, !48, !49}
!48 = !DILocation(line: 40, column: 5, scope: !33)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "source", scope: !51, file: !12, line: 42, type: !28)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!52 = !DILocation(line: 42, column: 14, scope: !51)
!53 = !DILocation(line: 45, column: 17, scope: !51)
!54 = !DILocation(line: 45, column: 23, scope: !51)
!55 = !DILocation(line: 45, column: 38, scope: !51)
!56 = !DILocation(line: 45, column: 31, scope: !51)
!57 = !DILocation(line: 45, column: 46, scope: !51)
!58 = !DILocation(line: 45, column: 9, scope: !51)
!59 = !DILocation(line: 46, column: 19, scope: !51)
!60 = !DILocation(line: 46, column: 9, scope: !51)
!61 = !DILocation(line: 48, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_17_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 79, column: 5, scope: !62)
!64 = !DILocation(line: 80, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !66, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!16, !16, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 92, type: !16)
!70 = !DILocation(line: 92, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 92, type: !68)
!72 = !DILocation(line: 92, column: 27, scope: !65)
!73 = !DILocation(line: 95, column: 22, scope: !65)
!74 = !DILocation(line: 95, column: 12, scope: !65)
!75 = !DILocation(line: 95, column: 5, scope: !65)
!76 = !DILocation(line: 97, column: 5, scope: !65)
!77 = !DILocation(line: 98, column: 5, scope: !65)
!78 = !DILocation(line: 99, column: 5, scope: !65)
!79 = !DILocation(line: 102, column: 5, scope: !65)
!80 = !DILocation(line: 103, column: 5, scope: !65)
!81 = !DILocation(line: 104, column: 5, scope: !65)
!82 = !DILocation(line: 106, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "h", scope: !83, file: !12, line: 57, type: !16)
!85 = !DILocation(line: 57, column: 9, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 58, type: !19)
!87 = !DILocation(line: 58, column: 12, scope: !83)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 59, type: !23)
!89 = !DILocation(line: 59, column: 10, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 60, type: !28)
!91 = !DILocation(line: 60, column: 10, scope: !83)
!92 = !DILocation(line: 61, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !12, line: 61, column: 5)
!94 = !DILocation(line: 61, column: 9, scope: !93)
!95 = !DILocation(line: 61, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 61, column: 5)
!97 = !DILocation(line: 61, column: 18, scope: !96)
!98 = !DILocation(line: 61, column: 5, scope: !93)
!99 = !DILocation(line: 65, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 62, column: 5)
!101 = !DILocation(line: 65, column: 14, scope: !100)
!102 = !DILocation(line: 66, column: 9, scope: !100)
!103 = !DILocation(line: 66, column: 17, scope: !100)
!104 = !DILocation(line: 67, column: 5, scope: !100)
!105 = !DILocation(line: 61, column: 24, scope: !96)
!106 = !DILocation(line: 61, column: 5, scope: !96)
!107 = distinct !{!107, !98, !108, !49}
!108 = !DILocation(line: 67, column: 5, scope: !93)
!109 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 69, type: !28)
!110 = distinct !DILexicalBlock(scope: !83, file: !12, line: 68, column: 5)
!111 = !DILocation(line: 69, column: 14, scope: !110)
!112 = !DILocation(line: 72, column: 17, scope: !110)
!113 = !DILocation(line: 72, column: 23, scope: !110)
!114 = !DILocation(line: 72, column: 38, scope: !110)
!115 = !DILocation(line: 72, column: 31, scope: !110)
!116 = !DILocation(line: 72, column: 46, scope: !110)
!117 = !DILocation(line: 72, column: 9, scope: !110)
!118 = !DILocation(line: 73, column: 19, scope: !110)
!119 = !DILocation(line: 73, column: 9, scope: !110)
!120 = !DILocation(line: 75, column: 1, scope: !83)
