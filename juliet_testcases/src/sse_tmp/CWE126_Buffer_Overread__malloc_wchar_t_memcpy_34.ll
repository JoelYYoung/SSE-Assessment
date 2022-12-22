; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType* %myUnion to i32**, !dbg !44
  store i32* %4, i32** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType* %myUnion to i32**, !dbg !49
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !49
  store i32* %5, i32** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !60
  %7 = load i32*, i32** %data2, align 8, !dbg !61
  %8 = bitcast i32* %7 to i8*, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call7 = call i64 @wcslen(i32* %arraydecay6) #9, !dbg !63
  %mul = mul i64 %call7, 4, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !60
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx8, align 4, !dbg !66
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* %arraydecay9), !dbg !68
  %9 = load i32*, i32** %data2, align 8, !dbg !69
  %10 = bitcast i32* %9 to i8*, !dbg !69
  call void @free(i8* %10) #7, !dbg !70
  ret void, !dbg !71
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType* %myUnion, metadata !98, metadata !DIExpression()), !dbg !99
  store i32* null, i32** %data, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType* %myUnion to i32**, !dbg !115
  store i32* %4, i32** %unionFirst, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !117, metadata !DIExpression()), !dbg !119
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType* %myUnion to i32**, !dbg !120
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !120
  store i32* %5, i32** %data2, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !125
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx4, align 4, !dbg !127
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !128
  %7 = load i32*, i32** %data2, align 8, !dbg !129
  %8 = bitcast i32* %7 to i8*, !dbg !128
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %call7 = call i64 @wcslen(i32* %arraydecay6) #9, !dbg !131
  %mul = mul i64 %call7, 4, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !128
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx8, align 4, !dbg !134
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  call void @printWLine(i32* %arraydecay9), !dbg !136
  %9 = load i32*, i32** %data2, align 8, !dbg !137
  %10 = bitcast i32* %9 to i8*, !dbg !137
  call void @free(i8* %10) #7, !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 64, scope: !16)
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
!50 = !DILocalVariable(name: "dest", scope: !51, file: !17, line: 43, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !17, line: 42, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 43, column: 21, scope: !51)
!56 = !DILocation(line: 44, column: 21, scope: !51)
!57 = !DILocation(line: 44, column: 13, scope: !51)
!58 = !DILocation(line: 45, column: 13, scope: !51)
!59 = !DILocation(line: 45, column: 25, scope: !51)
!60 = !DILocation(line: 48, column: 13, scope: !51)
!61 = !DILocation(line: 48, column: 26, scope: !51)
!62 = !DILocation(line: 48, column: 39, scope: !51)
!63 = !DILocation(line: 48, column: 32, scope: !51)
!64 = !DILocation(line: 48, column: 44, scope: !51)
!65 = !DILocation(line: 49, column: 13, scope: !51)
!66 = !DILocation(line: 49, column: 25, scope: !51)
!67 = !DILocation(line: 50, column: 24, scope: !51)
!68 = !DILocation(line: 50, column: 13, scope: !51)
!69 = !DILocation(line: 51, column: 18, scope: !51)
!70 = !DILocation(line: 51, column: 13, scope: !51)
!71 = !DILocation(line: 54, column: 1, scope: !16)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_34_good", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 90, column: 5, scope: !72)
!74 = !DILocation(line: 91, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 102, type: !76, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!7, !7, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !17, line: 102, type: !7)
!82 = !DILocation(line: 102, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !17, line: 102, type: !78)
!84 = !DILocation(line: 102, column: 27, scope: !75)
!85 = !DILocation(line: 105, column: 22, scope: !75)
!86 = !DILocation(line: 105, column: 12, scope: !75)
!87 = !DILocation(line: 105, column: 5, scope: !75)
!88 = !DILocation(line: 107, column: 5, scope: !75)
!89 = !DILocation(line: 108, column: 5, scope: !75)
!90 = !DILocation(line: 109, column: 5, scope: !75)
!91 = !DILocation(line: 112, column: 5, scope: !75)
!92 = !DILocation(line: 113, column: 5, scope: !75)
!93 = !DILocation(line: 114, column: 5, scope: !75)
!94 = !DILocation(line: 116, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !17, line: 63, type: !4)
!97 = !DILocation(line: 63, column: 15, scope: !95)
!98 = !DILocalVariable(name: "myUnion", scope: !95, file: !17, line: 64, type: !23)
!99 = !DILocation(line: 64, column: 64, scope: !95)
!100 = !DILocation(line: 65, column: 10, scope: !95)
!101 = !DILocation(line: 67, column: 23, scope: !95)
!102 = !DILocation(line: 67, column: 12, scope: !95)
!103 = !DILocation(line: 67, column: 10, scope: !95)
!104 = !DILocation(line: 68, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !95, file: !17, line: 68, column: 9)
!106 = !DILocation(line: 68, column: 14, scope: !105)
!107 = !DILocation(line: 68, column: 9, scope: !95)
!108 = !DILocation(line: 68, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 68, column: 23)
!110 = !DILocation(line: 69, column: 13, scope: !95)
!111 = !DILocation(line: 69, column: 5, scope: !95)
!112 = !DILocation(line: 70, column: 5, scope: !95)
!113 = !DILocation(line: 70, column: 17, scope: !95)
!114 = !DILocation(line: 71, column: 26, scope: !95)
!115 = !DILocation(line: 71, column: 13, scope: !95)
!116 = !DILocation(line: 71, column: 24, scope: !95)
!117 = !DILocalVariable(name: "data", scope: !118, file: !17, line: 73, type: !4)
!118 = distinct !DILexicalBlock(scope: !95, file: !17, line: 72, column: 5)
!119 = !DILocation(line: 73, column: 19, scope: !118)
!120 = !DILocation(line: 73, column: 34, scope: !118)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !17, line: 75, type: !52)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 74, column: 9)
!123 = !DILocation(line: 75, column: 21, scope: !122)
!124 = !DILocation(line: 76, column: 21, scope: !122)
!125 = !DILocation(line: 76, column: 13, scope: !122)
!126 = !DILocation(line: 77, column: 13, scope: !122)
!127 = !DILocation(line: 77, column: 25, scope: !122)
!128 = !DILocation(line: 80, column: 13, scope: !122)
!129 = !DILocation(line: 80, column: 26, scope: !122)
!130 = !DILocation(line: 80, column: 39, scope: !122)
!131 = !DILocation(line: 80, column: 32, scope: !122)
!132 = !DILocation(line: 80, column: 44, scope: !122)
!133 = !DILocation(line: 81, column: 13, scope: !122)
!134 = !DILocation(line: 81, column: 25, scope: !122)
!135 = !DILocation(line: 82, column: 24, scope: !122)
!136 = !DILocation(line: 82, column: 13, scope: !122)
!137 = !DILocation(line: 83, column: 18, scope: !122)
!138 = !DILocation(line: 83, column: 13, scope: !122)
!139 = !DILocation(line: 86, column: 1, scope: !95)
