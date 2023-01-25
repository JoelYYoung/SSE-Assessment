; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !23
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !34
  %cmp1 = icmp slt i32 %1, 1, !dbg !36
  br i1 %cmp1, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %4, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !54
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !55
  %6 = load i8*, i8** %data, align 8, !dbg !56
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %6) #6, !dbg !57
  %7 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* %7), !dbg !59
  %8 = load i8*, i8** %data, align 8, !dbg !60
  call void @free(i8* %8) #6, !dbg !61
  ret void, !dbg !62
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
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  store i32 0, i32* %h, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %h, align 4, !dbg !100
  %cmp1 = icmp slt i32 %1, 1, !dbg !102
  br i1 %cmp1, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %h, align 4, !dbg !110
  %inc = add nsw i32 %4, 1, !dbg !110
  store i32 %inc, i32* %h, align 4, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !117
  %6 = load i8*, i8** %data, align 8, !dbg !118
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %6) #6, !dbg !119
  %7 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %7), !dbg !121
  %8 = load i8*, i8** %data, align 8, !dbg !122
  call void @free(i8* %8) #6, !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 20, scope: !14)
!24 = !DILocation(line: 27, column: 10, scope: !14)
!25 = !DILocation(line: 28, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 9)
!27 = !DILocation(line: 28, column: 14, scope: !26)
!28 = !DILocation(line: 28, column: 9, scope: !14)
!29 = !DILocation(line: 28, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 28, column: 23)
!31 = !DILocation(line: 29, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 29, column: 9, scope: !32)
!34 = !DILocation(line: 29, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 29, column: 5)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 5, scope: !32)
!38 = !DILocation(line: 32, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 30, column: 5)
!40 = !DILocation(line: 32, column: 9, scope: !39)
!41 = !DILocation(line: 33, column: 9, scope: !39)
!42 = !DILocation(line: 33, column: 21, scope: !39)
!43 = !DILocation(line: 34, column: 5, scope: !39)
!44 = !DILocation(line: 29, column: 24, scope: !35)
!45 = !DILocation(line: 29, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 34, column: 5, scope: !32)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "dest", scope: !50, file: !15, line: 36, type: !51)
!50 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 36, column: 14, scope: !50)
!55 = !DILocation(line: 38, column: 16, scope: !50)
!56 = !DILocation(line: 38, column: 22, scope: !50)
!57 = !DILocation(line: 38, column: 9, scope: !50)
!58 = !DILocation(line: 39, column: 19, scope: !50)
!59 = !DILocation(line: 39, column: 9, scope: !50)
!60 = !DILocation(line: 40, column: 14, scope: !50)
!61 = !DILocation(line: 40, column: 9, scope: !50)
!62 = !DILocation(line: 42, column: 1, scope: !14)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_17_good", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 72, column: 5, scope: !63)
!65 = !DILocation(line: 73, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 85, type: !67, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!19, !19, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 85, type: !19)
!71 = !DILocation(line: 85, column: 14, scope: !66)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 85, type: !69)
!73 = !DILocation(line: 85, column: 27, scope: !66)
!74 = !DILocation(line: 88, column: 22, scope: !66)
!75 = !DILocation(line: 88, column: 12, scope: !66)
!76 = !DILocation(line: 88, column: 5, scope: !66)
!77 = !DILocation(line: 90, column: 5, scope: !66)
!78 = !DILocation(line: 91, column: 5, scope: !66)
!79 = !DILocation(line: 92, column: 5, scope: !66)
!80 = !DILocation(line: 95, column: 5, scope: !66)
!81 = !DILocation(line: 96, column: 5, scope: !66)
!82 = !DILocation(line: 97, column: 5, scope: !66)
!83 = !DILocation(line: 99, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "h", scope: !84, file: !15, line: 51, type: !19)
!86 = !DILocation(line: 51, column: 9, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 52, type: !4)
!88 = !DILocation(line: 52, column: 12, scope: !84)
!89 = !DILocation(line: 53, column: 20, scope: !84)
!90 = !DILocation(line: 53, column: 10, scope: !84)
!91 = !DILocation(line: 54, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !15, line: 54, column: 9)
!93 = !DILocation(line: 54, column: 14, scope: !92)
!94 = !DILocation(line: 54, column: 9, scope: !84)
!95 = !DILocation(line: 54, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 54, column: 23)
!97 = !DILocation(line: 55, column: 11, scope: !98)
!98 = distinct !DILexicalBlock(scope: !84, file: !15, line: 55, column: 5)
!99 = !DILocation(line: 55, column: 9, scope: !98)
!100 = !DILocation(line: 55, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !15, line: 55, column: 5)
!102 = !DILocation(line: 55, column: 18, scope: !101)
!103 = !DILocation(line: 55, column: 5, scope: !98)
!104 = !DILocation(line: 58, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 56, column: 5)
!106 = !DILocation(line: 58, column: 9, scope: !105)
!107 = !DILocation(line: 59, column: 9, scope: !105)
!108 = !DILocation(line: 59, column: 20, scope: !105)
!109 = !DILocation(line: 60, column: 5, scope: !105)
!110 = !DILocation(line: 55, column: 24, scope: !101)
!111 = !DILocation(line: 55, column: 5, scope: !101)
!112 = distinct !{!112, !103, !113, !48}
!113 = !DILocation(line: 60, column: 5, scope: !98)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !15, line: 62, type: !51)
!115 = distinct !DILexicalBlock(scope: !84, file: !15, line: 61, column: 5)
!116 = !DILocation(line: 62, column: 14, scope: !115)
!117 = !DILocation(line: 64, column: 16, scope: !115)
!118 = !DILocation(line: 64, column: 22, scope: !115)
!119 = !DILocation(line: 64, column: 9, scope: !115)
!120 = !DILocation(line: 65, column: 19, scope: !115)
!121 = !DILocation(line: 65, column: 9, scope: !115)
!122 = !DILocation(line: 66, column: 14, scope: !115)
!123 = !DILocation(line: 66, column: 9, scope: !115)
!124 = !DILocation(line: 68, column: 1, scope: !84)
