; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !19
  store i8* %call, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61b_badSource(i8* %0), !dbg !22
  store i8* %call1, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !38
  store i64 %call2, i64* %dataLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !43
  %4 = load i64, i64* %dataLen, align 8, !dbg !45
  %cmp = icmp ult i64 %3, %4, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !48
  %6 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !48
  %7 = load i8, i8* %arrayidx, align 1, !dbg !48
  %8 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !52
  store i8 %7, i8* %arrayidx3, align 1, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %9, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !60
  store i8 0, i8* %arrayidx4, align 1, !dbg !61
  %10 = load i8*, i8** %data, align 8, !dbg !62
  call void @printLine(i8* %10), !dbg !63
  %11 = load i8*, i8** %data, align 8, !dbg !64
  call void @free(i8* %11) #6, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61b_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61_good() #0 !dbg !67 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #6, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #6, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61b_goodG2BSource(i8* %0), !dbg !95
  store i8* %call1, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !99
  call void @llvm.dbg.declare(metadata i64* %i, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !102, metadata !DIExpression()), !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !105
  store i64 %call2, i64* %dataLen, align 8, !dbg !106
  store i64 0, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !110
  %4 = load i64, i64* %dataLen, align 8, !dbg !112
  %cmp = icmp ult i64 %3, %4, !dbg !113
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !115
  %6 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !115
  %7 = load i8, i8* %arrayidx, align 1, !dbg !115
  %8 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !119
  store i8 %7, i8* %arrayidx3, align 1, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %9, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !126
  store i8 0, i8* %arrayidx4, align 1, !dbg !127
  %10 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* %10), !dbg !129
  %11 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* %11) #6, !dbg !131
  ret void, !dbg !132
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61b_goodG2BSource(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocation(line: 29, column: 20, scope: !13)
!20 = !DILocation(line: 29, column: 10, scope: !13)
!21 = !DILocation(line: 30, column: 80, scope: !13)
!22 = !DILocation(line: 30, column: 12, scope: !13)
!23 = !DILocation(line: 30, column: 10, scope: !13)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !14, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !14, line: 33, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 33, column: 16, scope: !25)
!35 = !DILocalVariable(name: "dataLen", scope: !25, file: !14, line: 33, type: !31)
!36 = !DILocation(line: 33, column: 19, scope: !25)
!37 = !DILocation(line: 34, column: 26, scope: !25)
!38 = !DILocation(line: 34, column: 19, scope: !25)
!39 = !DILocation(line: 34, column: 17, scope: !25)
!40 = !DILocation(line: 36, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !25, file: !14, line: 36, column: 9)
!42 = !DILocation(line: 36, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !14, line: 36, column: 9)
!45 = !DILocation(line: 36, column: 25, scope: !44)
!46 = !DILocation(line: 36, column: 23, scope: !44)
!47 = !DILocation(line: 36, column: 9, scope: !41)
!48 = !DILocation(line: 38, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !14, line: 37, column: 9)
!50 = !DILocation(line: 38, column: 28, scope: !49)
!51 = !DILocation(line: 38, column: 18, scope: !49)
!52 = !DILocation(line: 38, column: 13, scope: !49)
!53 = !DILocation(line: 38, column: 21, scope: !49)
!54 = !DILocation(line: 39, column: 9, scope: !49)
!55 = !DILocation(line: 36, column: 35, scope: !44)
!56 = !DILocation(line: 36, column: 9, scope: !44)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 39, column: 9, scope: !41)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 40, column: 9, scope: !25)
!61 = !DILocation(line: 40, column: 20, scope: !25)
!62 = !DILocation(line: 41, column: 19, scope: !25)
!63 = !DILocation(line: 41, column: 9, scope: !25)
!64 = !DILocation(line: 42, column: 14, scope: !25)
!65 = !DILocation(line: 42, column: 9, scope: !25)
!66 = !DILocation(line: 44, column: 1, scope: !13)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_61_good", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 75, column: 5, scope: !67)
!69 = !DILocation(line: 76, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 88, type: !71, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73, !74}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !14, line: 88, type: !73)
!76 = !DILocation(line: 88, column: 14, scope: !70)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !14, line: 88, type: !74)
!78 = !DILocation(line: 88, column: 27, scope: !70)
!79 = !DILocation(line: 91, column: 22, scope: !70)
!80 = !DILocation(line: 91, column: 12, scope: !70)
!81 = !DILocation(line: 91, column: 5, scope: !70)
!82 = !DILocation(line: 93, column: 5, scope: !70)
!83 = !DILocation(line: 94, column: 5, scope: !70)
!84 = !DILocation(line: 95, column: 5, scope: !70)
!85 = !DILocation(line: 98, column: 5, scope: !70)
!86 = !DILocation(line: 99, column: 5, scope: !70)
!87 = !DILocation(line: 100, column: 5, scope: !70)
!88 = !DILocation(line: 102, column: 5, scope: !70)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !14, line: 55, type: !4)
!91 = !DILocation(line: 55, column: 12, scope: !89)
!92 = !DILocation(line: 56, column: 20, scope: !89)
!93 = !DILocation(line: 56, column: 10, scope: !89)
!94 = !DILocation(line: 57, column: 84, scope: !89)
!95 = !DILocation(line: 57, column: 12, scope: !89)
!96 = !DILocation(line: 57, column: 10, scope: !89)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !14, line: 59, type: !26)
!98 = distinct !DILexicalBlock(scope: !89, file: !14, line: 58, column: 5)
!99 = !DILocation(line: 59, column: 14, scope: !98)
!100 = !DILocalVariable(name: "i", scope: !98, file: !14, line: 60, type: !31)
!101 = !DILocation(line: 60, column: 16, scope: !98)
!102 = !DILocalVariable(name: "dataLen", scope: !98, file: !14, line: 60, type: !31)
!103 = !DILocation(line: 60, column: 19, scope: !98)
!104 = !DILocation(line: 61, column: 26, scope: !98)
!105 = !DILocation(line: 61, column: 19, scope: !98)
!106 = !DILocation(line: 61, column: 17, scope: !98)
!107 = !DILocation(line: 63, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !98, file: !14, line: 63, column: 9)
!109 = !DILocation(line: 63, column: 14, scope: !108)
!110 = !DILocation(line: 63, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 63, column: 9)
!112 = !DILocation(line: 63, column: 25, scope: !111)
!113 = !DILocation(line: 63, column: 23, scope: !111)
!114 = !DILocation(line: 63, column: 9, scope: !108)
!115 = !DILocation(line: 65, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !14, line: 64, column: 9)
!117 = !DILocation(line: 65, column: 28, scope: !116)
!118 = !DILocation(line: 65, column: 18, scope: !116)
!119 = !DILocation(line: 65, column: 13, scope: !116)
!120 = !DILocation(line: 65, column: 21, scope: !116)
!121 = !DILocation(line: 66, column: 9, scope: !116)
!122 = !DILocation(line: 63, column: 35, scope: !111)
!123 = !DILocation(line: 63, column: 9, scope: !111)
!124 = distinct !{!124, !114, !125, !59}
!125 = !DILocation(line: 66, column: 9, scope: !108)
!126 = !DILocation(line: 67, column: 9, scope: !98)
!127 = !DILocation(line: 67, column: 20, scope: !98)
!128 = !DILocation(line: 68, column: 19, scope: !98)
!129 = !DILocation(line: 68, column: 9, scope: !98)
!130 = !DILocation(line: 69, column: 14, scope: !98)
!131 = !DILocation(line: 69, column: 9, scope: !98)
!132 = !DILocation(line: 71, column: 1, scope: !89)
