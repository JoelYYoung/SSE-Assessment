; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
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
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %3, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx2, align 1, !dbg !56
  %4 = load i8*, i8** %data, align 8, !dbg !57
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !59
  %5 = load i8*, i8** %data, align 8, !dbg !60
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !60
  store i8 0, i8* %arrayidx5, align 1, !dbg !61
  %6 = load i8*, i8** %data, align 8, !dbg !62
  call void @printLine(i8* %6), !dbg !63
  %7 = load i8*, i8** %data, align 8, !dbg !64
  call void @free(i8* %7) #6, !dbg !65
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

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17_good() #0 !dbg !67 {
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
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17_bad(), !dbg !85
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
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i8* null, i8** %data, align 8, !dbg !93
  store i32 0, i32* %h, align 4, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !97
  %cmp = icmp slt i32 %0, 1, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %cmp1 = icmp eq i8* %1, null, !dbg !106
  br i1 %cmp1, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !113
  %inc = add nsw i32 %3, 1, !dbg !113
  store i32 %inc, i32* %h, align 4, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx2, align 1, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !125
  %5 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !126
  store i8 0, i8* %arrayidx5, align 1, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %6), !dbg !129
  %7 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* %7) #6, !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 10, scope: !14)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocation(line: 31, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 14, scope: !32)
!34 = !DILocation(line: 32, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 32, column: 13)
!36 = !DILocation(line: 32, column: 18, scope: !35)
!37 = !DILocation(line: 32, column: 13, scope: !32)
!38 = !DILocation(line: 32, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 32, column: 27)
!40 = !DILocation(line: 33, column: 9, scope: !32)
!41 = !DILocation(line: 33, column: 17, scope: !32)
!42 = !DILocation(line: 34, column: 5, scope: !32)
!43 = !DILocation(line: 28, column: 24, scope: !28)
!44 = !DILocation(line: 28, column: 5, scope: !28)
!45 = distinct !{!45, !30, !46, !47}
!46 = !DILocation(line: 34, column: 5, scope: !25)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "source", scope: !49, file: !15, line: 36, type: !50)
!49 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 36, column: 14, scope: !49)
!54 = !DILocation(line: 37, column: 9, scope: !49)
!55 = !DILocation(line: 38, column: 9, scope: !49)
!56 = !DILocation(line: 38, column: 23, scope: !49)
!57 = !DILocation(line: 40, column: 17, scope: !49)
!58 = !DILocation(line: 40, column: 23, scope: !49)
!59 = !DILocation(line: 40, column: 9, scope: !49)
!60 = !DILocation(line: 41, column: 9, scope: !49)
!61 = !DILocation(line: 41, column: 21, scope: !49)
!62 = !DILocation(line: 42, column: 19, scope: !49)
!63 = !DILocation(line: 42, column: 9, scope: !49)
!64 = !DILocation(line: 43, column: 14, scope: !49)
!65 = !DILocation(line: 43, column: 9, scope: !49)
!66 = !DILocation(line: 45, column: 1, scope: !14)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_17_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 78, column: 5, scope: !67)
!69 = !DILocation(line: 79, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !71, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!19, !19, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !15, line: 91, type: !19)
!75 = !DILocation(line: 91, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !15, line: 91, type: !73)
!77 = !DILocation(line: 91, column: 27, scope: !70)
!78 = !DILocation(line: 94, column: 22, scope: !70)
!79 = !DILocation(line: 94, column: 12, scope: !70)
!80 = !DILocation(line: 94, column: 5, scope: !70)
!81 = !DILocation(line: 96, column: 5, scope: !70)
!82 = !DILocation(line: 97, column: 5, scope: !70)
!83 = !DILocation(line: 98, column: 5, scope: !70)
!84 = !DILocation(line: 101, column: 5, scope: !70)
!85 = !DILocation(line: 102, column: 5, scope: !70)
!86 = !DILocation(line: 103, column: 5, scope: !70)
!87 = !DILocation(line: 105, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "h", scope: !88, file: !15, line: 54, type: !19)
!90 = !DILocation(line: 54, column: 9, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 55, type: !4)
!92 = !DILocation(line: 55, column: 12, scope: !88)
!93 = !DILocation(line: 56, column: 10, scope: !88)
!94 = !DILocation(line: 57, column: 11, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !15, line: 57, column: 5)
!96 = !DILocation(line: 57, column: 9, scope: !95)
!97 = !DILocation(line: 57, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !15, line: 57, column: 5)
!99 = !DILocation(line: 57, column: 18, scope: !98)
!100 = !DILocation(line: 57, column: 5, scope: !95)
!101 = !DILocation(line: 60, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 58, column: 5)
!103 = !DILocation(line: 60, column: 14, scope: !102)
!104 = !DILocation(line: 61, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !15, line: 61, column: 13)
!106 = !DILocation(line: 61, column: 18, scope: !105)
!107 = !DILocation(line: 61, column: 13, scope: !102)
!108 = !DILocation(line: 61, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 61, column: 27)
!110 = !DILocation(line: 62, column: 9, scope: !102)
!111 = !DILocation(line: 62, column: 17, scope: !102)
!112 = !DILocation(line: 63, column: 5, scope: !102)
!113 = !DILocation(line: 57, column: 24, scope: !98)
!114 = !DILocation(line: 57, column: 5, scope: !98)
!115 = distinct !{!115, !100, !116, !47}
!116 = !DILocation(line: 63, column: 5, scope: !95)
!117 = !DILocalVariable(name: "source", scope: !118, file: !15, line: 65, type: !50)
!118 = distinct !DILexicalBlock(scope: !88, file: !15, line: 64, column: 5)
!119 = !DILocation(line: 65, column: 14, scope: !118)
!120 = !DILocation(line: 66, column: 9, scope: !118)
!121 = !DILocation(line: 67, column: 9, scope: !118)
!122 = !DILocation(line: 67, column: 23, scope: !118)
!123 = !DILocation(line: 69, column: 17, scope: !118)
!124 = !DILocation(line: 69, column: 23, scope: !118)
!125 = !DILocation(line: 69, column: 9, scope: !118)
!126 = !DILocation(line: 70, column: 9, scope: !118)
!127 = !DILocation(line: 70, column: 21, scope: !118)
!128 = !DILocation(line: 71, column: 19, scope: !118)
!129 = !DILocation(line: 71, column: 9, scope: !118)
!130 = !DILocation(line: 72, column: 14, scope: !118)
!131 = !DILocation(line: 72, column: 9, scope: !118)
!132 = !DILocation(line: 74, column: 1, scope: !88)
