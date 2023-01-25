; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !36
  %2 = load i8*, i8** %1, align 8, !dbg !37
  store i8* %2, i8** %data1, align 8, !dbg !35
  %3 = load i8*, i8** %data1, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %5 = load i8*, i8** %data1, align 8, !dbg !42
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %5, i8** %6, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %8 = load i8*, i8** %7, align 8, !dbg !49
  store i8* %8, i8** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %9 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 50, i1 false), !dbg !55
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !56
  %10 = load i8*, i8** %data2, align 8, !dbg !57
  %11 = load i8*, i8** %data2, align 8, !dbg !58
  %call3 = call i64 @strlen(i8* %11) #9, !dbg !59
  %call4 = call i8* @strncat(i8* %arraydecay, i8* %10, i64 %call3) #7, !dbg !60
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !61
  store i8 0, i8* %arrayidx5, align 1, !dbg !62
  %12 = load i8*, i8** %data2, align 8, !dbg !63
  call void @printLine(i8* %12), !dbg !64
  %13 = load i8*, i8** %data2, align 8, !dbg !65
  call void @free(i8* %13) #7, !dbg !66
  ret void, !dbg !67
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #7, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #7, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !96
  store i8* %call, i8** %data, align 8, !dbg !97
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %cmp = icmp eq i8* %0, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !107
  %2 = load i8*, i8** %1, align 8, !dbg !108
  store i8* %2, i8** %data1, align 8, !dbg !106
  %3 = load i8*, i8** %data1, align 8, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !110
  %4 = load i8*, i8** %data1, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %5 = load i8*, i8** %data1, align 8, !dbg !113
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !114
  store i8* %5, i8** %6, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !119
  %8 = load i8*, i8** %7, align 8, !dbg !120
  store i8* %8, i8** %data2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %9 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 50, i1 false), !dbg !123
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !124
  %10 = load i8*, i8** %data2, align 8, !dbg !125
  %11 = load i8*, i8** %data2, align 8, !dbg !126
  %call3 = call i64 @strlen(i8* %11) #9, !dbg !127
  %call4 = call i8* @strncat(i8* %arraydecay, i8* %10, i64 %call3) #7, !dbg !128
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !129
  store i8 0, i8* %arrayidx5, align 1, !dbg !130
  %12 = load i8*, i8** %data2, align 8, !dbg !131
  call void @printLine(i8* %12), !dbg !132
  %13 = load i8*, i8** %data2, align 8, !dbg !133
  call void @free(i8* %13) #7, !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 20, scope: !14)
!26 = !DILocation(line: 28, column: 10, scope: !14)
!27 = !DILocation(line: 29, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!29 = !DILocation(line: 29, column: 14, scope: !28)
!30 = !DILocation(line: 29, column: 9, scope: !14)
!31 = !DILocation(line: 29, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 23)
!33 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 31, type: !4)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!35 = !DILocation(line: 31, column: 16, scope: !34)
!36 = !DILocation(line: 31, column: 24, scope: !34)
!37 = !DILocation(line: 31, column: 23, scope: !34)
!38 = !DILocation(line: 33, column: 16, scope: !34)
!39 = !DILocation(line: 33, column: 9, scope: !34)
!40 = !DILocation(line: 34, column: 9, scope: !34)
!41 = !DILocation(line: 34, column: 21, scope: !34)
!42 = !DILocation(line: 35, column: 21, scope: !34)
!43 = !DILocation(line: 35, column: 10, scope: !34)
!44 = !DILocation(line: 35, column: 19, scope: !34)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 16, scope: !46)
!48 = !DILocation(line: 38, column: 24, scope: !46)
!49 = !DILocation(line: 38, column: 23, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 40, column: 18, scope: !51)
!56 = !DILocation(line: 42, column: 21, scope: !51)
!57 = !DILocation(line: 42, column: 27, scope: !51)
!58 = !DILocation(line: 42, column: 40, scope: !51)
!59 = !DILocation(line: 42, column: 33, scope: !51)
!60 = !DILocation(line: 42, column: 13, scope: !51)
!61 = !DILocation(line: 43, column: 13, scope: !51)
!62 = !DILocation(line: 43, column: 24, scope: !51)
!63 = !DILocation(line: 44, column: 23, scope: !51)
!64 = !DILocation(line: 44, column: 13, scope: !51)
!65 = !DILocation(line: 45, column: 18, scope: !51)
!66 = !DILocation(line: 45, column: 13, scope: !51)
!67 = !DILocation(line: 48, column: 1, scope: !14)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_32_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 84, column: 5, scope: !68)
!70 = !DILocation(line: 85, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !72, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !21}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 96, type: !74)
!76 = !DILocation(line: 96, column: 14, scope: !71)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 96, type: !21)
!78 = !DILocation(line: 96, column: 27, scope: !71)
!79 = !DILocation(line: 99, column: 22, scope: !71)
!80 = !DILocation(line: 99, column: 12, scope: !71)
!81 = !DILocation(line: 99, column: 5, scope: !71)
!82 = !DILocation(line: 101, column: 5, scope: !71)
!83 = !DILocation(line: 102, column: 5, scope: !71)
!84 = !DILocation(line: 103, column: 5, scope: !71)
!85 = !DILocation(line: 106, column: 5, scope: !71)
!86 = !DILocation(line: 107, column: 5, scope: !71)
!87 = !DILocation(line: 108, column: 5, scope: !71)
!88 = !DILocation(line: 110, column: 5, scope: !71)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !15, line: 57, type: !4)
!91 = !DILocation(line: 57, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataPtr1", scope: !89, file: !15, line: 58, type: !21)
!93 = !DILocation(line: 58, column: 13, scope: !89)
!94 = !DILocalVariable(name: "dataPtr2", scope: !89, file: !15, line: 59, type: !21)
!95 = !DILocation(line: 59, column: 13, scope: !89)
!96 = !DILocation(line: 60, column: 20, scope: !89)
!97 = !DILocation(line: 60, column: 10, scope: !89)
!98 = !DILocation(line: 61, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !89, file: !15, line: 61, column: 9)
!100 = !DILocation(line: 61, column: 14, scope: !99)
!101 = !DILocation(line: 61, column: 9, scope: !89)
!102 = !DILocation(line: 61, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 61, column: 23)
!104 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 63, type: !4)
!105 = distinct !DILexicalBlock(scope: !89, file: !15, line: 62, column: 5)
!106 = !DILocation(line: 63, column: 16, scope: !105)
!107 = !DILocation(line: 63, column: 24, scope: !105)
!108 = !DILocation(line: 63, column: 23, scope: !105)
!109 = !DILocation(line: 65, column: 16, scope: !105)
!110 = !DILocation(line: 65, column: 9, scope: !105)
!111 = !DILocation(line: 66, column: 9, scope: !105)
!112 = !DILocation(line: 66, column: 20, scope: !105)
!113 = !DILocation(line: 67, column: 21, scope: !105)
!114 = !DILocation(line: 67, column: 10, scope: !105)
!115 = !DILocation(line: 67, column: 19, scope: !105)
!116 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 70, type: !4)
!117 = distinct !DILexicalBlock(scope: !89, file: !15, line: 69, column: 5)
!118 = !DILocation(line: 70, column: 16, scope: !117)
!119 = !DILocation(line: 70, column: 24, scope: !117)
!120 = !DILocation(line: 70, column: 23, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !15, line: 72, type: !52)
!122 = distinct !DILexicalBlock(scope: !117, file: !15, line: 71, column: 9)
!123 = !DILocation(line: 72, column: 18, scope: !122)
!124 = !DILocation(line: 74, column: 21, scope: !122)
!125 = !DILocation(line: 74, column: 27, scope: !122)
!126 = !DILocation(line: 74, column: 40, scope: !122)
!127 = !DILocation(line: 74, column: 33, scope: !122)
!128 = !DILocation(line: 74, column: 13, scope: !122)
!129 = !DILocation(line: 75, column: 13, scope: !122)
!130 = !DILocation(line: 75, column: 24, scope: !122)
!131 = !DILocation(line: 76, column: 23, scope: !122)
!132 = !DILocation(line: 76, column: 13, scope: !122)
!133 = !DILocation(line: 77, column: 18, scope: !122)
!134 = !DILocation(line: 77, column: 13, scope: !122)
!135 = !DILocation(line: 80, column: 1, scope: !89)
