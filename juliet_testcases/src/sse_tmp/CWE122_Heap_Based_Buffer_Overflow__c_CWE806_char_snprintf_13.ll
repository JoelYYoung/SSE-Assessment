; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13_bad() #0 !dbg !14 {
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
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !28
  %cmp1 = icmp eq i32 %1, 5, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !31

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %7), !dbg !50
  %8 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* %8) #7, !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
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
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !80
  store i8* %call, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %cmp = icmp eq i8* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !88
  %cmp1 = icmp ne i32 %1, 5, !dbg !90
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !91

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !92
  br label %if.end3, !dbg !94

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !107
  %7 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %7), !dbg !109
  %8 = load i8*, i8** %data, align 8, !dbg !110
  call void @free(i8* %8) #7, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !116
  store i8* %call, i8** %data, align 8, !dbg !117
  %0 = load i8*, i8** %data, align 8, !dbg !118
  %cmp = icmp eq i8* %0, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !124
  %cmp1 = icmp eq i32 %1, 5, !dbg !126
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !127

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !130
  %3 = load i8*, i8** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  br label %if.end3, !dbg !133

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !136
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !137
  %5 = load i8*, i8** %data, align 8, !dbg !138
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !139
  %6 = load i8*, i8** %data, align 8, !dbg !140
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !141
  %7 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %7), !dbg !143
  %8 = load i8*, i8** %data, align 8, !dbg !144
  call void @free(i8* %8) #7, !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 34, column: 25, scope: !29)
!31 = !DILocation(line: 34, column: 8, scope: !14)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 9, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 21, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocation(line: 43, column: 18, scope: !39)
!45 = !DILocation(line: 43, column: 31, scope: !39)
!46 = !DILocation(line: 43, column: 24, scope: !39)
!47 = !DILocation(line: 43, column: 44, scope: !39)
!48 = !DILocation(line: 43, column: 9, scope: !39)
!49 = !DILocation(line: 44, column: 19, scope: !39)
!50 = !DILocation(line: 44, column: 9, scope: !39)
!51 = !DILocation(line: 45, column: 14, scope: !39)
!52 = !DILocation(line: 45, column: 9, scope: !39)
!53 = !DILocation(line: 47, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_13_good", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 102, column: 5, scope: !54)
!56 = !DILocation(line: 103, column: 5, scope: !54)
!57 = !DILocation(line: 104, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 116, type: !59, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 116, type: !61)
!64 = !DILocation(line: 116, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 116, type: !62)
!66 = !DILocation(line: 116, column: 27, scope: !58)
!67 = !DILocation(line: 119, column: 22, scope: !58)
!68 = !DILocation(line: 119, column: 12, scope: !58)
!69 = !DILocation(line: 119, column: 5, scope: !58)
!70 = !DILocation(line: 121, column: 5, scope: !58)
!71 = !DILocation(line: 122, column: 5, scope: !58)
!72 = !DILocation(line: 123, column: 5, scope: !58)
!73 = !DILocation(line: 126, column: 5, scope: !58)
!74 = !DILocation(line: 127, column: 5, scope: !58)
!75 = !DILocation(line: 128, column: 5, scope: !58)
!76 = !DILocation(line: 130, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 56, type: !4)
!79 = !DILocation(line: 56, column: 12, scope: !77)
!80 = !DILocation(line: 57, column: 20, scope: !77)
!81 = !DILocation(line: 57, column: 10, scope: !77)
!82 = !DILocation(line: 58, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !15, line: 58, column: 9)
!84 = !DILocation(line: 58, column: 14, scope: !83)
!85 = !DILocation(line: 58, column: 9, scope: !77)
!86 = !DILocation(line: 58, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 58, column: 23)
!88 = !DILocation(line: 59, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !77, file: !15, line: 59, column: 8)
!90 = !DILocation(line: 59, column: 25, scope: !89)
!91 = !DILocation(line: 59, column: 8, scope: !77)
!92 = !DILocation(line: 62, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 60, column: 5)
!94 = !DILocation(line: 63, column: 5, scope: !93)
!95 = !DILocation(line: 67, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !15, line: 65, column: 5)
!97 = !DILocation(line: 67, column: 9, scope: !96)
!98 = !DILocation(line: 68, column: 9, scope: !96)
!99 = !DILocation(line: 68, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !15, line: 71, type: !40)
!101 = distinct !DILexicalBlock(scope: !77, file: !15, line: 70, column: 5)
!102 = !DILocation(line: 71, column: 14, scope: !101)
!103 = !DILocation(line: 73, column: 18, scope: !101)
!104 = !DILocation(line: 73, column: 31, scope: !101)
!105 = !DILocation(line: 73, column: 24, scope: !101)
!106 = !DILocation(line: 73, column: 44, scope: !101)
!107 = !DILocation(line: 73, column: 9, scope: !101)
!108 = !DILocation(line: 74, column: 19, scope: !101)
!109 = !DILocation(line: 74, column: 9, scope: !101)
!110 = !DILocation(line: 75, column: 14, scope: !101)
!111 = !DILocation(line: 75, column: 9, scope: !101)
!112 = !DILocation(line: 77, column: 1, scope: !77)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 82, type: !4)
!115 = !DILocation(line: 82, column: 12, scope: !113)
!116 = !DILocation(line: 83, column: 20, scope: !113)
!117 = !DILocation(line: 83, column: 10, scope: !113)
!118 = !DILocation(line: 84, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !15, line: 84, column: 9)
!120 = !DILocation(line: 84, column: 14, scope: !119)
!121 = !DILocation(line: 84, column: 9, scope: !113)
!122 = !DILocation(line: 84, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 84, column: 23)
!124 = !DILocation(line: 85, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !15, line: 85, column: 8)
!126 = !DILocation(line: 85, column: 25, scope: !125)
!127 = !DILocation(line: 85, column: 8, scope: !113)
!128 = !DILocation(line: 88, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 86, column: 5)
!130 = !DILocation(line: 88, column: 9, scope: !129)
!131 = !DILocation(line: 89, column: 9, scope: !129)
!132 = !DILocation(line: 89, column: 20, scope: !129)
!133 = !DILocation(line: 90, column: 5, scope: !129)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !15, line: 92, type: !40)
!135 = distinct !DILexicalBlock(scope: !113, file: !15, line: 91, column: 5)
!136 = !DILocation(line: 92, column: 14, scope: !135)
!137 = !DILocation(line: 94, column: 18, scope: !135)
!138 = !DILocation(line: 94, column: 31, scope: !135)
!139 = !DILocation(line: 94, column: 24, scope: !135)
!140 = !DILocation(line: 94, column: 44, scope: !135)
!141 = !DILocation(line: 94, column: 9, scope: !135)
!142 = !DILocation(line: 95, column: 19, scope: !135)
!143 = !DILocation(line: 95, column: 9, scope: !135)
!144 = !DILocation(line: 96, column: 14, scope: !135)
!145 = !DILocation(line: 96, column: 9, scope: !135)
!146 = !DILocation(line: 98, column: 1, scope: !113)
