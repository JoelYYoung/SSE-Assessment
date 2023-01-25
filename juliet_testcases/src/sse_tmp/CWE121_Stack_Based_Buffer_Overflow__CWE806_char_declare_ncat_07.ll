; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  store i8* %arraydecay, i8** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !45
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  %call = call i64 @strlen(i8* %5) #6, !dbg !49
  %call2 = call i8* @strncat(i8* %arraydecay1, i8* %4, i64 %call) #7, !dbg !50
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %6 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07_good() #0 !dbg !56 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !83
  store i8* %arraydecay, i8** %data, align 8, !dbg !84
  %0 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp ne i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !99
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %call = call i64 @strlen(i8* %5) #6, !dbg !103
  %call2 = call i8* @strncat(i8* %arraydecay1, i8* %4, i64 %call) #7, !dbg !104
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !105
  store i8 0, i8* %arrayidx3, align 1, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %6), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i8* %arraydecay, i8** %data, align 8, !dbg !116
  %0 = load i32, i32* @staticFive, align 4, !dbg !117
  %cmp = icmp eq i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !123
  %2 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !129
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !130
  %4 = load i8*, i8** %data, align 8, !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  %call = call i64 @strlen(i8* %5) #6, !dbg !133
  %call2 = call i8* @strncat(i8* %arraydecay1, i8* %4, i64 %call) #7, !dbg !134
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !135
  store i8 0, i8* %arrayidx3, align 1, !dbg !136
  %6 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %6), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocation(line: 33, column: 12, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocation(line: 34, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 8, scope: !16)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 9, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !8, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 17, scope: !41)
!47 = !DILocation(line: 43, column: 23, scope: !41)
!48 = !DILocation(line: 43, column: 36, scope: !41)
!49 = !DILocation(line: 43, column: 29, scope: !41)
!50 = !DILocation(line: 43, column: 9, scope: !41)
!51 = !DILocation(line: 44, column: 9, scope: !41)
!52 = !DILocation(line: 44, column: 20, scope: !41)
!53 = !DILocation(line: 45, column: 19, scope: !41)
!54 = !DILocation(line: 45, column: 9, scope: !41)
!55 = !DILocation(line: 47, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_07_good", scope: !8, file: !8, line: 100, type: !17, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 102, column: 5, scope: !56)
!58 = !DILocation(line: 103, column: 5, scope: !56)
!59 = !DILocation(line: 104, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 116, type: !61, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!9, !9, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !8, line: 116, type: !9)
!65 = !DILocation(line: 116, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !8, line: 116, type: !63)
!67 = !DILocation(line: 116, column: 27, scope: !60)
!68 = !DILocation(line: 119, column: 22, scope: !60)
!69 = !DILocation(line: 119, column: 12, scope: !60)
!70 = !DILocation(line: 119, column: 5, scope: !60)
!71 = !DILocation(line: 121, column: 5, scope: !60)
!72 = !DILocation(line: 122, column: 5, scope: !60)
!73 = !DILocation(line: 123, column: 5, scope: !60)
!74 = !DILocation(line: 126, column: 5, scope: !60)
!75 = !DILocation(line: 127, column: 5, scope: !60)
!76 = !DILocation(line: 128, column: 5, scope: !60)
!77 = !DILocation(line: 130, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !8, line: 56, type: !20)
!80 = !DILocation(line: 56, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !8, line: 57, type: !24)
!82 = !DILocation(line: 57, column: 10, scope: !78)
!83 = !DILocation(line: 58, column: 12, scope: !78)
!84 = !DILocation(line: 58, column: 10, scope: !78)
!85 = !DILocation(line: 59, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !8, line: 59, column: 8)
!87 = !DILocation(line: 59, column: 18, scope: !86)
!88 = !DILocation(line: 59, column: 8, scope: !78)
!89 = !DILocation(line: 62, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !8, line: 60, column: 5)
!91 = !DILocation(line: 63, column: 5, scope: !90)
!92 = !DILocation(line: 67, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !8, line: 65, column: 5)
!94 = !DILocation(line: 67, column: 9, scope: !93)
!95 = !DILocation(line: 68, column: 9, scope: !93)
!96 = !DILocation(line: 68, column: 20, scope: !93)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !8, line: 71, type: !42)
!98 = distinct !DILexicalBlock(scope: !78, file: !8, line: 70, column: 5)
!99 = !DILocation(line: 71, column: 14, scope: !98)
!100 = !DILocation(line: 73, column: 17, scope: !98)
!101 = !DILocation(line: 73, column: 23, scope: !98)
!102 = !DILocation(line: 73, column: 36, scope: !98)
!103 = !DILocation(line: 73, column: 29, scope: !98)
!104 = !DILocation(line: 73, column: 9, scope: !98)
!105 = !DILocation(line: 74, column: 9, scope: !98)
!106 = !DILocation(line: 74, column: 20, scope: !98)
!107 = !DILocation(line: 75, column: 19, scope: !98)
!108 = !DILocation(line: 75, column: 9, scope: !98)
!109 = !DILocation(line: 77, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !8, line: 82, type: !20)
!112 = !DILocation(line: 82, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !8, line: 83, type: !24)
!114 = !DILocation(line: 83, column: 10, scope: !110)
!115 = !DILocation(line: 84, column: 12, scope: !110)
!116 = !DILocation(line: 84, column: 10, scope: !110)
!117 = !DILocation(line: 85, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !8, line: 85, column: 8)
!119 = !DILocation(line: 85, column: 18, scope: !118)
!120 = !DILocation(line: 85, column: 8, scope: !110)
!121 = !DILocation(line: 88, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !8, line: 86, column: 5)
!123 = !DILocation(line: 88, column: 9, scope: !122)
!124 = !DILocation(line: 89, column: 9, scope: !122)
!125 = !DILocation(line: 89, column: 20, scope: !122)
!126 = !DILocation(line: 90, column: 5, scope: !122)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !8, line: 92, type: !42)
!128 = distinct !DILexicalBlock(scope: !110, file: !8, line: 91, column: 5)
!129 = !DILocation(line: 92, column: 14, scope: !128)
!130 = !DILocation(line: 94, column: 17, scope: !128)
!131 = !DILocation(line: 94, column: 23, scope: !128)
!132 = !DILocation(line: 94, column: 36, scope: !128)
!133 = !DILocation(line: 94, column: 29, scope: !128)
!134 = !DILocation(line: 94, column: 9, scope: !128)
!135 = !DILocation(line: 95, column: 9, scope: !128)
!136 = !DILocation(line: 95, column: 20, scope: !128)
!137 = !DILocation(line: 96, column: 19, scope: !128)
!138 = !DILocation(line: 96, column: 9, scope: !128)
!139 = !DILocation(line: 98, column: 1, scope: !110)
