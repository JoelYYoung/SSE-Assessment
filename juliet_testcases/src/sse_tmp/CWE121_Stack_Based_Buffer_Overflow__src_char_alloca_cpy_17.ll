; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %0, i8** %dataBuffer, align 8, !dbg !23
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  store i8* %1, i8** %data, align 8, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !30
  %cmp = icmp slt i32 %2, 1, !dbg !32
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %5, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !51
  %7 = load i8*, i8** %data, align 8, !dbg !52
  %call = call i8* @strcpy(i8* %arraydecay, i8* %7) #5, !dbg !53
  %8 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %8), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17_good() #0 !dbg !57 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %0, i8** %dataBuffer, align 8, !dbg !84
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  store i8* %1, i8** %data, align 8, !dbg !87
  store i32 0, i32* %h, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !91
  %cmp = icmp slt i32 %2, 1, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !101
  %inc = add nsw i32 %5, 1, !dbg !101
  store i32 %inc, i32* %h, align 4, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  %call = call i8* @strcpy(i8* %arraydecay, i8* %7) #5, !dbg !110
  %8 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %8), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 25, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 25, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 33, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 10, scope: !13)
!27 = !DILocation(line: 29, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 29, column: 9, scope: !28)
!30 = !DILocation(line: 29, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 29, column: 5)
!32 = !DILocation(line: 29, column: 18, scope: !31)
!33 = !DILocation(line: 29, column: 5, scope: !28)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 30, column: 5)
!36 = !DILocation(line: 32, column: 9, scope: !35)
!37 = !DILocation(line: 33, column: 9, scope: !35)
!38 = !DILocation(line: 33, column: 21, scope: !35)
!39 = !DILocation(line: 34, column: 5, scope: !35)
!40 = !DILocation(line: 29, column: 24, scope: !31)
!41 = !DILocation(line: 29, column: 5, scope: !31)
!42 = distinct !{!42, !33, !43, !44}
!43 = !DILocation(line: 34, column: 5, scope: !28)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocalVariable(name: "dest", scope: !46, file: !14, line: 36, type: !47)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 36, column: 14, scope: !46)
!51 = !DILocation(line: 38, column: 16, scope: !46)
!52 = !DILocation(line: 38, column: 22, scope: !46)
!53 = !DILocation(line: 38, column: 9, scope: !46)
!54 = !DILocation(line: 39, column: 19, scope: !46)
!55 = !DILocation(line: 39, column: 9, scope: !46)
!56 = !DILocation(line: 41, column: 1, scope: !13)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_17_good", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 70, column: 5, scope: !57)
!59 = !DILocation(line: 71, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 83, type: !61, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!18, !18, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !14, line: 83, type: !18)
!65 = !DILocation(line: 83, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !14, line: 83, type: !63)
!67 = !DILocation(line: 83, column: 27, scope: !60)
!68 = !DILocation(line: 86, column: 22, scope: !60)
!69 = !DILocation(line: 86, column: 12, scope: !60)
!70 = !DILocation(line: 86, column: 5, scope: !60)
!71 = !DILocation(line: 88, column: 5, scope: !60)
!72 = !DILocation(line: 89, column: 5, scope: !60)
!73 = !DILocation(line: 90, column: 5, scope: !60)
!74 = !DILocation(line: 93, column: 5, scope: !60)
!75 = !DILocation(line: 94, column: 5, scope: !60)
!76 = !DILocation(line: 95, column: 5, scope: !60)
!77 = !DILocation(line: 97, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "h", scope: !78, file: !14, line: 50, type: !18)
!80 = !DILocation(line: 50, column: 9, scope: !78)
!81 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 51, type: !4)
!82 = !DILocation(line: 51, column: 12, scope: !78)
!83 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !14, line: 52, type: !4)
!84 = !DILocation(line: 52, column: 12, scope: !78)
!85 = !DILocation(line: 52, column: 33, scope: !78)
!86 = !DILocation(line: 53, column: 12, scope: !78)
!87 = !DILocation(line: 53, column: 10, scope: !78)
!88 = !DILocation(line: 54, column: 11, scope: !89)
!89 = distinct !DILexicalBlock(scope: !78, file: !14, line: 54, column: 5)
!90 = !DILocation(line: 54, column: 9, scope: !89)
!91 = !DILocation(line: 54, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !14, line: 54, column: 5)
!93 = !DILocation(line: 54, column: 18, scope: !92)
!94 = !DILocation(line: 54, column: 5, scope: !89)
!95 = !DILocation(line: 57, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !14, line: 55, column: 5)
!97 = !DILocation(line: 57, column: 9, scope: !96)
!98 = !DILocation(line: 58, column: 9, scope: !96)
!99 = !DILocation(line: 58, column: 20, scope: !96)
!100 = !DILocation(line: 59, column: 5, scope: !96)
!101 = !DILocation(line: 54, column: 24, scope: !92)
!102 = !DILocation(line: 54, column: 5, scope: !92)
!103 = distinct !{!103, !94, !104, !44}
!104 = !DILocation(line: 59, column: 5, scope: !89)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !14, line: 61, type: !47)
!106 = distinct !DILexicalBlock(scope: !78, file: !14, line: 60, column: 5)
!107 = !DILocation(line: 61, column: 14, scope: !106)
!108 = !DILocation(line: 63, column: 16, scope: !106)
!109 = !DILocation(line: 63, column: 22, scope: !106)
!110 = !DILocation(line: 63, column: 9, scope: !106)
!111 = !DILocation(line: 64, column: 19, scope: !106)
!112 = !DILocation(line: 64, column: 9, scope: !106)
!113 = !DILocation(line: 66, column: 1, scope: !78)
