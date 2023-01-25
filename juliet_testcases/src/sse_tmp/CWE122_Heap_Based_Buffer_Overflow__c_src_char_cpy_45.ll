; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  store i8* %3, i8** @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_badData, align 8, !dbg !66
  store i8* %0, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !67, metadata !DIExpression()), !dbg !72
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !72
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !73
  %2 = load i8*, i8** %data, align 8, !dbg !74
  %call = call i8* @strcpy(i8* %arraydecay, i8* %2) #6, !dbg !75
  %3 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %3), !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  call void @free(i8* %4) #6, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %cmp = icmp eq i8* %0, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  store i8* %3, i8** @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_goodG2BData, align 8, !dbg !97
  call void @goodG2BSink(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_goodG2BData, align 8, !dbg !103
  store i8* %0, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !108
  %call = call i8* @strcpy(i8* %arraydecay, i8* %2) #6, !dbg !109
  %3 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %3), !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %4) #6, !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_bad", scope: !13, file: !13, line: 38, type: !21, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 40, type: !6)
!24 = !DILocation(line: 40, column: 12, scope: !20)
!25 = !DILocation(line: 41, column: 20, scope: !20)
!26 = !DILocation(line: 41, column: 10, scope: !20)
!27 = !DILocation(line: 42, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !13, line: 42, column: 9)
!29 = !DILocation(line: 42, column: 14, scope: !28)
!30 = !DILocation(line: 42, column: 9, scope: !20)
!31 = !DILocation(line: 42, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !13, line: 42, column: 23)
!33 = !DILocation(line: 44, column: 12, scope: !20)
!34 = !DILocation(line: 44, column: 5, scope: !20)
!35 = !DILocation(line: 45, column: 5, scope: !20)
!36 = !DILocation(line: 45, column: 17, scope: !20)
!37 = !DILocation(line: 46, column: 68, scope: !20)
!38 = !DILocation(line: 46, column: 66, scope: !20)
!39 = !DILocation(line: 47, column: 5, scope: !20)
!40 = !DILocation(line: 48, column: 1, scope: !20)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_45_good", scope: !13, file: !13, line: 79, type: !21, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 81, column: 5, scope: !41)
!43 = !DILocation(line: 82, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 93, type: !45, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !13, line: 93, type: !47)
!50 = !DILocation(line: 93, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !13, line: 93, type: !48)
!52 = !DILocation(line: 93, column: 27, scope: !44)
!53 = !DILocation(line: 96, column: 22, scope: !44)
!54 = !DILocation(line: 96, column: 12, scope: !44)
!55 = !DILocation(line: 96, column: 5, scope: !44)
!56 = !DILocation(line: 98, column: 5, scope: !44)
!57 = !DILocation(line: 99, column: 5, scope: !44)
!58 = !DILocation(line: 100, column: 5, scope: !44)
!59 = !DILocation(line: 103, column: 5, scope: !44)
!60 = !DILocation(line: 104, column: 5, scope: !44)
!61 = !DILocation(line: 105, column: 5, scope: !44)
!62 = !DILocation(line: 107, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "data", scope: !63, file: !13, line: 28, type: !6)
!65 = !DILocation(line: 28, column: 12, scope: !63)
!66 = !DILocation(line: 28, column: 19, scope: !63)
!67 = !DILocalVariable(name: "dest", scope: !68, file: !13, line: 30, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !13, line: 29, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 50)
!72 = !DILocation(line: 30, column: 14, scope: !68)
!73 = !DILocation(line: 32, column: 16, scope: !68)
!74 = !DILocation(line: 32, column: 22, scope: !68)
!75 = !DILocation(line: 32, column: 9, scope: !68)
!76 = !DILocation(line: 33, column: 19, scope: !68)
!77 = !DILocation(line: 33, column: 9, scope: !68)
!78 = !DILocation(line: 34, column: 14, scope: !68)
!79 = !DILocation(line: 34, column: 9, scope: !68)
!80 = !DILocation(line: 36, column: 1, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 67, type: !21, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !13, line: 69, type: !6)
!83 = !DILocation(line: 69, column: 12, scope: !81)
!84 = !DILocation(line: 70, column: 20, scope: !81)
!85 = !DILocation(line: 70, column: 10, scope: !81)
!86 = !DILocation(line: 71, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !13, line: 71, column: 9)
!88 = !DILocation(line: 71, column: 14, scope: !87)
!89 = !DILocation(line: 71, column: 9, scope: !81)
!90 = !DILocation(line: 71, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !13, line: 71, column: 23)
!92 = !DILocation(line: 73, column: 12, scope: !81)
!93 = !DILocation(line: 73, column: 5, scope: !81)
!94 = !DILocation(line: 74, column: 5, scope: !81)
!95 = !DILocation(line: 74, column: 16, scope: !81)
!96 = !DILocation(line: 75, column: 72, scope: !81)
!97 = !DILocation(line: 75, column: 70, scope: !81)
!98 = !DILocation(line: 76, column: 5, scope: !81)
!99 = !DILocation(line: 77, column: 1, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !13, line: 57, type: !6)
!102 = !DILocation(line: 57, column: 12, scope: !100)
!103 = !DILocation(line: 57, column: 19, scope: !100)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !13, line: 59, type: !69)
!105 = distinct !DILexicalBlock(scope: !100, file: !13, line: 58, column: 5)
!106 = !DILocation(line: 59, column: 14, scope: !105)
!107 = !DILocation(line: 61, column: 16, scope: !105)
!108 = !DILocation(line: 61, column: 22, scope: !105)
!109 = !DILocation(line: 61, column: 9, scope: !105)
!110 = !DILocation(line: 62, column: 19, scope: !105)
!111 = !DILocation(line: 62, column: 9, scope: !105)
!112 = !DILocation(line: 63, column: 14, scope: !105)
!113 = !DILocation(line: 63, column: 9, scope: !105)
!114 = !DILocation(line: 65, column: 1, scope: !100)
