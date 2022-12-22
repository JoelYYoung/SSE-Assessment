; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  call void %4(i32* %5), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !52
  %1 = load i32*, i32** %data.addr, align 8, !dbg !53
  %call = call i64 @wcslen(i32* %1) #9, !dbg !54
  %2 = load i32*, i32** %data.addr, align 8, !dbg !55
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.4, i64 0, i64 0), i32* %2) #7, !dbg !56
  %3 = load i32*, i32** %data.addr, align 8, !dbg !57
  call void @printWLine(i32* %3), !dbg !58
  %4 = load i32*, i32** %data.addr, align 8, !dbg !59
  %5 = bitcast i32* %4 to i8*, !dbg !59
  call void @free(i8* %5) #7, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44_good() #0 !dbg !62 {
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
  %call = call i64 @time(i64* null) #7, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #7, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !88, metadata !DIExpression()), !dbg !89
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !89
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !90
  %0 = bitcast i8* %call to i32*, !dbg !91
  store i32* %0, i32** %data, align 8, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %cmp = icmp eq i32* %1, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  call void %4(i32* %5), !dbg !103
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !106 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !112
  %1 = load i32*, i32** %data.addr, align 8, !dbg !113
  %call = call i64 @wcslen(i32* %1) #9, !dbg !114
  %2 = load i32*, i32** %data.addr, align 8, !dbg !115
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.4, i64 0, i64 0), i32* %2) #7, !dbg !116
  %3 = load i32*, i32** %data.addr, align 8, !dbg !117
  call void @printWLine(i32* %3), !dbg !118
  %4 = load i32*, i32** %data.addr, align 8, !dbg !119
  %5 = bitcast i32* %4 to i8*, !dbg !119
  call void @free(i8* %5) #7, !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44_bad", scope: !17, file: !17, line: 40, type: !18, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 42, type: !4)
!21 = !DILocation(line: 42, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 44, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 44, column: 12, scope: !16)
!27 = !DILocation(line: 45, column: 23, scope: !16)
!28 = !DILocation(line: 45, column: 12, scope: !16)
!29 = !DILocation(line: 45, column: 10, scope: !16)
!30 = !DILocation(line: 46, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 46, column: 9)
!32 = !DILocation(line: 46, column: 14, scope: !31)
!33 = !DILocation(line: 46, column: 9, scope: !16)
!34 = !DILocation(line: 46, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 46, column: 23)
!36 = !DILocation(line: 48, column: 13, scope: !16)
!37 = !DILocation(line: 48, column: 5, scope: !16)
!38 = !DILocation(line: 49, column: 5, scope: !16)
!39 = !DILocation(line: 49, column: 17, scope: !16)
!40 = !DILocation(line: 51, column: 5, scope: !16)
!41 = !DILocation(line: 51, column: 13, scope: !16)
!42 = !DILocation(line: 52, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 29, type: !24, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !17, line: 29, type: !4)
!45 = !DILocation(line: 29, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 32, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !17, line: 31, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 32, column: 17, scope: !47)
!52 = !DILocation(line: 34, column: 18, scope: !47)
!53 = !DILocation(line: 34, column: 31, scope: !47)
!54 = !DILocation(line: 34, column: 24, scope: !47)
!55 = !DILocation(line: 34, column: 45, scope: !47)
!56 = !DILocation(line: 34, column: 9, scope: !47)
!57 = !DILocation(line: 35, column: 20, scope: !47)
!58 = !DILocation(line: 35, column: 9, scope: !47)
!59 = !DILocation(line: 36, column: 14, scope: !47)
!60 = !DILocation(line: 36, column: 9, scope: !47)
!61 = !DILocation(line: 38, column: 1, scope: !43)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_44_good", scope: !17, file: !17, line: 82, type: !18, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 84, column: 5, scope: !62)
!64 = !DILocation(line: 85, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 96, type: !66, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !17, line: 96, type: !7)
!72 = !DILocation(line: 96, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !17, line: 96, type: !68)
!74 = !DILocation(line: 96, column: 27, scope: !65)
!75 = !DILocation(line: 99, column: 22, scope: !65)
!76 = !DILocation(line: 99, column: 12, scope: !65)
!77 = !DILocation(line: 99, column: 5, scope: !65)
!78 = !DILocation(line: 101, column: 5, scope: !65)
!79 = !DILocation(line: 102, column: 5, scope: !65)
!80 = !DILocation(line: 103, column: 5, scope: !65)
!81 = !DILocation(line: 106, column: 5, scope: !65)
!82 = !DILocation(line: 107, column: 5, scope: !65)
!83 = !DILocation(line: 108, column: 5, scope: !65)
!84 = !DILocation(line: 110, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 70, type: !18, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !17, line: 72, type: !4)
!87 = !DILocation(line: 72, column: 15, scope: !85)
!88 = !DILocalVariable(name: "funcPtr", scope: !85, file: !17, line: 73, type: !23)
!89 = !DILocation(line: 73, column: 12, scope: !85)
!90 = !DILocation(line: 74, column: 23, scope: !85)
!91 = !DILocation(line: 74, column: 12, scope: !85)
!92 = !DILocation(line: 74, column: 10, scope: !85)
!93 = !DILocation(line: 75, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !85, file: !17, line: 75, column: 9)
!95 = !DILocation(line: 75, column: 14, scope: !94)
!96 = !DILocation(line: 75, column: 9, scope: !85)
!97 = !DILocation(line: 75, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !17, line: 75, column: 23)
!99 = !DILocation(line: 77, column: 13, scope: !85)
!100 = !DILocation(line: 77, column: 5, scope: !85)
!101 = !DILocation(line: 78, column: 5, scope: !85)
!102 = !DILocation(line: 78, column: 16, scope: !85)
!103 = !DILocation(line: 79, column: 5, scope: !85)
!104 = !DILocation(line: 79, column: 13, scope: !85)
!105 = !DILocation(line: 80, column: 1, scope: !85)
!106 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 59, type: !24, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", arg: 1, scope: !106, file: !17, line: 59, type: !4)
!108 = !DILocation(line: 59, column: 35, scope: !106)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !17, line: 62, type: !48)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 61, column: 5)
!111 = !DILocation(line: 62, column: 17, scope: !110)
!112 = !DILocation(line: 64, column: 18, scope: !110)
!113 = !DILocation(line: 64, column: 31, scope: !110)
!114 = !DILocation(line: 64, column: 24, scope: !110)
!115 = !DILocation(line: 64, column: 45, scope: !110)
!116 = !DILocation(line: 64, column: 9, scope: !110)
!117 = !DILocation(line: 65, column: 20, scope: !110)
!118 = !DILocation(line: 65, column: 9, scope: !110)
!119 = !DILocation(line: 66, column: 14, scope: !110)
!120 = !DILocation(line: 66, column: 9, scope: !110)
!121 = !DILocation(line: 68, column: 1, scope: !106)
