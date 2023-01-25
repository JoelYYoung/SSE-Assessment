; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !23
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
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
  %7 = load i8*, i8** %data, align 8, !dbg !57
  %call2 = call i64 @strlen(i8* %7) #9, !dbg !58
  %call3 = call i8* @strncpy(i8* %arraydecay, i8* %6, i64 %call2) #7, !dbg !59
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !60
  store i8 0, i8* %arrayidx4, align 1, !dbg !61
  %8 = load i8*, i8** %data, align 8, !dbg !62
  call void @printLine(i8* %8), !dbg !63
  %9 = load i8*, i8** %data, align 8, !dbg !64
  call void @free(i8* %9) #7, !dbg !65
  ret void, !dbg !66
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !93
  store i8* %call, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %0, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  store i32 0, i32* %h, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %h, align 4, !dbg !104
  %cmp1 = icmp slt i32 %1, 1, !dbg !106
  br i1 %cmp1, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !110
  %3 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %h, align 4, !dbg !114
  %inc = add nsw i32 %4, 1, !dbg !114
  store i32 %inc, i32* %h, align 4, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !120
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  %7 = load i8*, i8** %data, align 8, !dbg !123
  %call2 = call i64 @strlen(i8* %7) #9, !dbg !124
  %call3 = call i8* @strncpy(i8* %arraydecay, i8* %6, i64 %call2) #7, !dbg !125
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !126
  store i8 0, i8* %arrayidx4, align 1, !dbg !127
  %8 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %8), !dbg !129
  %9 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* %9) #7, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!55 = !DILocation(line: 38, column: 17, scope: !50)
!56 = !DILocation(line: 38, column: 23, scope: !50)
!57 = !DILocation(line: 38, column: 36, scope: !50)
!58 = !DILocation(line: 38, column: 29, scope: !50)
!59 = !DILocation(line: 38, column: 9, scope: !50)
!60 = !DILocation(line: 39, column: 9, scope: !50)
!61 = !DILocation(line: 39, column: 20, scope: !50)
!62 = !DILocation(line: 40, column: 19, scope: !50)
!63 = !DILocation(line: 40, column: 9, scope: !50)
!64 = !DILocation(line: 41, column: 14, scope: !50)
!65 = !DILocation(line: 41, column: 9, scope: !50)
!66 = !DILocation(line: 43, column: 1, scope: !14)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_17_good", scope: !15, file: !15, line: 72, type: !16, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 74, column: 5, scope: !67)
!69 = !DILocation(line: 75, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 87, type: !71, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!19, !19, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !15, line: 87, type: !19)
!75 = !DILocation(line: 87, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !15, line: 87, type: !73)
!77 = !DILocation(line: 87, column: 27, scope: !70)
!78 = !DILocation(line: 90, column: 22, scope: !70)
!79 = !DILocation(line: 90, column: 12, scope: !70)
!80 = !DILocation(line: 90, column: 5, scope: !70)
!81 = !DILocation(line: 92, column: 5, scope: !70)
!82 = !DILocation(line: 93, column: 5, scope: !70)
!83 = !DILocation(line: 94, column: 5, scope: !70)
!84 = !DILocation(line: 97, column: 5, scope: !70)
!85 = !DILocation(line: 98, column: 5, scope: !70)
!86 = !DILocation(line: 99, column: 5, scope: !70)
!87 = !DILocation(line: 101, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "h", scope: !88, file: !15, line: 52, type: !19)
!90 = !DILocation(line: 52, column: 9, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 53, type: !4)
!92 = !DILocation(line: 53, column: 12, scope: !88)
!93 = !DILocation(line: 54, column: 20, scope: !88)
!94 = !DILocation(line: 54, column: 10, scope: !88)
!95 = !DILocation(line: 55, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !15, line: 55, column: 9)
!97 = !DILocation(line: 55, column: 14, scope: !96)
!98 = !DILocation(line: 55, column: 9, scope: !88)
!99 = !DILocation(line: 55, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 55, column: 23)
!101 = !DILocation(line: 56, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !88, file: !15, line: 56, column: 5)
!103 = !DILocation(line: 56, column: 9, scope: !102)
!104 = !DILocation(line: 56, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !15, line: 56, column: 5)
!106 = !DILocation(line: 56, column: 18, scope: !105)
!107 = !DILocation(line: 56, column: 5, scope: !102)
!108 = !DILocation(line: 59, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 57, column: 5)
!110 = !DILocation(line: 59, column: 9, scope: !109)
!111 = !DILocation(line: 60, column: 9, scope: !109)
!112 = !DILocation(line: 60, column: 20, scope: !109)
!113 = !DILocation(line: 61, column: 5, scope: !109)
!114 = !DILocation(line: 56, column: 24, scope: !105)
!115 = !DILocation(line: 56, column: 5, scope: !105)
!116 = distinct !{!116, !107, !117, !48}
!117 = !DILocation(line: 61, column: 5, scope: !102)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !15, line: 63, type: !51)
!119 = distinct !DILexicalBlock(scope: !88, file: !15, line: 62, column: 5)
!120 = !DILocation(line: 63, column: 14, scope: !119)
!121 = !DILocation(line: 65, column: 17, scope: !119)
!122 = !DILocation(line: 65, column: 23, scope: !119)
!123 = !DILocation(line: 65, column: 36, scope: !119)
!124 = !DILocation(line: 65, column: 29, scope: !119)
!125 = !DILocation(line: 65, column: 9, scope: !119)
!126 = !DILocation(line: 66, column: 9, scope: !119)
!127 = !DILocation(line: 66, column: 20, scope: !119)
!128 = !DILocation(line: 67, column: 19, scope: !119)
!129 = !DILocation(line: 67, column: 9, scope: !119)
!130 = !DILocation(line: 68, column: 14, scope: !119)
!131 = !DILocation(line: 68, column: 9, scope: !119)
!132 = !DILocation(line: 70, column: 1, scope: !88)
