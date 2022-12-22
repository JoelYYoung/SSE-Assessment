; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !29
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !32
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !32
  %1 = load i32*, i32** %data.addr, align 8, !dbg !33
  %2 = bitcast i32* %1 to i8*, !dbg !32
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !34
  %call3 = call i64 @wcslen(i32* %arraydecay2) #8, !dbg !35
  %mul = mul i64 %call3, 4, !dbg !36
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !32
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx4, align 4, !dbg !38
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  call void @printWLine(i32* %arraydecay5), !dbg !40
  %3 = load i32*, i32** %data.addr, align 8, !dbg !41
  %4 = bitcast i32* %3 to i8*, !dbg !41
  call void @free(i8* %4) #7, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_bad() #0 !dbg !44 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !47, metadata !DIExpression()), !dbg !48
  store i32* null, i32** %data, align 8, !dbg !49
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !50
  %0 = bitcast i8* %call to i32*, !dbg !51
  store i32* %0, i32** %data, align 8, !dbg !52
  %1 = load i32*, i32** %data, align 8, !dbg !53
  %cmp = icmp eq i32* %1, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !59
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !60
  %3 = load i32*, i32** %data, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %4 = load i32*, i32** %data, align 8, !dbg !63
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_badSink(i32* %4), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_goodG2BSink(i32* %data) #0 !dbg !66 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !69, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !73
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !76
  %1 = load i32*, i32** %data.addr, align 8, !dbg !77
  %2 = bitcast i32* %1 to i8*, !dbg !76
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  %call3 = call i64 @wcslen(i32* %arraydecay2) #8, !dbg !79
  %mul = mul i64 %call3, 4, !dbg !80
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !76
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx4, align 4, !dbg !82
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  call void @printWLine(i32* %arraydecay5), !dbg !84
  %3 = load i32*, i32** %data.addr, align 8, !dbg !85
  %4 = bitcast i32* %3 to i8*, !dbg !85
  call void @free(i8* %4) #7, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i32* null, i32** %data, align 8, !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !115
  %0 = bitcast i8* %call to i32*, !dbg !116
  store i32* %0, i32** %data, align 8, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !125
  %3 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_goodG2BSink(i32* %4), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 74, scope: !16)
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
!32 = !DILocation(line: 31, column: 9, scope: !23)
!33 = !DILocation(line: 31, column: 23, scope: !23)
!34 = !DILocation(line: 31, column: 36, scope: !23)
!35 = !DILocation(line: 31, column: 29, scope: !23)
!36 = !DILocation(line: 31, column: 41, scope: !23)
!37 = !DILocation(line: 32, column: 9, scope: !23)
!38 = !DILocation(line: 32, column: 21, scope: !23)
!39 = !DILocation(line: 33, column: 20, scope: !23)
!40 = !DILocation(line: 33, column: 9, scope: !23)
!41 = !DILocation(line: 34, column: 14, scope: !23)
!42 = !DILocation(line: 34, column: 9, scope: !23)
!43 = !DILocation(line: 36, column: 1, scope: !16)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_bad", scope: !17, file: !17, line: 38, type: !45, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{null}
!47 = !DILocalVariable(name: "data", scope: !44, file: !17, line: 40, type: !4)
!48 = !DILocation(line: 40, column: 15, scope: !44)
!49 = !DILocation(line: 41, column: 10, scope: !44)
!50 = !DILocation(line: 43, column: 23, scope: !44)
!51 = !DILocation(line: 43, column: 12, scope: !44)
!52 = !DILocation(line: 43, column: 10, scope: !44)
!53 = !DILocation(line: 44, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !44, file: !17, line: 44, column: 9)
!55 = !DILocation(line: 44, column: 14, scope: !54)
!56 = !DILocation(line: 44, column: 9, scope: !44)
!57 = !DILocation(line: 44, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !17, line: 44, column: 23)
!59 = !DILocation(line: 45, column: 13, scope: !44)
!60 = !DILocation(line: 45, column: 5, scope: !44)
!61 = !DILocation(line: 46, column: 5, scope: !44)
!62 = !DILocation(line: 46, column: 16, scope: !44)
!63 = !DILocation(line: 47, column: 63, scope: !44)
!64 = !DILocation(line: 47, column: 5, scope: !44)
!65 = !DILocation(line: 48, column: 1, scope: !44)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_goodG2BSink", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", arg: 1, scope: !66, file: !17, line: 54, type: !4)
!68 = !DILocation(line: 54, column: 78, scope: !66)
!69 = !DILocalVariable(name: "dest", scope: !70, file: !17, line: 57, type: !24)
!70 = distinct !DILexicalBlock(scope: !66, file: !17, line: 56, column: 5)
!71 = !DILocation(line: 57, column: 17, scope: !70)
!72 = !DILocation(line: 58, column: 17, scope: !70)
!73 = !DILocation(line: 58, column: 9, scope: !70)
!74 = !DILocation(line: 59, column: 9, scope: !70)
!75 = !DILocation(line: 59, column: 21, scope: !70)
!76 = !DILocation(line: 62, column: 9, scope: !70)
!77 = !DILocation(line: 62, column: 23, scope: !70)
!78 = !DILocation(line: 62, column: 36, scope: !70)
!79 = !DILocation(line: 62, column: 29, scope: !70)
!80 = !DILocation(line: 62, column: 41, scope: !70)
!81 = !DILocation(line: 63, column: 9, scope: !70)
!82 = !DILocation(line: 63, column: 21, scope: !70)
!83 = !DILocation(line: 64, column: 20, scope: !70)
!84 = !DILocation(line: 64, column: 9, scope: !70)
!85 = !DILocation(line: 65, column: 14, scope: !70)
!86 = !DILocation(line: 65, column: 9, scope: !70)
!87 = !DILocation(line: 67, column: 1, scope: !66)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_41_good", scope: !17, file: !17, line: 82, type: !45, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 84, column: 5, scope: !88)
!90 = !DILocation(line: 85, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 97, type: !92, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !17, line: 97, type: !7)
!98 = !DILocation(line: 97, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !17, line: 97, type: !94)
!100 = !DILocation(line: 97, column: 27, scope: !91)
!101 = !DILocation(line: 100, column: 22, scope: !91)
!102 = !DILocation(line: 100, column: 12, scope: !91)
!103 = !DILocation(line: 100, column: 5, scope: !91)
!104 = !DILocation(line: 102, column: 5, scope: !91)
!105 = !DILocation(line: 103, column: 5, scope: !91)
!106 = !DILocation(line: 104, column: 5, scope: !91)
!107 = !DILocation(line: 107, column: 5, scope: !91)
!108 = !DILocation(line: 108, column: 5, scope: !91)
!109 = !DILocation(line: 109, column: 5, scope: !91)
!110 = !DILocation(line: 111, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 70, type: !45, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 72, type: !4)
!113 = !DILocation(line: 72, column: 15, scope: !111)
!114 = !DILocation(line: 73, column: 10, scope: !111)
!115 = !DILocation(line: 75, column: 23, scope: !111)
!116 = !DILocation(line: 75, column: 12, scope: !111)
!117 = !DILocation(line: 75, column: 10, scope: !111)
!118 = !DILocation(line: 76, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !17, line: 76, column: 9)
!120 = !DILocation(line: 76, column: 14, scope: !119)
!121 = !DILocation(line: 76, column: 9, scope: !111)
!122 = !DILocation(line: 76, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 76, column: 23)
!124 = !DILocation(line: 77, column: 13, scope: !111)
!125 = !DILocation(line: 77, column: 5, scope: !111)
!126 = !DILocation(line: 78, column: 5, scope: !111)
!127 = !DILocation(line: 78, column: 17, scope: !111)
!128 = !DILocation(line: 79, column: 67, scope: !111)
!129 = !DILocation(line: 79, column: 5, scope: !111)
!130 = !DILocation(line: 80, column: 1, scope: !111)
