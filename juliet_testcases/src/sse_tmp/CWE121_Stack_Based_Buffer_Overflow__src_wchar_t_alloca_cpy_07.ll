; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %3 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %3, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %7 = load i32*, i32** %data, align 8, !dbg !47
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #5, !dbg !48
  %8 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %8), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %2, i32** %data, align 8, !dbg !84
  %3 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp ne i32 %3, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #5, !dbg !102
  %8 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 400, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBuffer, align 8, !dbg !110
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %2, i32** %data, align 8, !dbg !114
  %3 = load i32, i32* @staticFive, align 4, !dbg !115
  %cmp = icmp eq i32 %3, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !119
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !121
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !128
  %7 = load i32*, i32** %data, align 8, !dbg !129
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #5, !dbg !130
  %8 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* %8), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 39, scope: !19)
!27 = !DILocation(line: 32, column: 28, scope: !19)
!28 = !DILocation(line: 33, column: 12, scope: !19)
!29 = !DILocation(line: 33, column: 10, scope: !19)
!30 = !DILocation(line: 34, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !19, file: !12, line: 34, column: 8)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 8, scope: !19)
!34 = !DILocation(line: 37, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 9, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !12, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 17, scope: !41)
!46 = !DILocation(line: 43, column: 16, scope: !41)
!47 = !DILocation(line: 43, column: 22, scope: !41)
!48 = !DILocation(line: 43, column: 9, scope: !41)
!49 = !DILocation(line: 44, column: 20, scope: !41)
!50 = !DILocation(line: 44, column: 9, scope: !41)
!51 = !DILocation(line: 46, column: 1, scope: !19)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_07_good", scope: !12, file: !12, line: 97, type: !20, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 99, column: 5, scope: !52)
!54 = !DILocation(line: 100, column: 5, scope: !52)
!55 = !DILocation(line: 101, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !57, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9, !9, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 113, type: !9)
!63 = !DILocation(line: 113, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 113, type: !59)
!65 = !DILocation(line: 113, column: 27, scope: !56)
!66 = !DILocation(line: 116, column: 22, scope: !56)
!67 = !DILocation(line: 116, column: 12, scope: !56)
!68 = !DILocation(line: 116, column: 5, scope: !56)
!69 = !DILocation(line: 118, column: 5, scope: !56)
!70 = !DILocation(line: 119, column: 5, scope: !56)
!71 = !DILocation(line: 120, column: 5, scope: !56)
!72 = !DILocation(line: 123, column: 5, scope: !56)
!73 = !DILocation(line: 124, column: 5, scope: !56)
!74 = !DILocation(line: 125, column: 5, scope: !56)
!75 = !DILocation(line: 127, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !20, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 55, type: !6)
!78 = !DILocation(line: 55, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 56, type: !6)
!80 = !DILocation(line: 56, column: 15, scope: !76)
!81 = !DILocation(line: 56, column: 39, scope: !76)
!82 = !DILocation(line: 56, column: 28, scope: !76)
!83 = !DILocation(line: 57, column: 12, scope: !76)
!84 = !DILocation(line: 57, column: 10, scope: !76)
!85 = !DILocation(line: 58, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !12, line: 58, column: 8)
!87 = !DILocation(line: 58, column: 18, scope: !86)
!88 = !DILocation(line: 58, column: 8, scope: !76)
!89 = !DILocation(line: 61, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !12, line: 59, column: 5)
!91 = !DILocation(line: 62, column: 5, scope: !90)
!92 = !DILocation(line: 66, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !12, line: 64, column: 5)
!94 = !DILocation(line: 66, column: 9, scope: !93)
!95 = !DILocation(line: 67, column: 9, scope: !93)
!96 = !DILocation(line: 67, column: 20, scope: !93)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 70, type: !42)
!98 = distinct !DILexicalBlock(scope: !76, file: !12, line: 69, column: 5)
!99 = !DILocation(line: 70, column: 17, scope: !98)
!100 = !DILocation(line: 72, column: 16, scope: !98)
!101 = !DILocation(line: 72, column: 22, scope: !98)
!102 = !DILocation(line: 72, column: 9, scope: !98)
!103 = !DILocation(line: 73, column: 20, scope: !98)
!104 = !DILocation(line: 73, column: 9, scope: !98)
!105 = !DILocation(line: 75, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 78, type: !20, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 80, type: !6)
!108 = !DILocation(line: 80, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !12, line: 81, type: !6)
!110 = !DILocation(line: 81, column: 15, scope: !106)
!111 = !DILocation(line: 81, column: 39, scope: !106)
!112 = !DILocation(line: 81, column: 28, scope: !106)
!113 = !DILocation(line: 82, column: 12, scope: !106)
!114 = !DILocation(line: 82, column: 10, scope: !106)
!115 = !DILocation(line: 83, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !12, line: 83, column: 8)
!117 = !DILocation(line: 83, column: 18, scope: !116)
!118 = !DILocation(line: 83, column: 8, scope: !106)
!119 = !DILocation(line: 86, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 84, column: 5)
!121 = !DILocation(line: 86, column: 9, scope: !120)
!122 = !DILocation(line: 87, column: 9, scope: !120)
!123 = !DILocation(line: 87, column: 20, scope: !120)
!124 = !DILocation(line: 88, column: 5, scope: !120)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !12, line: 90, type: !42)
!126 = distinct !DILexicalBlock(scope: !106, file: !12, line: 89, column: 5)
!127 = !DILocation(line: 90, column: 17, scope: !126)
!128 = !DILocation(line: 92, column: 16, scope: !126)
!129 = !DILocation(line: 92, column: 22, scope: !126)
!130 = !DILocation(line: 92, column: 9, scope: !126)
!131 = !DILocation(line: 93, column: 20, scope: !126)
!132 = !DILocation(line: 93, column: 9, scope: !126)
!133 = !DILocation(line: 95, column: 1, scope: !106)
