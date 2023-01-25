; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_badSink(i64* %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %1, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !45
  %3 = load i64, i64* %arrayidx, align 8, !dbg !45
  %4 = load i64*, i64** %data.addr, align 8, !dbg !46
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !46
  store i64 %3, i64* %arrayidx1, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %6, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !55
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !55
  call void @printLongLongLine(i64 %8), !dbg !56
  %9 = load i64*, i64** %data.addr, align 8, !dbg !57
  %10 = bitcast i64* %9 to i8*, !dbg !57
  call void @free(i8* %10) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i64* null, i64** %data, align 8, !dbg !65
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !66
  %0 = bitcast i8* %call to i64*, !dbg !67
  store i64* %0, i64** %data, align 8, !dbg !68
  %1 = load i64*, i64** %data, align 8, !dbg !69
  %cmp = icmp eq i64* %1, null, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_badSink(i64* %2), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_goodG2BSink(i64* %data) #0 !dbg !78 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %i, metadata !84, metadata !DIExpression()), !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !90
  %cmp = icmp ult i64 %1, 100, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !96
  %3 = load i64, i64* %arrayidx, align 8, !dbg !96
  %4 = load i64*, i64** %data.addr, align 8, !dbg !97
  %5 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !97
  store i64 %3, i64* %arrayidx1, align 8, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %6, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !105
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !105
  call void @printLongLongLine(i64 %8), !dbg !106
  %9 = load i64*, i64** %data.addr, align 8, !dbg !107
  %10 = bitcast i64* %9 to i8*, !dbg !107
  call void @free(i8* %10) #6, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_good() #0 !dbg !110 {
entry:
  call void @goodG2B(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !120, metadata !DIExpression()), !dbg !121
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call i64 @time(i64* null) #6, !dbg !124
  %conv = trunc i64 %call to i32, !dbg !125
  call void @srand(i32 %conv) #6, !dbg !126
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !127
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_good(), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !130
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_bad(), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !132
  ret i32 0, !dbg !133
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !134 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i64* null, i64** %data, align 8, !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !138
  %0 = bitcast i8* %call to i64*, !dbg !139
  store i64* %0, i64** %data, align 8, !dbg !140
  %1 = load i64*, i64** %data, align 8, !dbg !141
  %cmp = icmp eq i64* %1, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.end, !dbg !144

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !147
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_goodG2BSink(i64* %2), !dbg !148
  ret void, !dbg !149
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_badSink", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !4}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 21, type: !4)
!23 = !DILocation(line: 21, column: 84, scope: !18)
!24 = !DILocalVariable(name: "source", scope: !25, file: !19, line: 24, type: !26)
!25 = distinct !DILexicalBlock(scope: !18, file: !19, line: 23, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 24, column: 17, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !19, line: 26, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !19, line: 25, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 26, column: 20, scope: !31)
!36 = !DILocation(line: 28, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !19, line: 28, column: 13)
!38 = !DILocation(line: 28, column: 18, scope: !37)
!39 = !DILocation(line: 28, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !19, line: 28, column: 13)
!41 = !DILocation(line: 28, column: 27, scope: !40)
!42 = !DILocation(line: 28, column: 13, scope: !37)
!43 = !DILocation(line: 30, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 29, column: 13)
!45 = !DILocation(line: 30, column: 27, scope: !44)
!46 = !DILocation(line: 30, column: 17, scope: !44)
!47 = !DILocation(line: 30, column: 22, scope: !44)
!48 = !DILocation(line: 30, column: 25, scope: !44)
!49 = !DILocation(line: 31, column: 13, scope: !44)
!50 = !DILocation(line: 28, column: 35, scope: !40)
!51 = !DILocation(line: 28, column: 13, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 31, column: 13, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 32, column: 31, scope: !31)
!56 = !DILocation(line: 32, column: 13, scope: !31)
!57 = !DILocation(line: 33, column: 18, scope: !31)
!58 = !DILocation(line: 33, column: 13, scope: !31)
!59 = !DILocation(line: 36, column: 1, scope: !18)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_bad", scope: !19, file: !19, line: 38, type: !61, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !19, line: 40, type: !4)
!64 = !DILocation(line: 40, column: 15, scope: !60)
!65 = !DILocation(line: 41, column: 10, scope: !60)
!66 = !DILocation(line: 43, column: 23, scope: !60)
!67 = !DILocation(line: 43, column: 12, scope: !60)
!68 = !DILocation(line: 43, column: 10, scope: !60)
!69 = !DILocation(line: 44, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !60, file: !19, line: 44, column: 9)
!71 = !DILocation(line: 44, column: 14, scope: !70)
!72 = !DILocation(line: 44, column: 9, scope: !60)
!73 = !DILocation(line: 44, column: 24, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !19, line: 44, column: 23)
!75 = !DILocation(line: 45, column: 73, scope: !60)
!76 = !DILocation(line: 45, column: 5, scope: !60)
!77 = !DILocation(line: 46, column: 1, scope: !60)
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_goodG2BSink", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", arg: 1, scope: !78, file: !19, line: 52, type: !4)
!80 = !DILocation(line: 52, column: 88, scope: !78)
!81 = !DILocalVariable(name: "source", scope: !82, file: !19, line: 55, type: !26)
!82 = distinct !DILexicalBlock(scope: !78, file: !19, line: 54, column: 5)
!83 = !DILocation(line: 55, column: 17, scope: !82)
!84 = !DILocalVariable(name: "i", scope: !85, file: !19, line: 57, type: !32)
!85 = distinct !DILexicalBlock(scope: !82, file: !19, line: 56, column: 9)
!86 = !DILocation(line: 57, column: 20, scope: !85)
!87 = !DILocation(line: 59, column: 20, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !19, line: 59, column: 13)
!89 = !DILocation(line: 59, column: 18, scope: !88)
!90 = !DILocation(line: 59, column: 25, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !19, line: 59, column: 13)
!92 = !DILocation(line: 59, column: 27, scope: !91)
!93 = !DILocation(line: 59, column: 13, scope: !88)
!94 = !DILocation(line: 61, column: 34, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 60, column: 13)
!96 = !DILocation(line: 61, column: 27, scope: !95)
!97 = !DILocation(line: 61, column: 17, scope: !95)
!98 = !DILocation(line: 61, column: 22, scope: !95)
!99 = !DILocation(line: 61, column: 25, scope: !95)
!100 = !DILocation(line: 62, column: 13, scope: !95)
!101 = !DILocation(line: 59, column: 35, scope: !91)
!102 = !DILocation(line: 59, column: 13, scope: !91)
!103 = distinct !{!103, !93, !104, !54}
!104 = !DILocation(line: 62, column: 13, scope: !88)
!105 = !DILocation(line: 63, column: 31, scope: !85)
!106 = !DILocation(line: 63, column: 13, scope: !85)
!107 = !DILocation(line: 64, column: 18, scope: !85)
!108 = !DILocation(line: 64, column: 13, scope: !85)
!109 = !DILocation(line: 67, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_good", scope: !19, file: !19, line: 80, type: !61, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 82, column: 5, scope: !110)
!112 = !DILocation(line: 83, column: 1, scope: !110)
!113 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 95, type: !114, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!116, !116, !117}
!116 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!120 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !19, line: 95, type: !116)
!121 = !DILocation(line: 95, column: 14, scope: !113)
!122 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !19, line: 95, type: !117)
!123 = !DILocation(line: 95, column: 27, scope: !113)
!124 = !DILocation(line: 98, column: 22, scope: !113)
!125 = !DILocation(line: 98, column: 12, scope: !113)
!126 = !DILocation(line: 98, column: 5, scope: !113)
!127 = !DILocation(line: 100, column: 5, scope: !113)
!128 = !DILocation(line: 101, column: 5, scope: !113)
!129 = !DILocation(line: 102, column: 5, scope: !113)
!130 = !DILocation(line: 105, column: 5, scope: !113)
!131 = !DILocation(line: 106, column: 5, scope: !113)
!132 = !DILocation(line: 107, column: 5, scope: !113)
!133 = !DILocation(line: 109, column: 5, scope: !113)
!134 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 70, type: !61, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !19, line: 72, type: !4)
!136 = !DILocation(line: 72, column: 15, scope: !134)
!137 = !DILocation(line: 73, column: 10, scope: !134)
!138 = !DILocation(line: 75, column: 23, scope: !134)
!139 = !DILocation(line: 75, column: 12, scope: !134)
!140 = !DILocation(line: 75, column: 10, scope: !134)
!141 = !DILocation(line: 76, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !134, file: !19, line: 76, column: 9)
!143 = !DILocation(line: 76, column: 14, scope: !142)
!144 = !DILocation(line: 76, column: 9, scope: !134)
!145 = !DILocation(line: 76, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !19, line: 76, column: 23)
!147 = !DILocation(line: 77, column: 77, scope: !134)
!148 = !DILocation(line: 77, column: 5, scope: !134)
!149 = !DILocation(line: 78, column: 1, scope: !134)
