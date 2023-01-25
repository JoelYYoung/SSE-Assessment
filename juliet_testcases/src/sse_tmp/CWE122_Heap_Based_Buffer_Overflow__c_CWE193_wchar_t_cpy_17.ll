; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !32
  %1 = bitcast i8* %call to i32*, !dbg !34
  store i32* %1, i32** %data, align 8, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %3, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_bad.source to i8*), i64 44, i1 false), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call2 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %6), !dbg !58
  %7 = load i32*, i32** %data, align 8, !dbg !59
  %8 = bitcast i32* %7 to i8*, !dbg !59
  call void @free(i8* %8) #6, !dbg !60
  ret void, !dbg !61
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
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  store i32 0, i32* %h, align 4, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !94
  %cmp = icmp slt i32 %0, 1, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !98
  %1 = bitcast i8* %call to i32*, !dbg !100
  store i32* %1, i32** %data, align 8, !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  %cmp1 = icmp eq i32* %2, null, !dbg !104
  br i1 %cmp1, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !109
  %inc = add nsw i32 %3, 1, !dbg !109
  store i32 %inc, i32* %h, align 4, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !115
  %5 = load i32*, i32** %data, align 8, !dbg !116
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !117
  %call2 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !118
  %6 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %6), !dbg !120
  %7 = load i32*, i32** %data, align 8, !dbg !121
  %8 = bitcast i32* %7 to i8*, !dbg !121
  call void @free(i8* %8) #6, !dbg !122
  ret void, !dbg !123
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 30, type: !7)
!21 = !DILocation(line: 30, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocation(line: 32, column: 10, scope: !16)
!25 = !DILocation(line: 33, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 5)
!27 = !DILocation(line: 33, column: 9, scope: !26)
!28 = !DILocation(line: 33, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !17, line: 33, column: 5)
!30 = !DILocation(line: 33, column: 18, scope: !29)
!31 = !DILocation(line: 33, column: 5, scope: !26)
!32 = !DILocation(line: 36, column: 27, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 34, column: 5)
!34 = !DILocation(line: 36, column: 16, scope: !33)
!35 = !DILocation(line: 36, column: 14, scope: !33)
!36 = !DILocation(line: 37, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 37, column: 13)
!38 = !DILocation(line: 37, column: 18, scope: !37)
!39 = !DILocation(line: 37, column: 13, scope: !33)
!40 = !DILocation(line: 37, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 37, column: 27)
!42 = !DILocation(line: 38, column: 5, scope: !33)
!43 = !DILocation(line: 33, column: 24, scope: !29)
!44 = !DILocation(line: 33, column: 5, scope: !29)
!45 = distinct !{!45, !31, !46, !47}
!46 = !DILocation(line: 38, column: 5, scope: !26)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "source", scope: !49, file: !17, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 11)
!53 = !DILocation(line: 40, column: 17, scope: !49)
!54 = !DILocation(line: 42, column: 16, scope: !49)
!55 = !DILocation(line: 42, column: 22, scope: !49)
!56 = !DILocation(line: 42, column: 9, scope: !49)
!57 = !DILocation(line: 43, column: 20, scope: !49)
!58 = !DILocation(line: 43, column: 9, scope: !49)
!59 = !DILocation(line: 44, column: 14, scope: !49)
!60 = !DILocation(line: 44, column: 9, scope: !49)
!61 = !DILocation(line: 46, column: 1, scope: !16)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_17_good", scope: !17, file: !17, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 75, column: 5, scope: !62)
!64 = !DILocation(line: 76, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 88, type: !66, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !17, line: 88, type: !7)
!72 = !DILocation(line: 88, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !17, line: 88, type: !68)
!74 = !DILocation(line: 88, column: 27, scope: !65)
!75 = !DILocation(line: 91, column: 22, scope: !65)
!76 = !DILocation(line: 91, column: 12, scope: !65)
!77 = !DILocation(line: 91, column: 5, scope: !65)
!78 = !DILocation(line: 93, column: 5, scope: !65)
!79 = !DILocation(line: 94, column: 5, scope: !65)
!80 = !DILocation(line: 95, column: 5, scope: !65)
!81 = !DILocation(line: 98, column: 5, scope: !65)
!82 = !DILocation(line: 99, column: 5, scope: !65)
!83 = !DILocation(line: 100, column: 5, scope: !65)
!84 = !DILocation(line: 102, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "h", scope: !85, file: !17, line: 55, type: !7)
!87 = !DILocation(line: 55, column: 9, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !17, line: 56, type: !4)
!89 = !DILocation(line: 56, column: 15, scope: !85)
!90 = !DILocation(line: 57, column: 10, scope: !85)
!91 = !DILocation(line: 58, column: 11, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !17, line: 58, column: 5)
!93 = !DILocation(line: 58, column: 9, scope: !92)
!94 = !DILocation(line: 58, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !17, line: 58, column: 5)
!96 = !DILocation(line: 58, column: 18, scope: !95)
!97 = !DILocation(line: 58, column: 5, scope: !92)
!98 = !DILocation(line: 61, column: 27, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 59, column: 5)
!100 = !DILocation(line: 61, column: 16, scope: !99)
!101 = !DILocation(line: 61, column: 14, scope: !99)
!102 = !DILocation(line: 62, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 62, column: 13)
!104 = !DILocation(line: 62, column: 18, scope: !103)
!105 = !DILocation(line: 62, column: 13, scope: !99)
!106 = !DILocation(line: 62, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !17, line: 62, column: 27)
!108 = !DILocation(line: 63, column: 5, scope: !99)
!109 = !DILocation(line: 58, column: 24, scope: !95)
!110 = !DILocation(line: 58, column: 5, scope: !95)
!111 = distinct !{!111, !97, !112, !47}
!112 = !DILocation(line: 63, column: 5, scope: !92)
!113 = !DILocalVariable(name: "source", scope: !114, file: !17, line: 65, type: !50)
!114 = distinct !DILexicalBlock(scope: !85, file: !17, line: 64, column: 5)
!115 = !DILocation(line: 65, column: 17, scope: !114)
!116 = !DILocation(line: 67, column: 16, scope: !114)
!117 = !DILocation(line: 67, column: 22, scope: !114)
!118 = !DILocation(line: 67, column: 9, scope: !114)
!119 = !DILocation(line: 68, column: 20, scope: !114)
!120 = !DILocation(line: 68, column: 9, scope: !114)
!121 = !DILocation(line: 69, column: 14, scope: !114)
!122 = !DILocation(line: 69, column: 9, scope: !114)
!123 = !DILocation(line: 71, column: 1, scope: !85)
