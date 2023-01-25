; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %cmp = icmp eq i32* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !45
  %cmp1 = icmp ult i64 %3, 100, !dbg !47
  br i1 %cmp1, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !51
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
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !61
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !61
  call void @printIntLine(i32 %10), !dbg !62
  %11 = load i32*, i32** %data, align 8, !dbg !63
  %12 = bitcast i32* %11 to i8*, !dbg !63
  call void @free(i8* %12) #6, !dbg !64
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

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01_good() #0 !dbg !66 {
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
  %call = call i64 @time(i64* null) #6, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #6, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !93
  %0 = bitcast i8* %call to i32*, !dbg !94
  store i32* %0, i32** %data, align 8, !dbg !95
  %1 = load i32*, i32** %data, align 8, !dbg !96
  %cmp = icmp eq i32* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !104
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !111
  %cmp1 = icmp ult i64 %3, 100, !dbg !113
  br i1 %cmp1, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !117
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
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !126
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !126
  call void @printIntLine(i32 %10), !dbg !127
  %11 = load i32*, i32** %data, align 8, !dbg !128
  %12 = bitcast i32* %11 to i8*, !dbg !128
  call void @free(i8* %12) #6, !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 26, column: 19, scope: !14)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 26, column: 10, scope: !14)
!24 = !DILocation(line: 27, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!26 = !DILocation(line: 27, column: 14, scope: !25)
!27 = !DILocation(line: 27, column: 9, scope: !14)
!28 = !DILocation(line: 27, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 27, column: 23)
!30 = !DILocalVariable(name: "source", scope: !31, file: !15, line: 29, type: !32)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 29, column: 13, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !15, line: 31, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !15, line: 30, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 31, column: 20, scope: !37)
!42 = !DILocation(line: 33, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !15, line: 33, column: 13)
!44 = !DILocation(line: 33, column: 18, scope: !43)
!45 = !DILocation(line: 33, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !15, line: 33, column: 13)
!47 = !DILocation(line: 33, column: 27, scope: !46)
!48 = !DILocation(line: 33, column: 13, scope: !43)
!49 = !DILocation(line: 35, column: 34, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 34, column: 13)
!51 = !DILocation(line: 35, column: 27, scope: !50)
!52 = !DILocation(line: 35, column: 17, scope: !50)
!53 = !DILocation(line: 35, column: 22, scope: !50)
!54 = !DILocation(line: 35, column: 25, scope: !50)
!55 = !DILocation(line: 36, column: 13, scope: !50)
!56 = !DILocation(line: 33, column: 35, scope: !46)
!57 = !DILocation(line: 33, column: 13, scope: !46)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 36, column: 13, scope: !43)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 37, column: 26, scope: !37)
!62 = !DILocation(line: 37, column: 13, scope: !37)
!63 = !DILocation(line: 38, column: 18, scope: !37)
!64 = !DILocation(line: 38, column: 13, scope: !37)
!65 = !DILocation(line: 41, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_01_good", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 72, column: 5, scope: !66)
!68 = !DILocation(line: 73, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 85, type: !70, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!5, !5, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !15, line: 85, type: !5)
!76 = !DILocation(line: 85, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !15, line: 85, type: !72)
!78 = !DILocation(line: 85, column: 27, scope: !69)
!79 = !DILocation(line: 88, column: 22, scope: !69)
!80 = !DILocation(line: 88, column: 12, scope: !69)
!81 = !DILocation(line: 88, column: 5, scope: !69)
!82 = !DILocation(line: 90, column: 5, scope: !69)
!83 = !DILocation(line: 91, column: 5, scope: !69)
!84 = !DILocation(line: 92, column: 5, scope: !69)
!85 = !DILocation(line: 95, column: 5, scope: !69)
!86 = !DILocation(line: 96, column: 5, scope: !69)
!87 = !DILocation(line: 97, column: 5, scope: !69)
!88 = !DILocation(line: 99, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !15, line: 50, type: !4)
!91 = !DILocation(line: 50, column: 11, scope: !89)
!92 = !DILocation(line: 51, column: 10, scope: !89)
!93 = !DILocation(line: 53, column: 19, scope: !89)
!94 = !DILocation(line: 53, column: 12, scope: !89)
!95 = !DILocation(line: 53, column: 10, scope: !89)
!96 = !DILocation(line: 54, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !89, file: !15, line: 54, column: 9)
!98 = !DILocation(line: 54, column: 14, scope: !97)
!99 = !DILocation(line: 54, column: 9, scope: !89)
!100 = !DILocation(line: 54, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 54, column: 23)
!102 = !DILocalVariable(name: "source", scope: !103, file: !15, line: 56, type: !32)
!103 = distinct !DILexicalBlock(scope: !89, file: !15, line: 55, column: 5)
!104 = !DILocation(line: 56, column: 13, scope: !103)
!105 = !DILocalVariable(name: "i", scope: !106, file: !15, line: 58, type: !38)
!106 = distinct !DILexicalBlock(scope: !103, file: !15, line: 57, column: 9)
!107 = !DILocation(line: 58, column: 20, scope: !106)
!108 = !DILocation(line: 60, column: 20, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !15, line: 60, column: 13)
!110 = !DILocation(line: 60, column: 18, scope: !109)
!111 = !DILocation(line: 60, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !15, line: 60, column: 13)
!113 = !DILocation(line: 60, column: 27, scope: !112)
!114 = !DILocation(line: 60, column: 13, scope: !109)
!115 = !DILocation(line: 62, column: 34, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 61, column: 13)
!117 = !DILocation(line: 62, column: 27, scope: !116)
!118 = !DILocation(line: 62, column: 17, scope: !116)
!119 = !DILocation(line: 62, column: 22, scope: !116)
!120 = !DILocation(line: 62, column: 25, scope: !116)
!121 = !DILocation(line: 63, column: 13, scope: !116)
!122 = !DILocation(line: 60, column: 35, scope: !112)
!123 = !DILocation(line: 60, column: 13, scope: !112)
!124 = distinct !{!124, !114, !125, !60}
!125 = !DILocation(line: 63, column: 13, scope: !109)
!126 = !DILocation(line: 64, column: 26, scope: !106)
!127 = !DILocation(line: 64, column: 13, scope: !106)
!128 = !DILocation(line: 65, column: 18, scope: !106)
!129 = !DILocation(line: 65, column: 13, scope: !106)
!130 = !DILocation(line: 68, column: 1, scope: !89)
