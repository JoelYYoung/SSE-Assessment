; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
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
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  call void %3(i8* %4), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %0 = load i8*, i8** %data.addr, align 8, !dbg !54
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* %arraydecay2) #10, !dbg !56
  %mul = mul i64 %call, 1, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx3, align 1, !dbg !59
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay4), !dbg !61
  %1 = load i8*, i8** %data.addr, align 8, !dbg !62
  call void @free(i8* %1) #8, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_44_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #8, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #8, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_44_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_44_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !90, metadata !DIExpression()), !dbg !91
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !91
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
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  call void %3(i8* %4), !dbg !105
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !108 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %0 = load i8*, i8** %data.addr, align 8, !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %call = call i64 @strlen(i8* %arraydecay2) #10, !dbg !120
  %mul = mul i64 %call, 1, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx3, align 1, !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay4), !dbg !125
  %1 = load i8*, i8** %data.addr, align 8, !dbg !126
  call void @free(i8* %1) #8, !dbg !127
  ret void, !dbg !128
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_44.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_44_bad", scope: !15, file: !15, line: 38, type: !16, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_44.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 40, type: !4)
!19 = !DILocation(line: 40, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 42, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 42, column: 12, scope: !14)
!25 = !DILocation(line: 43, column: 10, scope: !14)
!26 = !DILocation(line: 45, column: 20, scope: !14)
!27 = !DILocation(line: 45, column: 10, scope: !14)
!28 = !DILocation(line: 46, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 9)
!30 = !DILocation(line: 46, column: 14, scope: !29)
!31 = !DILocation(line: 46, column: 9, scope: !14)
!32 = !DILocation(line: 46, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 46, column: 23)
!34 = !DILocation(line: 47, column: 12, scope: !14)
!35 = !DILocation(line: 47, column: 5, scope: !14)
!36 = !DILocation(line: 48, column: 5, scope: !14)
!37 = !DILocation(line: 48, column: 16, scope: !14)
!38 = !DILocation(line: 50, column: 5, scope: !14)
!39 = !DILocation(line: 50, column: 13, scope: !14)
!40 = !DILocation(line: 51, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !15, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 28, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !15, line: 26, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 25, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 26, column: 14, scope: !45)
!50 = !DILocation(line: 27, column: 9, scope: !45)
!51 = !DILocation(line: 28, column: 9, scope: !45)
!52 = !DILocation(line: 28, column: 21, scope: !45)
!53 = !DILocation(line: 31, column: 9, scope: !45)
!54 = !DILocation(line: 31, column: 22, scope: !45)
!55 = !DILocation(line: 31, column: 35, scope: !45)
!56 = !DILocation(line: 31, column: 28, scope: !45)
!57 = !DILocation(line: 31, column: 40, scope: !45)
!58 = !DILocation(line: 32, column: 9, scope: !45)
!59 = !DILocation(line: 32, column: 21, scope: !45)
!60 = !DILocation(line: 33, column: 19, scope: !45)
!61 = !DILocation(line: 33, column: 9, scope: !45)
!62 = !DILocation(line: 34, column: 14, scope: !45)
!63 = !DILocation(line: 34, column: 9, scope: !45)
!64 = !DILocation(line: 36, column: 1, scope: !41)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_44_good", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 88, column: 5, scope: !65)
!67 = !DILocation(line: 89, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 100, type: !69, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !15, line: 100, type: !71)
!74 = !DILocation(line: 100, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !15, line: 100, type: !72)
!76 = !DILocation(line: 100, column: 27, scope: !68)
!77 = !DILocation(line: 103, column: 22, scope: !68)
!78 = !DILocation(line: 103, column: 12, scope: !68)
!79 = !DILocation(line: 103, column: 5, scope: !68)
!80 = !DILocation(line: 105, column: 5, scope: !68)
!81 = !DILocation(line: 106, column: 5, scope: !68)
!82 = !DILocation(line: 107, column: 5, scope: !68)
!83 = !DILocation(line: 110, column: 5, scope: !68)
!84 = !DILocation(line: 111, column: 5, scope: !68)
!85 = !DILocation(line: 112, column: 5, scope: !68)
!86 = !DILocation(line: 114, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !16, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 75, type: !4)
!89 = !DILocation(line: 75, column: 12, scope: !87)
!90 = !DILocalVariable(name: "funcPtr", scope: !87, file: !15, line: 76, type: !21)
!91 = !DILocation(line: 76, column: 12, scope: !87)
!92 = !DILocation(line: 77, column: 10, scope: !87)
!93 = !DILocation(line: 79, column: 20, scope: !87)
!94 = !DILocation(line: 79, column: 10, scope: !87)
!95 = !DILocation(line: 80, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !87, file: !15, line: 80, column: 9)
!97 = !DILocation(line: 80, column: 14, scope: !96)
!98 = !DILocation(line: 80, column: 9, scope: !87)
!99 = !DILocation(line: 80, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 80, column: 23)
!101 = !DILocation(line: 81, column: 12, scope: !87)
!102 = !DILocation(line: 81, column: 5, scope: !87)
!103 = !DILocation(line: 82, column: 5, scope: !87)
!104 = !DILocation(line: 82, column: 17, scope: !87)
!105 = !DILocation(line: 83, column: 5, scope: !87)
!106 = !DILocation(line: 83, column: 13, scope: !87)
!107 = !DILocation(line: 84, column: 1, scope: !87)
!108 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 58, type: !22, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !15, line: 58, type: !4)
!110 = !DILocation(line: 58, column: 32, scope: !108)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !15, line: 61, type: !46)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 60, column: 5)
!113 = !DILocation(line: 61, column: 14, scope: !112)
!114 = !DILocation(line: 62, column: 9, scope: !112)
!115 = !DILocation(line: 63, column: 9, scope: !112)
!116 = !DILocation(line: 63, column: 21, scope: !112)
!117 = !DILocation(line: 66, column: 9, scope: !112)
!118 = !DILocation(line: 66, column: 22, scope: !112)
!119 = !DILocation(line: 66, column: 35, scope: !112)
!120 = !DILocation(line: 66, column: 28, scope: !112)
!121 = !DILocation(line: 66, column: 40, scope: !112)
!122 = !DILocation(line: 67, column: 9, scope: !112)
!123 = !DILocation(line: 67, column: 21, scope: !112)
!124 = !DILocation(line: 68, column: 19, scope: !112)
!125 = !DILocation(line: 68, column: 9, scope: !112)
!126 = !DILocation(line: 69, column: 14, scope: !112)
!127 = !DILocation(line: 69, column: 9, scope: !112)
!128 = !DILocation(line: 71, column: 1, scope: !108)
