; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %4, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %6, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !50
  %8 = load i32*, i32** %data, align 8, !dbg !51
  %9 = bitcast i32* %8 to i8*, !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %10 = bitcast i32* %arraydecay to i8*, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 400, i1 false), !dbg !52
  %11 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !53
  %12 = load i32, i32* %arrayidx, align 4, !dbg !53
  call void @printIntLine(i32 %12), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 200, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 400, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %4, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %5, i32** %data, align 8, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !103
  %inc = add nsw i32 %6, 1, !dbg !103
  store i32 %inc, i32* %h, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !109
  %8 = load i32*, i32** %data, align 8, !dbg !110
  %9 = bitcast i32* %8 to i8*, !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %10 = bitcast i32* %arraydecay to i8*, !dbg !111
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 400, i1 false), !dbg !111
  %11 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !112
  %12 = load i32, i32* %arrayidx, align 4, !dbg !112
  call void @printIntLine(i32 %12), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 23, type: !5)
!18 = !DILocation(line: 23, column: 9, scope: !13)
!19 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 25, type: !4)
!22 = !DILocation(line: 25, column: 11, scope: !13)
!23 = !DILocation(line: 25, column: 34, scope: !13)
!24 = !DILocation(line: 25, column: 27, scope: !13)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 26, type: !4)
!26 = !DILocation(line: 26, column: 11, scope: !13)
!27 = !DILocation(line: 26, column: 35, scope: !13)
!28 = !DILocation(line: 26, column: 28, scope: !13)
!29 = !DILocation(line: 27, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!31 = !DILocation(line: 27, column: 9, scope: !30)
!32 = !DILocation(line: 27, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !14, line: 27, column: 5)
!34 = !DILocation(line: 27, column: 18, scope: !33)
!35 = !DILocation(line: 27, column: 5, scope: !30)
!36 = !DILocation(line: 31, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 28, column: 5)
!38 = !DILocation(line: 31, column: 14, scope: !37)
!39 = !DILocation(line: 32, column: 5, scope: !37)
!40 = !DILocation(line: 27, column: 24, scope: !33)
!41 = !DILocation(line: 27, column: 5, scope: !33)
!42 = distinct !{!42, !35, !43, !44}
!43 = !DILocation(line: 32, column: 5, scope: !30)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocalVariable(name: "source", scope: !46, file: !14, line: 34, type: !47)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 34, column: 13, scope: !46)
!51 = !DILocation(line: 36, column: 17, scope: !46)
!52 = !DILocation(line: 36, column: 9, scope: !46)
!53 = !DILocation(line: 37, column: 22, scope: !46)
!54 = !DILocation(line: 37, column: 9, scope: !46)
!55 = !DILocation(line: 39, column: 1, scope: !13)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_17_good", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 67, column: 5, scope: !56)
!58 = !DILocation(line: 68, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 80, type: !60, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!5, !5, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !14, line: 80, type: !5)
!66 = !DILocation(line: 80, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !14, line: 80, type: !62)
!68 = !DILocation(line: 80, column: 27, scope: !59)
!69 = !DILocation(line: 83, column: 22, scope: !59)
!70 = !DILocation(line: 83, column: 12, scope: !59)
!71 = !DILocation(line: 83, column: 5, scope: !59)
!72 = !DILocation(line: 85, column: 5, scope: !59)
!73 = !DILocation(line: 86, column: 5, scope: !59)
!74 = !DILocation(line: 87, column: 5, scope: !59)
!75 = !DILocation(line: 90, column: 5, scope: !59)
!76 = !DILocation(line: 91, column: 5, scope: !59)
!77 = !DILocation(line: 92, column: 5, scope: !59)
!78 = !DILocation(line: 94, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "h", scope: !79, file: !14, line: 48, type: !5)
!81 = !DILocation(line: 48, column: 9, scope: !79)
!82 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 49, type: !4)
!83 = !DILocation(line: 49, column: 11, scope: !79)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !14, line: 50, type: !4)
!85 = !DILocation(line: 50, column: 11, scope: !79)
!86 = !DILocation(line: 50, column: 34, scope: !79)
!87 = !DILocation(line: 50, column: 27, scope: !79)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !14, line: 51, type: !4)
!89 = !DILocation(line: 51, column: 11, scope: !79)
!90 = !DILocation(line: 51, column: 35, scope: !79)
!91 = !DILocation(line: 51, column: 28, scope: !79)
!92 = !DILocation(line: 52, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !79, file: !14, line: 52, column: 5)
!94 = !DILocation(line: 52, column: 9, scope: !93)
!95 = !DILocation(line: 52, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !14, line: 52, column: 5)
!97 = !DILocation(line: 52, column: 18, scope: !96)
!98 = !DILocation(line: 52, column: 5, scope: !93)
!99 = !DILocation(line: 55, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !14, line: 53, column: 5)
!101 = !DILocation(line: 55, column: 14, scope: !100)
!102 = !DILocation(line: 56, column: 5, scope: !100)
!103 = !DILocation(line: 52, column: 24, scope: !96)
!104 = !DILocation(line: 52, column: 5, scope: !96)
!105 = distinct !{!105, !98, !106, !44}
!106 = !DILocation(line: 56, column: 5, scope: !93)
!107 = !DILocalVariable(name: "source", scope: !108, file: !14, line: 58, type: !47)
!108 = distinct !DILexicalBlock(scope: !79, file: !14, line: 57, column: 5)
!109 = !DILocation(line: 58, column: 13, scope: !108)
!110 = !DILocation(line: 60, column: 17, scope: !108)
!111 = !DILocation(line: 60, column: 9, scope: !108)
!112 = !DILocation(line: 61, column: 22, scope: !108)
!113 = !DILocation(line: 61, column: 9, scope: !108)
!114 = !DILocation(line: 63, column: 1, scope: !79)
