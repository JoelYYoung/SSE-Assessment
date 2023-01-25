; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
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
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %2, i8** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !37
  store i8* %3, i8** %data1, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx2, align 1, !dbg !46
  %4 = load i8*, i8** %data1, align 8, !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !49
  %5 = load i8*, i8** %data1, align 8, !dbg !50
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !50
  store i8 0, i8* %arrayidx5, align 1, !dbg !51
  %6 = load i8*, i8** %data1, align 8, !dbg !52
  call void @printLine(i8* %6), !dbg !53
  %7 = load i8*, i8** %data1, align 8, !dbg !54
  call void @free(i8* %7) #6, !dbg !55
  ret void, !dbg !56
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31_good() #0 !dbg !57 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %cmp = icmp eq i8* %0, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !93, metadata !DIExpression()), !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  store i8* %2, i8** %dataCopy, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !97, metadata !DIExpression()), !dbg !98
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !99
  store i8* %3, i8** %data1, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx2, align 1, !dbg !105
  %4 = load i8*, i8** %data1, align 8, !dbg !106
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !108
  %5 = load i8*, i8** %data1, align 8, !dbg !109
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !109
  store i8 0, i8* %arrayidx5, align 1, !dbg !110
  %6 = load i8*, i8** %data1, align 8, !dbg !111
  call void @printLine(i8* %6), !dbg !112
  %7 = load i8*, i8** %data1, align 8, !dbg !113
  call void @free(i8* %7) #6, !dbg !114
  ret void, !dbg !115
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 20, scope: !14)
!22 = !DILocation(line: 28, column: 10, scope: !14)
!23 = !DILocation(line: 29, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!25 = !DILocation(line: 29, column: 14, scope: !24)
!26 = !DILocation(line: 29, column: 9, scope: !14)
!27 = !DILocation(line: 29, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 23)
!29 = !DILocation(line: 30, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 13, scope: !14)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !15, line: 32, type: !4)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!33 = !DILocation(line: 32, column: 16, scope: !32)
!34 = !DILocation(line: 32, column: 27, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !15, line: 33, type: !4)
!36 = !DILocation(line: 33, column: 16, scope: !32)
!37 = !DILocation(line: 33, column: 23, scope: !32)
!38 = !DILocalVariable(name: "source", scope: !39, file: !15, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !32, file: !15, line: 34, column: 9)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 35, column: 18, scope: !39)
!44 = !DILocation(line: 36, column: 13, scope: !39)
!45 = !DILocation(line: 37, column: 13, scope: !39)
!46 = !DILocation(line: 37, column: 27, scope: !39)
!47 = !DILocation(line: 39, column: 21, scope: !39)
!48 = !DILocation(line: 39, column: 27, scope: !39)
!49 = !DILocation(line: 39, column: 13, scope: !39)
!50 = !DILocation(line: 40, column: 13, scope: !39)
!51 = !DILocation(line: 40, column: 25, scope: !39)
!52 = !DILocation(line: 41, column: 23, scope: !39)
!53 = !DILocation(line: 41, column: 13, scope: !39)
!54 = !DILocation(line: 42, column: 18, scope: !39)
!55 = !DILocation(line: 42, column: 13, scope: !39)
!56 = !DILocation(line: 45, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_31_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 78, column: 5, scope: !57)
!59 = !DILocation(line: 79, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 90, type: !61, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 90, type: !63)
!66 = !DILocation(line: 90, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 90, type: !64)
!68 = !DILocation(line: 90, column: 27, scope: !60)
!69 = !DILocation(line: 93, column: 22, scope: !60)
!70 = !DILocation(line: 93, column: 12, scope: !60)
!71 = !DILocation(line: 93, column: 5, scope: !60)
!72 = !DILocation(line: 95, column: 5, scope: !60)
!73 = !DILocation(line: 96, column: 5, scope: !60)
!74 = !DILocation(line: 97, column: 5, scope: !60)
!75 = !DILocation(line: 100, column: 5, scope: !60)
!76 = !DILocation(line: 101, column: 5, scope: !60)
!77 = !DILocation(line: 102, column: 5, scope: !60)
!78 = !DILocation(line: 104, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 54, type: !4)
!81 = !DILocation(line: 54, column: 12, scope: !79)
!82 = !DILocation(line: 55, column: 10, scope: !79)
!83 = !DILocation(line: 57, column: 20, scope: !79)
!84 = !DILocation(line: 57, column: 10, scope: !79)
!85 = !DILocation(line: 58, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 9)
!87 = !DILocation(line: 58, column: 14, scope: !86)
!88 = !DILocation(line: 58, column: 9, scope: !79)
!89 = !DILocation(line: 58, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 58, column: 23)
!91 = !DILocation(line: 59, column: 5, scope: !79)
!92 = !DILocation(line: 59, column: 13, scope: !79)
!93 = !DILocalVariable(name: "dataCopy", scope: !94, file: !15, line: 61, type: !4)
!94 = distinct !DILexicalBlock(scope: !79, file: !15, line: 60, column: 5)
!95 = !DILocation(line: 61, column: 16, scope: !94)
!96 = !DILocation(line: 61, column: 27, scope: !94)
!97 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 62, type: !4)
!98 = !DILocation(line: 62, column: 16, scope: !94)
!99 = !DILocation(line: 62, column: 23, scope: !94)
!100 = !DILocalVariable(name: "source", scope: !101, file: !15, line: 64, type: !40)
!101 = distinct !DILexicalBlock(scope: !94, file: !15, line: 63, column: 9)
!102 = !DILocation(line: 64, column: 18, scope: !101)
!103 = !DILocation(line: 65, column: 13, scope: !101)
!104 = !DILocation(line: 66, column: 13, scope: !101)
!105 = !DILocation(line: 66, column: 27, scope: !101)
!106 = !DILocation(line: 68, column: 21, scope: !101)
!107 = !DILocation(line: 68, column: 27, scope: !101)
!108 = !DILocation(line: 68, column: 13, scope: !101)
!109 = !DILocation(line: 69, column: 13, scope: !101)
!110 = !DILocation(line: 69, column: 25, scope: !101)
!111 = !DILocation(line: 70, column: 23, scope: !101)
!112 = !DILocation(line: 70, column: 13, scope: !101)
!113 = !DILocation(line: 71, column: 18, scope: !101)
!114 = !DILocation(line: 71, column: 13, scope: !101)
!115 = !DILocation(line: 74, column: 1, scope: !79)
