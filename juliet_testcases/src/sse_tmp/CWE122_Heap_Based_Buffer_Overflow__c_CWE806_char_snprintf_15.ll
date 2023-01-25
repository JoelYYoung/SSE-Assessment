; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %6), !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  call void @free(i8* %7) #7, !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !74
  store i8* %call, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %cmp = icmp eq i8* %0, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !88
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !92
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !93
  %6 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %6), !dbg !95
  %7 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* %7) #7, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !102
  store i8* %call, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %cmp = icmp eq i8* %0, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !120
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* %6), !dbg !123
  %7 = load i8*, i8** %data, align 8, !dbg !124
  call void @free(i8* %7) #7, !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocation(line: 32, column: 20, scope: !14)
!21 = !DILocation(line: 32, column: 10, scope: !14)
!22 = !DILocation(line: 33, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 9)
!24 = !DILocation(line: 33, column: 14, scope: !23)
!25 = !DILocation(line: 33, column: 9, scope: !14)
!26 = !DILocation(line: 33, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 33, column: 23)
!28 = !DILocation(line: 38, column: 16, scope: !14)
!29 = !DILocation(line: 38, column: 9, scope: !14)
!30 = !DILocation(line: 39, column: 9, scope: !14)
!31 = !DILocation(line: 39, column: 21, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 47, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 47, column: 14, scope: !33)
!38 = !DILocation(line: 49, column: 18, scope: !33)
!39 = !DILocation(line: 49, column: 31, scope: !33)
!40 = !DILocation(line: 49, column: 24, scope: !33)
!41 = !DILocation(line: 49, column: 44, scope: !33)
!42 = !DILocation(line: 49, column: 9, scope: !33)
!43 = !DILocation(line: 50, column: 19, scope: !33)
!44 = !DILocation(line: 50, column: 9, scope: !33)
!45 = !DILocation(line: 51, column: 14, scope: !33)
!46 = !DILocation(line: 51, column: 9, scope: !33)
!47 = !DILocation(line: 53, column: 1, scope: !14)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_15_good", scope: !15, file: !15, line: 113, type: !16, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 115, column: 5, scope: !48)
!50 = !DILocation(line: 116, column: 5, scope: !48)
!51 = !DILocation(line: 117, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 129, type: !53, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 129, type: !55)
!58 = !DILocation(line: 129, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 129, type: !56)
!60 = !DILocation(line: 129, column: 27, scope: !52)
!61 = !DILocation(line: 132, column: 22, scope: !52)
!62 = !DILocation(line: 132, column: 12, scope: !52)
!63 = !DILocation(line: 132, column: 5, scope: !52)
!64 = !DILocation(line: 134, column: 5, scope: !52)
!65 = !DILocation(line: 135, column: 5, scope: !52)
!66 = !DILocation(line: 136, column: 5, scope: !52)
!67 = !DILocation(line: 139, column: 5, scope: !52)
!68 = !DILocation(line: 140, column: 5, scope: !52)
!69 = !DILocation(line: 141, column: 5, scope: !52)
!70 = !DILocation(line: 143, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !15, line: 62, type: !4)
!73 = !DILocation(line: 62, column: 12, scope: !71)
!74 = !DILocation(line: 63, column: 20, scope: !71)
!75 = !DILocation(line: 63, column: 10, scope: !71)
!76 = !DILocation(line: 64, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !15, line: 64, column: 9)
!78 = !DILocation(line: 64, column: 14, scope: !77)
!79 = !DILocation(line: 64, column: 9, scope: !71)
!80 = !DILocation(line: 64, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 64, column: 23)
!82 = !DILocation(line: 73, column: 16, scope: !71)
!83 = !DILocation(line: 73, column: 9, scope: !71)
!84 = !DILocation(line: 74, column: 9, scope: !71)
!85 = !DILocation(line: 74, column: 20, scope: !71)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !15, line: 78, type: !34)
!87 = distinct !DILexicalBlock(scope: !71, file: !15, line: 77, column: 5)
!88 = !DILocation(line: 78, column: 14, scope: !87)
!89 = !DILocation(line: 80, column: 18, scope: !87)
!90 = !DILocation(line: 80, column: 31, scope: !87)
!91 = !DILocation(line: 80, column: 24, scope: !87)
!92 = !DILocation(line: 80, column: 44, scope: !87)
!93 = !DILocation(line: 80, column: 9, scope: !87)
!94 = !DILocation(line: 81, column: 19, scope: !87)
!95 = !DILocation(line: 81, column: 9, scope: !87)
!96 = !DILocation(line: 82, column: 14, scope: !87)
!97 = !DILocation(line: 82, column: 9, scope: !87)
!98 = !DILocation(line: 84, column: 1, scope: !71)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 87, type: !16, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 89, type: !4)
!101 = !DILocation(line: 89, column: 12, scope: !99)
!102 = !DILocation(line: 90, column: 20, scope: !99)
!103 = !DILocation(line: 90, column: 10, scope: !99)
!104 = !DILocation(line: 91, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !15, line: 91, column: 9)
!106 = !DILocation(line: 91, column: 14, scope: !105)
!107 = !DILocation(line: 91, column: 9, scope: !99)
!108 = !DILocation(line: 91, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 91, column: 23)
!110 = !DILocation(line: 96, column: 16, scope: !99)
!111 = !DILocation(line: 96, column: 9, scope: !99)
!112 = !DILocation(line: 97, column: 9, scope: !99)
!113 = !DILocation(line: 97, column: 20, scope: !99)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !15, line: 105, type: !34)
!115 = distinct !DILexicalBlock(scope: !99, file: !15, line: 104, column: 5)
!116 = !DILocation(line: 105, column: 14, scope: !115)
!117 = !DILocation(line: 107, column: 18, scope: !115)
!118 = !DILocation(line: 107, column: 31, scope: !115)
!119 = !DILocation(line: 107, column: 24, scope: !115)
!120 = !DILocation(line: 107, column: 44, scope: !115)
!121 = !DILocation(line: 107, column: 9, scope: !115)
!122 = !DILocation(line: 108, column: 19, scope: !115)
!123 = !DILocation(line: 108, column: 9, scope: !115)
!124 = !DILocation(line: 109, column: 14, scope: !115)
!125 = !DILocation(line: 109, column: 9, scope: !115)
!126 = !DILocation(line: 111, column: 1, scope: !99)
