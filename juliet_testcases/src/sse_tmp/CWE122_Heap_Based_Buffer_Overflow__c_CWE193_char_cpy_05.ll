; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !39

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call3 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %4), !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* %5) #6, !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_good() #0 !dbg !54 {
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
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* null, i8** %data, align 8, !dbg !79
  %0 = load i32, i32* @staticFalse, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end2, !dbg !85

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !88
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %1, null, !dbg !91
  br i1 %cmp, label %if.then1, label %if.end, !dbg !92

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !99
  %call3 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !100
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !110
  %tobool = icmp ne i32 %0, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end2, !dbg !112

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !113
  store i8* %call, i8** %data, align 8, !dbg !115
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %cmp = icmp eq i8* %1, null, !dbg !118
  br i1 %cmp, label %if.then1, label %if.end, !dbg !119

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !122

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !125
  %3 = load i8*, i8** %data, align 8, !dbg !126
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !127
  %call3 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !128
  %4 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* %4), !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  call void @free(i8* %5) #6, !dbg !132
  ret void, !dbg !133
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 30, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 31, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_bad", scope: !13, file: !13, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 37, type: !6)
!25 = !DILocation(line: 37, column: 12, scope: !21)
!26 = !DILocation(line: 38, column: 10, scope: !21)
!27 = !DILocation(line: 39, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 39, column: 8)
!29 = !DILocation(line: 39, column: 8, scope: !21)
!30 = !DILocation(line: 42, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !13, line: 40, column: 5)
!32 = !DILocation(line: 42, column: 14, scope: !31)
!33 = !DILocation(line: 43, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !13, line: 43, column: 13)
!35 = !DILocation(line: 43, column: 18, scope: !34)
!36 = !DILocation(line: 43, column: 13, scope: !31)
!37 = !DILocation(line: 43, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 43, column: 27)
!39 = !DILocation(line: 44, column: 5, scope: !31)
!40 = !DILocalVariable(name: "source", scope: !41, file: !13, line: 46, type: !42)
!41 = distinct !DILexicalBlock(scope: !21, file: !13, line: 45, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 46, column: 14, scope: !41)
!46 = !DILocation(line: 48, column: 16, scope: !41)
!47 = !DILocation(line: 48, column: 22, scope: !41)
!48 = !DILocation(line: 48, column: 9, scope: !41)
!49 = !DILocation(line: 49, column: 19, scope: !41)
!50 = !DILocation(line: 49, column: 9, scope: !41)
!51 = !DILocation(line: 50, column: 14, scope: !41)
!52 = !DILocation(line: 50, column: 9, scope: !41)
!53 = !DILocation(line: 52, column: 1, scope: !21)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_05_good", scope: !13, file: !13, line: 103, type: !22, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 105, column: 5, scope: !54)
!56 = !DILocation(line: 106, column: 5, scope: !54)
!57 = !DILocation(line: 107, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 119, type: !59, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!14, !14, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !13, line: 119, type: !14)
!63 = !DILocation(line: 119, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !13, line: 119, type: !61)
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
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 59, type: !22, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !13, line: 61, type: !6)
!78 = !DILocation(line: 61, column: 12, scope: !76)
!79 = !DILocation(line: 62, column: 10, scope: !76)
!80 = !DILocation(line: 63, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !13, line: 63, column: 8)
!82 = !DILocation(line: 63, column: 8, scope: !76)
!83 = !DILocation(line: 66, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !13, line: 64, column: 5)
!85 = !DILocation(line: 67, column: 5, scope: !84)
!86 = !DILocation(line: 71, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !13, line: 69, column: 5)
!88 = !DILocation(line: 71, column: 14, scope: !87)
!89 = !DILocation(line: 72, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !13, line: 72, column: 13)
!91 = !DILocation(line: 72, column: 18, scope: !90)
!92 = !DILocation(line: 72, column: 13, scope: !87)
!93 = !DILocation(line: 72, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !13, line: 72, column: 27)
!95 = !DILocalVariable(name: "source", scope: !96, file: !13, line: 75, type: !42)
!96 = distinct !DILexicalBlock(scope: !76, file: !13, line: 74, column: 5)
!97 = !DILocation(line: 75, column: 14, scope: !96)
!98 = !DILocation(line: 77, column: 16, scope: !96)
!99 = !DILocation(line: 77, column: 22, scope: !96)
!100 = !DILocation(line: 77, column: 9, scope: !96)
!101 = !DILocation(line: 78, column: 19, scope: !96)
!102 = !DILocation(line: 78, column: 9, scope: !96)
!103 = !DILocation(line: 79, column: 14, scope: !96)
!104 = !DILocation(line: 79, column: 9, scope: !96)
!105 = !DILocation(line: 81, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 86, type: !6)
!108 = !DILocation(line: 86, column: 12, scope: !106)
!109 = !DILocation(line: 87, column: 10, scope: !106)
!110 = !DILocation(line: 88, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !13, line: 88, column: 8)
!112 = !DILocation(line: 88, column: 8, scope: !106)
!113 = !DILocation(line: 91, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !13, line: 89, column: 5)
!115 = !DILocation(line: 91, column: 14, scope: !114)
!116 = !DILocation(line: 92, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !13, line: 92, column: 13)
!118 = !DILocation(line: 92, column: 18, scope: !117)
!119 = !DILocation(line: 92, column: 13, scope: !114)
!120 = !DILocation(line: 92, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !13, line: 92, column: 27)
!122 = !DILocation(line: 93, column: 5, scope: !114)
!123 = !DILocalVariable(name: "source", scope: !124, file: !13, line: 95, type: !42)
!124 = distinct !DILexicalBlock(scope: !106, file: !13, line: 94, column: 5)
!125 = !DILocation(line: 95, column: 14, scope: !124)
!126 = !DILocation(line: 97, column: 16, scope: !124)
!127 = !DILocation(line: 97, column: 22, scope: !124)
!128 = !DILocation(line: 97, column: 9, scope: !124)
!129 = !DILocation(line: 98, column: 19, scope: !124)
!130 = !DILocation(line: 98, column: 9, scope: !124)
!131 = !DILocation(line: 99, column: 14, scope: !124)
!132 = !DILocation(line: 99, column: 9, scope: !124)
!133 = !DILocation(line: 101, column: 1, scope: !106)
