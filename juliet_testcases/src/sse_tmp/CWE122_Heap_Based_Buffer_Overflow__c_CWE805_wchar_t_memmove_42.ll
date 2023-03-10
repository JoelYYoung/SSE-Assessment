; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %2 = bitcast i32* %1 to i8*, !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !38
  store i32 0, i32* %arrayidx3, align 4, !dbg !39
  %5 = load i32*, i32** %data, align 8, !dbg !40
  call void @printWLine(i32* %5), !dbg !41
  %6 = load i32*, i32** %data, align 8, !dbg !42
  %7 = bitcast i32* %6 to i8*, !dbg !42
  call void @free(i8* %7) #6, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !50
  %0 = bitcast i8* %call to i32*, !dbg !51
  store i32* %0, i32** %data.addr, align 8, !dbg !52
  %1 = load i32*, i32** %data.addr, align 8, !dbg !53
  %cmp = icmp eq i32* %1, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  %3 = load i32*, i32** %data.addr, align 8, !dbg !61
  ret i32* %3, !dbg !62
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32* null, i32** %data, align 8, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %call = call i32* @goodG2BSource(i32* %0), !dbg !91
  store i32* %call, i32** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !97
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %2 = bitcast i32* %1 to i8*, !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !101
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !101
  %4 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !102
  store i32 0, i32* %arrayidx3, align 4, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %5), !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !106
  %7 = bitcast i32* %6 to i8*, !dbg !106
  call void @free(i8* %7) #6, !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !109 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !112
  %0 = bitcast i8* %call to i32*, !dbg !113
  store i32* %0, i32** %data.addr, align 8, !dbg !114
  %1 = load i32*, i32** %data.addr, align 8, !dbg !115
  %cmp = icmp eq i32* %1, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %3 = load i32*, i32** %data.addr, align 8, !dbg !123
  ret i32* %3, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !5)
!21 = !DILocation(line: 34, column: 15, scope: !16)
!22 = !DILocation(line: 35, column: 10, scope: !16)
!23 = !DILocation(line: 36, column: 22, scope: !16)
!24 = !DILocation(line: 36, column: 12, scope: !16)
!25 = !DILocation(line: 36, column: 10, scope: !16)
!26 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 38, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 38, column: 17, scope: !27)
!32 = !DILocation(line: 39, column: 17, scope: !27)
!33 = !DILocation(line: 39, column: 9, scope: !27)
!34 = !DILocation(line: 40, column: 9, scope: !27)
!35 = !DILocation(line: 40, column: 23, scope: !27)
!36 = !DILocation(line: 42, column: 17, scope: !27)
!37 = !DILocation(line: 42, column: 9, scope: !27)
!38 = !DILocation(line: 43, column: 9, scope: !27)
!39 = !DILocation(line: 43, column: 21, scope: !27)
!40 = !DILocation(line: 44, column: 20, scope: !27)
!41 = !DILocation(line: 44, column: 9, scope: !27)
!42 = !DILocation(line: 45, column: 14, scope: !27)
!43 = !DILocation(line: 45, column: 9, scope: !27)
!44 = !DILocation(line: 47, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !46, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!5, !5}
!48 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !17, line: 23, type: !5)
!49 = !DILocation(line: 23, column: 38, scope: !45)
!50 = !DILocation(line: 26, column: 23, scope: !45)
!51 = !DILocation(line: 26, column: 12, scope: !45)
!52 = !DILocation(line: 26, column: 10, scope: !45)
!53 = !DILocation(line: 27, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !45, file: !17, line: 27, column: 9)
!55 = !DILocation(line: 27, column: 14, scope: !54)
!56 = !DILocation(line: 27, column: 9, scope: !45)
!57 = !DILocation(line: 27, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !17, line: 27, column: 23)
!59 = !DILocation(line: 28, column: 5, scope: !45)
!60 = !DILocation(line: 28, column: 13, scope: !45)
!61 = !DILocation(line: 29, column: 12, scope: !45)
!62 = !DILocation(line: 29, column: 5, scope: !45)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_42_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 82, column: 5, scope: !63)
!65 = !DILocation(line: 83, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !67, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!8, !8, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 95, type: !8)
!73 = !DILocation(line: 95, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 95, type: !69)
!75 = !DILocation(line: 95, column: 27, scope: !66)
!76 = !DILocation(line: 98, column: 22, scope: !66)
!77 = !DILocation(line: 98, column: 12, scope: !66)
!78 = !DILocation(line: 98, column: 5, scope: !66)
!79 = !DILocation(line: 100, column: 5, scope: !66)
!80 = !DILocation(line: 101, column: 5, scope: !66)
!81 = !DILocation(line: 102, column: 5, scope: !66)
!82 = !DILocation(line: 105, column: 5, scope: !66)
!83 = !DILocation(line: 106, column: 5, scope: !66)
!84 = !DILocation(line: 107, column: 5, scope: !66)
!85 = !DILocation(line: 109, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 65, type: !5)
!88 = !DILocation(line: 65, column: 15, scope: !86)
!89 = !DILocation(line: 66, column: 10, scope: !86)
!90 = !DILocation(line: 67, column: 26, scope: !86)
!91 = !DILocation(line: 67, column: 12, scope: !86)
!92 = !DILocation(line: 67, column: 10, scope: !86)
!93 = !DILocalVariable(name: "source", scope: !94, file: !17, line: 69, type: !28)
!94 = distinct !DILexicalBlock(scope: !86, file: !17, line: 68, column: 5)
!95 = !DILocation(line: 69, column: 17, scope: !94)
!96 = !DILocation(line: 70, column: 17, scope: !94)
!97 = !DILocation(line: 70, column: 9, scope: !94)
!98 = !DILocation(line: 71, column: 9, scope: !94)
!99 = !DILocation(line: 71, column: 23, scope: !94)
!100 = !DILocation(line: 73, column: 17, scope: !94)
!101 = !DILocation(line: 73, column: 9, scope: !94)
!102 = !DILocation(line: 74, column: 9, scope: !94)
!103 = !DILocation(line: 74, column: 21, scope: !94)
!104 = !DILocation(line: 75, column: 20, scope: !94)
!105 = !DILocation(line: 75, column: 9, scope: !94)
!106 = !DILocation(line: 76, column: 14, scope: !94)
!107 = !DILocation(line: 76, column: 9, scope: !94)
!108 = !DILocation(line: 78, column: 1, scope: !86)
!109 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 53, type: !46, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", arg: 1, scope: !109, file: !17, line: 53, type: !5)
!111 = !DILocation(line: 53, column: 42, scope: !109)
!112 = !DILocation(line: 56, column: 23, scope: !109)
!113 = !DILocation(line: 56, column: 12, scope: !109)
!114 = !DILocation(line: 56, column: 10, scope: !109)
!115 = !DILocation(line: 57, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !17, line: 57, column: 9)
!117 = !DILocation(line: 57, column: 14, scope: !116)
!118 = !DILocation(line: 57, column: 9, scope: !109)
!119 = !DILocation(line: 57, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !17, line: 57, column: 23)
!121 = !DILocation(line: 58, column: 5, scope: !109)
!122 = !DILocation(line: 58, column: 13, scope: !109)
!123 = !DILocation(line: 59, column: 12, scope: !109)
!124 = !DILocation(line: 59, column: 5, scope: !109)
