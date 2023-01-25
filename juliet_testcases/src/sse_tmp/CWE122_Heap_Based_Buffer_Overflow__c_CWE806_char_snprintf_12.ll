; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12_bad() #0 !dbg !14 {
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
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !28
  %tobool = icmp ne i32 %call1, 0, !dbg !28
  br i1 %tobool, label %if.then2, label %if.else, !dbg !30

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end4, !dbg !36

if.else:                                          ; preds = %if.end
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 49, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  %call5 = call i64 @strlen(i8* %6) #9, !dbg !50
  %7 = load i8*, i8** %data, align 8, !dbg !51
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !52
  %8 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %8), !dbg !54
  %9 = load i8*, i8** %data, align 8, !dbg !55
  call void @free(i8* %9) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrueOrFalse(...) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %cmp = icmp eq i8* %0, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !91
  %tobool = icmp ne i32 %call1, 0, !dbg !91
  br i1 %tobool, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  br label %if.end4, !dbg !99

if.else:                                          ; preds = %if.end
  %3 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 49, !dbg !103
  store i8 0, i8* %arrayidx3, align 1, !dbg !104
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !109
  %call5 = call i64 @strlen(i8* %6) #9, !dbg !110
  %7 = load i8*, i8** %data, align 8, !dbg !111
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !112
  %8 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %8), !dbg !114
  %9 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %9) #7, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !14)
!31 = !DILocation(line: 37, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 9, scope: !32)
!34 = !DILocation(line: 38, column: 9, scope: !32)
!35 = !DILocation(line: 38, column: 21, scope: !32)
!36 = !DILocation(line: 39, column: 5, scope: !32)
!37 = !DILocation(line: 43, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !15, line: 41, column: 5)
!39 = !DILocation(line: 43, column: 9, scope: !38)
!40 = !DILocation(line: 44, column: 9, scope: !38)
!41 = !DILocation(line: 44, column: 20, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !15, line: 47, type: !44)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 47, column: 14, scope: !43)
!48 = !DILocation(line: 49, column: 18, scope: !43)
!49 = !DILocation(line: 49, column: 31, scope: !43)
!50 = !DILocation(line: 49, column: 24, scope: !43)
!51 = !DILocation(line: 49, column: 44, scope: !43)
!52 = !DILocation(line: 49, column: 9, scope: !43)
!53 = !DILocation(line: 50, column: 19, scope: !43)
!54 = !DILocation(line: 50, column: 9, scope: !43)
!55 = !DILocation(line: 51, column: 14, scope: !43)
!56 = !DILocation(line: 51, column: 9, scope: !43)
!57 = !DILocation(line: 53, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_12_good", scope: !15, file: !15, line: 87, type: !16, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 89, column: 5, scope: !58)
!60 = !DILocation(line: 90, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 102, type: !62, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 102, type: !64)
!67 = !DILocation(line: 102, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 102, type: !65)
!69 = !DILocation(line: 102, column: 27, scope: !61)
!70 = !DILocation(line: 105, column: 22, scope: !61)
!71 = !DILocation(line: 105, column: 12, scope: !61)
!72 = !DILocation(line: 105, column: 5, scope: !61)
!73 = !DILocation(line: 107, column: 5, scope: !61)
!74 = !DILocation(line: 108, column: 5, scope: !61)
!75 = !DILocation(line: 109, column: 5, scope: !61)
!76 = !DILocation(line: 112, column: 5, scope: !61)
!77 = !DILocation(line: 113, column: 5, scope: !61)
!78 = !DILocation(line: 114, column: 5, scope: !61)
!79 = !DILocation(line: 116, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 63, type: !4)
!82 = !DILocation(line: 63, column: 12, scope: !80)
!83 = !DILocation(line: 64, column: 20, scope: !80)
!84 = !DILocation(line: 64, column: 10, scope: !80)
!85 = !DILocation(line: 65, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !15, line: 65, column: 9)
!87 = !DILocation(line: 65, column: 14, scope: !86)
!88 = !DILocation(line: 65, column: 9, scope: !80)
!89 = !DILocation(line: 65, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 65, column: 23)
!91 = !DILocation(line: 66, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !80, file: !15, line: 66, column: 8)
!93 = !DILocation(line: 66, column: 8, scope: !80)
!94 = !DILocation(line: 69, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 67, column: 5)
!96 = !DILocation(line: 69, column: 9, scope: !95)
!97 = !DILocation(line: 70, column: 9, scope: !95)
!98 = !DILocation(line: 70, column: 20, scope: !95)
!99 = !DILocation(line: 71, column: 5, scope: !95)
!100 = !DILocation(line: 75, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !92, file: !15, line: 73, column: 5)
!102 = !DILocation(line: 75, column: 9, scope: !101)
!103 = !DILocation(line: 76, column: 9, scope: !101)
!104 = !DILocation(line: 76, column: 20, scope: !101)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !15, line: 79, type: !44)
!106 = distinct !DILexicalBlock(scope: !80, file: !15, line: 78, column: 5)
!107 = !DILocation(line: 79, column: 14, scope: !106)
!108 = !DILocation(line: 81, column: 18, scope: !106)
!109 = !DILocation(line: 81, column: 31, scope: !106)
!110 = !DILocation(line: 81, column: 24, scope: !106)
!111 = !DILocation(line: 81, column: 44, scope: !106)
!112 = !DILocation(line: 81, column: 9, scope: !106)
!113 = !DILocation(line: 82, column: 19, scope: !106)
!114 = !DILocation(line: 82, column: 9, scope: !106)
!115 = !DILocation(line: 83, column: 14, scope: !106)
!116 = !DILocation(line: 83, column: 9, scope: !106)
!117 = !DILocation(line: 85, column: 1, scope: !80)
