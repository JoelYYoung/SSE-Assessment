; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_char_memcpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__malloc_char_memcpy_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %3, i8** @CWE126_Buffer_Overread__malloc_char_memcpy_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #8, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #8, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** @CWE126_Buffer_Overread__malloc_char_memcpy_45_badData, align 8, !dbg !67
  store i8* %0, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !68, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !74
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !75
  store i8 0, i8* %arrayidx, align 1, !dbg !76
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !77
  %1 = load i8*, i8** %data, align 8, !dbg !78
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  %call = call i64 @strlen(i8* %arraydecay2) #10, !dbg !80
  %mul = mul i64 %call, 1, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !77
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx3, align 1, !dbg !83
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @printLine(i8* %arraydecay4), !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !86
  call void @free(i8* %2) #8, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* null, i8** %data, align 8, !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !93
  store i8* %call, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %0, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  store i8* %3, i8** @CWE126_Buffer_Overread__malloc_char_memcpy_45_goodG2BData, align 8, !dbg !106
  call void @goodG2BSink(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i8*, i8** @CWE126_Buffer_Overread__malloc_char_memcpy_45_goodG2BData, align 8, !dbg !112
  store i8* %0, i8** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %1 = load i8*, i8** %data, align 8, !dbg !120
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  %call = call i64 @strlen(i8* %arraydecay2) #10, !dbg !122
  %mul = mul i64 %call, 1, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !119
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx3, align 1, !dbg !125
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* %arraydecay4), !dbg !127
  %2 = load i8*, i8** %data, align 8, !dbg !128
  call void @free(i8* %2) #8, !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_memcpy_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_memcpy_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_45_bad", scope: !13, file: !13, line: 42, type: !21, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 44, type: !6)
!24 = !DILocation(line: 44, column: 12, scope: !20)
!25 = !DILocation(line: 45, column: 10, scope: !20)
!26 = !DILocation(line: 47, column: 20, scope: !20)
!27 = !DILocation(line: 47, column: 10, scope: !20)
!28 = !DILocation(line: 48, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 48, column: 9)
!30 = !DILocation(line: 48, column: 14, scope: !29)
!31 = !DILocation(line: 48, column: 9, scope: !20)
!32 = !DILocation(line: 48, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 48, column: 23)
!34 = !DILocation(line: 49, column: 12, scope: !20)
!35 = !DILocation(line: 49, column: 5, scope: !20)
!36 = !DILocation(line: 50, column: 5, scope: !20)
!37 = !DILocation(line: 50, column: 16, scope: !20)
!38 = !DILocation(line: 51, column: 61, scope: !20)
!39 = !DILocation(line: 51, column: 59, scope: !20)
!40 = !DILocation(line: 52, column: 5, scope: !20)
!41 = !DILocation(line: 53, column: 1, scope: !20)
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_45_good", scope: !13, file: !13, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 91, column: 5, scope: !42)
!44 = !DILocation(line: 92, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 103, type: !46, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !13, line: 103, type: !48)
!51 = !DILocation(line: 103, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !13, line: 103, type: !49)
!53 = !DILocation(line: 103, column: 27, scope: !45)
!54 = !DILocation(line: 106, column: 22, scope: !45)
!55 = !DILocation(line: 106, column: 12, scope: !45)
!56 = !DILocation(line: 106, column: 5, scope: !45)
!57 = !DILocation(line: 108, column: 5, scope: !45)
!58 = !DILocation(line: 109, column: 5, scope: !45)
!59 = !DILocation(line: 110, column: 5, scope: !45)
!60 = !DILocation(line: 113, column: 5, scope: !45)
!61 = !DILocation(line: 114, column: 5, scope: !45)
!62 = !DILocation(line: 115, column: 5, scope: !45)
!63 = !DILocation(line: 117, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !13, line: 28, type: !6)
!66 = !DILocation(line: 28, column: 12, scope: !64)
!67 = !DILocation(line: 28, column: 19, scope: !64)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !13, line: 30, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !13, line: 29, column: 5)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 100)
!73 = !DILocation(line: 30, column: 14, scope: !69)
!74 = !DILocation(line: 31, column: 9, scope: !69)
!75 = !DILocation(line: 32, column: 9, scope: !69)
!76 = !DILocation(line: 32, column: 21, scope: !69)
!77 = !DILocation(line: 35, column: 9, scope: !69)
!78 = !DILocation(line: 35, column: 22, scope: !69)
!79 = !DILocation(line: 35, column: 35, scope: !69)
!80 = !DILocation(line: 35, column: 28, scope: !69)
!81 = !DILocation(line: 35, column: 40, scope: !69)
!82 = !DILocation(line: 36, column: 9, scope: !69)
!83 = !DILocation(line: 36, column: 21, scope: !69)
!84 = !DILocation(line: 37, column: 19, scope: !69)
!85 = !DILocation(line: 37, column: 9, scope: !69)
!86 = !DILocation(line: 38, column: 14, scope: !69)
!87 = !DILocation(line: 38, column: 9, scope: !69)
!88 = !DILocation(line: 40, column: 1, scope: !64)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 76, type: !21, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocalVariable(name: "data", scope: !89, file: !13, line: 78, type: !6)
!91 = !DILocation(line: 78, column: 12, scope: !89)
!92 = !DILocation(line: 79, column: 10, scope: !89)
!93 = !DILocation(line: 81, column: 20, scope: !89)
!94 = !DILocation(line: 81, column: 10, scope: !89)
!95 = !DILocation(line: 82, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !13, line: 82, column: 9)
!97 = !DILocation(line: 82, column: 14, scope: !96)
!98 = !DILocation(line: 82, column: 9, scope: !89)
!99 = !DILocation(line: 82, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !13, line: 82, column: 23)
!101 = !DILocation(line: 83, column: 12, scope: !89)
!102 = !DILocation(line: 83, column: 5, scope: !89)
!103 = !DILocation(line: 84, column: 5, scope: !89)
!104 = !DILocation(line: 84, column: 17, scope: !89)
!105 = !DILocation(line: 85, column: 65, scope: !89)
!106 = !DILocation(line: 85, column: 63, scope: !89)
!107 = !DILocation(line: 86, column: 5, scope: !89)
!108 = !DILocation(line: 87, column: 1, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !13, line: 62, type: !6)
!111 = !DILocation(line: 62, column: 12, scope: !109)
!112 = !DILocation(line: 62, column: 19, scope: !109)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !13, line: 64, type: !70)
!114 = distinct !DILexicalBlock(scope: !109, file: !13, line: 63, column: 5)
!115 = !DILocation(line: 64, column: 14, scope: !114)
!116 = !DILocation(line: 65, column: 9, scope: !114)
!117 = !DILocation(line: 66, column: 9, scope: !114)
!118 = !DILocation(line: 66, column: 21, scope: !114)
!119 = !DILocation(line: 69, column: 9, scope: !114)
!120 = !DILocation(line: 69, column: 22, scope: !114)
!121 = !DILocation(line: 69, column: 35, scope: !114)
!122 = !DILocation(line: 69, column: 28, scope: !114)
!123 = !DILocation(line: 69, column: 40, scope: !114)
!124 = !DILocation(line: 70, column: 9, scope: !114)
!125 = !DILocation(line: 70, column: 21, scope: !114)
!126 = !DILocation(line: 71, column: 19, scope: !114)
!127 = !DILocation(line: 71, column: 9, scope: !114)
!128 = !DILocation(line: 72, column: 14, scope: !114)
!129 = !DILocation(line: 72, column: 9, scope: !114)
!130 = !DILocation(line: 74, column: 1, scope: !109)
