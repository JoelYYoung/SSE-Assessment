; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %source, !dbg !23

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !24), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx3, align 4, !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  %6 = bitcast i32* %5 to i8*, !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !52
  %mul = mul i64 %call6, 4, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !49
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx7, align 4, !dbg !55
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay8), !dbg !57
  %7 = load i32*, i32** %data, align 8, !dbg !58
  %8 = bitcast i32* %7 to i8*, !dbg !58
  call void @free(i8* %8) #7, !dbg !59
  ret void, !dbg !60
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_18_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_18_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_18_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  br label %source, !dbg !88

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !89), !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !91
  %0 = bitcast i8* %call to i32*, !dbg !92
  store i32* %0, i32** %data, align 8, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx3, align 4, !dbg !110
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !111
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %6 = bitcast i32* %5 to i8*, !dbg !111
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !114
  %mul = mul i64 %call6, 4, !dbg !115
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !111
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx7, align 4, !dbg !117
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay8), !dbg !119
  %7 = load i32*, i32** %data, align 8, !dbg !120
  %8 = bitcast i32* %7 to i8*, !dbg !120
  call void @free(i8* %8) #7, !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_18_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILabel(scope: !16, name: "source", file: !17, line: 28)
!25 = !DILocation(line: 28, column: 1, scope: !16)
!26 = !DILocation(line: 30, column: 23, scope: !16)
!27 = !DILocation(line: 30, column: 12, scope: !16)
!28 = !DILocation(line: 30, column: 10, scope: !16)
!29 = !DILocation(line: 31, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 9)
!31 = !DILocation(line: 31, column: 14, scope: !30)
!32 = !DILocation(line: 31, column: 9, scope: !16)
!33 = !DILocation(line: 31, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !17, line: 31, column: 23)
!35 = !DILocation(line: 32, column: 13, scope: !16)
!36 = !DILocation(line: 32, column: 5, scope: !16)
!37 = !DILocation(line: 33, column: 5, scope: !16)
!38 = !DILocation(line: 33, column: 16, scope: !16)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !17, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 35, column: 17, scope: !40)
!45 = !DILocation(line: 36, column: 17, scope: !40)
!46 = !DILocation(line: 36, column: 9, scope: !40)
!47 = !DILocation(line: 37, column: 9, scope: !40)
!48 = !DILocation(line: 37, column: 21, scope: !40)
!49 = !DILocation(line: 40, column: 9, scope: !40)
!50 = !DILocation(line: 40, column: 23, scope: !40)
!51 = !DILocation(line: 40, column: 36, scope: !40)
!52 = !DILocation(line: 40, column: 29, scope: !40)
!53 = !DILocation(line: 40, column: 41, scope: !40)
!54 = !DILocation(line: 41, column: 9, scope: !40)
!55 = !DILocation(line: 41, column: 21, scope: !40)
!56 = !DILocation(line: 42, column: 20, scope: !40)
!57 = !DILocation(line: 42, column: 9, scope: !40)
!58 = !DILocation(line: 43, column: 14, scope: !40)
!59 = !DILocation(line: 43, column: 9, scope: !40)
!60 = !DILocation(line: 45, column: 1, scope: !16)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_18_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 78, column: 5, scope: !61)
!63 = !DILocation(line: 79, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !65, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 91, type: !7)
!71 = !DILocation(line: 91, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 91, type: !67)
!73 = !DILocation(line: 91, column: 27, scope: !64)
!74 = !DILocation(line: 94, column: 22, scope: !64)
!75 = !DILocation(line: 94, column: 12, scope: !64)
!76 = !DILocation(line: 94, column: 5, scope: !64)
!77 = !DILocation(line: 96, column: 5, scope: !64)
!78 = !DILocation(line: 97, column: 5, scope: !64)
!79 = !DILocation(line: 98, column: 5, scope: !64)
!80 = !DILocation(line: 101, column: 5, scope: !64)
!81 = !DILocation(line: 102, column: 5, scope: !64)
!82 = !DILocation(line: 103, column: 5, scope: !64)
!83 = !DILocation(line: 105, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 54, type: !4)
!86 = !DILocation(line: 54, column: 15, scope: !84)
!87 = !DILocation(line: 55, column: 10, scope: !84)
!88 = !DILocation(line: 56, column: 5, scope: !84)
!89 = !DILabel(scope: !84, name: "source", file: !17, line: 57)
!90 = !DILocation(line: 57, column: 1, scope: !84)
!91 = !DILocation(line: 59, column: 23, scope: !84)
!92 = !DILocation(line: 59, column: 12, scope: !84)
!93 = !DILocation(line: 59, column: 10, scope: !84)
!94 = !DILocation(line: 60, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !84, file: !17, line: 60, column: 9)
!96 = !DILocation(line: 60, column: 14, scope: !95)
!97 = !DILocation(line: 60, column: 9, scope: !84)
!98 = !DILocation(line: 60, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 60, column: 23)
!100 = !DILocation(line: 61, column: 13, scope: !84)
!101 = !DILocation(line: 61, column: 5, scope: !84)
!102 = !DILocation(line: 62, column: 5, scope: !84)
!103 = !DILocation(line: 62, column: 17, scope: !84)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !17, line: 64, type: !41)
!105 = distinct !DILexicalBlock(scope: !84, file: !17, line: 63, column: 5)
!106 = !DILocation(line: 64, column: 17, scope: !105)
!107 = !DILocation(line: 65, column: 17, scope: !105)
!108 = !DILocation(line: 65, column: 9, scope: !105)
!109 = !DILocation(line: 66, column: 9, scope: !105)
!110 = !DILocation(line: 66, column: 21, scope: !105)
!111 = !DILocation(line: 69, column: 9, scope: !105)
!112 = !DILocation(line: 69, column: 23, scope: !105)
!113 = !DILocation(line: 69, column: 36, scope: !105)
!114 = !DILocation(line: 69, column: 29, scope: !105)
!115 = !DILocation(line: 69, column: 41, scope: !105)
!116 = !DILocation(line: 70, column: 9, scope: !105)
!117 = !DILocation(line: 70, column: 21, scope: !105)
!118 = !DILocation(line: 71, column: 20, scope: !105)
!119 = !DILocation(line: 71, column: 9, scope: !105)
!120 = !DILocation(line: 72, column: 14, scope: !105)
!121 = !DILocation(line: 72, column: 9, scope: !105)
!122 = !DILocation(line: 74, column: 1, scope: !84)
