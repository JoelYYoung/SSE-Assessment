; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %cmp = icmp slt i32 %0, 1, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %3, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %6 = bitcast i32* %5 to i8*, !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %7 = bitcast i32* %arraydecay to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !53
  %8 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !54
  %9 = load i32, i32* %arrayidx, align 4, !dbg !54
  call void @printIntLine(i32 %9), !dbg !55
  %10 = load i32*, i32** %data, align 8, !dbg !56
  %11 = bitcast i32* %10 to i8*, !dbg !56
  call void @free(i8* %11) #7, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  store i32 0, i32* %h, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !91
  %cmp = icmp slt i32 %0, 1, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !95
  %1 = bitcast i8* %call to i32*, !dbg !97
  store i32* %1, i32** %data, align 8, !dbg !98
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %cmp1 = icmp eq i32* %2, null, !dbg !101
  br i1 %cmp1, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !106
  %inc = add nsw i32 %3, 1, !dbg !106
  store i32 %inc, i32* %h, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %6 = bitcast i32* %5 to i8*, !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %7 = bitcast i32* %arraydecay to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !114
  %8 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !115
  %9 = load i32, i32* %arrayidx, align 4, !dbg !115
  call void @printIntLine(i32 %9), !dbg !116
  %10 = load i32*, i32** %data, align 8, !dbg !117
  %11 = bitcast i32* %10 to i8*, !dbg !117
  call void @free(i8* %11) #7, !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 23, type: !5)
!19 = !DILocation(line: 23, column: 9, scope: !14)
!20 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!21 = !DILocation(line: 24, column: 11, scope: !14)
!22 = !DILocation(line: 25, column: 10, scope: !14)
!23 = !DILocation(line: 26, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 26, column: 5)
!25 = !DILocation(line: 26, column: 9, scope: !24)
!26 = !DILocation(line: 26, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !15, line: 26, column: 5)
!28 = !DILocation(line: 26, column: 18, scope: !27)
!29 = !DILocation(line: 26, column: 5, scope: !24)
!30 = !DILocation(line: 29, column: 23, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 27, column: 5)
!32 = !DILocation(line: 29, column: 16, scope: !31)
!33 = !DILocation(line: 29, column: 14, scope: !31)
!34 = !DILocation(line: 30, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 30, column: 13)
!36 = !DILocation(line: 30, column: 18, scope: !35)
!37 = !DILocation(line: 30, column: 13, scope: !31)
!38 = !DILocation(line: 30, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 30, column: 27)
!40 = !DILocation(line: 31, column: 5, scope: !31)
!41 = !DILocation(line: 26, column: 24, scope: !27)
!42 = !DILocation(line: 26, column: 5, scope: !27)
!43 = distinct !{!43, !29, !44, !45}
!44 = !DILocation(line: 31, column: 5, scope: !24)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 33, type: !48)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 33, column: 13, scope: !47)
!52 = !DILocation(line: 35, column: 16, scope: !47)
!53 = !DILocation(line: 35, column: 9, scope: !47)
!54 = !DILocation(line: 36, column: 22, scope: !47)
!55 = !DILocation(line: 36, column: 9, scope: !47)
!56 = !DILocation(line: 37, column: 14, scope: !47)
!57 = !DILocation(line: 37, column: 9, scope: !47)
!58 = !DILocation(line: 39, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_17_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 68, column: 5, scope: !59)
!61 = !DILocation(line: 69, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 81, type: !63, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!5, !5, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !15, line: 81, type: !5)
!69 = !DILocation(line: 81, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !15, line: 81, type: !65)
!71 = !DILocation(line: 81, column: 27, scope: !62)
!72 = !DILocation(line: 84, column: 22, scope: !62)
!73 = !DILocation(line: 84, column: 12, scope: !62)
!74 = !DILocation(line: 84, column: 5, scope: !62)
!75 = !DILocation(line: 86, column: 5, scope: !62)
!76 = !DILocation(line: 87, column: 5, scope: !62)
!77 = !DILocation(line: 88, column: 5, scope: !62)
!78 = !DILocation(line: 91, column: 5, scope: !62)
!79 = !DILocation(line: 92, column: 5, scope: !62)
!80 = !DILocation(line: 93, column: 5, scope: !62)
!81 = !DILocation(line: 95, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "h", scope: !82, file: !15, line: 48, type: !5)
!84 = !DILocation(line: 48, column: 9, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 49, type: !4)
!86 = !DILocation(line: 49, column: 11, scope: !82)
!87 = !DILocation(line: 50, column: 10, scope: !82)
!88 = !DILocation(line: 51, column: 11, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !15, line: 51, column: 5)
!90 = !DILocation(line: 51, column: 9, scope: !89)
!91 = !DILocation(line: 51, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !15, line: 51, column: 5)
!93 = !DILocation(line: 51, column: 18, scope: !92)
!94 = !DILocation(line: 51, column: 5, scope: !89)
!95 = !DILocation(line: 54, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 52, column: 5)
!97 = !DILocation(line: 54, column: 16, scope: !96)
!98 = !DILocation(line: 54, column: 14, scope: !96)
!99 = !DILocation(line: 55, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 55, column: 13)
!101 = !DILocation(line: 55, column: 18, scope: !100)
!102 = !DILocation(line: 55, column: 13, scope: !96)
!103 = !DILocation(line: 55, column: 28, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 55, column: 27)
!105 = !DILocation(line: 56, column: 5, scope: !96)
!106 = !DILocation(line: 51, column: 24, scope: !92)
!107 = !DILocation(line: 51, column: 5, scope: !92)
!108 = distinct !{!108, !94, !109, !45}
!109 = !DILocation(line: 56, column: 5, scope: !89)
!110 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 58, type: !48)
!111 = distinct !DILexicalBlock(scope: !82, file: !15, line: 57, column: 5)
!112 = !DILocation(line: 58, column: 13, scope: !111)
!113 = !DILocation(line: 60, column: 16, scope: !111)
!114 = !DILocation(line: 60, column: 9, scope: !111)
!115 = !DILocation(line: 61, column: 22, scope: !111)
!116 = !DILocation(line: 61, column: 9, scope: !111)
!117 = !DILocation(line: 62, column: 14, scope: !111)
!118 = !DILocation(line: 62, column: 9, scope: !111)
!119 = !DILocation(line: 64, column: 1, scope: !82)
