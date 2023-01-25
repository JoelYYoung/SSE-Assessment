; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !24
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !26
  %1 = load i32*, i32** %data, align 8, !dbg !27
  %cmp = icmp eq i32* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !31
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
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #8, !dbg !42
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
  %7 = bitcast i32* %arraydecay to i8*, !dbg !57
  %8 = load i32*, i32** %data, align 8, !dbg !58
  %9 = bitcast i32* %8 to i8*, !dbg !57
  %10 = load i32*, i32** %data, align 8, !dbg !59
  %call3 = call i64 @wcslen(i32* %10) #10, !dbg !60
  %mul = mul i64 %call3, 4, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 %mul, i1 false), !dbg !57
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !62
  store i32 0, i32* %arrayidx4, align 4, !dbg !63
  %11 = load i32*, i32** %data, align 8, !dbg !64
  call void @printWLine(i32* %11), !dbg !65
  %12 = load i32*, i32** %data, align 8, !dbg !66
  %13 = bitcast i32* %12 to i8*, !dbg !66
  call void @free(i8* %13) #8, !dbg !67
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17_good() #0 !dbg !69 {
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
  %call = call i64 @time(i64* null) #8, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #8, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !97
  %0 = bitcast i8* %call to i32*, !dbg !98
  store i32* %0, i32** %data, align 8, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %cmp = icmp eq i32* %1, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  store i32 0, i32* %h, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %h, align 4, !dbg !109
  %cmp1 = icmp slt i32 %2, 1, !dbg !111
  br i1 %cmp1, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !113
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #8, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !119
  %inc = add nsw i32 %5, 1, !dbg !119
  store i32 %inc, i32* %h, align 4, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !125
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !126
  %7 = bitcast i32* %arraydecay to i8*, !dbg !126
  %8 = load i32*, i32** %data, align 8, !dbg !127
  %9 = bitcast i32* %8 to i8*, !dbg !126
  %10 = load i32*, i32** %data, align 8, !dbg !128
  %call3 = call i64 @wcslen(i32* %10) #10, !dbg !129
  %mul = mul i64 %call3, 4, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 %mul, i1 false), !dbg !126
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !131
  store i32 0, i32* %arrayidx4, align 4, !dbg !132
  %11 = load i32*, i32** %data, align 8, !dbg !133
  call void @printWLine(i32* %11), !dbg !134
  %12 = load i32*, i32** %data, align 8, !dbg !135
  %13 = bitcast i32* %12 to i8*, !dbg !135
  call void @free(i8* %13) #8, !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!57 = !DILocation(line: 38, column: 9, scope: !52)
!58 = !DILocation(line: 38, column: 22, scope: !52)
!59 = !DILocation(line: 38, column: 35, scope: !52)
!60 = !DILocation(line: 38, column: 28, scope: !52)
!61 = !DILocation(line: 38, column: 40, scope: !52)
!62 = !DILocation(line: 39, column: 9, scope: !52)
!63 = !DILocation(line: 39, column: 20, scope: !52)
!64 = !DILocation(line: 40, column: 20, scope: !52)
!65 = !DILocation(line: 40, column: 9, scope: !52)
!66 = !DILocation(line: 41, column: 14, scope: !52)
!67 = !DILocation(line: 41, column: 9, scope: !52)
!68 = !DILocation(line: 43, column: 1, scope: !16)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_17_good", scope: !17, file: !17, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 74, column: 5, scope: !69)
!71 = !DILocation(line: 75, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 87, type: !73, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!7, !7, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !17, line: 87, type: !7)
!79 = !DILocation(line: 87, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !17, line: 87, type: !75)
!81 = !DILocation(line: 87, column: 27, scope: !72)
!82 = !DILocation(line: 90, column: 22, scope: !72)
!83 = !DILocation(line: 90, column: 12, scope: !72)
!84 = !DILocation(line: 90, column: 5, scope: !72)
!85 = !DILocation(line: 92, column: 5, scope: !72)
!86 = !DILocation(line: 93, column: 5, scope: !72)
!87 = !DILocation(line: 94, column: 5, scope: !72)
!88 = !DILocation(line: 97, column: 5, scope: !72)
!89 = !DILocation(line: 98, column: 5, scope: !72)
!90 = !DILocation(line: 99, column: 5, scope: !72)
!91 = !DILocation(line: 101, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 50, type: !18, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "h", scope: !92, file: !17, line: 52, type: !7)
!94 = !DILocation(line: 52, column: 9, scope: !92)
!95 = !DILocalVariable(name: "data", scope: !92, file: !17, line: 53, type: !4)
!96 = !DILocation(line: 53, column: 15, scope: !92)
!97 = !DILocation(line: 54, column: 23, scope: !92)
!98 = !DILocation(line: 54, column: 12, scope: !92)
!99 = !DILocation(line: 54, column: 10, scope: !92)
!100 = !DILocation(line: 55, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !92, file: !17, line: 55, column: 9)
!102 = !DILocation(line: 55, column: 14, scope: !101)
!103 = !DILocation(line: 55, column: 9, scope: !92)
!104 = !DILocation(line: 55, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !17, line: 55, column: 23)
!106 = !DILocation(line: 56, column: 11, scope: !107)
!107 = distinct !DILexicalBlock(scope: !92, file: !17, line: 56, column: 5)
!108 = !DILocation(line: 56, column: 9, scope: !107)
!109 = !DILocation(line: 56, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !17, line: 56, column: 5)
!111 = !DILocation(line: 56, column: 18, scope: !110)
!112 = !DILocation(line: 56, column: 5, scope: !107)
!113 = !DILocation(line: 59, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 57, column: 5)
!115 = !DILocation(line: 59, column: 9, scope: !114)
!116 = !DILocation(line: 60, column: 9, scope: !114)
!117 = !DILocation(line: 60, column: 20, scope: !114)
!118 = !DILocation(line: 61, column: 5, scope: !114)
!119 = !DILocation(line: 56, column: 24, scope: !110)
!120 = !DILocation(line: 56, column: 5, scope: !110)
!121 = distinct !{!121, !112, !122, !50}
!122 = !DILocation(line: 61, column: 5, scope: !107)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !17, line: 63, type: !53)
!124 = distinct !DILexicalBlock(scope: !92, file: !17, line: 62, column: 5)
!125 = !DILocation(line: 63, column: 17, scope: !124)
!126 = !DILocation(line: 65, column: 9, scope: !124)
!127 = !DILocation(line: 65, column: 22, scope: !124)
!128 = !DILocation(line: 65, column: 35, scope: !124)
!129 = !DILocation(line: 65, column: 28, scope: !124)
!130 = !DILocation(line: 65, column: 40, scope: !124)
!131 = !DILocation(line: 66, column: 9, scope: !124)
!132 = !DILocation(line: 66, column: 20, scope: !124)
!133 = !DILocation(line: 67, column: 20, scope: !124)
!134 = !DILocation(line: 67, column: 9, scope: !124)
!135 = !DILocation(line: 68, column: 14, scope: !124)
!136 = !DILocation(line: 68, column: 9, scope: !124)
!137 = !DILocation(line: 70, column: 1, scope: !92)
