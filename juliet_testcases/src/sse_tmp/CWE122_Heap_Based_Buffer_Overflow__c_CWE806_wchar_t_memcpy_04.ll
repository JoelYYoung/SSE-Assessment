; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #8, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %5 = bitcast i32* %arraydecay to i8*, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %7 = bitcast i32* %6 to i8*, !dbg !43
  %8 = load i32*, i32** %data, align 8, !dbg !45
  %call2 = call i64 @wcslen(i32* %8) #10, !dbg !46
  %mul = mul i64 %call2, 4, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !43
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !48
  store i32 0, i32* %arrayidx3, align 4, !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %9), !dbg !51
  %10 = load i32*, i32** %data, align 8, !dbg !52
  %11 = bitcast i32* %10 to i8*, !dbg !52
  call void @free(i8* %11) #8, !dbg !53
  ret void, !dbg !54
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #8, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #8, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !82
  %0 = bitcast i8* %call to i32*, !dbg !83
  store i32* %0, i32** %data, align 8, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !91
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !100
  %5 = bitcast i32* %arraydecay to i8*, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %7 = bitcast i32* %6 to i8*, !dbg !100
  %8 = load i32*, i32** %data, align 8, !dbg !102
  %call2 = call i64 @wcslen(i32* %8) #10, !dbg !103
  %mul = mul i64 %call2, 4, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !100
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !105
  store i32 0, i32* %arrayidx3, align 4, !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %9), !dbg !108
  %10 = load i32*, i32** %data, align 8, !dbg !109
  %11 = bitcast i32* %10 to i8*, !dbg !109
  call void @free(i8* %11) #8, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !115
  %0 = bitcast i8* %call to i32*, !dbg !116
  store i32* %0, i32** %data, align 8, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !127
  %3 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !132
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !133
  %5 = bitcast i32* %arraydecay to i8*, !dbg !133
  %6 = load i32*, i32** %data, align 8, !dbg !134
  %7 = bitcast i32* %6 to i8*, !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !135
  %call2 = call i64 @wcslen(i32* %8) #10, !dbg !136
  %mul = mul i64 %call2, 4, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !133
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !138
  store i32 0, i32* %arrayidx3, align 4, !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %9), !dbg !141
  %10 = load i32*, i32** %data, align 8, !dbg !142
  %11 = bitcast i32* %10 to i8*, !dbg !142
  call void @free(i8* %11) #8, !dbg !143
  ret void, !dbg !144
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04_bad", scope: !17, file: !17, line: 30, type: !18, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 32, type: !4)
!21 = !DILocation(line: 32, column: 15, scope: !16)
!22 = !DILocation(line: 33, column: 23, scope: !16)
!23 = !DILocation(line: 33, column: 12, scope: !16)
!24 = !DILocation(line: 33, column: 10, scope: !16)
!25 = !DILocation(line: 34, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 9)
!27 = !DILocation(line: 34, column: 14, scope: !26)
!28 = !DILocation(line: 34, column: 9, scope: !16)
!29 = !DILocation(line: 34, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 34, column: 23)
!31 = !DILocation(line: 38, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !17, line: 36, column: 5)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 8)
!34 = !DILocation(line: 38, column: 9, scope: !32)
!35 = !DILocation(line: 39, column: 9, scope: !32)
!36 = !DILocation(line: 39, column: 21, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !17, line: 42, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 42, column: 17, scope: !38)
!43 = !DILocation(line: 44, column: 9, scope: !38)
!44 = !DILocation(line: 44, column: 22, scope: !38)
!45 = !DILocation(line: 44, column: 35, scope: !38)
!46 = !DILocation(line: 44, column: 28, scope: !38)
!47 = !DILocation(line: 44, column: 40, scope: !38)
!48 = !DILocation(line: 45, column: 9, scope: !38)
!49 = !DILocation(line: 45, column: 20, scope: !38)
!50 = !DILocation(line: 46, column: 20, scope: !38)
!51 = !DILocation(line: 46, column: 9, scope: !38)
!52 = !DILocation(line: 47, column: 14, scope: !38)
!53 = !DILocation(line: 47, column: 9, scope: !38)
!54 = !DILocation(line: 49, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_04_good", scope: !17, file: !17, line: 104, type: !18, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 106, column: 5, scope: !55)
!57 = !DILocation(line: 107, column: 5, scope: !55)
!58 = !DILocation(line: 108, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 120, type: !60, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !17, line: 120, type: !7)
!66 = !DILocation(line: 120, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !17, line: 120, type: !62)
!68 = !DILocation(line: 120, column: 27, scope: !59)
!69 = !DILocation(line: 123, column: 22, scope: !59)
!70 = !DILocation(line: 123, column: 12, scope: !59)
!71 = !DILocation(line: 123, column: 5, scope: !59)
!72 = !DILocation(line: 125, column: 5, scope: !59)
!73 = !DILocation(line: 126, column: 5, scope: !59)
!74 = !DILocation(line: 127, column: 5, scope: !59)
!75 = !DILocation(line: 130, column: 5, scope: !59)
!76 = !DILocation(line: 131, column: 5, scope: !59)
!77 = !DILocation(line: 132, column: 5, scope: !59)
!78 = !DILocation(line: 134, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 58, type: !4)
!81 = !DILocation(line: 58, column: 15, scope: !79)
!82 = !DILocation(line: 59, column: 23, scope: !79)
!83 = !DILocation(line: 59, column: 12, scope: !79)
!84 = !DILocation(line: 59, column: 10, scope: !79)
!85 = !DILocation(line: 60, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !17, line: 60, column: 9)
!87 = !DILocation(line: 60, column: 14, scope: !86)
!88 = !DILocation(line: 60, column: 9, scope: !79)
!89 = !DILocation(line: 60, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !17, line: 60, column: 23)
!91 = !DILocation(line: 69, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !17, line: 67, column: 5)
!93 = distinct !DILexicalBlock(scope: !79, file: !17, line: 61, column: 8)
!94 = !DILocation(line: 69, column: 9, scope: !92)
!95 = !DILocation(line: 70, column: 9, scope: !92)
!96 = !DILocation(line: 70, column: 20, scope: !92)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !17, line: 73, type: !39)
!98 = distinct !DILexicalBlock(scope: !79, file: !17, line: 72, column: 5)
!99 = !DILocation(line: 73, column: 17, scope: !98)
!100 = !DILocation(line: 75, column: 9, scope: !98)
!101 = !DILocation(line: 75, column: 22, scope: !98)
!102 = !DILocation(line: 75, column: 35, scope: !98)
!103 = !DILocation(line: 75, column: 28, scope: !98)
!104 = !DILocation(line: 75, column: 40, scope: !98)
!105 = !DILocation(line: 76, column: 9, scope: !98)
!106 = !DILocation(line: 76, column: 20, scope: !98)
!107 = !DILocation(line: 77, column: 20, scope: !98)
!108 = !DILocation(line: 77, column: 9, scope: !98)
!109 = !DILocation(line: 78, column: 14, scope: !98)
!110 = !DILocation(line: 78, column: 9, scope: !98)
!111 = !DILocation(line: 80, column: 1, scope: !79)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 83, type: !18, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 85, type: !4)
!114 = !DILocation(line: 85, column: 15, scope: !112)
!115 = !DILocation(line: 86, column: 23, scope: !112)
!116 = !DILocation(line: 86, column: 12, scope: !112)
!117 = !DILocation(line: 86, column: 10, scope: !112)
!118 = !DILocation(line: 87, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !17, line: 87, column: 9)
!120 = !DILocation(line: 87, column: 14, scope: !119)
!121 = !DILocation(line: 87, column: 9, scope: !112)
!122 = !DILocation(line: 87, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 87, column: 23)
!124 = !DILocation(line: 91, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !126, file: !17, line: 89, column: 5)
!126 = distinct !DILexicalBlock(scope: !112, file: !17, line: 88, column: 8)
!127 = !DILocation(line: 91, column: 9, scope: !125)
!128 = !DILocation(line: 92, column: 9, scope: !125)
!129 = !DILocation(line: 92, column: 20, scope: !125)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !17, line: 95, type: !39)
!131 = distinct !DILexicalBlock(scope: !112, file: !17, line: 94, column: 5)
!132 = !DILocation(line: 95, column: 17, scope: !131)
!133 = !DILocation(line: 97, column: 9, scope: !131)
!134 = !DILocation(line: 97, column: 22, scope: !131)
!135 = !DILocation(line: 97, column: 35, scope: !131)
!136 = !DILocation(line: 97, column: 28, scope: !131)
!137 = !DILocation(line: 97, column: 40, scope: !131)
!138 = !DILocation(line: 98, column: 9, scope: !131)
!139 = !DILocation(line: 98, column: 20, scope: !131)
!140 = !DILocation(line: 99, column: 20, scope: !131)
!141 = !DILocation(line: 99, column: 9, scope: !131)
!142 = !DILocation(line: 100, column: 14, scope: !131)
!143 = !DILocation(line: 100, column: 9, scope: !131)
!144 = !DILocation(line: 102, column: 1, scope: !112)
