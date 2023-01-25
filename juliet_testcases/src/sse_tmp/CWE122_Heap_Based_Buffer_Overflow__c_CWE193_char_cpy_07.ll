; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %cmp1 = icmp eq i8* %1, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %4), !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %5) #6, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_good() #0 !dbg !53 {
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
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  %0 = load i32, i32* @staticFive, align 4, !dbg !79
  %cmp = icmp ne i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end3, !dbg !85

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !88
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %cmp1 = icmp eq i8* %1, null, !dbg !91
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !92

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !99
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %4), !dbg !102
  %5 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* %5) #6, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  %0 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp = icmp eq i32 %0, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.end3, !dbg !113

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %cmp1 = icmp eq i8* %1, null, !dbg !119
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !123

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !127
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !129
  %4 = load i8*, i8** %data, align 8, !dbg !130
  call void @printLine(i8* %4), !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  call void @free(i8* %5) #6, !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 30, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_bad", scope: !11, file: !11, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 36, type: !6)
!23 = !DILocation(line: 36, column: 12, scope: !19)
!24 = !DILocation(line: 37, column: 10, scope: !19)
!25 = !DILocation(line: 38, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 38, column: 8)
!27 = !DILocation(line: 38, column: 18, scope: !26)
!28 = !DILocation(line: 38, column: 8, scope: !19)
!29 = !DILocation(line: 41, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 39, column: 5)
!31 = !DILocation(line: 41, column: 14, scope: !30)
!32 = !DILocation(line: 42, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !11, line: 42, column: 13)
!34 = !DILocation(line: 42, column: 18, scope: !33)
!35 = !DILocation(line: 42, column: 13, scope: !30)
!36 = !DILocation(line: 42, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 42, column: 27)
!38 = !DILocation(line: 43, column: 5, scope: !30)
!39 = !DILocalVariable(name: "source", scope: !40, file: !11, line: 45, type: !41)
!40 = distinct !DILexicalBlock(scope: !19, file: !11, line: 44, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 45, column: 14, scope: !40)
!45 = !DILocation(line: 47, column: 16, scope: !40)
!46 = !DILocation(line: 47, column: 22, scope: !40)
!47 = !DILocation(line: 47, column: 9, scope: !40)
!48 = !DILocation(line: 48, column: 19, scope: !40)
!49 = !DILocation(line: 48, column: 9, scope: !40)
!50 = !DILocation(line: 49, column: 14, scope: !40)
!51 = !DILocation(line: 49, column: 9, scope: !40)
!52 = !DILocation(line: 51, column: 1, scope: !19)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_07_good", scope: !11, file: !11, line: 102, type: !20, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 104, column: 5, scope: !53)
!55 = !DILocation(line: 105, column: 5, scope: !53)
!56 = !DILocation(line: 106, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 118, type: !58, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!12, !12, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !11, line: 118, type: !12)
!62 = !DILocation(line: 118, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !11, line: 118, type: !60)
!64 = !DILocation(line: 118, column: 27, scope: !57)
!65 = !DILocation(line: 121, column: 22, scope: !57)
!66 = !DILocation(line: 121, column: 12, scope: !57)
!67 = !DILocation(line: 121, column: 5, scope: !57)
!68 = !DILocation(line: 123, column: 5, scope: !57)
!69 = !DILocation(line: 124, column: 5, scope: !57)
!70 = !DILocation(line: 125, column: 5, scope: !57)
!71 = !DILocation(line: 128, column: 5, scope: !57)
!72 = !DILocation(line: 129, column: 5, scope: !57)
!73 = !DILocation(line: 130, column: 5, scope: !57)
!74 = !DILocation(line: 132, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !11, line: 60, type: !6)
!77 = !DILocation(line: 60, column: 12, scope: !75)
!78 = !DILocation(line: 61, column: 10, scope: !75)
!79 = !DILocation(line: 62, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !11, line: 62, column: 8)
!81 = !DILocation(line: 62, column: 18, scope: !80)
!82 = !DILocation(line: 62, column: 8, scope: !75)
!83 = !DILocation(line: 65, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !11, line: 63, column: 5)
!85 = !DILocation(line: 66, column: 5, scope: !84)
!86 = !DILocation(line: 70, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !11, line: 68, column: 5)
!88 = !DILocation(line: 70, column: 14, scope: !87)
!89 = !DILocation(line: 71, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !11, line: 71, column: 13)
!91 = !DILocation(line: 71, column: 18, scope: !90)
!92 = !DILocation(line: 71, column: 13, scope: !87)
!93 = !DILocation(line: 71, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !11, line: 71, column: 27)
!95 = !DILocalVariable(name: "source", scope: !96, file: !11, line: 74, type: !41)
!96 = distinct !DILexicalBlock(scope: !75, file: !11, line: 73, column: 5)
!97 = !DILocation(line: 74, column: 14, scope: !96)
!98 = !DILocation(line: 76, column: 16, scope: !96)
!99 = !DILocation(line: 76, column: 22, scope: !96)
!100 = !DILocation(line: 76, column: 9, scope: !96)
!101 = !DILocation(line: 77, column: 19, scope: !96)
!102 = !DILocation(line: 77, column: 9, scope: !96)
!103 = !DILocation(line: 78, column: 14, scope: !96)
!104 = !DILocation(line: 78, column: 9, scope: !96)
!105 = !DILocation(line: 80, column: 1, scope: !75)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !11, line: 85, type: !6)
!108 = !DILocation(line: 85, column: 12, scope: !106)
!109 = !DILocation(line: 86, column: 10, scope: !106)
!110 = !DILocation(line: 87, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !11, line: 87, column: 8)
!112 = !DILocation(line: 87, column: 18, scope: !111)
!113 = !DILocation(line: 87, column: 8, scope: !106)
!114 = !DILocation(line: 90, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !11, line: 88, column: 5)
!116 = !DILocation(line: 90, column: 14, scope: !115)
!117 = !DILocation(line: 91, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !11, line: 91, column: 13)
!119 = !DILocation(line: 91, column: 18, scope: !118)
!120 = !DILocation(line: 91, column: 13, scope: !115)
!121 = !DILocation(line: 91, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !11, line: 91, column: 27)
!123 = !DILocation(line: 92, column: 5, scope: !115)
!124 = !DILocalVariable(name: "source", scope: !125, file: !11, line: 94, type: !41)
!125 = distinct !DILexicalBlock(scope: !106, file: !11, line: 93, column: 5)
!126 = !DILocation(line: 94, column: 14, scope: !125)
!127 = !DILocation(line: 96, column: 16, scope: !125)
!128 = !DILocation(line: 96, column: 22, scope: !125)
!129 = !DILocation(line: 96, column: 9, scope: !125)
!130 = !DILocation(line: 97, column: 19, scope: !125)
!131 = !DILocation(line: 97, column: 9, scope: !125)
!132 = !DILocation(line: 98, column: 14, scope: !125)
!133 = !DILocation(line: 98, column: 9, scope: !125)
!134 = !DILocation(line: 100, column: 1, scope: !106)
