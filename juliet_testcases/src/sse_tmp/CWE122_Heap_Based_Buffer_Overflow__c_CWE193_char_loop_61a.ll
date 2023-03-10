; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !34, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !37
  store i64 %call1, i64* %sourceLen, align 8, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !42
  %3 = load i64, i64* %sourceLen, align 8, !dbg !44
  %add = add i64 %3, 1, !dbg !45
  %cmp = icmp ult i64 %2, %add, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !50
  %5 = load i8, i8* %arrayidx, align 1, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  %7 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !51
  store i8 %5, i8* %arrayidx2, align 1, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %8, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !60
  call void @printLine(i8* %9), !dbg !61
  %10 = load i8*, i8** %data, align 8, !dbg !62
  call void @free(i8* %10) #7, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61b_goodG2BSource(i8* %0), !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !96
  call void @llvm.dbg.declare(metadata i64* %i, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !102
  store i64 %call1, i64* %sourceLen, align 8, !dbg !103
  store i64 0, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !106

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !107
  %3 = load i64, i64* %sourceLen, align 8, !dbg !109
  %add = add i64 %3, 1, !dbg !110
  %cmp = icmp ult i64 %2, %add, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !115
  %5 = load i8, i8* %arrayidx, align 1, !dbg !115
  %6 = load i8*, i8** %data, align 8, !dbg !116
  %7 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !116
  store i8 %5, i8* %arrayidx2, align 1, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %8, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !124
  call void @printLine(i8* %9), !dbg !125
  %10 = load i8*, i8** %data, align 8, !dbg !126
  call void @free(i8* %10) #7, !dbg !127
  ret void, !dbg !128
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61b_goodG2BSource(i8*) #2

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 33, column: 12, scope: !11)
!19 = !DILocation(line: 34, column: 10, scope: !11)
!20 = !DILocation(line: 35, column: 80, scope: !11)
!21 = !DILocation(line: 35, column: 12, scope: !11)
!22 = !DILocation(line: 35, column: 10, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 37, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 37, column: 14, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 38, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 38, column: 16, scope: !24)
!34 = !DILocalVariable(name: "sourceLen", scope: !24, file: !12, line: 38, type: !30)
!35 = !DILocation(line: 38, column: 19, scope: !24)
!36 = !DILocation(line: 39, column: 28, scope: !24)
!37 = !DILocation(line: 39, column: 21, scope: !24)
!38 = !DILocation(line: 39, column: 19, scope: !24)
!39 = !DILocation(line: 42, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !24, file: !12, line: 42, column: 9)
!41 = !DILocation(line: 42, column: 14, scope: !40)
!42 = !DILocation(line: 42, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 42, column: 9)
!44 = !DILocation(line: 42, column: 25, scope: !43)
!45 = !DILocation(line: 42, column: 35, scope: !43)
!46 = !DILocation(line: 42, column: 23, scope: !43)
!47 = !DILocation(line: 42, column: 9, scope: !40)
!48 = !DILocation(line: 44, column: 30, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !12, line: 43, column: 9)
!50 = !DILocation(line: 44, column: 23, scope: !49)
!51 = !DILocation(line: 44, column: 13, scope: !49)
!52 = !DILocation(line: 44, column: 18, scope: !49)
!53 = !DILocation(line: 44, column: 21, scope: !49)
!54 = !DILocation(line: 45, column: 9, scope: !49)
!55 = !DILocation(line: 42, column: 41, scope: !43)
!56 = !DILocation(line: 42, column: 9, scope: !43)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 45, column: 9, scope: !40)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 46, column: 19, scope: !24)
!61 = !DILocation(line: 46, column: 9, scope: !24)
!62 = !DILocation(line: 47, column: 14, scope: !24)
!63 = !DILocation(line: 47, column: 9, scope: !24)
!64 = !DILocation(line: 49, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_61_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 80, column: 5, scope: !65)
!67 = !DILocation(line: 81, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !69, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 93, type: !71)
!74 = !DILocation(line: 93, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 93, type: !72)
!76 = !DILocation(line: 93, column: 27, scope: !68)
!77 = !DILocation(line: 96, column: 22, scope: !68)
!78 = !DILocation(line: 96, column: 12, scope: !68)
!79 = !DILocation(line: 96, column: 5, scope: !68)
!80 = !DILocation(line: 98, column: 5, scope: !68)
!81 = !DILocation(line: 99, column: 5, scope: !68)
!82 = !DILocation(line: 100, column: 5, scope: !68)
!83 = !DILocation(line: 103, column: 5, scope: !68)
!84 = !DILocation(line: 104, column: 5, scope: !68)
!85 = !DILocation(line: 105, column: 5, scope: !68)
!86 = !DILocation(line: 107, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 60, type: !16)
!89 = !DILocation(line: 60, column: 12, scope: !87)
!90 = !DILocation(line: 61, column: 10, scope: !87)
!91 = !DILocation(line: 62, column: 84, scope: !87)
!92 = !DILocation(line: 62, column: 12, scope: !87)
!93 = !DILocation(line: 62, column: 10, scope: !87)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 64, type: !25)
!95 = distinct !DILexicalBlock(scope: !87, file: !12, line: 63, column: 5)
!96 = !DILocation(line: 64, column: 14, scope: !95)
!97 = !DILocalVariable(name: "i", scope: !95, file: !12, line: 65, type: !30)
!98 = !DILocation(line: 65, column: 16, scope: !95)
!99 = !DILocalVariable(name: "sourceLen", scope: !95, file: !12, line: 65, type: !30)
!100 = !DILocation(line: 65, column: 19, scope: !95)
!101 = !DILocation(line: 66, column: 28, scope: !95)
!102 = !DILocation(line: 66, column: 21, scope: !95)
!103 = !DILocation(line: 66, column: 19, scope: !95)
!104 = !DILocation(line: 69, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !95, file: !12, line: 69, column: 9)
!106 = !DILocation(line: 69, column: 14, scope: !105)
!107 = !DILocation(line: 69, column: 21, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !12, line: 69, column: 9)
!109 = !DILocation(line: 69, column: 25, scope: !108)
!110 = !DILocation(line: 69, column: 35, scope: !108)
!111 = !DILocation(line: 69, column: 23, scope: !108)
!112 = !DILocation(line: 69, column: 9, scope: !105)
!113 = !DILocation(line: 71, column: 30, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !12, line: 70, column: 9)
!115 = !DILocation(line: 71, column: 23, scope: !114)
!116 = !DILocation(line: 71, column: 13, scope: !114)
!117 = !DILocation(line: 71, column: 18, scope: !114)
!118 = !DILocation(line: 71, column: 21, scope: !114)
!119 = !DILocation(line: 72, column: 9, scope: !114)
!120 = !DILocation(line: 69, column: 41, scope: !108)
!121 = !DILocation(line: 69, column: 9, scope: !108)
!122 = distinct !{!122, !112, !123, !59}
!123 = !DILocation(line: 72, column: 9, scope: !105)
!124 = !DILocation(line: 73, column: 19, scope: !95)
!125 = !DILocation(line: 73, column: 9, scope: !95)
!126 = !DILocation(line: 74, column: 14, scope: !95)
!127 = !DILocation(line: 74, column: 9, scope: !95)
!128 = !DILocation(line: 76, column: 1, scope: !87)
