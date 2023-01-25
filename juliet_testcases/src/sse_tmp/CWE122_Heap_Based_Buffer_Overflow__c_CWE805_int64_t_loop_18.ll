; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  br label %source, !dbg !25

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !26), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !28
  %0 = bitcast i8* %call to i64*, !dbg !29
  store i64* %0, i64** %data, align 8, !dbg !30
  %1 = load i64*, i64** %data, align 8, !dbg !31
  %cmp = icmp eq i64* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [100 x i64]* %source1 to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !52
  %cmp2 = icmp ult i64 %3, 100, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 %4, !dbg !58
  %5 = load i64, i64* %arrayidx, align 8, !dbg !58
  %6 = load i64*, i64** %data, align 8, !dbg !59
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !59
  store i64 %5, i64* %arrayidx3, align 8, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %8, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !68
  %10 = load i64, i64* %arrayidx4, align 8, !dbg !68
  call void @printLongLongLine(i64 %10), !dbg !69
  %11 = load i64*, i64** %data, align 8, !dbg !70
  %12 = bitcast i64* %11 to i8*, !dbg !70
  call void @free(i8* %12) #6, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18_good() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #6, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #6, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i64* null, i64** %data, align 8, !dbg !100
  br label %source, !dbg !101

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !102), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !104
  %0 = bitcast i8* %call to i64*, !dbg !105
  store i64* %0, i64** %data, align 8, !dbg !106
  %1 = load i64*, i64** %data, align 8, !dbg !107
  %cmp = icmp eq i64* %1, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = bitcast [100 x i64]* %source1 to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !122
  %cmp2 = icmp ult i64 %3, 100, !dbg !124
  br i1 %cmp2, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 %4, !dbg !128
  %5 = load i64, i64* %arrayidx, align 8, !dbg !128
  %6 = load i64*, i64** %data, align 8, !dbg !129
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !129
  store i64 %5, i64* %arrayidx3, align 8, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %8, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !137
  %10 = load i64, i64* %arrayidx4, align 8, !dbg !137
  call void @printLongLongLine(i64 %10), !dbg !138
  %11 = load i64*, i64** %data, align 8, !dbg !139
  %12 = bitcast i64* %11 to i8*, !dbg !139
  call void @free(i8* %12) #6, !dbg !140
  ret void, !dbg !141
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 25, column: 5, scope: !18)
!26 = !DILabel(scope: !18, name: "source", file: !19, line: 26)
!27 = !DILocation(line: 26, column: 1, scope: !18)
!28 = !DILocation(line: 28, column: 23, scope: !18)
!29 = !DILocation(line: 28, column: 12, scope: !18)
!30 = !DILocation(line: 28, column: 10, scope: !18)
!31 = !DILocation(line: 29, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 9)
!33 = !DILocation(line: 29, column: 14, scope: !32)
!34 = !DILocation(line: 29, column: 9, scope: !18)
!35 = !DILocation(line: 29, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 29, column: 23)
!37 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 31, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 31, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !19, line: 33, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !19, line: 32, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 33, column: 20, scope: !44)
!49 = !DILocation(line: 35, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !19, line: 35, column: 13)
!51 = !DILocation(line: 35, column: 18, scope: !50)
!52 = !DILocation(line: 35, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !19, line: 35, column: 13)
!54 = !DILocation(line: 35, column: 27, scope: !53)
!55 = !DILocation(line: 35, column: 13, scope: !50)
!56 = !DILocation(line: 37, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !19, line: 36, column: 13)
!58 = !DILocation(line: 37, column: 27, scope: !57)
!59 = !DILocation(line: 37, column: 17, scope: !57)
!60 = !DILocation(line: 37, column: 22, scope: !57)
!61 = !DILocation(line: 37, column: 25, scope: !57)
!62 = !DILocation(line: 38, column: 13, scope: !57)
!63 = !DILocation(line: 35, column: 35, scope: !53)
!64 = !DILocation(line: 35, column: 13, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 38, column: 13, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 39, column: 31, scope: !44)
!69 = !DILocation(line: 39, column: 13, scope: !44)
!70 = !DILocation(line: 40, column: 18, scope: !44)
!71 = !DILocation(line: 40, column: 13, scope: !44)
!72 = !DILocation(line: 43, column: 1, scope: !18)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_18_good", scope: !19, file: !19, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 76, column: 5, scope: !73)
!75 = !DILocation(line: 77, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 89, type: !77, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !19, line: 89, type: !79)
!84 = !DILocation(line: 89, column: 14, scope: !76)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !19, line: 89, type: !80)
!86 = !DILocation(line: 89, column: 27, scope: !76)
!87 = !DILocation(line: 92, column: 22, scope: !76)
!88 = !DILocation(line: 92, column: 12, scope: !76)
!89 = !DILocation(line: 92, column: 5, scope: !76)
!90 = !DILocation(line: 94, column: 5, scope: !76)
!91 = !DILocation(line: 95, column: 5, scope: !76)
!92 = !DILocation(line: 96, column: 5, scope: !76)
!93 = !DILocation(line: 99, column: 5, scope: !76)
!94 = !DILocation(line: 100, column: 5, scope: !76)
!95 = !DILocation(line: 101, column: 5, scope: !76)
!96 = !DILocation(line: 103, column: 5, scope: !76)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 52, type: !4)
!99 = !DILocation(line: 52, column: 15, scope: !97)
!100 = !DILocation(line: 53, column: 10, scope: !97)
!101 = !DILocation(line: 54, column: 5, scope: !97)
!102 = !DILabel(scope: !97, name: "source", file: !19, line: 55)
!103 = !DILocation(line: 55, column: 1, scope: !97)
!104 = !DILocation(line: 57, column: 23, scope: !97)
!105 = !DILocation(line: 57, column: 12, scope: !97)
!106 = !DILocation(line: 57, column: 10, scope: !97)
!107 = !DILocation(line: 58, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !19, line: 58, column: 9)
!109 = !DILocation(line: 58, column: 14, scope: !108)
!110 = !DILocation(line: 58, column: 9, scope: !97)
!111 = !DILocation(line: 58, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !19, line: 58, column: 23)
!113 = !DILocalVariable(name: "source", scope: !114, file: !19, line: 60, type: !39)
!114 = distinct !DILexicalBlock(scope: !97, file: !19, line: 59, column: 5)
!115 = !DILocation(line: 60, column: 17, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !19, line: 62, type: !45)
!117 = distinct !DILexicalBlock(scope: !114, file: !19, line: 61, column: 9)
!118 = !DILocation(line: 62, column: 20, scope: !117)
!119 = !DILocation(line: 64, column: 20, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !19, line: 64, column: 13)
!121 = !DILocation(line: 64, column: 18, scope: !120)
!122 = !DILocation(line: 64, column: 25, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !19, line: 64, column: 13)
!124 = !DILocation(line: 64, column: 27, scope: !123)
!125 = !DILocation(line: 64, column: 13, scope: !120)
!126 = !DILocation(line: 66, column: 34, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !19, line: 65, column: 13)
!128 = !DILocation(line: 66, column: 27, scope: !127)
!129 = !DILocation(line: 66, column: 17, scope: !127)
!130 = !DILocation(line: 66, column: 22, scope: !127)
!131 = !DILocation(line: 66, column: 25, scope: !127)
!132 = !DILocation(line: 67, column: 13, scope: !127)
!133 = !DILocation(line: 64, column: 35, scope: !123)
!134 = !DILocation(line: 64, column: 13, scope: !123)
!135 = distinct !{!135, !125, !136, !67}
!136 = !DILocation(line: 67, column: 13, scope: !120)
!137 = !DILocation(line: 68, column: 31, scope: !117)
!138 = !DILocation(line: 68, column: 13, scope: !117)
!139 = !DILocation(line: 69, column: 18, scope: !117)
!140 = !DILocation(line: 69, column: 13, scope: !117)
!141 = !DILocation(line: 72, column: 1, scope: !97)
