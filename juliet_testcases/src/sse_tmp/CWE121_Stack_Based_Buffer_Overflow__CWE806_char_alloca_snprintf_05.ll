; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %2, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %call = call i64 @strlen(i8* %6) #6, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !49
  %8 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %8), !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05_good() #0 !dbg !53 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #7, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #7, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
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
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %0, i8** %dataBuffer, align 8, !dbg !79
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  store i8* %1, i8** %data, align 8, !dbg !82
  %2 = load i32, i32* @staticFalse, align 4, !dbg !83
  %tobool = icmp ne i32 %2, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %6 = load i8*, i8** %data, align 8, !dbg !98
  %call = call i64 @strlen(i8* %6) #6, !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !101
  %8 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %8), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 100, align 16, !dbg !110
  store i8* %0, i8** %dataBuffer, align 8, !dbg !109
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  store i8* %1, i8** %data, align 8, !dbg !112
  %2 = load i32, i32* @staticTrue, align 4, !dbg !113
  %tobool = icmp ne i32 %2, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !124
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !125
  %6 = load i8*, i8** %data, align 8, !dbg !126
  %call = call i64 @strlen(i8* %6) #6, !dbg !127
  %7 = load i8*, i8** %data, align 8, !dbg !128
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !129
  %8 = load i8*, i8** %data, align 8, !dbg !130
  call void @printLine(i8* %8), !dbg !131
  ret void, !dbg !132
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 31, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 32, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05_bad", scope: !12, file: !12, line: 36, type: !21, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 38, type: !6)
!24 = !DILocation(line: 38, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !12, line: 39, type: !6)
!26 = !DILocation(line: 39, column: 12, scope: !20)
!27 = !DILocation(line: 39, column: 33, scope: !20)
!28 = !DILocation(line: 40, column: 12, scope: !20)
!29 = !DILocation(line: 40, column: 10, scope: !20)
!30 = !DILocation(line: 41, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 8)
!32 = !DILocation(line: 41, column: 8, scope: !20)
!33 = !DILocation(line: 44, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 42, column: 5)
!35 = !DILocation(line: 44, column: 9, scope: !34)
!36 = !DILocation(line: 45, column: 9, scope: !34)
!37 = !DILocation(line: 45, column: 21, scope: !34)
!38 = !DILocation(line: 46, column: 5, scope: !34)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 48, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !12, line: 47, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 48, column: 14, scope: !40)
!45 = !DILocation(line: 50, column: 18, scope: !40)
!46 = !DILocation(line: 50, column: 31, scope: !40)
!47 = !DILocation(line: 50, column: 24, scope: !40)
!48 = !DILocation(line: 50, column: 44, scope: !40)
!49 = !DILocation(line: 50, column: 9, scope: !40)
!50 = !DILocation(line: 51, column: 19, scope: !40)
!51 = !DILocation(line: 51, column: 9, scope: !40)
!52 = !DILocation(line: 53, column: 1, scope: !20)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_05_good", scope: !12, file: !12, line: 104, type: !21, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 106, column: 5, scope: !53)
!55 = !DILocation(line: 107, column: 5, scope: !53)
!56 = !DILocation(line: 108, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !58, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!13, !13, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 120, type: !13)
!62 = !DILocation(line: 120, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 120, type: !60)
!64 = !DILocation(line: 120, column: 27, scope: !57)
!65 = !DILocation(line: 123, column: 22, scope: !57)
!66 = !DILocation(line: 123, column: 12, scope: !57)
!67 = !DILocation(line: 123, column: 5, scope: !57)
!68 = !DILocation(line: 125, column: 5, scope: !57)
!69 = !DILocation(line: 126, column: 5, scope: !57)
!70 = !DILocation(line: 127, column: 5, scope: !57)
!71 = !DILocation(line: 130, column: 5, scope: !57)
!72 = !DILocation(line: 131, column: 5, scope: !57)
!73 = !DILocation(line: 132, column: 5, scope: !57)
!74 = !DILocation(line: 134, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 62, type: !6)
!77 = !DILocation(line: 62, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 63, type: !6)
!79 = !DILocation(line: 63, column: 12, scope: !75)
!80 = !DILocation(line: 63, column: 33, scope: !75)
!81 = !DILocation(line: 64, column: 12, scope: !75)
!82 = !DILocation(line: 64, column: 10, scope: !75)
!83 = !DILocation(line: 65, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !12, line: 65, column: 8)
!85 = !DILocation(line: 65, column: 8, scope: !75)
!86 = !DILocation(line: 68, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 66, column: 5)
!88 = !DILocation(line: 69, column: 5, scope: !87)
!89 = !DILocation(line: 73, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !12, line: 71, column: 5)
!91 = !DILocation(line: 73, column: 9, scope: !90)
!92 = !DILocation(line: 74, column: 9, scope: !90)
!93 = !DILocation(line: 74, column: 20, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 77, type: !41)
!95 = distinct !DILexicalBlock(scope: !75, file: !12, line: 76, column: 5)
!96 = !DILocation(line: 77, column: 14, scope: !95)
!97 = !DILocation(line: 79, column: 18, scope: !95)
!98 = !DILocation(line: 79, column: 31, scope: !95)
!99 = !DILocation(line: 79, column: 24, scope: !95)
!100 = !DILocation(line: 79, column: 44, scope: !95)
!101 = !DILocation(line: 79, column: 9, scope: !95)
!102 = !DILocation(line: 80, column: 19, scope: !95)
!103 = !DILocation(line: 80, column: 9, scope: !95)
!104 = !DILocation(line: 82, column: 1, scope: !75)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 87, type: !6)
!107 = !DILocation(line: 87, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 88, type: !6)
!109 = !DILocation(line: 88, column: 12, scope: !105)
!110 = !DILocation(line: 88, column: 33, scope: !105)
!111 = !DILocation(line: 89, column: 12, scope: !105)
!112 = !DILocation(line: 89, column: 10, scope: !105)
!113 = !DILocation(line: 90, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !105, file: !12, line: 90, column: 8)
!115 = !DILocation(line: 90, column: 8, scope: !105)
!116 = !DILocation(line: 93, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 91, column: 5)
!118 = !DILocation(line: 93, column: 9, scope: !117)
!119 = !DILocation(line: 94, column: 9, scope: !117)
!120 = !DILocation(line: 94, column: 20, scope: !117)
!121 = !DILocation(line: 95, column: 5, scope: !117)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !12, line: 97, type: !41)
!123 = distinct !DILexicalBlock(scope: !105, file: !12, line: 96, column: 5)
!124 = !DILocation(line: 97, column: 14, scope: !123)
!125 = !DILocation(line: 99, column: 18, scope: !123)
!126 = !DILocation(line: 99, column: 31, scope: !123)
!127 = !DILocation(line: 99, column: 24, scope: !123)
!128 = !DILocation(line: 99, column: 44, scope: !123)
!129 = !DILocation(line: 99, column: 9, scope: !123)
!130 = !DILocation(line: 100, column: 19, scope: !123)
!131 = !DILocation(line: 100, column: 9, scope: !123)
!132 = !DILocation(line: 102, column: 1, scope: !105)
