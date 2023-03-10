; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_41_badSink(i8* %data) #0 !dbg !14 {
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
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !32
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %0, i64 %call) #8, !dbg !33
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx4, align 1, !dbg !35
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  call void @printLine(i8* %arraydecay5), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_41_bad() #0 !dbg !39 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !42, metadata !DIExpression()), !dbg !43
  store i8* null, i8** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !45, metadata !DIExpression()), !dbg !47
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !48
  store i8* %call, i8** %dataBuffer, align 8, !dbg !47
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !49
  %cmp = icmp eq i8* %0, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !56
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !58
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !60
  store i8* %add.ptr, i8** %data, align 8, !dbg !61
  %4 = load i8*, i8** %data, align 8, !dbg !62
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_41_badSink(i8* %4), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !65 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !68, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !71
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !74
  %0 = load i8*, i8** %data.addr, align 8, !dbg !75
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !77
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %0, i64 %call) #8, !dbg !78
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx4, align 1, !dbg !80
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @printLine(i8* %arraydecay5), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_41_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #8, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #8, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_41_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_41_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !113
  store i8* %call, i8** %dataBuffer, align 8, !dbg !112
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !121
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  store i8* %3, i8** %data, align 8, !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_41_goodG2BSink(i8* %4), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 66, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 21, scope: !21)
!29 = !DILocation(line: 30, column: 17, scope: !21)
!30 = !DILocation(line: 30, column: 23, scope: !21)
!31 = !DILocation(line: 30, column: 36, scope: !21)
!32 = !DILocation(line: 30, column: 29, scope: !21)
!33 = !DILocation(line: 30, column: 9, scope: !21)
!34 = !DILocation(line: 32, column: 9, scope: !21)
!35 = !DILocation(line: 32, column: 21, scope: !21)
!36 = !DILocation(line: 33, column: 19, scope: !21)
!37 = !DILocation(line: 33, column: 9, scope: !21)
!38 = !DILocation(line: 37, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_41_bad", scope: !15, file: !15, line: 39, type: !40, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !15, line: 41, type: !4)
!43 = !DILocation(line: 41, column: 12, scope: !39)
!44 = !DILocation(line: 42, column: 10, scope: !39)
!45 = !DILocalVariable(name: "dataBuffer", scope: !46, file: !15, line: 44, type: !4)
!46 = distinct !DILexicalBlock(scope: !39, file: !15, line: 43, column: 5)
!47 = !DILocation(line: 44, column: 16, scope: !46)
!48 = !DILocation(line: 44, column: 37, scope: !46)
!49 = !DILocation(line: 45, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 45, column: 13)
!51 = !DILocation(line: 45, column: 24, scope: !50)
!52 = !DILocation(line: 45, column: 13, scope: !46)
!53 = !DILocation(line: 45, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 45, column: 33)
!55 = !DILocation(line: 46, column: 16, scope: !46)
!56 = !DILocation(line: 46, column: 9, scope: !46)
!57 = !DILocation(line: 47, column: 9, scope: !46)
!58 = !DILocation(line: 47, column: 27, scope: !46)
!59 = !DILocation(line: 49, column: 16, scope: !46)
!60 = !DILocation(line: 49, column: 27, scope: !46)
!61 = !DILocation(line: 49, column: 14, scope: !46)
!62 = !DILocation(line: 51, column: 58, scope: !39)
!63 = !DILocation(line: 51, column: 5, scope: !39)
!64 = !DILocation(line: 52, column: 1, scope: !39)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_41_goodG2BSink", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !15, line: 58, type: !4)
!67 = !DILocation(line: 58, column: 70, scope: !65)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !15, line: 61, type: !22)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 60, column: 5)
!70 = !DILocation(line: 61, column: 14, scope: !69)
!71 = !DILocation(line: 62, column: 9, scope: !69)
!72 = !DILocation(line: 63, column: 9, scope: !69)
!73 = !DILocation(line: 63, column: 21, scope: !69)
!74 = !DILocation(line: 65, column: 17, scope: !69)
!75 = !DILocation(line: 65, column: 23, scope: !69)
!76 = !DILocation(line: 65, column: 36, scope: !69)
!77 = !DILocation(line: 65, column: 29, scope: !69)
!78 = !DILocation(line: 65, column: 9, scope: !69)
!79 = !DILocation(line: 67, column: 9, scope: !69)
!80 = !DILocation(line: 67, column: 21, scope: !69)
!81 = !DILocation(line: 68, column: 19, scope: !69)
!82 = !DILocation(line: 68, column: 9, scope: !69)
!83 = !DILocation(line: 72, column: 1, scope: !65)
!84 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_41_good", scope: !15, file: !15, line: 90, type: !40, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 92, column: 5, scope: !84)
!86 = !DILocation(line: 93, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !88, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !15, line: 105, type: !90)
!93 = !DILocation(line: 105, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !15, line: 105, type: !91)
!95 = !DILocation(line: 105, column: 27, scope: !87)
!96 = !DILocation(line: 108, column: 22, scope: !87)
!97 = !DILocation(line: 108, column: 12, scope: !87)
!98 = !DILocation(line: 108, column: 5, scope: !87)
!99 = !DILocation(line: 110, column: 5, scope: !87)
!100 = !DILocation(line: 111, column: 5, scope: !87)
!101 = !DILocation(line: 112, column: 5, scope: !87)
!102 = !DILocation(line: 115, column: 5, scope: !87)
!103 = !DILocation(line: 116, column: 5, scope: !87)
!104 = !DILocation(line: 117, column: 5, scope: !87)
!105 = !DILocation(line: 119, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 75, type: !40, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 77, type: !4)
!108 = !DILocation(line: 77, column: 12, scope: !106)
!109 = !DILocation(line: 78, column: 10, scope: !106)
!110 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !15, line: 80, type: !4)
!111 = distinct !DILexicalBlock(scope: !106, file: !15, line: 79, column: 5)
!112 = !DILocation(line: 80, column: 16, scope: !111)
!113 = !DILocation(line: 80, column: 37, scope: !111)
!114 = !DILocation(line: 81, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 81, column: 13)
!116 = !DILocation(line: 81, column: 24, scope: !115)
!117 = !DILocation(line: 81, column: 13, scope: !111)
!118 = !DILocation(line: 81, column: 34, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 81, column: 33)
!120 = !DILocation(line: 82, column: 16, scope: !111)
!121 = !DILocation(line: 82, column: 9, scope: !111)
!122 = !DILocation(line: 83, column: 9, scope: !111)
!123 = !DILocation(line: 83, column: 27, scope: !111)
!124 = !DILocation(line: 85, column: 16, scope: !111)
!125 = !DILocation(line: 85, column: 14, scope: !111)
!126 = !DILocation(line: 87, column: 62, scope: !106)
!127 = !DILocation(line: 87, column: 5, scope: !106)
!128 = !DILocation(line: 88, column: 1, scope: !106)
