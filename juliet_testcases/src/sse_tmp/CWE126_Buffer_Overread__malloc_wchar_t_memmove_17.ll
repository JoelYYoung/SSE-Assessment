; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !32
  %1 = bitcast i8* %call to i32*, !dbg !34
  store i32* %1, i32** %data, align 8, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %5, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx4, align 4, !dbg !61
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !62
  %7 = load i32*, i32** %data, align 8, !dbg !63
  %8 = bitcast i32* %7 to i8*, !dbg !62
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call7 = call i64 @wcslen(i32* %arraydecay6) #9, !dbg !65
  %mul = mul i64 %call7, 4, !dbg !66
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !62
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx8, align 4, !dbg !68
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  call void @printWLine(i32* %arraydecay9), !dbg !70
  %9 = load i32*, i32** %data, align 8, !dbg !71
  %10 = bitcast i32* %9 to i8*, !dbg !71
  call void @free(i8* %10) #7, !dbg !72
  ret void, !dbg !73
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_17_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_17_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_17_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  store i32 0, i32* %h, align 4, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !106
  %cmp = icmp slt i32 %0, 1, !dbg !108
  br i1 %cmp, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !110
  %1 = bitcast i8* %call to i32*, !dbg !112
  store i32* %1, i32** %data, align 8, !dbg !113
  %2 = load i32*, i32** %data, align 8, !dbg !114
  %cmp1 = icmp eq i32* %2, null, !dbg !116
  br i1 %cmp1, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %data, align 8, !dbg !120
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !121
  %4 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !125
  %inc = add nsw i32 %5, 1, !dbg !125
  store i32 %inc, i32* %h, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !133
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx4, align 4, !dbg !135
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !136
  %7 = load i32*, i32** %data, align 8, !dbg !137
  %8 = bitcast i32* %7 to i8*, !dbg !136
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  %call7 = call i64 @wcslen(i32* %arraydecay6) #9, !dbg !139
  %mul = mul i64 %call7, 4, !dbg !140
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !136
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx8, align 4, !dbg !142
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  call void @printWLine(i32* %arraydecay9), !dbg !144
  %9 = load i32*, i32** %data, align 8, !dbg !145
  %10 = bitcast i32* %9 to i8*, !dbg !145
  call void @free(i8* %10) #7, !dbg !146
  ret void, !dbg !147
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_17.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_17.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocation(line: 31, column: 27, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 16, scope: !33)
!35 = !DILocation(line: 31, column: 14, scope: !33)
!36 = !DILocation(line: 32, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 32, column: 13)
!38 = !DILocation(line: 32, column: 18, scope: !37)
!39 = !DILocation(line: 32, column: 13, scope: !33)
!40 = !DILocation(line: 32, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 32, column: 27)
!42 = !DILocation(line: 33, column: 17, scope: !33)
!43 = !DILocation(line: 33, column: 9, scope: !33)
!44 = !DILocation(line: 34, column: 9, scope: !33)
!45 = !DILocation(line: 34, column: 20, scope: !33)
!46 = !DILocation(line: 35, column: 5, scope: !33)
!47 = !DILocation(line: 28, column: 24, scope: !29)
!48 = !DILocation(line: 28, column: 5, scope: !29)
!49 = distinct !{!49, !31, !50, !51}
!50 = !DILocation(line: 35, column: 5, scope: !26)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "dest", scope: !53, file: !17, line: 37, type: !54)
!53 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 37, column: 17, scope: !53)
!58 = !DILocation(line: 38, column: 17, scope: !53)
!59 = !DILocation(line: 38, column: 9, scope: !53)
!60 = !DILocation(line: 39, column: 9, scope: !53)
!61 = !DILocation(line: 39, column: 21, scope: !53)
!62 = !DILocation(line: 42, column: 9, scope: !53)
!63 = !DILocation(line: 42, column: 23, scope: !53)
!64 = !DILocation(line: 42, column: 36, scope: !53)
!65 = !DILocation(line: 42, column: 29, scope: !53)
!66 = !DILocation(line: 42, column: 41, scope: !53)
!67 = !DILocation(line: 43, column: 9, scope: !53)
!68 = !DILocation(line: 43, column: 21, scope: !53)
!69 = !DILocation(line: 44, column: 20, scope: !53)
!70 = !DILocation(line: 44, column: 9, scope: !53)
!71 = !DILocation(line: 45, column: 14, scope: !53)
!72 = !DILocation(line: 45, column: 9, scope: !53)
!73 = !DILocation(line: 47, column: 1, scope: !16)
!74 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_17_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 82, column: 5, scope: !74)
!76 = !DILocation(line: 83, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !78, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !17, line: 95, type: !7)
!84 = !DILocation(line: 95, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !17, line: 95, type: !80)
!86 = !DILocation(line: 95, column: 27, scope: !77)
!87 = !DILocation(line: 98, column: 22, scope: !77)
!88 = !DILocation(line: 98, column: 12, scope: !77)
!89 = !DILocation(line: 98, column: 5, scope: !77)
!90 = !DILocation(line: 100, column: 5, scope: !77)
!91 = !DILocation(line: 101, column: 5, scope: !77)
!92 = !DILocation(line: 102, column: 5, scope: !77)
!93 = !DILocation(line: 105, column: 5, scope: !77)
!94 = !DILocation(line: 106, column: 5, scope: !77)
!95 = !DILocation(line: 107, column: 5, scope: !77)
!96 = !DILocation(line: 109, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "h", scope: !97, file: !17, line: 56, type: !7)
!99 = !DILocation(line: 56, column: 9, scope: !97)
!100 = !DILocalVariable(name: "data", scope: !97, file: !17, line: 57, type: !4)
!101 = !DILocation(line: 57, column: 15, scope: !97)
!102 = !DILocation(line: 58, column: 10, scope: !97)
!103 = !DILocation(line: 59, column: 11, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !17, line: 59, column: 5)
!105 = !DILocation(line: 59, column: 9, scope: !104)
!106 = !DILocation(line: 59, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !17, line: 59, column: 5)
!108 = !DILocation(line: 59, column: 18, scope: !107)
!109 = !DILocation(line: 59, column: 5, scope: !104)
!110 = !DILocation(line: 62, column: 27, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !17, line: 60, column: 5)
!112 = !DILocation(line: 62, column: 16, scope: !111)
!113 = !DILocation(line: 62, column: 14, scope: !111)
!114 = !DILocation(line: 63, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 63, column: 13)
!116 = !DILocation(line: 63, column: 18, scope: !115)
!117 = !DILocation(line: 63, column: 13, scope: !111)
!118 = !DILocation(line: 63, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 63, column: 27)
!120 = !DILocation(line: 64, column: 17, scope: !111)
!121 = !DILocation(line: 64, column: 9, scope: !111)
!122 = !DILocation(line: 65, column: 9, scope: !111)
!123 = !DILocation(line: 65, column: 21, scope: !111)
!124 = !DILocation(line: 66, column: 5, scope: !111)
!125 = !DILocation(line: 59, column: 24, scope: !107)
!126 = !DILocation(line: 59, column: 5, scope: !107)
!127 = distinct !{!127, !109, !128, !51}
!128 = !DILocation(line: 66, column: 5, scope: !104)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !17, line: 68, type: !54)
!130 = distinct !DILexicalBlock(scope: !97, file: !17, line: 67, column: 5)
!131 = !DILocation(line: 68, column: 17, scope: !130)
!132 = !DILocation(line: 69, column: 17, scope: !130)
!133 = !DILocation(line: 69, column: 9, scope: !130)
!134 = !DILocation(line: 70, column: 9, scope: !130)
!135 = !DILocation(line: 70, column: 21, scope: !130)
!136 = !DILocation(line: 73, column: 9, scope: !130)
!137 = !DILocation(line: 73, column: 23, scope: !130)
!138 = !DILocation(line: 73, column: 36, scope: !130)
!139 = !DILocation(line: 73, column: 29, scope: !130)
!140 = !DILocation(line: 73, column: 41, scope: !130)
!141 = !DILocation(line: 74, column: 9, scope: !130)
!142 = !DILocation(line: 74, column: 21, scope: !130)
!143 = !DILocation(line: 75, column: 20, scope: !130)
!144 = !DILocation(line: 75, column: 9, scope: !130)
!145 = !DILocation(line: 76, column: 14, scope: !130)
!146 = !DILocation(line: 76, column: 9, scope: !130)
!147 = !DILocation(line: 78, column: 1, scope: !97)
