; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_01_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx3, align 4, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %6 = bitcast i32* %5 to i8*, !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !49
  %mul = mul i64 %call6, 4, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !46
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx7, align 4, !dbg !52
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  call void @printWLine(i32* %arraydecay8), !dbg !54
  %7 = load i32*, i32** %data, align 8, !dbg !55
  %8 = bitcast i32* %7 to i8*, !dbg !55
  call void @free(i8* %8) #7, !dbg !56
  ret void, !dbg !57
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_01_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_01_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_01_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !102
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx3, align 4, !dbg !104
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !105
  %5 = load i32*, i32** %data, align 8, !dbg !106
  %6 = bitcast i32* %5 to i8*, !dbg !105
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !108
  %mul = mul i64 %call6, 4, !dbg !109
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !105
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx7, align 4, !dbg !111
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay8), !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %8 = bitcast i32* %7 to i8*, !dbg !114
  call void @free(i8* %8) #7, !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_01.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_01_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_01.c", directory: "/root/SSE-Assessment")
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
!36 = !DILocalVariable(name: "dest", scope: !37, file: !17, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 17, scope: !37)
!42 = !DILocation(line: 34, column: 17, scope: !37)
!43 = !DILocation(line: 34, column: 9, scope: !37)
!44 = !DILocation(line: 35, column: 9, scope: !37)
!45 = !DILocation(line: 35, column: 21, scope: !37)
!46 = !DILocation(line: 38, column: 9, scope: !37)
!47 = !DILocation(line: 38, column: 23, scope: !37)
!48 = !DILocation(line: 38, column: 36, scope: !37)
!49 = !DILocation(line: 38, column: 29, scope: !37)
!50 = !DILocation(line: 38, column: 41, scope: !37)
!51 = !DILocation(line: 39, column: 9, scope: !37)
!52 = !DILocation(line: 39, column: 21, scope: !37)
!53 = !DILocation(line: 40, column: 20, scope: !37)
!54 = !DILocation(line: 40, column: 9, scope: !37)
!55 = !DILocation(line: 41, column: 14, scope: !37)
!56 = !DILocation(line: 41, column: 9, scope: !37)
!57 = !DILocation(line: 43, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_01_good", scope: !17, file: !17, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 74, column: 5, scope: !58)
!60 = !DILocation(line: 75, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 87, type: !62, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !17, line: 87, type: !7)
!68 = !DILocation(line: 87, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !17, line: 87, type: !64)
!70 = !DILocation(line: 87, column: 27, scope: !61)
!71 = !DILocation(line: 90, column: 22, scope: !61)
!72 = !DILocation(line: 90, column: 12, scope: !61)
!73 = !DILocation(line: 90, column: 5, scope: !61)
!74 = !DILocation(line: 92, column: 5, scope: !61)
!75 = !DILocation(line: 93, column: 5, scope: !61)
!76 = !DILocation(line: 94, column: 5, scope: !61)
!77 = !DILocation(line: 97, column: 5, scope: !61)
!78 = !DILocation(line: 98, column: 5, scope: !61)
!79 = !DILocation(line: 99, column: 5, scope: !61)
!80 = !DILocation(line: 101, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 50, type: !18, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !17, line: 52, type: !4)
!83 = !DILocation(line: 52, column: 15, scope: !81)
!84 = !DILocation(line: 53, column: 10, scope: !81)
!85 = !DILocation(line: 55, column: 23, scope: !81)
!86 = !DILocation(line: 55, column: 12, scope: !81)
!87 = !DILocation(line: 55, column: 10, scope: !81)
!88 = !DILocation(line: 56, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !17, line: 56, column: 9)
!90 = !DILocation(line: 56, column: 14, scope: !89)
!91 = !DILocation(line: 56, column: 9, scope: !81)
!92 = !DILocation(line: 56, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 56, column: 23)
!94 = !DILocation(line: 57, column: 13, scope: !81)
!95 = !DILocation(line: 57, column: 5, scope: !81)
!96 = !DILocation(line: 58, column: 5, scope: !81)
!97 = !DILocation(line: 58, column: 17, scope: !81)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !17, line: 60, type: !38)
!99 = distinct !DILexicalBlock(scope: !81, file: !17, line: 59, column: 5)
!100 = !DILocation(line: 60, column: 17, scope: !99)
!101 = !DILocation(line: 61, column: 17, scope: !99)
!102 = !DILocation(line: 61, column: 9, scope: !99)
!103 = !DILocation(line: 62, column: 9, scope: !99)
!104 = !DILocation(line: 62, column: 21, scope: !99)
!105 = !DILocation(line: 65, column: 9, scope: !99)
!106 = !DILocation(line: 65, column: 23, scope: !99)
!107 = !DILocation(line: 65, column: 36, scope: !99)
!108 = !DILocation(line: 65, column: 29, scope: !99)
!109 = !DILocation(line: 65, column: 41, scope: !99)
!110 = !DILocation(line: 66, column: 9, scope: !99)
!111 = !DILocation(line: 66, column: 21, scope: !99)
!112 = !DILocation(line: 67, column: 20, scope: !99)
!113 = !DILocation(line: 67, column: 9, scope: !99)
!114 = !DILocation(line: 68, column: 14, scope: !99)
!115 = !DILocation(line: 68, column: 9, scope: !99)
!116 = !DILocation(line: 70, column: 1, scope: !81)
