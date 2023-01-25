; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* null, i8** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %if.end
  %2 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %2, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call2 = call i8* @strcpy(i8* %4, i8* %arraydecay) #6, !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %5), !dbg !56
  %6 = load i8*, i8** %data, align 8, !dbg !57
  call void @free(i8* %6) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %h, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  store i32 0, i32* %h, align 4, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !90
  %cmp = icmp slt i32 %0, 1, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !94
  store i8* %call, i8** %data, align 8, !dbg !96
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %cmp1 = icmp eq i8* %1, null, !dbg !99
  br i1 %cmp1, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %if.end
  %2 = load i32, i32* %h, align 4, !dbg !104
  %inc = add nsw i32 %2, 1, !dbg !104
  store i32 %inc, i32* %h, align 4, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %call2 = call i8* @strcpy(i8* %4, i8* %arraydecay) #6, !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %5), !dbg !115
  %6 = load i8*, i8** %data, align 8, !dbg !116
  call void @free(i8* %6) #6, !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 30, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 12, scope: !14)
!23 = !DILocation(line: 32, column: 10, scope: !14)
!24 = !DILocation(line: 33, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 33, column: 9, scope: !25)
!27 = !DILocation(line: 33, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 33, column: 5)
!29 = !DILocation(line: 33, column: 18, scope: !28)
!30 = !DILocation(line: 33, column: 5, scope: !25)
!31 = !DILocation(line: 36, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 14, scope: !32)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !32)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 5, scope: !32)
!41 = !DILocation(line: 33, column: 24, scope: !28)
!42 = !DILocation(line: 33, column: 5, scope: !28)
!43 = distinct !{!43, !30, !44, !45}
!44 = !DILocation(line: 38, column: 5, scope: !25)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 40, column: 14, scope: !47)
!52 = !DILocation(line: 42, column: 16, scope: !47)
!53 = !DILocation(line: 42, column: 22, scope: !47)
!54 = !DILocation(line: 42, column: 9, scope: !47)
!55 = !DILocation(line: 43, column: 19, scope: !47)
!56 = !DILocation(line: 43, column: 9, scope: !47)
!57 = !DILocation(line: 44, column: 14, scope: !47)
!58 = !DILocation(line: 44, column: 9, scope: !47)
!59 = !DILocation(line: 46, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_17_good", scope: !15, file: !15, line: 73, type: !16, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 75, column: 5, scope: !60)
!62 = !DILocation(line: 76, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 88, type: !64, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!19, !19, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 88, type: !19)
!68 = !DILocation(line: 88, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 88, type: !66)
!70 = !DILocation(line: 88, column: 27, scope: !63)
!71 = !DILocation(line: 91, column: 22, scope: !63)
!72 = !DILocation(line: 91, column: 12, scope: !63)
!73 = !DILocation(line: 91, column: 5, scope: !63)
!74 = !DILocation(line: 93, column: 5, scope: !63)
!75 = !DILocation(line: 94, column: 5, scope: !63)
!76 = !DILocation(line: 95, column: 5, scope: !63)
!77 = !DILocation(line: 98, column: 5, scope: !63)
!78 = !DILocation(line: 99, column: 5, scope: !63)
!79 = !DILocation(line: 100, column: 5, scope: !63)
!80 = !DILocation(line: 102, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "h", scope: !81, file: !15, line: 55, type: !19)
!83 = !DILocation(line: 55, column: 9, scope: !81)
!84 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 56, type: !4)
!85 = !DILocation(line: 56, column: 12, scope: !81)
!86 = !DILocation(line: 57, column: 10, scope: !81)
!87 = !DILocation(line: 58, column: 11, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !15, line: 58, column: 5)
!89 = !DILocation(line: 58, column: 9, scope: !88)
!90 = !DILocation(line: 58, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 58, column: 5)
!92 = !DILocation(line: 58, column: 18, scope: !91)
!93 = !DILocation(line: 58, column: 5, scope: !88)
!94 = !DILocation(line: 61, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 59, column: 5)
!96 = !DILocation(line: 61, column: 14, scope: !95)
!97 = !DILocation(line: 62, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !15, line: 62, column: 13)
!99 = !DILocation(line: 62, column: 18, scope: !98)
!100 = !DILocation(line: 62, column: 13, scope: !95)
!101 = !DILocation(line: 62, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 62, column: 27)
!103 = !DILocation(line: 63, column: 5, scope: !95)
!104 = !DILocation(line: 58, column: 24, scope: !91)
!105 = !DILocation(line: 58, column: 5, scope: !91)
!106 = distinct !{!106, !93, !107, !45}
!107 = !DILocation(line: 63, column: 5, scope: !88)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 65, type: !48)
!109 = distinct !DILexicalBlock(scope: !81, file: !15, line: 64, column: 5)
!110 = !DILocation(line: 65, column: 14, scope: !109)
!111 = !DILocation(line: 67, column: 16, scope: !109)
!112 = !DILocation(line: 67, column: 22, scope: !109)
!113 = !DILocation(line: 67, column: 9, scope: !109)
!114 = !DILocation(line: 68, column: 19, scope: !109)
!115 = !DILocation(line: 68, column: 9, scope: !109)
!116 = !DILocation(line: 69, column: 14, scope: !109)
!117 = !DILocation(line: 69, column: 9, scope: !109)
!118 = !DILocation(line: 71, column: 1, scope: !81)
