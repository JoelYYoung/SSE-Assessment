; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !29
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !32
  %0 = load i32*, i32** %data.addr, align 8, !dbg !33
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !34
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !35
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %0, i64 %call3) #6, !dbg !36
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx5, align 4, !dbg !38
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  call void @printWLine(i32* %arraydecay6), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_bad() #0 !dbg !42 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  store i32* null, i32** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !48, metadata !DIExpression()), !dbg !50
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !51
  %0 = bitcast i8* %call to i32*, !dbg !52
  store i32* %0, i32** %dataBuffer, align 8, !dbg !50
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !53
  %cmp = icmp eq i32* %1, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !60
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !64
  store i32* %add.ptr, i32** %data, align 8, !dbg !65
  %5 = load i32*, i32** %data, align 8, !dbg !66
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_badSink(i32* %5), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !69 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !72, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !76
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  %0 = load i32*, i32** %data.addr, align 8, !dbg !80
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !81
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !82
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %0, i64 %call3) #6, !dbg !83
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx5, align 4, !dbg !85
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  call void @printWLine(i32* %arraydecay6), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #6, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #6, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !119
  %0 = bitcast i8* %call to i32*, !dbg !120
  store i32* %0, i32** %dataBuffer, align 8, !dbg !118
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  %cmp = icmp eq i32* %1, null, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !127
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !128
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !131
  store i32* %4, i32** %data, align 8, !dbg !132
  %5 = load i32*, i32** %data, align 8, !dbg !133
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_goodG2BSink(i32* %5), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 72, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocation(line: 27, column: 17, scope: !23)
!29 = !DILocation(line: 27, column: 9, scope: !23)
!30 = !DILocation(line: 28, column: 9, scope: !23)
!31 = !DILocation(line: 28, column: 21, scope: !23)
!32 = !DILocation(line: 30, column: 17, scope: !23)
!33 = !DILocation(line: 30, column: 23, scope: !23)
!34 = !DILocation(line: 30, column: 36, scope: !23)
!35 = !DILocation(line: 30, column: 29, scope: !23)
!36 = !DILocation(line: 30, column: 9, scope: !23)
!37 = !DILocation(line: 32, column: 9, scope: !23)
!38 = !DILocation(line: 32, column: 21, scope: !23)
!39 = !DILocation(line: 33, column: 20, scope: !23)
!40 = !DILocation(line: 33, column: 9, scope: !23)
!41 = !DILocation(line: 37, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_bad", scope: !17, file: !17, line: 39, type: !43, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{null}
!45 = !DILocalVariable(name: "data", scope: !42, file: !17, line: 41, type: !4)
!46 = !DILocation(line: 41, column: 15, scope: !42)
!47 = !DILocation(line: 42, column: 10, scope: !42)
!48 = !DILocalVariable(name: "dataBuffer", scope: !49, file: !17, line: 44, type: !4)
!49 = distinct !DILexicalBlock(scope: !42, file: !17, line: 43, column: 5)
!50 = !DILocation(line: 44, column: 19, scope: !49)
!51 = !DILocation(line: 44, column: 43, scope: !49)
!52 = !DILocation(line: 44, column: 32, scope: !49)
!53 = !DILocation(line: 45, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !17, line: 45, column: 13)
!55 = !DILocation(line: 45, column: 24, scope: !54)
!56 = !DILocation(line: 45, column: 13, scope: !49)
!57 = !DILocation(line: 45, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !17, line: 45, column: 33)
!59 = !DILocation(line: 46, column: 17, scope: !49)
!60 = !DILocation(line: 46, column: 9, scope: !49)
!61 = !DILocation(line: 47, column: 9, scope: !49)
!62 = !DILocation(line: 47, column: 27, scope: !49)
!63 = !DILocation(line: 49, column: 16, scope: !49)
!64 = !DILocation(line: 49, column: 27, scope: !49)
!65 = !DILocation(line: 49, column: 14, scope: !49)
!66 = !DILocation(line: 51, column: 61, scope: !42)
!67 = !DILocation(line: 51, column: 5, scope: !42)
!68 = !DILocation(line: 52, column: 1, scope: !42)
!69 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_goodG2BSink", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", arg: 1, scope: !69, file: !17, line: 58, type: !4)
!71 = !DILocation(line: 58, column: 76, scope: !69)
!72 = !DILocalVariable(name: "dest", scope: !73, file: !17, line: 61, type: !24)
!73 = distinct !DILexicalBlock(scope: !69, file: !17, line: 60, column: 5)
!74 = !DILocation(line: 61, column: 17, scope: !73)
!75 = !DILocation(line: 62, column: 17, scope: !73)
!76 = !DILocation(line: 62, column: 9, scope: !73)
!77 = !DILocation(line: 63, column: 9, scope: !73)
!78 = !DILocation(line: 63, column: 21, scope: !73)
!79 = !DILocation(line: 65, column: 17, scope: !73)
!80 = !DILocation(line: 65, column: 23, scope: !73)
!81 = !DILocation(line: 65, column: 36, scope: !73)
!82 = !DILocation(line: 65, column: 29, scope: !73)
!83 = !DILocation(line: 65, column: 9, scope: !73)
!84 = !DILocation(line: 67, column: 9, scope: !73)
!85 = !DILocation(line: 67, column: 21, scope: !73)
!86 = !DILocation(line: 68, column: 20, scope: !73)
!87 = !DILocation(line: 68, column: 9, scope: !73)
!88 = !DILocation(line: 72, column: 1, scope: !69)
!89 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_41_good", scope: !17, file: !17, line: 90, type: !43, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 92, column: 5, scope: !89)
!91 = !DILocation(line: 93, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 105, type: !93, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !17, line: 105, type: !7)
!99 = !DILocation(line: 105, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !17, line: 105, type: !95)
!101 = !DILocation(line: 105, column: 27, scope: !92)
!102 = !DILocation(line: 108, column: 22, scope: !92)
!103 = !DILocation(line: 108, column: 12, scope: !92)
!104 = !DILocation(line: 108, column: 5, scope: !92)
!105 = !DILocation(line: 110, column: 5, scope: !92)
!106 = !DILocation(line: 111, column: 5, scope: !92)
!107 = !DILocation(line: 112, column: 5, scope: !92)
!108 = !DILocation(line: 115, column: 5, scope: !92)
!109 = !DILocation(line: 116, column: 5, scope: !92)
!110 = !DILocation(line: 117, column: 5, scope: !92)
!111 = !DILocation(line: 119, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 75, type: !43, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 77, type: !4)
!114 = !DILocation(line: 77, column: 15, scope: !112)
!115 = !DILocation(line: 78, column: 10, scope: !112)
!116 = !DILocalVariable(name: "dataBuffer", scope: !117, file: !17, line: 80, type: !4)
!117 = distinct !DILexicalBlock(scope: !112, file: !17, line: 79, column: 5)
!118 = !DILocation(line: 80, column: 19, scope: !117)
!119 = !DILocation(line: 80, column: 43, scope: !117)
!120 = !DILocation(line: 80, column: 32, scope: !117)
!121 = !DILocation(line: 81, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !17, line: 81, column: 13)
!123 = !DILocation(line: 81, column: 24, scope: !122)
!124 = !DILocation(line: 81, column: 13, scope: !117)
!125 = !DILocation(line: 81, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !17, line: 81, column: 33)
!127 = !DILocation(line: 82, column: 17, scope: !117)
!128 = !DILocation(line: 82, column: 9, scope: !117)
!129 = !DILocation(line: 83, column: 9, scope: !117)
!130 = !DILocation(line: 83, column: 27, scope: !117)
!131 = !DILocation(line: 85, column: 16, scope: !117)
!132 = !DILocation(line: 85, column: 14, scope: !117)
!133 = !DILocation(line: 87, column: 65, scope: !112)
!134 = !DILocation(line: 87, column: 5, scope: !112)
!135 = !DILocation(line: 88, column: 1, scope: !112)
