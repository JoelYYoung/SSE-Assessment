; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !43
  store i8 0, i8* %arrayidx4, align 1, !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %4), !dbg !46
  %5 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* %5) #6, !dbg !48
  ret void, !dbg !49
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i8* null, i8** %data, align 8, !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !77
  store i8* %call, i8** %data, align 8, !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  %cmp = icmp eq i8* %0, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !90
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !91
  store i8 0, i8* %arrayidx1, align 1, !dbg !92
  %2 = load i8*, i8** %data, align 8, !dbg !93
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !96
  store i8 0, i8* %arrayidx4, align 1, !dbg !97
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
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %cmp = icmp eq i8* %0, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx1, align 1, !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !123
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !125
  %3 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !126
  store i8 0, i8* %arrayidx4, align 1, !dbg !127
  %4 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %4), !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* %5) #6, !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 31, column: 24, scope: !14)
!22 = !DILocation(line: 31, column: 14, scope: !14)
!23 = !DILocation(line: 32, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 13)
!25 = !DILocation(line: 32, column: 18, scope: !24)
!26 = !DILocation(line: 32, column: 13, scope: !14)
!27 = !DILocation(line: 32, column: 28, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 27)
!29 = !DILocation(line: 33, column: 9, scope: !14)
!30 = !DILocation(line: 33, column: 17, scope: !14)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 41, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 41, column: 14, scope: !32)
!37 = !DILocation(line: 42, column: 9, scope: !32)
!38 = !DILocation(line: 43, column: 9, scope: !32)
!39 = !DILocation(line: 43, column: 23, scope: !32)
!40 = !DILocation(line: 45, column: 17, scope: !32)
!41 = !DILocation(line: 45, column: 23, scope: !32)
!42 = !DILocation(line: 45, column: 9, scope: !32)
!43 = !DILocation(line: 46, column: 9, scope: !32)
!44 = !DILocation(line: 46, column: 21, scope: !32)
!45 = !DILocation(line: 47, column: 19, scope: !32)
!46 = !DILocation(line: 47, column: 9, scope: !32)
!47 = !DILocation(line: 48, column: 14, scope: !32)
!48 = !DILocation(line: 48, column: 9, scope: !32)
!49 = !DILocation(line: 50, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_15_good", scope: !15, file: !15, line: 116, type: !16, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 118, column: 5, scope: !50)
!52 = !DILocation(line: 119, column: 5, scope: !50)
!53 = !DILocation(line: 120, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 132, type: !55, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 132, type: !57)
!60 = !DILocation(line: 132, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 132, type: !58)
!62 = !DILocation(line: 132, column: 27, scope: !54)
!63 = !DILocation(line: 135, column: 22, scope: !54)
!64 = !DILocation(line: 135, column: 12, scope: !54)
!65 = !DILocation(line: 135, column: 5, scope: !54)
!66 = !DILocation(line: 137, column: 5, scope: !54)
!67 = !DILocation(line: 138, column: 5, scope: !54)
!68 = !DILocation(line: 139, column: 5, scope: !54)
!69 = !DILocation(line: 142, column: 5, scope: !54)
!70 = !DILocation(line: 143, column: 5, scope: !54)
!71 = !DILocation(line: 144, column: 5, scope: !54)
!72 = !DILocation(line: 146, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 59, type: !4)
!75 = !DILocation(line: 59, column: 12, scope: !73)
!76 = !DILocation(line: 60, column: 10, scope: !73)
!77 = !DILocation(line: 69, column: 24, scope: !73)
!78 = !DILocation(line: 69, column: 14, scope: !73)
!79 = !DILocation(line: 70, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !73, file: !15, line: 70, column: 13)
!81 = !DILocation(line: 70, column: 18, scope: !80)
!82 = !DILocation(line: 70, column: 13, scope: !73)
!83 = !DILocation(line: 70, column: 28, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 70, column: 27)
!85 = !DILocation(line: 71, column: 9, scope: !73)
!86 = !DILocation(line: 71, column: 17, scope: !73)
!87 = !DILocalVariable(name: "source", scope: !88, file: !15, line: 75, type: !33)
!88 = distinct !DILexicalBlock(scope: !73, file: !15, line: 74, column: 5)
!89 = !DILocation(line: 75, column: 14, scope: !88)
!90 = !DILocation(line: 76, column: 9, scope: !88)
!91 = !DILocation(line: 77, column: 9, scope: !88)
!92 = !DILocation(line: 77, column: 23, scope: !88)
!93 = !DILocation(line: 79, column: 17, scope: !88)
!94 = !DILocation(line: 79, column: 23, scope: !88)
!95 = !DILocation(line: 79, column: 9, scope: !88)
!96 = !DILocation(line: 80, column: 9, scope: !88)
!97 = !DILocation(line: 80, column: 21, scope: !88)
!98 = !DILocation(line: 81, column: 19, scope: !88)
!99 = !DILocation(line: 81, column: 9, scope: !88)
!100 = !DILocation(line: 82, column: 14, scope: !88)
!101 = !DILocation(line: 82, column: 9, scope: !88)
!102 = !DILocation(line: 84, column: 1, scope: !73)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 87, type: !16, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 89, type: !4)
!105 = !DILocation(line: 89, column: 12, scope: !103)
!106 = !DILocation(line: 90, column: 10, scope: !103)
!107 = !DILocation(line: 95, column: 24, scope: !103)
!108 = !DILocation(line: 95, column: 14, scope: !103)
!109 = !DILocation(line: 96, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !15, line: 96, column: 13)
!111 = !DILocation(line: 96, column: 18, scope: !110)
!112 = !DILocation(line: 96, column: 13, scope: !103)
!113 = !DILocation(line: 96, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 96, column: 27)
!115 = !DILocation(line: 97, column: 9, scope: !103)
!116 = !DILocation(line: 97, column: 17, scope: !103)
!117 = !DILocalVariable(name: "source", scope: !118, file: !15, line: 105, type: !33)
!118 = distinct !DILexicalBlock(scope: !103, file: !15, line: 104, column: 5)
!119 = !DILocation(line: 105, column: 14, scope: !118)
!120 = !DILocation(line: 106, column: 9, scope: !118)
!121 = !DILocation(line: 107, column: 9, scope: !118)
!122 = !DILocation(line: 107, column: 23, scope: !118)
!123 = !DILocation(line: 109, column: 17, scope: !118)
!124 = !DILocation(line: 109, column: 23, scope: !118)
!125 = !DILocation(line: 109, column: 9, scope: !118)
!126 = !DILocation(line: 110, column: 9, scope: !118)
!127 = !DILocation(line: 110, column: 21, scope: !118)
!128 = !DILocation(line: 111, column: 19, scope: !118)
!129 = !DILocation(line: 111, column: 9, scope: !118)
!130 = !DILocation(line: 112, column: 14, scope: !118)
!131 = !DILocation(line: 112, column: 9, scope: !118)
!132 = !DILocation(line: 114, column: 1, scope: !103)
