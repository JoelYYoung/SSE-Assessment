; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_06.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !51
  %5 = load i8*, i8** %data, align 8, !dbg !52
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !52
  store i8 0, i8* %arrayidx4, align 1, !dbg !53
  %6 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %6), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_06_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_06_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_06_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !89
  store i8* %call, i8** %dataBuffer, align 8, !dbg !88
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  %cmp = icmp eq i8* %0, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !97
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  store i8* %3, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx1, align 1, !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !110
  %5 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !111
  store i8 0, i8* %arrayidx4, align 1, !dbg !112
  %6 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %6), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i8* null, i8** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !120, metadata !DIExpression()), !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !125
  store i8* %call, i8** %dataBuffer, align 8, !dbg !124
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !126
  %cmp = icmp eq i8* %0, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !133
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !136
  store i8* %3, i8** %data, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx1, align 1, !dbg !143
  %4 = load i8*, i8** %data, align 8, !dbg !144
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !145
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !146
  %5 = load i8*, i8** %data, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !147
  store i8 0, i8* %arrayidx4, align 1, !dbg !148
  %6 = load i8*, i8** %data, align 8, !dbg !149
  call void @printLine(i8* %6), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_06_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_06.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !4)
!19 = !DILocation(line: 29, column: 12, scope: !14)
!20 = !DILocation(line: 30, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 34, type: !4)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 33, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 8)
!25 = !DILocation(line: 34, column: 20, scope: !22)
!26 = !DILocation(line: 34, column: 41, scope: !22)
!27 = !DILocation(line: 35, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 17)
!29 = !DILocation(line: 35, column: 28, scope: !28)
!30 = !DILocation(line: 35, column: 17, scope: !22)
!31 = !DILocation(line: 35, column: 38, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 35, column: 37)
!33 = !DILocation(line: 36, column: 20, scope: !22)
!34 = !DILocation(line: 36, column: 13, scope: !22)
!35 = !DILocation(line: 37, column: 13, scope: !22)
!36 = !DILocation(line: 37, column: 31, scope: !22)
!37 = !DILocation(line: 39, column: 20, scope: !22)
!38 = !DILocation(line: 39, column: 31, scope: !22)
!39 = !DILocation(line: 39, column: 18, scope: !22)
!40 = !DILocalVariable(name: "source", scope: !41, file: !15, line: 43, type: !42)
!41 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 43, column: 14, scope: !41)
!46 = !DILocation(line: 44, column: 9, scope: !41)
!47 = !DILocation(line: 45, column: 9, scope: !41)
!48 = !DILocation(line: 45, column: 23, scope: !41)
!49 = !DILocation(line: 47, column: 17, scope: !41)
!50 = !DILocation(line: 47, column: 23, scope: !41)
!51 = !DILocation(line: 47, column: 9, scope: !41)
!52 = !DILocation(line: 49, column: 9, scope: !41)
!53 = !DILocation(line: 49, column: 21, scope: !41)
!54 = !DILocation(line: 50, column: 19, scope: !41)
!55 = !DILocation(line: 50, column: 9, scope: !41)
!56 = !DILocation(line: 54, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_06_good", scope: !15, file: !15, line: 125, type: !16, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 127, column: 5, scope: !57)
!59 = !DILocation(line: 128, column: 5, scope: !57)
!60 = !DILocation(line: 129, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 141, type: !62, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 141, type: !64)
!67 = !DILocation(line: 141, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 141, type: !65)
!69 = !DILocation(line: 141, column: 27, scope: !61)
!70 = !DILocation(line: 144, column: 22, scope: !61)
!71 = !DILocation(line: 144, column: 12, scope: !61)
!72 = !DILocation(line: 144, column: 5, scope: !61)
!73 = !DILocation(line: 146, column: 5, scope: !61)
!74 = !DILocation(line: 147, column: 5, scope: !61)
!75 = !DILocation(line: 148, column: 5, scope: !61)
!76 = !DILocation(line: 151, column: 5, scope: !61)
!77 = !DILocation(line: 152, column: 5, scope: !61)
!78 = !DILocation(line: 153, column: 5, scope: !61)
!79 = !DILocation(line: 155, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 63, type: !4)
!82 = !DILocation(line: 63, column: 12, scope: !80)
!83 = !DILocation(line: 64, column: 10, scope: !80)
!84 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !15, line: 73, type: !4)
!85 = distinct !DILexicalBlock(scope: !86, file: !15, line: 72, column: 9)
!86 = distinct !DILexicalBlock(scope: !87, file: !15, line: 71, column: 5)
!87 = distinct !DILexicalBlock(scope: !80, file: !15, line: 65, column: 8)
!88 = !DILocation(line: 73, column: 20, scope: !85)
!89 = !DILocation(line: 73, column: 41, scope: !85)
!90 = !DILocation(line: 74, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !15, line: 74, column: 17)
!92 = !DILocation(line: 74, column: 28, scope: !91)
!93 = !DILocation(line: 74, column: 17, scope: !85)
!94 = !DILocation(line: 74, column: 38, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 74, column: 37)
!96 = !DILocation(line: 75, column: 20, scope: !85)
!97 = !DILocation(line: 75, column: 13, scope: !85)
!98 = !DILocation(line: 76, column: 13, scope: !85)
!99 = !DILocation(line: 76, column: 31, scope: !85)
!100 = !DILocation(line: 78, column: 20, scope: !85)
!101 = !DILocation(line: 78, column: 18, scope: !85)
!102 = !DILocalVariable(name: "source", scope: !103, file: !15, line: 82, type: !42)
!103 = distinct !DILexicalBlock(scope: !80, file: !15, line: 81, column: 5)
!104 = !DILocation(line: 82, column: 14, scope: !103)
!105 = !DILocation(line: 83, column: 9, scope: !103)
!106 = !DILocation(line: 84, column: 9, scope: !103)
!107 = !DILocation(line: 84, column: 23, scope: !103)
!108 = !DILocation(line: 86, column: 17, scope: !103)
!109 = !DILocation(line: 86, column: 23, scope: !103)
!110 = !DILocation(line: 86, column: 9, scope: !103)
!111 = !DILocation(line: 88, column: 9, scope: !103)
!112 = !DILocation(line: 88, column: 21, scope: !103)
!113 = !DILocation(line: 89, column: 19, scope: !103)
!114 = !DILocation(line: 89, column: 9, scope: !103)
!115 = !DILocation(line: 93, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 98, type: !4)
!118 = !DILocation(line: 98, column: 12, scope: !116)
!119 = !DILocation(line: 99, column: 10, scope: !116)
!120 = !DILocalVariable(name: "dataBuffer", scope: !121, file: !15, line: 103, type: !4)
!121 = distinct !DILexicalBlock(scope: !122, file: !15, line: 102, column: 9)
!122 = distinct !DILexicalBlock(scope: !123, file: !15, line: 101, column: 5)
!123 = distinct !DILexicalBlock(scope: !116, file: !15, line: 100, column: 8)
!124 = !DILocation(line: 103, column: 20, scope: !121)
!125 = !DILocation(line: 103, column: 41, scope: !121)
!126 = !DILocation(line: 104, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !121, file: !15, line: 104, column: 17)
!128 = !DILocation(line: 104, column: 28, scope: !127)
!129 = !DILocation(line: 104, column: 17, scope: !121)
!130 = !DILocation(line: 104, column: 38, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 104, column: 37)
!132 = !DILocation(line: 105, column: 20, scope: !121)
!133 = !DILocation(line: 105, column: 13, scope: !121)
!134 = !DILocation(line: 106, column: 13, scope: !121)
!135 = !DILocation(line: 106, column: 31, scope: !121)
!136 = !DILocation(line: 108, column: 20, scope: !121)
!137 = !DILocation(line: 108, column: 18, scope: !121)
!138 = !DILocalVariable(name: "source", scope: !139, file: !15, line: 112, type: !42)
!139 = distinct !DILexicalBlock(scope: !116, file: !15, line: 111, column: 5)
!140 = !DILocation(line: 112, column: 14, scope: !139)
!141 = !DILocation(line: 113, column: 9, scope: !139)
!142 = !DILocation(line: 114, column: 9, scope: !139)
!143 = !DILocation(line: 114, column: 23, scope: !139)
!144 = !DILocation(line: 116, column: 17, scope: !139)
!145 = !DILocation(line: 116, column: 23, scope: !139)
!146 = !DILocation(line: 116, column: 9, scope: !139)
!147 = !DILocation(line: 118, column: 9, scope: !139)
!148 = !DILocation(line: 118, column: 21, scope: !139)
!149 = !DILocation(line: 119, column: 19, scope: !139)
!150 = !DILocation(line: 119, column: 9, scope: !139)
!151 = !DILocation(line: 123, column: 1, scope: !116)
