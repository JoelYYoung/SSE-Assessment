; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44_bad() #0 !dbg !16 {
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
  %2 = load i32*, i32** %data.addr, align 8, !dbg !54
  %call = call i64 @wcslen(i32* %2) #9, !dbg !55
  %call1 = call i32* @wcsncat(i32* %arraydecay, i32* %1, i64 %call) #7, !dbg !56
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  %3 = load i32*, i32** %data.addr, align 8, !dbg !59
  call void @printWLine(i32* %3), !dbg !60
  %4 = load i32*, i32** %data.addr, align 8, !dbg !61
  %5 = bitcast i32* %4 to i8*, !dbg !61
  call void @free(i8* %5) #7, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !90, metadata !DIExpression()), !dbg !91
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !105
  %5 = load i32*, i32** %data, align 8, !dbg !106
  call void %4(i32* %5), !dbg !105
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !108 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !114
  %1 = load i32*, i32** %data.addr, align 8, !dbg !115
  %2 = load i32*, i32** %data.addr, align 8, !dbg !116
  %call = call i64 @wcslen(i32* %2) #9, !dbg !117
  %call1 = call i32* @wcsncat(i32* %arraydecay, i32* %1, i64 %call) #7, !dbg !118
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %3 = load i32*, i32** %data.addr, align 8, !dbg !121
  call void @printWLine(i32* %3), !dbg !122
  %4 = load i32*, i32** %data.addr, align 8, !dbg !123
  %5 = bitcast i32* %4 to i8*, !dbg !123
  call void @free(i8* %5) #7, !dbg !124
  ret void, !dbg !125
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44_bad", scope: !17, file: !17, line: 35, type: !18, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 37, type: !4)
!21 = !DILocation(line: 37, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 39, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 39, column: 12, scope: !16)
!27 = !DILocation(line: 40, column: 23, scope: !16)
!28 = !DILocation(line: 40, column: 12, scope: !16)
!29 = !DILocation(line: 40, column: 10, scope: !16)
!30 = !DILocation(line: 41, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 9)
!32 = !DILocation(line: 41, column: 14, scope: !31)
!33 = !DILocation(line: 41, column: 9, scope: !16)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 41, column: 23)
!36 = !DILocation(line: 43, column: 13, scope: !16)
!37 = !DILocation(line: 43, column: 5, scope: !16)
!38 = !DILocation(line: 44, column: 5, scope: !16)
!39 = !DILocation(line: 44, column: 17, scope: !16)
!40 = !DILocation(line: 46, column: 5, scope: !16)
!41 = !DILocation(line: 46, column: 13, scope: !16)
!42 = !DILocation(line: 47, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !17, line: 23, type: !4)
!45 = !DILocation(line: 23, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 26, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !17, line: 25, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 26, column: 17, scope: !47)
!52 = !DILocation(line: 28, column: 17, scope: !47)
!53 = !DILocation(line: 28, column: 23, scope: !47)
!54 = !DILocation(line: 28, column: 36, scope: !47)
!55 = !DILocation(line: 28, column: 29, scope: !47)
!56 = !DILocation(line: 28, column: 9, scope: !47)
!57 = !DILocation(line: 29, column: 9, scope: !47)
!58 = !DILocation(line: 29, column: 20, scope: !47)
!59 = !DILocation(line: 30, column: 20, scope: !47)
!60 = !DILocation(line: 30, column: 9, scope: !47)
!61 = !DILocation(line: 31, column: 14, scope: !47)
!62 = !DILocation(line: 31, column: 9, scope: !47)
!63 = !DILocation(line: 33, column: 1, scope: !43)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_44_good", scope: !17, file: !17, line: 78, type: !18, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 80, column: 5, scope: !64)
!66 = !DILocation(line: 81, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 92, type: !68, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 92, type: !7)
!74 = !DILocation(line: 92, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 92, type: !70)
!76 = !DILocation(line: 92, column: 27, scope: !67)
!77 = !DILocation(line: 95, column: 22, scope: !67)
!78 = !DILocation(line: 95, column: 12, scope: !67)
!79 = !DILocation(line: 95, column: 5, scope: !67)
!80 = !DILocation(line: 97, column: 5, scope: !67)
!81 = !DILocation(line: 98, column: 5, scope: !67)
!82 = !DILocation(line: 99, column: 5, scope: !67)
!83 = !DILocation(line: 102, column: 5, scope: !67)
!84 = !DILocation(line: 103, column: 5, scope: !67)
!85 = !DILocation(line: 104, column: 5, scope: !67)
!86 = !DILocation(line: 106, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 66, type: !18, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 68, type: !4)
!89 = !DILocation(line: 68, column: 15, scope: !87)
!90 = !DILocalVariable(name: "funcPtr", scope: !87, file: !17, line: 69, type: !23)
!91 = !DILocation(line: 69, column: 12, scope: !87)
!92 = !DILocation(line: 70, column: 23, scope: !87)
!93 = !DILocation(line: 70, column: 12, scope: !87)
!94 = !DILocation(line: 70, column: 10, scope: !87)
!95 = !DILocation(line: 71, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !87, file: !17, line: 71, column: 9)
!97 = !DILocation(line: 71, column: 14, scope: !96)
!98 = !DILocation(line: 71, column: 9, scope: !87)
!99 = !DILocation(line: 71, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 71, column: 23)
!101 = !DILocation(line: 73, column: 13, scope: !87)
!102 = !DILocation(line: 73, column: 5, scope: !87)
!103 = !DILocation(line: 74, column: 5, scope: !87)
!104 = !DILocation(line: 74, column: 16, scope: !87)
!105 = !DILocation(line: 75, column: 5, scope: !87)
!106 = !DILocation(line: 75, column: 13, scope: !87)
!107 = !DILocation(line: 76, column: 1, scope: !87)
!108 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 54, type: !24, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !17, line: 54, type: !4)
!110 = !DILocation(line: 54, column: 35, scope: !108)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !17, line: 57, type: !48)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 56, column: 5)
!113 = !DILocation(line: 57, column: 17, scope: !112)
!114 = !DILocation(line: 59, column: 17, scope: !112)
!115 = !DILocation(line: 59, column: 23, scope: !112)
!116 = !DILocation(line: 59, column: 36, scope: !112)
!117 = !DILocation(line: 59, column: 29, scope: !112)
!118 = !DILocation(line: 59, column: 9, scope: !112)
!119 = !DILocation(line: 60, column: 9, scope: !112)
!120 = !DILocation(line: 60, column: 20, scope: !112)
!121 = !DILocation(line: 61, column: 20, scope: !112)
!122 = !DILocation(line: 61, column: 9, scope: !112)
!123 = !DILocation(line: 62, column: 14, scope: !112)
!124 = !DILocation(line: 62, column: 9, scope: !112)
!125 = !DILocation(line: 64, column: 1, scope: !108)
