; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42_bad() #0 !dbg !16 {
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
  %call1 = call i32* @badSource(i32* %2), !dbg !32
  store i32* %call1, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %4 = bitcast i32* %arraydecay to i8*, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %6 = bitcast i32* %5 to i8*, !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i64 @wcslen(i32* %7) #10, !dbg !43
  %mul = mul i64 %call2, 4, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !40
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %8 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %8), !dbg !48
  %9 = load i32*, i32** %data, align 8, !dbg !49
  %10 = bitcast i32* %9 to i8*, !dbg !49
  call void @free(i8* %10) #8, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32*, i32** %data.addr, align 8, !dbg !57
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #8, !dbg !58
  %1 = load i32*, i32** %data.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  %2 = load i32*, i32** %data.addr, align 8, !dbg !61
  ret i32* %2, !dbg !62
}

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #8, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #8, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %call1 = call i32* @goodG2BSource(i32* %2), !dbg !99
  store i32* %call1, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !104
  %4 = bitcast i32* %arraydecay to i8*, !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  %6 = bitcast i32* %5 to i8*, !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !106
  %call2 = call i64 @wcslen(i32* %7) #10, !dbg !107
  %mul = mul i64 %call2, 4, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !104
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %8 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %8), !dbg !112
  %9 = load i32*, i32** %data, align 8, !dbg !113
  %10 = bitcast i32* %9 to i8*, !dbg !113
  call void @free(i8* %10) #8, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !116 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32*, i32** %data.addr, align 8, !dbg !119
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #8, !dbg !120
  %1 = load i32*, i32** %data.addr, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %2 = load i32*, i32** %data.addr, align 8, !dbg !123
  ret i32* %2, !dbg !124
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42_bad", scope: !17, file: !17, line: 31, type: !18, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 33, type: !4)
!21 = !DILocation(line: 33, column: 15, scope: !16)
!22 = !DILocation(line: 34, column: 23, scope: !16)
!23 = !DILocation(line: 34, column: 12, scope: !16)
!24 = !DILocation(line: 34, column: 10, scope: !16)
!25 = !DILocation(line: 35, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 9)
!27 = !DILocation(line: 35, column: 14, scope: !26)
!28 = !DILocation(line: 35, column: 9, scope: !16)
!29 = !DILocation(line: 35, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 35, column: 23)
!31 = !DILocation(line: 36, column: 22, scope: !16)
!32 = !DILocation(line: 36, column: 12, scope: !16)
!33 = !DILocation(line: 36, column: 10, scope: !16)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !17, line: 38, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 38, column: 17, scope: !35)
!40 = !DILocation(line: 40, column: 9, scope: !35)
!41 = !DILocation(line: 40, column: 22, scope: !35)
!42 = !DILocation(line: 40, column: 35, scope: !35)
!43 = !DILocation(line: 40, column: 28, scope: !35)
!44 = !DILocation(line: 40, column: 40, scope: !35)
!45 = !DILocation(line: 41, column: 9, scope: !35)
!46 = !DILocation(line: 41, column: 20, scope: !35)
!47 = !DILocation(line: 42, column: 20, scope: !35)
!48 = !DILocation(line: 42, column: 9, scope: !35)
!49 = !DILocation(line: 43, column: 14, scope: !35)
!50 = !DILocation(line: 43, column: 9, scope: !35)
!51 = !DILocation(line: 45, column: 1, scope: !16)
!52 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !53, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!4, !4}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !17, line: 23, type: !4)
!56 = !DILocation(line: 23, column: 38, scope: !52)
!57 = !DILocation(line: 26, column: 13, scope: !52)
!58 = !DILocation(line: 26, column: 5, scope: !52)
!59 = !DILocation(line: 27, column: 5, scope: !52)
!60 = !DILocation(line: 27, column: 17, scope: !52)
!61 = !DILocation(line: 28, column: 12, scope: !52)
!62 = !DILocation(line: 28, column: 5, scope: !52)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_42_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 78, column: 5, scope: !63)
!65 = !DILocation(line: 79, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !67, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 91, type: !7)
!73 = !DILocation(line: 91, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 91, type: !69)
!75 = !DILocation(line: 91, column: 27, scope: !66)
!76 = !DILocation(line: 94, column: 22, scope: !66)
!77 = !DILocation(line: 94, column: 12, scope: !66)
!78 = !DILocation(line: 94, column: 5, scope: !66)
!79 = !DILocation(line: 96, column: 5, scope: !66)
!80 = !DILocation(line: 97, column: 5, scope: !66)
!81 = !DILocation(line: 98, column: 5, scope: !66)
!82 = !DILocation(line: 101, column: 5, scope: !66)
!83 = !DILocation(line: 102, column: 5, scope: !66)
!84 = !DILocation(line: 103, column: 5, scope: !66)
!85 = !DILocation(line: 105, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 62, type: !4)
!88 = !DILocation(line: 62, column: 15, scope: !86)
!89 = !DILocation(line: 63, column: 23, scope: !86)
!90 = !DILocation(line: 63, column: 12, scope: !86)
!91 = !DILocation(line: 63, column: 10, scope: !86)
!92 = !DILocation(line: 64, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !17, line: 64, column: 9)
!94 = !DILocation(line: 64, column: 14, scope: !93)
!95 = !DILocation(line: 64, column: 9, scope: !86)
!96 = !DILocation(line: 64, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 64, column: 23)
!98 = !DILocation(line: 65, column: 26, scope: !86)
!99 = !DILocation(line: 65, column: 12, scope: !86)
!100 = !DILocation(line: 65, column: 10, scope: !86)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !17, line: 67, type: !36)
!102 = distinct !DILexicalBlock(scope: !86, file: !17, line: 66, column: 5)
!103 = !DILocation(line: 67, column: 17, scope: !102)
!104 = !DILocation(line: 69, column: 9, scope: !102)
!105 = !DILocation(line: 69, column: 22, scope: !102)
!106 = !DILocation(line: 69, column: 35, scope: !102)
!107 = !DILocation(line: 69, column: 28, scope: !102)
!108 = !DILocation(line: 69, column: 40, scope: !102)
!109 = !DILocation(line: 70, column: 9, scope: !102)
!110 = !DILocation(line: 70, column: 20, scope: !102)
!111 = !DILocation(line: 71, column: 20, scope: !102)
!112 = !DILocation(line: 71, column: 9, scope: !102)
!113 = !DILocation(line: 72, column: 14, scope: !102)
!114 = !DILocation(line: 72, column: 9, scope: !102)
!115 = !DILocation(line: 74, column: 1, scope: !86)
!116 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 51, type: !53, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", arg: 1, scope: !116, file: !17, line: 51, type: !4)
!118 = !DILocation(line: 51, column: 42, scope: !116)
!119 = !DILocation(line: 54, column: 13, scope: !116)
!120 = !DILocation(line: 54, column: 5, scope: !116)
!121 = !DILocation(line: 55, column: 5, scope: !116)
!122 = !DILocation(line: 55, column: 16, scope: !116)
!123 = !DILocation(line: 56, column: 12, scope: !116)
!124 = !DILocation(line: 56, column: 5, scope: !116)
