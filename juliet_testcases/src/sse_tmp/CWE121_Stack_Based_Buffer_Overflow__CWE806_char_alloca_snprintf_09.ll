; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !24
  %tobool = icmp ne i32 %2, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !29
  %4 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %6 = load i8*, i8** %data, align 8, !dbg !40
  %call = call i64 @strlen(i8* %6) #6, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !43
  %8 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %8), !dbg !45
  ret void, !dbg !46
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #7, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #7, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 100, align 16, !dbg !75
  store i8* %0, i8** %dataBuffer, align 8, !dbg !74
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  store i8* %1, i8** %data, align 8, !dbg !77
  %2 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !78
  %tobool = icmp ne i32 %2, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !81
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !91
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  %call = call i64 @strlen(i8* %6) #6, !dbg !94
  %7 = load i8*, i8** %data, align 8, !dbg !95
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !96
  %8 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %8), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 100, align 16, !dbg !105
  store i8* %0, i8** %dataBuffer, align 8, !dbg !104
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  store i8* %1, i8** %data, align 8, !dbg !107
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !108
  %tobool = icmp ne i32 %2, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !120
  %6 = load i8*, i8** %data, align 8, !dbg !121
  %call = call i64 @strlen(i8* %6) #6, !dbg !122
  %7 = load i8*, i8** %data, align 8, !dbg !123
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !124
  %8 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %8), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 32, type: !4)
!20 = !DILocation(line: 32, column: 12, scope: !13)
!21 = !DILocation(line: 32, column: 33, scope: !13)
!22 = !DILocation(line: 33, column: 12, scope: !13)
!23 = !DILocation(line: 33, column: 10, scope: !13)
!24 = !DILocation(line: 34, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 8)
!26 = !DILocation(line: 34, column: 8, scope: !13)
!27 = !DILocation(line: 37, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 35, column: 5)
!29 = !DILocation(line: 37, column: 9, scope: !28)
!30 = !DILocation(line: 38, column: 9, scope: !28)
!31 = !DILocation(line: 38, column: 21, scope: !28)
!32 = !DILocation(line: 39, column: 5, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 41, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 41, column: 14, scope: !34)
!39 = !DILocation(line: 43, column: 18, scope: !34)
!40 = !DILocation(line: 43, column: 31, scope: !34)
!41 = !DILocation(line: 43, column: 24, scope: !34)
!42 = !DILocation(line: 43, column: 44, scope: !34)
!43 = !DILocation(line: 43, column: 9, scope: !34)
!44 = !DILocation(line: 44, column: 19, scope: !34)
!45 = !DILocation(line: 44, column: 9, scope: !34)
!46 = !DILocation(line: 46, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_09_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 99, column: 5, scope: !47)
!49 = !DILocation(line: 100, column: 5, scope: !47)
!50 = !DILocation(line: 101, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 113, type: !52, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 113, type: !54)
!57 = !DILocation(line: 113, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 113, type: !55)
!59 = !DILocation(line: 113, column: 27, scope: !51)
!60 = !DILocation(line: 116, column: 22, scope: !51)
!61 = !DILocation(line: 116, column: 12, scope: !51)
!62 = !DILocation(line: 116, column: 5, scope: !51)
!63 = !DILocation(line: 118, column: 5, scope: !51)
!64 = !DILocation(line: 119, column: 5, scope: !51)
!65 = !DILocation(line: 120, column: 5, scope: !51)
!66 = !DILocation(line: 123, column: 5, scope: !51)
!67 = !DILocation(line: 124, column: 5, scope: !51)
!68 = !DILocation(line: 125, column: 5, scope: !51)
!69 = !DILocation(line: 127, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 55, type: !4)
!72 = !DILocation(line: 55, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !14, line: 56, type: !4)
!74 = !DILocation(line: 56, column: 12, scope: !70)
!75 = !DILocation(line: 56, column: 33, scope: !70)
!76 = !DILocation(line: 57, column: 12, scope: !70)
!77 = !DILocation(line: 57, column: 10, scope: !70)
!78 = !DILocation(line: 58, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !70, file: !14, line: 58, column: 8)
!80 = !DILocation(line: 58, column: 8, scope: !70)
!81 = !DILocation(line: 61, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !14, line: 59, column: 5)
!83 = !DILocation(line: 62, column: 5, scope: !82)
!84 = !DILocation(line: 66, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !14, line: 64, column: 5)
!86 = !DILocation(line: 66, column: 9, scope: !85)
!87 = !DILocation(line: 67, column: 9, scope: !85)
!88 = !DILocation(line: 67, column: 20, scope: !85)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !14, line: 70, type: !35)
!90 = distinct !DILexicalBlock(scope: !70, file: !14, line: 69, column: 5)
!91 = !DILocation(line: 70, column: 14, scope: !90)
!92 = !DILocation(line: 72, column: 18, scope: !90)
!93 = !DILocation(line: 72, column: 31, scope: !90)
!94 = !DILocation(line: 72, column: 24, scope: !90)
!95 = !DILocation(line: 72, column: 44, scope: !90)
!96 = !DILocation(line: 72, column: 9, scope: !90)
!97 = !DILocation(line: 73, column: 19, scope: !90)
!98 = !DILocation(line: 73, column: 9, scope: !90)
!99 = !DILocation(line: 75, column: 1, scope: !70)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !14, line: 80, type: !4)
!102 = !DILocation(line: 80, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !14, line: 81, type: !4)
!104 = !DILocation(line: 81, column: 12, scope: !100)
!105 = !DILocation(line: 81, column: 33, scope: !100)
!106 = !DILocation(line: 82, column: 12, scope: !100)
!107 = !DILocation(line: 82, column: 10, scope: !100)
!108 = !DILocation(line: 83, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !100, file: !14, line: 83, column: 8)
!110 = !DILocation(line: 83, column: 8, scope: !100)
!111 = !DILocation(line: 86, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !14, line: 84, column: 5)
!113 = !DILocation(line: 86, column: 9, scope: !112)
!114 = !DILocation(line: 87, column: 9, scope: !112)
!115 = !DILocation(line: 87, column: 20, scope: !112)
!116 = !DILocation(line: 88, column: 5, scope: !112)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !14, line: 90, type: !35)
!118 = distinct !DILexicalBlock(scope: !100, file: !14, line: 89, column: 5)
!119 = !DILocation(line: 90, column: 14, scope: !118)
!120 = !DILocation(line: 92, column: 18, scope: !118)
!121 = !DILocation(line: 92, column: 31, scope: !118)
!122 = !DILocation(line: 92, column: 24, scope: !118)
!123 = !DILocation(line: 92, column: 44, scope: !118)
!124 = !DILocation(line: 92, column: 9, scope: !118)
!125 = !DILocation(line: 93, column: 19, scope: !118)
!126 = !DILocation(line: 93, column: 9, scope: !118)
!127 = !DILocation(line: 95, column: 1, scope: !100)
