; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !24
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !26
  %1 = load i32*, i32** %data, align 8, !dbg !27
  %cmp = icmp eq i32* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !36
  %cmp1 = icmp slt i32 %2, 1, !dbg !38
  br i1 %cmp1, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %5, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !56
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !57
  %7 = load i32*, i32** %data, align 8, !dbg !58
  %call3 = call i32* @wcscat(i32* %arraydecay, i32* %7) #6, !dbg !59
  %8 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %8), !dbg !61
  %9 = load i32*, i32** %data, align 8, !dbg !62
  %10 = bitcast i32* %9 to i8*, !dbg !62
  call void @free(i8* %10) #6, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
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
  store i32 0, i32* %h, align 4, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %h, align 4, !dbg !105
  %cmp1 = icmp slt i32 %2, 1, !dbg !107
  br i1 %cmp1, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !109
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !111
  %4 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !115
  %inc = add nsw i32 %5, 1, !dbg !115
  store i32 %inc, i32* %h, align 4, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !121
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !122
  %7 = load i32*, i32** %data, align 8, !dbg !123
  %call3 = call i32* @wcscat(i32* %arraydecay, i32* %7) #6, !dbg !124
  %8 = load i32*, i32** %data, align 8, !dbg !125
  call void @printWLine(i32* %8), !dbg !126
  %9 = load i32*, i32** %data, align 8, !dbg !127
  %10 = bitcast i32* %9 to i8*, !dbg !127
  call void @free(i8* %10) #6, !dbg !128
  ret void, !dbg !129
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 23, scope: !16)
!25 = !DILocation(line: 27, column: 12, scope: !16)
!26 = !DILocation(line: 27, column: 10, scope: !16)
!27 = !DILocation(line: 28, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 9)
!29 = !DILocation(line: 28, column: 14, scope: !28)
!30 = !DILocation(line: 28, column: 9, scope: !16)
!31 = !DILocation(line: 28, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 28, column: 23)
!33 = !DILocation(line: 29, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!35 = !DILocation(line: 29, column: 9, scope: !34)
!36 = !DILocation(line: 29, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !17, line: 29, column: 5)
!38 = !DILocation(line: 29, column: 18, scope: !37)
!39 = !DILocation(line: 29, column: 5, scope: !34)
!40 = !DILocation(line: 32, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 30, column: 5)
!42 = !DILocation(line: 32, column: 9, scope: !41)
!43 = !DILocation(line: 33, column: 9, scope: !41)
!44 = !DILocation(line: 33, column: 21, scope: !41)
!45 = !DILocation(line: 34, column: 5, scope: !41)
!46 = !DILocation(line: 29, column: 24, scope: !37)
!47 = !DILocation(line: 29, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 34, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "dest", scope: !52, file: !17, line: 36, type: !53)
!52 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 50)
!56 = !DILocation(line: 36, column: 17, scope: !52)
!57 = !DILocation(line: 38, column: 16, scope: !52)
!58 = !DILocation(line: 38, column: 22, scope: !52)
!59 = !DILocation(line: 38, column: 9, scope: !52)
!60 = !DILocation(line: 39, column: 20, scope: !52)
!61 = !DILocation(line: 39, column: 9, scope: !52)
!62 = !DILocation(line: 40, column: 14, scope: !52)
!63 = !DILocation(line: 40, column: 9, scope: !52)
!64 = !DILocation(line: 42, column: 1, scope: !16)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_17_good", scope: !17, file: !17, line: 70, type: !18, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 72, column: 5, scope: !65)
!67 = !DILocation(line: 73, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 85, type: !69, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !17, line: 85, type: !7)
!75 = !DILocation(line: 85, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !17, line: 85, type: !71)
!77 = !DILocation(line: 85, column: 27, scope: !68)
!78 = !DILocation(line: 88, column: 22, scope: !68)
!79 = !DILocation(line: 88, column: 12, scope: !68)
!80 = !DILocation(line: 88, column: 5, scope: !68)
!81 = !DILocation(line: 90, column: 5, scope: !68)
!82 = !DILocation(line: 91, column: 5, scope: !68)
!83 = !DILocation(line: 92, column: 5, scope: !68)
!84 = !DILocation(line: 95, column: 5, scope: !68)
!85 = !DILocation(line: 96, column: 5, scope: !68)
!86 = !DILocation(line: 97, column: 5, scope: !68)
!87 = !DILocation(line: 99, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 49, type: !18, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "h", scope: !88, file: !17, line: 51, type: !7)
!90 = !DILocation(line: 51, column: 9, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !17, line: 52, type: !4)
!92 = !DILocation(line: 52, column: 15, scope: !88)
!93 = !DILocation(line: 53, column: 23, scope: !88)
!94 = !DILocation(line: 53, column: 12, scope: !88)
!95 = !DILocation(line: 53, column: 10, scope: !88)
!96 = !DILocation(line: 54, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !88, file: !17, line: 54, column: 9)
!98 = !DILocation(line: 54, column: 14, scope: !97)
!99 = !DILocation(line: 54, column: 9, scope: !88)
!100 = !DILocation(line: 54, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 54, column: 23)
!102 = !DILocation(line: 55, column: 11, scope: !103)
!103 = distinct !DILexicalBlock(scope: !88, file: !17, line: 55, column: 5)
!104 = !DILocation(line: 55, column: 9, scope: !103)
!105 = !DILocation(line: 55, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !17, line: 55, column: 5)
!107 = !DILocation(line: 55, column: 18, scope: !106)
!108 = !DILocation(line: 55, column: 5, scope: !103)
!109 = !DILocation(line: 58, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 56, column: 5)
!111 = !DILocation(line: 58, column: 9, scope: !110)
!112 = !DILocation(line: 59, column: 9, scope: !110)
!113 = !DILocation(line: 59, column: 20, scope: !110)
!114 = !DILocation(line: 60, column: 5, scope: !110)
!115 = !DILocation(line: 55, column: 24, scope: !106)
!116 = !DILocation(line: 55, column: 5, scope: !106)
!117 = distinct !{!117, !108, !118, !50}
!118 = !DILocation(line: 60, column: 5, scope: !103)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !17, line: 62, type: !53)
!120 = distinct !DILexicalBlock(scope: !88, file: !17, line: 61, column: 5)
!121 = !DILocation(line: 62, column: 17, scope: !120)
!122 = !DILocation(line: 64, column: 16, scope: !120)
!123 = !DILocation(line: 64, column: 22, scope: !120)
!124 = !DILocation(line: 64, column: 9, scope: !120)
!125 = !DILocation(line: 65, column: 20, scope: !120)
!126 = !DILocation(line: 65, column: 9, scope: !120)
!127 = !DILocation(line: 66, column: 14, scope: !120)
!128 = !DILocation(line: 66, column: 9, scope: !120)
!129 = !DILocation(line: 68, column: 1, scope: !88)
