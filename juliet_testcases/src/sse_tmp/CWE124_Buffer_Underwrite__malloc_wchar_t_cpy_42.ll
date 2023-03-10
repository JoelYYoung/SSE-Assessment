; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %call3 = call i32* @wcscpy(i32* %1, i32* %arraydecay2) #5, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* %2), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !47, metadata !DIExpression()), !dbg !49
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !50
  %0 = bitcast i8* %call to i32*, !dbg !51
  store i32* %0, i32** %dataBuffer, align 8, !dbg !49
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !52
  %cmp = icmp eq i32* %1, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !58
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !59
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !63
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !64
  %5 = load i32*, i32** %data.addr, align 8, !dbg !65
  ret i32* %5, !dbg !66
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %0 = load i32*, i32** %data, align 8, !dbg !94
  %call = call i32* @goodG2BSource(i32* %0), !dbg !95
  store i32* %call, i32** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !101
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call3 = call i32* @wcscpy(i32* %1, i32* %arraydecay2) #5, !dbg !106
  %2 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %2), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !110 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !116
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %dataBuffer, align 8, !dbg !115
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !125
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  store i32* %4, i32** %data.addr, align 8, !dbg !129
  %5 = load i32*, i32** %data.addr, align 8, !dbg !130
  ret i32* %5, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !5)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 10, scope: !16)
!23 = !DILocation(line: 40, column: 22, scope: !16)
!24 = !DILocation(line: 40, column: 12, scope: !16)
!25 = !DILocation(line: 40, column: 10, scope: !16)
!26 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 42, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 42, column: 17, scope: !27)
!32 = !DILocation(line: 43, column: 17, scope: !27)
!33 = !DILocation(line: 43, column: 9, scope: !27)
!34 = !DILocation(line: 44, column: 9, scope: !27)
!35 = !DILocation(line: 44, column: 23, scope: !27)
!36 = !DILocation(line: 46, column: 16, scope: !27)
!37 = !DILocation(line: 46, column: 22, scope: !27)
!38 = !DILocation(line: 46, column: 9, scope: !27)
!39 = !DILocation(line: 47, column: 20, scope: !27)
!40 = !DILocation(line: 47, column: 9, scope: !27)
!41 = !DILocation(line: 51, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !43, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!5, !5}
!45 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !17, line: 23, type: !5)
!46 = !DILocation(line: 23, column: 38, scope: !42)
!47 = !DILocalVariable(name: "dataBuffer", scope: !48, file: !17, line: 26, type: !5)
!48 = distinct !DILexicalBlock(scope: !42, file: !17, line: 25, column: 5)
!49 = !DILocation(line: 26, column: 19, scope: !48)
!50 = !DILocation(line: 26, column: 43, scope: !48)
!51 = !DILocation(line: 26, column: 32, scope: !48)
!52 = !DILocation(line: 27, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !17, line: 27, column: 13)
!54 = !DILocation(line: 27, column: 24, scope: !53)
!55 = !DILocation(line: 27, column: 13, scope: !48)
!56 = !DILocation(line: 27, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !17, line: 27, column: 33)
!58 = !DILocation(line: 28, column: 17, scope: !48)
!59 = !DILocation(line: 28, column: 9, scope: !48)
!60 = !DILocation(line: 29, column: 9, scope: !48)
!61 = !DILocation(line: 29, column: 27, scope: !48)
!62 = !DILocation(line: 31, column: 16, scope: !48)
!63 = !DILocation(line: 31, column: 27, scope: !48)
!64 = !DILocation(line: 31, column: 14, scope: !48)
!65 = !DILocation(line: 33, column: 12, scope: !42)
!66 = !DILocation(line: 33, column: 5, scope: !42)
!67 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_42_good", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 90, column: 5, scope: !67)
!69 = !DILocation(line: 91, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 103, type: !71, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!8, !8, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 103, type: !8)
!77 = !DILocation(line: 103, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 103, type: !73)
!79 = !DILocation(line: 103, column: 27, scope: !70)
!80 = !DILocation(line: 106, column: 22, scope: !70)
!81 = !DILocation(line: 106, column: 12, scope: !70)
!82 = !DILocation(line: 106, column: 5, scope: !70)
!83 = !DILocation(line: 108, column: 5, scope: !70)
!84 = !DILocation(line: 109, column: 5, scope: !70)
!85 = !DILocation(line: 110, column: 5, scope: !70)
!86 = !DILocation(line: 113, column: 5, scope: !70)
!87 = !DILocation(line: 114, column: 5, scope: !70)
!88 = !DILocation(line: 115, column: 5, scope: !70)
!89 = !DILocation(line: 117, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 71, type: !18, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 73, type: !5)
!92 = !DILocation(line: 73, column: 15, scope: !90)
!93 = !DILocation(line: 74, column: 10, scope: !90)
!94 = !DILocation(line: 75, column: 26, scope: !90)
!95 = !DILocation(line: 75, column: 12, scope: !90)
!96 = !DILocation(line: 75, column: 10, scope: !90)
!97 = !DILocalVariable(name: "source", scope: !98, file: !17, line: 77, type: !28)
!98 = distinct !DILexicalBlock(scope: !90, file: !17, line: 76, column: 5)
!99 = !DILocation(line: 77, column: 17, scope: !98)
!100 = !DILocation(line: 78, column: 17, scope: !98)
!101 = !DILocation(line: 78, column: 9, scope: !98)
!102 = !DILocation(line: 79, column: 9, scope: !98)
!103 = !DILocation(line: 79, column: 23, scope: !98)
!104 = !DILocation(line: 81, column: 16, scope: !98)
!105 = !DILocation(line: 81, column: 22, scope: !98)
!106 = !DILocation(line: 81, column: 9, scope: !98)
!107 = !DILocation(line: 82, column: 20, scope: !98)
!108 = !DILocation(line: 82, column: 9, scope: !98)
!109 = !DILocation(line: 86, column: 1, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 57, type: !43, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", arg: 1, scope: !110, file: !17, line: 57, type: !5)
!112 = !DILocation(line: 57, column: 42, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !17, line: 60, type: !5)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 59, column: 5)
!115 = !DILocation(line: 60, column: 19, scope: !114)
!116 = !DILocation(line: 60, column: 43, scope: !114)
!117 = !DILocation(line: 60, column: 32, scope: !114)
!118 = !DILocation(line: 61, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !17, line: 61, column: 13)
!120 = !DILocation(line: 61, column: 24, scope: !119)
!121 = !DILocation(line: 61, column: 13, scope: !114)
!122 = !DILocation(line: 61, column: 34, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 61, column: 33)
!124 = !DILocation(line: 62, column: 17, scope: !114)
!125 = !DILocation(line: 62, column: 9, scope: !114)
!126 = !DILocation(line: 63, column: 9, scope: !114)
!127 = !DILocation(line: 63, column: 27, scope: !114)
!128 = !DILocation(line: 65, column: 16, scope: !114)
!129 = !DILocation(line: 65, column: 14, scope: !114)
!130 = !DILocation(line: 67, column: 12, scope: !110)
!131 = !DILocation(line: 67, column: 5, scope: !110)
