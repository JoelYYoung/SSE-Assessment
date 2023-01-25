; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* null, i8** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %if.end
  %2 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %2, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !55
  %add = add i64 %call3, 1, !dbg !56
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay, i64 %add) #7, !dbg !57
  %5 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* %5), !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  call void @free(i8* %6) #7, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_bad(), !dbg !81
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
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %h, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  store i32 0, i32* %h, align 4, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !93
  %cmp = icmp slt i32 %0, 1, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !99
  %1 = load i8*, i8** %data, align 8, !dbg !100
  %cmp1 = icmp eq i8* %1, null, !dbg !102
  br i1 %cmp1, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %if.end
  %2 = load i32, i32* %h, align 4, !dbg !107
  %inc = add nsw i32 %2, 1, !dbg !107
  store i32 %inc, i32* %h, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !115
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !116
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !117
  %add = add i64 %call3, 1, !dbg !118
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay, i64 %add) #7, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %5), !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  call void @free(i8* %6) #7, !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 30, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 12, scope: !14)
!23 = !DILocation(line: 32, column: 10, scope: !14)
!24 = !DILocation(line: 33, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 33, column: 9, scope: !25)
!27 = !DILocation(line: 33, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 33, column: 5)
!29 = !DILocation(line: 33, column: 18, scope: !28)
!30 = !DILocation(line: 33, column: 5, scope: !25)
!31 = !DILocation(line: 36, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 14, scope: !32)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !32)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 5, scope: !32)
!41 = !DILocation(line: 33, column: 24, scope: !28)
!42 = !DILocation(line: 33, column: 5, scope: !28)
!43 = distinct !{!43, !30, !44, !45}
!44 = !DILocation(line: 38, column: 5, scope: !25)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 40, column: 14, scope: !47)
!52 = !DILocation(line: 43, column: 17, scope: !47)
!53 = !DILocation(line: 43, column: 23, scope: !47)
!54 = !DILocation(line: 43, column: 38, scope: !47)
!55 = !DILocation(line: 43, column: 31, scope: !47)
!56 = !DILocation(line: 43, column: 46, scope: !47)
!57 = !DILocation(line: 43, column: 9, scope: !47)
!58 = !DILocation(line: 44, column: 19, scope: !47)
!59 = !DILocation(line: 44, column: 9, scope: !47)
!60 = !DILocation(line: 45, column: 14, scope: !47)
!61 = !DILocation(line: 45, column: 9, scope: !47)
!62 = !DILocation(line: 47, column: 1, scope: !14)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_17_good", scope: !15, file: !15, line: 75, type: !16, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 77, column: 5, scope: !63)
!65 = !DILocation(line: 78, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 90, type: !67, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!19, !19, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 90, type: !19)
!71 = !DILocation(line: 90, column: 14, scope: !66)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 90, type: !69)
!73 = !DILocation(line: 90, column: 27, scope: !66)
!74 = !DILocation(line: 93, column: 22, scope: !66)
!75 = !DILocation(line: 93, column: 12, scope: !66)
!76 = !DILocation(line: 93, column: 5, scope: !66)
!77 = !DILocation(line: 95, column: 5, scope: !66)
!78 = !DILocation(line: 96, column: 5, scope: !66)
!79 = !DILocation(line: 97, column: 5, scope: !66)
!80 = !DILocation(line: 100, column: 5, scope: !66)
!81 = !DILocation(line: 101, column: 5, scope: !66)
!82 = !DILocation(line: 102, column: 5, scope: !66)
!83 = !DILocation(line: 104, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "h", scope: !84, file: !15, line: 56, type: !19)
!86 = !DILocation(line: 56, column: 9, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 57, type: !4)
!88 = !DILocation(line: 57, column: 12, scope: !84)
!89 = !DILocation(line: 58, column: 10, scope: !84)
!90 = !DILocation(line: 59, column: 11, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !15, line: 59, column: 5)
!92 = !DILocation(line: 59, column: 9, scope: !91)
!93 = !DILocation(line: 59, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 59, column: 5)
!95 = !DILocation(line: 59, column: 18, scope: !94)
!96 = !DILocation(line: 59, column: 5, scope: !91)
!97 = !DILocation(line: 62, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 60, column: 5)
!99 = !DILocation(line: 62, column: 14, scope: !98)
!100 = !DILocation(line: 63, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !15, line: 63, column: 13)
!102 = !DILocation(line: 63, column: 18, scope: !101)
!103 = !DILocation(line: 63, column: 13, scope: !98)
!104 = !DILocation(line: 63, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 63, column: 27)
!106 = !DILocation(line: 64, column: 5, scope: !98)
!107 = !DILocation(line: 59, column: 24, scope: !94)
!108 = !DILocation(line: 59, column: 5, scope: !94)
!109 = distinct !{!109, !96, !110, !45}
!110 = !DILocation(line: 64, column: 5, scope: !91)
!111 = !DILocalVariable(name: "source", scope: !112, file: !15, line: 66, type: !48)
!112 = distinct !DILexicalBlock(scope: !84, file: !15, line: 65, column: 5)
!113 = !DILocation(line: 66, column: 14, scope: !112)
!114 = !DILocation(line: 69, column: 17, scope: !112)
!115 = !DILocation(line: 69, column: 23, scope: !112)
!116 = !DILocation(line: 69, column: 38, scope: !112)
!117 = !DILocation(line: 69, column: 31, scope: !112)
!118 = !DILocation(line: 69, column: 46, scope: !112)
!119 = !DILocation(line: 69, column: 9, scope: !112)
!120 = !DILocation(line: 70, column: 19, scope: !112)
!121 = !DILocation(line: 70, column: 9, scope: !112)
!122 = !DILocation(line: 71, column: 14, scope: !112)
!123 = !DILocation(line: 71, column: 9, scope: !112)
!124 = !DILocation(line: 73, column: 1, scope: !84)
