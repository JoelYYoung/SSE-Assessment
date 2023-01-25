; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  call void %3(i8* %4), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %1 = load i8*, i8** %data.addr, align 8, !dbg !50
  %call = call i64 @strlen(i8* %1) #9, !dbg !51
  %2 = load i8*, i8** %data.addr, align 8, !dbg !52
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %2) #7, !dbg !53
  %3 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @printLine(i8* %3), !dbg !55
  %4 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @free(i8* %4) #7, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !84, metadata !DIExpression()), !dbg !85
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !98
  %4 = load i8*, i8** %data, align 8, !dbg !99
  call void %3(i8* %4), !dbg !98
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !101 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !107
  %1 = load i8*, i8** %data.addr, align 8, !dbg !108
  %call = call i64 @strlen(i8* %1) #9, !dbg !109
  %2 = load i8*, i8** %data.addr, align 8, !dbg !110
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %2) #7, !dbg !111
  %3 = load i8*, i8** %data.addr, align 8, !dbg !112
  call void @printLine(i8* %3), !dbg !113
  %4 = load i8*, i8** %data.addr, align 8, !dbg !114
  call void @free(i8* %4) #7, !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_bad", scope: !15, file: !15, line: 40, type: !16, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 42, type: !4)
!19 = !DILocation(line: 42, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 44, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 44, column: 12, scope: !14)
!25 = !DILocation(line: 45, column: 20, scope: !14)
!26 = !DILocation(line: 45, column: 10, scope: !14)
!27 = !DILocation(line: 46, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 9)
!29 = !DILocation(line: 46, column: 14, scope: !28)
!30 = !DILocation(line: 46, column: 9, scope: !14)
!31 = !DILocation(line: 46, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 46, column: 23)
!33 = !DILocation(line: 48, column: 12, scope: !14)
!34 = !DILocation(line: 48, column: 5, scope: !14)
!35 = !DILocation(line: 49, column: 5, scope: !14)
!36 = !DILocation(line: 49, column: 17, scope: !14)
!37 = !DILocation(line: 51, column: 5, scope: !14)
!38 = !DILocation(line: 51, column: 13, scope: !14)
!39 = !DILocation(line: 52, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 29, type: !22, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !15, line: 29, type: !4)
!42 = !DILocation(line: 29, column: 28, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 32, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 31, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 32, column: 14, scope: !44)
!49 = !DILocation(line: 34, column: 18, scope: !44)
!50 = !DILocation(line: 34, column: 31, scope: !44)
!51 = !DILocation(line: 34, column: 24, scope: !44)
!52 = !DILocation(line: 34, column: 44, scope: !44)
!53 = !DILocation(line: 34, column: 9, scope: !44)
!54 = !DILocation(line: 35, column: 19, scope: !44)
!55 = !DILocation(line: 35, column: 9, scope: !44)
!56 = !DILocation(line: 36, column: 14, scope: !44)
!57 = !DILocation(line: 36, column: 9, scope: !44)
!58 = !DILocation(line: 38, column: 1, scope: !40)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 84, column: 5, scope: !59)
!61 = !DILocation(line: 85, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !63, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !15, line: 96, type: !65)
!68 = !DILocation(line: 96, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !15, line: 96, type: !66)
!70 = !DILocation(line: 96, column: 27, scope: !62)
!71 = !DILocation(line: 99, column: 22, scope: !62)
!72 = !DILocation(line: 99, column: 12, scope: !62)
!73 = !DILocation(line: 99, column: 5, scope: !62)
!74 = !DILocation(line: 101, column: 5, scope: !62)
!75 = !DILocation(line: 102, column: 5, scope: !62)
!76 = !DILocation(line: 103, column: 5, scope: !62)
!77 = !DILocation(line: 106, column: 5, scope: !62)
!78 = !DILocation(line: 107, column: 5, scope: !62)
!79 = !DILocation(line: 108, column: 5, scope: !62)
!80 = !DILocation(line: 110, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 72, type: !4)
!83 = !DILocation(line: 72, column: 12, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !15, line: 73, type: !21)
!85 = !DILocation(line: 73, column: 12, scope: !81)
!86 = !DILocation(line: 74, column: 20, scope: !81)
!87 = !DILocation(line: 74, column: 10, scope: !81)
!88 = !DILocation(line: 75, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !15, line: 75, column: 9)
!90 = !DILocation(line: 75, column: 14, scope: !89)
!91 = !DILocation(line: 75, column: 9, scope: !81)
!92 = !DILocation(line: 75, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 75, column: 23)
!94 = !DILocation(line: 77, column: 12, scope: !81)
!95 = !DILocation(line: 77, column: 5, scope: !81)
!96 = !DILocation(line: 78, column: 5, scope: !81)
!97 = !DILocation(line: 78, column: 16, scope: !81)
!98 = !DILocation(line: 79, column: 5, scope: !81)
!99 = !DILocation(line: 79, column: 13, scope: !81)
!100 = !DILocation(line: 80, column: 1, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 59, type: !22, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", arg: 1, scope: !101, file: !15, line: 59, type: !4)
!103 = !DILocation(line: 59, column: 32, scope: !101)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !15, line: 62, type: !45)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 61, column: 5)
!106 = !DILocation(line: 62, column: 14, scope: !105)
!107 = !DILocation(line: 64, column: 18, scope: !105)
!108 = !DILocation(line: 64, column: 31, scope: !105)
!109 = !DILocation(line: 64, column: 24, scope: !105)
!110 = !DILocation(line: 64, column: 44, scope: !105)
!111 = !DILocation(line: 64, column: 9, scope: !105)
!112 = !DILocation(line: 65, column: 19, scope: !105)
!113 = !DILocation(line: 65, column: 9, scope: !105)
!114 = !DILocation(line: 66, column: 14, scope: !105)
!115 = !DILocation(line: 66, column: 9, scope: !105)
!116 = !DILocation(line: 68, column: 1, scope: !101)
