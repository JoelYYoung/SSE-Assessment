; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !43
  %5 = load i32*, i32** %data1, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %6 = load i32*, i32** %data1, align 8, !dbg !46
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !47
  store i32* %6, i32** %7, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !49, metadata !DIExpression()), !dbg !51
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !52
  %9 = load i32*, i32** %8, align 8, !dbg !53
  store i32* %9, i32** %data3, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !54, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !61
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx5, align 4, !dbg !63
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %10 = bitcast i32* %arraydecay6 to i8*, !dbg !64
  %11 = load i32*, i32** %data3, align 8, !dbg !65
  %12 = bitcast i32* %11 to i8*, !dbg !64
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !67
  %mul = mul i64 %call8, 4, !dbg !68
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !64
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx9, align 4, !dbg !70
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  call void @printWLine(i32* %arraydecay10), !dbg !72
  %13 = load i32*, i32** %data3, align 8, !dbg !73
  %14 = bitcast i32* %13 to i8*, !dbg !73
  call void @free(i8* %14) #7, !dbg !74
  ret void, !dbg !75
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
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_32_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_32_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_32_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !102, metadata !DIExpression()), !dbg !103
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !104, metadata !DIExpression()), !dbg !105
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !107, metadata !DIExpression()), !dbg !109
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !110
  %1 = load i32*, i32** %0, align 8, !dbg !111
  store i32* %1, i32** %data1, align 8, !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !112
  %2 = bitcast i8* %call to i32*, !dbg !113
  store i32* %2, i32** %data1, align 8, !dbg !114
  %3 = load i32*, i32** %data1, align 8, !dbg !115
  %cmp = icmp eq i32* %3, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !121
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #7, !dbg !122
  %5 = load i32*, i32** %data1, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %6 = load i32*, i32** %data1, align 8, !dbg !125
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !126
  store i32* %6, i32** %7, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !128, metadata !DIExpression()), !dbg !130
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !131
  %9 = load i32*, i32** %8, align 8, !dbg !132
  store i32* %9, i32** %data3, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !137
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx5, align 4, !dbg !139
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %10 = bitcast i32* %arraydecay6 to i8*, !dbg !140
  %11 = load i32*, i32** %data3, align 8, !dbg !141
  %12 = bitcast i32* %11 to i8*, !dbg !140
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !143
  %mul = mul i64 %call8, 4, !dbg !144
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !140
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx9, align 4, !dbg !146
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  call void @printWLine(i32* %arraydecay10), !dbg !148
  %13 = load i32*, i32** %data3, align 8, !dbg !149
  %14 = bitcast i32* %13 to i8*, !dbg !149
  call void @free(i8* %14) #7, !dbg !150
  ret void, !dbg !151
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 30, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocation(line: 32, column: 27, scope: !29)
!34 = !DILocation(line: 32, column: 16, scope: !29)
!35 = !DILocation(line: 32, column: 14, scope: !29)
!36 = !DILocation(line: 33, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !17, line: 33, column: 13)
!38 = !DILocation(line: 33, column: 18, scope: !37)
!39 = !DILocation(line: 33, column: 13, scope: !29)
!40 = !DILocation(line: 33, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 33, column: 27)
!42 = !DILocation(line: 34, column: 17, scope: !29)
!43 = !DILocation(line: 34, column: 9, scope: !29)
!44 = !DILocation(line: 35, column: 9, scope: !29)
!45 = !DILocation(line: 35, column: 20, scope: !29)
!46 = !DILocation(line: 36, column: 21, scope: !29)
!47 = !DILocation(line: 36, column: 10, scope: !29)
!48 = !DILocation(line: 36, column: 19, scope: !29)
!49 = !DILocalVariable(name: "data", scope: !50, file: !17, line: 39, type: !4)
!50 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!51 = !DILocation(line: 39, column: 19, scope: !50)
!52 = !DILocation(line: 39, column: 27, scope: !50)
!53 = !DILocation(line: 39, column: 26, scope: !50)
!54 = !DILocalVariable(name: "dest", scope: !55, file: !17, line: 41, type: !56)
!55 = distinct !DILexicalBlock(scope: !50, file: !17, line: 40, column: 9)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 41, column: 21, scope: !55)
!60 = !DILocation(line: 42, column: 21, scope: !55)
!61 = !DILocation(line: 42, column: 13, scope: !55)
!62 = !DILocation(line: 43, column: 13, scope: !55)
!63 = !DILocation(line: 43, column: 25, scope: !55)
!64 = !DILocation(line: 46, column: 13, scope: !55)
!65 = !DILocation(line: 46, column: 27, scope: !55)
!66 = !DILocation(line: 46, column: 40, scope: !55)
!67 = !DILocation(line: 46, column: 33, scope: !55)
!68 = !DILocation(line: 46, column: 45, scope: !55)
!69 = !DILocation(line: 47, column: 13, scope: !55)
!70 = !DILocation(line: 47, column: 25, scope: !55)
!71 = !DILocation(line: 48, column: 24, scope: !55)
!72 = !DILocation(line: 48, column: 13, scope: !55)
!73 = !DILocation(line: 49, column: 18, scope: !55)
!74 = !DILocation(line: 49, column: 13, scope: !55)
!75 = !DILocation(line: 52, column: 1, scope: !16)
!76 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_32_good", scope: !17, file: !17, line: 90, type: !18, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 92, column: 5, scope: !76)
!78 = !DILocation(line: 93, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 104, type: !80, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !17, line: 104, type: !7)
!86 = !DILocation(line: 104, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !17, line: 104, type: !82)
!88 = !DILocation(line: 104, column: 27, scope: !79)
!89 = !DILocation(line: 107, column: 22, scope: !79)
!90 = !DILocation(line: 107, column: 12, scope: !79)
!91 = !DILocation(line: 107, column: 5, scope: !79)
!92 = !DILocation(line: 109, column: 5, scope: !79)
!93 = !DILocation(line: 110, column: 5, scope: !79)
!94 = !DILocation(line: 111, column: 5, scope: !79)
!95 = !DILocation(line: 114, column: 5, scope: !79)
!96 = !DILocation(line: 115, column: 5, scope: !79)
!97 = !DILocation(line: 116, column: 5, scope: !79)
!98 = !DILocation(line: 118, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !17, line: 61, type: !4)
!101 = !DILocation(line: 61, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataPtr1", scope: !99, file: !17, line: 62, type: !23)
!103 = !DILocation(line: 62, column: 16, scope: !99)
!104 = !DILocalVariable(name: "dataPtr2", scope: !99, file: !17, line: 63, type: !23)
!105 = !DILocation(line: 63, column: 16, scope: !99)
!106 = !DILocation(line: 64, column: 10, scope: !99)
!107 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 66, type: !4)
!108 = distinct !DILexicalBlock(scope: !99, file: !17, line: 65, column: 5)
!109 = !DILocation(line: 66, column: 19, scope: !108)
!110 = !DILocation(line: 66, column: 27, scope: !108)
!111 = !DILocation(line: 66, column: 26, scope: !108)
!112 = !DILocation(line: 68, column: 27, scope: !108)
!113 = !DILocation(line: 68, column: 16, scope: !108)
!114 = !DILocation(line: 68, column: 14, scope: !108)
!115 = !DILocation(line: 69, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !17, line: 69, column: 13)
!117 = !DILocation(line: 69, column: 18, scope: !116)
!118 = !DILocation(line: 69, column: 13, scope: !108)
!119 = !DILocation(line: 69, column: 28, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !17, line: 69, column: 27)
!121 = !DILocation(line: 70, column: 17, scope: !108)
!122 = !DILocation(line: 70, column: 9, scope: !108)
!123 = !DILocation(line: 71, column: 9, scope: !108)
!124 = !DILocation(line: 71, column: 21, scope: !108)
!125 = !DILocation(line: 72, column: 21, scope: !108)
!126 = !DILocation(line: 72, column: 10, scope: !108)
!127 = !DILocation(line: 72, column: 19, scope: !108)
!128 = !DILocalVariable(name: "data", scope: !129, file: !17, line: 75, type: !4)
!129 = distinct !DILexicalBlock(scope: !99, file: !17, line: 74, column: 5)
!130 = !DILocation(line: 75, column: 19, scope: !129)
!131 = !DILocation(line: 75, column: 27, scope: !129)
!132 = !DILocation(line: 75, column: 26, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !17, line: 77, type: !56)
!134 = distinct !DILexicalBlock(scope: !129, file: !17, line: 76, column: 9)
!135 = !DILocation(line: 77, column: 21, scope: !134)
!136 = !DILocation(line: 78, column: 21, scope: !134)
!137 = !DILocation(line: 78, column: 13, scope: !134)
!138 = !DILocation(line: 79, column: 13, scope: !134)
!139 = !DILocation(line: 79, column: 25, scope: !134)
!140 = !DILocation(line: 82, column: 13, scope: !134)
!141 = !DILocation(line: 82, column: 27, scope: !134)
!142 = !DILocation(line: 82, column: 40, scope: !134)
!143 = !DILocation(line: 82, column: 33, scope: !134)
!144 = !DILocation(line: 82, column: 45, scope: !134)
!145 = !DILocation(line: 83, column: 13, scope: !134)
!146 = !DILocation(line: 83, column: 25, scope: !134)
!147 = !DILocation(line: 84, column: 24, scope: !134)
!148 = !DILocation(line: 84, column: 13, scope: !134)
!149 = !DILocation(line: 85, column: 18, scope: !134)
!150 = !DILocation(line: 85, column: 13, scope: !134)
!151 = !DILocation(line: 88, column: 1, scope: !99)
