; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !32

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %while.end
  %3 = load i64, i64* %i, align 8, !dbg !48
  %cmp1 = icmp ult i64 %3, 100, !dbg !50
  br i1 %cmp1, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !54
  %5 = load i32, i32* %arrayidx, align 4, !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %7 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !55
  store i32 %5, i32* %arrayidx2, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %8, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !64
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !64
  call void @printIntLine(i32 %10), !dbg !65
  %11 = load i32*, i32** %data, align 8, !dbg !66
  %12 = bitcast i32* %11 to i8*, !dbg !66
  call void @free(i8* %12) #6, !dbg !67
  ret void, !dbg !68
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  br label %while.body, !dbg !96

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !97
  %0 = bitcast i8* %call to i32*, !dbg !99
  store i32* %0, i32** %data, align 8, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %cmp = icmp eq i32* %1, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !107

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %while.end
  %3 = load i64, i64* %i, align 8, !dbg !117
  %cmp1 = icmp ult i64 %3, 100, !dbg !119
  br i1 %cmp1, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !123
  %5 = load i32, i32* %arrayidx, align 4, !dbg !123
  %6 = load i32*, i32** %data, align 8, !dbg !124
  %7 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !124
  store i32 %5, i32* %arrayidx2, align 4, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %8, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !132
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !132
  call void @printIntLine(i32 %10), !dbg !133
  %11 = load i32*, i32** %data, align 8, !dbg !134
  %12 = bitcast i32* %11 to i8*, !dbg !134
  call void @free(i8* %12) #6, !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 5, scope: !14)
!22 = !DILocation(line: 28, column: 23, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 26, column: 5)
!24 = !DILocation(line: 28, column: 16, scope: !23)
!25 = !DILocation(line: 28, column: 14, scope: !23)
!26 = !DILocation(line: 29, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 29, column: 13)
!28 = !DILocation(line: 29, column: 18, scope: !27)
!29 = !DILocation(line: 29, column: 13, scope: !23)
!30 = !DILocation(line: 29, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 29, column: 27)
!32 = !DILocation(line: 30, column: 9, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 33, column: 13, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !15, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !34, file: !15, line: 34, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 35, column: 20, scope: !40)
!45 = !DILocation(line: 37, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !15, line: 37, column: 13)
!47 = !DILocation(line: 37, column: 18, scope: !46)
!48 = !DILocation(line: 37, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 37, column: 13)
!50 = !DILocation(line: 37, column: 27, scope: !49)
!51 = !DILocation(line: 37, column: 13, scope: !46)
!52 = !DILocation(line: 39, column: 34, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 38, column: 13)
!54 = !DILocation(line: 39, column: 27, scope: !53)
!55 = !DILocation(line: 39, column: 17, scope: !53)
!56 = !DILocation(line: 39, column: 22, scope: !53)
!57 = !DILocation(line: 39, column: 25, scope: !53)
!58 = !DILocation(line: 40, column: 13, scope: !53)
!59 = !DILocation(line: 37, column: 35, scope: !49)
!60 = !DILocation(line: 37, column: 13, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 40, column: 13, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 41, column: 26, scope: !40)
!65 = !DILocation(line: 41, column: 13, scope: !40)
!66 = !DILocation(line: 42, column: 18, scope: !40)
!67 = !DILocation(line: 42, column: 13, scope: !40)
!68 = !DILocation(line: 45, column: 1, scope: !14)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_16_good", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 80, column: 5, scope: !69)
!71 = !DILocation(line: 81, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !73, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!5, !5, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !15, line: 93, type: !5)
!79 = !DILocation(line: 93, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !15, line: 93, type: !75)
!81 = !DILocation(line: 93, column: 27, scope: !72)
!82 = !DILocation(line: 96, column: 22, scope: !72)
!83 = !DILocation(line: 96, column: 12, scope: !72)
!84 = !DILocation(line: 96, column: 5, scope: !72)
!85 = !DILocation(line: 98, column: 5, scope: !72)
!86 = !DILocation(line: 99, column: 5, scope: !72)
!87 = !DILocation(line: 100, column: 5, scope: !72)
!88 = !DILocation(line: 103, column: 5, scope: !72)
!89 = !DILocation(line: 104, column: 5, scope: !72)
!90 = !DILocation(line: 105, column: 5, scope: !72)
!91 = !DILocation(line: 107, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !15, line: 54, type: !4)
!94 = !DILocation(line: 54, column: 11, scope: !92)
!95 = !DILocation(line: 55, column: 10, scope: !92)
!96 = !DILocation(line: 56, column: 5, scope: !92)
!97 = !DILocation(line: 59, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !15, line: 57, column: 5)
!99 = !DILocation(line: 59, column: 16, scope: !98)
!100 = !DILocation(line: 59, column: 14, scope: !98)
!101 = !DILocation(line: 60, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 60, column: 13)
!103 = !DILocation(line: 60, column: 18, scope: !102)
!104 = !DILocation(line: 60, column: 13, scope: !98)
!105 = !DILocation(line: 60, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 60, column: 27)
!107 = !DILocation(line: 61, column: 9, scope: !98)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 64, type: !35)
!109 = distinct !DILexicalBlock(scope: !92, file: !15, line: 63, column: 5)
!110 = !DILocation(line: 64, column: 13, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !112, file: !15, line: 66, type: !41)
!112 = distinct !DILexicalBlock(scope: !109, file: !15, line: 65, column: 9)
!113 = !DILocation(line: 66, column: 20, scope: !112)
!114 = !DILocation(line: 68, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 68, column: 13)
!116 = !DILocation(line: 68, column: 18, scope: !115)
!117 = !DILocation(line: 68, column: 25, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !15, line: 68, column: 13)
!119 = !DILocation(line: 68, column: 27, scope: !118)
!120 = !DILocation(line: 68, column: 13, scope: !115)
!121 = !DILocation(line: 70, column: 34, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 69, column: 13)
!123 = !DILocation(line: 70, column: 27, scope: !122)
!124 = !DILocation(line: 70, column: 17, scope: !122)
!125 = !DILocation(line: 70, column: 22, scope: !122)
!126 = !DILocation(line: 70, column: 25, scope: !122)
!127 = !DILocation(line: 71, column: 13, scope: !122)
!128 = !DILocation(line: 68, column: 35, scope: !118)
!129 = !DILocation(line: 68, column: 13, scope: !118)
!130 = distinct !{!130, !120, !131, !63}
!131 = !DILocation(line: 71, column: 13, scope: !115)
!132 = !DILocation(line: 72, column: 26, scope: !112)
!133 = !DILocation(line: 72, column: 13, scope: !112)
!134 = !DILocation(line: 73, column: 18, scope: !112)
!135 = !DILocation(line: 73, column: 13, scope: !112)
!136 = !DILocation(line: 76, column: 1, scope: !92)
