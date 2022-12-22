; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !33

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !34
  store i8* %call3, i8** %data, align 8, !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %cmp4 = icmp eq i8* %1, null, !dbg !39
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !40

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !48
  %3 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %call8 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %4), !dbg !53
  %5 = load i8*, i8** %data, align 8, !dbg !54
  call void @free(i8* %5) #6, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !83
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !86
  store i8* %call1, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then2, label %if.end, !dbg !92

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !95

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !96
  store i8* %call3, i8** %data, align 8, !dbg !98
  %1 = load i8*, i8** %data, align 8, !dbg !99
  %cmp4 = icmp eq i8* %1, null, !dbg !101
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !102

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !103
  unreachable, !dbg !103

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !109
  %call8 = call i8* @strcpy(i8* %3, i8* %arraydecay) #6, !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %4), !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %5) #6, !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 8, scope: !14)
!24 = !DILocation(line: 35, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 35, column: 14, scope: !25)
!27 = !DILocation(line: 36, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 36, column: 13)
!29 = !DILocation(line: 36, column: 18, scope: !28)
!30 = !DILocation(line: 36, column: 13, scope: !25)
!31 = !DILocation(line: 36, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 36, column: 27)
!33 = !DILocation(line: 37, column: 5, scope: !25)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 5)
!36 = !DILocation(line: 41, column: 14, scope: !35)
!37 = !DILocation(line: 42, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !15, line: 42, column: 13)
!39 = !DILocation(line: 42, column: 18, scope: !38)
!40 = !DILocation(line: 42, column: 13, scope: !35)
!41 = !DILocation(line: 42, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 42, column: 27)
!43 = !DILocalVariable(name: "source", scope: !44, file: !15, line: 45, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 45, column: 14, scope: !44)
!49 = !DILocation(line: 47, column: 16, scope: !44)
!50 = !DILocation(line: 47, column: 22, scope: !44)
!51 = !DILocation(line: 47, column: 9, scope: !44)
!52 = !DILocation(line: 48, column: 19, scope: !44)
!53 = !DILocation(line: 48, column: 9, scope: !44)
!54 = !DILocation(line: 49, column: 14, scope: !44)
!55 = !DILocation(line: 49, column: 9, scope: !44)
!56 = !DILocation(line: 51, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_12_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 86, column: 5, scope: !57)
!59 = !DILocation(line: 87, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !61, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 99, type: !63)
!66 = !DILocation(line: 99, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 99, type: !64)
!68 = !DILocation(line: 99, column: 27, scope: !60)
!69 = !DILocation(line: 102, column: 22, scope: !60)
!70 = !DILocation(line: 102, column: 12, scope: !60)
!71 = !DILocation(line: 102, column: 5, scope: !60)
!72 = !DILocation(line: 104, column: 5, scope: !60)
!73 = !DILocation(line: 105, column: 5, scope: !60)
!74 = !DILocation(line: 106, column: 5, scope: !60)
!75 = !DILocation(line: 109, column: 5, scope: !60)
!76 = !DILocation(line: 110, column: 5, scope: !60)
!77 = !DILocation(line: 111, column: 5, scope: !60)
!78 = !DILocation(line: 113, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 61, type: !4)
!81 = !DILocation(line: 61, column: 12, scope: !79)
!82 = !DILocation(line: 62, column: 10, scope: !79)
!83 = !DILocation(line: 63, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !15, line: 63, column: 8)
!85 = !DILocation(line: 63, column: 8, scope: !79)
!86 = !DILocation(line: 66, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !15, line: 64, column: 5)
!88 = !DILocation(line: 66, column: 14, scope: !87)
!89 = !DILocation(line: 67, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 67, column: 13)
!91 = !DILocation(line: 67, column: 18, scope: !90)
!92 = !DILocation(line: 67, column: 13, scope: !87)
!93 = !DILocation(line: 67, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 67, column: 27)
!95 = !DILocation(line: 68, column: 5, scope: !87)
!96 = !DILocation(line: 72, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !84, file: !15, line: 70, column: 5)
!98 = !DILocation(line: 72, column: 14, scope: !97)
!99 = !DILocation(line: 73, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !15, line: 73, column: 13)
!101 = !DILocation(line: 73, column: 18, scope: !100)
!102 = !DILocation(line: 73, column: 13, scope: !97)
!103 = !DILocation(line: 73, column: 28, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 73, column: 27)
!105 = !DILocalVariable(name: "source", scope: !106, file: !15, line: 76, type: !45)
!106 = distinct !DILexicalBlock(scope: !79, file: !15, line: 75, column: 5)
!107 = !DILocation(line: 76, column: 14, scope: !106)
!108 = !DILocation(line: 78, column: 16, scope: !106)
!109 = !DILocation(line: 78, column: 22, scope: !106)
!110 = !DILocation(line: 78, column: 9, scope: !106)
!111 = !DILocation(line: 79, column: 19, scope: !106)
!112 = !DILocation(line: 79, column: 9, scope: !106)
!113 = !DILocation(line: 80, column: 14, scope: !106)
!114 = !DILocation(line: 80, column: 9, scope: !106)
!115 = !DILocation(line: 82, column: 1, scope: !79)
