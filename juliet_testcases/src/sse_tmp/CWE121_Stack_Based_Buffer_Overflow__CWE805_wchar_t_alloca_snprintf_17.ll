; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 200, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 400, align 16, !dbg !29
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %4, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  store i32* %5, i32** %data, align 8, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %7, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !56
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx1, align 4, !dbg !58
  %8 = load i32*, i32** %data, align 8, !dbg !59
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !60
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %8, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #4, !dbg !61
  %9 = load i32*, i32** %data, align 8, !dbg !62
  call void @printWLine(i32* %9), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #4, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #4, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 200, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %2 = alloca i8, i64 400, align 16, !dbg !99
  %3 = bitcast i8* %2 to i32*, !dbg !100
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32 0, i32* %h, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !104
  %cmp = icmp slt i32 %4, 1, !dbg !106
  br i1 %cmp, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !108
  store i32* %5, i32** %data, align 8, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %h, align 4, !dbg !114
  %inc = add nsw i32 %7, 1, !dbg !114
  store i32 %inc, i32* %h, align 4, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !122
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx1, align 4, !dbg !124
  %8 = load i32*, i32** %data, align 8, !dbg !125
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %8, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #4, !dbg !127
  %9 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %9), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 31, type: !7)
!20 = !DILocation(line: 31, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 32, type: !4)
!22 = !DILocation(line: 32, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!24 = !DILocation(line: 33, column: 15, scope: !15)
!25 = !DILocation(line: 33, column: 42, scope: !15)
!26 = !DILocation(line: 33, column: 31, scope: !15)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!28 = !DILocation(line: 34, column: 15, scope: !15)
!29 = !DILocation(line: 34, column: 43, scope: !15)
!30 = !DILocation(line: 34, column: 32, scope: !15)
!31 = !DILocation(line: 35, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!33 = !DILocation(line: 35, column: 9, scope: !32)
!34 = !DILocation(line: 35, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !16, line: 35, column: 5)
!36 = !DILocation(line: 35, column: 18, scope: !35)
!37 = !DILocation(line: 35, column: 5, scope: !32)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 36, column: 5)
!40 = !DILocation(line: 39, column: 14, scope: !39)
!41 = !DILocation(line: 40, column: 9, scope: !39)
!42 = !DILocation(line: 40, column: 17, scope: !39)
!43 = !DILocation(line: 41, column: 5, scope: !39)
!44 = !DILocation(line: 35, column: 24, scope: !35)
!45 = !DILocation(line: 35, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 41, column: 5, scope: !32)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "source", scope: !50, file: !16, line: 43, type: !51)
!50 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 43, column: 17, scope: !50)
!55 = !DILocation(line: 44, column: 17, scope: !50)
!56 = !DILocation(line: 44, column: 9, scope: !50)
!57 = !DILocation(line: 45, column: 9, scope: !50)
!58 = !DILocation(line: 45, column: 23, scope: !50)
!59 = !DILocation(line: 47, column: 18, scope: !50)
!60 = !DILocation(line: 47, column: 36, scope: !50)
!61 = !DILocation(line: 47, column: 9, scope: !50)
!62 = !DILocation(line: 48, column: 20, scope: !50)
!63 = !DILocation(line: 48, column: 9, scope: !50)
!64 = !DILocation(line: 50, column: 1, scope: !15)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_17_good", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 81, column: 5, scope: !65)
!67 = !DILocation(line: 82, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !69, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !16, line: 94, type: !7)
!75 = !DILocation(line: 94, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !16, line: 94, type: !71)
!77 = !DILocation(line: 94, column: 27, scope: !68)
!78 = !DILocation(line: 97, column: 22, scope: !68)
!79 = !DILocation(line: 97, column: 12, scope: !68)
!80 = !DILocation(line: 97, column: 5, scope: !68)
!81 = !DILocation(line: 99, column: 5, scope: !68)
!82 = !DILocation(line: 100, column: 5, scope: !68)
!83 = !DILocation(line: 101, column: 5, scope: !68)
!84 = !DILocation(line: 104, column: 5, scope: !68)
!85 = !DILocation(line: 105, column: 5, scope: !68)
!86 = !DILocation(line: 106, column: 5, scope: !68)
!87 = !DILocation(line: 108, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "h", scope: !88, file: !16, line: 59, type: !7)
!90 = !DILocation(line: 59, column: 9, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !16, line: 60, type: !4)
!92 = !DILocation(line: 60, column: 15, scope: !88)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !16, line: 61, type: !4)
!94 = !DILocation(line: 61, column: 15, scope: !88)
!95 = !DILocation(line: 61, column: 42, scope: !88)
!96 = !DILocation(line: 61, column: 31, scope: !88)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !16, line: 62, type: !4)
!98 = !DILocation(line: 62, column: 15, scope: !88)
!99 = !DILocation(line: 62, column: 43, scope: !88)
!100 = !DILocation(line: 62, column: 32, scope: !88)
!101 = !DILocation(line: 63, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !88, file: !16, line: 63, column: 5)
!103 = !DILocation(line: 63, column: 9, scope: !102)
!104 = !DILocation(line: 63, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !16, line: 63, column: 5)
!106 = !DILocation(line: 63, column: 18, scope: !105)
!107 = !DILocation(line: 63, column: 5, scope: !102)
!108 = !DILocation(line: 66, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !16, line: 64, column: 5)
!110 = !DILocation(line: 66, column: 14, scope: !109)
!111 = !DILocation(line: 67, column: 9, scope: !109)
!112 = !DILocation(line: 67, column: 17, scope: !109)
!113 = !DILocation(line: 68, column: 5, scope: !109)
!114 = !DILocation(line: 63, column: 24, scope: !105)
!115 = !DILocation(line: 63, column: 5, scope: !105)
!116 = distinct !{!116, !107, !117, !48}
!117 = !DILocation(line: 68, column: 5, scope: !102)
!118 = !DILocalVariable(name: "source", scope: !119, file: !16, line: 70, type: !51)
!119 = distinct !DILexicalBlock(scope: !88, file: !16, line: 69, column: 5)
!120 = !DILocation(line: 70, column: 17, scope: !119)
!121 = !DILocation(line: 71, column: 17, scope: !119)
!122 = !DILocation(line: 71, column: 9, scope: !119)
!123 = !DILocation(line: 72, column: 9, scope: !119)
!124 = !DILocation(line: 72, column: 23, scope: !119)
!125 = !DILocation(line: 74, column: 18, scope: !119)
!126 = !DILocation(line: 74, column: 36, scope: !119)
!127 = !DILocation(line: 74, column: 9, scope: !119)
!128 = !DILocation(line: 75, column: 20, scope: !119)
!129 = !DILocation(line: 75, column: 9, scope: !119)
!130 = !DILocation(line: 77, column: 1, scope: !88)
