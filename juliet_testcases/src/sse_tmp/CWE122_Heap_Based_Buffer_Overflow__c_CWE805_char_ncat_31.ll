; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31_bad() #0 !dbg !14 {
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
  %call4 = call i8* @strncat(i8* %4, i8* %arraydecay3, i64 100) #6, !dbg !49
  %5 = load i8*, i8** %data1, align 8, !dbg !50
  call void @printLine(i8* %5), !dbg !51
  %6 = load i8*, i8** %data1, align 8, !dbg !52
  call void @free(i8* %6) #6, !dbg !53
  ret void, !dbg !54
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !81
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
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !91, metadata !DIExpression()), !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  store i8* %2, i8** %dataCopy, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !95, metadata !DIExpression()), !dbg !96
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !97
  store i8* %3, i8** %data1, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx2, align 1, !dbg !103
  %4 = load i8*, i8** %data1, align 8, !dbg !104
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call4 = call i8* @strncat(i8* %4, i8* %arraydecay3, i64 100) #6, !dbg !106
  %5 = load i8*, i8** %data1, align 8, !dbg !107
  call void @printLine(i8* %5), !dbg !108
  %6 = load i8*, i8** %data1, align 8, !dbg !109
  call void @free(i8* %6) #6, !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31.c", directory: "/root/SSE-Assessment")
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
!50 = !DILocation(line: 40, column: 23, scope: !39)
!51 = !DILocation(line: 40, column: 13, scope: !39)
!52 = !DILocation(line: 41, column: 18, scope: !39)
!53 = !DILocation(line: 41, column: 13, scope: !39)
!54 = !DILocation(line: 44, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_31_good", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 76, column: 5, scope: !55)
!57 = !DILocation(line: 77, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 88, type: !59, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 88, type: !61)
!64 = !DILocation(line: 88, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 88, type: !62)
!66 = !DILocation(line: 88, column: 27, scope: !58)
!67 = !DILocation(line: 91, column: 22, scope: !58)
!68 = !DILocation(line: 91, column: 12, scope: !58)
!69 = !DILocation(line: 91, column: 5, scope: !58)
!70 = !DILocation(line: 93, column: 5, scope: !58)
!71 = !DILocation(line: 94, column: 5, scope: !58)
!72 = !DILocation(line: 95, column: 5, scope: !58)
!73 = !DILocation(line: 98, column: 5, scope: !58)
!74 = !DILocation(line: 99, column: 5, scope: !58)
!75 = !DILocation(line: 100, column: 5, scope: !58)
!76 = !DILocation(line: 102, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 53, type: !4)
!79 = !DILocation(line: 53, column: 12, scope: !77)
!80 = !DILocation(line: 54, column: 10, scope: !77)
!81 = !DILocation(line: 56, column: 20, scope: !77)
!82 = !DILocation(line: 56, column: 10, scope: !77)
!83 = !DILocation(line: 57, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !15, line: 57, column: 9)
!85 = !DILocation(line: 57, column: 14, scope: !84)
!86 = !DILocation(line: 57, column: 9, scope: !77)
!87 = !DILocation(line: 57, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 57, column: 23)
!89 = !DILocation(line: 58, column: 5, scope: !77)
!90 = !DILocation(line: 58, column: 13, scope: !77)
!91 = !DILocalVariable(name: "dataCopy", scope: !92, file: !15, line: 60, type: !4)
!92 = distinct !DILexicalBlock(scope: !77, file: !15, line: 59, column: 5)
!93 = !DILocation(line: 60, column: 16, scope: !92)
!94 = !DILocation(line: 60, column: 27, scope: !92)
!95 = !DILocalVariable(name: "data", scope: !92, file: !15, line: 61, type: !4)
!96 = !DILocation(line: 61, column: 16, scope: !92)
!97 = !DILocation(line: 61, column: 23, scope: !92)
!98 = !DILocalVariable(name: "source", scope: !99, file: !15, line: 63, type: !40)
!99 = distinct !DILexicalBlock(scope: !92, file: !15, line: 62, column: 9)
!100 = !DILocation(line: 63, column: 18, scope: !99)
!101 = !DILocation(line: 64, column: 13, scope: !99)
!102 = !DILocation(line: 65, column: 13, scope: !99)
!103 = !DILocation(line: 65, column: 27, scope: !99)
!104 = !DILocation(line: 67, column: 21, scope: !99)
!105 = !DILocation(line: 67, column: 27, scope: !99)
!106 = !DILocation(line: 67, column: 13, scope: !99)
!107 = !DILocation(line: 68, column: 23, scope: !99)
!108 = !DILocation(line: 68, column: 13, scope: !99)
!109 = !DILocation(line: 69, column: 18, scope: !99)
!110 = !DILocation(line: 69, column: 13, scope: !99)
!111 = !DILocation(line: 72, column: 1, scope: !77)
