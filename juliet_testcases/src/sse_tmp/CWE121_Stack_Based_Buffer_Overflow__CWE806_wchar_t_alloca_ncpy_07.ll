; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07_bad() #0 !dbg !19 {
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
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !36
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
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !49
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call1) #6, !dbg !50
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !51
  store i32 0, i32* %arrayidx3, align 4, !dbg !52
  %9 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %9), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 400, align 16, !dbg !85
  %1 = bitcast i8* %0 to i32*, !dbg !86
  store i32* %1, i32** %dataBuffer, align 8, !dbg !84
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  store i32* %2, i32** %data, align 8, !dbg !88
  %3 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp ne i32 %3, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !96
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !105
  %8 = load i32*, i32** %data, align 8, !dbg !106
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !107
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call1) #6, !dbg !108
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !109
  store i32 0, i32* %arrayidx3, align 4, !dbg !110
  %9 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %9), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 400, align 16, !dbg !119
  %1 = bitcast i8* %0 to i32*, !dbg !120
  store i32* %1, i32** %dataBuffer, align 8, !dbg !118
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %2, i32** %data, align 8, !dbg !122
  %3 = load i32, i32* @staticFive, align 4, !dbg !123
  %cmp = icmp eq i32 %3, 5, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !127
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !129
  %5 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !135
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !136
  %7 = load i32*, i32** %data, align 8, !dbg !137
  %8 = load i32*, i32** %data, align 8, !dbg !138
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !139
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call1) #6, !dbg !140
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !141
  store i32 0, i32* %arrayidx3, align 4, !dbg !142
  %9 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %9), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!46 = !DILocation(line: 43, column: 17, scope: !41)
!47 = !DILocation(line: 43, column: 23, scope: !41)
!48 = !DILocation(line: 43, column: 36, scope: !41)
!49 = !DILocation(line: 43, column: 29, scope: !41)
!50 = !DILocation(line: 43, column: 9, scope: !41)
!51 = !DILocation(line: 44, column: 9, scope: !41)
!52 = !DILocation(line: 44, column: 20, scope: !41)
!53 = !DILocation(line: 45, column: 20, scope: !41)
!54 = !DILocation(line: 45, column: 9, scope: !41)
!55 = !DILocation(line: 47, column: 1, scope: !19)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_07_good", scope: !12, file: !12, line: 100, type: !20, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 102, column: 5, scope: !56)
!58 = !DILocation(line: 103, column: 5, scope: !56)
!59 = !DILocation(line: 104, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !61, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!9, !9, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 116, type: !9)
!67 = !DILocation(line: 116, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 116, type: !63)
!69 = !DILocation(line: 116, column: 27, scope: !60)
!70 = !DILocation(line: 119, column: 22, scope: !60)
!71 = !DILocation(line: 119, column: 12, scope: !60)
!72 = !DILocation(line: 119, column: 5, scope: !60)
!73 = !DILocation(line: 121, column: 5, scope: !60)
!74 = !DILocation(line: 122, column: 5, scope: !60)
!75 = !DILocation(line: 123, column: 5, scope: !60)
!76 = !DILocation(line: 126, column: 5, scope: !60)
!77 = !DILocation(line: 127, column: 5, scope: !60)
!78 = !DILocation(line: 128, column: 5, scope: !60)
!79 = !DILocation(line: 130, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 56, type: !6)
!82 = !DILocation(line: 56, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !12, line: 57, type: !6)
!84 = !DILocation(line: 57, column: 15, scope: !80)
!85 = !DILocation(line: 57, column: 39, scope: !80)
!86 = !DILocation(line: 57, column: 28, scope: !80)
!87 = !DILocation(line: 58, column: 12, scope: !80)
!88 = !DILocation(line: 58, column: 10, scope: !80)
!89 = !DILocation(line: 59, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !12, line: 59, column: 8)
!91 = !DILocation(line: 59, column: 18, scope: !90)
!92 = !DILocation(line: 59, column: 8, scope: !80)
!93 = !DILocation(line: 62, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !12, line: 60, column: 5)
!95 = !DILocation(line: 63, column: 5, scope: !94)
!96 = !DILocation(line: 67, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !12, line: 65, column: 5)
!98 = !DILocation(line: 67, column: 9, scope: !97)
!99 = !DILocation(line: 68, column: 9, scope: !97)
!100 = !DILocation(line: 68, column: 20, scope: !97)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !12, line: 71, type: !42)
!102 = distinct !DILexicalBlock(scope: !80, file: !12, line: 70, column: 5)
!103 = !DILocation(line: 71, column: 17, scope: !102)
!104 = !DILocation(line: 73, column: 17, scope: !102)
!105 = !DILocation(line: 73, column: 23, scope: !102)
!106 = !DILocation(line: 73, column: 36, scope: !102)
!107 = !DILocation(line: 73, column: 29, scope: !102)
!108 = !DILocation(line: 73, column: 9, scope: !102)
!109 = !DILocation(line: 74, column: 9, scope: !102)
!110 = !DILocation(line: 74, column: 20, scope: !102)
!111 = !DILocation(line: 75, column: 20, scope: !102)
!112 = !DILocation(line: 75, column: 9, scope: !102)
!113 = !DILocation(line: 77, column: 1, scope: !80)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 82, type: !6)
!116 = !DILocation(line: 82, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !12, line: 83, type: !6)
!118 = !DILocation(line: 83, column: 15, scope: !114)
!119 = !DILocation(line: 83, column: 39, scope: !114)
!120 = !DILocation(line: 83, column: 28, scope: !114)
!121 = !DILocation(line: 84, column: 12, scope: !114)
!122 = !DILocation(line: 84, column: 10, scope: !114)
!123 = !DILocation(line: 85, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !12, line: 85, column: 8)
!125 = !DILocation(line: 85, column: 18, scope: !124)
!126 = !DILocation(line: 85, column: 8, scope: !114)
!127 = !DILocation(line: 88, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 86, column: 5)
!129 = !DILocation(line: 88, column: 9, scope: !128)
!130 = !DILocation(line: 89, column: 9, scope: !128)
!131 = !DILocation(line: 89, column: 20, scope: !128)
!132 = !DILocation(line: 90, column: 5, scope: !128)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !12, line: 92, type: !42)
!134 = distinct !DILexicalBlock(scope: !114, file: !12, line: 91, column: 5)
!135 = !DILocation(line: 92, column: 17, scope: !134)
!136 = !DILocation(line: 94, column: 17, scope: !134)
!137 = !DILocation(line: 94, column: 23, scope: !134)
!138 = !DILocation(line: 94, column: 36, scope: !134)
!139 = !DILocation(line: 94, column: 29, scope: !134)
!140 = !DILocation(line: 94, column: 9, scope: !134)
!141 = !DILocation(line: 95, column: 9, scope: !134)
!142 = !DILocation(line: 95, column: 20, scope: !134)
!143 = !DILocation(line: 96, column: 20, scope: !134)
!144 = !DILocation(line: 96, column: 9, scope: !134)
!145 = !DILocation(line: 98, column: 1, scope: !114)
