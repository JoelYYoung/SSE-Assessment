; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx2, align 4, !dbg !45
  %3 = load i32*, i32** %data, align 8, !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call4 = call i32* @wcsncat(i32* %3, i32* %arraydecay3, i64 100) #5, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %4), !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !51
  call void @free(i8* %6) #5, !dbg !52
  ret void, !dbg !53
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
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32* null, i32** %data, align 8, !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !82
  %0 = bitcast i8* %call to i32*, !dbg !85
  store i32* %0, i32** %data, align 8, !dbg !86
  %1 = load i32*, i32** %data, align 8, !dbg !87
  %cmp = icmp eq i32* %1, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !98
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !99
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx2, align 4, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call4 = call i32* @wcsncat(i32* %3, i32* %arraydecay3, i64 100) #5, !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %4), !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %6 = bitcast i32* %5 to i8*, !dbg !107
  call void @free(i8* %6) #5, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  store i32* null, i32** %data, align 8, !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %data, align 8, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %cmp = icmp eq i32* %1, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !131
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx2, align 4, !dbg !133
  %3 = load i32*, i32** %data, align 8, !dbg !134
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call4 = call i32* @wcsncat(i32* %3, i32* %arraydecay3, i64 100) #5, !dbg !136
  %4 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %4), !dbg !138
  %5 = load i32*, i32** %data, align 8, !dbg !139
  %6 = bitcast i32* %5 to i8*, !dbg !139
  call void @free(i8* %6) #5, !dbg !140
  ret void, !dbg !141
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06_bad", scope: !17, file: !17, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 29, type: !4)
!21 = !DILocation(line: 29, column: 15, scope: !16)
!22 = !DILocation(line: 30, column: 10, scope: !16)
!23 = !DILocation(line: 34, column: 27, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 32, column: 5)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 8)
!26 = !DILocation(line: 34, column: 16, scope: !24)
!27 = !DILocation(line: 34, column: 14, scope: !24)
!28 = !DILocation(line: 35, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 35, column: 13)
!30 = !DILocation(line: 35, column: 18, scope: !29)
!31 = !DILocation(line: 35, column: 13, scope: !24)
!32 = !DILocation(line: 35, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 35, column: 27)
!34 = !DILocation(line: 36, column: 9, scope: !24)
!35 = !DILocation(line: 36, column: 17, scope: !24)
!36 = !DILocalVariable(name: "source", scope: !37, file: !17, line: 39, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 39, column: 17, scope: !37)
!42 = !DILocation(line: 40, column: 17, scope: !37)
!43 = !DILocation(line: 40, column: 9, scope: !37)
!44 = !DILocation(line: 41, column: 9, scope: !37)
!45 = !DILocation(line: 41, column: 23, scope: !37)
!46 = !DILocation(line: 43, column: 17, scope: !37)
!47 = !DILocation(line: 43, column: 23, scope: !37)
!48 = !DILocation(line: 43, column: 9, scope: !37)
!49 = !DILocation(line: 44, column: 20, scope: !37)
!50 = !DILocation(line: 44, column: 9, scope: !37)
!51 = !DILocation(line: 45, column: 14, scope: !37)
!52 = !DILocation(line: 45, column: 9, scope: !37)
!53 = !DILocation(line: 47, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncat_06_good", scope: !17, file: !17, line: 104, type: !18, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 106, column: 5, scope: !54)
!56 = !DILocation(line: 107, column: 5, scope: !54)
!57 = !DILocation(line: 108, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 120, type: !59, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 120, type: !7)
!65 = !DILocation(line: 120, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 120, type: !61)
!67 = !DILocation(line: 120, column: 27, scope: !58)
!68 = !DILocation(line: 123, column: 22, scope: !58)
!69 = !DILocation(line: 123, column: 12, scope: !58)
!70 = !DILocation(line: 123, column: 5, scope: !58)
!71 = !DILocation(line: 125, column: 5, scope: !58)
!72 = !DILocation(line: 126, column: 5, scope: !58)
!73 = !DILocation(line: 127, column: 5, scope: !58)
!74 = !DILocation(line: 130, column: 5, scope: !58)
!75 = !DILocation(line: 131, column: 5, scope: !58)
!76 = !DILocation(line: 132, column: 5, scope: !58)
!77 = !DILocation(line: 134, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !17, line: 56, type: !4)
!80 = !DILocation(line: 56, column: 15, scope: !78)
!81 = !DILocation(line: 57, column: 10, scope: !78)
!82 = !DILocation(line: 66, column: 27, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !17, line: 64, column: 5)
!84 = distinct !DILexicalBlock(scope: !78, file: !17, line: 58, column: 8)
!85 = !DILocation(line: 66, column: 16, scope: !83)
!86 = !DILocation(line: 66, column: 14, scope: !83)
!87 = !DILocation(line: 67, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !17, line: 67, column: 13)
!89 = !DILocation(line: 67, column: 18, scope: !88)
!90 = !DILocation(line: 67, column: 13, scope: !83)
!91 = !DILocation(line: 67, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !17, line: 67, column: 27)
!93 = !DILocation(line: 68, column: 9, scope: !83)
!94 = !DILocation(line: 68, column: 17, scope: !83)
!95 = !DILocalVariable(name: "source", scope: !96, file: !17, line: 71, type: !38)
!96 = distinct !DILexicalBlock(scope: !78, file: !17, line: 70, column: 5)
!97 = !DILocation(line: 71, column: 17, scope: !96)
!98 = !DILocation(line: 72, column: 17, scope: !96)
!99 = !DILocation(line: 72, column: 9, scope: !96)
!100 = !DILocation(line: 73, column: 9, scope: !96)
!101 = !DILocation(line: 73, column: 23, scope: !96)
!102 = !DILocation(line: 75, column: 17, scope: !96)
!103 = !DILocation(line: 75, column: 23, scope: !96)
!104 = !DILocation(line: 75, column: 9, scope: !96)
!105 = !DILocation(line: 76, column: 20, scope: !96)
!106 = !DILocation(line: 76, column: 9, scope: !96)
!107 = !DILocation(line: 77, column: 14, scope: !96)
!108 = !DILocation(line: 77, column: 9, scope: !96)
!109 = !DILocation(line: 79, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 82, type: !18, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 84, type: !4)
!112 = !DILocation(line: 84, column: 15, scope: !110)
!113 = !DILocation(line: 85, column: 10, scope: !110)
!114 = !DILocation(line: 89, column: 27, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !17, line: 87, column: 5)
!116 = distinct !DILexicalBlock(scope: !110, file: !17, line: 86, column: 8)
!117 = !DILocation(line: 89, column: 16, scope: !115)
!118 = !DILocation(line: 89, column: 14, scope: !115)
!119 = !DILocation(line: 90, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !17, line: 90, column: 13)
!121 = !DILocation(line: 90, column: 18, scope: !120)
!122 = !DILocation(line: 90, column: 13, scope: !115)
!123 = !DILocation(line: 90, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 90, column: 27)
!125 = !DILocation(line: 91, column: 9, scope: !115)
!126 = !DILocation(line: 91, column: 17, scope: !115)
!127 = !DILocalVariable(name: "source", scope: !128, file: !17, line: 94, type: !38)
!128 = distinct !DILexicalBlock(scope: !110, file: !17, line: 93, column: 5)
!129 = !DILocation(line: 94, column: 17, scope: !128)
!130 = !DILocation(line: 95, column: 17, scope: !128)
!131 = !DILocation(line: 95, column: 9, scope: !128)
!132 = !DILocation(line: 96, column: 9, scope: !128)
!133 = !DILocation(line: 96, column: 23, scope: !128)
!134 = !DILocation(line: 98, column: 17, scope: !128)
!135 = !DILocation(line: 98, column: 23, scope: !128)
!136 = !DILocation(line: 98, column: 9, scope: !128)
!137 = !DILocation(line: 99, column: 20, scope: !128)
!138 = !DILocation(line: 99, column: 9, scope: !128)
!139 = !DILocation(line: 100, column: 14, scope: !128)
!140 = !DILocation(line: 100, column: 9, scope: !128)
!141 = !DILocation(line: 102, column: 1, scope: !110)
