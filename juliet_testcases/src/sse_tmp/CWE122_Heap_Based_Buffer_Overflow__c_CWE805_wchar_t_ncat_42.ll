; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42_bad() #0 !dbg !16 {
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
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %call3 = call i32* @wcsncat(i32* %1, i32* %arraydecay2, i64 100) #5, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* %2), !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %4 = bitcast i32* %3 to i8*, !dbg !41
  call void @free(i8* %4) #5, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !49
  %0 = bitcast i8* %call to i32*, !dbg !50
  store i32* %0, i32** %data.addr, align 8, !dbg !51
  %1 = load i32*, i32** %data.addr, align 8, !dbg !52
  %cmp = icmp eq i32* %1, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  %3 = load i32*, i32** %data.addr, align 8, !dbg !60
  ret i32* %3, !dbg !61
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42_good() #0 !dbg !62 {
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
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %0 = load i32*, i32** %data, align 8, !dbg !89
  %call = call i32* @goodG2BSource(i32* %0), !dbg !90
  store i32* %call, i32** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !95
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !96
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call3 = call i32* @wcsncat(i32* %1, i32* %arraydecay2, i64 100) #5, !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %2), !dbg !103
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %4 = bitcast i32* %3 to i8*, !dbg !104
  call void @free(i8* %4) #5, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !107 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %data.addr, align 8, !dbg !112
  %1 = load i32*, i32** %data.addr, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %3 = load i32*, i32** %data.addr, align 8, !dbg !121
  ret i32* %3, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42.c", directory: "/root/SSE-Assessment")
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
!37 = !DILocation(line: 42, column: 23, scope: !27)
!38 = !DILocation(line: 42, column: 9, scope: !27)
!39 = !DILocation(line: 43, column: 20, scope: !27)
!40 = !DILocation(line: 43, column: 9, scope: !27)
!41 = !DILocation(line: 44, column: 14, scope: !27)
!42 = !DILocation(line: 44, column: 9, scope: !27)
!43 = !DILocation(line: 46, column: 1, scope: !16)
!44 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !45, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!5, !5}
!47 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !17, line: 23, type: !5)
!48 = !DILocation(line: 23, column: 38, scope: !44)
!49 = !DILocation(line: 26, column: 23, scope: !44)
!50 = !DILocation(line: 26, column: 12, scope: !44)
!51 = !DILocation(line: 26, column: 10, scope: !44)
!52 = !DILocation(line: 27, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !44, file: !17, line: 27, column: 9)
!54 = !DILocation(line: 27, column: 14, scope: !53)
!55 = !DILocation(line: 27, column: 9, scope: !44)
!56 = !DILocation(line: 27, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !17, line: 27, column: 23)
!58 = !DILocation(line: 28, column: 5, scope: !44)
!59 = !DILocation(line: 28, column: 13, scope: !44)
!60 = !DILocation(line: 29, column: 12, scope: !44)
!61 = !DILocation(line: 29, column: 5, scope: !44)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_42_good", scope: !17, file: !17, line: 78, type: !18, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 80, column: 5, scope: !62)
!64 = !DILocation(line: 81, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 93, type: !66, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!8, !8, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !17, line: 93, type: !8)
!72 = !DILocation(line: 93, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !17, line: 93, type: !68)
!74 = !DILocation(line: 93, column: 27, scope: !65)
!75 = !DILocation(line: 96, column: 22, scope: !65)
!76 = !DILocation(line: 96, column: 12, scope: !65)
!77 = !DILocation(line: 96, column: 5, scope: !65)
!78 = !DILocation(line: 98, column: 5, scope: !65)
!79 = !DILocation(line: 99, column: 5, scope: !65)
!80 = !DILocation(line: 100, column: 5, scope: !65)
!81 = !DILocation(line: 103, column: 5, scope: !65)
!82 = !DILocation(line: 104, column: 5, scope: !65)
!83 = !DILocation(line: 105, column: 5, scope: !65)
!84 = !DILocation(line: 107, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !17, line: 64, type: !5)
!87 = !DILocation(line: 64, column: 15, scope: !85)
!88 = !DILocation(line: 65, column: 10, scope: !85)
!89 = !DILocation(line: 66, column: 26, scope: !85)
!90 = !DILocation(line: 66, column: 12, scope: !85)
!91 = !DILocation(line: 66, column: 10, scope: !85)
!92 = !DILocalVariable(name: "source", scope: !93, file: !17, line: 68, type: !28)
!93 = distinct !DILexicalBlock(scope: !85, file: !17, line: 67, column: 5)
!94 = !DILocation(line: 68, column: 17, scope: !93)
!95 = !DILocation(line: 69, column: 17, scope: !93)
!96 = !DILocation(line: 69, column: 9, scope: !93)
!97 = !DILocation(line: 70, column: 9, scope: !93)
!98 = !DILocation(line: 70, column: 23, scope: !93)
!99 = !DILocation(line: 72, column: 17, scope: !93)
!100 = !DILocation(line: 72, column: 23, scope: !93)
!101 = !DILocation(line: 72, column: 9, scope: !93)
!102 = !DILocation(line: 73, column: 20, scope: !93)
!103 = !DILocation(line: 73, column: 9, scope: !93)
!104 = !DILocation(line: 74, column: 14, scope: !93)
!105 = !DILocation(line: 74, column: 9, scope: !93)
!106 = !DILocation(line: 76, column: 1, scope: !85)
!107 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 52, type: !45, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", arg: 1, scope: !107, file: !17, line: 52, type: !5)
!109 = !DILocation(line: 52, column: 42, scope: !107)
!110 = !DILocation(line: 55, column: 23, scope: !107)
!111 = !DILocation(line: 55, column: 12, scope: !107)
!112 = !DILocation(line: 55, column: 10, scope: !107)
!113 = !DILocation(line: 56, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !17, line: 56, column: 9)
!115 = !DILocation(line: 56, column: 14, scope: !114)
!116 = !DILocation(line: 56, column: 9, scope: !107)
!117 = !DILocation(line: 56, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 56, column: 23)
!119 = !DILocation(line: 57, column: 5, scope: !107)
!120 = !DILocation(line: 57, column: 13, scope: !107)
!121 = !DILocation(line: 58, column: 12, scope: !107)
!122 = !DILocation(line: 58, column: 5, scope: !107)
