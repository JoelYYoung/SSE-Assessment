; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !28
  store i32* %arraydecay, i32** %data, align 8, !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 1, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %3, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !53
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !58
  %7 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %7), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17_good() #0 !dbg !62 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  store i32 0, i32* %h, align 4, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !97
  %cmp = icmp slt i32 %0, 1, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !103
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %h, align 4, !dbg !107
  %inc = add nsw i32 %3, 1, !dbg !107
  store i32 %inc, i32* %h, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !113
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !116
  %6 = load i32*, i32** %data, align 8, !dbg !117
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !118
  %7 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %7), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 31, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DILocation(line: 32, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 33, column: 13, scope: !11)
!28 = !DILocation(line: 34, column: 12, scope: !11)
!29 = !DILocation(line: 34, column: 10, scope: !11)
!30 = !DILocation(line: 35, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!32 = !DILocation(line: 35, column: 9, scope: !31)
!33 = !DILocation(line: 35, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 35, column: 5)
!35 = !DILocation(line: 35, column: 18, scope: !34)
!36 = !DILocation(line: 35, column: 5, scope: !31)
!37 = !DILocation(line: 38, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 9, scope: !38)
!40 = !DILocation(line: 39, column: 9, scope: !38)
!41 = !DILocation(line: 39, column: 21, scope: !38)
!42 = !DILocation(line: 40, column: 5, scope: !38)
!43 = !DILocation(line: 35, column: 24, scope: !34)
!44 = !DILocation(line: 35, column: 5, scope: !34)
!45 = distinct !{!45, !36, !46, !47}
!46 = !DILocation(line: 40, column: 5, scope: !31)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 42, type: !50)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1600, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 42, column: 17, scope: !49)
!54 = !DILocation(line: 44, column: 18, scope: !49)
!55 = !DILocation(line: 44, column: 31, scope: !49)
!56 = !DILocation(line: 44, column: 24, scope: !49)
!57 = !DILocation(line: 44, column: 45, scope: !49)
!58 = !DILocation(line: 44, column: 9, scope: !49)
!59 = !DILocation(line: 45, column: 20, scope: !49)
!60 = !DILocation(line: 45, column: 9, scope: !49)
!61 = !DILocation(line: 47, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_17_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 76, column: 5, scope: !62)
!64 = !DILocation(line: 77, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !66, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!16, !16, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 89, type: !16)
!72 = !DILocation(line: 89, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 89, type: !68)
!74 = !DILocation(line: 89, column: 27, scope: !65)
!75 = !DILocation(line: 92, column: 22, scope: !65)
!76 = !DILocation(line: 92, column: 12, scope: !65)
!77 = !DILocation(line: 92, column: 5, scope: !65)
!78 = !DILocation(line: 94, column: 5, scope: !65)
!79 = !DILocation(line: 95, column: 5, scope: !65)
!80 = !DILocation(line: 96, column: 5, scope: !65)
!81 = !DILocation(line: 99, column: 5, scope: !65)
!82 = !DILocation(line: 100, column: 5, scope: !65)
!83 = !DILocation(line: 101, column: 5, scope: !65)
!84 = !DILocation(line: 103, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "h", scope: !85, file: !12, line: 56, type: !16)
!87 = !DILocation(line: 56, column: 9, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 57, type: !19)
!89 = !DILocation(line: 57, column: 15, scope: !85)
!90 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !12, line: 58, type: !24)
!91 = !DILocation(line: 58, column: 13, scope: !85)
!92 = !DILocation(line: 59, column: 12, scope: !85)
!93 = !DILocation(line: 59, column: 10, scope: !85)
!94 = !DILocation(line: 60, column: 11, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !12, line: 60, column: 5)
!96 = !DILocation(line: 60, column: 9, scope: !95)
!97 = !DILocation(line: 60, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 60, column: 5)
!99 = !DILocation(line: 60, column: 18, scope: !98)
!100 = !DILocation(line: 60, column: 5, scope: !95)
!101 = !DILocation(line: 63, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 61, column: 5)
!103 = !DILocation(line: 63, column: 9, scope: !102)
!104 = !DILocation(line: 64, column: 9, scope: !102)
!105 = !DILocation(line: 64, column: 20, scope: !102)
!106 = !DILocation(line: 65, column: 5, scope: !102)
!107 = !DILocation(line: 60, column: 24, scope: !98)
!108 = !DILocation(line: 60, column: 5, scope: !98)
!109 = distinct !{!109, !100, !110, !47}
!110 = !DILocation(line: 65, column: 5, scope: !95)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 67, type: !50)
!112 = distinct !DILexicalBlock(scope: !85, file: !12, line: 66, column: 5)
!113 = !DILocation(line: 67, column: 17, scope: !112)
!114 = !DILocation(line: 69, column: 18, scope: !112)
!115 = !DILocation(line: 69, column: 31, scope: !112)
!116 = !DILocation(line: 69, column: 24, scope: !112)
!117 = !DILocation(line: 69, column: 45, scope: !112)
!118 = !DILocation(line: 69, column: 9, scope: !112)
!119 = !DILocation(line: 70, column: 20, scope: !112)
!120 = !DILocation(line: 70, column: 9, scope: !112)
!121 = !DILocation(line: 72, column: 1, scope: !85)
