; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %cmp1 = icmp eq i8* %1, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx4, align 1, !dbg !49
  %3 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  %call6 = call i8* @strncat(i8* %3, i8* %arraydecay5, i64 100) #6, !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %4), !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  call void @free(i8* %5) #6, !dbg !56
  ret void, !dbg !57
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
declare dso_local i8* @strncat(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end3, !dbg !90

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !91
  store i8* %call, i8** %data, align 8, !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %cmp1 = icmp eq i8* %1, null, !dbg !96
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx4, align 1, !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  %call6 = call i8* @strncat(i8* %3, i8* %arraydecay5, i64 100) #6, !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %4), !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %5) #6, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i8* null, i8** %data, align 8, !dbg !119
  %0 = load i32, i32* @staticFive, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end3, !dbg !123

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !124
  store i8* %call, i8** %data, align 8, !dbg !126
  %1 = load i8*, i8** %data, align 8, !dbg !127
  %cmp1 = icmp eq i8* %1, null, !dbg !129
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !130

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !131
  unreachable, !dbg !131

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  br label %if.end3, !dbg !135

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx4, align 1, !dbg !141
  %3 = load i8*, i8** %data, align 8, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !143
  %call6 = call i8* @strncat(i8* %3, i8* %arraydecay5, i64 100) #6, !dbg !144
  %4 = load i8*, i8** %data, align 8, !dbg !145
  call void @printLine(i8* %4), !dbg !146
  %5 = load i8*, i8** %data, align 8, !dbg !147
  call void @free(i8* %5) #6, !dbg !148
  ret void, !dbg !149
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 10, scope: !19)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !19)
!29 = !DILocation(line: 36, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 34, column: 5)
!31 = !DILocation(line: 36, column: 14, scope: !30)
!32 = !DILocation(line: 37, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 13)
!34 = !DILocation(line: 37, column: 18, scope: !33)
!35 = !DILocation(line: 37, column: 13, scope: !30)
!36 = !DILocation(line: 37, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 37, column: 27)
!38 = !DILocation(line: 38, column: 9, scope: !30)
!39 = !DILocation(line: 38, column: 17, scope: !30)
!40 = !DILocation(line: 39, column: 5, scope: !30)
!41 = !DILocalVariable(name: "source", scope: !42, file: !11, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !11, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 41, column: 14, scope: !42)
!47 = !DILocation(line: 42, column: 9, scope: !42)
!48 = !DILocation(line: 43, column: 9, scope: !42)
!49 = !DILocation(line: 43, column: 23, scope: !42)
!50 = !DILocation(line: 45, column: 17, scope: !42)
!51 = !DILocation(line: 45, column: 23, scope: !42)
!52 = !DILocation(line: 45, column: 9, scope: !42)
!53 = !DILocation(line: 46, column: 19, scope: !42)
!54 = !DILocation(line: 46, column: 9, scope: !42)
!55 = !DILocation(line: 47, column: 14, scope: !42)
!56 = !DILocation(line: 47, column: 9, scope: !42)
!57 = !DILocation(line: 49, column: 1, scope: !19)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_07_good", scope: !11, file: !11, line: 106, type: !20, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 108, column: 5, scope: !58)
!60 = !DILocation(line: 109, column: 5, scope: !58)
!61 = !DILocation(line: 110, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 122, type: !63, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!12, !12, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !11, line: 122, type: !12)
!67 = !DILocation(line: 122, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !11, line: 122, type: !65)
!69 = !DILocation(line: 122, column: 27, scope: !62)
!70 = !DILocation(line: 125, column: 22, scope: !62)
!71 = !DILocation(line: 125, column: 12, scope: !62)
!72 = !DILocation(line: 125, column: 5, scope: !62)
!73 = !DILocation(line: 127, column: 5, scope: !62)
!74 = !DILocation(line: 128, column: 5, scope: !62)
!75 = !DILocation(line: 129, column: 5, scope: !62)
!76 = !DILocation(line: 132, column: 5, scope: !62)
!77 = !DILocation(line: 133, column: 5, scope: !62)
!78 = !DILocation(line: 134, column: 5, scope: !62)
!79 = !DILocation(line: 136, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !11, line: 58, type: !6)
!82 = !DILocation(line: 58, column: 12, scope: !80)
!83 = !DILocation(line: 59, column: 10, scope: !80)
!84 = !DILocation(line: 60, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !11, line: 60, column: 8)
!86 = !DILocation(line: 60, column: 18, scope: !85)
!87 = !DILocation(line: 60, column: 8, scope: !80)
!88 = !DILocation(line: 63, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !11, line: 61, column: 5)
!90 = !DILocation(line: 64, column: 5, scope: !89)
!91 = !DILocation(line: 68, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !11, line: 66, column: 5)
!93 = !DILocation(line: 68, column: 14, scope: !92)
!94 = !DILocation(line: 69, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !11, line: 69, column: 13)
!96 = !DILocation(line: 69, column: 18, scope: !95)
!97 = !DILocation(line: 69, column: 13, scope: !92)
!98 = !DILocation(line: 69, column: 28, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !11, line: 69, column: 27)
!100 = !DILocation(line: 70, column: 9, scope: !92)
!101 = !DILocation(line: 70, column: 17, scope: !92)
!102 = !DILocalVariable(name: "source", scope: !103, file: !11, line: 73, type: !43)
!103 = distinct !DILexicalBlock(scope: !80, file: !11, line: 72, column: 5)
!104 = !DILocation(line: 73, column: 14, scope: !103)
!105 = !DILocation(line: 74, column: 9, scope: !103)
!106 = !DILocation(line: 75, column: 9, scope: !103)
!107 = !DILocation(line: 75, column: 23, scope: !103)
!108 = !DILocation(line: 77, column: 17, scope: !103)
!109 = !DILocation(line: 77, column: 23, scope: !103)
!110 = !DILocation(line: 77, column: 9, scope: !103)
!111 = !DILocation(line: 78, column: 19, scope: !103)
!112 = !DILocation(line: 78, column: 9, scope: !103)
!113 = !DILocation(line: 79, column: 14, scope: !103)
!114 = !DILocation(line: 79, column: 9, scope: !103)
!115 = !DILocation(line: 81, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !11, line: 86, type: !6)
!118 = !DILocation(line: 86, column: 12, scope: !116)
!119 = !DILocation(line: 87, column: 10, scope: !116)
!120 = !DILocation(line: 88, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !11, line: 88, column: 8)
!122 = !DILocation(line: 88, column: 18, scope: !121)
!123 = !DILocation(line: 88, column: 8, scope: !116)
!124 = !DILocation(line: 91, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !11, line: 89, column: 5)
!126 = !DILocation(line: 91, column: 14, scope: !125)
!127 = !DILocation(line: 92, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !11, line: 92, column: 13)
!129 = !DILocation(line: 92, column: 18, scope: !128)
!130 = !DILocation(line: 92, column: 13, scope: !125)
!131 = !DILocation(line: 92, column: 28, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !11, line: 92, column: 27)
!133 = !DILocation(line: 93, column: 9, scope: !125)
!134 = !DILocation(line: 93, column: 17, scope: !125)
!135 = !DILocation(line: 94, column: 5, scope: !125)
!136 = !DILocalVariable(name: "source", scope: !137, file: !11, line: 96, type: !43)
!137 = distinct !DILexicalBlock(scope: !116, file: !11, line: 95, column: 5)
!138 = !DILocation(line: 96, column: 14, scope: !137)
!139 = !DILocation(line: 97, column: 9, scope: !137)
!140 = !DILocation(line: 98, column: 9, scope: !137)
!141 = !DILocation(line: 98, column: 23, scope: !137)
!142 = !DILocation(line: 100, column: 17, scope: !137)
!143 = !DILocation(line: 100, column: 23, scope: !137)
!144 = !DILocation(line: 100, column: 9, scope: !137)
!145 = !DILocation(line: 101, column: 19, scope: !137)
!146 = !DILocation(line: 101, column: 9, scope: !137)
!147 = !DILocation(line: 102, column: 14, scope: !137)
!148 = !DILocation(line: 102, column: 9, scope: !137)
!149 = !DILocation(line: 104, column: 1, scope: !116)
