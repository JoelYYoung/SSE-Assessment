; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17_bad() #0 !dbg !15 {
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
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !38
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
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !55
  %9 = load i32*, i32** %data, align 8, !dbg !56
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !57
  %10 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %10), !dbg !59
  ret void, !dbg !60
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17_good() #0 !dbg !61 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 400, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBuffer, align 8, !dbg !90
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  store i32* %2, i32** %data, align 8, !dbg !94
  store i32 0, i32* %h, align 4, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %h, align 4, !dbg !98
  %cmp = icmp slt i32 %3, 1, !dbg !100
  br i1 %cmp, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !108
  %inc = add nsw i32 %6, 1, !dbg !108
  store i32 %inc, i32* %h, align 4, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !115
  %8 = load i32*, i32** %data, align 8, !dbg !116
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !117
  %9 = load i32*, i32** %data, align 8, !dbg !118
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !119
  %10 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %10), !dbg !121
  ret void, !dbg !122
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 31, type: !7)
!20 = !DILocation(line: 31, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 32, type: !4)
!22 = !DILocation(line: 32, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 33, type: !4)
!24 = !DILocation(line: 33, column: 15, scope: !15)
!25 = !DILocation(line: 33, column: 39, scope: !15)
!26 = !DILocation(line: 33, column: 28, scope: !15)
!27 = !DILocation(line: 34, column: 12, scope: !15)
!28 = !DILocation(line: 34, column: 10, scope: !15)
!29 = !DILocation(line: 35, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!31 = !DILocation(line: 35, column: 9, scope: !30)
!32 = !DILocation(line: 35, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 35, column: 5)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 5, scope: !30)
!36 = !DILocation(line: 38, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !16, line: 36, column: 5)
!38 = !DILocation(line: 38, column: 9, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 21, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocation(line: 35, column: 24, scope: !33)
!43 = !DILocation(line: 35, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 40, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !16, line: 42, type: !49)
!48 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 42, column: 17, scope: !48)
!53 = !DILocation(line: 44, column: 18, scope: !48)
!54 = !DILocation(line: 44, column: 31, scope: !48)
!55 = !DILocation(line: 44, column: 24, scope: !48)
!56 = !DILocation(line: 44, column: 45, scope: !48)
!57 = !DILocation(line: 44, column: 9, scope: !48)
!58 = !DILocation(line: 45, column: 20, scope: !48)
!59 = !DILocation(line: 45, column: 9, scope: !48)
!60 = !DILocation(line: 47, column: 1, scope: !15)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_17_good", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 76, column: 5, scope: !61)
!63 = !DILocation(line: 77, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 89, type: !65, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !16, line: 89, type: !7)
!71 = !DILocation(line: 89, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !16, line: 89, type: !67)
!73 = !DILocation(line: 89, column: 27, scope: !64)
!74 = !DILocation(line: 92, column: 22, scope: !64)
!75 = !DILocation(line: 92, column: 12, scope: !64)
!76 = !DILocation(line: 92, column: 5, scope: !64)
!77 = !DILocation(line: 94, column: 5, scope: !64)
!78 = !DILocation(line: 95, column: 5, scope: !64)
!79 = !DILocation(line: 96, column: 5, scope: !64)
!80 = !DILocation(line: 99, column: 5, scope: !64)
!81 = !DILocation(line: 100, column: 5, scope: !64)
!82 = !DILocation(line: 101, column: 5, scope: !64)
!83 = !DILocation(line: 103, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "h", scope: !84, file: !16, line: 56, type: !7)
!86 = !DILocation(line: 56, column: 9, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !16, line: 57, type: !4)
!88 = !DILocation(line: 57, column: 15, scope: !84)
!89 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !16, line: 58, type: !4)
!90 = !DILocation(line: 58, column: 15, scope: !84)
!91 = !DILocation(line: 58, column: 39, scope: !84)
!92 = !DILocation(line: 58, column: 28, scope: !84)
!93 = !DILocation(line: 59, column: 12, scope: !84)
!94 = !DILocation(line: 59, column: 10, scope: !84)
!95 = !DILocation(line: 60, column: 11, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !16, line: 60, column: 5)
!97 = !DILocation(line: 60, column: 9, scope: !96)
!98 = !DILocation(line: 60, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !16, line: 60, column: 5)
!100 = !DILocation(line: 60, column: 18, scope: !99)
!101 = !DILocation(line: 60, column: 5, scope: !96)
!102 = !DILocation(line: 63, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !16, line: 61, column: 5)
!104 = !DILocation(line: 63, column: 9, scope: !103)
!105 = !DILocation(line: 64, column: 9, scope: !103)
!106 = !DILocation(line: 64, column: 20, scope: !103)
!107 = !DILocation(line: 65, column: 5, scope: !103)
!108 = !DILocation(line: 60, column: 24, scope: !99)
!109 = !DILocation(line: 60, column: 5, scope: !99)
!110 = distinct !{!110, !101, !111, !46}
!111 = !DILocation(line: 65, column: 5, scope: !96)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !16, line: 67, type: !49)
!113 = distinct !DILexicalBlock(scope: !84, file: !16, line: 66, column: 5)
!114 = !DILocation(line: 67, column: 17, scope: !113)
!115 = !DILocation(line: 69, column: 18, scope: !113)
!116 = !DILocation(line: 69, column: 31, scope: !113)
!117 = !DILocation(line: 69, column: 24, scope: !113)
!118 = !DILocation(line: 69, column: 45, scope: !113)
!119 = !DILocation(line: 69, column: 9, scope: !113)
!120 = !DILocation(line: 70, column: 20, scope: !113)
!121 = !DILocation(line: 70, column: 9, scope: !113)
!122 = !DILocation(line: 72, column: 1, scope: !84)
