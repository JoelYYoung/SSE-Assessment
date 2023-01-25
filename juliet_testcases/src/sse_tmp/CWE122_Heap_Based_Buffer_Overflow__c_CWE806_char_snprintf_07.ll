; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp1 = icmp eq i32 %1, 5, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !35

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !52
  %7 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %7), !dbg !54
  %8 = load i8*, i8** %data, align 8, !dbg !55
  call void @free(i8* %8) #7, !dbg !56
  ret void, !dbg !57
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
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
  %1 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp1 = icmp ne i32 %1, 5, !dbg !93
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !94

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end3, !dbg !97

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !106
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !109
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !110
  %7 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %7), !dbg !112
  %8 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %8) #7, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !119
  store i8* %call, i8** %data, align 8, !dbg !120
  %0 = load i8*, i8** %data, align 8, !dbg !121
  %cmp = icmp eq i8* %0, null, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !127
  %cmp1 = icmp eq i32 %1, 5, !dbg !129
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !130

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !133
  %3 = load i8*, i8** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  br label %if.end3, !dbg !136

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !139
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !140
  %5 = load i8*, i8** %data, align 8, !dbg !141
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !142
  %6 = load i8*, i8** %data, align 8, !dbg !143
  %call5 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !144
  %7 = load i8*, i8** %data, align 8, !dbg !145
  call void @printLine(i8* %7), !dbg !146
  %8 = load i8*, i8** %data, align 8, !dbg !147
  call void @free(i8* %8) #7, !dbg !148
  ret void, !dbg !149
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 31, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07_bad", scope: !11, file: !11, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 37, type: !6)
!23 = !DILocation(line: 37, column: 12, scope: !19)
!24 = !DILocation(line: 38, column: 20, scope: !19)
!25 = !DILocation(line: 38, column: 10, scope: !19)
!26 = !DILocation(line: 39, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !11, line: 39, column: 9)
!28 = !DILocation(line: 39, column: 14, scope: !27)
!29 = !DILocation(line: 39, column: 9, scope: !19)
!30 = !DILocation(line: 39, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !11, line: 39, column: 23)
!32 = !DILocation(line: 40, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !11, line: 40, column: 8)
!34 = !DILocation(line: 40, column: 18, scope: !33)
!35 = !DILocation(line: 40, column: 8, scope: !19)
!36 = !DILocation(line: 43, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 41, column: 5)
!38 = !DILocation(line: 43, column: 9, scope: !37)
!39 = !DILocation(line: 44, column: 9, scope: !37)
!40 = !DILocation(line: 44, column: 21, scope: !37)
!41 = !DILocation(line: 45, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !11, line: 47, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !11, line: 46, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !45)
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
!57 = !DILocation(line: 53, column: 1, scope: !19)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_07_good", scope: !11, file: !11, line: 106, type: !20, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 108, column: 5, scope: !58)
!60 = !DILocation(line: 109, column: 5, scope: !58)
!61 = !DILocation(line: 110, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 122, type: !63, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!12, !12, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !11, line: 122, type: !12)
!67 = !DILocation(line: 122, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !11, line: 122, type: !65)
!69 = !DILocation(line: 122, column: 27, scope: !62)
!70 = !DILocation(line: 125, column: 22, scope: !62)
!71 = !DILocation(line: 125, column: 12, scope: !62)
!72 = !DILocation(line: 125, column: 5, scope: !62)
!73 = !DILocation(line: 127, column: 5, scope: !62)
!74 = !DILocation(line: 128, column: 5, scope: !62)
!75 = !DILocation(line: 129, column: 5, scope: !62)
!76 = !DILocation(line: 132, column: 5, scope: !62)
!77 = !DILocation(line: 133, column: 5, scope: !62)
!78 = !DILocation(line: 134, column: 5, scope: !62)
!79 = !DILocation(line: 136, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !11, line: 62, type: !6)
!82 = !DILocation(line: 62, column: 12, scope: !80)
!83 = !DILocation(line: 63, column: 20, scope: !80)
!84 = !DILocation(line: 63, column: 10, scope: !80)
!85 = !DILocation(line: 64, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !11, line: 64, column: 9)
!87 = !DILocation(line: 64, column: 14, scope: !86)
!88 = !DILocation(line: 64, column: 9, scope: !80)
!89 = !DILocation(line: 64, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !11, line: 64, column: 23)
!91 = !DILocation(line: 65, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !80, file: !11, line: 65, column: 8)
!93 = !DILocation(line: 65, column: 18, scope: !92)
!94 = !DILocation(line: 65, column: 8, scope: !80)
!95 = !DILocation(line: 68, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !11, line: 66, column: 5)
!97 = !DILocation(line: 69, column: 5, scope: !96)
!98 = !DILocation(line: 73, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !11, line: 71, column: 5)
!100 = !DILocation(line: 73, column: 9, scope: !99)
!101 = !DILocation(line: 74, column: 9, scope: !99)
!102 = !DILocation(line: 74, column: 20, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !11, line: 77, type: !44)
!104 = distinct !DILexicalBlock(scope: !80, file: !11, line: 76, column: 5)
!105 = !DILocation(line: 77, column: 14, scope: !104)
!106 = !DILocation(line: 79, column: 18, scope: !104)
!107 = !DILocation(line: 79, column: 31, scope: !104)
!108 = !DILocation(line: 79, column: 24, scope: !104)
!109 = !DILocation(line: 79, column: 44, scope: !104)
!110 = !DILocation(line: 79, column: 9, scope: !104)
!111 = !DILocation(line: 80, column: 19, scope: !104)
!112 = !DILocation(line: 80, column: 9, scope: !104)
!113 = !DILocation(line: 81, column: 14, scope: !104)
!114 = !DILocation(line: 81, column: 9, scope: !104)
!115 = !DILocation(line: 83, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !11, line: 88, type: !6)
!118 = !DILocation(line: 88, column: 12, scope: !116)
!119 = !DILocation(line: 89, column: 20, scope: !116)
!120 = !DILocation(line: 89, column: 10, scope: !116)
!121 = !DILocation(line: 90, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !11, line: 90, column: 9)
!123 = !DILocation(line: 90, column: 14, scope: !122)
!124 = !DILocation(line: 90, column: 9, scope: !116)
!125 = !DILocation(line: 90, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !11, line: 90, column: 23)
!127 = !DILocation(line: 91, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !11, line: 91, column: 8)
!129 = !DILocation(line: 91, column: 18, scope: !128)
!130 = !DILocation(line: 91, column: 8, scope: !116)
!131 = !DILocation(line: 94, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !11, line: 92, column: 5)
!133 = !DILocation(line: 94, column: 9, scope: !132)
!134 = !DILocation(line: 95, column: 9, scope: !132)
!135 = !DILocation(line: 95, column: 20, scope: !132)
!136 = !DILocation(line: 96, column: 5, scope: !132)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !11, line: 98, type: !44)
!138 = distinct !DILexicalBlock(scope: !116, file: !11, line: 97, column: 5)
!139 = !DILocation(line: 98, column: 14, scope: !138)
!140 = !DILocation(line: 100, column: 18, scope: !138)
!141 = !DILocation(line: 100, column: 31, scope: !138)
!142 = !DILocation(line: 100, column: 24, scope: !138)
!143 = !DILocation(line: 100, column: 44, scope: !138)
!144 = !DILocation(line: 100, column: 9, scope: !138)
!145 = !DILocation(line: 101, column: 19, scope: !138)
!146 = !DILocation(line: 101, column: 9, scope: !138)
!147 = !DILocation(line: 102, column: 14, scope: !138)
!148 = !DILocation(line: 102, column: 9, scope: !138)
!149 = !DILocation(line: 104, column: 1, scope: !116)
