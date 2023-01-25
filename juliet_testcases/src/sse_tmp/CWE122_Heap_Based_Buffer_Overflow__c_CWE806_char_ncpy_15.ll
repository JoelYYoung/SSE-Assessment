; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15_bad() #0 !dbg !14 {
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
  %5 = load i8*, i8** %data, align 8, !dbg !40
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !41
  %call2 = call i8* @strncpy(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !42
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !43
  store i8 0, i8* %arrayidx3, align 1, !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %6), !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* %7) #7, !dbg !48
  ret void, !dbg !49
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
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !76
  store i8* %call, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %cmp = icmp eq i8* %0, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %5 = load i8*, i8** %data, align 8, !dbg !93
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !94
  %call2 = call i8* @strncpy(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !95
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx3, align 1, !dbg !97
  %6 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %6), !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  call void @free(i8* %7) #7, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %cmp = icmp eq i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !120
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !121
  %4 = load i8*, i8** %data, align 8, !dbg !122
  %5 = load i8*, i8** %data, align 8, !dbg !123
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !124
  %call2 = call i8* @strncpy(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !125
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !126
  store i8 0, i8* %arrayidx3, align 1, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %6), !dbg !129
  %7 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* %7) #7, !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 32, column: 16, scope: !14)
!29 = !DILocation(line: 32, column: 9, scope: !14)
!30 = !DILocation(line: 33, column: 9, scope: !14)
!31 = !DILocation(line: 33, column: 21, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 41, column: 14, scope: !33)
!38 = !DILocation(line: 43, column: 17, scope: !33)
!39 = !DILocation(line: 43, column: 23, scope: !33)
!40 = !DILocation(line: 43, column: 36, scope: !33)
!41 = !DILocation(line: 43, column: 29, scope: !33)
!42 = !DILocation(line: 43, column: 9, scope: !33)
!43 = !DILocation(line: 44, column: 9, scope: !33)
!44 = !DILocation(line: 44, column: 20, scope: !33)
!45 = !DILocation(line: 45, column: 19, scope: !33)
!46 = !DILocation(line: 45, column: 9, scope: !33)
!47 = !DILocation(line: 46, column: 14, scope: !33)
!48 = !DILocation(line: 46, column: 9, scope: !33)
!49 = !DILocation(line: 48, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_15_good", scope: !15, file: !15, line: 110, type: !16, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 112, column: 5, scope: !50)
!52 = !DILocation(line: 113, column: 5, scope: !50)
!53 = !DILocation(line: 114, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 126, type: !55, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 126, type: !57)
!60 = !DILocation(line: 126, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 126, type: !58)
!62 = !DILocation(line: 126, column: 27, scope: !54)
!63 = !DILocation(line: 129, column: 22, scope: !54)
!64 = !DILocation(line: 129, column: 12, scope: !54)
!65 = !DILocation(line: 129, column: 5, scope: !54)
!66 = !DILocation(line: 131, column: 5, scope: !54)
!67 = !DILocation(line: 132, column: 5, scope: !54)
!68 = !DILocation(line: 133, column: 5, scope: !54)
!69 = !DILocation(line: 136, column: 5, scope: !54)
!70 = !DILocation(line: 137, column: 5, scope: !54)
!71 = !DILocation(line: 138, column: 5, scope: !54)
!72 = !DILocation(line: 140, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 57, type: !4)
!75 = !DILocation(line: 57, column: 12, scope: !73)
!76 = !DILocation(line: 58, column: 20, scope: !73)
!77 = !DILocation(line: 58, column: 10, scope: !73)
!78 = !DILocation(line: 59, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !15, line: 59, column: 9)
!80 = !DILocation(line: 59, column: 14, scope: !79)
!81 = !DILocation(line: 59, column: 9, scope: !73)
!82 = !DILocation(line: 59, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 59, column: 23)
!84 = !DILocation(line: 68, column: 16, scope: !73)
!85 = !DILocation(line: 68, column: 9, scope: !73)
!86 = !DILocation(line: 69, column: 9, scope: !73)
!87 = !DILocation(line: 69, column: 20, scope: !73)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !15, line: 73, type: !34)
!89 = distinct !DILexicalBlock(scope: !73, file: !15, line: 72, column: 5)
!90 = !DILocation(line: 73, column: 14, scope: !89)
!91 = !DILocation(line: 75, column: 17, scope: !89)
!92 = !DILocation(line: 75, column: 23, scope: !89)
!93 = !DILocation(line: 75, column: 36, scope: !89)
!94 = !DILocation(line: 75, column: 29, scope: !89)
!95 = !DILocation(line: 75, column: 9, scope: !89)
!96 = !DILocation(line: 76, column: 9, scope: !89)
!97 = !DILocation(line: 76, column: 20, scope: !89)
!98 = !DILocation(line: 77, column: 19, scope: !89)
!99 = !DILocation(line: 77, column: 9, scope: !89)
!100 = !DILocation(line: 78, column: 14, scope: !89)
!101 = !DILocation(line: 78, column: 9, scope: !89)
!102 = !DILocation(line: 80, column: 1, scope: !73)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 83, type: !16, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 85, type: !4)
!105 = !DILocation(line: 85, column: 12, scope: !103)
!106 = !DILocation(line: 86, column: 20, scope: !103)
!107 = !DILocation(line: 86, column: 10, scope: !103)
!108 = !DILocation(line: 87, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !15, line: 87, column: 9)
!110 = !DILocation(line: 87, column: 14, scope: !109)
!111 = !DILocation(line: 87, column: 9, scope: !103)
!112 = !DILocation(line: 87, column: 24, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 87, column: 23)
!114 = !DILocation(line: 92, column: 16, scope: !103)
!115 = !DILocation(line: 92, column: 9, scope: !103)
!116 = !DILocation(line: 93, column: 9, scope: !103)
!117 = !DILocation(line: 93, column: 20, scope: !103)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !15, line: 101, type: !34)
!119 = distinct !DILexicalBlock(scope: !103, file: !15, line: 100, column: 5)
!120 = !DILocation(line: 101, column: 14, scope: !119)
!121 = !DILocation(line: 103, column: 17, scope: !119)
!122 = !DILocation(line: 103, column: 23, scope: !119)
!123 = !DILocation(line: 103, column: 36, scope: !119)
!124 = !DILocation(line: 103, column: 29, scope: !119)
!125 = !DILocation(line: 103, column: 9, scope: !119)
!126 = !DILocation(line: 104, column: 9, scope: !119)
!127 = !DILocation(line: 104, column: 20, scope: !119)
!128 = !DILocation(line: 105, column: 19, scope: !119)
!129 = !DILocation(line: 105, column: 9, scope: !119)
!130 = !DILocation(line: 106, column: 14, scope: !119)
!131 = !DILocation(line: 106, column: 9, scope: !119)
!132 = !DILocation(line: 108, column: 1, scope: !103)
