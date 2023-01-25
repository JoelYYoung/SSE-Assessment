; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %cmp1 = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx4, align 1, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  %call6 = call i8* @strncpy(i8* %3, i8* %arraydecay5, i64 99) #6, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !49
  store i8 0, i8* %arrayidx7, align 1, !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %5), !dbg !52
  %6 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* %6) #6, !dbg !54
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
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13_good() #0 !dbg !56 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13_bad(), !dbg !76
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
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end3, !dbg !89

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !90
  store i8* %call, i8** %data, align 8, !dbg !92
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %cmp1 = icmp eq i8* %1, null, !dbg !95
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !96

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  %call6 = call i8* @strncpy(i8* %3, i8* %arraydecay5, i64 99) #6, !dbg !109
  %4 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !110
  store i8 0, i8* %arrayidx7, align 1, !dbg !111
  %5 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* %5), !dbg !113
  %6 = load i8*, i8** %data, align 8, !dbg !114
  call void @free(i8* %6) #6, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i8* null, i8** %data, align 8, !dbg !120
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !121
  %cmp = icmp eq i32 %0, 5, !dbg !123
  br i1 %cmp, label %if.then, label %if.end3, !dbg !124

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !125
  store i8* %call, i8** %data, align 8, !dbg !127
  %1 = load i8*, i8** %data, align 8, !dbg !128
  %cmp1 = icmp eq i8* %1, null, !dbg !130
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !131

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  br label %if.end3, !dbg !136

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  %3 = load i8*, i8** %data, align 8, !dbg !143
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !144
  %call6 = call i8* @strncpy(i8* %3, i8* %arraydecay5, i64 99) #6, !dbg !145
  %4 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !146
  store i8 0, i8* %arrayidx7, align 1, !dbg !147
  %5 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %5), !dbg !149
  %6 = load i8*, i8** %data, align 8, !dbg !150
  call void @free(i8* %6) #6, !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 25, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 14, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !26)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 9, scope: !26)
!35 = !DILocation(line: 32, column: 17, scope: !26)
!36 = !DILocation(line: 33, column: 5, scope: !26)
!37 = !DILocalVariable(name: "source", scope: !38, file: !15, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 35, column: 14, scope: !38)
!43 = !DILocation(line: 36, column: 9, scope: !38)
!44 = !DILocation(line: 37, column: 9, scope: !38)
!45 = !DILocation(line: 37, column: 23, scope: !38)
!46 = !DILocation(line: 39, column: 17, scope: !38)
!47 = !DILocation(line: 39, column: 23, scope: !38)
!48 = !DILocation(line: 39, column: 9, scope: !38)
!49 = !DILocation(line: 40, column: 9, scope: !38)
!50 = !DILocation(line: 40, column: 21, scope: !38)
!51 = !DILocation(line: 41, column: 19, scope: !38)
!52 = !DILocation(line: 41, column: 9, scope: !38)
!53 = !DILocation(line: 42, column: 14, scope: !38)
!54 = !DILocation(line: 42, column: 9, scope: !38)
!55 = !DILocation(line: 44, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_13_good", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 105, column: 5, scope: !56)
!58 = !DILocation(line: 106, column: 5, scope: !56)
!59 = !DILocation(line: 107, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !61, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 119, type: !63)
!66 = !DILocation(line: 119, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 119, type: !64)
!68 = !DILocation(line: 119, column: 27, scope: !60)
!69 = !DILocation(line: 122, column: 22, scope: !60)
!70 = !DILocation(line: 122, column: 12, scope: !60)
!71 = !DILocation(line: 122, column: 5, scope: !60)
!72 = !DILocation(line: 124, column: 5, scope: !60)
!73 = !DILocation(line: 125, column: 5, scope: !60)
!74 = !DILocation(line: 126, column: 5, scope: !60)
!75 = !DILocation(line: 129, column: 5, scope: !60)
!76 = !DILocation(line: 130, column: 5, scope: !60)
!77 = !DILocation(line: 131, column: 5, scope: !60)
!78 = !DILocation(line: 133, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 53, type: !4)
!81 = !DILocation(line: 53, column: 12, scope: !79)
!82 = !DILocation(line: 54, column: 10, scope: !79)
!83 = !DILocation(line: 55, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !15, line: 55, column: 8)
!85 = !DILocation(line: 55, column: 25, scope: !84)
!86 = !DILocation(line: 55, column: 8, scope: !79)
!87 = !DILocation(line: 58, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 56, column: 5)
!89 = !DILocation(line: 59, column: 5, scope: !88)
!90 = !DILocation(line: 63, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !15, line: 61, column: 5)
!92 = !DILocation(line: 63, column: 14, scope: !91)
!93 = !DILocation(line: 64, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 64, column: 13)
!95 = !DILocation(line: 64, column: 18, scope: !94)
!96 = !DILocation(line: 64, column: 13, scope: !91)
!97 = !DILocation(line: 64, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 64, column: 27)
!99 = !DILocation(line: 65, column: 9, scope: !91)
!100 = !DILocation(line: 65, column: 17, scope: !91)
!101 = !DILocalVariable(name: "source", scope: !102, file: !15, line: 68, type: !39)
!102 = distinct !DILexicalBlock(scope: !79, file: !15, line: 67, column: 5)
!103 = !DILocation(line: 68, column: 14, scope: !102)
!104 = !DILocation(line: 69, column: 9, scope: !102)
!105 = !DILocation(line: 70, column: 9, scope: !102)
!106 = !DILocation(line: 70, column: 23, scope: !102)
!107 = !DILocation(line: 72, column: 17, scope: !102)
!108 = !DILocation(line: 72, column: 23, scope: !102)
!109 = !DILocation(line: 72, column: 9, scope: !102)
!110 = !DILocation(line: 73, column: 9, scope: !102)
!111 = !DILocation(line: 73, column: 21, scope: !102)
!112 = !DILocation(line: 74, column: 19, scope: !102)
!113 = !DILocation(line: 74, column: 9, scope: !102)
!114 = !DILocation(line: 75, column: 14, scope: !102)
!115 = !DILocation(line: 75, column: 9, scope: !102)
!116 = !DILocation(line: 77, column: 1, scope: !79)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 82, type: !4)
!119 = !DILocation(line: 82, column: 12, scope: !117)
!120 = !DILocation(line: 83, column: 10, scope: !117)
!121 = !DILocation(line: 84, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !15, line: 84, column: 8)
!123 = !DILocation(line: 84, column: 25, scope: !122)
!124 = !DILocation(line: 84, column: 8, scope: !117)
!125 = !DILocation(line: 87, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 85, column: 5)
!127 = !DILocation(line: 87, column: 14, scope: !126)
!128 = !DILocation(line: 88, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !15, line: 88, column: 13)
!130 = !DILocation(line: 88, column: 18, scope: !129)
!131 = !DILocation(line: 88, column: 13, scope: !126)
!132 = !DILocation(line: 88, column: 28, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 88, column: 27)
!134 = !DILocation(line: 89, column: 9, scope: !126)
!135 = !DILocation(line: 89, column: 17, scope: !126)
!136 = !DILocation(line: 90, column: 5, scope: !126)
!137 = !DILocalVariable(name: "source", scope: !138, file: !15, line: 92, type: !39)
!138 = distinct !DILexicalBlock(scope: !117, file: !15, line: 91, column: 5)
!139 = !DILocation(line: 92, column: 14, scope: !138)
!140 = !DILocation(line: 93, column: 9, scope: !138)
!141 = !DILocation(line: 94, column: 9, scope: !138)
!142 = !DILocation(line: 94, column: 23, scope: !138)
!143 = !DILocation(line: 96, column: 17, scope: !138)
!144 = !DILocation(line: 96, column: 23, scope: !138)
!145 = !DILocation(line: 96, column: 9, scope: !138)
!146 = !DILocation(line: 97, column: 9, scope: !138)
!147 = !DILocation(line: 97, column: 21, scope: !138)
!148 = !DILocation(line: 98, column: 19, scope: !138)
!149 = !DILocation(line: 98, column: 9, scope: !138)
!150 = !DILocation(line: 99, column: 14, scope: !138)
!151 = !DILocation(line: 99, column: 9, scope: !138)
!152 = !DILocation(line: 101, column: 1, scope: !117)
