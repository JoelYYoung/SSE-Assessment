; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx1, align 1, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %6), !dbg !53
  ret void, !dbg !54
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_01_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #6, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #6, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_01_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_01_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !84
  store i8* %call, i8** %dataBuffer, align 8, !dbg !83
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i8* %0, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !92
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !95
  store i8* %3, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !106
  store i8 0, i8* %arrayidx4, align 1, !dbg !107
  %6 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %6), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 28, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!23 = !DILocation(line: 28, column: 16, scope: !22)
!24 = !DILocation(line: 28, column: 37, scope: !22)
!25 = !DILocation(line: 29, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 29, column: 13)
!27 = !DILocation(line: 29, column: 24, scope: !26)
!28 = !DILocation(line: 29, column: 13, scope: !22)
!29 = !DILocation(line: 29, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 33)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 27, scope: !22)
!35 = !DILocation(line: 33, column: 16, scope: !22)
!36 = !DILocation(line: 33, column: 27, scope: !22)
!37 = !DILocation(line: 33, column: 14, scope: !22)
!38 = !DILocalVariable(name: "source", scope: !39, file: !15, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 36, column: 14, scope: !39)
!44 = !DILocation(line: 37, column: 9, scope: !39)
!45 = !DILocation(line: 38, column: 9, scope: !39)
!46 = !DILocation(line: 38, column: 23, scope: !39)
!47 = !DILocation(line: 40, column: 17, scope: !39)
!48 = !DILocation(line: 40, column: 23, scope: !39)
!49 = !DILocation(line: 40, column: 9, scope: !39)
!50 = !DILocation(line: 42, column: 9, scope: !39)
!51 = !DILocation(line: 42, column: 21, scope: !39)
!52 = !DILocation(line: 43, column: 19, scope: !39)
!53 = !DILocation(line: 43, column: 9, scope: !39)
!54 = !DILocation(line: 47, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_01_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 82, column: 5, scope: !55)
!57 = !DILocation(line: 83, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !59, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 95, type: !61)
!64 = !DILocation(line: 95, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 95, type: !62)
!66 = !DILocation(line: 95, column: 27, scope: !58)
!67 = !DILocation(line: 98, column: 22, scope: !58)
!68 = !DILocation(line: 98, column: 12, scope: !58)
!69 = !DILocation(line: 98, column: 5, scope: !58)
!70 = !DILocation(line: 100, column: 5, scope: !58)
!71 = !DILocation(line: 101, column: 5, scope: !58)
!72 = !DILocation(line: 102, column: 5, scope: !58)
!73 = !DILocation(line: 105, column: 5, scope: !58)
!74 = !DILocation(line: 106, column: 5, scope: !58)
!75 = !DILocation(line: 107, column: 5, scope: !58)
!76 = !DILocation(line: 109, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 56, type: !4)
!79 = !DILocation(line: 56, column: 12, scope: !77)
!80 = !DILocation(line: 57, column: 10, scope: !77)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !15, line: 59, type: !4)
!82 = distinct !DILexicalBlock(scope: !77, file: !15, line: 58, column: 5)
!83 = !DILocation(line: 59, column: 16, scope: !82)
!84 = !DILocation(line: 59, column: 37, scope: !82)
!85 = !DILocation(line: 60, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 60, column: 13)
!87 = !DILocation(line: 60, column: 24, scope: !86)
!88 = !DILocation(line: 60, column: 13, scope: !82)
!89 = !DILocation(line: 60, column: 34, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 60, column: 33)
!91 = !DILocation(line: 61, column: 16, scope: !82)
!92 = !DILocation(line: 61, column: 9, scope: !82)
!93 = !DILocation(line: 62, column: 9, scope: !82)
!94 = !DILocation(line: 62, column: 27, scope: !82)
!95 = !DILocation(line: 64, column: 16, scope: !82)
!96 = !DILocation(line: 64, column: 14, scope: !82)
!97 = !DILocalVariable(name: "source", scope: !98, file: !15, line: 67, type: !40)
!98 = distinct !DILexicalBlock(scope: !77, file: !15, line: 66, column: 5)
!99 = !DILocation(line: 67, column: 14, scope: !98)
!100 = !DILocation(line: 68, column: 9, scope: !98)
!101 = !DILocation(line: 69, column: 9, scope: !98)
!102 = !DILocation(line: 69, column: 23, scope: !98)
!103 = !DILocation(line: 71, column: 17, scope: !98)
!104 = !DILocation(line: 71, column: 23, scope: !98)
!105 = !DILocation(line: 71, column: 9, scope: !98)
!106 = !DILocation(line: 73, column: 9, scope: !98)
!107 = !DILocation(line: 73, column: 21, scope: !98)
!108 = !DILocation(line: 74, column: 19, scope: !98)
!109 = !DILocation(line: 74, column: 9, scope: !98)
!110 = !DILocation(line: 78, column: 1, scope: !77)
