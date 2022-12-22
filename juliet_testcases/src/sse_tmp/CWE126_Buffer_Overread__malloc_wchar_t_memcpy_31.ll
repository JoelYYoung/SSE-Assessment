; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !36, metadata !DIExpression()), !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %4, i32** %dataCopy, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !40, metadata !DIExpression()), !dbg !41
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !42
  store i32* %5, i32** %data2, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !50
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx4, align 4, !dbg !52
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !53
  %7 = load i32*, i32** %data2, align 8, !dbg !54
  %8 = bitcast i32* %7 to i8*, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call7 = call i64 @wcslen(i32* %arraydecay6) #9, !dbg !56
  %mul = mul i64 %call7, 4, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !53
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx8, align 4, !dbg !59
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay9), !dbg !61
  %9 = load i32*, i32** %data2, align 8, !dbg !62
  %10 = bitcast i32* %9 to i8*, !dbg !62
  call void @free(i8* %10) #7, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31_good() #0 !dbg !65 {
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
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  store i32* %4, i32** %dataCopy, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !109, metadata !DIExpression()), !dbg !110
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !111
  store i32* %5, i32** %data2, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !116
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx4, align 4, !dbg !118
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !119
  %7 = load i32*, i32** %data2, align 8, !dbg !120
  %8 = bitcast i32* %7 to i8*, !dbg !119
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %call7 = call i64 @wcslen(i32* %arraydecay6) #9, !dbg !122
  %mul = mul i64 %call7, 4, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !119
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx8, align 4, !dbg !125
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  call void @printWLine(i32* %arraydecay9), !dbg !127
  %9 = load i32*, i32** %data2, align 8, !dbg !128
  %10 = bitcast i32* %9 to i8*, !dbg !128
  call void @free(i8* %10) #7, !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 28, column: 23, scope: !16)
!24 = !DILocation(line: 28, column: 12, scope: !16)
!25 = !DILocation(line: 28, column: 10, scope: !16)
!26 = !DILocation(line: 29, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!28 = !DILocation(line: 29, column: 14, scope: !27)
!29 = !DILocation(line: 29, column: 9, scope: !16)
!30 = !DILocation(line: 29, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 29, column: 23)
!32 = !DILocation(line: 30, column: 13, scope: !16)
!33 = !DILocation(line: 30, column: 5, scope: !16)
!34 = !DILocation(line: 31, column: 5, scope: !16)
!35 = !DILocation(line: 31, column: 16, scope: !16)
!36 = !DILocalVariable(name: "dataCopy", scope: !37, file: !17, line: 33, type: !4)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 5)
!38 = !DILocation(line: 33, column: 19, scope: !37)
!39 = !DILocation(line: 33, column: 30, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !17, line: 34, type: !4)
!41 = !DILocation(line: 34, column: 19, scope: !37)
!42 = !DILocation(line: 34, column: 26, scope: !37)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !17, line: 36, type: !45)
!44 = distinct !DILexicalBlock(scope: !37, file: !17, line: 35, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 36, column: 21, scope: !44)
!49 = !DILocation(line: 37, column: 21, scope: !44)
!50 = !DILocation(line: 37, column: 13, scope: !44)
!51 = !DILocation(line: 38, column: 13, scope: !44)
!52 = !DILocation(line: 38, column: 25, scope: !44)
!53 = !DILocation(line: 41, column: 13, scope: !44)
!54 = !DILocation(line: 41, column: 26, scope: !44)
!55 = !DILocation(line: 41, column: 39, scope: !44)
!56 = !DILocation(line: 41, column: 32, scope: !44)
!57 = !DILocation(line: 41, column: 44, scope: !44)
!58 = !DILocation(line: 42, column: 13, scope: !44)
!59 = !DILocation(line: 42, column: 25, scope: !44)
!60 = !DILocation(line: 43, column: 24, scope: !44)
!61 = !DILocation(line: 43, column: 13, scope: !44)
!62 = !DILocation(line: 44, column: 18, scope: !44)
!63 = !DILocation(line: 44, column: 13, scope: !44)
!64 = !DILocation(line: 47, column: 1, scope: !16)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_31_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 82, column: 5, scope: !65)
!67 = !DILocation(line: 83, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 94, type: !69, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !17, line: 94, type: !7)
!75 = !DILocation(line: 94, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !17, line: 94, type: !71)
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
!88 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !17, line: 56, type: !4)
!90 = !DILocation(line: 56, column: 15, scope: !88)
!91 = !DILocation(line: 57, column: 10, scope: !88)
!92 = !DILocation(line: 59, column: 23, scope: !88)
!93 = !DILocation(line: 59, column: 12, scope: !88)
!94 = !DILocation(line: 59, column: 10, scope: !88)
!95 = !DILocation(line: 60, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !17, line: 60, column: 9)
!97 = !DILocation(line: 60, column: 14, scope: !96)
!98 = !DILocation(line: 60, column: 9, scope: !88)
!99 = !DILocation(line: 60, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 60, column: 23)
!101 = !DILocation(line: 61, column: 13, scope: !88)
!102 = !DILocation(line: 61, column: 5, scope: !88)
!103 = !DILocation(line: 62, column: 5, scope: !88)
!104 = !DILocation(line: 62, column: 17, scope: !88)
!105 = !DILocalVariable(name: "dataCopy", scope: !106, file: !17, line: 64, type: !4)
!106 = distinct !DILexicalBlock(scope: !88, file: !17, line: 63, column: 5)
!107 = !DILocation(line: 64, column: 19, scope: !106)
!108 = !DILocation(line: 64, column: 30, scope: !106)
!109 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 65, type: !4)
!110 = !DILocation(line: 65, column: 19, scope: !106)
!111 = !DILocation(line: 65, column: 26, scope: !106)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !17, line: 67, type: !45)
!113 = distinct !DILexicalBlock(scope: !106, file: !17, line: 66, column: 9)
!114 = !DILocation(line: 67, column: 21, scope: !113)
!115 = !DILocation(line: 68, column: 21, scope: !113)
!116 = !DILocation(line: 68, column: 13, scope: !113)
!117 = !DILocation(line: 69, column: 13, scope: !113)
!118 = !DILocation(line: 69, column: 25, scope: !113)
!119 = !DILocation(line: 72, column: 13, scope: !113)
!120 = !DILocation(line: 72, column: 26, scope: !113)
!121 = !DILocation(line: 72, column: 39, scope: !113)
!122 = !DILocation(line: 72, column: 32, scope: !113)
!123 = !DILocation(line: 72, column: 44, scope: !113)
!124 = !DILocation(line: 73, column: 13, scope: !113)
!125 = !DILocation(line: 73, column: 25, scope: !113)
!126 = !DILocation(line: 74, column: 24, scope: !113)
!127 = !DILocation(line: 74, column: 13, scope: !113)
!128 = !DILocation(line: 75, column: 18, scope: !113)
!129 = !DILocation(line: 75, column: 13, scope: !113)
!130 = !DILocation(line: 78, column: 1, scope: !88)
