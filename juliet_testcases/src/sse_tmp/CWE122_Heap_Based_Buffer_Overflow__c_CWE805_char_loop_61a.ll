; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %1, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !46
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %5 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !47
  store i8 %3, i8* %arrayidx2, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %6, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %8 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* %8), !dbg !59
  %9 = load i8*, i8** %data, align 8, !dbg !60
  call void @free(i8* %9) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61_good() #0 !dbg !63 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61b_goodG2BSource(i8* %0), !dbg !90
  store i8* %call, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  store i64 0, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !103
  %cmp = icmp ult i64 %1, 100, !dbg !105
  br i1 %cmp, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !109
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !109
  %4 = load i8*, i8** %data, align 8, !dbg !110
  %5 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !110
  store i8 %3, i8* %arrayidx2, align 1, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !114
  %inc = add i64 %6, 1, !dbg !114
  store i64 %inc, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  %8 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %8), !dbg !121
  %9 = load i8*, i8** %data, align 8, !dbg !122
  call void @free(i8* %9) #5, !dbg !123
  ret void, !dbg !124
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocation(line: 29, column: 10, scope: !11)
!20 = !DILocation(line: 30, column: 80, scope: !11)
!21 = !DILocation(line: 30, column: 12, scope: !11)
!22 = !DILocation(line: 30, column: 10, scope: !11)
!23 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 32, column: 16, scope: !24)
!29 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 14, scope: !24)
!34 = !DILocation(line: 34, column: 9, scope: !24)
!35 = !DILocation(line: 35, column: 9, scope: !24)
!36 = !DILocation(line: 35, column: 23, scope: !24)
!37 = !DILocation(line: 37, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !12, line: 37, column: 9)
!39 = !DILocation(line: 37, column: 14, scope: !38)
!40 = !DILocation(line: 37, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 37, column: 9)
!42 = !DILocation(line: 37, column: 23, scope: !41)
!43 = !DILocation(line: 37, column: 9, scope: !38)
!44 = !DILocation(line: 39, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 38, column: 9)
!46 = !DILocation(line: 39, column: 23, scope: !45)
!47 = !DILocation(line: 39, column: 13, scope: !45)
!48 = !DILocation(line: 39, column: 18, scope: !45)
!49 = !DILocation(line: 39, column: 21, scope: !45)
!50 = !DILocation(line: 40, column: 9, scope: !45)
!51 = !DILocation(line: 37, column: 31, scope: !41)
!52 = !DILocation(line: 37, column: 9, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 40, column: 9, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 41, column: 9, scope: !24)
!57 = !DILocation(line: 41, column: 21, scope: !24)
!58 = !DILocation(line: 42, column: 19, scope: !24)
!59 = !DILocation(line: 42, column: 9, scope: !24)
!60 = !DILocation(line: 43, column: 14, scope: !24)
!61 = !DILocation(line: 43, column: 9, scope: !24)
!62 = !DILocation(line: 45, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_61_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 77, column: 5, scope: !63)
!65 = !DILocation(line: 78, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !67, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 90, type: !69)
!72 = !DILocation(line: 90, column: 14, scope: !66)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 90, type: !70)
!74 = !DILocation(line: 90, column: 27, scope: !66)
!75 = !DILocation(line: 93, column: 22, scope: !66)
!76 = !DILocation(line: 93, column: 12, scope: !66)
!77 = !DILocation(line: 93, column: 5, scope: !66)
!78 = !DILocation(line: 95, column: 5, scope: !66)
!79 = !DILocation(line: 96, column: 5, scope: !66)
!80 = !DILocation(line: 97, column: 5, scope: !66)
!81 = !DILocation(line: 100, column: 5, scope: !66)
!82 = !DILocation(line: 101, column: 5, scope: !66)
!83 = !DILocation(line: 102, column: 5, scope: !66)
!84 = !DILocation(line: 104, column: 5, scope: !66)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 56, type: !16)
!87 = !DILocation(line: 56, column: 12, scope: !85)
!88 = !DILocation(line: 57, column: 10, scope: !85)
!89 = !DILocation(line: 58, column: 84, scope: !85)
!90 = !DILocation(line: 58, column: 12, scope: !85)
!91 = !DILocation(line: 58, column: 10, scope: !85)
!92 = !DILocalVariable(name: "i", scope: !93, file: !12, line: 60, type: !25)
!93 = distinct !DILexicalBlock(scope: !85, file: !12, line: 59, column: 5)
!94 = !DILocation(line: 60, column: 16, scope: !93)
!95 = !DILocalVariable(name: "source", scope: !93, file: !12, line: 61, type: !30)
!96 = !DILocation(line: 61, column: 14, scope: !93)
!97 = !DILocation(line: 62, column: 9, scope: !93)
!98 = !DILocation(line: 63, column: 9, scope: !93)
!99 = !DILocation(line: 63, column: 23, scope: !93)
!100 = !DILocation(line: 65, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !93, file: !12, line: 65, column: 9)
!102 = !DILocation(line: 65, column: 14, scope: !101)
!103 = !DILocation(line: 65, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 65, column: 9)
!105 = !DILocation(line: 65, column: 23, scope: !104)
!106 = !DILocation(line: 65, column: 9, scope: !101)
!107 = !DILocation(line: 67, column: 30, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 66, column: 9)
!109 = !DILocation(line: 67, column: 23, scope: !108)
!110 = !DILocation(line: 67, column: 13, scope: !108)
!111 = !DILocation(line: 67, column: 18, scope: !108)
!112 = !DILocation(line: 67, column: 21, scope: !108)
!113 = !DILocation(line: 68, column: 9, scope: !108)
!114 = !DILocation(line: 65, column: 31, scope: !104)
!115 = !DILocation(line: 65, column: 9, scope: !104)
!116 = distinct !{!116, !106, !117, !55}
!117 = !DILocation(line: 68, column: 9, scope: !101)
!118 = !DILocation(line: 69, column: 9, scope: !93)
!119 = !DILocation(line: 69, column: 21, scope: !93)
!120 = !DILocation(line: 70, column: 19, scope: !93)
!121 = !DILocation(line: 70, column: 9, scope: !93)
!122 = !DILocation(line: 71, column: 14, scope: !93)
!123 = !DILocation(line: 71, column: 9, scope: !93)
!124 = !DILocation(line: 73, column: 1, scope: !85)
