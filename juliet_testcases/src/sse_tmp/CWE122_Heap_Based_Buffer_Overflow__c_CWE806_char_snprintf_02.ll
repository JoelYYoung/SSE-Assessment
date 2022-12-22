; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %6), !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* %7) #7, !dbg !48
  ret void, !dbg !49
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
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !76
  store i8* %call, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %cmp = icmp eq i8* %0, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !97
  %6 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %6), !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  call void @free(i8* %7) #7, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %cmp = icmp eq i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !117
  %2 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !122
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !125
  %5 = load i8*, i8** %data, align 8, !dbg !126
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %6), !dbg !129
  %7 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* %7) #7, !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocation(line: 32, column: 20, scope: !14)
!21 = !DILocation(line: 32, column: 10, scope: !14)
!22 = !DILocation(line: 33, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 9)
!24 = !DILocation(line: 33, column: 14, scope: !23)
!25 = !DILocation(line: 33, column: 9, scope: !14)
!26 = !DILocation(line: 33, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 33, column: 23)
!28 = !DILocation(line: 37, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !15, line: 35, column: 5)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 8)
!31 = !DILocation(line: 37, column: 9, scope: !29)
!32 = !DILocation(line: 38, column: 9, scope: !29)
!33 = !DILocation(line: 38, column: 21, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 41, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
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
!47 = !DILocation(line: 45, column: 14, scope: !35)
!48 = !DILocation(line: 45, column: 9, scope: !35)
!49 = !DILocation(line: 47, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_02_good", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 102, column: 5, scope: !50)
!52 = !DILocation(line: 103, column: 5, scope: !50)
!53 = !DILocation(line: 104, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 116, type: !55, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 116, type: !57)
!60 = !DILocation(line: 116, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 116, type: !58)
!62 = !DILocation(line: 116, column: 27, scope: !54)
!63 = !DILocation(line: 119, column: 22, scope: !54)
!64 = !DILocation(line: 119, column: 12, scope: !54)
!65 = !DILocation(line: 119, column: 5, scope: !54)
!66 = !DILocation(line: 121, column: 5, scope: !54)
!67 = !DILocation(line: 122, column: 5, scope: !54)
!68 = !DILocation(line: 123, column: 5, scope: !54)
!69 = !DILocation(line: 126, column: 5, scope: !54)
!70 = !DILocation(line: 127, column: 5, scope: !54)
!71 = !DILocation(line: 128, column: 5, scope: !54)
!72 = !DILocation(line: 130, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 56, type: !4)
!75 = !DILocation(line: 56, column: 12, scope: !73)
!76 = !DILocation(line: 57, column: 20, scope: !73)
!77 = !DILocation(line: 57, column: 10, scope: !73)
!78 = !DILocation(line: 58, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !15, line: 58, column: 9)
!80 = !DILocation(line: 58, column: 14, scope: !79)
!81 = !DILocation(line: 58, column: 9, scope: !73)
!82 = !DILocation(line: 58, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 23)
!84 = !DILocation(line: 67, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !15, line: 65, column: 5)
!86 = distinct !DILexicalBlock(scope: !73, file: !15, line: 59, column: 8)
!87 = !DILocation(line: 67, column: 9, scope: !85)
!88 = !DILocation(line: 68, column: 9, scope: !85)
!89 = !DILocation(line: 68, column: 20, scope: !85)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !15, line: 71, type: !36)
!91 = distinct !DILexicalBlock(scope: !73, file: !15, line: 70, column: 5)
!92 = !DILocation(line: 71, column: 14, scope: !91)
!93 = !DILocation(line: 73, column: 18, scope: !91)
!94 = !DILocation(line: 73, column: 31, scope: !91)
!95 = !DILocation(line: 73, column: 24, scope: !91)
!96 = !DILocation(line: 73, column: 44, scope: !91)
!97 = !DILocation(line: 73, column: 9, scope: !91)
!98 = !DILocation(line: 74, column: 19, scope: !91)
!99 = !DILocation(line: 74, column: 9, scope: !91)
!100 = !DILocation(line: 75, column: 14, scope: !91)
!101 = !DILocation(line: 75, column: 9, scope: !91)
!102 = !DILocation(line: 77, column: 1, scope: !73)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 82, type: !4)
!105 = !DILocation(line: 82, column: 12, scope: !103)
!106 = !DILocation(line: 83, column: 20, scope: !103)
!107 = !DILocation(line: 83, column: 10, scope: !103)
!108 = !DILocation(line: 84, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !15, line: 84, column: 9)
!110 = !DILocation(line: 84, column: 14, scope: !109)
!111 = !DILocation(line: 84, column: 9, scope: !103)
!112 = !DILocation(line: 84, column: 24, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 84, column: 23)
!114 = !DILocation(line: 88, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !15, line: 86, column: 5)
!116 = distinct !DILexicalBlock(scope: !103, file: !15, line: 85, column: 8)
!117 = !DILocation(line: 88, column: 9, scope: !115)
!118 = !DILocation(line: 89, column: 9, scope: !115)
!119 = !DILocation(line: 89, column: 20, scope: !115)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !15, line: 92, type: !36)
!121 = distinct !DILexicalBlock(scope: !103, file: !15, line: 91, column: 5)
!122 = !DILocation(line: 92, column: 14, scope: !121)
!123 = !DILocation(line: 94, column: 18, scope: !121)
!124 = !DILocation(line: 94, column: 31, scope: !121)
!125 = !DILocation(line: 94, column: 24, scope: !121)
!126 = !DILocation(line: 94, column: 44, scope: !121)
!127 = !DILocation(line: 94, column: 9, scope: !121)
!128 = !DILocation(line: 95, column: 19, scope: !121)
!129 = !DILocation(line: 95, column: 9, scope: !121)
!130 = !DILocation(line: 96, column: 14, scope: !121)
!131 = !DILocation(line: 96, column: 9, scope: !121)
!132 = !DILocation(line: 98, column: 1, scope: !103)
