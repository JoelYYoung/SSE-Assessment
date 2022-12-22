; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* null, i8** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #9, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %data, align 8, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %4, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx2, align 1, !dbg !58
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  %5 = load i8*, i8** %data, align 8, !dbg !60
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %call5 = call i64 @strlen(i8* %arraydecay4) #10, !dbg !62
  %mul = mul i64 %call5, 1, !dbg !63
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %5, i64 %mul, i1 false), !dbg !59
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !64
  store i8 0, i8* %arrayidx6, align 1, !dbg !65
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !66
  call void @printLine(i8* %arraydecay7), !dbg !67
  %6 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* %6) #8, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_17_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #8, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #8, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__malloc_char_memmove_17_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__malloc_char_memmove_17_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* null, i8** %data, align 8, !dbg !97
  store i32 0, i32* %h, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !101
  %cmp = icmp slt i32 %0, 1, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !105
  store i8* %call, i8** %data, align 8, !dbg !107
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %cmp1 = icmp eq i8* %1, null, !dbg !110
  br i1 %cmp1, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #9, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %data, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %h, align 4, !dbg !119
  %inc = add nsw i32 %4, 1, !dbg !119
  store i32 %inc, i32* %h, align 4, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !126
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx2, align 1, !dbg !128
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !130
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  %call5 = call i64 @strlen(i8* %arraydecay4) #10, !dbg !132
  %mul = mul i64 %call5, 1, !dbg !133
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %5, i64 %mul, i1 false), !dbg !129
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx6, align 1, !dbg !135
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  call void @printLine(i8* %arraydecay7), !dbg !137
  %6 = load i8*, i8** %data, align 8, !dbg !138
  call void @free(i8* %6) #8, !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_17.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 10, scope: !14)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocation(line: 31, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 14, scope: !32)
!34 = !DILocation(line: 32, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 32, column: 13)
!36 = !DILocation(line: 32, column: 18, scope: !35)
!37 = !DILocation(line: 32, column: 13, scope: !32)
!38 = !DILocation(line: 32, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 32, column: 27)
!40 = !DILocation(line: 33, column: 16, scope: !32)
!41 = !DILocation(line: 33, column: 9, scope: !32)
!42 = !DILocation(line: 34, column: 9, scope: !32)
!43 = !DILocation(line: 34, column: 20, scope: !32)
!44 = !DILocation(line: 35, column: 5, scope: !32)
!45 = !DILocation(line: 28, column: 24, scope: !28)
!46 = !DILocation(line: 28, column: 5, scope: !28)
!47 = distinct !{!47, !30, !48, !49}
!48 = !DILocation(line: 35, column: 5, scope: !25)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 37, type: !52)
!51 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 37, column: 14, scope: !51)
!56 = !DILocation(line: 38, column: 9, scope: !51)
!57 = !DILocation(line: 39, column: 9, scope: !51)
!58 = !DILocation(line: 39, column: 21, scope: !51)
!59 = !DILocation(line: 42, column: 9, scope: !51)
!60 = !DILocation(line: 42, column: 23, scope: !51)
!61 = !DILocation(line: 42, column: 36, scope: !51)
!62 = !DILocation(line: 42, column: 29, scope: !51)
!63 = !DILocation(line: 42, column: 41, scope: !51)
!64 = !DILocation(line: 43, column: 9, scope: !51)
!65 = !DILocation(line: 43, column: 21, scope: !51)
!66 = !DILocation(line: 44, column: 19, scope: !51)
!67 = !DILocation(line: 44, column: 9, scope: !51)
!68 = !DILocation(line: 45, column: 14, scope: !51)
!69 = !DILocation(line: 45, column: 9, scope: !51)
!70 = !DILocation(line: 47, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_17_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 82, column: 5, scope: !71)
!73 = !DILocation(line: 83, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !75, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!19, !19, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !15, line: 95, type: !19)
!79 = !DILocation(line: 95, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !15, line: 95, type: !77)
!81 = !DILocation(line: 95, column: 27, scope: !74)
!82 = !DILocation(line: 98, column: 22, scope: !74)
!83 = !DILocation(line: 98, column: 12, scope: !74)
!84 = !DILocation(line: 98, column: 5, scope: !74)
!85 = !DILocation(line: 100, column: 5, scope: !74)
!86 = !DILocation(line: 101, column: 5, scope: !74)
!87 = !DILocation(line: 102, column: 5, scope: !74)
!88 = !DILocation(line: 105, column: 5, scope: !74)
!89 = !DILocation(line: 106, column: 5, scope: !74)
!90 = !DILocation(line: 107, column: 5, scope: !74)
!91 = !DILocation(line: 109, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "h", scope: !92, file: !15, line: 56, type: !19)
!94 = !DILocation(line: 56, column: 9, scope: !92)
!95 = !DILocalVariable(name: "data", scope: !92, file: !15, line: 57, type: !4)
!96 = !DILocation(line: 57, column: 12, scope: !92)
!97 = !DILocation(line: 58, column: 10, scope: !92)
!98 = !DILocation(line: 59, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !15, line: 59, column: 5)
!100 = !DILocation(line: 59, column: 9, scope: !99)
!101 = !DILocation(line: 59, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !15, line: 59, column: 5)
!103 = !DILocation(line: 59, column: 18, scope: !102)
!104 = !DILocation(line: 59, column: 5, scope: !99)
!105 = !DILocation(line: 62, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 60, column: 5)
!107 = !DILocation(line: 62, column: 14, scope: !106)
!108 = !DILocation(line: 63, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !15, line: 63, column: 13)
!110 = !DILocation(line: 63, column: 18, scope: !109)
!111 = !DILocation(line: 63, column: 13, scope: !106)
!112 = !DILocation(line: 63, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 63, column: 27)
!114 = !DILocation(line: 64, column: 16, scope: !106)
!115 = !DILocation(line: 64, column: 9, scope: !106)
!116 = !DILocation(line: 65, column: 9, scope: !106)
!117 = !DILocation(line: 65, column: 21, scope: !106)
!118 = !DILocation(line: 66, column: 5, scope: !106)
!119 = !DILocation(line: 59, column: 24, scope: !102)
!120 = !DILocation(line: 59, column: 5, scope: !102)
!121 = distinct !{!121, !104, !122, !49}
!122 = !DILocation(line: 66, column: 5, scope: !99)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 68, type: !52)
!124 = distinct !DILexicalBlock(scope: !92, file: !15, line: 67, column: 5)
!125 = !DILocation(line: 68, column: 14, scope: !124)
!126 = !DILocation(line: 69, column: 9, scope: !124)
!127 = !DILocation(line: 70, column: 9, scope: !124)
!128 = !DILocation(line: 70, column: 21, scope: !124)
!129 = !DILocation(line: 73, column: 9, scope: !124)
!130 = !DILocation(line: 73, column: 23, scope: !124)
!131 = !DILocation(line: 73, column: 36, scope: !124)
!132 = !DILocation(line: 73, column: 29, scope: !124)
!133 = !DILocation(line: 73, column: 41, scope: !124)
!134 = !DILocation(line: 74, column: 9, scope: !124)
!135 = !DILocation(line: 74, column: 21, scope: !124)
!136 = !DILocation(line: 75, column: 19, scope: !124)
!137 = !DILocation(line: 75, column: 9, scope: !124)
!138 = !DILocation(line: 76, column: 14, scope: !124)
!139 = !DILocation(line: 76, column: 9, scope: !124)
!140 = !DILocation(line: 78, column: 1, scope: !92)
