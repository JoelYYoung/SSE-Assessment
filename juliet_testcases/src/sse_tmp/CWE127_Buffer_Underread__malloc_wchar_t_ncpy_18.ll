; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %source, !dbg !23

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !24), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %dataBuffer, align 8, !dbg !28
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !38
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !42
  store i32* %add.ptr, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !57
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !58
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx8, align 4, !dbg !60
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay9), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  br label %source, !dbg !91

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !92), !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !97
  %0 = bitcast i8* %call to i32*, !dbg !98
  store i32* %0, i32** %dataBuffer, align 8, !dbg !96
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  %cmp = icmp eq i32* %1, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !106
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %4, i32** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx3, align 4, !dbg !117
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !119
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !121
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %5, i64 %call6) #6, !dbg !122
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx8, align 4, !dbg !124
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay9), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILabel(scope: !16, name: "source", file: !17, line: 28)
!25 = !DILocation(line: 28, column: 1, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 19, scope: !27)
!29 = !DILocation(line: 30, column: 43, scope: !27)
!30 = !DILocation(line: 30, column: 32, scope: !27)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 24, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !27)
!35 = !DILocation(line: 31, column: 34, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 31, column: 33)
!37 = !DILocation(line: 32, column: 17, scope: !27)
!38 = !DILocation(line: 32, column: 9, scope: !27)
!39 = !DILocation(line: 33, column: 9, scope: !27)
!40 = !DILocation(line: 33, column: 27, scope: !27)
!41 = !DILocation(line: 35, column: 16, scope: !27)
!42 = !DILocation(line: 35, column: 27, scope: !27)
!43 = !DILocation(line: 35, column: 14, scope: !27)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !17, line: 38, type: !46)
!45 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 38, column: 17, scope: !45)
!50 = !DILocation(line: 39, column: 17, scope: !45)
!51 = !DILocation(line: 39, column: 9, scope: !45)
!52 = !DILocation(line: 40, column: 9, scope: !45)
!53 = !DILocation(line: 40, column: 21, scope: !45)
!54 = !DILocation(line: 42, column: 17, scope: !45)
!55 = !DILocation(line: 42, column: 23, scope: !45)
!56 = !DILocation(line: 42, column: 36, scope: !45)
!57 = !DILocation(line: 42, column: 29, scope: !45)
!58 = !DILocation(line: 42, column: 9, scope: !45)
!59 = !DILocation(line: 44, column: 9, scope: !45)
!60 = !DILocation(line: 44, column: 21, scope: !45)
!61 = !DILocation(line: 45, column: 20, scope: !45)
!62 = !DILocation(line: 45, column: 9, scope: !45)
!63 = !DILocation(line: 49, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_18_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 86, column: 5, scope: !64)
!66 = !DILocation(line: 87, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !68, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 99, type: !7)
!74 = !DILocation(line: 99, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 99, type: !70)
!76 = !DILocation(line: 99, column: 27, scope: !67)
!77 = !DILocation(line: 102, column: 22, scope: !67)
!78 = !DILocation(line: 102, column: 12, scope: !67)
!79 = !DILocation(line: 102, column: 5, scope: !67)
!80 = !DILocation(line: 104, column: 5, scope: !67)
!81 = !DILocation(line: 105, column: 5, scope: !67)
!82 = !DILocation(line: 106, column: 5, scope: !67)
!83 = !DILocation(line: 109, column: 5, scope: !67)
!84 = !DILocation(line: 110, column: 5, scope: !67)
!85 = !DILocation(line: 111, column: 5, scope: !67)
!86 = !DILocation(line: 113, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 58, type: !4)
!89 = !DILocation(line: 58, column: 15, scope: !87)
!90 = !DILocation(line: 59, column: 10, scope: !87)
!91 = !DILocation(line: 60, column: 5, scope: !87)
!92 = !DILabel(scope: !87, name: "source", file: !17, line: 61)
!93 = !DILocation(line: 61, column: 1, scope: !87)
!94 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !17, line: 63, type: !4)
!95 = distinct !DILexicalBlock(scope: !87, file: !17, line: 62, column: 5)
!96 = !DILocation(line: 63, column: 19, scope: !95)
!97 = !DILocation(line: 63, column: 43, scope: !95)
!98 = !DILocation(line: 63, column: 32, scope: !95)
!99 = !DILocation(line: 64, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !17, line: 64, column: 13)
!101 = !DILocation(line: 64, column: 24, scope: !100)
!102 = !DILocation(line: 64, column: 13, scope: !95)
!103 = !DILocation(line: 64, column: 34, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !17, line: 64, column: 33)
!105 = !DILocation(line: 65, column: 17, scope: !95)
!106 = !DILocation(line: 65, column: 9, scope: !95)
!107 = !DILocation(line: 66, column: 9, scope: !95)
!108 = !DILocation(line: 66, column: 27, scope: !95)
!109 = !DILocation(line: 68, column: 16, scope: !95)
!110 = !DILocation(line: 68, column: 14, scope: !95)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !17, line: 71, type: !46)
!112 = distinct !DILexicalBlock(scope: !87, file: !17, line: 70, column: 5)
!113 = !DILocation(line: 71, column: 17, scope: !112)
!114 = !DILocation(line: 72, column: 17, scope: !112)
!115 = !DILocation(line: 72, column: 9, scope: !112)
!116 = !DILocation(line: 73, column: 9, scope: !112)
!117 = !DILocation(line: 73, column: 21, scope: !112)
!118 = !DILocation(line: 75, column: 17, scope: !112)
!119 = !DILocation(line: 75, column: 23, scope: !112)
!120 = !DILocation(line: 75, column: 36, scope: !112)
!121 = !DILocation(line: 75, column: 29, scope: !112)
!122 = !DILocation(line: 75, column: 9, scope: !112)
!123 = !DILocation(line: 77, column: 9, scope: !112)
!124 = !DILocation(line: 77, column: 21, scope: !112)
!125 = !DILocation(line: 78, column: 20, scope: !112)
!126 = !DILocation(line: 78, column: 9, scope: !112)
!127 = !DILocation(line: 82, column: 1, scope: !87)
