; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void %2(i8* %3), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %0 = load i8*, i8** %data.addr, align 8, !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  %call = call i8* @strncat(i8* %0, i8* %arraydecay1, i64 100) #6, !dbg !53
  %1 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @printLine(i8* %1), !dbg !55
  %2 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @free(i8* %2) #6, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44_good() #0 !dbg !59 {
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
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

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
  store i8* null, i8** %data, align 8, !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !87
  store i8* %call, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  call void %2(i8* %3), !dbg !97
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !100 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %0 = load i8*, i8** %data.addr, align 8, !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  %call = call i8* @strncat(i8* %0, i8* %arraydecay1, i64 100) #6, !dbg !111
  %1 = load i8*, i8** %data.addr, align 8, !dbg !112
  call void @printLine(i8* %1), !dbg !113
  %2 = load i8*, i8** %data.addr, align 8, !dbg !114
  call void @free(i8* %2) #6, !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44_bad", scope: !15, file: !15, line: 36, type: !16, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 38, type: !4)
!19 = !DILocation(line: 38, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 40, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 40, column: 12, scope: !14)
!25 = !DILocation(line: 41, column: 10, scope: !14)
!26 = !DILocation(line: 43, column: 20, scope: !14)
!27 = !DILocation(line: 43, column: 10, scope: !14)
!28 = !DILocation(line: 44, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 9)
!30 = !DILocation(line: 44, column: 14, scope: !29)
!31 = !DILocation(line: 44, column: 9, scope: !14)
!32 = !DILocation(line: 44, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 44, column: 23)
!34 = !DILocation(line: 45, column: 5, scope: !14)
!35 = !DILocation(line: 45, column: 13, scope: !14)
!36 = !DILocation(line: 47, column: 5, scope: !14)
!37 = !DILocation(line: 47, column: 13, scope: !14)
!38 = !DILocation(line: 48, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !15, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 28, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !15, line: 26, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 25, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 26, column: 14, scope: !43)
!48 = !DILocation(line: 27, column: 9, scope: !43)
!49 = !DILocation(line: 28, column: 9, scope: !43)
!50 = !DILocation(line: 28, column: 23, scope: !43)
!51 = !DILocation(line: 30, column: 17, scope: !43)
!52 = !DILocation(line: 30, column: 23, scope: !43)
!53 = !DILocation(line: 30, column: 9, scope: !43)
!54 = !DILocation(line: 31, column: 19, scope: !43)
!55 = !DILocation(line: 31, column: 9, scope: !43)
!56 = !DILocation(line: 32, column: 14, scope: !43)
!57 = !DILocation(line: 32, column: 9, scope: !43)
!58 = !DILocation(line: 34, column: 1, scope: !39)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_44_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 82, column: 5, scope: !59)
!61 = !DILocation(line: 83, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 94, type: !63, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !15, line: 94, type: !65)
!68 = !DILocation(line: 94, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !15, line: 94, type: !66)
!70 = !DILocation(line: 94, column: 27, scope: !62)
!71 = !DILocation(line: 97, column: 22, scope: !62)
!72 = !DILocation(line: 97, column: 12, scope: !62)
!73 = !DILocation(line: 97, column: 5, scope: !62)
!74 = !DILocation(line: 99, column: 5, scope: !62)
!75 = !DILocation(line: 100, column: 5, scope: !62)
!76 = !DILocation(line: 101, column: 5, scope: !62)
!77 = !DILocation(line: 104, column: 5, scope: !62)
!78 = !DILocation(line: 105, column: 5, scope: !62)
!79 = !DILocation(line: 106, column: 5, scope: !62)
!80 = !DILocation(line: 108, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 70, type: !4)
!83 = !DILocation(line: 70, column: 12, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !15, line: 71, type: !21)
!85 = !DILocation(line: 71, column: 12, scope: !81)
!86 = !DILocation(line: 72, column: 10, scope: !81)
!87 = !DILocation(line: 74, column: 20, scope: !81)
!88 = !DILocation(line: 74, column: 10, scope: !81)
!89 = !DILocation(line: 75, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !81, file: !15, line: 75, column: 9)
!91 = !DILocation(line: 75, column: 14, scope: !90)
!92 = !DILocation(line: 75, column: 9, scope: !81)
!93 = !DILocation(line: 75, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 75, column: 23)
!95 = !DILocation(line: 76, column: 5, scope: !81)
!96 = !DILocation(line: 76, column: 13, scope: !81)
!97 = !DILocation(line: 77, column: 5, scope: !81)
!98 = !DILocation(line: 77, column: 13, scope: !81)
!99 = !DILocation(line: 78, column: 1, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 55, type: !22, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", arg: 1, scope: !100, file: !15, line: 55, type: !4)
!102 = !DILocation(line: 55, column: 32, scope: !100)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 58, type: !44)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 57, column: 5)
!105 = !DILocation(line: 58, column: 14, scope: !104)
!106 = !DILocation(line: 59, column: 9, scope: !104)
!107 = !DILocation(line: 60, column: 9, scope: !104)
!108 = !DILocation(line: 60, column: 23, scope: !104)
!109 = !DILocation(line: 62, column: 17, scope: !104)
!110 = !DILocation(line: 62, column: 23, scope: !104)
!111 = !DILocation(line: 62, column: 9, scope: !104)
!112 = !DILocation(line: 63, column: 19, scope: !104)
!113 = !DILocation(line: 63, column: 9, scope: !104)
!114 = !DILocation(line: 64, column: 14, scope: !104)
!115 = !DILocation(line: 64, column: 9, scope: !104)
!116 = !DILocation(line: 66, column: 1, scope: !100)
