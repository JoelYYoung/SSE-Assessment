; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay, i32** %data, align 8, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %2, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_bad.source to i8*), i64 44, i1 false), !dbg !53
  %4 = load i32*, i32** %data, align 8, !dbg !54
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i32* @wcscpy(i32* %4, i32* %arraydecay1) #5, !dbg !56
  %5 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %5), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_good() #0 !dbg !60 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %0, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  %1 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !105
  %inc = add nsw i32 %2, 1, !dbg !105
  store i32 %inc, i32* %h, align 4, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !111
  %4 = load i32*, i32** %data, align 8, !dbg !112
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !113
  %call = call i32* @wcscpy(i32* %4, i32* %arraydecay1) #5, !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %5), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!22 = !DILocation(line: 31, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 32, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 352, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 11)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocation(line: 34, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 34, column: 9, scope: !34)
!36 = !DILocation(line: 34, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 5, scope: !34)
!40 = !DILocation(line: 38, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 35, column: 5)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 39, column: 9, scope: !41)
!44 = !DILocation(line: 39, column: 17, scope: !41)
!45 = !DILocation(line: 40, column: 5, scope: !41)
!46 = !DILocation(line: 34, column: 24, scope: !37)
!47 = !DILocation(line: 34, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 40, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 42, type: !29)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 17, scope: !52)
!54 = !DILocation(line: 44, column: 16, scope: !52)
!55 = !DILocation(line: 44, column: 22, scope: !52)
!56 = !DILocation(line: 44, column: 9, scope: !52)
!57 = !DILocation(line: 45, column: 20, scope: !52)
!58 = !DILocation(line: 45, column: 9, scope: !52)
!59 = !DILocation(line: 47, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_17_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 77, column: 5, scope: !60)
!62 = !DILocation(line: 78, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !64, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!16, !16, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 90, type: !16)
!70 = !DILocation(line: 90, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 90, type: !66)
!72 = !DILocation(line: 90, column: 27, scope: !63)
!73 = !DILocation(line: 93, column: 22, scope: !63)
!74 = !DILocation(line: 93, column: 12, scope: !63)
!75 = !DILocation(line: 93, column: 5, scope: !63)
!76 = !DILocation(line: 95, column: 5, scope: !63)
!77 = !DILocation(line: 96, column: 5, scope: !63)
!78 = !DILocation(line: 97, column: 5, scope: !63)
!79 = !DILocation(line: 100, column: 5, scope: !63)
!80 = !DILocation(line: 101, column: 5, scope: !63)
!81 = !DILocation(line: 102, column: 5, scope: !63)
!82 = !DILocation(line: 104, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "h", scope: !83, file: !12, line: 56, type: !16)
!85 = !DILocation(line: 56, column: 9, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 57, type: !19)
!87 = !DILocation(line: 57, column: 15, scope: !83)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 58, type: !24)
!89 = !DILocation(line: 58, column: 13, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 59, type: !29)
!91 = !DILocation(line: 59, column: 13, scope: !83)
!92 = !DILocation(line: 60, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !12, line: 60, column: 5)
!94 = !DILocation(line: 60, column: 9, scope: !93)
!95 = !DILocation(line: 60, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 60, column: 5)
!97 = !DILocation(line: 60, column: 18, scope: !96)
!98 = !DILocation(line: 60, column: 5, scope: !93)
!99 = !DILocation(line: 64, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 61, column: 5)
!101 = !DILocation(line: 64, column: 14, scope: !100)
!102 = !DILocation(line: 65, column: 9, scope: !100)
!103 = !DILocation(line: 65, column: 17, scope: !100)
!104 = !DILocation(line: 66, column: 5, scope: !100)
!105 = !DILocation(line: 60, column: 24, scope: !96)
!106 = !DILocation(line: 60, column: 5, scope: !96)
!107 = distinct !{!107, !98, !108, !50}
!108 = !DILocation(line: 66, column: 5, scope: !93)
!109 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 68, type: !29)
!110 = distinct !DILexicalBlock(scope: !83, file: !12, line: 67, column: 5)
!111 = !DILocation(line: 68, column: 17, scope: !110)
!112 = !DILocation(line: 70, column: 16, scope: !110)
!113 = !DILocation(line: 70, column: 22, scope: !110)
!114 = !DILocation(line: 70, column: 9, scope: !110)
!115 = !DILocation(line: 71, column: 20, scope: !110)
!116 = !DILocation(line: 71, column: 9, scope: !110)
!117 = !DILocation(line: 73, column: 1, scope: !83)
