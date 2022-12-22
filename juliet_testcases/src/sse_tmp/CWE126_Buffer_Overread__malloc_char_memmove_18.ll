; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #9, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx1, align 1, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !48
  %mul = mul i64 %call4, 1, !dbg !49
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !45
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx5, align 1, !dbg !51
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @printLine(i8* %arraydecay6), !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  call void @free(i8* %4) #8, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_18_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #8, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #8, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__malloc_char_memmove_18_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__malloc_char_memmove_18_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  br label %source, !dbg !83

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !84), !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #9, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !107
  %mul = mul i64 %call4, 1, !dbg !108
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !104
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx5, align 1, !dbg !110
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  call void @printLine(i8* %arraydecay6), !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %4) #8, !dbg !114
  ret void, !dbg !115
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_18.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_18.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocation(line: 30, column: 20, scope: !14)
!25 = !DILocation(line: 30, column: 10, scope: !14)
!26 = !DILocation(line: 31, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 9)
!28 = !DILocation(line: 31, column: 14, scope: !27)
!29 = !DILocation(line: 31, column: 9, scope: !14)
!30 = !DILocation(line: 31, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 23)
!32 = !DILocation(line: 32, column: 12, scope: !14)
!33 = !DILocation(line: 32, column: 5, scope: !14)
!34 = !DILocation(line: 33, column: 5, scope: !14)
!35 = !DILocation(line: 33, column: 16, scope: !14)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !15, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 35, column: 14, scope: !37)
!42 = !DILocation(line: 36, column: 9, scope: !37)
!43 = !DILocation(line: 37, column: 9, scope: !37)
!44 = !DILocation(line: 37, column: 21, scope: !37)
!45 = !DILocation(line: 40, column: 9, scope: !37)
!46 = !DILocation(line: 40, column: 23, scope: !37)
!47 = !DILocation(line: 40, column: 36, scope: !37)
!48 = !DILocation(line: 40, column: 29, scope: !37)
!49 = !DILocation(line: 40, column: 41, scope: !37)
!50 = !DILocation(line: 41, column: 9, scope: !37)
!51 = !DILocation(line: 41, column: 21, scope: !37)
!52 = !DILocation(line: 42, column: 19, scope: !37)
!53 = !DILocation(line: 42, column: 9, scope: !37)
!54 = !DILocation(line: 43, column: 14, scope: !37)
!55 = !DILocation(line: 43, column: 9, scope: !37)
!56 = !DILocation(line: 45, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_18_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 78, column: 5, scope: !57)
!59 = !DILocation(line: 79, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !61, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 91, type: !63)
!66 = !DILocation(line: 91, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 91, type: !64)
!68 = !DILocation(line: 91, column: 27, scope: !60)
!69 = !DILocation(line: 94, column: 22, scope: !60)
!70 = !DILocation(line: 94, column: 12, scope: !60)
!71 = !DILocation(line: 94, column: 5, scope: !60)
!72 = !DILocation(line: 96, column: 5, scope: !60)
!73 = !DILocation(line: 97, column: 5, scope: !60)
!74 = !DILocation(line: 98, column: 5, scope: !60)
!75 = !DILocation(line: 101, column: 5, scope: !60)
!76 = !DILocation(line: 102, column: 5, scope: !60)
!77 = !DILocation(line: 103, column: 5, scope: !60)
!78 = !DILocation(line: 105, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 54, type: !4)
!81 = !DILocation(line: 54, column: 12, scope: !79)
!82 = !DILocation(line: 55, column: 10, scope: !79)
!83 = !DILocation(line: 56, column: 5, scope: !79)
!84 = !DILabel(scope: !79, name: "source", file: !15, line: 57)
!85 = !DILocation(line: 57, column: 1, scope: !79)
!86 = !DILocation(line: 59, column: 20, scope: !79)
!87 = !DILocation(line: 59, column: 10, scope: !79)
!88 = !DILocation(line: 60, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !15, line: 60, column: 9)
!90 = !DILocation(line: 60, column: 14, scope: !89)
!91 = !DILocation(line: 60, column: 9, scope: !79)
!92 = !DILocation(line: 60, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 60, column: 23)
!94 = !DILocation(line: 61, column: 12, scope: !79)
!95 = !DILocation(line: 61, column: 5, scope: !79)
!96 = !DILocation(line: 62, column: 5, scope: !79)
!97 = !DILocation(line: 62, column: 17, scope: !79)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !15, line: 64, type: !38)
!99 = distinct !DILexicalBlock(scope: !79, file: !15, line: 63, column: 5)
!100 = !DILocation(line: 64, column: 14, scope: !99)
!101 = !DILocation(line: 65, column: 9, scope: !99)
!102 = !DILocation(line: 66, column: 9, scope: !99)
!103 = !DILocation(line: 66, column: 21, scope: !99)
!104 = !DILocation(line: 69, column: 9, scope: !99)
!105 = !DILocation(line: 69, column: 23, scope: !99)
!106 = !DILocation(line: 69, column: 36, scope: !99)
!107 = !DILocation(line: 69, column: 29, scope: !99)
!108 = !DILocation(line: 69, column: 41, scope: !99)
!109 = !DILocation(line: 70, column: 9, scope: !99)
!110 = !DILocation(line: 70, column: 21, scope: !99)
!111 = !DILocation(line: 71, column: 19, scope: !99)
!112 = !DILocation(line: 71, column: 9, scope: !99)
!113 = !DILocation(line: 72, column: 14, scope: !99)
!114 = !DILocation(line: 72, column: 9, scope: !99)
!115 = !DILocation(line: 74, column: 1, scope: !79)
