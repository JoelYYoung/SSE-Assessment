; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !29
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %0 = load i32*, i32** %data.addr, align 8, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !33
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %0, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay1) #5, !dbg !34
  %1 = load i32*, i32** %data.addr, align 8, !dbg !35
  call void @printWLine(i32* %1), !dbg !36
  %2 = load i32*, i32** %data.addr, align 8, !dbg !37
  %3 = bitcast i32* %2 to i8*, !dbg !37
  call void @free(i8* %3) #5, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_bad() #0 !dbg !40 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  store i32* null, i32** %data, align 8, !dbg !45
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !46
  %0 = bitcast i8* %call to i32*, !dbg !47
  store i32* %0, i32** %data, align 8, !dbg !48
  %1 = load i32*, i32** %data, align 8, !dbg !49
  %cmp = icmp eq i32* %1, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  %3 = load i32*, i32** %data, align 8, !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_badSink(i32* %3), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_goodG2BSink(i32* %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !63, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !66
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !67
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  %0 = load i32*, i32** %data.addr, align 8, !dbg !70
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !71
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %0, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay1) #5, !dbg !72
  %1 = load i32*, i32** %data.addr, align 8, !dbg !73
  call void @printWLine(i32* %1), !dbg !74
  %2 = load i32*, i32** %data.addr, align 8, !dbg !75
  %3 = bitcast i32* %2 to i8*, !dbg !75
  call void @free(i8* %3) #5, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32* null, i32** %data, align 8, !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !105
  %0 = bitcast i8* %call to i32*, !dbg !106
  store i32* %0, i32** %data, align 8, !dbg !107
  %1 = load i32*, i32** %data, align 8, !dbg !108
  %cmp = icmp eq i32* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %3 = load i32*, i32** %data, align 8, !dbg !116
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_goodG2BSink(i32* %3), !dbg !117
  ret void, !dbg !118
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_badSink", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 29, type: !4)
!21 = !DILocation(line: 29, column: 88, scope: !16)
!22 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 32, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 32, column: 17, scope: !23)
!28 = !DILocation(line: 33, column: 17, scope: !23)
!29 = !DILocation(line: 33, column: 9, scope: !23)
!30 = !DILocation(line: 34, column: 9, scope: !23)
!31 = !DILocation(line: 34, column: 23, scope: !23)
!32 = !DILocation(line: 36, column: 18, scope: !23)
!33 = !DILocation(line: 36, column: 36, scope: !23)
!34 = !DILocation(line: 36, column: 9, scope: !23)
!35 = !DILocation(line: 37, column: 20, scope: !23)
!36 = !DILocation(line: 37, column: 9, scope: !23)
!37 = !DILocation(line: 38, column: 14, scope: !23)
!38 = !DILocation(line: 38, column: 9, scope: !23)
!39 = !DILocation(line: 40, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_bad", scope: !17, file: !17, line: 42, type: !41, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !17, line: 44, type: !4)
!44 = !DILocation(line: 44, column: 15, scope: !40)
!45 = !DILocation(line: 45, column: 10, scope: !40)
!46 = !DILocation(line: 47, column: 23, scope: !40)
!47 = !DILocation(line: 47, column: 12, scope: !40)
!48 = !DILocation(line: 47, column: 10, scope: !40)
!49 = !DILocation(line: 48, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !40, file: !17, line: 48, column: 9)
!51 = !DILocation(line: 48, column: 14, scope: !50)
!52 = !DILocation(line: 48, column: 9, scope: !40)
!53 = !DILocation(line: 48, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !17, line: 48, column: 23)
!55 = !DILocation(line: 49, column: 5, scope: !40)
!56 = !DILocation(line: 49, column: 13, scope: !40)
!57 = !DILocation(line: 50, column: 77, scope: !40)
!58 = !DILocation(line: 50, column: 5, scope: !40)
!59 = !DILocation(line: 51, column: 1, scope: !40)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_goodG2BSink", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !17, line: 57, type: !4)
!62 = !DILocation(line: 57, column: 92, scope: !60)
!63 = !DILocalVariable(name: "source", scope: !64, file: !17, line: 60, type: !24)
!64 = distinct !DILexicalBlock(scope: !60, file: !17, line: 59, column: 5)
!65 = !DILocation(line: 60, column: 17, scope: !64)
!66 = !DILocation(line: 61, column: 17, scope: !64)
!67 = !DILocation(line: 61, column: 9, scope: !64)
!68 = !DILocation(line: 62, column: 9, scope: !64)
!69 = !DILocation(line: 62, column: 23, scope: !64)
!70 = !DILocation(line: 64, column: 18, scope: !64)
!71 = !DILocation(line: 64, column: 36, scope: !64)
!72 = !DILocation(line: 64, column: 9, scope: !64)
!73 = !DILocation(line: 65, column: 20, scope: !64)
!74 = !DILocation(line: 65, column: 9, scope: !64)
!75 = !DILocation(line: 66, column: 14, scope: !64)
!76 = !DILocation(line: 66, column: 9, scope: !64)
!77 = !DILocation(line: 68, column: 1, scope: !60)
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_41_good", scope: !17, file: !17, line: 82, type: !41, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 84, column: 5, scope: !78)
!80 = !DILocation(line: 85, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 97, type: !82, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !17, line: 97, type: !7)
!88 = !DILocation(line: 97, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !17, line: 97, type: !84)
!90 = !DILocation(line: 97, column: 27, scope: !81)
!91 = !DILocation(line: 100, column: 22, scope: !81)
!92 = !DILocation(line: 100, column: 12, scope: !81)
!93 = !DILocation(line: 100, column: 5, scope: !81)
!94 = !DILocation(line: 102, column: 5, scope: !81)
!95 = !DILocation(line: 103, column: 5, scope: !81)
!96 = !DILocation(line: 104, column: 5, scope: !81)
!97 = !DILocation(line: 107, column: 5, scope: !81)
!98 = !DILocation(line: 108, column: 5, scope: !81)
!99 = !DILocation(line: 109, column: 5, scope: !81)
!100 = !DILocation(line: 111, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 71, type: !41, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !17, line: 73, type: !4)
!103 = !DILocation(line: 73, column: 15, scope: !101)
!104 = !DILocation(line: 74, column: 10, scope: !101)
!105 = !DILocation(line: 76, column: 23, scope: !101)
!106 = !DILocation(line: 76, column: 12, scope: !101)
!107 = !DILocation(line: 76, column: 10, scope: !101)
!108 = !DILocation(line: 77, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !17, line: 77, column: 9)
!110 = !DILocation(line: 77, column: 14, scope: !109)
!111 = !DILocation(line: 77, column: 9, scope: !101)
!112 = !DILocation(line: 77, column: 24, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !17, line: 77, column: 23)
!114 = !DILocation(line: 78, column: 5, scope: !101)
!115 = !DILocation(line: 78, column: 13, scope: !101)
!116 = !DILocation(line: 79, column: 81, scope: !101)
!117 = !DILocation(line: 79, column: 5, scope: !101)
!118 = !DILocation(line: 80, column: 1, scope: !101)
