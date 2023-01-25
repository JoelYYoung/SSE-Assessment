; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx2, align 1, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !48
  store i8 0, i8* %arrayidx4, align 1, !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %4), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32, i32* @globalFive, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay, i8** %data, align 8, !dbg !92
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !104
  store i8 0, i8* %arrayidx4, align 1, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %4), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load i32, i32* @globalFive, align 4, !dbg !116
  %cmp = icmp eq i32 %0, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store i8* %arraydecay, i8** %data, align 8, !dbg !122
  %1 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx2, align 1, !dbg !131
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !134
  %3 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !135
  store i8 0, i8* %arrayidx4, align 1, !dbg !136
  %4 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %4), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 18, scope: !30)
!32 = !DILocation(line: 28, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 36, type: !25)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 36, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 9, scope: !40)
!43 = !DILocation(line: 38, column: 9, scope: !40)
!44 = !DILocation(line: 38, column: 23, scope: !40)
!45 = !DILocation(line: 40, column: 17, scope: !40)
!46 = !DILocation(line: 40, column: 23, scope: !40)
!47 = !DILocation(line: 40, column: 9, scope: !40)
!48 = !DILocation(line: 41, column: 9, scope: !40)
!49 = !DILocation(line: 41, column: 21, scope: !40)
!50 = !DILocation(line: 42, column: 19, scope: !40)
!51 = !DILocation(line: 42, column: 9, scope: !40)
!52 = !DILocation(line: 44, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_14_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 103, column: 5, scope: !53)
!55 = !DILocation(line: 104, column: 5, scope: !53)
!56 = !DILocation(line: 105, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !58, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 117, type: !60)
!63 = !DILocation(line: 117, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 117, type: !61)
!65 = !DILocation(line: 117, column: 27, scope: !57)
!66 = !DILocation(line: 120, column: 22, scope: !57)
!67 = !DILocation(line: 120, column: 12, scope: !57)
!68 = !DILocation(line: 120, column: 5, scope: !57)
!69 = !DILocation(line: 122, column: 5, scope: !57)
!70 = !DILocation(line: 123, column: 5, scope: !57)
!71 = !DILocation(line: 124, column: 5, scope: !57)
!72 = !DILocation(line: 127, column: 5, scope: !57)
!73 = !DILocation(line: 128, column: 5, scope: !57)
!74 = !DILocation(line: 129, column: 5, scope: !57)
!75 = !DILocation(line: 131, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 53, type: !16)
!78 = !DILocation(line: 53, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !12, line: 54, type: !20)
!80 = !DILocation(line: 54, column: 10, scope: !76)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !12, line: 55, type: !25)
!82 = !DILocation(line: 55, column: 10, scope: !76)
!83 = !DILocation(line: 56, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !76, file: !12, line: 56, column: 8)
!85 = !DILocation(line: 56, column: 18, scope: !84)
!86 = !DILocation(line: 56, column: 8, scope: !76)
!87 = !DILocation(line: 59, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !12, line: 57, column: 5)
!89 = !DILocation(line: 60, column: 5, scope: !88)
!90 = !DILocation(line: 64, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !12, line: 62, column: 5)
!92 = !DILocation(line: 64, column: 14, scope: !91)
!93 = !DILocation(line: 65, column: 9, scope: !91)
!94 = !DILocation(line: 65, column: 17, scope: !91)
!95 = !DILocalVariable(name: "source", scope: !96, file: !12, line: 68, type: !25)
!96 = distinct !DILexicalBlock(scope: !76, file: !12, line: 67, column: 5)
!97 = !DILocation(line: 68, column: 14, scope: !96)
!98 = !DILocation(line: 69, column: 9, scope: !96)
!99 = !DILocation(line: 70, column: 9, scope: !96)
!100 = !DILocation(line: 70, column: 23, scope: !96)
!101 = !DILocation(line: 72, column: 17, scope: !96)
!102 = !DILocation(line: 72, column: 23, scope: !96)
!103 = !DILocation(line: 72, column: 9, scope: !96)
!104 = !DILocation(line: 73, column: 9, scope: !96)
!105 = !DILocation(line: 73, column: 21, scope: !96)
!106 = !DILocation(line: 74, column: 19, scope: !96)
!107 = !DILocation(line: 74, column: 9, scope: !96)
!108 = !DILocation(line: 76, column: 1, scope: !76)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 81, type: !16)
!111 = !DILocation(line: 81, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !12, line: 82, type: !20)
!113 = !DILocation(line: 82, column: 10, scope: !109)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !12, line: 83, type: !25)
!115 = !DILocation(line: 83, column: 10, scope: !109)
!116 = !DILocation(line: 84, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !12, line: 84, column: 8)
!118 = !DILocation(line: 84, column: 18, scope: !117)
!119 = !DILocation(line: 84, column: 8, scope: !109)
!120 = !DILocation(line: 87, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 85, column: 5)
!122 = !DILocation(line: 87, column: 14, scope: !121)
!123 = !DILocation(line: 88, column: 9, scope: !121)
!124 = !DILocation(line: 88, column: 17, scope: !121)
!125 = !DILocation(line: 89, column: 5, scope: !121)
!126 = !DILocalVariable(name: "source", scope: !127, file: !12, line: 91, type: !25)
!127 = distinct !DILexicalBlock(scope: !109, file: !12, line: 90, column: 5)
!128 = !DILocation(line: 91, column: 14, scope: !127)
!129 = !DILocation(line: 92, column: 9, scope: !127)
!130 = !DILocation(line: 93, column: 9, scope: !127)
!131 = !DILocation(line: 93, column: 23, scope: !127)
!132 = !DILocation(line: 95, column: 17, scope: !127)
!133 = !DILocation(line: 95, column: 23, scope: !127)
!134 = !DILocation(line: 95, column: 9, scope: !127)
!135 = !DILocation(line: 96, column: 9, scope: !127)
!136 = !DILocation(line: 96, column: 21, scope: !127)
!137 = !DILocation(line: 97, column: 19, scope: !127)
!138 = !DILocation(line: 97, column: 9, scope: !127)
!139 = !DILocation(line: 99, column: 1, scope: !109)
