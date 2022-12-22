; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_badSink(i32* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !31
  store i64 0, i64* %i, align 8, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !35
  %cmp = icmp ult i64 %1, 100, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !39
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !41
  %3 = load i32, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %data.addr, align 8, !dbg !42
  %5 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !42
  store i32 %3, i32* %arrayidx1, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %6, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !51
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !51
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !51
  call void @printIntLine(i32 %8), !dbg !52
  %9 = load i32*, i32** %data.addr, align 8, !dbg !53
  %10 = bitcast i32* %9 to i8*, !dbg !53
  call void @free(i8* %10) #6, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_bad() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  store i32* null, i32** %data, align 8, !dbg !61
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !62
  %0 = bitcast i8* %call to i32*, !dbg !63
  store i32* %0, i32** %data, align 8, !dbg !64
  %1 = load i32*, i32** %data, align 8, !dbg !65
  %cmp = icmp eq i32* %1, null, !dbg !67
  br i1 %cmp, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_badSink(i32* %2), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_goodG2BSink(i32* %data) #0 !dbg !74 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %1, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !92
  %3 = load i32, i32* %arrayidx, align 4, !dbg !92
  %4 = load i32*, i32** %data.addr, align 8, !dbg !93
  %5 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !93
  store i32 %3, i32* %arrayidx1, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %6, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !101
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !101
  call void @printIntLine(i32 %8), !dbg !102
  %9 = load i32*, i32** %data.addr, align 8, !dbg !103
  %10 = bitcast i32* %9 to i8*, !dbg !103
  call void @free(i8* %10) #6, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_good() #0 !dbg !106 {
entry:
  call void @goodG2B(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* null) #6, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #6, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32* null, i32** %data, align 8, !dbg !132
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !133
  %0 = bitcast i8* %call to i32*, !dbg !134
  store i32* %0, i32** %data, align 8, !dbg !135
  %1 = load i32*, i32** %data, align 8, !dbg !136
  %cmp = icmp eq i32* %1, null, !dbg !138
  br i1 %cmp, label %if.then, label %if.end, !dbg !139

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !142
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_goodG2BSink(i32* %2), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_badSink", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 21, type: !4)
!19 = !DILocation(line: 21, column: 76, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 24, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 23, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 24, column: 13, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !27, file: !15, line: 26, type: !28)
!27 = distinct !DILexicalBlock(scope: !21, file: !15, line: 25, column: 9)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 26, column: 20, scope: !27)
!32 = !DILocation(line: 28, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !15, line: 28, column: 13)
!34 = !DILocation(line: 28, column: 18, scope: !33)
!35 = !DILocation(line: 28, column: 25, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !15, line: 28, column: 13)
!37 = !DILocation(line: 28, column: 27, scope: !36)
!38 = !DILocation(line: 28, column: 13, scope: !33)
!39 = !DILocation(line: 30, column: 34, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 29, column: 13)
!41 = !DILocation(line: 30, column: 27, scope: !40)
!42 = !DILocation(line: 30, column: 17, scope: !40)
!43 = !DILocation(line: 30, column: 22, scope: !40)
!44 = !DILocation(line: 30, column: 25, scope: !40)
!45 = !DILocation(line: 31, column: 13, scope: !40)
!46 = !DILocation(line: 28, column: 35, scope: !36)
!47 = !DILocation(line: 28, column: 13, scope: !36)
!48 = distinct !{!48, !38, !49, !50}
!49 = !DILocation(line: 31, column: 13, scope: !33)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 32, column: 26, scope: !27)
!52 = !DILocation(line: 32, column: 13, scope: !27)
!53 = !DILocation(line: 33, column: 18, scope: !27)
!54 = !DILocation(line: 33, column: 13, scope: !27)
!55 = !DILocation(line: 36, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_bad", scope: !15, file: !15, line: 38, type: !57, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !15, line: 40, type: !4)
!60 = !DILocation(line: 40, column: 11, scope: !56)
!61 = !DILocation(line: 41, column: 10, scope: !56)
!62 = !DILocation(line: 43, column: 19, scope: !56)
!63 = !DILocation(line: 43, column: 12, scope: !56)
!64 = !DILocation(line: 43, column: 10, scope: !56)
!65 = !DILocation(line: 44, column: 9, scope: !66)
!66 = distinct !DILexicalBlock(scope: !56, file: !15, line: 44, column: 9)
!67 = !DILocation(line: 44, column: 14, scope: !66)
!68 = !DILocation(line: 44, column: 9, scope: !56)
!69 = !DILocation(line: 44, column: 24, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 44, column: 23)
!71 = !DILocation(line: 45, column: 69, scope: !56)
!72 = !DILocation(line: 45, column: 5, scope: !56)
!73 = !DILocation(line: 46, column: 1, scope: !56)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_goodG2BSink", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", arg: 1, scope: !74, file: !15, line: 52, type: !4)
!76 = !DILocation(line: 52, column: 80, scope: !74)
!77 = !DILocalVariable(name: "source", scope: !78, file: !15, line: 55, type: !22)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 54, column: 5)
!79 = !DILocation(line: 55, column: 13, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !15, line: 57, type: !28)
!81 = distinct !DILexicalBlock(scope: !78, file: !15, line: 56, column: 9)
!82 = !DILocation(line: 57, column: 20, scope: !81)
!83 = !DILocation(line: 59, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !15, line: 59, column: 13)
!85 = !DILocation(line: 59, column: 18, scope: !84)
!86 = !DILocation(line: 59, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !15, line: 59, column: 13)
!88 = !DILocation(line: 59, column: 27, scope: !87)
!89 = !DILocation(line: 59, column: 13, scope: !84)
!90 = !DILocation(line: 61, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 60, column: 13)
!92 = !DILocation(line: 61, column: 27, scope: !91)
!93 = !DILocation(line: 61, column: 17, scope: !91)
!94 = !DILocation(line: 61, column: 22, scope: !91)
!95 = !DILocation(line: 61, column: 25, scope: !91)
!96 = !DILocation(line: 62, column: 13, scope: !91)
!97 = !DILocation(line: 59, column: 35, scope: !87)
!98 = !DILocation(line: 59, column: 13, scope: !87)
!99 = distinct !{!99, !89, !100, !50}
!100 = !DILocation(line: 62, column: 13, scope: !84)
!101 = !DILocation(line: 63, column: 26, scope: !81)
!102 = !DILocation(line: 63, column: 13, scope: !81)
!103 = !DILocation(line: 64, column: 18, scope: !81)
!104 = !DILocation(line: 64, column: 13, scope: !81)
!105 = !DILocation(line: 67, column: 1, scope: !74)
!106 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_41_good", scope: !15, file: !15, line: 80, type: !57, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 82, column: 5, scope: !106)
!108 = !DILocation(line: 83, column: 1, scope: !106)
!109 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !110, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!5, !5, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !15, line: 95, type: !5)
!116 = !DILocation(line: 95, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !15, line: 95, type: !112)
!118 = !DILocation(line: 95, column: 27, scope: !109)
!119 = !DILocation(line: 98, column: 22, scope: !109)
!120 = !DILocation(line: 98, column: 12, scope: !109)
!121 = !DILocation(line: 98, column: 5, scope: !109)
!122 = !DILocation(line: 100, column: 5, scope: !109)
!123 = !DILocation(line: 101, column: 5, scope: !109)
!124 = !DILocation(line: 102, column: 5, scope: !109)
!125 = !DILocation(line: 105, column: 5, scope: !109)
!126 = !DILocation(line: 106, column: 5, scope: !109)
!127 = !DILocation(line: 107, column: 5, scope: !109)
!128 = !DILocation(line: 109, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 70, type: !57, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !15, line: 72, type: !4)
!131 = !DILocation(line: 72, column: 11, scope: !129)
!132 = !DILocation(line: 73, column: 10, scope: !129)
!133 = !DILocation(line: 75, column: 19, scope: !129)
!134 = !DILocation(line: 75, column: 12, scope: !129)
!135 = !DILocation(line: 75, column: 10, scope: !129)
!136 = !DILocation(line: 76, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !129, file: !15, line: 76, column: 9)
!138 = !DILocation(line: 76, column: 14, scope: !137)
!139 = !DILocation(line: 76, column: 9, scope: !129)
!140 = !DILocation(line: 76, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !15, line: 76, column: 23)
!142 = !DILocation(line: 77, column: 73, scope: !129)
!143 = !DILocation(line: 77, column: 5, scope: !129)
!144 = !DILocation(line: 78, column: 1, scope: !129)
