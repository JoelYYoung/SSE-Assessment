; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07_bad() #0 !dbg !16 {
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
  %call = call i64 @strlen(i8* %4) #6, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %6), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
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
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i8* %arraydecay, i8** %data, align 8, !dbg !82
  %0 = load i32, i32* @staticFive, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !92
  %2 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !97
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !98
  %4 = load i8*, i8** %data, align 8, !dbg !99
  %call = call i64 @strlen(i8* %4) #6, !dbg !100
  %5 = load i8*, i8** %data, align 8, !dbg !101
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %6), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %0 = load i32, i32* @staticFive, align 4, !dbg !113
  %cmp = icmp eq i32 %0, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !125
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  %call = call i64 @strlen(i8* %4) #6, !dbg !128
  %5 = load i8*, i8** %data, align 8, !dbg !129
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !130
  %6 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* %6), !dbg !132
  ret void, !dbg !133
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
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07_bad", scope: !8, file: !8, line: 35, type: !17, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 37, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 38, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 38, column: 10, scope: !16)
!28 = !DILocation(line: 39, column: 12, scope: !16)
!29 = !DILocation(line: 39, column: 10, scope: !16)
!30 = !DILocation(line: 40, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 8)
!32 = !DILocation(line: 40, column: 18, scope: !31)
!33 = !DILocation(line: 40, column: 8, scope: !16)
!34 = !DILocation(line: 43, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 41, column: 5)
!36 = !DILocation(line: 43, column: 9, scope: !35)
!37 = !DILocation(line: 44, column: 9, scope: !35)
!38 = !DILocation(line: 44, column: 21, scope: !35)
!39 = !DILocation(line: 45, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !8, line: 47, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 46, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 47, column: 14, scope: !41)
!46 = !DILocation(line: 49, column: 18, scope: !41)
!47 = !DILocation(line: 49, column: 31, scope: !41)
!48 = !DILocation(line: 49, column: 24, scope: !41)
!49 = !DILocation(line: 49, column: 44, scope: !41)
!50 = !DILocation(line: 49, column: 9, scope: !41)
!51 = !DILocation(line: 50, column: 19, scope: !41)
!52 = !DILocation(line: 50, column: 9, scope: !41)
!53 = !DILocation(line: 52, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_07_good", scope: !8, file: !8, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 105, column: 5, scope: !54)
!56 = !DILocation(line: 106, column: 5, scope: !54)
!57 = !DILocation(line: 107, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 119, type: !59, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!9, !9, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !8, line: 119, type: !9)
!63 = !DILocation(line: 119, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !8, line: 119, type: !61)
!65 = !DILocation(line: 119, column: 27, scope: !58)
!66 = !DILocation(line: 122, column: 22, scope: !58)
!67 = !DILocation(line: 122, column: 12, scope: !58)
!68 = !DILocation(line: 122, column: 5, scope: !58)
!69 = !DILocation(line: 124, column: 5, scope: !58)
!70 = !DILocation(line: 125, column: 5, scope: !58)
!71 = !DILocation(line: 126, column: 5, scope: !58)
!72 = !DILocation(line: 129, column: 5, scope: !58)
!73 = !DILocation(line: 130, column: 5, scope: !58)
!74 = !DILocation(line: 131, column: 5, scope: !58)
!75 = !DILocation(line: 133, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !8, line: 61, type: !20)
!78 = !DILocation(line: 61, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !8, line: 62, type: !24)
!80 = !DILocation(line: 62, column: 10, scope: !76)
!81 = !DILocation(line: 63, column: 12, scope: !76)
!82 = !DILocation(line: 63, column: 10, scope: !76)
!83 = !DILocation(line: 64, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !76, file: !8, line: 64, column: 8)
!85 = !DILocation(line: 64, column: 18, scope: !84)
!86 = !DILocation(line: 64, column: 8, scope: !76)
!87 = !DILocation(line: 67, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !8, line: 65, column: 5)
!89 = !DILocation(line: 68, column: 5, scope: !88)
!90 = !DILocation(line: 72, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !8, line: 70, column: 5)
!92 = !DILocation(line: 72, column: 9, scope: !91)
!93 = !DILocation(line: 73, column: 9, scope: !91)
!94 = !DILocation(line: 73, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !8, line: 76, type: !42)
!96 = distinct !DILexicalBlock(scope: !76, file: !8, line: 75, column: 5)
!97 = !DILocation(line: 76, column: 14, scope: !96)
!98 = !DILocation(line: 78, column: 18, scope: !96)
!99 = !DILocation(line: 78, column: 31, scope: !96)
!100 = !DILocation(line: 78, column: 24, scope: !96)
!101 = !DILocation(line: 78, column: 44, scope: !96)
!102 = !DILocation(line: 78, column: 9, scope: !96)
!103 = !DILocation(line: 79, column: 19, scope: !96)
!104 = !DILocation(line: 79, column: 9, scope: !96)
!105 = !DILocation(line: 81, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !8, line: 86, type: !20)
!108 = !DILocation(line: 86, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !8, line: 87, type: !24)
!110 = !DILocation(line: 87, column: 10, scope: !106)
!111 = !DILocation(line: 88, column: 12, scope: !106)
!112 = !DILocation(line: 88, column: 10, scope: !106)
!113 = !DILocation(line: 89, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !8, line: 89, column: 8)
!115 = !DILocation(line: 89, column: 18, scope: !114)
!116 = !DILocation(line: 89, column: 8, scope: !106)
!117 = !DILocation(line: 92, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !8, line: 90, column: 5)
!119 = !DILocation(line: 92, column: 9, scope: !118)
!120 = !DILocation(line: 93, column: 9, scope: !118)
!121 = !DILocation(line: 93, column: 20, scope: !118)
!122 = !DILocation(line: 94, column: 5, scope: !118)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !8, line: 96, type: !42)
!124 = distinct !DILexicalBlock(scope: !106, file: !8, line: 95, column: 5)
!125 = !DILocation(line: 96, column: 14, scope: !124)
!126 = !DILocation(line: 98, column: 18, scope: !124)
!127 = !DILocation(line: 98, column: 31, scope: !124)
!128 = !DILocation(line: 98, column: 24, scope: !124)
!129 = !DILocation(line: 98, column: 44, scope: !124)
!130 = !DILocation(line: 98, column: 9, scope: !124)
!131 = !DILocation(line: 99, column: 19, scope: !124)
!132 = !DILocation(line: 99, column: 9, scope: !124)
!133 = !DILocation(line: 101, column: 1, scope: !106)
