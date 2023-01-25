; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32_bad() #0 !dbg !14 {
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
  %call3 = call i64 @strlen(i8* %10) #9, !dbg !58
  %11 = load i8*, i8** %data2, align 8, !dbg !59
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %11) #7, !dbg !60
  %12 = load i8*, i8** %data2, align 8, !dbg !61
  call void @printLine(i8* %12), !dbg !62
  %13 = load i8*, i8** %data2, align 8, !dbg !63
  call void @free(i8* %13) #7, !dbg !64
  ret void, !dbg !65
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !94
  store i8* %call, i8** %data, align 8, !dbg !95
  %0 = load i8*, i8** %data, align 8, !dbg !96
  %cmp = icmp eq i8* %0, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !105
  %2 = load i8*, i8** %1, align 8, !dbg !106
  store i8* %2, i8** %data1, align 8, !dbg !104
  %3 = load i8*, i8** %data1, align 8, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !108
  %4 = load i8*, i8** %data1, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %5 = load i8*, i8** %data1, align 8, !dbg !111
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !112
  store i8* %5, i8** %6, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !114, metadata !DIExpression()), !dbg !116
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !117
  %8 = load i8*, i8** %7, align 8, !dbg !118
  store i8* %8, i8** %data2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %9 = bitcast [50 x i8]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 50, i1 false), !dbg !121
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !122
  %10 = load i8*, i8** %data2, align 8, !dbg !123
  %call3 = call i64 @strlen(i8* %10) #9, !dbg !124
  %11 = load i8*, i8** %data2, align 8, !dbg !125
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %11) #7, !dbg !126
  %12 = load i8*, i8** %data2, align 8, !dbg !127
  call void @printLine(i8* %12), !dbg !128
  %13 = load i8*, i8** %data2, align 8, !dbg !129
  call void @free(i8* %13) #7, !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 32, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 33, type: !21)
!24 = !DILocation(line: 33, column: 13, scope: !14)
!25 = !DILocation(line: 34, column: 20, scope: !14)
!26 = !DILocation(line: 34, column: 10, scope: !14)
!27 = !DILocation(line: 35, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 9)
!29 = !DILocation(line: 35, column: 14, scope: !28)
!30 = !DILocation(line: 35, column: 9, scope: !14)
!31 = !DILocation(line: 35, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 35, column: 23)
!33 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 37, type: !4)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!35 = !DILocation(line: 37, column: 16, scope: !34)
!36 = !DILocation(line: 37, column: 24, scope: !34)
!37 = !DILocation(line: 37, column: 23, scope: !34)
!38 = !DILocation(line: 39, column: 16, scope: !34)
!39 = !DILocation(line: 39, column: 9, scope: !34)
!40 = !DILocation(line: 40, column: 9, scope: !34)
!41 = !DILocation(line: 40, column: 21, scope: !34)
!42 = !DILocation(line: 41, column: 21, scope: !34)
!43 = !DILocation(line: 41, column: 10, scope: !34)
!44 = !DILocation(line: 41, column: 19, scope: !34)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 44, type: !4)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!47 = !DILocation(line: 44, column: 16, scope: !46)
!48 = !DILocation(line: 44, column: 24, scope: !46)
!49 = !DILocation(line: 44, column: 23, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 46, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 45, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 46, column: 18, scope: !51)
!56 = !DILocation(line: 48, column: 22, scope: !51)
!57 = !DILocation(line: 48, column: 35, scope: !51)
!58 = !DILocation(line: 48, column: 28, scope: !51)
!59 = !DILocation(line: 48, column: 48, scope: !51)
!60 = !DILocation(line: 48, column: 13, scope: !51)
!61 = !DILocation(line: 49, column: 23, scope: !51)
!62 = !DILocation(line: 49, column: 13, scope: !51)
!63 = !DILocation(line: 50, column: 18, scope: !51)
!64 = !DILocation(line: 50, column: 13, scope: !51)
!65 = !DILocation(line: 53, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_32_good", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 88, column: 5, scope: !66)
!68 = !DILocation(line: 89, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 100, type: !70, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !21}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !15, line: 100, type: !72)
!74 = !DILocation(line: 100, column: 14, scope: !69)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !15, line: 100, type: !21)
!76 = !DILocation(line: 100, column: 27, scope: !69)
!77 = !DILocation(line: 103, column: 22, scope: !69)
!78 = !DILocation(line: 103, column: 12, scope: !69)
!79 = !DILocation(line: 103, column: 5, scope: !69)
!80 = !DILocation(line: 105, column: 5, scope: !69)
!81 = !DILocation(line: 106, column: 5, scope: !69)
!82 = !DILocation(line: 107, column: 5, scope: !69)
!83 = !DILocation(line: 110, column: 5, scope: !69)
!84 = !DILocation(line: 111, column: 5, scope: !69)
!85 = !DILocation(line: 112, column: 5, scope: !69)
!86 = !DILocation(line: 114, column: 5, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 62, type: !4)
!89 = !DILocation(line: 62, column: 12, scope: !87)
!90 = !DILocalVariable(name: "dataPtr1", scope: !87, file: !15, line: 63, type: !21)
!91 = !DILocation(line: 63, column: 13, scope: !87)
!92 = !DILocalVariable(name: "dataPtr2", scope: !87, file: !15, line: 64, type: !21)
!93 = !DILocation(line: 64, column: 13, scope: !87)
!94 = !DILocation(line: 65, column: 20, scope: !87)
!95 = !DILocation(line: 65, column: 10, scope: !87)
!96 = !DILocation(line: 66, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !87, file: !15, line: 66, column: 9)
!98 = !DILocation(line: 66, column: 14, scope: !97)
!99 = !DILocation(line: 66, column: 9, scope: !87)
!100 = !DILocation(line: 66, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 66, column: 23)
!102 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 68, type: !4)
!103 = distinct !DILexicalBlock(scope: !87, file: !15, line: 67, column: 5)
!104 = !DILocation(line: 68, column: 16, scope: !103)
!105 = !DILocation(line: 68, column: 24, scope: !103)
!106 = !DILocation(line: 68, column: 23, scope: !103)
!107 = !DILocation(line: 70, column: 16, scope: !103)
!108 = !DILocation(line: 70, column: 9, scope: !103)
!109 = !DILocation(line: 71, column: 9, scope: !103)
!110 = !DILocation(line: 71, column: 20, scope: !103)
!111 = !DILocation(line: 72, column: 21, scope: !103)
!112 = !DILocation(line: 72, column: 10, scope: !103)
!113 = !DILocation(line: 72, column: 19, scope: !103)
!114 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 75, type: !4)
!115 = distinct !DILexicalBlock(scope: !87, file: !15, line: 74, column: 5)
!116 = !DILocation(line: 75, column: 16, scope: !115)
!117 = !DILocation(line: 75, column: 24, scope: !115)
!118 = !DILocation(line: 75, column: 23, scope: !115)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !15, line: 77, type: !52)
!120 = distinct !DILexicalBlock(scope: !115, file: !15, line: 76, column: 9)
!121 = !DILocation(line: 77, column: 18, scope: !120)
!122 = !DILocation(line: 79, column: 22, scope: !120)
!123 = !DILocation(line: 79, column: 35, scope: !120)
!124 = !DILocation(line: 79, column: 28, scope: !120)
!125 = !DILocation(line: 79, column: 48, scope: !120)
!126 = !DILocation(line: 79, column: 13, scope: !120)
!127 = !DILocation(line: 80, column: 23, scope: !120)
!128 = !DILocation(line: 80, column: 13, scope: !120)
!129 = !DILocation(line: 81, column: 18, scope: !120)
!130 = !DILocation(line: 81, column: 13, scope: !120)
!131 = !DILocation(line: 84, column: 1, scope: !87)
