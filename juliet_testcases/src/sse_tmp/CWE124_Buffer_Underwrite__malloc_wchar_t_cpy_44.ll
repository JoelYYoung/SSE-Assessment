; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %dataBuffer, align 8, !dbg !30
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !40
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  call void %5(i32* %6), !dbg !46
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %0 = load i32*, i32** %data.addr, align 8, !dbg !62
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !63
  %call2 = call i32* @wcscpy(i32* %0, i32* %arraydecay1) #5, !dbg !64
  %1 = load i32*, i32** %data.addr, align 8, !dbg !65
  call void @printWLine(i32* %1), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !94, metadata !DIExpression()), !dbg !95
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !95
  store i32* null, i32** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !100
  %0 = bitcast i8* %call to i32*, !dbg !101
  store i32* %0, i32** %dataBuffer, align 8, !dbg !99
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !109
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  store i32* %4, i32** %data, align 8, !dbg !113
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !114
  %6 = load i32*, i32** %data, align 8, !dbg !115
  call void %5(i32* %6), !dbg !114
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !117 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !124
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %0 = load i32*, i32** %data.addr, align 8, !dbg !127
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call2 = call i32* @wcscpy(i32* %0, i32* %arraydecay1) #5, !dbg !129
  %1 = load i32*, i32** %data.addr, align 8, !dbg !130
  call void @printWLine(i32* %1), !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 41, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 41, column: 12, scope: !16)
!27 = !DILocation(line: 42, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !17, line: 44, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!30 = !DILocation(line: 44, column: 19, scope: !29)
!31 = !DILocation(line: 44, column: 43, scope: !29)
!32 = !DILocation(line: 44, column: 32, scope: !29)
!33 = !DILocation(line: 45, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !17, line: 45, column: 13)
!35 = !DILocation(line: 45, column: 24, scope: !34)
!36 = !DILocation(line: 45, column: 13, scope: !29)
!37 = !DILocation(line: 45, column: 34, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 45, column: 33)
!39 = !DILocation(line: 46, column: 17, scope: !29)
!40 = !DILocation(line: 46, column: 9, scope: !29)
!41 = !DILocation(line: 47, column: 9, scope: !29)
!42 = !DILocation(line: 47, column: 27, scope: !29)
!43 = !DILocation(line: 49, column: 16, scope: !29)
!44 = !DILocation(line: 49, column: 27, scope: !29)
!45 = !DILocation(line: 49, column: 14, scope: !29)
!46 = !DILocation(line: 52, column: 5, scope: !16)
!47 = !DILocation(line: 52, column: 13, scope: !16)
!48 = !DILocation(line: 53, column: 1, scope: !16)
!49 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !17, line: 23, type: !4)
!51 = !DILocation(line: 23, column: 31, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !17, line: 26, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !17, line: 25, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 26, column: 17, scope: !53)
!58 = !DILocation(line: 27, column: 17, scope: !53)
!59 = !DILocation(line: 27, column: 9, scope: !53)
!60 = !DILocation(line: 28, column: 9, scope: !53)
!61 = !DILocation(line: 28, column: 23, scope: !53)
!62 = !DILocation(line: 30, column: 16, scope: !53)
!63 = !DILocation(line: 30, column: 22, scope: !53)
!64 = !DILocation(line: 30, column: 9, scope: !53)
!65 = !DILocation(line: 31, column: 20, scope: !53)
!66 = !DILocation(line: 31, column: 9, scope: !53)
!67 = !DILocation(line: 35, column: 1, scope: !49)
!68 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_44_good", scope: !17, file: !17, line: 90, type: !18, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 92, column: 5, scope: !68)
!70 = !DILocation(line: 93, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 104, type: !72, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!7, !7, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !17, line: 104, type: !7)
!78 = !DILocation(line: 104, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !17, line: 104, type: !74)
!80 = !DILocation(line: 104, column: 27, scope: !71)
!81 = !DILocation(line: 107, column: 22, scope: !71)
!82 = !DILocation(line: 107, column: 12, scope: !71)
!83 = !DILocation(line: 107, column: 5, scope: !71)
!84 = !DILocation(line: 109, column: 5, scope: !71)
!85 = !DILocation(line: 110, column: 5, scope: !71)
!86 = !DILocation(line: 111, column: 5, scope: !71)
!87 = !DILocation(line: 114, column: 5, scope: !71)
!88 = !DILocation(line: 115, column: 5, scope: !71)
!89 = !DILocation(line: 116, column: 5, scope: !71)
!90 = !DILocation(line: 118, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 74, type: !18, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 76, type: !4)
!93 = !DILocation(line: 76, column: 15, scope: !91)
!94 = !DILocalVariable(name: "funcPtr", scope: !91, file: !17, line: 77, type: !23)
!95 = !DILocation(line: 77, column: 12, scope: !91)
!96 = !DILocation(line: 78, column: 10, scope: !91)
!97 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !17, line: 80, type: !4)
!98 = distinct !DILexicalBlock(scope: !91, file: !17, line: 79, column: 5)
!99 = !DILocation(line: 80, column: 19, scope: !98)
!100 = !DILocation(line: 80, column: 43, scope: !98)
!101 = !DILocation(line: 80, column: 32, scope: !98)
!102 = !DILocation(line: 81, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !17, line: 81, column: 13)
!104 = !DILocation(line: 81, column: 24, scope: !103)
!105 = !DILocation(line: 81, column: 13, scope: !98)
!106 = !DILocation(line: 81, column: 34, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !17, line: 81, column: 33)
!108 = !DILocation(line: 82, column: 17, scope: !98)
!109 = !DILocation(line: 82, column: 9, scope: !98)
!110 = !DILocation(line: 83, column: 9, scope: !98)
!111 = !DILocation(line: 83, column: 27, scope: !98)
!112 = !DILocation(line: 85, column: 16, scope: !98)
!113 = !DILocation(line: 85, column: 14, scope: !98)
!114 = !DILocation(line: 87, column: 5, scope: !91)
!115 = !DILocation(line: 87, column: 13, scope: !91)
!116 = !DILocation(line: 88, column: 1, scope: !91)
!117 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 60, type: !24, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", arg: 1, scope: !117, file: !17, line: 60, type: !4)
!119 = !DILocation(line: 60, column: 35, scope: !117)
!120 = !DILocalVariable(name: "source", scope: !121, file: !17, line: 63, type: !54)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 62, column: 5)
!122 = !DILocation(line: 63, column: 17, scope: !121)
!123 = !DILocation(line: 64, column: 17, scope: !121)
!124 = !DILocation(line: 64, column: 9, scope: !121)
!125 = !DILocation(line: 65, column: 9, scope: !121)
!126 = !DILocation(line: 65, column: 23, scope: !121)
!127 = !DILocation(line: 67, column: 16, scope: !121)
!128 = !DILocation(line: 67, column: 22, scope: !121)
!129 = !DILocation(line: 67, column: 9, scope: !121)
!130 = !DILocation(line: 68, column: 20, scope: !121)
!131 = !DILocation(line: 68, column: 9, scope: !121)
!132 = !DILocation(line: 72, column: 1, scope: !117)
