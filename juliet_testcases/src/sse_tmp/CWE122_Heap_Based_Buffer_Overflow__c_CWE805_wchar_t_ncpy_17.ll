; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
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
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !32
  %1 = bitcast i8* %call to i32*, !dbg !34
  store i32* %1, i32** %data, align 8, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %4, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  %5 = load i32*, i32** %data, align 8, !dbg !60
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !62
  %6 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !63
  store i32 0, i32* %arrayidx6, align 4, !dbg !64
  %7 = load i32*, i32** %data, align 8, !dbg !65
  call void @printWLine(i32* %7), !dbg !66
  %8 = load i32*, i32** %data, align 8, !dbg !67
  %9 = bitcast i32* %8 to i8*, !dbg !67
  call void @free(i8* %9) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  store i32 0, i32* %h, align 4, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !102
  %cmp = icmp slt i32 %0, 1, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !106
  %1 = bitcast i8* %call to i32*, !dbg !108
  store i32* %1, i32** %data, align 8, !dbg !109
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %cmp1 = icmp eq i32* %2, null, !dbg !112
  br i1 %cmp1, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %h, align 4, !dbg !119
  %inc = add nsw i32 %4, 1, !dbg !119
  store i32 %inc, i32* %h, align 4, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !127
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx3, align 4, !dbg !129
  %5 = load i32*, i32** %data, align 8, !dbg !130
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !131
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !133
  store i32 0, i32* %arrayidx6, align 4, !dbg !134
  %7 = load i32*, i32** %data, align 8, !dbg !135
  call void @printWLine(i32* %7), !dbg !136
  %8 = load i32*, i32** %data, align 8, !dbg !137
  %9 = bitcast i32* %8 to i8*, !dbg !137
  call void @free(i8* %9) #5, !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocation(line: 31, column: 27, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 16, scope: !33)
!35 = !DILocation(line: 31, column: 14, scope: !33)
!36 = !DILocation(line: 32, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 32, column: 13)
!38 = !DILocation(line: 32, column: 18, scope: !37)
!39 = !DILocation(line: 32, column: 13, scope: !33)
!40 = !DILocation(line: 32, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 32, column: 27)
!42 = !DILocation(line: 33, column: 9, scope: !33)
!43 = !DILocation(line: 33, column: 17, scope: !33)
!44 = !DILocation(line: 34, column: 5, scope: !33)
!45 = !DILocation(line: 28, column: 24, scope: !29)
!46 = !DILocation(line: 28, column: 5, scope: !29)
!47 = distinct !{!47, !31, !48, !49}
!48 = !DILocation(line: 34, column: 5, scope: !26)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "source", scope: !51, file: !17, line: 36, type: !52)
!51 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 36, column: 17, scope: !51)
!56 = !DILocation(line: 37, column: 17, scope: !51)
!57 = !DILocation(line: 37, column: 9, scope: !51)
!58 = !DILocation(line: 38, column: 9, scope: !51)
!59 = !DILocation(line: 38, column: 23, scope: !51)
!60 = !DILocation(line: 40, column: 17, scope: !51)
!61 = !DILocation(line: 40, column: 23, scope: !51)
!62 = !DILocation(line: 40, column: 9, scope: !51)
!63 = !DILocation(line: 41, column: 9, scope: !51)
!64 = !DILocation(line: 41, column: 21, scope: !51)
!65 = !DILocation(line: 42, column: 20, scope: !51)
!66 = !DILocation(line: 42, column: 9, scope: !51)
!67 = !DILocation(line: 43, column: 14, scope: !51)
!68 = !DILocation(line: 43, column: 9, scope: !51)
!69 = !DILocation(line: 45, column: 1, scope: !16)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_17_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 78, column: 5, scope: !70)
!72 = !DILocation(line: 79, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !74, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !17, line: 91, type: !7)
!80 = !DILocation(line: 91, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !17, line: 91, type: !76)
!82 = !DILocation(line: 91, column: 27, scope: !73)
!83 = !DILocation(line: 94, column: 22, scope: !73)
!84 = !DILocation(line: 94, column: 12, scope: !73)
!85 = !DILocation(line: 94, column: 5, scope: !73)
!86 = !DILocation(line: 96, column: 5, scope: !73)
!87 = !DILocation(line: 97, column: 5, scope: !73)
!88 = !DILocation(line: 98, column: 5, scope: !73)
!89 = !DILocation(line: 101, column: 5, scope: !73)
!90 = !DILocation(line: 102, column: 5, scope: !73)
!91 = !DILocation(line: 103, column: 5, scope: !73)
!92 = !DILocation(line: 105, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "h", scope: !93, file: !17, line: 54, type: !7)
!95 = !DILocation(line: 54, column: 9, scope: !93)
!96 = !DILocalVariable(name: "data", scope: !93, file: !17, line: 55, type: !4)
!97 = !DILocation(line: 55, column: 15, scope: !93)
!98 = !DILocation(line: 56, column: 10, scope: !93)
!99 = !DILocation(line: 57, column: 11, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !17, line: 57, column: 5)
!101 = !DILocation(line: 57, column: 9, scope: !100)
!102 = !DILocation(line: 57, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !17, line: 57, column: 5)
!104 = !DILocation(line: 57, column: 18, scope: !103)
!105 = !DILocation(line: 57, column: 5, scope: !100)
!106 = !DILocation(line: 60, column: 27, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !17, line: 58, column: 5)
!108 = !DILocation(line: 60, column: 16, scope: !107)
!109 = !DILocation(line: 60, column: 14, scope: !107)
!110 = !DILocation(line: 61, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !17, line: 61, column: 13)
!112 = !DILocation(line: 61, column: 18, scope: !111)
!113 = !DILocation(line: 61, column: 13, scope: !107)
!114 = !DILocation(line: 61, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 61, column: 27)
!116 = !DILocation(line: 62, column: 9, scope: !107)
!117 = !DILocation(line: 62, column: 17, scope: !107)
!118 = !DILocation(line: 63, column: 5, scope: !107)
!119 = !DILocation(line: 57, column: 24, scope: !103)
!120 = !DILocation(line: 57, column: 5, scope: !103)
!121 = distinct !{!121, !105, !122, !49}
!122 = !DILocation(line: 63, column: 5, scope: !100)
!123 = !DILocalVariable(name: "source", scope: !124, file: !17, line: 65, type: !52)
!124 = distinct !DILexicalBlock(scope: !93, file: !17, line: 64, column: 5)
!125 = !DILocation(line: 65, column: 17, scope: !124)
!126 = !DILocation(line: 66, column: 17, scope: !124)
!127 = !DILocation(line: 66, column: 9, scope: !124)
!128 = !DILocation(line: 67, column: 9, scope: !124)
!129 = !DILocation(line: 67, column: 23, scope: !124)
!130 = !DILocation(line: 69, column: 17, scope: !124)
!131 = !DILocation(line: 69, column: 23, scope: !124)
!132 = !DILocation(line: 69, column: 9, scope: !124)
!133 = !DILocation(line: 70, column: 9, scope: !124)
!134 = !DILocation(line: 70, column: 21, scope: !124)
!135 = !DILocation(line: 71, column: 20, scope: !124)
!136 = !DILocation(line: 71, column: 9, scope: !124)
!137 = !DILocation(line: 72, column: 14, scope: !124)
!138 = !DILocation(line: 72, column: 9, scope: !124)
!139 = !DILocation(line: 74, column: 1, scope: !93)