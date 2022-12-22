; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !44
  store i32* %4, i32** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !49
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !49
  store i32* %5, i32** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !63
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx4, align 4, !dbg !65
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !67
  store i64 %call6, i64* %destLen, align 8, !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !72
  %7 = load i64, i64* %destLen, align 8, !dbg !74
  %cmp7 = icmp ult i64 %6, %7, !dbg !75
  br i1 %cmp7, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data2, align 8, !dbg !77
  %9 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !77
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !77
  %11 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !81
  store i32 %10, i32* %arrayidx9, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %12, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx10, align 4, !dbg !90
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay11), !dbg !92
  %13 = load i32*, i32** %data2, align 8, !dbg !93
  %14 = bitcast i32* %13 to i8*, !dbg !93
  call void @free(i8* %14) #6, !dbg !94
  ret void, !dbg !95
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

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_34_good() #0 !dbg !96 {
entry:
  call void @goodG2B(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #6, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #6, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_34_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_34_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType* %myUnion, metadata !122, metadata !DIExpression()), !dbg !123
  store i32* null, i32** %data, align 8, !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !125
  %0 = bitcast i8* %call to i32*, !dbg !126
  store i32* %0, i32** %data, align 8, !dbg !127
  %1 = load i32*, i32** %data, align 8, !dbg !128
  %cmp = icmp eq i32* %1, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !134
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !135
  %3 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  %4 = load i32*, i32** %data, align 8, !dbg !138
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !139
  store i32* %4, i32** %unionFirst, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !141, metadata !DIExpression()), !dbg !143
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !144
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !144
  store i32* %5, i32** %data2, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !153
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx4, align 4, !dbg !155
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !157
  store i64 %call6, i64* %destLen, align 8, !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !162
  %7 = load i64, i64* %destLen, align 8, !dbg !164
  %cmp7 = icmp ult i64 %6, %7, !dbg !165
  br i1 %cmp7, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data2, align 8, !dbg !167
  %9 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !167
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !167
  %11 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !171
  store i32 %10, i32* %arrayidx9, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %12, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx10, align 4, !dbg !179
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  call void @printWLine(i32* %arraydecay11), !dbg !181
  %13 = load i32*, i32** %data2, align 8, !dbg !182
  %14 = bitcast i32* %13 to i8*, !dbg !182
  call void @free(i8* %14) #6, !dbg !183
  ret void, !dbg !184
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_34.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_34.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 62, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocation(line: 35, column: 23, scope: !16)
!31 = !DILocation(line: 35, column: 12, scope: !16)
!32 = !DILocation(line: 35, column: 10, scope: !16)
!33 = !DILocation(line: 36, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 9)
!35 = !DILocation(line: 36, column: 14, scope: !34)
!36 = !DILocation(line: 36, column: 9, scope: !16)
!37 = !DILocation(line: 36, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 36, column: 23)
!39 = !DILocation(line: 37, column: 13, scope: !16)
!40 = !DILocation(line: 37, column: 5, scope: !16)
!41 = !DILocation(line: 38, column: 5, scope: !16)
!42 = !DILocation(line: 38, column: 16, scope: !16)
!43 = !DILocation(line: 39, column: 26, scope: !16)
!44 = !DILocation(line: 39, column: 13, scope: !16)
!45 = !DILocation(line: 39, column: 24, scope: !16)
!46 = !DILocalVariable(name: "data", scope: !47, file: !17, line: 41, type: !4)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!48 = !DILocation(line: 41, column: 19, scope: !47)
!49 = !DILocation(line: 41, column: 34, scope: !47)
!50 = !DILocalVariable(name: "i", scope: !51, file: !17, line: 43, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !17, line: 42, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 43, column: 20, scope: !51)
!55 = !DILocalVariable(name: "destLen", scope: !51, file: !17, line: 43, type: !52)
!56 = !DILocation(line: 43, column: 23, scope: !51)
!57 = !DILocalVariable(name: "dest", scope: !51, file: !17, line: 44, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 100)
!61 = !DILocation(line: 44, column: 21, scope: !51)
!62 = !DILocation(line: 45, column: 21, scope: !51)
!63 = !DILocation(line: 45, column: 13, scope: !51)
!64 = !DILocation(line: 46, column: 13, scope: !51)
!65 = !DILocation(line: 46, column: 25, scope: !51)
!66 = !DILocation(line: 47, column: 30, scope: !51)
!67 = !DILocation(line: 47, column: 23, scope: !51)
!68 = !DILocation(line: 47, column: 21, scope: !51)
!69 = !DILocation(line: 50, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !51, file: !17, line: 50, column: 13)
!71 = !DILocation(line: 50, column: 18, scope: !70)
!72 = !DILocation(line: 50, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !17, line: 50, column: 13)
!74 = !DILocation(line: 50, column: 29, scope: !73)
!75 = !DILocation(line: 50, column: 27, scope: !73)
!76 = !DILocation(line: 50, column: 13, scope: !70)
!77 = !DILocation(line: 52, column: 27, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !17, line: 51, column: 13)
!79 = !DILocation(line: 52, column: 32, scope: !78)
!80 = !DILocation(line: 52, column: 22, scope: !78)
!81 = !DILocation(line: 52, column: 17, scope: !78)
!82 = !DILocation(line: 52, column: 25, scope: !78)
!83 = !DILocation(line: 53, column: 13, scope: !78)
!84 = !DILocation(line: 50, column: 39, scope: !73)
!85 = !DILocation(line: 50, column: 13, scope: !73)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 53, column: 13, scope: !70)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocation(line: 54, column: 13, scope: !51)
!90 = !DILocation(line: 54, column: 25, scope: !51)
!91 = !DILocation(line: 55, column: 24, scope: !51)
!92 = !DILocation(line: 55, column: 13, scope: !51)
!93 = !DILocation(line: 56, column: 18, scope: !51)
!94 = !DILocation(line: 56, column: 13, scope: !51)
!95 = !DILocation(line: 59, column: 1, scope: !16)
!96 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_34_good", scope: !17, file: !17, line: 98, type: !18, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 100, column: 5, scope: !96)
!98 = !DILocation(line: 101, column: 1, scope: !96)
!99 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 112, type: !100, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!7, !7, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !17, line: 112, type: !7)
!106 = !DILocation(line: 112, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !17, line: 112, type: !102)
!108 = !DILocation(line: 112, column: 27, scope: !99)
!109 = !DILocation(line: 115, column: 22, scope: !99)
!110 = !DILocation(line: 115, column: 12, scope: !99)
!111 = !DILocation(line: 115, column: 5, scope: !99)
!112 = !DILocation(line: 117, column: 5, scope: !99)
!113 = !DILocation(line: 118, column: 5, scope: !99)
!114 = !DILocation(line: 119, column: 5, scope: !99)
!115 = !DILocation(line: 122, column: 5, scope: !99)
!116 = !DILocation(line: 123, column: 5, scope: !99)
!117 = !DILocation(line: 124, column: 5, scope: !99)
!118 = !DILocation(line: 126, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 66, type: !18, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !17, line: 68, type: !4)
!121 = !DILocation(line: 68, column: 15, scope: !119)
!122 = !DILocalVariable(name: "myUnion", scope: !119, file: !17, line: 69, type: !23)
!123 = !DILocation(line: 69, column: 62, scope: !119)
!124 = !DILocation(line: 70, column: 10, scope: !119)
!125 = !DILocation(line: 72, column: 23, scope: !119)
!126 = !DILocation(line: 72, column: 12, scope: !119)
!127 = !DILocation(line: 72, column: 10, scope: !119)
!128 = !DILocation(line: 73, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !17, line: 73, column: 9)
!130 = !DILocation(line: 73, column: 14, scope: !129)
!131 = !DILocation(line: 73, column: 9, scope: !119)
!132 = !DILocation(line: 73, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 73, column: 23)
!134 = !DILocation(line: 74, column: 13, scope: !119)
!135 = !DILocation(line: 74, column: 5, scope: !119)
!136 = !DILocation(line: 75, column: 5, scope: !119)
!137 = !DILocation(line: 75, column: 17, scope: !119)
!138 = !DILocation(line: 76, column: 26, scope: !119)
!139 = !DILocation(line: 76, column: 13, scope: !119)
!140 = !DILocation(line: 76, column: 24, scope: !119)
!141 = !DILocalVariable(name: "data", scope: !142, file: !17, line: 78, type: !4)
!142 = distinct !DILexicalBlock(scope: !119, file: !17, line: 77, column: 5)
!143 = !DILocation(line: 78, column: 19, scope: !142)
!144 = !DILocation(line: 78, column: 34, scope: !142)
!145 = !DILocalVariable(name: "i", scope: !146, file: !17, line: 80, type: !52)
!146 = distinct !DILexicalBlock(scope: !142, file: !17, line: 79, column: 9)
!147 = !DILocation(line: 80, column: 20, scope: !146)
!148 = !DILocalVariable(name: "destLen", scope: !146, file: !17, line: 80, type: !52)
!149 = !DILocation(line: 80, column: 23, scope: !146)
!150 = !DILocalVariable(name: "dest", scope: !146, file: !17, line: 81, type: !58)
!151 = !DILocation(line: 81, column: 21, scope: !146)
!152 = !DILocation(line: 82, column: 21, scope: !146)
!153 = !DILocation(line: 82, column: 13, scope: !146)
!154 = !DILocation(line: 83, column: 13, scope: !146)
!155 = !DILocation(line: 83, column: 25, scope: !146)
!156 = !DILocation(line: 84, column: 30, scope: !146)
!157 = !DILocation(line: 84, column: 23, scope: !146)
!158 = !DILocation(line: 84, column: 21, scope: !146)
!159 = !DILocation(line: 87, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !146, file: !17, line: 87, column: 13)
!161 = !DILocation(line: 87, column: 18, scope: !160)
!162 = !DILocation(line: 87, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !17, line: 87, column: 13)
!164 = !DILocation(line: 87, column: 29, scope: !163)
!165 = !DILocation(line: 87, column: 27, scope: !163)
!166 = !DILocation(line: 87, column: 13, scope: !160)
!167 = !DILocation(line: 89, column: 27, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !17, line: 88, column: 13)
!169 = !DILocation(line: 89, column: 32, scope: !168)
!170 = !DILocation(line: 89, column: 22, scope: !168)
!171 = !DILocation(line: 89, column: 17, scope: !168)
!172 = !DILocation(line: 89, column: 25, scope: !168)
!173 = !DILocation(line: 90, column: 13, scope: !168)
!174 = !DILocation(line: 87, column: 39, scope: !163)
!175 = !DILocation(line: 87, column: 13, scope: !163)
!176 = distinct !{!176, !166, !177, !88}
!177 = !DILocation(line: 90, column: 13, scope: !160)
!178 = !DILocation(line: 91, column: 13, scope: !146)
!179 = !DILocation(line: 91, column: 25, scope: !146)
!180 = !DILocation(line: 92, column: 24, scope: !146)
!181 = !DILocation(line: 92, column: 13, scope: !146)
!182 = !DILocation(line: 93, column: 18, scope: !146)
!183 = !DILocation(line: 93, column: 13, scope: !146)
!184 = !DILocation(line: 96, column: 1, scope: !119)
