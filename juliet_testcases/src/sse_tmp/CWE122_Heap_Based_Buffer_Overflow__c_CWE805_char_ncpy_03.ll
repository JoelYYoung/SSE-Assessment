; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
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
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !45
  store i8 0, i8* %arrayidx4, align 1, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %4), !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* %5) #6, !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx1, align 1, !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !100
  store i8 0, i8* %arrayidx4, align 1, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %4), !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* %5) #6, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %cmp = icmp eq i8* %0, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !126
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx1, align 1, !dbg !128
  %2 = load i8*, i8** %data, align 8, !dbg !129
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !131
  %3 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !132
  store i8 0, i8* %arrayidx4, align 1, !dbg !133
  %4 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %4), !dbg !135
  %5 = load i8*, i8** %data, align 8, !dbg !136
  call void @free(i8* %5) #6, !dbg !137
  ret void, !dbg !138
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 30, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 28, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!24 = !DILocation(line: 30, column: 14, scope: !22)
!25 = !DILocation(line: 31, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 31, column: 13)
!27 = !DILocation(line: 31, column: 18, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !22)
!29 = !DILocation(line: 31, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 27)
!31 = !DILocation(line: 32, column: 9, scope: !22)
!32 = !DILocation(line: 32, column: 17, scope: !22)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocation(line: 36, column: 9, scope: !34)
!40 = !DILocation(line: 37, column: 9, scope: !34)
!41 = !DILocation(line: 37, column: 23, scope: !34)
!42 = !DILocation(line: 39, column: 17, scope: !34)
!43 = !DILocation(line: 39, column: 23, scope: !34)
!44 = !DILocation(line: 39, column: 9, scope: !34)
!45 = !DILocation(line: 40, column: 9, scope: !34)
!46 = !DILocation(line: 40, column: 21, scope: !34)
!47 = !DILocation(line: 41, column: 19, scope: !34)
!48 = !DILocation(line: 41, column: 9, scope: !34)
!49 = !DILocation(line: 42, column: 14, scope: !34)
!50 = !DILocation(line: 42, column: 9, scope: !34)
!51 = !DILocation(line: 44, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_03_good", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 105, column: 5, scope: !52)
!54 = !DILocation(line: 106, column: 5, scope: !52)
!55 = !DILocation(line: 107, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !57, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 119, type: !59)
!62 = !DILocation(line: 119, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 119, type: !60)
!64 = !DILocation(line: 119, column: 27, scope: !56)
!65 = !DILocation(line: 122, column: 22, scope: !56)
!66 = !DILocation(line: 122, column: 12, scope: !56)
!67 = !DILocation(line: 122, column: 5, scope: !56)
!68 = !DILocation(line: 124, column: 5, scope: !56)
!69 = !DILocation(line: 125, column: 5, scope: !56)
!70 = !DILocation(line: 126, column: 5, scope: !56)
!71 = !DILocation(line: 129, column: 5, scope: !56)
!72 = !DILocation(line: 130, column: 5, scope: !56)
!73 = !DILocation(line: 131, column: 5, scope: !56)
!74 = !DILocation(line: 133, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 53, type: !4)
!77 = !DILocation(line: 53, column: 12, scope: !75)
!78 = !DILocation(line: 54, column: 10, scope: !75)
!79 = !DILocation(line: 63, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !15, line: 61, column: 5)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 55, column: 8)
!82 = !DILocation(line: 63, column: 14, scope: !80)
!83 = !DILocation(line: 64, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 64, column: 13)
!85 = !DILocation(line: 64, column: 18, scope: !84)
!86 = !DILocation(line: 64, column: 13, scope: !80)
!87 = !DILocation(line: 64, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 64, column: 27)
!89 = !DILocation(line: 65, column: 9, scope: !80)
!90 = !DILocation(line: 65, column: 17, scope: !80)
!91 = !DILocalVariable(name: "source", scope: !92, file: !15, line: 68, type: !35)
!92 = distinct !DILexicalBlock(scope: !75, file: !15, line: 67, column: 5)
!93 = !DILocation(line: 68, column: 14, scope: !92)
!94 = !DILocation(line: 69, column: 9, scope: !92)
!95 = !DILocation(line: 70, column: 9, scope: !92)
!96 = !DILocation(line: 70, column: 23, scope: !92)
!97 = !DILocation(line: 72, column: 17, scope: !92)
!98 = !DILocation(line: 72, column: 23, scope: !92)
!99 = !DILocation(line: 72, column: 9, scope: !92)
!100 = !DILocation(line: 73, column: 9, scope: !92)
!101 = !DILocation(line: 73, column: 21, scope: !92)
!102 = !DILocation(line: 74, column: 19, scope: !92)
!103 = !DILocation(line: 74, column: 9, scope: !92)
!104 = !DILocation(line: 75, column: 14, scope: !92)
!105 = !DILocation(line: 75, column: 9, scope: !92)
!106 = !DILocation(line: 77, column: 1, scope: !75)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 82, type: !4)
!109 = !DILocation(line: 82, column: 12, scope: !107)
!110 = !DILocation(line: 83, column: 10, scope: !107)
!111 = !DILocation(line: 87, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !15, line: 85, column: 5)
!113 = distinct !DILexicalBlock(scope: !107, file: !15, line: 84, column: 8)
!114 = !DILocation(line: 87, column: 14, scope: !112)
!115 = !DILocation(line: 88, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 88, column: 13)
!117 = !DILocation(line: 88, column: 18, scope: !116)
!118 = !DILocation(line: 88, column: 13, scope: !112)
!119 = !DILocation(line: 88, column: 28, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 88, column: 27)
!121 = !DILocation(line: 89, column: 9, scope: !112)
!122 = !DILocation(line: 89, column: 17, scope: !112)
!123 = !DILocalVariable(name: "source", scope: !124, file: !15, line: 92, type: !35)
!124 = distinct !DILexicalBlock(scope: !107, file: !15, line: 91, column: 5)
!125 = !DILocation(line: 92, column: 14, scope: !124)
!126 = !DILocation(line: 93, column: 9, scope: !124)
!127 = !DILocation(line: 94, column: 9, scope: !124)
!128 = !DILocation(line: 94, column: 23, scope: !124)
!129 = !DILocation(line: 96, column: 17, scope: !124)
!130 = !DILocation(line: 96, column: 23, scope: !124)
!131 = !DILocation(line: 96, column: 9, scope: !124)
!132 = !DILocation(line: 97, column: 9, scope: !124)
!133 = !DILocation(line: 97, column: 21, scope: !124)
!134 = !DILocation(line: 98, column: 19, scope: !124)
!135 = !DILocation(line: 98, column: 9, scope: !124)
!136 = !DILocation(line: 99, column: 14, scope: !124)
!137 = !DILocation(line: 99, column: 9, scope: !124)
!138 = !DILocation(line: 101, column: 1, scope: !107)
