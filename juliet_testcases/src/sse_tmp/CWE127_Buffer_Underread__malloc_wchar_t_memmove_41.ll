; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_badSink(i32* %data) #0 !dbg !16 {
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
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !32
  %1 = load i32*, i32** %data.addr, align 8, !dbg !33
  %2 = bitcast i32* %1 to i8*, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx2, align 4, !dbg !35
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  call void @printWLine(i32* %arraydecay3), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_bad() #0 !dbg !39 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !DIExpression()), !dbg !43
  store i32* null, i32** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !45, metadata !DIExpression()), !dbg !47
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !48
  %0 = bitcast i8* %call to i32*, !dbg !49
  store i32* %0, i32** %dataBuffer, align 8, !dbg !47
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !50
  %cmp = icmp eq i32* %1, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !56
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !57
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !60
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !61
  store i32* %add.ptr, i32** %data, align 8, !dbg !62
  %5 = load i32*, i32** %data, align 8, !dbg !63
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_badSink(i32* %5), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_goodG2BSink(i32* %data) #0 !dbg !66 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !69, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !73
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !76
  %1 = load i32*, i32** %data.addr, align 8, !dbg !77
  %2 = bitcast i32* %1 to i8*, !dbg !76
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 400, i1 false), !dbg !76
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx2, align 4, !dbg !79
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !80
  call void @printWLine(i32* %arraydecay3), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #6, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #6, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %dataBuffer, align 8, !dbg !112
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %cmp = icmp eq i32* %1, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !122
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !125
  store i32* %4, i32** %data, align 8, !dbg !126
  %5 = load i32*, i32** %data, align 8, !dbg !127
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_goodG2BSink(i32* %5), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 75, scope: !16)
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
!32 = !DILocation(line: 30, column: 9, scope: !23)
!33 = !DILocation(line: 30, column: 23, scope: !23)
!34 = !DILocation(line: 32, column: 9, scope: !23)
!35 = !DILocation(line: 32, column: 21, scope: !23)
!36 = !DILocation(line: 33, column: 20, scope: !23)
!37 = !DILocation(line: 33, column: 9, scope: !23)
!38 = !DILocation(line: 37, column: 1, scope: !16)
!39 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_bad", scope: !17, file: !17, line: 39, type: !40, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !17, line: 41, type: !4)
!43 = !DILocation(line: 41, column: 15, scope: !39)
!44 = !DILocation(line: 42, column: 10, scope: !39)
!45 = !DILocalVariable(name: "dataBuffer", scope: !46, file: !17, line: 44, type: !4)
!46 = distinct !DILexicalBlock(scope: !39, file: !17, line: 43, column: 5)
!47 = !DILocation(line: 44, column: 19, scope: !46)
!48 = !DILocation(line: 44, column: 43, scope: !46)
!49 = !DILocation(line: 44, column: 32, scope: !46)
!50 = !DILocation(line: 45, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !17, line: 45, column: 13)
!52 = !DILocation(line: 45, column: 24, scope: !51)
!53 = !DILocation(line: 45, column: 13, scope: !46)
!54 = !DILocation(line: 45, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !17, line: 45, column: 33)
!56 = !DILocation(line: 46, column: 17, scope: !46)
!57 = !DILocation(line: 46, column: 9, scope: !46)
!58 = !DILocation(line: 47, column: 9, scope: !46)
!59 = !DILocation(line: 47, column: 27, scope: !46)
!60 = !DILocation(line: 49, column: 16, scope: !46)
!61 = !DILocation(line: 49, column: 27, scope: !46)
!62 = !DILocation(line: 49, column: 14, scope: !46)
!63 = !DILocation(line: 51, column: 64, scope: !39)
!64 = !DILocation(line: 51, column: 5, scope: !39)
!65 = !DILocation(line: 52, column: 1, scope: !39)
!66 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_goodG2BSink", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", arg: 1, scope: !66, file: !17, line: 58, type: !4)
!68 = !DILocation(line: 58, column: 79, scope: !66)
!69 = !DILocalVariable(name: "dest", scope: !70, file: !17, line: 61, type: !24)
!70 = distinct !DILexicalBlock(scope: !66, file: !17, line: 60, column: 5)
!71 = !DILocation(line: 61, column: 17, scope: !70)
!72 = !DILocation(line: 62, column: 17, scope: !70)
!73 = !DILocation(line: 62, column: 9, scope: !70)
!74 = !DILocation(line: 63, column: 9, scope: !70)
!75 = !DILocation(line: 63, column: 21, scope: !70)
!76 = !DILocation(line: 65, column: 9, scope: !70)
!77 = !DILocation(line: 65, column: 23, scope: !70)
!78 = !DILocation(line: 67, column: 9, scope: !70)
!79 = !DILocation(line: 67, column: 21, scope: !70)
!80 = !DILocation(line: 68, column: 20, scope: !70)
!81 = !DILocation(line: 68, column: 9, scope: !70)
!82 = !DILocation(line: 72, column: 1, scope: !66)
!83 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_41_good", scope: !17, file: !17, line: 90, type: !40, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 92, column: 5, scope: !83)
!85 = !DILocation(line: 93, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 105, type: !87, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!7, !7, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !17, line: 105, type: !7)
!93 = !DILocation(line: 105, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !17, line: 105, type: !89)
!95 = !DILocation(line: 105, column: 27, scope: !86)
!96 = !DILocation(line: 108, column: 22, scope: !86)
!97 = !DILocation(line: 108, column: 12, scope: !86)
!98 = !DILocation(line: 108, column: 5, scope: !86)
!99 = !DILocation(line: 110, column: 5, scope: !86)
!100 = !DILocation(line: 111, column: 5, scope: !86)
!101 = !DILocation(line: 112, column: 5, scope: !86)
!102 = !DILocation(line: 115, column: 5, scope: !86)
!103 = !DILocation(line: 116, column: 5, scope: !86)
!104 = !DILocation(line: 117, column: 5, scope: !86)
!105 = !DILocation(line: 119, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 75, type: !40, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 77, type: !4)
!108 = !DILocation(line: 77, column: 15, scope: !106)
!109 = !DILocation(line: 78, column: 10, scope: !106)
!110 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !17, line: 80, type: !4)
!111 = distinct !DILexicalBlock(scope: !106, file: !17, line: 79, column: 5)
!112 = !DILocation(line: 80, column: 19, scope: !111)
!113 = !DILocation(line: 80, column: 43, scope: !111)
!114 = !DILocation(line: 80, column: 32, scope: !111)
!115 = !DILocation(line: 81, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !17, line: 81, column: 13)
!117 = !DILocation(line: 81, column: 24, scope: !116)
!118 = !DILocation(line: 81, column: 13, scope: !111)
!119 = !DILocation(line: 81, column: 34, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !17, line: 81, column: 33)
!121 = !DILocation(line: 82, column: 17, scope: !111)
!122 = !DILocation(line: 82, column: 9, scope: !111)
!123 = !DILocation(line: 83, column: 9, scope: !111)
!124 = !DILocation(line: 83, column: 27, scope: !111)
!125 = !DILocation(line: 85, column: 16, scope: !111)
!126 = !DILocation(line: 85, column: 14, scope: !111)
!127 = !DILocation(line: 87, column: 68, scope: !106)
!128 = !DILocation(line: 87, column: 5, scope: !106)
!129 = !DILocation(line: 88, column: 1, scope: !106)
