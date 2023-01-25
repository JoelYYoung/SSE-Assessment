; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10_bad() #0 !dbg !14 {
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
  %1 = load i32, i32* @globalTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %1, 0, !dbg !28
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !30

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end2, !dbg !36

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  %8 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %8) #7, !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %cmp = icmp eq i8* %0, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %1, 0, !dbg !87
  br i1 %tobool, label %if.then1, label %if.else, !dbg !89

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  br label %if.end2, !dbg !92

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !104
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !105
  %7 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %7), !dbg !107
  %8 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %8) #7, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !122
  %tobool = icmp ne i32 %1, 0, !dbg !122
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !124

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end2, !dbg !130

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !133
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !134
  %5 = load i8*, i8** %data, align 8, !dbg !135
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !136
  %6 = load i8*, i8** %data, align 8, !dbg !137
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !138
  %7 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %7), !dbg !140
  %8 = load i8*, i8** %data, align 8, !dbg !141
  call void @free(i8* %8) #7, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 41, column: 14, scope: !38)
!43 = !DILocation(line: 43, column: 18, scope: !38)
!44 = !DILocation(line: 43, column: 31, scope: !38)
!45 = !DILocation(line: 43, column: 24, scope: !38)
!46 = !DILocation(line: 43, column: 44, scope: !38)
!47 = !DILocation(line: 43, column: 9, scope: !38)
!48 = !DILocation(line: 44, column: 19, scope: !38)
!49 = !DILocation(line: 44, column: 9, scope: !38)
!50 = !DILocation(line: 45, column: 14, scope: !38)
!51 = !DILocation(line: 45, column: 9, scope: !38)
!52 = !DILocation(line: 47, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_10_good", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 102, column: 5, scope: !53)
!55 = !DILocation(line: 103, column: 5, scope: !53)
!56 = !DILocation(line: 104, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 116, type: !58, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 116, type: !60)
!63 = !DILocation(line: 116, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 116, type: !61)
!65 = !DILocation(line: 116, column: 27, scope: !57)
!66 = !DILocation(line: 119, column: 22, scope: !57)
!67 = !DILocation(line: 119, column: 12, scope: !57)
!68 = !DILocation(line: 119, column: 5, scope: !57)
!69 = !DILocation(line: 121, column: 5, scope: !57)
!70 = !DILocation(line: 122, column: 5, scope: !57)
!71 = !DILocation(line: 123, column: 5, scope: !57)
!72 = !DILocation(line: 126, column: 5, scope: !57)
!73 = !DILocation(line: 127, column: 5, scope: !57)
!74 = !DILocation(line: 128, column: 5, scope: !57)
!75 = !DILocation(line: 130, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 56, type: !4)
!78 = !DILocation(line: 56, column: 12, scope: !76)
!79 = !DILocation(line: 57, column: 20, scope: !76)
!80 = !DILocation(line: 57, column: 10, scope: !76)
!81 = !DILocation(line: 58, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !15, line: 58, column: 9)
!83 = !DILocation(line: 58, column: 14, scope: !82)
!84 = !DILocation(line: 58, column: 9, scope: !76)
!85 = !DILocation(line: 58, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 58, column: 23)
!87 = !DILocation(line: 59, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !76, file: !15, line: 59, column: 8)
!89 = !DILocation(line: 59, column: 8, scope: !76)
!90 = !DILocation(line: 62, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 60, column: 5)
!92 = !DILocation(line: 63, column: 5, scope: !91)
!93 = !DILocation(line: 67, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !15, line: 65, column: 5)
!95 = !DILocation(line: 67, column: 9, scope: !94)
!96 = !DILocation(line: 68, column: 9, scope: !94)
!97 = !DILocation(line: 68, column: 20, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !15, line: 71, type: !39)
!99 = distinct !DILexicalBlock(scope: !76, file: !15, line: 70, column: 5)
!100 = !DILocation(line: 71, column: 14, scope: !99)
!101 = !DILocation(line: 73, column: 18, scope: !99)
!102 = !DILocation(line: 73, column: 31, scope: !99)
!103 = !DILocation(line: 73, column: 24, scope: !99)
!104 = !DILocation(line: 73, column: 44, scope: !99)
!105 = !DILocation(line: 73, column: 9, scope: !99)
!106 = !DILocation(line: 74, column: 19, scope: !99)
!107 = !DILocation(line: 74, column: 9, scope: !99)
!108 = !DILocation(line: 75, column: 14, scope: !99)
!109 = !DILocation(line: 75, column: 9, scope: !99)
!110 = !DILocation(line: 77, column: 1, scope: !76)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 82, type: !4)
!113 = !DILocation(line: 82, column: 12, scope: !111)
!114 = !DILocation(line: 83, column: 20, scope: !111)
!115 = !DILocation(line: 83, column: 10, scope: !111)
!116 = !DILocation(line: 84, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !15, line: 84, column: 9)
!118 = !DILocation(line: 84, column: 14, scope: !117)
!119 = !DILocation(line: 84, column: 9, scope: !111)
!120 = !DILocation(line: 84, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 84, column: 23)
!122 = !DILocation(line: 85, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !15, line: 85, column: 8)
!124 = !DILocation(line: 85, column: 8, scope: !111)
!125 = !DILocation(line: 88, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !15, line: 86, column: 5)
!127 = !DILocation(line: 88, column: 9, scope: !126)
!128 = !DILocation(line: 89, column: 9, scope: !126)
!129 = !DILocation(line: 89, column: 20, scope: !126)
!130 = !DILocation(line: 90, column: 5, scope: !126)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !15, line: 92, type: !39)
!132 = distinct !DILexicalBlock(scope: !111, file: !15, line: 91, column: 5)
!133 = !DILocation(line: 92, column: 14, scope: !132)
!134 = !DILocation(line: 94, column: 18, scope: !132)
!135 = !DILocation(line: 94, column: 31, scope: !132)
!136 = !DILocation(line: 94, column: 24, scope: !132)
!137 = !DILocation(line: 94, column: 44, scope: !132)
!138 = !DILocation(line: 94, column: 9, scope: !132)
!139 = !DILocation(line: 95, column: 19, scope: !132)
!140 = !DILocation(line: 95, column: 9, scope: !132)
!141 = !DILocation(line: 96, column: 14, scope: !132)
!142 = !DILocation(line: 96, column: 9, scope: !132)
!143 = !DILocation(line: 98, column: 1, scope: !111)
