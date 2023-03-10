; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_bad.source to i8*), i64 44, i1 false), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !35, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !37
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !38
  store i64 %call1, i64* %sourceLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %3 = load i64, i64* %sourceLen, align 8, !dbg !45
  %add = add i64 %3, 1, !dbg !46
  %cmp = icmp ult i64 %2, %add, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !51
  %5 = load i32, i32* %arrayidx, align 4, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !52
  store i32 %5, i32* %arrayidx2, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %8, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !61
  call void @printWLine(i32* %9), !dbg !62
  %10 = load i32*, i32** %data, align 8, !dbg !63
  %11 = bitcast i32* %10 to i8*, !dbg !63
  call void @free(i8* %11) #7, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_good() #0 !dbg !66 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #7, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #7, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  %0 = load i32*, i32** %data, align 8, !dbg !93
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61b_goodG2BSource(i32* %0), !dbg !94
  store i32* %call, i32** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !98
  call void @llvm.dbg.declare(metadata i64* %i, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !104
  store i64 %call1, i64* %sourceLen, align 8, !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !109
  %3 = load i64, i64* %sourceLen, align 8, !dbg !111
  %add = add i64 %3, 1, !dbg !112
  %cmp = icmp ult i64 %2, %add, !dbg !113
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !117
  %5 = load i32, i32* %arrayidx, align 4, !dbg !117
  %6 = load i32*, i32** %data, align 8, !dbg !118
  %7 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !118
  store i32 %5, i32* %arrayidx2, align 4, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %8, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %9), !dbg !127
  %10 = load i32*, i32** %data, align 8, !dbg !128
  %11 = bitcast i32* %10 to i8*, !dbg !128
  call void @free(i8* %11) #7, !dbg !129
  ret void, !dbg !130
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 33, column: 15, scope: !11)
!21 = !DILocation(line: 34, column: 10, scope: !11)
!22 = !DILocation(line: 35, column: 83, scope: !11)
!23 = !DILocation(line: 35, column: 12, scope: !11)
!24 = !DILocation(line: 35, column: 10, scope: !11)
!25 = !DILocalVariable(name: "source", scope: !26, file: !12, line: 37, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 37, column: 17, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 38, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !33)
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 38, column: 16, scope: !26)
!35 = !DILocalVariable(name: "sourceLen", scope: !26, file: !12, line: 38, type: !32)
!36 = !DILocation(line: 38, column: 19, scope: !26)
!37 = !DILocation(line: 39, column: 28, scope: !26)
!38 = !DILocation(line: 39, column: 21, scope: !26)
!39 = !DILocation(line: 39, column: 19, scope: !26)
!40 = !DILocation(line: 42, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !26, file: !12, line: 42, column: 9)
!42 = !DILocation(line: 42, column: 14, scope: !41)
!43 = !DILocation(line: 42, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 42, column: 9)
!45 = !DILocation(line: 42, column: 25, scope: !44)
!46 = !DILocation(line: 42, column: 35, scope: !44)
!47 = !DILocation(line: 42, column: 23, scope: !44)
!48 = !DILocation(line: 42, column: 9, scope: !41)
!49 = !DILocation(line: 44, column: 30, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !12, line: 43, column: 9)
!51 = !DILocation(line: 44, column: 23, scope: !50)
!52 = !DILocation(line: 44, column: 13, scope: !50)
!53 = !DILocation(line: 44, column: 18, scope: !50)
!54 = !DILocation(line: 44, column: 21, scope: !50)
!55 = !DILocation(line: 45, column: 9, scope: !50)
!56 = !DILocation(line: 42, column: 41, scope: !44)
!57 = !DILocation(line: 42, column: 9, scope: !44)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 45, column: 9, scope: !41)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 46, column: 20, scope: !26)
!62 = !DILocation(line: 46, column: 9, scope: !26)
!63 = !DILocation(line: 47, column: 14, scope: !26)
!64 = !DILocation(line: 47, column: 9, scope: !26)
!65 = !DILocation(line: 49, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_61_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 80, column: 5, scope: !66)
!68 = !DILocation(line: 81, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !70, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!19, !19, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 93, type: !19)
!76 = !DILocation(line: 93, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 93, type: !72)
!78 = !DILocation(line: 93, column: 27, scope: !69)
!79 = !DILocation(line: 96, column: 22, scope: !69)
!80 = !DILocation(line: 96, column: 12, scope: !69)
!81 = !DILocation(line: 96, column: 5, scope: !69)
!82 = !DILocation(line: 98, column: 5, scope: !69)
!83 = !DILocation(line: 99, column: 5, scope: !69)
!84 = !DILocation(line: 100, column: 5, scope: !69)
!85 = !DILocation(line: 103, column: 5, scope: !69)
!86 = !DILocation(line: 104, column: 5, scope: !69)
!87 = !DILocation(line: 105, column: 5, scope: !69)
!88 = !DILocation(line: 107, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 60, type: !16)
!91 = !DILocation(line: 60, column: 15, scope: !89)
!92 = !DILocation(line: 61, column: 10, scope: !89)
!93 = !DILocation(line: 62, column: 87, scope: !89)
!94 = !DILocation(line: 62, column: 12, scope: !89)
!95 = !DILocation(line: 62, column: 10, scope: !89)
!96 = !DILocalVariable(name: "source", scope: !97, file: !12, line: 64, type: !27)
!97 = distinct !DILexicalBlock(scope: !89, file: !12, line: 63, column: 5)
!98 = !DILocation(line: 64, column: 17, scope: !97)
!99 = !DILocalVariable(name: "i", scope: !97, file: !12, line: 65, type: !32)
!100 = !DILocation(line: 65, column: 16, scope: !97)
!101 = !DILocalVariable(name: "sourceLen", scope: !97, file: !12, line: 65, type: !32)
!102 = !DILocation(line: 65, column: 19, scope: !97)
!103 = !DILocation(line: 66, column: 28, scope: !97)
!104 = !DILocation(line: 66, column: 21, scope: !97)
!105 = !DILocation(line: 66, column: 19, scope: !97)
!106 = !DILocation(line: 69, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !97, file: !12, line: 69, column: 9)
!108 = !DILocation(line: 69, column: 14, scope: !107)
!109 = !DILocation(line: 69, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 69, column: 9)
!111 = !DILocation(line: 69, column: 25, scope: !110)
!112 = !DILocation(line: 69, column: 35, scope: !110)
!113 = !DILocation(line: 69, column: 23, scope: !110)
!114 = !DILocation(line: 69, column: 9, scope: !107)
!115 = !DILocation(line: 71, column: 30, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 70, column: 9)
!117 = !DILocation(line: 71, column: 23, scope: !116)
!118 = !DILocation(line: 71, column: 13, scope: !116)
!119 = !DILocation(line: 71, column: 18, scope: !116)
!120 = !DILocation(line: 71, column: 21, scope: !116)
!121 = !DILocation(line: 72, column: 9, scope: !116)
!122 = !DILocation(line: 69, column: 41, scope: !110)
!123 = !DILocation(line: 69, column: 9, scope: !110)
!124 = distinct !{!124, !114, !125, !60}
!125 = !DILocation(line: 72, column: 9, scope: !107)
!126 = !DILocation(line: 73, column: 20, scope: !97)
!127 = !DILocation(line: 73, column: 9, scope: !97)
!128 = !DILocation(line: 74, column: 14, scope: !97)
!129 = !DILocation(line: 74, column: 9, scope: !97)
!130 = !DILocation(line: 76, column: 1, scope: !89)
