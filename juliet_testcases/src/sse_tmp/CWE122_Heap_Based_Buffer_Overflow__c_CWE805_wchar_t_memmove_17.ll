; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17_bad() #0 !dbg !16 {
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
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !32
  %1 = bitcast i8* %call to i32*, !dbg !34
  store i32* %1, i32** %data, align 8, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !40
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
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  %5 = load i32*, i32** %data, align 8, !dbg !60
  %6 = bitcast i32* %5 to i8*, !dbg !61
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !61
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !61
  %8 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !62
  store i32 0, i32* %arrayidx5, align 4, !dbg !63
  %9 = load i32*, i32** %data, align 8, !dbg !64
  call void @printWLine(i32* %9), !dbg !65
  %10 = load i32*, i32** %data, align 8, !dbg !66
  %11 = bitcast i32* %10 to i8*, !dbg !66
  call void @free(i8* %11) #6, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17_good() #0 !dbg !69 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17_bad(), !dbg !89
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
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  store i32 0, i32* %h, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !101
  %cmp = icmp slt i32 %0, 1, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !105
  %1 = bitcast i8* %call to i32*, !dbg !107
  store i32* %1, i32** %data, align 8, !dbg !108
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %cmp1 = icmp eq i32* %2, null, !dbg !111
  br i1 %cmp1, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %h, align 4, !dbg !118
  %inc = add nsw i32 %4, 1, !dbg !118
  store i32 %inc, i32* %h, align 4, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !126
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx3, align 4, !dbg !128
  %5 = load i32*, i32** %data, align 8, !dbg !129
  %6 = bitcast i32* %5 to i8*, !dbg !130
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !130
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !130
  %8 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !131
  store i32 0, i32* %arrayidx5, align 4, !dbg !132
  %9 = load i32*, i32** %data, align 8, !dbg !133
  call void @printWLine(i32* %9), !dbg !134
  %10 = load i32*, i32** %data, align 8, !dbg !135
  %11 = bitcast i32* %10 to i8*, !dbg !135
  call void @free(i8* %11) #6, !dbg !136
  ret void, !dbg !137
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!61 = !DILocation(line: 40, column: 9, scope: !51)
!62 = !DILocation(line: 41, column: 9, scope: !51)
!63 = !DILocation(line: 41, column: 21, scope: !51)
!64 = !DILocation(line: 42, column: 20, scope: !51)
!65 = !DILocation(line: 42, column: 9, scope: !51)
!66 = !DILocation(line: 43, column: 14, scope: !51)
!67 = !DILocation(line: 43, column: 9, scope: !51)
!68 = !DILocation(line: 45, column: 1, scope: !16)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_17_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 78, column: 5, scope: !69)
!71 = !DILocation(line: 79, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !73, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!7, !7, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !17, line: 91, type: !7)
!79 = !DILocation(line: 91, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !17, line: 91, type: !75)
!81 = !DILocation(line: 91, column: 27, scope: !72)
!82 = !DILocation(line: 94, column: 22, scope: !72)
!83 = !DILocation(line: 94, column: 12, scope: !72)
!84 = !DILocation(line: 94, column: 5, scope: !72)
!85 = !DILocation(line: 96, column: 5, scope: !72)
!86 = !DILocation(line: 97, column: 5, scope: !72)
!87 = !DILocation(line: 98, column: 5, scope: !72)
!88 = !DILocation(line: 101, column: 5, scope: !72)
!89 = !DILocation(line: 102, column: 5, scope: !72)
!90 = !DILocation(line: 103, column: 5, scope: !72)
!91 = !DILocation(line: 105, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "h", scope: !92, file: !17, line: 54, type: !7)
!94 = !DILocation(line: 54, column: 9, scope: !92)
!95 = !DILocalVariable(name: "data", scope: !92, file: !17, line: 55, type: !4)
!96 = !DILocation(line: 55, column: 15, scope: !92)
!97 = !DILocation(line: 56, column: 10, scope: !92)
!98 = !DILocation(line: 57, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !17, line: 57, column: 5)
!100 = !DILocation(line: 57, column: 9, scope: !99)
!101 = !DILocation(line: 57, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !17, line: 57, column: 5)
!103 = !DILocation(line: 57, column: 18, scope: !102)
!104 = !DILocation(line: 57, column: 5, scope: !99)
!105 = !DILocation(line: 60, column: 27, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !17, line: 58, column: 5)
!107 = !DILocation(line: 60, column: 16, scope: !106)
!108 = !DILocation(line: 60, column: 14, scope: !106)
!109 = !DILocation(line: 61, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 61, column: 13)
!111 = !DILocation(line: 61, column: 18, scope: !110)
!112 = !DILocation(line: 61, column: 13, scope: !106)
!113 = !DILocation(line: 61, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 61, column: 27)
!115 = !DILocation(line: 62, column: 9, scope: !106)
!116 = !DILocation(line: 62, column: 17, scope: !106)
!117 = !DILocation(line: 63, column: 5, scope: !106)
!118 = !DILocation(line: 57, column: 24, scope: !102)
!119 = !DILocation(line: 57, column: 5, scope: !102)
!120 = distinct !{!120, !104, !121, !49}
!121 = !DILocation(line: 63, column: 5, scope: !99)
!122 = !DILocalVariable(name: "source", scope: !123, file: !17, line: 65, type: !52)
!123 = distinct !DILexicalBlock(scope: !92, file: !17, line: 64, column: 5)
!124 = !DILocation(line: 65, column: 17, scope: !123)
!125 = !DILocation(line: 66, column: 17, scope: !123)
!126 = !DILocation(line: 66, column: 9, scope: !123)
!127 = !DILocation(line: 67, column: 9, scope: !123)
!128 = !DILocation(line: 67, column: 23, scope: !123)
!129 = !DILocation(line: 69, column: 17, scope: !123)
!130 = !DILocation(line: 69, column: 9, scope: !123)
!131 = !DILocation(line: 70, column: 9, scope: !123)
!132 = !DILocation(line: 70, column: 21, scope: !123)
!133 = !DILocation(line: 71, column: 20, scope: !123)
!134 = !DILocation(line: 71, column: 9, scope: !123)
!135 = !DILocation(line: 72, column: 14, scope: !123)
!136 = !DILocation(line: 72, column: 9, scope: !123)
!137 = !DILocation(line: 74, column: 1, scope: !92)
