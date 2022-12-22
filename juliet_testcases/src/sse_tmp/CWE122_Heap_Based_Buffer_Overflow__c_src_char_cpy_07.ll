; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp1 = icmp eq i32 %1, 5, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !35

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* %5) #6, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %6), !dbg !52
  %7 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* %7) #6, !dbg !54
  ret void, !dbg !55
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
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_good() #0 !dbg !56 {
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
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp1 = icmp ne i32 %1, 5, !dbg !91
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !92

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end3, !dbg !95

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !105
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* %5) #6, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %6), !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* %7) #6, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !115
  store i8* %call, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %0, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !123
  %cmp1 = icmp eq i32 %1, 5, !dbg !125
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !126

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !129
  %3 = load i8*, i8** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  br label %if.end3, !dbg !132

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !135
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !136
  %5 = load i8*, i8** %data, align 8, !dbg !137
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* %5) #6, !dbg !138
  %6 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %6), !dbg !140
  %7 = load i8*, i8** %data, align 8, !dbg !141
  call void @free(i8* %7) #6, !dbg !142
  ret void, !dbg !143
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07.c", directory: "/root/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 20, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocation(line: 33, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 9)
!28 = !DILocation(line: 33, column: 14, scope: !27)
!29 = !DILocation(line: 33, column: 9, scope: !19)
!30 = !DILocation(line: 33, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !11, line: 33, column: 23)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !11, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 8, scope: !19)
!36 = !DILocation(line: 37, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 35, column: 5)
!38 = !DILocation(line: 37, column: 9, scope: !37)
!39 = !DILocation(line: 38, column: 9, scope: !37)
!40 = !DILocation(line: 38, column: 21, scope: !37)
!41 = !DILocation(line: 39, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !11, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !11, line: 40, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 41, column: 14, scope: !43)
!48 = !DILocation(line: 43, column: 16, scope: !43)
!49 = !DILocation(line: 43, column: 22, scope: !43)
!50 = !DILocation(line: 43, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 19, scope: !43)
!52 = !DILocation(line: 44, column: 9, scope: !43)
!53 = !DILocation(line: 45, column: 14, scope: !43)
!54 = !DILocation(line: 45, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 1, scope: !19)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_good", scope: !11, file: !11, line: 100, type: !20, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 102, column: 5, scope: !56)
!58 = !DILocation(line: 103, column: 5, scope: !56)
!59 = !DILocation(line: 104, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 116, type: !61, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!12, !12, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !11, line: 116, type: !12)
!65 = !DILocation(line: 116, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !11, line: 116, type: !63)
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
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !11, line: 56, type: !6)
!80 = !DILocation(line: 56, column: 12, scope: !78)
!81 = !DILocation(line: 57, column: 20, scope: !78)
!82 = !DILocation(line: 57, column: 10, scope: !78)
!83 = !DILocation(line: 58, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !11, line: 58, column: 9)
!85 = !DILocation(line: 58, column: 14, scope: !84)
!86 = !DILocation(line: 58, column: 9, scope: !78)
!87 = !DILocation(line: 58, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !11, line: 58, column: 23)
!89 = !DILocation(line: 59, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !11, line: 59, column: 8)
!91 = !DILocation(line: 59, column: 18, scope: !90)
!92 = !DILocation(line: 59, column: 8, scope: !78)
!93 = !DILocation(line: 62, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !11, line: 60, column: 5)
!95 = !DILocation(line: 63, column: 5, scope: !94)
!96 = !DILocation(line: 67, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !11, line: 65, column: 5)
!98 = !DILocation(line: 67, column: 9, scope: !97)
!99 = !DILocation(line: 68, column: 9, scope: !97)
!100 = !DILocation(line: 68, column: 20, scope: !97)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !11, line: 71, type: !44)
!102 = distinct !DILexicalBlock(scope: !78, file: !11, line: 70, column: 5)
!103 = !DILocation(line: 71, column: 14, scope: !102)
!104 = !DILocation(line: 73, column: 16, scope: !102)
!105 = !DILocation(line: 73, column: 22, scope: !102)
!106 = !DILocation(line: 73, column: 9, scope: !102)
!107 = !DILocation(line: 74, column: 19, scope: !102)
!108 = !DILocation(line: 74, column: 9, scope: !102)
!109 = !DILocation(line: 75, column: 14, scope: !102)
!110 = !DILocation(line: 75, column: 9, scope: !102)
!111 = !DILocation(line: 77, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !11, line: 82, type: !6)
!114 = !DILocation(line: 82, column: 12, scope: !112)
!115 = !DILocation(line: 83, column: 20, scope: !112)
!116 = !DILocation(line: 83, column: 10, scope: !112)
!117 = !DILocation(line: 84, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !11, line: 84, column: 9)
!119 = !DILocation(line: 84, column: 14, scope: !118)
!120 = !DILocation(line: 84, column: 9, scope: !112)
!121 = !DILocation(line: 84, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !11, line: 84, column: 23)
!123 = !DILocation(line: 85, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !11, line: 85, column: 8)
!125 = !DILocation(line: 85, column: 18, scope: !124)
!126 = !DILocation(line: 85, column: 8, scope: !112)
!127 = !DILocation(line: 88, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !11, line: 86, column: 5)
!129 = !DILocation(line: 88, column: 9, scope: !128)
!130 = !DILocation(line: 89, column: 9, scope: !128)
!131 = !DILocation(line: 89, column: 20, scope: !128)
!132 = !DILocation(line: 90, column: 5, scope: !128)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !11, line: 92, type: !44)
!134 = distinct !DILexicalBlock(scope: !112, file: !11, line: 91, column: 5)
!135 = !DILocation(line: 92, column: 14, scope: !134)
!136 = !DILocation(line: 94, column: 16, scope: !134)
!137 = !DILocation(line: 94, column: 22, scope: !134)
!138 = !DILocation(line: 94, column: 9, scope: !134)
!139 = !DILocation(line: 95, column: 19, scope: !134)
!140 = !DILocation(line: 95, column: 9, scope: !134)
!141 = !DILocation(line: 96, column: 14, scope: !134)
!142 = !DILocation(line: 96, column: 9, scope: !134)
!143 = !DILocation(line: 98, column: 1, scope: !112)
