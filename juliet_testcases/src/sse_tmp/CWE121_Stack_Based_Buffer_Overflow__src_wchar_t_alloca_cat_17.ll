; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBuffer, align 8, !dbg !24
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  store i32* %2, i32** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %3, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %6, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !52
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !53
  %8 = load i32*, i32** %data, align 8, !dbg !54
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %8) #5, !dbg !55
  %9 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %9), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 400, align 16, !dbg !89
  %1 = bitcast i8* %0 to i32*, !dbg !90
  store i32* %1, i32** %dataBuffer, align 8, !dbg !88
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  store i32* %2, i32** %data, align 8, !dbg !92
  store i32 0, i32* %h, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %h, align 4, !dbg !96
  %cmp = icmp slt i32 %3, 1, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !102
  %5 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !106
  %inc = add nsw i32 %6, 1, !dbg !106
  store i32 %inc, i32* %h, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !113
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %8) #5, !dbg !115
  %9 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %9), !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 25, type: !7)
!20 = !DILocation(line: 25, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 27, type: !4)
!24 = !DILocation(line: 27, column: 15, scope: !15)
!25 = !DILocation(line: 27, column: 39, scope: !15)
!26 = !DILocation(line: 27, column: 28, scope: !15)
!27 = !DILocation(line: 28, column: 12, scope: !15)
!28 = !DILocation(line: 28, column: 10, scope: !15)
!29 = !DILocation(line: 29, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!31 = !DILocation(line: 29, column: 9, scope: !30)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 5, scope: !30)
!36 = !DILocation(line: 32, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !16, line: 30, column: 5)
!38 = !DILocation(line: 32, column: 9, scope: !37)
!39 = !DILocation(line: 33, column: 9, scope: !37)
!40 = !DILocation(line: 33, column: 21, scope: !37)
!41 = !DILocation(line: 34, column: 5, scope: !37)
!42 = !DILocation(line: 29, column: 24, scope: !33)
!43 = !DILocation(line: 29, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !16, line: 36, type: !49)
!48 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 36, column: 17, scope: !48)
!53 = !DILocation(line: 38, column: 16, scope: !48)
!54 = !DILocation(line: 38, column: 22, scope: !48)
!55 = !DILocation(line: 38, column: 9, scope: !48)
!56 = !DILocation(line: 39, column: 20, scope: !48)
!57 = !DILocation(line: 39, column: 9, scope: !48)
!58 = !DILocation(line: 41, column: 1, scope: !15)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_17_good", scope: !16, file: !16, line: 68, type: !17, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 70, column: 5, scope: !59)
!61 = !DILocation(line: 71, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 83, type: !63, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !16, line: 83, type: !7)
!69 = !DILocation(line: 83, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !16, line: 83, type: !65)
!71 = !DILocation(line: 83, column: 27, scope: !62)
!72 = !DILocation(line: 86, column: 22, scope: !62)
!73 = !DILocation(line: 86, column: 12, scope: !62)
!74 = !DILocation(line: 86, column: 5, scope: !62)
!75 = !DILocation(line: 88, column: 5, scope: !62)
!76 = !DILocation(line: 89, column: 5, scope: !62)
!77 = !DILocation(line: 90, column: 5, scope: !62)
!78 = !DILocation(line: 93, column: 5, scope: !62)
!79 = !DILocation(line: 94, column: 5, scope: !62)
!80 = !DILocation(line: 95, column: 5, scope: !62)
!81 = !DILocation(line: 97, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "h", scope: !82, file: !16, line: 50, type: !7)
!84 = !DILocation(line: 50, column: 9, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !16, line: 51, type: !4)
!86 = !DILocation(line: 51, column: 15, scope: !82)
!87 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !16, line: 52, type: !4)
!88 = !DILocation(line: 52, column: 15, scope: !82)
!89 = !DILocation(line: 52, column: 39, scope: !82)
!90 = !DILocation(line: 52, column: 28, scope: !82)
!91 = !DILocation(line: 53, column: 12, scope: !82)
!92 = !DILocation(line: 53, column: 10, scope: !82)
!93 = !DILocation(line: 54, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !16, line: 54, column: 5)
!95 = !DILocation(line: 54, column: 9, scope: !94)
!96 = !DILocation(line: 54, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !16, line: 54, column: 5)
!98 = !DILocation(line: 54, column: 18, scope: !97)
!99 = !DILocation(line: 54, column: 5, scope: !94)
!100 = !DILocation(line: 57, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !16, line: 55, column: 5)
!102 = !DILocation(line: 57, column: 9, scope: !101)
!103 = !DILocation(line: 58, column: 9, scope: !101)
!104 = !DILocation(line: 58, column: 20, scope: !101)
!105 = !DILocation(line: 59, column: 5, scope: !101)
!106 = !DILocation(line: 54, column: 24, scope: !97)
!107 = !DILocation(line: 54, column: 5, scope: !97)
!108 = distinct !{!108, !99, !109, !46}
!109 = !DILocation(line: 59, column: 5, scope: !94)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !16, line: 61, type: !49)
!111 = distinct !DILexicalBlock(scope: !82, file: !16, line: 60, column: 5)
!112 = !DILocation(line: 61, column: 17, scope: !111)
!113 = !DILocation(line: 63, column: 16, scope: !111)
!114 = !DILocation(line: 63, column: 22, scope: !111)
!115 = !DILocation(line: 63, column: 9, scope: !111)
!116 = !DILocation(line: 64, column: 20, scope: !111)
!117 = !DILocation(line: 64, column: 9, scope: !111)
!118 = !DILocation(line: 66, column: 1, scope: !82)
