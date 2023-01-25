; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !52
  %1 = load i8*, i8** %data.addr, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !53
  store i8 0, i8* %arrayidx2, align 1, !dbg !54
  %2 = load i8*, i8** %data.addr, align 8, !dbg !55
  call void @printLine(i8* %2), !dbg !56
  %3 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @free(i8* %3) #7, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !85, metadata !DIExpression()), !dbg !86
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !88
  store i8* %call, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %cmp = icmp eq i8* %0, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !99
  call void %2(i8* %3), !dbg !98
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !101 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %0 = load i8*, i8** %data.addr, align 8, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !111
  %1 = load i8*, i8** %data.addr, align 8, !dbg !112
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !112
  store i8 0, i8* %arrayidx2, align 1, !dbg !113
  %2 = load i8*, i8** %data.addr, align 8, !dbg !114
  call void @printLine(i8* %2), !dbg !115
  %3 = load i8*, i8** %data.addr, align 8, !dbg !116
  call void @free(i8* %3) #7, !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 41, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 41, column: 12, scope: !14)
!25 = !DILocation(line: 42, column: 10, scope: !14)
!26 = !DILocation(line: 44, column: 20, scope: !14)
!27 = !DILocation(line: 44, column: 10, scope: !14)
!28 = !DILocation(line: 45, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 9)
!30 = !DILocation(line: 45, column: 14, scope: !29)
!31 = !DILocation(line: 45, column: 9, scope: !14)
!32 = !DILocation(line: 45, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 45, column: 23)
!34 = !DILocation(line: 46, column: 5, scope: !14)
!35 = !DILocation(line: 46, column: 13, scope: !14)
!36 = !DILocation(line: 48, column: 5, scope: !14)
!37 = !DILocation(line: 48, column: 13, scope: !14)
!38 = !DILocation(line: 49, column: 1, scope: !14)
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
!52 = !DILocation(line: 30, column: 9, scope: !43)
!53 = !DILocation(line: 31, column: 9, scope: !43)
!54 = !DILocation(line: 31, column: 21, scope: !43)
!55 = !DILocation(line: 32, column: 19, scope: !43)
!56 = !DILocation(line: 32, column: 9, scope: !43)
!57 = !DILocation(line: 33, column: 14, scope: !43)
!58 = !DILocation(line: 33, column: 9, scope: !43)
!59 = !DILocation(line: 35, column: 1, scope: !39)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_44_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 84, column: 5, scope: !60)
!62 = !DILocation(line: 85, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !64, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 96, type: !66)
!69 = !DILocation(line: 96, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 96, type: !67)
!71 = !DILocation(line: 96, column: 27, scope: !63)
!72 = !DILocation(line: 99, column: 22, scope: !63)
!73 = !DILocation(line: 99, column: 12, scope: !63)
!74 = !DILocation(line: 99, column: 5, scope: !63)
!75 = !DILocation(line: 101, column: 5, scope: !63)
!76 = !DILocation(line: 102, column: 5, scope: !63)
!77 = !DILocation(line: 103, column: 5, scope: !63)
!78 = !DILocation(line: 106, column: 5, scope: !63)
!79 = !DILocation(line: 107, column: 5, scope: !63)
!80 = !DILocation(line: 108, column: 5, scope: !63)
!81 = !DILocation(line: 110, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 72, type: !4)
!84 = !DILocation(line: 72, column: 12, scope: !82)
!85 = !DILocalVariable(name: "funcPtr", scope: !82, file: !15, line: 73, type: !21)
!86 = !DILocation(line: 73, column: 12, scope: !82)
!87 = !DILocation(line: 74, column: 10, scope: !82)
!88 = !DILocation(line: 76, column: 20, scope: !82)
!89 = !DILocation(line: 76, column: 10, scope: !82)
!90 = !DILocation(line: 77, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !82, file: !15, line: 77, column: 9)
!92 = !DILocation(line: 77, column: 14, scope: !91)
!93 = !DILocation(line: 77, column: 9, scope: !82)
!94 = !DILocation(line: 77, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 77, column: 23)
!96 = !DILocation(line: 78, column: 5, scope: !82)
!97 = !DILocation(line: 78, column: 13, scope: !82)
!98 = !DILocation(line: 79, column: 5, scope: !82)
!99 = !DILocation(line: 79, column: 13, scope: !82)
!100 = !DILocation(line: 80, column: 1, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 56, type: !22, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", arg: 1, scope: !101, file: !15, line: 56, type: !4)
!103 = !DILocation(line: 56, column: 32, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !15, line: 59, type: !44)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 58, column: 5)
!106 = !DILocation(line: 59, column: 14, scope: !105)
!107 = !DILocation(line: 60, column: 9, scope: !105)
!108 = !DILocation(line: 61, column: 9, scope: !105)
!109 = !DILocation(line: 61, column: 23, scope: !105)
!110 = !DILocation(line: 63, column: 17, scope: !105)
!111 = !DILocation(line: 63, column: 9, scope: !105)
!112 = !DILocation(line: 64, column: 9, scope: !105)
!113 = !DILocation(line: 64, column: 21, scope: !105)
!114 = !DILocation(line: 65, column: 19, scope: !105)
!115 = !DILocation(line: 65, column: 9, scope: !105)
!116 = !DILocation(line: 66, column: 14, scope: !105)
!117 = !DILocation(line: 66, column: 9, scope: !105)
!118 = !DILocation(line: 68, column: 1, scope: !101)
