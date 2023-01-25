; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %call2 = call i64 @wcslen(i32* %6) #9, !dbg !44
  %call3 = call i32* @wcsncat(i32* %arraydecay, i32* %5, i64 %call2) #7, !dbg !45
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !46
  store i32 0, i32* %arrayidx4, align 4, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %7), !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  %9 = bitcast i32* %8 to i8*, !dbg !50
  call void @free(i8* %9) #7, !dbg !51
  ret void, !dbg !52
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

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !80
  %0 = bitcast i8* %call to i32*, !dbg !81
  store i32* %0, i32** %data, align 8, !dbg !82
  %1 = load i32*, i32** %data, align 8, !dbg !83
  %cmp = icmp eq i32* %1, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !89
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !90
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %6 = load i32*, i32** %data, align 8, !dbg !98
  %call2 = call i64 @wcslen(i32* %6) #9, !dbg !99
  %call3 = call i32* @wcsncat(i32* %arraydecay, i32* %5, i64 %call2) #7, !dbg !100
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !101
  store i32 0, i32* %arrayidx4, align 4, !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %7), !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  %9 = bitcast i32* %8 to i8*, !dbg !105
  call void @free(i8* %9) #7, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !111
  %0 = bitcast i8* %call to i32*, !dbg !112
  store i32* %0, i32** %data, align 8, !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  %cmp = icmp eq i32* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !120
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !121
  %3 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !127
  %5 = load i32*, i32** %data, align 8, !dbg !128
  %6 = load i32*, i32** %data, align 8, !dbg !129
  %call2 = call i64 @wcslen(i32* %6) #9, !dbg !130
  %call3 = call i32* @wcsncat(i32* %arraydecay, i32* %5, i64 %call2) #7, !dbg !131
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !132
  store i32 0, i32* %arrayidx4, align 4, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %7), !dbg !135
  %8 = load i32*, i32** %data, align 8, !dbg !136
  %9 = bitcast i32* %8 to i8*, !dbg !136
  call void @free(i8* %9) #7, !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 32, column: 17, scope: !16)
!32 = !DILocation(line: 32, column: 9, scope: !16)
!33 = !DILocation(line: 33, column: 9, scope: !16)
!34 = !DILocation(line: 33, column: 21, scope: !16)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !17, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 41, column: 17, scope: !36)
!41 = !DILocation(line: 43, column: 17, scope: !36)
!42 = !DILocation(line: 43, column: 23, scope: !36)
!43 = !DILocation(line: 43, column: 36, scope: !36)
!44 = !DILocation(line: 43, column: 29, scope: !36)
!45 = !DILocation(line: 43, column: 9, scope: !36)
!46 = !DILocation(line: 44, column: 9, scope: !36)
!47 = !DILocation(line: 44, column: 20, scope: !36)
!48 = !DILocation(line: 45, column: 20, scope: !36)
!49 = !DILocation(line: 45, column: 9, scope: !36)
!50 = !DILocation(line: 46, column: 14, scope: !36)
!51 = !DILocation(line: 46, column: 9, scope: !36)
!52 = !DILocation(line: 48, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_15_good", scope: !17, file: !17, line: 110, type: !18, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 112, column: 5, scope: !53)
!55 = !DILocation(line: 113, column: 5, scope: !53)
!56 = !DILocation(line: 114, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 126, type: !58, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !17, line: 126, type: !7)
!64 = !DILocation(line: 126, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !17, line: 126, type: !60)
!66 = !DILocation(line: 126, column: 27, scope: !57)
!67 = !DILocation(line: 129, column: 22, scope: !57)
!68 = !DILocation(line: 129, column: 12, scope: !57)
!69 = !DILocation(line: 129, column: 5, scope: !57)
!70 = !DILocation(line: 131, column: 5, scope: !57)
!71 = !DILocation(line: 132, column: 5, scope: !57)
!72 = !DILocation(line: 133, column: 5, scope: !57)
!73 = !DILocation(line: 136, column: 5, scope: !57)
!74 = !DILocation(line: 137, column: 5, scope: !57)
!75 = !DILocation(line: 138, column: 5, scope: !57)
!76 = !DILocation(line: 140, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !17, line: 57, type: !4)
!79 = !DILocation(line: 57, column: 15, scope: !77)
!80 = !DILocation(line: 58, column: 23, scope: !77)
!81 = !DILocation(line: 58, column: 12, scope: !77)
!82 = !DILocation(line: 58, column: 10, scope: !77)
!83 = !DILocation(line: 59, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !17, line: 59, column: 9)
!85 = !DILocation(line: 59, column: 14, scope: !84)
!86 = !DILocation(line: 59, column: 9, scope: !77)
!87 = !DILocation(line: 59, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !17, line: 59, column: 23)
!89 = !DILocation(line: 68, column: 17, scope: !77)
!90 = !DILocation(line: 68, column: 9, scope: !77)
!91 = !DILocation(line: 69, column: 9, scope: !77)
!92 = !DILocation(line: 69, column: 20, scope: !77)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !17, line: 73, type: !37)
!94 = distinct !DILexicalBlock(scope: !77, file: !17, line: 72, column: 5)
!95 = !DILocation(line: 73, column: 17, scope: !94)
!96 = !DILocation(line: 75, column: 17, scope: !94)
!97 = !DILocation(line: 75, column: 23, scope: !94)
!98 = !DILocation(line: 75, column: 36, scope: !94)
!99 = !DILocation(line: 75, column: 29, scope: !94)
!100 = !DILocation(line: 75, column: 9, scope: !94)
!101 = !DILocation(line: 76, column: 9, scope: !94)
!102 = !DILocation(line: 76, column: 20, scope: !94)
!103 = !DILocation(line: 77, column: 20, scope: !94)
!104 = !DILocation(line: 77, column: 9, scope: !94)
!105 = !DILocation(line: 78, column: 14, scope: !94)
!106 = !DILocation(line: 78, column: 9, scope: !94)
!107 = !DILocation(line: 80, column: 1, scope: !77)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 83, type: !18, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 85, type: !4)
!110 = !DILocation(line: 85, column: 15, scope: !108)
!111 = !DILocation(line: 86, column: 23, scope: !108)
!112 = !DILocation(line: 86, column: 12, scope: !108)
!113 = !DILocation(line: 86, column: 10, scope: !108)
!114 = !DILocation(line: 87, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !17, line: 87, column: 9)
!116 = !DILocation(line: 87, column: 14, scope: !115)
!117 = !DILocation(line: 87, column: 9, scope: !108)
!118 = !DILocation(line: 87, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 87, column: 23)
!120 = !DILocation(line: 92, column: 17, scope: !108)
!121 = !DILocation(line: 92, column: 9, scope: !108)
!122 = !DILocation(line: 93, column: 9, scope: !108)
!123 = !DILocation(line: 93, column: 20, scope: !108)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !17, line: 101, type: !37)
!125 = distinct !DILexicalBlock(scope: !108, file: !17, line: 100, column: 5)
!126 = !DILocation(line: 101, column: 17, scope: !125)
!127 = !DILocation(line: 103, column: 17, scope: !125)
!128 = !DILocation(line: 103, column: 23, scope: !125)
!129 = !DILocation(line: 103, column: 36, scope: !125)
!130 = !DILocation(line: 103, column: 29, scope: !125)
!131 = !DILocation(line: 103, column: 9, scope: !125)
!132 = !DILocation(line: 104, column: 9, scope: !125)
!133 = !DILocation(line: 104, column: 20, scope: !125)
!134 = !DILocation(line: 105, column: 20, scope: !125)
!135 = !DILocation(line: 105, column: 9, scope: !125)
!136 = !DILocation(line: 106, column: 14, scope: !125)
!137 = !DILocation(line: 106, column: 9, scope: !125)
!138 = !DILocation(line: 108, column: 1, scope: !108)
