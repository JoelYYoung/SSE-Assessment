; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_06.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memcpy_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %6 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memcpy_06_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
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
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__malloc_char_memcpy_06_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE124_Buffer_Underwrite__malloc_char_memcpy_06_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !88
  store i8* %call, i8** %dataBuffer, align 8, !dbg !87
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !96
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !99
  store i8* %3, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx1, align 1, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !109
  store i8 0, i8* %arrayidx3, align 1, !dbg !110
  %6 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %6), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i8* null, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !123
  store i8* %call, i8** %dataBuffer, align 8, !dbg !122
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  %cmp = icmp eq i8* %0, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !131
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !134
  store i8* %3, i8** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx1, align 1, !dbg !141
  %4 = load i8*, i8** %data, align 8, !dbg !142
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !143
  %5 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !144
  store i8 0, i8* %arrayidx3, align 1, !dbg !145
  %6 = load i8*, i8** %data, align 8, !dbg !146
  call void @printLine(i8* %6), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_06_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!49 = !DILocation(line: 47, column: 16, scope: !41)
!50 = !DILocation(line: 47, column: 9, scope: !41)
!51 = !DILocation(line: 49, column: 9, scope: !41)
!52 = !DILocation(line: 49, column: 21, scope: !41)
!53 = !DILocation(line: 50, column: 19, scope: !41)
!54 = !DILocation(line: 50, column: 9, scope: !41)
!55 = !DILocation(line: 54, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_06_good", scope: !15, file: !15, line: 125, type: !16, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 127, column: 5, scope: !56)
!58 = !DILocation(line: 128, column: 5, scope: !56)
!59 = !DILocation(line: 129, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 141, type: !61, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 141, type: !63)
!66 = !DILocation(line: 141, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 141, type: !64)
!68 = !DILocation(line: 141, column: 27, scope: !60)
!69 = !DILocation(line: 144, column: 22, scope: !60)
!70 = !DILocation(line: 144, column: 12, scope: !60)
!71 = !DILocation(line: 144, column: 5, scope: !60)
!72 = !DILocation(line: 146, column: 5, scope: !60)
!73 = !DILocation(line: 147, column: 5, scope: !60)
!74 = !DILocation(line: 148, column: 5, scope: !60)
!75 = !DILocation(line: 151, column: 5, scope: !60)
!76 = !DILocation(line: 152, column: 5, scope: !60)
!77 = !DILocation(line: 153, column: 5, scope: !60)
!78 = !DILocation(line: 155, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 63, type: !4)
!81 = !DILocation(line: 63, column: 12, scope: !79)
!82 = !DILocation(line: 64, column: 10, scope: !79)
!83 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !15, line: 73, type: !4)
!84 = distinct !DILexicalBlock(scope: !85, file: !15, line: 72, column: 9)
!85 = distinct !DILexicalBlock(scope: !86, file: !15, line: 71, column: 5)
!86 = distinct !DILexicalBlock(scope: !79, file: !15, line: 65, column: 8)
!87 = !DILocation(line: 73, column: 20, scope: !84)
!88 = !DILocation(line: 73, column: 41, scope: !84)
!89 = !DILocation(line: 74, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !15, line: 74, column: 17)
!91 = !DILocation(line: 74, column: 28, scope: !90)
!92 = !DILocation(line: 74, column: 17, scope: !84)
!93 = !DILocation(line: 74, column: 38, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 74, column: 37)
!95 = !DILocation(line: 75, column: 20, scope: !84)
!96 = !DILocation(line: 75, column: 13, scope: !84)
!97 = !DILocation(line: 76, column: 13, scope: !84)
!98 = !DILocation(line: 76, column: 31, scope: !84)
!99 = !DILocation(line: 78, column: 20, scope: !84)
!100 = !DILocation(line: 78, column: 18, scope: !84)
!101 = !DILocalVariable(name: "source", scope: !102, file: !15, line: 82, type: !42)
!102 = distinct !DILexicalBlock(scope: !79, file: !15, line: 81, column: 5)
!103 = !DILocation(line: 82, column: 14, scope: !102)
!104 = !DILocation(line: 83, column: 9, scope: !102)
!105 = !DILocation(line: 84, column: 9, scope: !102)
!106 = !DILocation(line: 84, column: 23, scope: !102)
!107 = !DILocation(line: 86, column: 16, scope: !102)
!108 = !DILocation(line: 86, column: 9, scope: !102)
!109 = !DILocation(line: 88, column: 9, scope: !102)
!110 = !DILocation(line: 88, column: 21, scope: !102)
!111 = !DILocation(line: 89, column: 19, scope: !102)
!112 = !DILocation(line: 89, column: 9, scope: !102)
!113 = !DILocation(line: 93, column: 1, scope: !79)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 98, type: !4)
!116 = !DILocation(line: 98, column: 12, scope: !114)
!117 = !DILocation(line: 99, column: 10, scope: !114)
!118 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !15, line: 103, type: !4)
!119 = distinct !DILexicalBlock(scope: !120, file: !15, line: 102, column: 9)
!120 = distinct !DILexicalBlock(scope: !121, file: !15, line: 101, column: 5)
!121 = distinct !DILexicalBlock(scope: !114, file: !15, line: 100, column: 8)
!122 = !DILocation(line: 103, column: 20, scope: !119)
!123 = !DILocation(line: 103, column: 41, scope: !119)
!124 = !DILocation(line: 104, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !15, line: 104, column: 17)
!126 = !DILocation(line: 104, column: 28, scope: !125)
!127 = !DILocation(line: 104, column: 17, scope: !119)
!128 = !DILocation(line: 104, column: 38, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 104, column: 37)
!130 = !DILocation(line: 105, column: 20, scope: !119)
!131 = !DILocation(line: 105, column: 13, scope: !119)
!132 = !DILocation(line: 106, column: 13, scope: !119)
!133 = !DILocation(line: 106, column: 31, scope: !119)
!134 = !DILocation(line: 108, column: 20, scope: !119)
!135 = !DILocation(line: 108, column: 18, scope: !119)
!136 = !DILocalVariable(name: "source", scope: !137, file: !15, line: 112, type: !42)
!137 = distinct !DILexicalBlock(scope: !114, file: !15, line: 111, column: 5)
!138 = !DILocation(line: 112, column: 14, scope: !137)
!139 = !DILocation(line: 113, column: 9, scope: !137)
!140 = !DILocation(line: 114, column: 9, scope: !137)
!141 = !DILocation(line: 114, column: 23, scope: !137)
!142 = !DILocation(line: 116, column: 16, scope: !137)
!143 = !DILocation(line: 116, column: 9, scope: !137)
!144 = !DILocation(line: 118, column: 9, scope: !137)
!145 = !DILocation(line: 118, column: 21, scope: !137)
!146 = !DILocation(line: 119, column: 19, scope: !137)
!147 = !DILocation(line: 119, column: 9, scope: !137)
!148 = !DILocation(line: 123, column: 1, scope: !114)
