; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_badSink(i32* %data) #0 !dbg !16 {
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
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #5, !dbg !34
  %1 = load i32*, i32** %data.addr, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx3, align 4, !dbg !36
  %2 = load i32*, i32** %data.addr, align 8, !dbg !37
  call void @printWLine(i32* %2), !dbg !38
  %3 = load i32*, i32** %data.addr, align 8, !dbg !39
  %4 = bitcast i32* %3 to i8*, !dbg !39
  call void @free(i8* %4) #5, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_bad() #0 !dbg !42 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  store i32* null, i32** %data, align 8, !dbg !47
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !48
  %0 = bitcast i8* %call to i32*, !dbg !49
  store i32* %0, i32** %data, align 8, !dbg !50
  %1 = load i32*, i32** %data, align 8, !dbg !51
  %cmp = icmp eq i32* %1, null, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  %3 = load i32*, i32** %data, align 8, !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_badSink(i32* %3), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !65, metadata !DIExpression()), !dbg !67
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !68
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !69
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !70
  store i32 0, i32* %arrayidx, align 4, !dbg !71
  %0 = load i32*, i32** %data.addr, align 8, !dbg !72
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !73
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #5, !dbg !74
  %1 = load i32*, i32** %data.addr, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !75
  store i32 0, i32* %arrayidx3, align 4, !dbg !76
  %2 = load i32*, i32** %data.addr, align 8, !dbg !77
  call void @printWLine(i32* %2), !dbg !78
  %3 = load i32*, i32** %data.addr, align 8, !dbg !79
  %4 = bitcast i32* %3 to i8*, !dbg !79
  call void @free(i8* %4) #5, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !109
  %0 = bitcast i8* %call to i32*, !dbg !110
  store i32* %0, i32** %data, align 8, !dbg !111
  %1 = load i32*, i32** %data, align 8, !dbg !112
  %cmp = icmp eq i32* %1, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %3 = load i32*, i32** %data, align 8, !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_goodG2BSink(i32* %3), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 84, scope: !16)
!22 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocation(line: 27, column: 17, scope: !23)
!29 = !DILocation(line: 27, column: 9, scope: !23)
!30 = !DILocation(line: 28, column: 9, scope: !23)
!31 = !DILocation(line: 28, column: 23, scope: !23)
!32 = !DILocation(line: 30, column: 17, scope: !23)
!33 = !DILocation(line: 30, column: 23, scope: !23)
!34 = !DILocation(line: 30, column: 9, scope: !23)
!35 = !DILocation(line: 31, column: 9, scope: !23)
!36 = !DILocation(line: 31, column: 21, scope: !23)
!37 = !DILocation(line: 32, column: 20, scope: !23)
!38 = !DILocation(line: 32, column: 9, scope: !23)
!39 = !DILocation(line: 33, column: 14, scope: !23)
!40 = !DILocation(line: 33, column: 9, scope: !23)
!41 = !DILocation(line: 35, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_bad", scope: !17, file: !17, line: 37, type: !43, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{null}
!45 = !DILocalVariable(name: "data", scope: !42, file: !17, line: 39, type: !4)
!46 = !DILocation(line: 39, column: 15, scope: !42)
!47 = !DILocation(line: 40, column: 10, scope: !42)
!48 = !DILocation(line: 42, column: 23, scope: !42)
!49 = !DILocation(line: 42, column: 12, scope: !42)
!50 = !DILocation(line: 42, column: 10, scope: !42)
!51 = !DILocation(line: 43, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !42, file: !17, line: 43, column: 9)
!53 = !DILocation(line: 43, column: 14, scope: !52)
!54 = !DILocation(line: 43, column: 9, scope: !42)
!55 = !DILocation(line: 43, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 43, column: 23)
!57 = !DILocation(line: 44, column: 5, scope: !42)
!58 = !DILocation(line: 44, column: 13, scope: !42)
!59 = !DILocation(line: 45, column: 73, scope: !42)
!60 = !DILocation(line: 45, column: 5, scope: !42)
!61 = !DILocation(line: 46, column: 1, scope: !42)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_goodG2BSink", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !17, line: 52, type: !4)
!64 = !DILocation(line: 52, column: 88, scope: !62)
!65 = !DILocalVariable(name: "source", scope: !66, file: !17, line: 55, type: !24)
!66 = distinct !DILexicalBlock(scope: !62, file: !17, line: 54, column: 5)
!67 = !DILocation(line: 55, column: 17, scope: !66)
!68 = !DILocation(line: 56, column: 17, scope: !66)
!69 = !DILocation(line: 56, column: 9, scope: !66)
!70 = !DILocation(line: 57, column: 9, scope: !66)
!71 = !DILocation(line: 57, column: 23, scope: !66)
!72 = !DILocation(line: 59, column: 17, scope: !66)
!73 = !DILocation(line: 59, column: 23, scope: !66)
!74 = !DILocation(line: 59, column: 9, scope: !66)
!75 = !DILocation(line: 60, column: 9, scope: !66)
!76 = !DILocation(line: 60, column: 21, scope: !66)
!77 = !DILocation(line: 61, column: 20, scope: !66)
!78 = !DILocation(line: 61, column: 9, scope: !66)
!79 = !DILocation(line: 62, column: 14, scope: !66)
!80 = !DILocation(line: 62, column: 9, scope: !66)
!81 = !DILocation(line: 64, column: 1, scope: !62)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_41_good", scope: !17, file: !17, line: 78, type: !43, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 80, column: 5, scope: !82)
!84 = !DILocation(line: 81, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 93, type: !86, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !17, line: 93, type: !7)
!92 = !DILocation(line: 93, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !17, line: 93, type: !88)
!94 = !DILocation(line: 93, column: 27, scope: !85)
!95 = !DILocation(line: 96, column: 22, scope: !85)
!96 = !DILocation(line: 96, column: 12, scope: !85)
!97 = !DILocation(line: 96, column: 5, scope: !85)
!98 = !DILocation(line: 98, column: 5, scope: !85)
!99 = !DILocation(line: 99, column: 5, scope: !85)
!100 = !DILocation(line: 100, column: 5, scope: !85)
!101 = !DILocation(line: 103, column: 5, scope: !85)
!102 = !DILocation(line: 104, column: 5, scope: !85)
!103 = !DILocation(line: 105, column: 5, scope: !85)
!104 = !DILocation(line: 107, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 67, type: !43, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 69, type: !4)
!107 = !DILocation(line: 69, column: 15, scope: !105)
!108 = !DILocation(line: 70, column: 10, scope: !105)
!109 = !DILocation(line: 72, column: 23, scope: !105)
!110 = !DILocation(line: 72, column: 12, scope: !105)
!111 = !DILocation(line: 72, column: 10, scope: !105)
!112 = !DILocation(line: 73, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !17, line: 73, column: 9)
!114 = !DILocation(line: 73, column: 14, scope: !113)
!115 = !DILocation(line: 73, column: 9, scope: !105)
!116 = !DILocation(line: 73, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 73, column: 23)
!118 = !DILocation(line: 74, column: 5, scope: !105)
!119 = !DILocation(line: 74, column: 13, scope: !105)
!120 = !DILocation(line: 75, column: 77, scope: !105)
!121 = !DILocation(line: 75, column: 5, scope: !105)
!122 = !DILocation(line: 76, column: 1, scope: !105)
