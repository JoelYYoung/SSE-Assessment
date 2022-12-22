; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
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
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %3, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #6, !dbg !48
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14_good() #0 !dbg !54 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #6, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #6, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %0 = load i32, i32* @globalFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !85
  br label %if.end3, !dbg !87

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !88
  store i8* %call, i8** %data, align 8, !dbg !90
  %1 = load i8*, i8** %data, align 8, !dbg !91
  %cmp1 = icmp eq i8* %1, null, !dbg !93
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !94

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx4, align 1, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %3, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #6, !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %4), !dbg !109
  %5 = load i8*, i8** %data, align 8, !dbg !110
  call void @free(i8* %5) #6, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* null, i8** %data, align 8, !dbg !116
  %0 = load i32, i32* @globalFive, align 4, !dbg !117
  %cmp = icmp eq i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end3, !dbg !120

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !121
  store i8* %call, i8** %data, align 8, !dbg !123
  %1 = load i8*, i8** %data, align 8, !dbg !124
  %cmp1 = icmp eq i8* %1, null, !dbg !126
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !127

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  br label %if.end3, !dbg !132

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !136
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx4, align 1, !dbg !138
  %3 = load i8*, i8** %data, align 8, !dbg !139
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !140
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %3, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #6, !dbg !141
  %4 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %4), !dbg !143
  %5 = load i8*, i8** %data, align 8, !dbg !144
  call void @free(i8* %5) #6, !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocation(line: 32, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 8)
!23 = !DILocation(line: 33, column: 18, scope: !22)
!24 = !DILocation(line: 33, column: 8, scope: !14)
!25 = !DILocation(line: 36, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 5)
!27 = !DILocation(line: 36, column: 14, scope: !26)
!28 = !DILocation(line: 37, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 37, column: 13)
!30 = !DILocation(line: 37, column: 18, scope: !29)
!31 = !DILocation(line: 37, column: 13, scope: !26)
!32 = !DILocation(line: 37, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 37, column: 27)
!34 = !DILocation(line: 38, column: 9, scope: !26)
!35 = !DILocation(line: 38, column: 17, scope: !26)
!36 = !DILocation(line: 39, column: 5, scope: !26)
!37 = !DILocalVariable(name: "source", scope: !38, file: !15, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 41, column: 14, scope: !38)
!43 = !DILocation(line: 42, column: 9, scope: !38)
!44 = !DILocation(line: 43, column: 9, scope: !38)
!45 = !DILocation(line: 43, column: 23, scope: !38)
!46 = !DILocation(line: 45, column: 18, scope: !38)
!47 = !DILocation(line: 45, column: 35, scope: !38)
!48 = !DILocation(line: 45, column: 9, scope: !38)
!49 = !DILocation(line: 46, column: 19, scope: !38)
!50 = !DILocation(line: 46, column: 9, scope: !38)
!51 = !DILocation(line: 47, column: 14, scope: !38)
!52 = !DILocation(line: 47, column: 9, scope: !38)
!53 = !DILocation(line: 49, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_14_good", scope: !15, file: !15, line: 106, type: !16, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 108, column: 5, scope: !54)
!56 = !DILocation(line: 109, column: 5, scope: !54)
!57 = !DILocation(line: 110, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 122, type: !59, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 122, type: !61)
!64 = !DILocation(line: 122, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 122, type: !62)
!66 = !DILocation(line: 122, column: 27, scope: !58)
!67 = !DILocation(line: 125, column: 22, scope: !58)
!68 = !DILocation(line: 125, column: 12, scope: !58)
!69 = !DILocation(line: 125, column: 5, scope: !58)
!70 = !DILocation(line: 127, column: 5, scope: !58)
!71 = !DILocation(line: 128, column: 5, scope: !58)
!72 = !DILocation(line: 129, column: 5, scope: !58)
!73 = !DILocation(line: 132, column: 5, scope: !58)
!74 = !DILocation(line: 133, column: 5, scope: !58)
!75 = !DILocation(line: 134, column: 5, scope: !58)
!76 = !DILocation(line: 136, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 58, type: !4)
!79 = !DILocation(line: 58, column: 12, scope: !77)
!80 = !DILocation(line: 59, column: 10, scope: !77)
!81 = !DILocation(line: 60, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !15, line: 60, column: 8)
!83 = !DILocation(line: 60, column: 18, scope: !82)
!84 = !DILocation(line: 60, column: 8, scope: !77)
!85 = !DILocation(line: 63, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 61, column: 5)
!87 = !DILocation(line: 64, column: 5, scope: !86)
!88 = !DILocation(line: 68, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !15, line: 66, column: 5)
!90 = !DILocation(line: 68, column: 14, scope: !89)
!91 = !DILocation(line: 69, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !15, line: 69, column: 13)
!93 = !DILocation(line: 69, column: 18, scope: !92)
!94 = !DILocation(line: 69, column: 13, scope: !89)
!95 = !DILocation(line: 69, column: 28, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 69, column: 27)
!97 = !DILocation(line: 70, column: 9, scope: !89)
!98 = !DILocation(line: 70, column: 17, scope: !89)
!99 = !DILocalVariable(name: "source", scope: !100, file: !15, line: 73, type: !39)
!100 = distinct !DILexicalBlock(scope: !77, file: !15, line: 72, column: 5)
!101 = !DILocation(line: 73, column: 14, scope: !100)
!102 = !DILocation(line: 74, column: 9, scope: !100)
!103 = !DILocation(line: 75, column: 9, scope: !100)
!104 = !DILocation(line: 75, column: 23, scope: !100)
!105 = !DILocation(line: 77, column: 18, scope: !100)
!106 = !DILocation(line: 77, column: 35, scope: !100)
!107 = !DILocation(line: 77, column: 9, scope: !100)
!108 = !DILocation(line: 78, column: 19, scope: !100)
!109 = !DILocation(line: 78, column: 9, scope: !100)
!110 = !DILocation(line: 79, column: 14, scope: !100)
!111 = !DILocation(line: 79, column: 9, scope: !100)
!112 = !DILocation(line: 81, column: 1, scope: !77)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 86, type: !4)
!115 = !DILocation(line: 86, column: 12, scope: !113)
!116 = !DILocation(line: 87, column: 10, scope: !113)
!117 = !DILocation(line: 88, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 88, column: 8)
!119 = !DILocation(line: 88, column: 18, scope: !118)
!120 = !DILocation(line: 88, column: 8, scope: !113)
!121 = !DILocation(line: 91, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 89, column: 5)
!123 = !DILocation(line: 91, column: 14, scope: !122)
!124 = !DILocation(line: 92, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 92, column: 13)
!126 = !DILocation(line: 92, column: 18, scope: !125)
!127 = !DILocation(line: 92, column: 13, scope: !122)
!128 = !DILocation(line: 92, column: 28, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 92, column: 27)
!130 = !DILocation(line: 93, column: 9, scope: !122)
!131 = !DILocation(line: 93, column: 17, scope: !122)
!132 = !DILocation(line: 94, column: 5, scope: !122)
!133 = !DILocalVariable(name: "source", scope: !134, file: !15, line: 96, type: !39)
!134 = distinct !DILexicalBlock(scope: !113, file: !15, line: 95, column: 5)
!135 = !DILocation(line: 96, column: 14, scope: !134)
!136 = !DILocation(line: 97, column: 9, scope: !134)
!137 = !DILocation(line: 98, column: 9, scope: !134)
!138 = !DILocation(line: 98, column: 23, scope: !134)
!139 = !DILocation(line: 100, column: 18, scope: !134)
!140 = !DILocation(line: 100, column: 35, scope: !134)
!141 = !DILocation(line: 100, column: 9, scope: !134)
!142 = !DILocation(line: 101, column: 19, scope: !134)
!143 = !DILocation(line: 101, column: 9, scope: !134)
!144 = !DILocation(line: 102, column: 14, scope: !134)
!145 = !DILocation(line: 102, column: 9, scope: !134)
!146 = !DILocation(line: 104, column: 1, scope: !113)
