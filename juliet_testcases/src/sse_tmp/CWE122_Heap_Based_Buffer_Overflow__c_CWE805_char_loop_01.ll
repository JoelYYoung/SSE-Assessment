; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx1, align 1, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !48
  %cmp2 = icmp ult i64 %2, 100, !dbg !50
  br i1 %cmp2, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !54
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !55
  store i8 %4, i8* %arrayidx4, align 1, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %7, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !64
  store i8 0, i8* %arrayidx5, align 1, !dbg !65
  %9 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %9), !dbg !67
  %10 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* %10) #6, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #6, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #6, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx1, align 1, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !118
  %cmp2 = icmp ult i64 %2, 100, !dbg !120
  br i1 %cmp2, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !124
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !124
  %5 = load i8*, i8** %data, align 8, !dbg !125
  %6 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !125
  store i8 %4, i8* %arrayidx4, align 1, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %7, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !133
  store i8 0, i8* %arrayidx5, align 1, !dbg !134
  %9 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* %9), !dbg !136
  %10 = load i8*, i8** %data, align 8, !dbg !137
  call void @free(i8* %10) #6, !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 20, scope: !14)
!22 = !DILocation(line: 28, column: 10, scope: !14)
!23 = !DILocation(line: 29, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!25 = !DILocation(line: 29, column: 14, scope: !24)
!26 = !DILocation(line: 29, column: 9, scope: !14)
!27 = !DILocation(line: 29, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 23)
!29 = !DILocation(line: 30, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 13, scope: !14)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 32, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 32, column: 16, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 33, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 14, scope: !32)
!42 = !DILocation(line: 34, column: 9, scope: !32)
!43 = !DILocation(line: 35, column: 9, scope: !32)
!44 = !DILocation(line: 35, column: 23, scope: !32)
!45 = !DILocation(line: 37, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !15, line: 37, column: 9)
!47 = !DILocation(line: 37, column: 14, scope: !46)
!48 = !DILocation(line: 37, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 37, column: 9)
!50 = !DILocation(line: 37, column: 23, scope: !49)
!51 = !DILocation(line: 37, column: 9, scope: !46)
!52 = !DILocation(line: 39, column: 30, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 38, column: 9)
!54 = !DILocation(line: 39, column: 23, scope: !53)
!55 = !DILocation(line: 39, column: 13, scope: !53)
!56 = !DILocation(line: 39, column: 18, scope: !53)
!57 = !DILocation(line: 39, column: 21, scope: !53)
!58 = !DILocation(line: 40, column: 9, scope: !53)
!59 = !DILocation(line: 37, column: 31, scope: !49)
!60 = !DILocation(line: 37, column: 9, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 40, column: 9, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 41, column: 9, scope: !32)
!65 = !DILocation(line: 41, column: 21, scope: !32)
!66 = !DILocation(line: 42, column: 19, scope: !32)
!67 = !DILocation(line: 42, column: 9, scope: !32)
!68 = !DILocation(line: 43, column: 14, scope: !32)
!69 = !DILocation(line: 43, column: 9, scope: !32)
!70 = !DILocation(line: 45, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_01_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 78, column: 5, scope: !71)
!73 = !DILocation(line: 79, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !75, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !15, line: 91, type: !77)
!80 = !DILocation(line: 91, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !15, line: 91, type: !78)
!82 = !DILocation(line: 91, column: 27, scope: !74)
!83 = !DILocation(line: 94, column: 22, scope: !74)
!84 = !DILocation(line: 94, column: 12, scope: !74)
!85 = !DILocation(line: 94, column: 5, scope: !74)
!86 = !DILocation(line: 96, column: 5, scope: !74)
!87 = !DILocation(line: 97, column: 5, scope: !74)
!88 = !DILocation(line: 98, column: 5, scope: !74)
!89 = !DILocation(line: 101, column: 5, scope: !74)
!90 = !DILocation(line: 102, column: 5, scope: !74)
!91 = !DILocation(line: 103, column: 5, scope: !74)
!92 = !DILocation(line: 105, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 54, type: !4)
!95 = !DILocation(line: 54, column: 12, scope: !93)
!96 = !DILocation(line: 55, column: 10, scope: !93)
!97 = !DILocation(line: 57, column: 20, scope: !93)
!98 = !DILocation(line: 57, column: 10, scope: !93)
!99 = !DILocation(line: 58, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !15, line: 58, column: 9)
!101 = !DILocation(line: 58, column: 14, scope: !100)
!102 = !DILocation(line: 58, column: 9, scope: !93)
!103 = !DILocation(line: 58, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 58, column: 23)
!105 = !DILocation(line: 59, column: 5, scope: !93)
!106 = !DILocation(line: 59, column: 13, scope: !93)
!107 = !DILocalVariable(name: "i", scope: !108, file: !15, line: 61, type: !33)
!108 = distinct !DILexicalBlock(scope: !93, file: !15, line: 60, column: 5)
!109 = !DILocation(line: 61, column: 16, scope: !108)
!110 = !DILocalVariable(name: "source", scope: !108, file: !15, line: 62, type: !38)
!111 = !DILocation(line: 62, column: 14, scope: !108)
!112 = !DILocation(line: 63, column: 9, scope: !108)
!113 = !DILocation(line: 64, column: 9, scope: !108)
!114 = !DILocation(line: 64, column: 23, scope: !108)
!115 = !DILocation(line: 66, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !15, line: 66, column: 9)
!117 = !DILocation(line: 66, column: 14, scope: !116)
!118 = !DILocation(line: 66, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 66, column: 9)
!120 = !DILocation(line: 66, column: 23, scope: !119)
!121 = !DILocation(line: 66, column: 9, scope: !116)
!122 = !DILocation(line: 68, column: 30, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 67, column: 9)
!124 = !DILocation(line: 68, column: 23, scope: !123)
!125 = !DILocation(line: 68, column: 13, scope: !123)
!126 = !DILocation(line: 68, column: 18, scope: !123)
!127 = !DILocation(line: 68, column: 21, scope: !123)
!128 = !DILocation(line: 69, column: 9, scope: !123)
!129 = !DILocation(line: 66, column: 31, scope: !119)
!130 = !DILocation(line: 66, column: 9, scope: !119)
!131 = distinct !{!131, !121, !132, !63}
!132 = !DILocation(line: 69, column: 9, scope: !116)
!133 = !DILocation(line: 70, column: 9, scope: !108)
!134 = !DILocation(line: 70, column: 21, scope: !108)
!135 = !DILocation(line: 71, column: 19, scope: !108)
!136 = !DILocation(line: 71, column: 9, scope: !108)
!137 = !DILocation(line: 72, column: 14, scope: !108)
!138 = !DILocation(line: 72, column: 9, scope: !108)
!139 = !DILocation(line: 74, column: 1, scope: !93)
