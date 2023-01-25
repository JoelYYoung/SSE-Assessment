; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 10, align 16, !dbg !24
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = alloca i8, i64 11, align 16, !dbg !27
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %2, 1, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %3, i8** %data, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %5, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !51
  %7 = load i8*, i8** %data, align 8, !dbg !52
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !55
  %add = add i64 %call, 1, !dbg !56
  %mul = mul i64 %add, 1, !dbg !57
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !53
  %8 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* %8), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %h, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 10, align 16, !dbg !89
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %1 = alloca i8, i64 11, align 16, !dbg !92
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !91
  store i32 0, i32* %h, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !96
  %cmp = icmp slt i32 %2, 1, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !100
  store i8* %3, i8** %data, align 8, !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !106
  %inc = add nsw i32 %5, 1, !dbg !106
  store i32 %inc, i32* %h, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !112
  %7 = load i8*, i8** %data, align 8, !dbg !113
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !114
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !115
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !116
  %add = add i64 %call, 1, !dbg !117
  %mul = mul i64 %add, 1, !dbg !118
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !114
  %8 = load i8*, i8** %data, align 8, !dbg !119
  call void @printLine(i8* %8), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 30, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 30, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 36, scope: !13)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 33, type: !4)
!26 = !DILocation(line: 33, column: 12, scope: !13)
!27 = !DILocation(line: 33, column: 37, scope: !13)
!28 = !DILocation(line: 34, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!30 = !DILocation(line: 34, column: 9, scope: !29)
!31 = !DILocation(line: 34, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 5)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 5, scope: !29)
!35 = !DILocation(line: 38, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !14, line: 35, column: 5)
!37 = !DILocation(line: 38, column: 14, scope: !36)
!38 = !DILocation(line: 39, column: 9, scope: !36)
!39 = !DILocation(line: 39, column: 17, scope: !36)
!40 = !DILocation(line: 40, column: 5, scope: !36)
!41 = !DILocation(line: 34, column: 24, scope: !32)
!42 = !DILocation(line: 34, column: 5, scope: !32)
!43 = distinct !{!43, !34, !44, !45}
!44 = !DILocation(line: 40, column: 5, scope: !29)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "source", scope: !47, file: !14, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 42, column: 14, scope: !47)
!52 = !DILocation(line: 45, column: 17, scope: !47)
!53 = !DILocation(line: 45, column: 9, scope: !47)
!54 = !DILocation(line: 45, column: 39, scope: !47)
!55 = !DILocation(line: 45, column: 32, scope: !47)
!56 = !DILocation(line: 45, column: 47, scope: !47)
!57 = !DILocation(line: 45, column: 52, scope: !47)
!58 = !DILocation(line: 46, column: 19, scope: !47)
!59 = !DILocation(line: 46, column: 9, scope: !47)
!60 = !DILocation(line: 48, column: 1, scope: !13)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_17_good", scope: !14, file: !14, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 79, column: 5, scope: !61)
!63 = !DILocation(line: 80, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !65, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!18, !18, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !14, line: 92, type: !18)
!69 = !DILocation(line: 92, column: 14, scope: !64)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !14, line: 92, type: !67)
!71 = !DILocation(line: 92, column: 27, scope: !64)
!72 = !DILocation(line: 95, column: 22, scope: !64)
!73 = !DILocation(line: 95, column: 12, scope: !64)
!74 = !DILocation(line: 95, column: 5, scope: !64)
!75 = !DILocation(line: 97, column: 5, scope: !64)
!76 = !DILocation(line: 98, column: 5, scope: !64)
!77 = !DILocation(line: 99, column: 5, scope: !64)
!78 = !DILocation(line: 102, column: 5, scope: !64)
!79 = !DILocation(line: 103, column: 5, scope: !64)
!80 = !DILocation(line: 104, column: 5, scope: !64)
!81 = !DILocation(line: 106, column: 5, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "h", scope: !82, file: !14, line: 57, type: !18)
!84 = !DILocation(line: 57, column: 9, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 58, type: !4)
!86 = !DILocation(line: 58, column: 12, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !14, line: 59, type: !4)
!88 = !DILocation(line: 59, column: 12, scope: !82)
!89 = !DILocation(line: 59, column: 36, scope: !82)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !14, line: 60, type: !4)
!91 = !DILocation(line: 60, column: 12, scope: !82)
!92 = !DILocation(line: 60, column: 37, scope: !82)
!93 = !DILocation(line: 61, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !14, line: 61, column: 5)
!95 = !DILocation(line: 61, column: 9, scope: !94)
!96 = !DILocation(line: 61, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !14, line: 61, column: 5)
!98 = !DILocation(line: 61, column: 18, scope: !97)
!99 = !DILocation(line: 61, column: 5, scope: !94)
!100 = !DILocation(line: 65, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !14, line: 62, column: 5)
!102 = !DILocation(line: 65, column: 14, scope: !101)
!103 = !DILocation(line: 66, column: 9, scope: !101)
!104 = !DILocation(line: 66, column: 17, scope: !101)
!105 = !DILocation(line: 67, column: 5, scope: !101)
!106 = !DILocation(line: 61, column: 24, scope: !97)
!107 = !DILocation(line: 61, column: 5, scope: !97)
!108 = distinct !{!108, !99, !109, !45}
!109 = !DILocation(line: 67, column: 5, scope: !94)
!110 = !DILocalVariable(name: "source", scope: !111, file: !14, line: 69, type: !48)
!111 = distinct !DILexicalBlock(scope: !82, file: !14, line: 68, column: 5)
!112 = !DILocation(line: 69, column: 14, scope: !111)
!113 = !DILocation(line: 72, column: 17, scope: !111)
!114 = !DILocation(line: 72, column: 9, scope: !111)
!115 = !DILocation(line: 72, column: 39, scope: !111)
!116 = !DILocation(line: 72, column: 32, scope: !111)
!117 = !DILocation(line: 72, column: 47, scope: !111)
!118 = !DILocation(line: 72, column: 52, scope: !111)
!119 = !DILocation(line: 73, column: 19, scope: !111)
!120 = !DILocation(line: 73, column: 9, scope: !111)
!121 = !DILocation(line: 75, column: 1, scope: !82)
