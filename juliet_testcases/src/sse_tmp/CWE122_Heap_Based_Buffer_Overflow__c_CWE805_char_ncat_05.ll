; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %if.end2, !dbg !41

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx3, align 1, !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i8* @strncat(i8* %3, i8* %arraydecay4, i64 100) #6, !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %4), !dbg !55
  %5 = load i8*, i8** %data, align 8, !dbg !56
  call void @free(i8* %5) #6, !dbg !57
  ret void, !dbg !58
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* null, i8** %data, align 8, !dbg !84
  %0 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end2, !dbg !90

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !91
  store i8* %call, i8** %data, align 8, !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %cmp = icmp eq i8* %1, null, !dbg !96
  br i1 %cmp, label %if.then1, label %if.end, !dbg !97

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx3, align 1, !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  %call5 = call i8* @strncat(i8* %3, i8* %arraydecay4, i64 100) #6, !dbg !110
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !120
  %tobool = icmp ne i32 %0, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end2, !dbg !122

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !123
  store i8* %call, i8** %data, align 8, !dbg !125
  %1 = load i8*, i8** %data, align 8, !dbg !126
  %cmp = icmp eq i8* %1, null, !dbg !128
  br i1 %cmp, label %if.then1, label %if.end, !dbg !129

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  br label %if.end2, !dbg !134

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !138
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx3, align 1, !dbg !140
  %3 = load i8*, i8** %data, align 8, !dbg !141
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !142
  %call5 = call i8* @strncat(i8* %3, i8* %arraydecay4, i64 100) #6, !dbg !143
  %4 = load i8*, i8** %data, align 8, !dbg !144
  call void @printLine(i8* %4), !dbg !145
  %5 = load i8*, i8** %data, align 8, !dbg !146
  call void @free(i8* %5) #6, !dbg !147
  ret void, !dbg !148
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !21)
!30 = !DILocation(line: 37, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 18, scope: !34)
!36 = !DILocation(line: 38, column: 13, scope: !31)
!37 = !DILocation(line: 38, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 38, column: 27)
!39 = !DILocation(line: 39, column: 9, scope: !31)
!40 = !DILocation(line: 39, column: 17, scope: !31)
!41 = !DILocation(line: 40, column: 5, scope: !31)
!42 = !DILocalVariable(name: "source", scope: !43, file: !13, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !21, file: !13, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 42, column: 14, scope: !43)
!48 = !DILocation(line: 43, column: 9, scope: !43)
!49 = !DILocation(line: 44, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 23, scope: !43)
!51 = !DILocation(line: 46, column: 17, scope: !43)
!52 = !DILocation(line: 46, column: 23, scope: !43)
!53 = !DILocation(line: 46, column: 9, scope: !43)
!54 = !DILocation(line: 47, column: 19, scope: !43)
!55 = !DILocation(line: 47, column: 9, scope: !43)
!56 = !DILocation(line: 48, column: 14, scope: !43)
!57 = !DILocation(line: 48, column: 9, scope: !43)
!58 = !DILocation(line: 50, column: 1, scope: !21)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_05_good", scope: !13, file: !13, line: 107, type: !22, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 109, column: 5, scope: !59)
!61 = !DILocation(line: 110, column: 5, scope: !59)
!62 = !DILocation(line: 111, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 123, type: !64, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!14, !14, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !13, line: 123, type: !14)
!68 = !DILocation(line: 123, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !13, line: 123, type: !66)
!70 = !DILocation(line: 123, column: 27, scope: !63)
!71 = !DILocation(line: 126, column: 22, scope: !63)
!72 = !DILocation(line: 126, column: 12, scope: !63)
!73 = !DILocation(line: 126, column: 5, scope: !63)
!74 = !DILocation(line: 128, column: 5, scope: !63)
!75 = !DILocation(line: 129, column: 5, scope: !63)
!76 = !DILocation(line: 130, column: 5, scope: !63)
!77 = !DILocation(line: 133, column: 5, scope: !63)
!78 = !DILocation(line: 134, column: 5, scope: !63)
!79 = !DILocation(line: 135, column: 5, scope: !63)
!80 = !DILocation(line: 137, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !13, line: 59, type: !6)
!83 = !DILocation(line: 59, column: 12, scope: !81)
!84 = !DILocation(line: 60, column: 10, scope: !81)
!85 = !DILocation(line: 61, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !13, line: 61, column: 8)
!87 = !DILocation(line: 61, column: 8, scope: !81)
!88 = !DILocation(line: 64, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !13, line: 62, column: 5)
!90 = !DILocation(line: 65, column: 5, scope: !89)
!91 = !DILocation(line: 69, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !13, line: 67, column: 5)
!93 = !DILocation(line: 69, column: 14, scope: !92)
!94 = !DILocation(line: 70, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !13, line: 70, column: 13)
!96 = !DILocation(line: 70, column: 18, scope: !95)
!97 = !DILocation(line: 70, column: 13, scope: !92)
!98 = !DILocation(line: 70, column: 28, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !13, line: 70, column: 27)
!100 = !DILocation(line: 71, column: 9, scope: !92)
!101 = !DILocation(line: 71, column: 17, scope: !92)
!102 = !DILocalVariable(name: "source", scope: !103, file: !13, line: 74, type: !44)
!103 = distinct !DILexicalBlock(scope: !81, file: !13, line: 73, column: 5)
!104 = !DILocation(line: 74, column: 14, scope: !103)
!105 = !DILocation(line: 75, column: 9, scope: !103)
!106 = !DILocation(line: 76, column: 9, scope: !103)
!107 = !DILocation(line: 76, column: 23, scope: !103)
!108 = !DILocation(line: 78, column: 17, scope: !103)
!109 = !DILocation(line: 78, column: 23, scope: !103)
!110 = !DILocation(line: 78, column: 9, scope: !103)
!111 = !DILocation(line: 79, column: 19, scope: !103)
!112 = !DILocation(line: 79, column: 9, scope: !103)
!113 = !DILocation(line: 80, column: 14, scope: !103)
!114 = !DILocation(line: 80, column: 9, scope: !103)
!115 = !DILocation(line: 82, column: 1, scope: !81)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 85, type: !22, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !13, line: 87, type: !6)
!118 = !DILocation(line: 87, column: 12, scope: !116)
!119 = !DILocation(line: 88, column: 10, scope: !116)
!120 = !DILocation(line: 89, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !13, line: 89, column: 8)
!122 = !DILocation(line: 89, column: 8, scope: !116)
!123 = !DILocation(line: 92, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !13, line: 90, column: 5)
!125 = !DILocation(line: 92, column: 14, scope: !124)
!126 = !DILocation(line: 93, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !13, line: 93, column: 13)
!128 = !DILocation(line: 93, column: 18, scope: !127)
!129 = !DILocation(line: 93, column: 13, scope: !124)
!130 = !DILocation(line: 93, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !13, line: 93, column: 27)
!132 = !DILocation(line: 94, column: 9, scope: !124)
!133 = !DILocation(line: 94, column: 17, scope: !124)
!134 = !DILocation(line: 95, column: 5, scope: !124)
!135 = !DILocalVariable(name: "source", scope: !136, file: !13, line: 97, type: !44)
!136 = distinct !DILexicalBlock(scope: !116, file: !13, line: 96, column: 5)
!137 = !DILocation(line: 97, column: 14, scope: !136)
!138 = !DILocation(line: 98, column: 9, scope: !136)
!139 = !DILocation(line: 99, column: 9, scope: !136)
!140 = !DILocation(line: 99, column: 23, scope: !136)
!141 = !DILocation(line: 101, column: 17, scope: !136)
!142 = !DILocation(line: 101, column: 23, scope: !136)
!143 = !DILocation(line: 101, column: 9, scope: !136)
!144 = !DILocation(line: 102, column: 19, scope: !136)
!145 = !DILocation(line: 102, column: 9, scope: !136)
!146 = !DILocation(line: 103, column: 14, scope: !136)
!147 = !DILocation(line: 103, column: 9, scope: !136)
!148 = !DILocation(line: 105, column: 1, scope: !116)
