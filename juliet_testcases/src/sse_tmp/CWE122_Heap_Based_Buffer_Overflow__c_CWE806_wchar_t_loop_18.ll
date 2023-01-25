; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  br label %source, !dbg !31

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !51
  store i64 %call2, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !56
  %7 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp3 = icmp ult i64 %6, %7, !dbg !59
  br i1 %cmp3, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !61
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !61
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !65
  store i32 %10, i32* %arrayidx5, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %12, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !73
  store i32 0, i32* %arrayidx6, align 4, !dbg !74
  %13 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* %13), !dbg !76
  %14 = load i32*, i32** %data, align 8, !dbg !77
  %15 = bitcast i32* %14 to i8*, !dbg !77
  call void @free(i8* %15) #7, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !106
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %data, align 8, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  br label %source, !dbg !115

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !116), !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !118
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !119
  %3 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !128
  %5 = load i32*, i32** %data, align 8, !dbg !129
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !130
  store i64 %call2, i64* %dataLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !135
  %7 = load i64, i64* %dataLen, align 8, !dbg !137
  %cmp3 = icmp ult i64 %6, %7, !dbg !138
  br i1 %cmp3, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !140
  %9 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !140
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !140
  %11 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !144
  store i32 %10, i32* %arrayidx5, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %12, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !151
  store i32 0, i32* %arrayidx6, align 4, !dbg !152
  %13 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %13), !dbg !154
  %14 = load i32*, i32** %data, align 8, !dbg !155
  %15 = bitcast i32* %14 to i8*, !dbg !155
  call void @free(i8* %15) #7, !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 28, column: 5, scope: !16)
!32 = !DILabel(scope: !16, name: "source", file: !17, line: 29)
!33 = !DILocation(line: 29, column: 1, scope: !16)
!34 = !DILocation(line: 31, column: 13, scope: !16)
!35 = !DILocation(line: 31, column: 5, scope: !16)
!36 = !DILocation(line: 32, column: 5, scope: !16)
!37 = !DILocation(line: 32, column: 17, scope: !16)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !17, line: 34, type: !40)
!39 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 34, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !17, line: 35, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 35, column: 16, scope: !39)
!48 = !DILocalVariable(name: "dataLen", scope: !39, file: !17, line: 35, type: !45)
!49 = !DILocation(line: 35, column: 19, scope: !39)
!50 = !DILocation(line: 36, column: 26, scope: !39)
!51 = !DILocation(line: 36, column: 19, scope: !39)
!52 = !DILocation(line: 36, column: 17, scope: !39)
!53 = !DILocation(line: 38, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !17, line: 38, column: 9)
!55 = !DILocation(line: 38, column: 14, scope: !54)
!56 = !DILocation(line: 38, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !17, line: 38, column: 9)
!58 = !DILocation(line: 38, column: 25, scope: !57)
!59 = !DILocation(line: 38, column: 23, scope: !57)
!60 = !DILocation(line: 38, column: 9, scope: !54)
!61 = !DILocation(line: 40, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !17, line: 39, column: 9)
!63 = !DILocation(line: 40, column: 28, scope: !62)
!64 = !DILocation(line: 40, column: 18, scope: !62)
!65 = !DILocation(line: 40, column: 13, scope: !62)
!66 = !DILocation(line: 40, column: 21, scope: !62)
!67 = !DILocation(line: 41, column: 9, scope: !62)
!68 = !DILocation(line: 38, column: 35, scope: !57)
!69 = !DILocation(line: 38, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 41, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 42, column: 9, scope: !39)
!74 = !DILocation(line: 42, column: 20, scope: !39)
!75 = !DILocation(line: 43, column: 20, scope: !39)
!76 = !DILocation(line: 43, column: 9, scope: !39)
!77 = !DILocation(line: 44, column: 14, scope: !39)
!78 = !DILocation(line: 44, column: 9, scope: !39)
!79 = !DILocation(line: 46, column: 1, scope: !16)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_18_good", scope: !17, file: !17, line: 78, type: !18, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 80, column: 5, scope: !80)
!82 = !DILocation(line: 81, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 93, type: !84, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 93, type: !7)
!90 = !DILocation(line: 93, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 93, type: !86)
!92 = !DILocation(line: 93, column: 27, scope: !83)
!93 = !DILocation(line: 96, column: 22, scope: !83)
!94 = !DILocation(line: 96, column: 12, scope: !83)
!95 = !DILocation(line: 96, column: 5, scope: !83)
!96 = !DILocation(line: 98, column: 5, scope: !83)
!97 = !DILocation(line: 99, column: 5, scope: !83)
!98 = !DILocation(line: 100, column: 5, scope: !83)
!99 = !DILocation(line: 103, column: 5, scope: !83)
!100 = !DILocation(line: 104, column: 5, scope: !83)
!101 = !DILocation(line: 105, column: 5, scope: !83)
!102 = !DILocation(line: 107, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !17, line: 55, type: !4)
!105 = !DILocation(line: 55, column: 15, scope: !103)
!106 = !DILocation(line: 56, column: 23, scope: !103)
!107 = !DILocation(line: 56, column: 12, scope: !103)
!108 = !DILocation(line: 56, column: 10, scope: !103)
!109 = !DILocation(line: 57, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !17, line: 57, column: 9)
!111 = !DILocation(line: 57, column: 14, scope: !110)
!112 = !DILocation(line: 57, column: 9, scope: !103)
!113 = !DILocation(line: 57, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 57, column: 23)
!115 = !DILocation(line: 58, column: 5, scope: !103)
!116 = !DILabel(scope: !103, name: "source", file: !17, line: 59)
!117 = !DILocation(line: 59, column: 1, scope: !103)
!118 = !DILocation(line: 61, column: 13, scope: !103)
!119 = !DILocation(line: 61, column: 5, scope: !103)
!120 = !DILocation(line: 62, column: 5, scope: !103)
!121 = !DILocation(line: 62, column: 16, scope: !103)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !17, line: 64, type: !40)
!123 = distinct !DILexicalBlock(scope: !103, file: !17, line: 63, column: 5)
!124 = !DILocation(line: 64, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !17, line: 65, type: !45)
!126 = !DILocation(line: 65, column: 16, scope: !123)
!127 = !DILocalVariable(name: "dataLen", scope: !123, file: !17, line: 65, type: !45)
!128 = !DILocation(line: 65, column: 19, scope: !123)
!129 = !DILocation(line: 66, column: 26, scope: !123)
!130 = !DILocation(line: 66, column: 19, scope: !123)
!131 = !DILocation(line: 66, column: 17, scope: !123)
!132 = !DILocation(line: 68, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !17, line: 68, column: 9)
!134 = !DILocation(line: 68, column: 14, scope: !133)
!135 = !DILocation(line: 68, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !17, line: 68, column: 9)
!137 = !DILocation(line: 68, column: 25, scope: !136)
!138 = !DILocation(line: 68, column: 23, scope: !136)
!139 = !DILocation(line: 68, column: 9, scope: !133)
!140 = !DILocation(line: 70, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !17, line: 69, column: 9)
!142 = !DILocation(line: 70, column: 28, scope: !141)
!143 = !DILocation(line: 70, column: 18, scope: !141)
!144 = !DILocation(line: 70, column: 13, scope: !141)
!145 = !DILocation(line: 70, column: 21, scope: !141)
!146 = !DILocation(line: 71, column: 9, scope: !141)
!147 = !DILocation(line: 68, column: 35, scope: !136)
!148 = !DILocation(line: 68, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !72}
!150 = !DILocation(line: 71, column: 9, scope: !133)
!151 = !DILocation(line: 72, column: 9, scope: !123)
!152 = !DILocation(line: 72, column: 20, scope: !123)
!153 = !DILocation(line: 73, column: 20, scope: !123)
!154 = !DILocation(line: 73, column: 9, scope: !123)
!155 = !DILocation(line: 74, column: 14, scope: !123)
!156 = !DILocation(line: 74, column: 9, scope: !123)
!157 = !DILocation(line: 76, column: 1, scope: !103)
