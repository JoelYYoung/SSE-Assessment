; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !27
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !28
  %1 = bitcast i32* %arraydecay to i8*, !dbg !28
  %2 = load i32*, i32** %data.addr, align 8, !dbg !29
  %3 = bitcast i32* %2 to i8*, !dbg !28
  %4 = load i32*, i32** %data.addr, align 8, !dbg !30
  %call = call i64 @wcslen(i32* %4) #8, !dbg !31
  %mul = mul i64 %call, 4, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !28
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %5 = load i32*, i32** %data.addr, align 8, !dbg !35
  call void @printWLine(i32* %5), !dbg !36
  %6 = load i32*, i32** %data.addr, align 8, !dbg !37
  %7 = bitcast i32* %6 to i8*, !dbg !37
  call void @free(i8* %7) #9, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_bad() #0 !dbg !40 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call noalias align 16 i8* @malloc(i64 400) #9, !dbg !45
  %0 = bitcast i8* %call to i32*, !dbg !46
  store i32* %0, i32** %data, align 8, !dbg !47
  %1 = load i32*, i32** %data, align 8, !dbg !48
  %cmp = icmp eq i32* %1, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !54
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #9, !dbg !55
  %3 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !56
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %4 = load i32*, i32** %data, align 8, !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_badSink(i32* %4), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #6

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_goodG2BSink(i32* %data) #0 !dbg !61 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !64, metadata !DIExpression()), !dbg !66
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !66
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !67
  %1 = bitcast i32* %arraydecay to i8*, !dbg !67
  %2 = load i32*, i32** %data.addr, align 8, !dbg !68
  %3 = bitcast i32* %2 to i8*, !dbg !67
  %4 = load i32*, i32** %data.addr, align 8, !dbg !69
  %call = call i64 @wcslen(i32* %4) #8, !dbg !70
  %mul = mul i64 %call, 4, !dbg !71
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !67
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  %5 = load i32*, i32** %data.addr, align 8, !dbg !74
  call void @printWLine(i32* %5), !dbg !75
  %6 = load i32*, i32** %data.addr, align 8, !dbg !76
  %7 = bitcast i32* %6 to i8*, !dbg !76
  call void @free(i8* %7) #9, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #9, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #9, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 400) #9, !dbg !105
  %0 = bitcast i8* %call to i32*, !dbg !106
  store i32* %0, i32** %data, align 8, !dbg !107
  %1 = load i32*, i32** %data, align 8, !dbg !108
  %cmp = icmp eq i32* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !114
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #9, !dbg !115
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %4 = load i32*, i32** %data, align 8, !dbg !118
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_goodG2BSink(i32* %4), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 87, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocation(line: 28, column: 9, scope: !23)
!29 = !DILocation(line: 28, column: 23, scope: !23)
!30 = !DILocation(line: 28, column: 36, scope: !23)
!31 = !DILocation(line: 28, column: 29, scope: !23)
!32 = !DILocation(line: 28, column: 41, scope: !23)
!33 = !DILocation(line: 29, column: 9, scope: !23)
!34 = !DILocation(line: 29, column: 20, scope: !23)
!35 = !DILocation(line: 30, column: 20, scope: !23)
!36 = !DILocation(line: 30, column: 9, scope: !23)
!37 = !DILocation(line: 31, column: 14, scope: !23)
!38 = !DILocation(line: 31, column: 9, scope: !23)
!39 = !DILocation(line: 33, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_bad", scope: !17, file: !17, line: 35, type: !41, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !17, line: 37, type: !4)
!44 = !DILocation(line: 37, column: 15, scope: !40)
!45 = !DILocation(line: 38, column: 23, scope: !40)
!46 = !DILocation(line: 38, column: 12, scope: !40)
!47 = !DILocation(line: 38, column: 10, scope: !40)
!48 = !DILocation(line: 39, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !17, line: 39, column: 9)
!50 = !DILocation(line: 39, column: 14, scope: !49)
!51 = !DILocation(line: 39, column: 9, scope: !40)
!52 = !DILocation(line: 39, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !17, line: 39, column: 23)
!54 = !DILocation(line: 41, column: 13, scope: !40)
!55 = !DILocation(line: 41, column: 5, scope: !40)
!56 = !DILocation(line: 42, column: 5, scope: !40)
!57 = !DILocation(line: 42, column: 17, scope: !40)
!58 = !DILocation(line: 43, column: 76, scope: !40)
!59 = !DILocation(line: 43, column: 5, scope: !40)
!60 = !DILocation(line: 44, column: 1, scope: !40)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_goodG2BSink", scope: !17, file: !17, line: 50, type: !18, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", arg: 1, scope: !61, file: !17, line: 50, type: !4)
!63 = !DILocation(line: 50, column: 91, scope: !61)
!64 = !DILocalVariable(name: "dest", scope: !65, file: !17, line: 53, type: !24)
!65 = distinct !DILexicalBlock(scope: !61, file: !17, line: 52, column: 5)
!66 = !DILocation(line: 53, column: 17, scope: !65)
!67 = !DILocation(line: 55, column: 9, scope: !65)
!68 = !DILocation(line: 55, column: 23, scope: !65)
!69 = !DILocation(line: 55, column: 36, scope: !65)
!70 = !DILocation(line: 55, column: 29, scope: !65)
!71 = !DILocation(line: 55, column: 41, scope: !65)
!72 = !DILocation(line: 56, column: 9, scope: !65)
!73 = !DILocation(line: 56, column: 20, scope: !65)
!74 = !DILocation(line: 57, column: 20, scope: !65)
!75 = !DILocation(line: 57, column: 9, scope: !65)
!76 = !DILocation(line: 58, column: 14, scope: !65)
!77 = !DILocation(line: 58, column: 9, scope: !65)
!78 = !DILocation(line: 60, column: 1, scope: !61)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_41_good", scope: !17, file: !17, line: 74, type: !41, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 76, column: 5, scope: !79)
!81 = !DILocation(line: 77, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 89, type: !83, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!7, !7, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !17, line: 89, type: !7)
!89 = !DILocation(line: 89, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !17, line: 89, type: !85)
!91 = !DILocation(line: 89, column: 27, scope: !82)
!92 = !DILocation(line: 92, column: 22, scope: !82)
!93 = !DILocation(line: 92, column: 12, scope: !82)
!94 = !DILocation(line: 92, column: 5, scope: !82)
!95 = !DILocation(line: 94, column: 5, scope: !82)
!96 = !DILocation(line: 95, column: 5, scope: !82)
!97 = !DILocation(line: 96, column: 5, scope: !82)
!98 = !DILocation(line: 99, column: 5, scope: !82)
!99 = !DILocation(line: 100, column: 5, scope: !82)
!100 = !DILocation(line: 101, column: 5, scope: !82)
!101 = !DILocation(line: 103, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 63, type: !41, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !17, line: 65, type: !4)
!104 = !DILocation(line: 65, column: 15, scope: !102)
!105 = !DILocation(line: 66, column: 23, scope: !102)
!106 = !DILocation(line: 66, column: 12, scope: !102)
!107 = !DILocation(line: 66, column: 10, scope: !102)
!108 = !DILocation(line: 67, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !17, line: 67, column: 9)
!110 = !DILocation(line: 67, column: 14, scope: !109)
!111 = !DILocation(line: 67, column: 9, scope: !102)
!112 = !DILocation(line: 67, column: 24, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !17, line: 67, column: 23)
!114 = !DILocation(line: 69, column: 13, scope: !102)
!115 = !DILocation(line: 69, column: 5, scope: !102)
!116 = !DILocation(line: 70, column: 5, scope: !102)
!117 = !DILocation(line: 70, column: 16, scope: !102)
!118 = !DILocation(line: 71, column: 80, scope: !102)
!119 = !DILocation(line: 71, column: 5, scope: !102)
!120 = !DILocation(line: 72, column: 1, scope: !102)
