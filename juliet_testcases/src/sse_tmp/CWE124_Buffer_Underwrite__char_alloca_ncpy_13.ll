; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_13.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_13_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !26
  %cmp = icmp eq i32 %3, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx1, align 1, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !47
  store i8 0, i8* %arrayidx3, align 1, !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %7), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_13_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_13_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_13_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %0, i8** %dataBuffer, align 8, !dbg !79
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !82
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !85
  %cmp = icmp ne i32 %3, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  store i8* %4, i8** %data, align 8, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx1, align 1, !dbg !100
  %5 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  %7 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %7), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %0, i8** %dataBuffer, align 8, !dbg !113
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !116
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !119
  %cmp = icmp eq i32 %3, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !123
  store i8* %4, i8** %data, align 8, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx1, align 1, !dbg !132
  %5 = load i8*, i8** %data, align 8, !dbg !133
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !134
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !135
  %6 = load i8*, i8** %data, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !136
  store i8 0, i8* %arrayidx3, align 1, !dbg !137
  %7 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* %7), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_13_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 29, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!28 = !DILocation(line: 29, column: 25, scope: !27)
!29 = !DILocation(line: 29, column: 8, scope: !13)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 36, column: 9, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 37, column: 23, scope: !36)
!44 = !DILocation(line: 39, column: 17, scope: !36)
!45 = !DILocation(line: 39, column: 23, scope: !36)
!46 = !DILocation(line: 39, column: 9, scope: !36)
!47 = !DILocation(line: 41, column: 9, scope: !36)
!48 = !DILocation(line: 41, column: 21, scope: !36)
!49 = !DILocation(line: 42, column: 19, scope: !36)
!50 = !DILocation(line: 42, column: 9, scope: !36)
!51 = !DILocation(line: 44, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_13_good", scope: !14, file: !14, line: 103, type: !15, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 105, column: 5, scope: !52)
!54 = !DILocation(line: 106, column: 5, scope: !52)
!55 = !DILocation(line: 107, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 119, type: !57, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !14, line: 119, type: !59)
!62 = !DILocation(line: 119, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !14, line: 119, type: !60)
!64 = !DILocation(line: 119, column: 27, scope: !56)
!65 = !DILocation(line: 122, column: 22, scope: !56)
!66 = !DILocation(line: 122, column: 12, scope: !56)
!67 = !DILocation(line: 122, column: 5, scope: !56)
!68 = !DILocation(line: 124, column: 5, scope: !56)
!69 = !DILocation(line: 125, column: 5, scope: !56)
!70 = !DILocation(line: 126, column: 5, scope: !56)
!71 = !DILocation(line: 129, column: 5, scope: !56)
!72 = !DILocation(line: 130, column: 5, scope: !56)
!73 = !DILocation(line: 131, column: 5, scope: !56)
!74 = !DILocation(line: 133, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !14, line: 53, type: !4)
!77 = !DILocation(line: 53, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !14, line: 54, type: !4)
!79 = !DILocation(line: 54, column: 12, scope: !75)
!80 = !DILocation(line: 54, column: 33, scope: !75)
!81 = !DILocation(line: 55, column: 12, scope: !75)
!82 = !DILocation(line: 55, column: 5, scope: !75)
!83 = !DILocation(line: 56, column: 5, scope: !75)
!84 = !DILocation(line: 56, column: 23, scope: !75)
!85 = !DILocation(line: 57, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !75, file: !14, line: 57, column: 8)
!87 = !DILocation(line: 57, column: 25, scope: !86)
!88 = !DILocation(line: 57, column: 8, scope: !75)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !14, line: 58, column: 5)
!91 = !DILocation(line: 61, column: 5, scope: !90)
!92 = !DILocation(line: 65, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !14, line: 63, column: 5)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocalVariable(name: "source", scope: !96, file: !14, line: 68, type: !37)
!96 = distinct !DILexicalBlock(scope: !75, file: !14, line: 67, column: 5)
!97 = !DILocation(line: 68, column: 14, scope: !96)
!98 = !DILocation(line: 69, column: 9, scope: !96)
!99 = !DILocation(line: 70, column: 9, scope: !96)
!100 = !DILocation(line: 70, column: 23, scope: !96)
!101 = !DILocation(line: 72, column: 17, scope: !96)
!102 = !DILocation(line: 72, column: 23, scope: !96)
!103 = !DILocation(line: 72, column: 9, scope: !96)
!104 = !DILocation(line: 74, column: 9, scope: !96)
!105 = !DILocation(line: 74, column: 21, scope: !96)
!106 = !DILocation(line: 75, column: 19, scope: !96)
!107 = !DILocation(line: 75, column: 9, scope: !96)
!108 = !DILocation(line: 77, column: 1, scope: !75)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 82, type: !4)
!111 = !DILocation(line: 82, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !14, line: 83, type: !4)
!113 = !DILocation(line: 83, column: 12, scope: !109)
!114 = !DILocation(line: 83, column: 33, scope: !109)
!115 = !DILocation(line: 84, column: 12, scope: !109)
!116 = !DILocation(line: 84, column: 5, scope: !109)
!117 = !DILocation(line: 85, column: 5, scope: !109)
!118 = !DILocation(line: 85, column: 23, scope: !109)
!119 = !DILocation(line: 86, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !14, line: 86, column: 8)
!121 = !DILocation(line: 86, column: 25, scope: !120)
!122 = !DILocation(line: 86, column: 8, scope: !109)
!123 = !DILocation(line: 89, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !14, line: 87, column: 5)
!125 = !DILocation(line: 89, column: 14, scope: !124)
!126 = !DILocation(line: 90, column: 5, scope: !124)
!127 = !DILocalVariable(name: "source", scope: !128, file: !14, line: 92, type: !37)
!128 = distinct !DILexicalBlock(scope: !109, file: !14, line: 91, column: 5)
!129 = !DILocation(line: 92, column: 14, scope: !128)
!130 = !DILocation(line: 93, column: 9, scope: !128)
!131 = !DILocation(line: 94, column: 9, scope: !128)
!132 = !DILocation(line: 94, column: 23, scope: !128)
!133 = !DILocation(line: 96, column: 17, scope: !128)
!134 = !DILocation(line: 96, column: 23, scope: !128)
!135 = !DILocation(line: 96, column: 9, scope: !128)
!136 = !DILocation(line: 98, column: 9, scope: !128)
!137 = !DILocation(line: 98, column: 21, scope: !128)
!138 = !DILocation(line: 99, column: 19, scope: !128)
!139 = !DILocation(line: 99, column: 9, scope: !128)
!140 = !DILocation(line: 101, column: 1, scope: !109)
