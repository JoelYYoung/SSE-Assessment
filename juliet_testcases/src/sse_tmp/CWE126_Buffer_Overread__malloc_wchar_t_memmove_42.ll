; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !32
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !36
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %3 = bitcast i32* %2 to i8*, !dbg !36
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call4 = call i64 @wcslen(i32* %arraydecay3) #8, !dbg !39
  %mul = mul i64 %call4, 4, !dbg !40
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !36
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx5, align 4, !dbg !42
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  call void @printWLine(i32* %arraydecay6), !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %5 = bitcast i32* %4 to i8*, !dbg !45
  call void @free(i8* %5) #7, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !53
  %0 = bitcast i8* %call to i32*, !dbg !54
  store i32* %0, i32** %data.addr, align 8, !dbg !55
  %1 = load i32*, i32** %data.addr, align 8, !dbg !56
  %cmp = icmp eq i32* %1, null, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !60
  unreachable, !dbg !60

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !62
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !63
  %3 = load i32*, i32** %data.addr, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  %4 = load i32*, i32** %data.addr, align 8, !dbg !66
  ret i32* %4, !dbg !67
}

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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_42_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #7, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #7, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_42_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_42_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @goodG2BSource(i32* %0), !dbg !96
  store i32* %call, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !102
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !105
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %3 = bitcast i32* %2 to i8*, !dbg !105
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %call4 = call i64 @wcslen(i32* %arraydecay3) #8, !dbg !108
  %mul = mul i64 %call4, 4, !dbg !109
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !105
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx5, align 4, !dbg !111
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay6), !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  %5 = bitcast i32* %4 to i8*, !dbg !114
  call void @free(i8* %5) #7, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !117 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !120
  %0 = bitcast i8* %call to i32*, !dbg !121
  store i32* %0, i32** %data.addr, align 8, !dbg !122
  %1 = load i32*, i32** %data.addr, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !129
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !130
  %3 = load i32*, i32** %data.addr, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  %4 = load i32*, i32** %data.addr, align 8, !dbg !133
  ret i32* %4, !dbg !134
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_42_bad", scope: !17, file: !17, line: 33, type: !18, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_42.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 35, type: !5)
!21 = !DILocation(line: 35, column: 15, scope: !16)
!22 = !DILocation(line: 36, column: 10, scope: !16)
!23 = !DILocation(line: 37, column: 22, scope: !16)
!24 = !DILocation(line: 37, column: 12, scope: !16)
!25 = !DILocation(line: 37, column: 10, scope: !16)
!26 = !DILocalVariable(name: "dest", scope: !27, file: !17, line: 39, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 39, column: 17, scope: !27)
!32 = !DILocation(line: 40, column: 17, scope: !27)
!33 = !DILocation(line: 40, column: 9, scope: !27)
!34 = !DILocation(line: 41, column: 9, scope: !27)
!35 = !DILocation(line: 41, column: 21, scope: !27)
!36 = !DILocation(line: 44, column: 9, scope: !27)
!37 = !DILocation(line: 44, column: 23, scope: !27)
!38 = !DILocation(line: 44, column: 36, scope: !27)
!39 = !DILocation(line: 44, column: 29, scope: !27)
!40 = !DILocation(line: 44, column: 41, scope: !27)
!41 = !DILocation(line: 45, column: 9, scope: !27)
!42 = !DILocation(line: 45, column: 21, scope: !27)
!43 = !DILocation(line: 46, column: 20, scope: !27)
!44 = !DILocation(line: 46, column: 9, scope: !27)
!45 = !DILocation(line: 47, column: 14, scope: !27)
!46 = !DILocation(line: 47, column: 9, scope: !27)
!47 = !DILocation(line: 49, column: 1, scope: !16)
!48 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !49, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!5, !5}
!51 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !17, line: 23, type: !5)
!52 = !DILocation(line: 23, column: 38, scope: !48)
!53 = !DILocation(line: 26, column: 23, scope: !48)
!54 = !DILocation(line: 26, column: 12, scope: !48)
!55 = !DILocation(line: 26, column: 10, scope: !48)
!56 = !DILocation(line: 27, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !48, file: !17, line: 27, column: 9)
!58 = !DILocation(line: 27, column: 14, scope: !57)
!59 = !DILocation(line: 27, column: 9, scope: !48)
!60 = !DILocation(line: 27, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !17, line: 27, column: 23)
!62 = !DILocation(line: 28, column: 13, scope: !48)
!63 = !DILocation(line: 28, column: 5, scope: !48)
!64 = !DILocation(line: 29, column: 5, scope: !48)
!65 = !DILocation(line: 29, column: 16, scope: !48)
!66 = !DILocation(line: 30, column: 12, scope: !48)
!67 = !DILocation(line: 30, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_42_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 86, column: 5, scope: !68)
!70 = !DILocation(line: 87, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !72, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!8, !8, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !17, line: 99, type: !8)
!78 = !DILocation(line: 99, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !17, line: 99, type: !74)
!80 = !DILocation(line: 99, column: 27, scope: !71)
!81 = !DILocation(line: 102, column: 22, scope: !71)
!82 = !DILocation(line: 102, column: 12, scope: !71)
!83 = !DILocation(line: 102, column: 5, scope: !71)
!84 = !DILocation(line: 104, column: 5, scope: !71)
!85 = !DILocation(line: 105, column: 5, scope: !71)
!86 = !DILocation(line: 106, column: 5, scope: !71)
!87 = !DILocation(line: 109, column: 5, scope: !71)
!88 = !DILocation(line: 110, column: 5, scope: !71)
!89 = !DILocation(line: 111, column: 5, scope: !71)
!90 = !DILocation(line: 113, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 66, type: !18, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 68, type: !5)
!93 = !DILocation(line: 68, column: 15, scope: !91)
!94 = !DILocation(line: 69, column: 10, scope: !91)
!95 = !DILocation(line: 70, column: 26, scope: !91)
!96 = !DILocation(line: 70, column: 12, scope: !91)
!97 = !DILocation(line: 70, column: 10, scope: !91)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !17, line: 72, type: !28)
!99 = distinct !DILexicalBlock(scope: !91, file: !17, line: 71, column: 5)
!100 = !DILocation(line: 72, column: 17, scope: !99)
!101 = !DILocation(line: 73, column: 17, scope: !99)
!102 = !DILocation(line: 73, column: 9, scope: !99)
!103 = !DILocation(line: 74, column: 9, scope: !99)
!104 = !DILocation(line: 74, column: 21, scope: !99)
!105 = !DILocation(line: 77, column: 9, scope: !99)
!106 = !DILocation(line: 77, column: 23, scope: !99)
!107 = !DILocation(line: 77, column: 36, scope: !99)
!108 = !DILocation(line: 77, column: 29, scope: !99)
!109 = !DILocation(line: 77, column: 41, scope: !99)
!110 = !DILocation(line: 78, column: 9, scope: !99)
!111 = !DILocation(line: 78, column: 21, scope: !99)
!112 = !DILocation(line: 79, column: 20, scope: !99)
!113 = !DILocation(line: 79, column: 9, scope: !99)
!114 = !DILocation(line: 80, column: 14, scope: !99)
!115 = !DILocation(line: 80, column: 9, scope: !99)
!116 = !DILocation(line: 82, column: 1, scope: !91)
!117 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 55, type: !49, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", arg: 1, scope: !117, file: !17, line: 55, type: !5)
!119 = !DILocation(line: 55, column: 42, scope: !117)
!120 = !DILocation(line: 58, column: 23, scope: !117)
!121 = !DILocation(line: 58, column: 12, scope: !117)
!122 = !DILocation(line: 58, column: 10, scope: !117)
!123 = !DILocation(line: 59, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !17, line: 59, column: 9)
!125 = !DILocation(line: 59, column: 14, scope: !124)
!126 = !DILocation(line: 59, column: 9, scope: !117)
!127 = !DILocation(line: 59, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 59, column: 23)
!129 = !DILocation(line: 60, column: 13, scope: !117)
!130 = !DILocation(line: 60, column: 5, scope: !117)
!131 = !DILocation(line: 61, column: 5, scope: !117)
!132 = !DILocation(line: 61, column: 17, scope: !117)
!133 = !DILocation(line: 62, column: 12, scope: !117)
!134 = !DILocation(line: 62, column: 5, scope: !117)
