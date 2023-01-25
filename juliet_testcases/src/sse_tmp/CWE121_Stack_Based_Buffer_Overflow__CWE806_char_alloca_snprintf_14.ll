; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14_bad() #0 !dbg !13 {
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
  %2 = load i32, i32* @globalFive, align 4, !dbg !24
  %cmp = icmp eq i32 %2, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !40
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %call = call i64 @strlen(i8* %6) #6, !dbg !42
  %7 = load i8*, i8** %data, align 8, !dbg !43
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !44
  %8 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %8), !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 100, align 16, !dbg !76
  store i8* %0, i8** %dataBuffer, align 8, !dbg !75
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  store i8* %1, i8** %data, align 8, !dbg !78
  %2 = load i32, i32* @globalFive, align 4, !dbg !79
  %cmp = icmp ne i32 %2, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !94
  %6 = load i8*, i8** %data, align 8, !dbg !95
  %call = call i64 @strlen(i8* %6) #6, !dbg !96
  %7 = load i8*, i8** %data, align 8, !dbg !97
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !98
  %8 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* %8), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %0, i8** %dataBuffer, align 8, !dbg !106
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  store i8* %1, i8** %data, align 8, !dbg !109
  %2 = load i32, i32* @globalFive, align 4, !dbg !110
  %cmp = icmp eq i32 %2, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !122
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !123
  %6 = load i8*, i8** %data, align 8, !dbg !124
  %call = call i64 @strlen(i8* %6) #6, !dbg !125
  %7 = load i8*, i8** %data, align 8, !dbg !126
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !127
  %8 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %8), !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!26 = !DILocation(line: 34, column: 18, scope: !25)
!27 = !DILocation(line: 34, column: 8, scope: !13)
!28 = !DILocation(line: 37, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !14, line: 35, column: 5)
!30 = !DILocation(line: 37, column: 9, scope: !29)
!31 = !DILocation(line: 38, column: 9, scope: !29)
!32 = !DILocation(line: 38, column: 21, scope: !29)
!33 = !DILocation(line: 39, column: 5, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 41, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 41, column: 14, scope: !35)
!40 = !DILocation(line: 43, column: 18, scope: !35)
!41 = !DILocation(line: 43, column: 31, scope: !35)
!42 = !DILocation(line: 43, column: 24, scope: !35)
!43 = !DILocation(line: 43, column: 44, scope: !35)
!44 = !DILocation(line: 43, column: 9, scope: !35)
!45 = !DILocation(line: 44, column: 19, scope: !35)
!46 = !DILocation(line: 44, column: 9, scope: !35)
!47 = !DILocation(line: 46, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_14_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 99, column: 5, scope: !48)
!50 = !DILocation(line: 100, column: 5, scope: !48)
!51 = !DILocation(line: 101, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 113, type: !53, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 113, type: !55)
!58 = !DILocation(line: 113, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 113, type: !56)
!60 = !DILocation(line: 113, column: 27, scope: !52)
!61 = !DILocation(line: 116, column: 22, scope: !52)
!62 = !DILocation(line: 116, column: 12, scope: !52)
!63 = !DILocation(line: 116, column: 5, scope: !52)
!64 = !DILocation(line: 118, column: 5, scope: !52)
!65 = !DILocation(line: 119, column: 5, scope: !52)
!66 = !DILocation(line: 120, column: 5, scope: !52)
!67 = !DILocation(line: 123, column: 5, scope: !52)
!68 = !DILocation(line: 124, column: 5, scope: !52)
!69 = !DILocation(line: 125, column: 5, scope: !52)
!70 = !DILocation(line: 127, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 55, type: !4)
!73 = !DILocation(line: 55, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !14, line: 56, type: !4)
!75 = !DILocation(line: 56, column: 12, scope: !71)
!76 = !DILocation(line: 56, column: 33, scope: !71)
!77 = !DILocation(line: 57, column: 12, scope: !71)
!78 = !DILocation(line: 57, column: 10, scope: !71)
!79 = !DILocation(line: 58, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !14, line: 58, column: 8)
!81 = !DILocation(line: 58, column: 18, scope: !80)
!82 = !DILocation(line: 58, column: 8, scope: !71)
!83 = !DILocation(line: 61, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !14, line: 59, column: 5)
!85 = !DILocation(line: 62, column: 5, scope: !84)
!86 = !DILocation(line: 66, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !14, line: 64, column: 5)
!88 = !DILocation(line: 66, column: 9, scope: !87)
!89 = !DILocation(line: 67, column: 9, scope: !87)
!90 = !DILocation(line: 67, column: 20, scope: !87)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !14, line: 70, type: !36)
!92 = distinct !DILexicalBlock(scope: !71, file: !14, line: 69, column: 5)
!93 = !DILocation(line: 70, column: 14, scope: !92)
!94 = !DILocation(line: 72, column: 18, scope: !92)
!95 = !DILocation(line: 72, column: 31, scope: !92)
!96 = !DILocation(line: 72, column: 24, scope: !92)
!97 = !DILocation(line: 72, column: 44, scope: !92)
!98 = !DILocation(line: 72, column: 9, scope: !92)
!99 = !DILocation(line: 73, column: 19, scope: !92)
!100 = !DILocation(line: 73, column: 9, scope: !92)
!101 = !DILocation(line: 75, column: 1, scope: !71)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !14, line: 80, type: !4)
!104 = !DILocation(line: 80, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !14, line: 81, type: !4)
!106 = !DILocation(line: 81, column: 12, scope: !102)
!107 = !DILocation(line: 81, column: 33, scope: !102)
!108 = !DILocation(line: 82, column: 12, scope: !102)
!109 = !DILocation(line: 82, column: 10, scope: !102)
!110 = !DILocation(line: 83, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !102, file: !14, line: 83, column: 8)
!112 = !DILocation(line: 83, column: 18, scope: !111)
!113 = !DILocation(line: 83, column: 8, scope: !102)
!114 = !DILocation(line: 86, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !14, line: 84, column: 5)
!116 = !DILocation(line: 86, column: 9, scope: !115)
!117 = !DILocation(line: 87, column: 9, scope: !115)
!118 = !DILocation(line: 87, column: 20, scope: !115)
!119 = !DILocation(line: 88, column: 5, scope: !115)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !14, line: 90, type: !36)
!121 = distinct !DILexicalBlock(scope: !102, file: !14, line: 89, column: 5)
!122 = !DILocation(line: 90, column: 14, scope: !121)
!123 = !DILocation(line: 92, column: 18, scope: !121)
!124 = !DILocation(line: 92, column: 31, scope: !121)
!125 = !DILocation(line: 92, column: 24, scope: !121)
!126 = !DILocation(line: 92, column: 44, scope: !121)
!127 = !DILocation(line: 92, column: 9, scope: !121)
!128 = !DILocation(line: 93, column: 19, scope: !121)
!129 = !DILocation(line: 93, column: 9, scope: !121)
!130 = !DILocation(line: 95, column: 1, scope: !102)
