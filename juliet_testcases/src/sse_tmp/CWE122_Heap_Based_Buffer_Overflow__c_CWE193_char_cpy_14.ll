; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %cmp1 = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %4), !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* %5) #6, !dbg !47
  ret void, !dbg !48
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #6, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #6, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i8* null, i8** %data, align 8, !dbg !75
  %0 = load i32, i32* @globalFive, align 4, !dbg !76
  %cmp = icmp ne i32 %0, 5, !dbg !78
  br i1 %cmp, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  br label %if.end3, !dbg !82

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !85
  %1 = load i8*, i8** %data, align 8, !dbg !86
  %cmp1 = icmp eq i8* %1, null, !dbg !88
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !89

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !95
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !96
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %4), !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  call void @free(i8* %5) #6, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %0 = load i32, i32* @globalFive, align 4, !dbg !107
  %cmp = icmp eq i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.end3, !dbg !110

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !113
  %1 = load i8*, i8** %data, align 8, !dbg !114
  %cmp1 = icmp eq i8* %1, null, !dbg !116
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !120

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !123
  %3 = load i8*, i8** %data, align 8, !dbg !124
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !125
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  call void @printLine(i8* %4), !dbg !128
  %5 = load i8*, i8** %data, align 8, !dbg !129
  call void @free(i8* %5) #6, !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 18, scope: !22)
!24 = !DILocation(line: 32, column: 8, scope: !14)
!25 = !DILocation(line: 35, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!27 = !DILocation(line: 35, column: 14, scope: !26)
!28 = !DILocation(line: 36, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 36, column: 13)
!30 = !DILocation(line: 36, column: 18, scope: !29)
!31 = !DILocation(line: 36, column: 13, scope: !26)
!32 = !DILocation(line: 36, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 36, column: 27)
!34 = !DILocation(line: 37, column: 5, scope: !26)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 39, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 39, column: 14, scope: !36)
!41 = !DILocation(line: 41, column: 16, scope: !36)
!42 = !DILocation(line: 41, column: 22, scope: !36)
!43 = !DILocation(line: 41, column: 9, scope: !36)
!44 = !DILocation(line: 42, column: 19, scope: !36)
!45 = !DILocation(line: 42, column: 9, scope: !36)
!46 = !DILocation(line: 43, column: 14, scope: !36)
!47 = !DILocation(line: 43, column: 9, scope: !36)
!48 = !DILocation(line: 45, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_14_good", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 98, column: 5, scope: !49)
!51 = !DILocation(line: 99, column: 5, scope: !49)
!52 = !DILocation(line: 100, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 112, type: !54, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 112, type: !56)
!59 = !DILocation(line: 112, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 112, type: !57)
!61 = !DILocation(line: 112, column: 27, scope: !53)
!62 = !DILocation(line: 115, column: 22, scope: !53)
!63 = !DILocation(line: 115, column: 12, scope: !53)
!64 = !DILocation(line: 115, column: 5, scope: !53)
!65 = !DILocation(line: 117, column: 5, scope: !53)
!66 = !DILocation(line: 118, column: 5, scope: !53)
!67 = !DILocation(line: 119, column: 5, scope: !53)
!68 = !DILocation(line: 122, column: 5, scope: !53)
!69 = !DILocation(line: 123, column: 5, scope: !53)
!70 = !DILocation(line: 124, column: 5, scope: !53)
!71 = !DILocation(line: 126, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !15, line: 54, type: !4)
!74 = !DILocation(line: 54, column: 12, scope: !72)
!75 = !DILocation(line: 55, column: 10, scope: !72)
!76 = !DILocation(line: 56, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !15, line: 56, column: 8)
!78 = !DILocation(line: 56, column: 18, scope: !77)
!79 = !DILocation(line: 56, column: 8, scope: !72)
!80 = !DILocation(line: 59, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 57, column: 5)
!82 = !DILocation(line: 60, column: 5, scope: !81)
!83 = !DILocation(line: 64, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !15, line: 62, column: 5)
!85 = !DILocation(line: 64, column: 14, scope: !84)
!86 = !DILocation(line: 65, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !15, line: 65, column: 13)
!88 = !DILocation(line: 65, column: 18, scope: !87)
!89 = !DILocation(line: 65, column: 13, scope: !84)
!90 = !DILocation(line: 65, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 65, column: 27)
!92 = !DILocalVariable(name: "source", scope: !93, file: !15, line: 68, type: !37)
!93 = distinct !DILexicalBlock(scope: !72, file: !15, line: 67, column: 5)
!94 = !DILocation(line: 68, column: 14, scope: !93)
!95 = !DILocation(line: 70, column: 16, scope: !93)
!96 = !DILocation(line: 70, column: 22, scope: !93)
!97 = !DILocation(line: 70, column: 9, scope: !93)
!98 = !DILocation(line: 71, column: 19, scope: !93)
!99 = !DILocation(line: 71, column: 9, scope: !93)
!100 = !DILocation(line: 72, column: 14, scope: !93)
!101 = !DILocation(line: 72, column: 9, scope: !93)
!102 = !DILocation(line: 74, column: 1, scope: !72)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 79, type: !4)
!105 = !DILocation(line: 79, column: 12, scope: !103)
!106 = !DILocation(line: 80, column: 10, scope: !103)
!107 = !DILocation(line: 81, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !15, line: 81, column: 8)
!109 = !DILocation(line: 81, column: 18, scope: !108)
!110 = !DILocation(line: 81, column: 8, scope: !103)
!111 = !DILocation(line: 84, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 82, column: 5)
!113 = !DILocation(line: 84, column: 14, scope: !112)
!114 = !DILocation(line: 85, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 85, column: 13)
!116 = !DILocation(line: 85, column: 18, scope: !115)
!117 = !DILocation(line: 85, column: 13, scope: !112)
!118 = !DILocation(line: 85, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 85, column: 27)
!120 = !DILocation(line: 86, column: 5, scope: !112)
!121 = !DILocalVariable(name: "source", scope: !122, file: !15, line: 88, type: !37)
!122 = distinct !DILexicalBlock(scope: !103, file: !15, line: 87, column: 5)
!123 = !DILocation(line: 88, column: 14, scope: !122)
!124 = !DILocation(line: 90, column: 16, scope: !122)
!125 = !DILocation(line: 90, column: 22, scope: !122)
!126 = !DILocation(line: 90, column: 9, scope: !122)
!127 = !DILocation(line: 91, column: 19, scope: !122)
!128 = !DILocation(line: 91, column: 9, scope: !122)
!129 = !DILocation(line: 92, column: 14, scope: !122)
!130 = !DILocation(line: 92, column: 9, scope: !122)
!131 = !DILocation(line: 94, column: 1, scope: !103)
