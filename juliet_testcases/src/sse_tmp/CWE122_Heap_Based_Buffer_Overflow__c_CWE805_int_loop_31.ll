; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i32*, i32** %data, align 8, !dbg !33
  store i32* %2, i32** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !36
  store i32* %3, i32** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !52
  %cmp2 = icmp ult i64 %5, 100, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !58
  %7 = load i32, i32* %arrayidx, align 4, !dbg !58
  %8 = load i32*, i32** %data1, align 8, !dbg !59
  %9 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !59
  store i32 %7, i32* %arrayidx3, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %10, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !68
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !68
  call void @printIntLine(i32 %12), !dbg !69
  %13 = load i32*, i32** %data1, align 8, !dbg !70
  %14 = bitcast i32* %13 to i8*, !dbg !70
  call void @free(i8* %14) #6, !dbg !71
  ret void, !dbg !72
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32* null, i32** %data, align 8, !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !100
  %0 = bitcast i8* %call to i32*, !dbg !101
  store i32* %0, i32** %data, align 8, !dbg !102
  %1 = load i32*, i32** %data, align 8, !dbg !103
  %cmp = icmp eq i32* %1, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !109, metadata !DIExpression()), !dbg !111
  %2 = load i32*, i32** %data, align 8, !dbg !112
  store i32* %2, i32** %dataCopy, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !113, metadata !DIExpression()), !dbg !114
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !115
  store i32* %3, i32** %data1, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !125
  %cmp2 = icmp ult i64 %5, 100, !dbg !127
  br i1 %cmp2, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !131
  %7 = load i32, i32* %arrayidx, align 4, !dbg !131
  %8 = load i32*, i32** %data1, align 8, !dbg !132
  %9 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !132
  store i32 %7, i32* %arrayidx3, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %10, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !140
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !140
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !140
  call void @printIntLine(i32 %12), !dbg !141
  %13 = load i32*, i32** %data1, align 8, !dbg !142
  %14 = bitcast i32* %13 to i8*, !dbg !142
  call void @free(i8* %14) #6, !dbg !143
  ret void, !dbg !144
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !15, line: 29, type: !4)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!32 = !DILocation(line: 29, column: 15, scope: !31)
!33 = !DILocation(line: 29, column: 26, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !15, line: 30, type: !4)
!35 = !DILocation(line: 30, column: 15, scope: !31)
!36 = !DILocation(line: 30, column: 22, scope: !31)
!37 = !DILocalVariable(name: "source", scope: !38, file: !15, line: 32, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !15, line: 31, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 32, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !15, line: 34, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !15, line: 33, column: 13)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 34, column: 24, scope: !44)
!49 = !DILocation(line: 36, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !15, line: 36, column: 17)
!51 = !DILocation(line: 36, column: 22, scope: !50)
!52 = !DILocation(line: 36, column: 29, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !15, line: 36, column: 17)
!54 = !DILocation(line: 36, column: 31, scope: !53)
!55 = !DILocation(line: 36, column: 17, scope: !50)
!56 = !DILocation(line: 38, column: 38, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !15, line: 37, column: 17)
!58 = !DILocation(line: 38, column: 31, scope: !57)
!59 = !DILocation(line: 38, column: 21, scope: !57)
!60 = !DILocation(line: 38, column: 26, scope: !57)
!61 = !DILocation(line: 38, column: 29, scope: !57)
!62 = !DILocation(line: 39, column: 17, scope: !57)
!63 = !DILocation(line: 36, column: 39, scope: !53)
!64 = !DILocation(line: 36, column: 17, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 39, column: 17, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 40, column: 30, scope: !44)
!69 = !DILocation(line: 40, column: 17, scope: !44)
!70 = !DILocation(line: 41, column: 22, scope: !44)
!71 = !DILocation(line: 41, column: 17, scope: !44)
!72 = !DILocation(line: 45, column: 1, scope: !14)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_31_good", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 80, column: 5, scope: !73)
!75 = !DILocation(line: 81, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !77, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!5, !5, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !15, line: 92, type: !5)
!83 = !DILocation(line: 92, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !15, line: 92, type: !79)
!85 = !DILocation(line: 92, column: 27, scope: !76)
!86 = !DILocation(line: 95, column: 22, scope: !76)
!87 = !DILocation(line: 95, column: 12, scope: !76)
!88 = !DILocation(line: 95, column: 5, scope: !76)
!89 = !DILocation(line: 97, column: 5, scope: !76)
!90 = !DILocation(line: 98, column: 5, scope: !76)
!91 = !DILocation(line: 99, column: 5, scope: !76)
!92 = !DILocation(line: 102, column: 5, scope: !76)
!93 = !DILocation(line: 103, column: 5, scope: !76)
!94 = !DILocation(line: 104, column: 5, scope: !76)
!95 = !DILocation(line: 106, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 54, type: !4)
!98 = !DILocation(line: 54, column: 11, scope: !96)
!99 = !DILocation(line: 55, column: 10, scope: !96)
!100 = !DILocation(line: 57, column: 19, scope: !96)
!101 = !DILocation(line: 57, column: 12, scope: !96)
!102 = !DILocation(line: 57, column: 10, scope: !96)
!103 = !DILocation(line: 58, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !15, line: 58, column: 9)
!105 = !DILocation(line: 58, column: 14, scope: !104)
!106 = !DILocation(line: 58, column: 9, scope: !96)
!107 = !DILocation(line: 58, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 58, column: 23)
!109 = !DILocalVariable(name: "dataCopy", scope: !110, file: !15, line: 60, type: !4)
!110 = distinct !DILexicalBlock(scope: !96, file: !15, line: 59, column: 5)
!111 = !DILocation(line: 60, column: 15, scope: !110)
!112 = !DILocation(line: 60, column: 26, scope: !110)
!113 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 61, type: !4)
!114 = !DILocation(line: 61, column: 15, scope: !110)
!115 = !DILocation(line: 61, column: 22, scope: !110)
!116 = !DILocalVariable(name: "source", scope: !117, file: !15, line: 63, type: !39)
!117 = distinct !DILexicalBlock(scope: !110, file: !15, line: 62, column: 9)
!118 = !DILocation(line: 63, column: 17, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !15, line: 65, type: !45)
!120 = distinct !DILexicalBlock(scope: !117, file: !15, line: 64, column: 13)
!121 = !DILocation(line: 65, column: 24, scope: !120)
!122 = !DILocation(line: 67, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !15, line: 67, column: 17)
!124 = !DILocation(line: 67, column: 22, scope: !123)
!125 = !DILocation(line: 67, column: 29, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !15, line: 67, column: 17)
!127 = !DILocation(line: 67, column: 31, scope: !126)
!128 = !DILocation(line: 67, column: 17, scope: !123)
!129 = !DILocation(line: 69, column: 38, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 68, column: 17)
!131 = !DILocation(line: 69, column: 31, scope: !130)
!132 = !DILocation(line: 69, column: 21, scope: !130)
!133 = !DILocation(line: 69, column: 26, scope: !130)
!134 = !DILocation(line: 69, column: 29, scope: !130)
!135 = !DILocation(line: 70, column: 17, scope: !130)
!136 = !DILocation(line: 67, column: 39, scope: !126)
!137 = !DILocation(line: 67, column: 17, scope: !126)
!138 = distinct !{!138, !128, !139, !67}
!139 = !DILocation(line: 70, column: 17, scope: !123)
!140 = !DILocation(line: 71, column: 30, scope: !120)
!141 = !DILocation(line: 71, column: 17, scope: !120)
!142 = !DILocation(line: 72, column: 22, scope: !120)
!143 = !DILocation(line: 72, column: 17, scope: !120)
!144 = !DILocation(line: 76, column: 1, scope: !96)
