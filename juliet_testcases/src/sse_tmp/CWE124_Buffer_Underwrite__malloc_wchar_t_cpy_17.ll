; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !36
  %1 = bitcast i8* %call to i32*, !dbg !37
  store i32* %1, i32** %dataBuffer, align 8, !dbg !35
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %cmp1 = icmp eq i32* %2, null, !dbg !40
  br i1 %cmp1, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !45
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !48
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !49
  store i32* %add.ptr, i32** %data, align 8, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %6, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !57, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !63
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !64
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx4, align 4, !dbg !66
  %7 = load i32*, i32** %data, align 8, !dbg !67
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !68
  %call6 = call i32* @wcscpy(i32* %7, i32* %arraydecay5) #5, !dbg !69
  %8 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %8), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  store i32 0, i32* %h, align 4, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !105
  %cmp = icmp slt i32 %0, 1, !dbg !107
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !113
  %1 = bitcast i8* %call to i32*, !dbg !114
  store i32* %1, i32** %dataBuffer, align 8, !dbg !112
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %cmp1 = icmp eq i32* %2, null, !dbg !117
  br i1 %cmp1, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !122
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !125
  store i32* %5, i32** %data, align 8, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %h, align 4, !dbg !128
  %inc = add nsw i32 %6, 1, !dbg !128
  store i32 %inc, i32* %h, align 4, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !136
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx4, align 4, !dbg !138
  %7 = load i32*, i32** %data, align 8, !dbg !139
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %call6 = call i32* @wcscpy(i32* %7, i32* %arraydecay5) #5, !dbg !141
  %8 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* %8), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !17, line: 31, type: !4)
!33 = distinct !DILexicalBlock(scope: !34, file: !17, line: 30, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 5)
!35 = !DILocation(line: 31, column: 23, scope: !33)
!36 = !DILocation(line: 31, column: 47, scope: !33)
!37 = !DILocation(line: 31, column: 36, scope: !33)
!38 = !DILocation(line: 32, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !17, line: 32, column: 17)
!40 = !DILocation(line: 32, column: 28, scope: !39)
!41 = !DILocation(line: 32, column: 17, scope: !33)
!42 = !DILocation(line: 32, column: 38, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 32, column: 37)
!44 = !DILocation(line: 33, column: 21, scope: !33)
!45 = !DILocation(line: 33, column: 13, scope: !33)
!46 = !DILocation(line: 34, column: 13, scope: !33)
!47 = !DILocation(line: 34, column: 31, scope: !33)
!48 = !DILocation(line: 36, column: 20, scope: !33)
!49 = !DILocation(line: 36, column: 31, scope: !33)
!50 = !DILocation(line: 36, column: 18, scope: !33)
!51 = !DILocation(line: 38, column: 5, scope: !34)
!52 = !DILocation(line: 28, column: 24, scope: !29)
!53 = !DILocation(line: 28, column: 5, scope: !29)
!54 = distinct !{!54, !31, !55, !56}
!55 = !DILocation(line: 38, column: 5, scope: !26)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocalVariable(name: "source", scope: !58, file: !17, line: 40, type: !59)
!58 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 100)
!62 = !DILocation(line: 40, column: 17, scope: !58)
!63 = !DILocation(line: 41, column: 17, scope: !58)
!64 = !DILocation(line: 41, column: 9, scope: !58)
!65 = !DILocation(line: 42, column: 9, scope: !58)
!66 = !DILocation(line: 42, column: 23, scope: !58)
!67 = !DILocation(line: 44, column: 16, scope: !58)
!68 = !DILocation(line: 44, column: 22, scope: !58)
!69 = !DILocation(line: 44, column: 9, scope: !58)
!70 = !DILocation(line: 45, column: 20, scope: !58)
!71 = !DILocation(line: 45, column: 9, scope: !58)
!72 = !DILocation(line: 49, column: 1, scope: !16)
!73 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_17_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 86, column: 5, scope: !73)
!75 = !DILocation(line: 87, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !77, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!7, !7, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !17, line: 99, type: !7)
!83 = !DILocation(line: 99, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !17, line: 99, type: !79)
!85 = !DILocation(line: 99, column: 27, scope: !76)
!86 = !DILocation(line: 102, column: 22, scope: !76)
!87 = !DILocation(line: 102, column: 12, scope: !76)
!88 = !DILocation(line: 102, column: 5, scope: !76)
!89 = !DILocation(line: 104, column: 5, scope: !76)
!90 = !DILocation(line: 105, column: 5, scope: !76)
!91 = !DILocation(line: 106, column: 5, scope: !76)
!92 = !DILocation(line: 109, column: 5, scope: !76)
!93 = !DILocation(line: 110, column: 5, scope: !76)
!94 = !DILocation(line: 111, column: 5, scope: !76)
!95 = !DILocation(line: 113, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "h", scope: !96, file: !17, line: 58, type: !7)
!98 = !DILocation(line: 58, column: 9, scope: !96)
!99 = !DILocalVariable(name: "data", scope: !96, file: !17, line: 59, type: !4)
!100 = !DILocation(line: 59, column: 15, scope: !96)
!101 = !DILocation(line: 60, column: 10, scope: !96)
!102 = !DILocation(line: 61, column: 11, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !17, line: 61, column: 5)
!104 = !DILocation(line: 61, column: 9, scope: !103)
!105 = !DILocation(line: 61, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !17, line: 61, column: 5)
!107 = !DILocation(line: 61, column: 18, scope: !106)
!108 = !DILocation(line: 61, column: 5, scope: !103)
!109 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !17, line: 64, type: !4)
!110 = distinct !DILexicalBlock(scope: !111, file: !17, line: 63, column: 9)
!111 = distinct !DILexicalBlock(scope: !106, file: !17, line: 62, column: 5)
!112 = !DILocation(line: 64, column: 23, scope: !110)
!113 = !DILocation(line: 64, column: 47, scope: !110)
!114 = !DILocation(line: 64, column: 36, scope: !110)
!115 = !DILocation(line: 65, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !17, line: 65, column: 17)
!117 = !DILocation(line: 65, column: 28, scope: !116)
!118 = !DILocation(line: 65, column: 17, scope: !110)
!119 = !DILocation(line: 65, column: 38, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !17, line: 65, column: 37)
!121 = !DILocation(line: 66, column: 21, scope: !110)
!122 = !DILocation(line: 66, column: 13, scope: !110)
!123 = !DILocation(line: 67, column: 13, scope: !110)
!124 = !DILocation(line: 67, column: 31, scope: !110)
!125 = !DILocation(line: 69, column: 20, scope: !110)
!126 = !DILocation(line: 69, column: 18, scope: !110)
!127 = !DILocation(line: 71, column: 5, scope: !111)
!128 = !DILocation(line: 61, column: 24, scope: !106)
!129 = !DILocation(line: 61, column: 5, scope: !106)
!130 = distinct !{!130, !108, !131, !56}
!131 = !DILocation(line: 71, column: 5, scope: !103)
!132 = !DILocalVariable(name: "source", scope: !133, file: !17, line: 73, type: !59)
!133 = distinct !DILexicalBlock(scope: !96, file: !17, line: 72, column: 5)
!134 = !DILocation(line: 73, column: 17, scope: !133)
!135 = !DILocation(line: 74, column: 17, scope: !133)
!136 = !DILocation(line: 74, column: 9, scope: !133)
!137 = !DILocation(line: 75, column: 9, scope: !133)
!138 = !DILocation(line: 75, column: 23, scope: !133)
!139 = !DILocation(line: 77, column: 16, scope: !133)
!140 = !DILocation(line: 77, column: 22, scope: !133)
!141 = !DILocation(line: 77, column: 9, scope: !133)
!142 = !DILocation(line: 78, column: 20, scope: !133)
!143 = !DILocation(line: 78, column: 9, scope: !133)
!144 = !DILocation(line: 82, column: 1, scope: !96)
