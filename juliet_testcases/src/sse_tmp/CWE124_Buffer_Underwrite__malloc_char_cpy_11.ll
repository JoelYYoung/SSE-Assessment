; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_11.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !28
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !40
  store i8* %add.ptr, i8** %data, align 8, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  %call6 = call i8* @strcpy(i8* %4, i8* %arraydecay5) #6, !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %5), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_11_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_11_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_11_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* null, i8** %data, align 8, !dbg !84
  %call = call i32 (...) @globalReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end3, !dbg !90

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !94
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !95
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !94
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i8* %0, null, !dbg !98
  br i1 %cmp, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !103
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  store i8* %3, i8** %data, align 8, !dbg !107
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx4, align 1, !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  %call6 = call i8* @strcpy(i8* %4, i8* %arraydecay5) #6, !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* %5), !dbg !118
  ret void, !dbg !119
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i8* null, i8** %data, align 8, !dbg !123
  %call = call i32 (...) @globalReturnsTrue(), !dbg !124
  %tobool = icmp ne i32 %call, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end3, !dbg !126

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !130
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !131
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !130
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  %cmp = icmp eq i8* %0, null, !dbg !134
  br i1 %cmp, label %if.then2, label %if.end, !dbg !135

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !139
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !140
  store i8 0, i8* %arrayidx, align 1, !dbg !141
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !142
  store i8* %3, i8** %data, align 8, !dbg !143
  br label %if.end3, !dbg !144

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !148
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !149
  store i8 0, i8* %arrayidx4, align 1, !dbg !150
  %4 = load i8*, i8** %data, align 8, !dbg !151
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !152
  %call6 = call i8* @strcpy(i8* %4, i8* %arraydecay5) #6, !dbg !153
  %5 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* %5), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_11_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 41, scope: !25)
!29 = !DILocation(line: 31, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 17)
!31 = !DILocation(line: 31, column: 28, scope: !30)
!32 = !DILocation(line: 31, column: 17, scope: !25)
!33 = !DILocation(line: 31, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 31, column: 37)
!35 = !DILocation(line: 32, column: 20, scope: !25)
!36 = !DILocation(line: 32, column: 13, scope: !25)
!37 = !DILocation(line: 33, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 31, scope: !25)
!39 = !DILocation(line: 35, column: 20, scope: !25)
!40 = !DILocation(line: 35, column: 31, scope: !25)
!41 = !DILocation(line: 35, column: 18, scope: !25)
!42 = !DILocation(line: 37, column: 5, scope: !26)
!43 = !DILocalVariable(name: "source", scope: !44, file: !15, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 39, column: 14, scope: !44)
!49 = !DILocation(line: 40, column: 9, scope: !44)
!50 = !DILocation(line: 41, column: 9, scope: !44)
!51 = !DILocation(line: 41, column: 23, scope: !44)
!52 = !DILocation(line: 43, column: 16, scope: !44)
!53 = !DILocation(line: 43, column: 22, scope: !44)
!54 = !DILocation(line: 43, column: 9, scope: !44)
!55 = !DILocation(line: 44, column: 19, scope: !44)
!56 = !DILocation(line: 44, column: 9, scope: !44)
!57 = !DILocation(line: 48, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_11_good", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 117, column: 5, scope: !58)
!60 = !DILocation(line: 118, column: 5, scope: !58)
!61 = !DILocation(line: 119, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 131, type: !63, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !15, line: 131, type: !65)
!68 = !DILocation(line: 131, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !15, line: 131, type: !66)
!70 = !DILocation(line: 131, column: 27, scope: !62)
!71 = !DILocation(line: 134, column: 22, scope: !62)
!72 = !DILocation(line: 134, column: 12, scope: !62)
!73 = !DILocation(line: 134, column: 5, scope: !62)
!74 = !DILocation(line: 136, column: 5, scope: !62)
!75 = !DILocation(line: 137, column: 5, scope: !62)
!76 = !DILocation(line: 138, column: 5, scope: !62)
!77 = !DILocation(line: 141, column: 5, scope: !62)
!78 = !DILocation(line: 142, column: 5, scope: !62)
!79 = !DILocation(line: 143, column: 5, scope: !62)
!80 = !DILocation(line: 145, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 57, type: !4)
!83 = !DILocation(line: 57, column: 12, scope: !81)
!84 = !DILocation(line: 58, column: 10, scope: !81)
!85 = !DILocation(line: 59, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !15, line: 59, column: 8)
!87 = !DILocation(line: 59, column: 8, scope: !81)
!88 = !DILocation(line: 62, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !15, line: 60, column: 5)
!90 = !DILocation(line: 63, column: 5, scope: !89)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !15, line: 67, type: !4)
!92 = distinct !DILexicalBlock(scope: !93, file: !15, line: 66, column: 9)
!93 = distinct !DILexicalBlock(scope: !86, file: !15, line: 65, column: 5)
!94 = !DILocation(line: 67, column: 20, scope: !92)
!95 = !DILocation(line: 67, column: 41, scope: !92)
!96 = !DILocation(line: 68, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !15, line: 68, column: 17)
!98 = !DILocation(line: 68, column: 28, scope: !97)
!99 = !DILocation(line: 68, column: 17, scope: !92)
!100 = !DILocation(line: 68, column: 38, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 68, column: 37)
!102 = !DILocation(line: 69, column: 20, scope: !92)
!103 = !DILocation(line: 69, column: 13, scope: !92)
!104 = !DILocation(line: 70, column: 13, scope: !92)
!105 = !DILocation(line: 70, column: 31, scope: !92)
!106 = !DILocation(line: 72, column: 20, scope: !92)
!107 = !DILocation(line: 72, column: 18, scope: !92)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 76, type: !45)
!109 = distinct !DILexicalBlock(scope: !81, file: !15, line: 75, column: 5)
!110 = !DILocation(line: 76, column: 14, scope: !109)
!111 = !DILocation(line: 77, column: 9, scope: !109)
!112 = !DILocation(line: 78, column: 9, scope: !109)
!113 = !DILocation(line: 78, column: 23, scope: !109)
!114 = !DILocation(line: 80, column: 16, scope: !109)
!115 = !DILocation(line: 80, column: 22, scope: !109)
!116 = !DILocation(line: 80, column: 9, scope: !109)
!117 = !DILocation(line: 81, column: 19, scope: !109)
!118 = !DILocation(line: 81, column: 9, scope: !109)
!119 = !DILocation(line: 85, column: 1, scope: !81)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 90, type: !4)
!122 = !DILocation(line: 90, column: 12, scope: !120)
!123 = !DILocation(line: 91, column: 10, scope: !120)
!124 = !DILocation(line: 92, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !15, line: 92, column: 8)
!126 = !DILocation(line: 92, column: 8, scope: !120)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !15, line: 95, type: !4)
!128 = distinct !DILexicalBlock(scope: !129, file: !15, line: 94, column: 9)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 93, column: 5)
!130 = !DILocation(line: 95, column: 20, scope: !128)
!131 = !DILocation(line: 95, column: 41, scope: !128)
!132 = !DILocation(line: 96, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !15, line: 96, column: 17)
!134 = !DILocation(line: 96, column: 28, scope: !133)
!135 = !DILocation(line: 96, column: 17, scope: !128)
!136 = !DILocation(line: 96, column: 38, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 96, column: 37)
!138 = !DILocation(line: 97, column: 20, scope: !128)
!139 = !DILocation(line: 97, column: 13, scope: !128)
!140 = !DILocation(line: 98, column: 13, scope: !128)
!141 = !DILocation(line: 98, column: 31, scope: !128)
!142 = !DILocation(line: 100, column: 20, scope: !128)
!143 = !DILocation(line: 100, column: 18, scope: !128)
!144 = !DILocation(line: 102, column: 5, scope: !129)
!145 = !DILocalVariable(name: "source", scope: !146, file: !15, line: 104, type: !45)
!146 = distinct !DILexicalBlock(scope: !120, file: !15, line: 103, column: 5)
!147 = !DILocation(line: 104, column: 14, scope: !146)
!148 = !DILocation(line: 105, column: 9, scope: !146)
!149 = !DILocation(line: 106, column: 9, scope: !146)
!150 = !DILocation(line: 106, column: 23, scope: !146)
!151 = !DILocation(line: 108, column: 16, scope: !146)
!152 = !DILocation(line: 108, column: 22, scope: !146)
!153 = !DILocation(line: 108, column: 9, scope: !146)
!154 = !DILocation(line: 109, column: 19, scope: !146)
!155 = !DILocation(line: 109, column: 9, scope: !146)
!156 = !DILocation(line: 113, column: 1, scope: !120)
