; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx1, align 1, !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %4), !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %5) #7, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i8* null, i8** %data, align 8, !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %cmp = icmp eq i8* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !93
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx1, align 1, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !97
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !98
  store i8 0, i8* %arrayidx3, align 1, !dbg !99
  %4 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %4), !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  call void @free(i8* %5) #7, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i8* null, i8** %data, align 8, !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %cmp = icmp eq i8* %0, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx1, align 1, !dbg !126
  %2 = load i8*, i8** %data, align 8, !dbg !127
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !128
  %3 = load i8*, i8** %data, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !129
  store i8 0, i8* %arrayidx3, align 1, !dbg !130
  %4 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* %4), !dbg !132
  %5 = load i8*, i8** %data, align 8, !dbg !133
  call void @free(i8* %5) #7, !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !4)
!19 = !DILocation(line: 29, column: 12, scope: !14)
!20 = !DILocation(line: 30, column: 10, scope: !14)
!21 = !DILocation(line: 34, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 32, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 8)
!24 = !DILocation(line: 34, column: 14, scope: !22)
!25 = !DILocation(line: 35, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 13)
!27 = !DILocation(line: 35, column: 18, scope: !26)
!28 = !DILocation(line: 35, column: 13, scope: !22)
!29 = !DILocation(line: 35, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 35, column: 27)
!31 = !DILocation(line: 36, column: 9, scope: !22)
!32 = !DILocation(line: 36, column: 17, scope: !22)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 39, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 39, column: 14, scope: !34)
!39 = !DILocation(line: 40, column: 9, scope: !34)
!40 = !DILocation(line: 41, column: 9, scope: !34)
!41 = !DILocation(line: 41, column: 23, scope: !34)
!42 = !DILocation(line: 43, column: 17, scope: !34)
!43 = !DILocation(line: 43, column: 9, scope: !34)
!44 = !DILocation(line: 44, column: 9, scope: !34)
!45 = !DILocation(line: 44, column: 21, scope: !34)
!46 = !DILocation(line: 45, column: 19, scope: !34)
!47 = !DILocation(line: 45, column: 9, scope: !34)
!48 = !DILocation(line: 46, column: 14, scope: !34)
!49 = !DILocation(line: 46, column: 9, scope: !34)
!50 = !DILocation(line: 48, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_06_good", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 109, column: 5, scope: !51)
!53 = !DILocation(line: 110, column: 5, scope: !51)
!54 = !DILocation(line: 111, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 123, type: !56, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 123, type: !58)
!61 = !DILocation(line: 123, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 123, type: !59)
!63 = !DILocation(line: 123, column: 27, scope: !55)
!64 = !DILocation(line: 126, column: 22, scope: !55)
!65 = !DILocation(line: 126, column: 12, scope: !55)
!66 = !DILocation(line: 126, column: 5, scope: !55)
!67 = !DILocation(line: 128, column: 5, scope: !55)
!68 = !DILocation(line: 129, column: 5, scope: !55)
!69 = !DILocation(line: 130, column: 5, scope: !55)
!70 = !DILocation(line: 133, column: 5, scope: !55)
!71 = !DILocation(line: 134, column: 5, scope: !55)
!72 = !DILocation(line: 135, column: 5, scope: !55)
!73 = !DILocation(line: 137, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !15, line: 57, type: !4)
!76 = !DILocation(line: 57, column: 12, scope: !74)
!77 = !DILocation(line: 58, column: 10, scope: !74)
!78 = !DILocation(line: 67, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !15, line: 65, column: 5)
!80 = distinct !DILexicalBlock(scope: !74, file: !15, line: 59, column: 8)
!81 = !DILocation(line: 67, column: 14, scope: !79)
!82 = !DILocation(line: 68, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 68, column: 13)
!84 = !DILocation(line: 68, column: 18, scope: !83)
!85 = !DILocation(line: 68, column: 13, scope: !79)
!86 = !DILocation(line: 68, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 68, column: 27)
!88 = !DILocation(line: 69, column: 9, scope: !79)
!89 = !DILocation(line: 69, column: 17, scope: !79)
!90 = !DILocalVariable(name: "source", scope: !91, file: !15, line: 72, type: !35)
!91 = distinct !DILexicalBlock(scope: !74, file: !15, line: 71, column: 5)
!92 = !DILocation(line: 72, column: 14, scope: !91)
!93 = !DILocation(line: 73, column: 9, scope: !91)
!94 = !DILocation(line: 74, column: 9, scope: !91)
!95 = !DILocation(line: 74, column: 23, scope: !91)
!96 = !DILocation(line: 76, column: 17, scope: !91)
!97 = !DILocation(line: 76, column: 9, scope: !91)
!98 = !DILocation(line: 77, column: 9, scope: !91)
!99 = !DILocation(line: 77, column: 21, scope: !91)
!100 = !DILocation(line: 78, column: 19, scope: !91)
!101 = !DILocation(line: 78, column: 9, scope: !91)
!102 = !DILocation(line: 79, column: 14, scope: !91)
!103 = !DILocation(line: 79, column: 9, scope: !91)
!104 = !DILocation(line: 81, column: 1, scope: !74)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 86, type: !4)
!107 = !DILocation(line: 86, column: 12, scope: !105)
!108 = !DILocation(line: 87, column: 10, scope: !105)
!109 = !DILocation(line: 91, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !15, line: 89, column: 5)
!111 = distinct !DILexicalBlock(scope: !105, file: !15, line: 88, column: 8)
!112 = !DILocation(line: 91, column: 14, scope: !110)
!113 = !DILocation(line: 92, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 92, column: 13)
!115 = !DILocation(line: 92, column: 18, scope: !114)
!116 = !DILocation(line: 92, column: 13, scope: !110)
!117 = !DILocation(line: 92, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 92, column: 27)
!119 = !DILocation(line: 93, column: 9, scope: !110)
!120 = !DILocation(line: 93, column: 17, scope: !110)
!121 = !DILocalVariable(name: "source", scope: !122, file: !15, line: 96, type: !35)
!122 = distinct !DILexicalBlock(scope: !105, file: !15, line: 95, column: 5)
!123 = !DILocation(line: 96, column: 14, scope: !122)
!124 = !DILocation(line: 97, column: 9, scope: !122)
!125 = !DILocation(line: 98, column: 9, scope: !122)
!126 = !DILocation(line: 98, column: 23, scope: !122)
!127 = !DILocation(line: 100, column: 17, scope: !122)
!128 = !DILocation(line: 100, column: 9, scope: !122)
!129 = !DILocation(line: 101, column: 9, scope: !122)
!130 = !DILocation(line: 101, column: 21, scope: !122)
!131 = !DILocation(line: 102, column: 19, scope: !122)
!132 = !DILocation(line: 102, column: 9, scope: !122)
!133 = !DILocation(line: 103, column: 14, scope: !122)
!134 = !DILocation(line: 103, column: 9, scope: !122)
!135 = !DILocation(line: 105, column: 1, scope: !105)
