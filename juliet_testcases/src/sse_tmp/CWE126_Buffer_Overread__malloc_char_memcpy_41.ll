; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !29
  %0 = load i8*, i8** %data.addr, align 8, !dbg !30
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !31
  %call = call i64 @strlen(i8* %arraydecay2) #8, !dbg !32
  %mul = mul i64 %call, 1, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !29
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx3, align 1, !dbg !35
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  call void @printLine(i8* %arraydecay4), !dbg !37
  %1 = load i8*, i8** %data.addr, align 8, !dbg !38
  call void @free(i8* %1) #9, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_41_bad() #0 !dbg !41 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i8* null, i8** %data, align 8, !dbg !46
  %call = call noalias align 16 i8* @malloc(i64 50) #9, !dbg !47
  store i8* %call, i8** %data, align 8, !dbg !48
  %0 = load i8*, i8** %data, align 8, !dbg !49
  %cmp = icmp eq i8* %0, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !56
  %2 = load i8*, i8** %data, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !58
  %3 = load i8*, i8** %data, align 8, !dbg !59
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_41_badSink(i8* %3), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #6

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_41_goodG2BSink(i8* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !65, metadata !DIExpression()), !dbg !67
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !68
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !71
  %0 = load i8*, i8** %data.addr, align 8, !dbg !72
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  %call = call i64 @strlen(i8* %arraydecay2) #8, !dbg !74
  %mul = mul i64 %call, 1, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !71
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx3, align 1, !dbg !77
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* %arraydecay4), !dbg !79
  %1 = load i8*, i8** %data.addr, align 8, !dbg !80
  call void @free(i8* %1) #9, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_41_good() #0 !dbg !83 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #9, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #9, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_41_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_41_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i8* null, i8** %data, align 8, !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 100) #9, !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  %cmp = icmp eq i8* %0, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !118
  %2 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %3 = load i8*, i8** %data, align 8, !dbg !121
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_41_goodG2BSink(i8* %3), !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 67, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 21, scope: !21)
!29 = !DILocation(line: 31, column: 9, scope: !21)
!30 = !DILocation(line: 31, column: 22, scope: !21)
!31 = !DILocation(line: 31, column: 35, scope: !21)
!32 = !DILocation(line: 31, column: 28, scope: !21)
!33 = !DILocation(line: 31, column: 40, scope: !21)
!34 = !DILocation(line: 32, column: 9, scope: !21)
!35 = !DILocation(line: 32, column: 21, scope: !21)
!36 = !DILocation(line: 33, column: 19, scope: !21)
!37 = !DILocation(line: 33, column: 9, scope: !21)
!38 = !DILocation(line: 34, column: 14, scope: !21)
!39 = !DILocation(line: 34, column: 9, scope: !21)
!40 = !DILocation(line: 36, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_41_bad", scope: !15, file: !15, line: 38, type: !42, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null}
!44 = !DILocalVariable(name: "data", scope: !41, file: !15, line: 40, type: !4)
!45 = !DILocation(line: 40, column: 12, scope: !41)
!46 = !DILocation(line: 41, column: 10, scope: !41)
!47 = !DILocation(line: 43, column: 20, scope: !41)
!48 = !DILocation(line: 43, column: 10, scope: !41)
!49 = !DILocation(line: 44, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !15, line: 44, column: 9)
!51 = !DILocation(line: 44, column: 14, scope: !50)
!52 = !DILocation(line: 44, column: 9, scope: !41)
!53 = !DILocation(line: 44, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 44, column: 23)
!55 = !DILocation(line: 45, column: 12, scope: !41)
!56 = !DILocation(line: 45, column: 5, scope: !41)
!57 = !DILocation(line: 46, column: 5, scope: !41)
!58 = !DILocation(line: 46, column: 16, scope: !41)
!59 = !DILocation(line: 47, column: 59, scope: !41)
!60 = !DILocation(line: 47, column: 5, scope: !41)
!61 = !DILocation(line: 48, column: 1, scope: !41)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_41_goodG2BSink", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !15, line: 54, type: !4)
!64 = !DILocation(line: 54, column: 71, scope: !62)
!65 = !DILocalVariable(name: "dest", scope: !66, file: !15, line: 57, type: !22)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 56, column: 5)
!67 = !DILocation(line: 57, column: 14, scope: !66)
!68 = !DILocation(line: 58, column: 9, scope: !66)
!69 = !DILocation(line: 59, column: 9, scope: !66)
!70 = !DILocation(line: 59, column: 21, scope: !66)
!71 = !DILocation(line: 62, column: 9, scope: !66)
!72 = !DILocation(line: 62, column: 22, scope: !66)
!73 = !DILocation(line: 62, column: 35, scope: !66)
!74 = !DILocation(line: 62, column: 28, scope: !66)
!75 = !DILocation(line: 62, column: 40, scope: !66)
!76 = !DILocation(line: 63, column: 9, scope: !66)
!77 = !DILocation(line: 63, column: 21, scope: !66)
!78 = !DILocation(line: 64, column: 19, scope: !66)
!79 = !DILocation(line: 64, column: 9, scope: !66)
!80 = !DILocation(line: 65, column: 14, scope: !66)
!81 = !DILocation(line: 65, column: 9, scope: !66)
!82 = !DILocation(line: 67, column: 1, scope: !62)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_41_good", scope: !15, file: !15, line: 82, type: !42, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 84, column: 5, scope: !83)
!85 = !DILocation(line: 85, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 97, type: !87, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !15, line: 97, type: !89)
!92 = !DILocation(line: 97, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !15, line: 97, type: !90)
!94 = !DILocation(line: 97, column: 27, scope: !86)
!95 = !DILocation(line: 100, column: 22, scope: !86)
!96 = !DILocation(line: 100, column: 12, scope: !86)
!97 = !DILocation(line: 100, column: 5, scope: !86)
!98 = !DILocation(line: 102, column: 5, scope: !86)
!99 = !DILocation(line: 103, column: 5, scope: !86)
!100 = !DILocation(line: 104, column: 5, scope: !86)
!101 = !DILocation(line: 107, column: 5, scope: !86)
!102 = !DILocation(line: 108, column: 5, scope: !86)
!103 = !DILocation(line: 109, column: 5, scope: !86)
!104 = !DILocation(line: 111, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 70, type: !42, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 72, type: !4)
!107 = !DILocation(line: 72, column: 12, scope: !105)
!108 = !DILocation(line: 73, column: 10, scope: !105)
!109 = !DILocation(line: 75, column: 20, scope: !105)
!110 = !DILocation(line: 75, column: 10, scope: !105)
!111 = !DILocation(line: 76, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !15, line: 76, column: 9)
!113 = !DILocation(line: 76, column: 14, scope: !112)
!114 = !DILocation(line: 76, column: 9, scope: !105)
!115 = !DILocation(line: 76, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 76, column: 23)
!117 = !DILocation(line: 77, column: 12, scope: !105)
!118 = !DILocation(line: 77, column: 5, scope: !105)
!119 = !DILocation(line: 78, column: 5, scope: !105)
!120 = !DILocation(line: 78, column: 17, scope: !105)
!121 = !DILocation(line: 79, column: 63, scope: !105)
!122 = !DILocation(line: 79, column: 5, scope: !105)
!123 = !DILocation(line: 80, column: 1, scope: !105)
