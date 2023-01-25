; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17_bad() #0 !dbg !14 {
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
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !38
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !58
  %5 = load i8*, i8** %data, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !59
  store i8 0, i8* %arrayidx4, align 1, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* %6), !dbg !62
  %7 = load i8*, i8** %data, align 8, !dbg !63
  call void @free(i8* %7) #7, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* null, i8** %data, align 8, !dbg !92
  store i32 0, i32* %h, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !96
  %cmp = icmp slt i32 %0, 1, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !102
  %1 = load i8*, i8** %data, align 8, !dbg !103
  %cmp1 = icmp eq i8* %1, null, !dbg !105
  br i1 %cmp1, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !112
  %inc = add nsw i32 %3, 1, !dbg !112
  store i32 %inc, i32* %h, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx2, align 1, !dbg !121
  %4 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !123
  %5 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !124
  store i8 0, i8* %arrayidx4, align 1, !dbg !125
  %6 = load i8*, i8** %data, align 8, !dbg !126
  call void @printLine(i8* %6), !dbg !127
  %7 = load i8*, i8** %data, align 8, !dbg !128
  call void @free(i8* %7) #7, !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!58 = !DILocation(line: 40, column: 9, scope: !49)
!59 = !DILocation(line: 41, column: 9, scope: !49)
!60 = !DILocation(line: 41, column: 21, scope: !49)
!61 = !DILocation(line: 42, column: 19, scope: !49)
!62 = !DILocation(line: 42, column: 9, scope: !49)
!63 = !DILocation(line: 43, column: 14, scope: !49)
!64 = !DILocation(line: 43, column: 9, scope: !49)
!65 = !DILocation(line: 45, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_17_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 78, column: 5, scope: !66)
!68 = !DILocation(line: 79, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !70, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!19, !19, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !15, line: 91, type: !19)
!74 = !DILocation(line: 91, column: 14, scope: !69)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !15, line: 91, type: !72)
!76 = !DILocation(line: 91, column: 27, scope: !69)
!77 = !DILocation(line: 94, column: 22, scope: !69)
!78 = !DILocation(line: 94, column: 12, scope: !69)
!79 = !DILocation(line: 94, column: 5, scope: !69)
!80 = !DILocation(line: 96, column: 5, scope: !69)
!81 = !DILocation(line: 97, column: 5, scope: !69)
!82 = !DILocation(line: 98, column: 5, scope: !69)
!83 = !DILocation(line: 101, column: 5, scope: !69)
!84 = !DILocation(line: 102, column: 5, scope: !69)
!85 = !DILocation(line: 103, column: 5, scope: !69)
!86 = !DILocation(line: 105, column: 5, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "h", scope: !87, file: !15, line: 54, type: !19)
!89 = !DILocation(line: 54, column: 9, scope: !87)
!90 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 55, type: !4)
!91 = !DILocation(line: 55, column: 12, scope: !87)
!92 = !DILocation(line: 56, column: 10, scope: !87)
!93 = !DILocation(line: 57, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !15, line: 57, column: 5)
!95 = !DILocation(line: 57, column: 9, scope: !94)
!96 = !DILocation(line: 57, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !15, line: 57, column: 5)
!98 = !DILocation(line: 57, column: 18, scope: !97)
!99 = !DILocation(line: 57, column: 5, scope: !94)
!100 = !DILocation(line: 60, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 58, column: 5)
!102 = !DILocation(line: 60, column: 14, scope: !101)
!103 = !DILocation(line: 61, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !15, line: 61, column: 13)
!105 = !DILocation(line: 61, column: 18, scope: !104)
!106 = !DILocation(line: 61, column: 13, scope: !101)
!107 = !DILocation(line: 61, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 61, column: 27)
!109 = !DILocation(line: 62, column: 9, scope: !101)
!110 = !DILocation(line: 62, column: 17, scope: !101)
!111 = !DILocation(line: 63, column: 5, scope: !101)
!112 = !DILocation(line: 57, column: 24, scope: !97)
!113 = !DILocation(line: 57, column: 5, scope: !97)
!114 = distinct !{!114, !99, !115, !47}
!115 = !DILocation(line: 63, column: 5, scope: !94)
!116 = !DILocalVariable(name: "source", scope: !117, file: !15, line: 65, type: !50)
!117 = distinct !DILexicalBlock(scope: !87, file: !15, line: 64, column: 5)
!118 = !DILocation(line: 65, column: 14, scope: !117)
!119 = !DILocation(line: 66, column: 9, scope: !117)
!120 = !DILocation(line: 67, column: 9, scope: !117)
!121 = !DILocation(line: 67, column: 23, scope: !117)
!122 = !DILocation(line: 69, column: 17, scope: !117)
!123 = !DILocation(line: 69, column: 9, scope: !117)
!124 = !DILocation(line: 70, column: 9, scope: !117)
!125 = !DILocation(line: 70, column: 21, scope: !117)
!126 = !DILocation(line: 71, column: 19, scope: !117)
!127 = !DILocation(line: 71, column: 9, scope: !117)
!128 = !DILocation(line: 72, column: 14, scope: !117)
!129 = !DILocation(line: 72, column: 9, scope: !117)
!130 = !DILocation(line: 74, column: 1, scope: !87)
