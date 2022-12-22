; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !39

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !49
  %add = add i64 %call4, 1, !dbg !50
  %call5 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %4), !dbg !53
  %5 = load i8*, i8** %data, align 8, !dbg !54
  call void @free(i8* %5) #7, !dbg !55
  ret void, !dbg !56
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
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  %0 = load i32, i32* @staticFalse, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end2, !dbg !88

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !91
  %1 = load i8*, i8** %data, align 8, !dbg !92
  %cmp = icmp eq i8* %1, null, !dbg !94
  br i1 %cmp, label %if.then1, label %if.end, !dbg !95

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !102
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !103
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !104
  %add = add i64 %call4, 1, !dbg !105
  %call5 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %4), !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* %5) #7, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i8* null, i8** %data, align 8, !dbg !115
  %0 = load i32, i32* @staticTrue, align 4, !dbg !116
  %tobool = icmp ne i32 %0, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end2, !dbg !118

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !119
  store i8* %call, i8** %data, align 8, !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %cmp = icmp eq i8* %1, null, !dbg !124
  br i1 %cmp, label %if.then1, label %if.end, !dbg !125

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !128

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !131
  %3 = load i8*, i8** %data, align 8, !dbg !132
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !133
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !134
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !135
  %add = add i64 %call4, 1, !dbg !136
  %call5 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !137
  %4 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* %4), !dbg !139
  %5 = load i8*, i8** %data, align 8, !dbg !140
  call void @free(i8* %5) #7, !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 30, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 31, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_bad", scope: !13, file: !13, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!46 = !DILocation(line: 49, column: 17, scope: !41)
!47 = !DILocation(line: 49, column: 23, scope: !41)
!48 = !DILocation(line: 49, column: 38, scope: !41)
!49 = !DILocation(line: 49, column: 31, scope: !41)
!50 = !DILocation(line: 49, column: 46, scope: !41)
!51 = !DILocation(line: 49, column: 9, scope: !41)
!52 = !DILocation(line: 50, column: 19, scope: !41)
!53 = !DILocation(line: 50, column: 9, scope: !41)
!54 = !DILocation(line: 51, column: 14, scope: !41)
!55 = !DILocation(line: 51, column: 9, scope: !41)
!56 = !DILocation(line: 53, column: 1, scope: !21)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_05_good", scope: !13, file: !13, line: 106, type: !22, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 108, column: 5, scope: !57)
!59 = !DILocation(line: 109, column: 5, scope: !57)
!60 = !DILocation(line: 110, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 122, type: !62, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!14, !14, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !13, line: 122, type: !14)
!66 = !DILocation(line: 122, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !13, line: 122, type: !64)
!68 = !DILocation(line: 122, column: 27, scope: !61)
!69 = !DILocation(line: 125, column: 22, scope: !61)
!70 = !DILocation(line: 125, column: 12, scope: !61)
!71 = !DILocation(line: 125, column: 5, scope: !61)
!72 = !DILocation(line: 127, column: 5, scope: !61)
!73 = !DILocation(line: 128, column: 5, scope: !61)
!74 = !DILocation(line: 129, column: 5, scope: !61)
!75 = !DILocation(line: 132, column: 5, scope: !61)
!76 = !DILocation(line: 133, column: 5, scope: !61)
!77 = !DILocation(line: 134, column: 5, scope: !61)
!78 = !DILocation(line: 136, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !13, line: 62, type: !6)
!81 = !DILocation(line: 62, column: 12, scope: !79)
!82 = !DILocation(line: 63, column: 10, scope: !79)
!83 = !DILocation(line: 64, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !13, line: 64, column: 8)
!85 = !DILocation(line: 64, column: 8, scope: !79)
!86 = !DILocation(line: 67, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !13, line: 65, column: 5)
!88 = !DILocation(line: 68, column: 5, scope: !87)
!89 = !DILocation(line: 72, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !13, line: 70, column: 5)
!91 = !DILocation(line: 72, column: 14, scope: !90)
!92 = !DILocation(line: 73, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !13, line: 73, column: 13)
!94 = !DILocation(line: 73, column: 18, scope: !93)
!95 = !DILocation(line: 73, column: 13, scope: !90)
!96 = !DILocation(line: 73, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !13, line: 73, column: 27)
!98 = !DILocalVariable(name: "source", scope: !99, file: !13, line: 76, type: !42)
!99 = distinct !DILexicalBlock(scope: !79, file: !13, line: 75, column: 5)
!100 = !DILocation(line: 76, column: 14, scope: !99)
!101 = !DILocation(line: 79, column: 17, scope: !99)
!102 = !DILocation(line: 79, column: 23, scope: !99)
!103 = !DILocation(line: 79, column: 38, scope: !99)
!104 = !DILocation(line: 79, column: 31, scope: !99)
!105 = !DILocation(line: 79, column: 46, scope: !99)
!106 = !DILocation(line: 79, column: 9, scope: !99)
!107 = !DILocation(line: 80, column: 19, scope: !99)
!108 = !DILocation(line: 80, column: 9, scope: !99)
!109 = !DILocation(line: 81, column: 14, scope: !99)
!110 = !DILocation(line: 81, column: 9, scope: !99)
!111 = !DILocation(line: 83, column: 1, scope: !79)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 86, type: !22, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 88, type: !6)
!114 = !DILocation(line: 88, column: 12, scope: !112)
!115 = !DILocation(line: 89, column: 10, scope: !112)
!116 = !DILocation(line: 90, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !13, line: 90, column: 8)
!118 = !DILocation(line: 90, column: 8, scope: !112)
!119 = !DILocation(line: 93, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !13, line: 91, column: 5)
!121 = !DILocation(line: 93, column: 14, scope: !120)
!122 = !DILocation(line: 94, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !13, line: 94, column: 13)
!124 = !DILocation(line: 94, column: 18, scope: !123)
!125 = !DILocation(line: 94, column: 13, scope: !120)
!126 = !DILocation(line: 94, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 94, column: 27)
!128 = !DILocation(line: 95, column: 5, scope: !120)
!129 = !DILocalVariable(name: "source", scope: !130, file: !13, line: 97, type: !42)
!130 = distinct !DILexicalBlock(scope: !112, file: !13, line: 96, column: 5)
!131 = !DILocation(line: 97, column: 14, scope: !130)
!132 = !DILocation(line: 100, column: 17, scope: !130)
!133 = !DILocation(line: 100, column: 23, scope: !130)
!134 = !DILocation(line: 100, column: 38, scope: !130)
!135 = !DILocation(line: 100, column: 31, scope: !130)
!136 = !DILocation(line: 100, column: 46, scope: !130)
!137 = !DILocation(line: 100, column: 9, scope: !130)
!138 = !DILocation(line: 101, column: 19, scope: !130)
!139 = !DILocation(line: 101, column: 9, scope: !130)
!140 = !DILocation(line: 102, column: 14, scope: !130)
!141 = !DILocation(line: 102, column: 9, scope: !130)
!142 = !DILocation(line: 104, column: 1, scope: !112)
