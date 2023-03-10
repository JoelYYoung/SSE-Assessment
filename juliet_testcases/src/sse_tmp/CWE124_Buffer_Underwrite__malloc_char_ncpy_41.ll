; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %0 = load i8*, i8** %data.addr, align 8, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !31
  %1 = load i8*, i8** %data.addr, align 8, !dbg !32
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !32
  store i8 0, i8* %arrayidx2, align 1, !dbg !33
  %2 = load i8*, i8** %data.addr, align 8, !dbg !34
  call void @printLine(i8* %2), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !40, metadata !DIExpression()), !dbg !41
  store i8* null, i8** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !43, metadata !DIExpression()), !dbg !45
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !46
  store i8* %call, i8** %dataBuffer, align 8, !dbg !45
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !47
  %cmp = icmp eq i8* %0, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !51
  unreachable, !dbg !51

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !54
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !55
  store i8 0, i8* %arrayidx, align 1, !dbg !56
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !57
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !58
  store i8* %add.ptr, i8** %data, align 8, !dbg !59
  %4 = load i8*, i8** %data, align 8, !dbg !60
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_badSink(i8* %4), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !63 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !66, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !69
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !70
  store i8 0, i8* %arrayidx, align 1, !dbg !71
  %0 = load i8*, i8** %data.addr, align 8, !dbg !72
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !73
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !74
  %1 = load i8*, i8** %data.addr, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !75
  store i8 0, i8* %arrayidx2, align 1, !dbg !76
  %2 = load i8*, i8** %data.addr, align 8, !dbg !77
  call void @printLine(i8* %2), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #6, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #6, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i8* null, i8** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !109
  store i8* %call, i8** %dataBuffer, align 8, !dbg !108
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %cmp = icmp eq i8* %0, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !117
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  store i8* %3, i8** %data, align 8, !dbg !121
  %4 = load i8*, i8** %data, align 8, !dbg !122
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_41_goodG2BSink(i8* %4), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 67, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 23, scope: !21)
!29 = !DILocation(line: 30, column: 17, scope: !21)
!30 = !DILocation(line: 30, column: 23, scope: !21)
!31 = !DILocation(line: 30, column: 9, scope: !21)
!32 = !DILocation(line: 32, column: 9, scope: !21)
!33 = !DILocation(line: 32, column: 21, scope: !21)
!34 = !DILocation(line: 33, column: 19, scope: !21)
!35 = !DILocation(line: 33, column: 9, scope: !21)
!36 = !DILocation(line: 37, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_41_bad", scope: !15, file: !15, line: 39, type: !38, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !15, line: 41, type: !4)
!41 = !DILocation(line: 41, column: 12, scope: !37)
!42 = !DILocation(line: 42, column: 10, scope: !37)
!43 = !DILocalVariable(name: "dataBuffer", scope: !44, file: !15, line: 44, type: !4)
!44 = distinct !DILexicalBlock(scope: !37, file: !15, line: 43, column: 5)
!45 = !DILocation(line: 44, column: 16, scope: !44)
!46 = !DILocation(line: 44, column: 37, scope: !44)
!47 = !DILocation(line: 45, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !15, line: 45, column: 13)
!49 = !DILocation(line: 45, column: 24, scope: !48)
!50 = !DILocation(line: 45, column: 13, scope: !44)
!51 = !DILocation(line: 45, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 45, column: 33)
!53 = !DILocation(line: 46, column: 16, scope: !44)
!54 = !DILocation(line: 46, column: 9, scope: !44)
!55 = !DILocation(line: 47, column: 9, scope: !44)
!56 = !DILocation(line: 47, column: 27, scope: !44)
!57 = !DILocation(line: 49, column: 16, scope: !44)
!58 = !DILocation(line: 49, column: 27, scope: !44)
!59 = !DILocation(line: 49, column: 14, scope: !44)
!60 = !DILocation(line: 51, column: 59, scope: !37)
!61 = !DILocation(line: 51, column: 5, scope: !37)
!62 = !DILocation(line: 52, column: 1, scope: !37)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_41_goodG2BSink", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", arg: 1, scope: !63, file: !15, line: 58, type: !4)
!65 = !DILocation(line: 58, column: 71, scope: !63)
!66 = !DILocalVariable(name: "source", scope: !67, file: !15, line: 61, type: !22)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 60, column: 5)
!68 = !DILocation(line: 61, column: 14, scope: !67)
!69 = !DILocation(line: 62, column: 9, scope: !67)
!70 = !DILocation(line: 63, column: 9, scope: !67)
!71 = !DILocation(line: 63, column: 23, scope: !67)
!72 = !DILocation(line: 65, column: 17, scope: !67)
!73 = !DILocation(line: 65, column: 23, scope: !67)
!74 = !DILocation(line: 65, column: 9, scope: !67)
!75 = !DILocation(line: 67, column: 9, scope: !67)
!76 = !DILocation(line: 67, column: 21, scope: !67)
!77 = !DILocation(line: 68, column: 19, scope: !67)
!78 = !DILocation(line: 68, column: 9, scope: !67)
!79 = !DILocation(line: 72, column: 1, scope: !63)
!80 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_41_good", scope: !15, file: !15, line: 90, type: !38, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 92, column: 5, scope: !80)
!82 = !DILocation(line: 93, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !84, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !15, line: 105, type: !86)
!89 = !DILocation(line: 105, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !15, line: 105, type: !87)
!91 = !DILocation(line: 105, column: 27, scope: !83)
!92 = !DILocation(line: 108, column: 22, scope: !83)
!93 = !DILocation(line: 108, column: 12, scope: !83)
!94 = !DILocation(line: 108, column: 5, scope: !83)
!95 = !DILocation(line: 110, column: 5, scope: !83)
!96 = !DILocation(line: 111, column: 5, scope: !83)
!97 = !DILocation(line: 112, column: 5, scope: !83)
!98 = !DILocation(line: 115, column: 5, scope: !83)
!99 = !DILocation(line: 116, column: 5, scope: !83)
!100 = !DILocation(line: 117, column: 5, scope: !83)
!101 = !DILocation(line: 119, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 75, type: !38, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 77, type: !4)
!104 = !DILocation(line: 77, column: 12, scope: !102)
!105 = !DILocation(line: 78, column: 10, scope: !102)
!106 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !15, line: 80, type: !4)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 79, column: 5)
!108 = !DILocation(line: 80, column: 16, scope: !107)
!109 = !DILocation(line: 80, column: 37, scope: !107)
!110 = !DILocation(line: 81, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 81, column: 13)
!112 = !DILocation(line: 81, column: 24, scope: !111)
!113 = !DILocation(line: 81, column: 13, scope: !107)
!114 = !DILocation(line: 81, column: 34, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 81, column: 33)
!116 = !DILocation(line: 82, column: 16, scope: !107)
!117 = !DILocation(line: 82, column: 9, scope: !107)
!118 = !DILocation(line: 83, column: 9, scope: !107)
!119 = !DILocation(line: 83, column: 27, scope: !107)
!120 = !DILocation(line: 85, column: 16, scope: !107)
!121 = !DILocation(line: 85, column: 14, scope: !107)
!122 = !DILocation(line: 87, column: 63, scope: !102)
!123 = !DILocation(line: 87, column: 5, scope: !102)
!124 = !DILocation(line: 88, column: 1, scope: !102)
