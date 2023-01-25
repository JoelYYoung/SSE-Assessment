; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18_bad() #0 !dbg !16 {
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
  br label %source, !dbg !31

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  %call2 = call i64 @wcslen(i32* %6) #9, !dbg !47
  %call3 = call i32* @wcsncpy(i32* %arraydecay, i32* %5, i64 %call2) #7, !dbg !48
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !49
  store i32 0, i32* %arrayidx4, align 4, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %7), !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %9 = bitcast i32* %8 to i8*, !dbg !53
  call void @free(i8* %9) #7, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !82
  %0 = bitcast i8* %call to i32*, !dbg !83
  store i32* %0, i32** %data, align 8, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  br label %source, !dbg !91

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !92), !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  %call2 = call i64 @wcslen(i32* %6) #9, !dbg !104
  %call3 = call i32* @wcsncpy(i32* %arraydecay, i32* %5, i64 %call2) #7, !dbg !105
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !106
  store i32 0, i32* %arrayidx4, align 4, !dbg !107
  %7 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %7), !dbg !109
  %8 = load i32*, i32** %data, align 8, !dbg !110
  %9 = bitcast i32* %8 to i8*, !dbg !110
  call void @free(i8* %9) #7, !dbg !111
  ret void, !dbg !112
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 5, scope: !16)
!32 = !DILabel(scope: !16, name: "source", file: !17, line: 29)
!33 = !DILocation(line: 29, column: 1, scope: !16)
!34 = !DILocation(line: 31, column: 13, scope: !16)
!35 = !DILocation(line: 31, column: 5, scope: !16)
!36 = !DILocation(line: 32, column: 5, scope: !16)
!37 = !DILocation(line: 32, column: 17, scope: !16)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !17, line: 34, type: !40)
!39 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 34, column: 17, scope: !39)
!44 = !DILocation(line: 36, column: 17, scope: !39)
!45 = !DILocation(line: 36, column: 23, scope: !39)
!46 = !DILocation(line: 36, column: 36, scope: !39)
!47 = !DILocation(line: 36, column: 29, scope: !39)
!48 = !DILocation(line: 36, column: 9, scope: !39)
!49 = !DILocation(line: 37, column: 9, scope: !39)
!50 = !DILocation(line: 37, column: 20, scope: !39)
!51 = !DILocation(line: 38, column: 20, scope: !39)
!52 = !DILocation(line: 38, column: 9, scope: !39)
!53 = !DILocation(line: 39, column: 14, scope: !39)
!54 = !DILocation(line: 39, column: 9, scope: !39)
!55 = !DILocation(line: 41, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_18_good", scope: !17, file: !17, line: 68, type: !18, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 70, column: 5, scope: !56)
!58 = !DILocation(line: 71, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 83, type: !60, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !17, line: 83, type: !7)
!66 = !DILocation(line: 83, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !17, line: 83, type: !62)
!68 = !DILocation(line: 83, column: 27, scope: !59)
!69 = !DILocation(line: 86, column: 22, scope: !59)
!70 = !DILocation(line: 86, column: 12, scope: !59)
!71 = !DILocation(line: 86, column: 5, scope: !59)
!72 = !DILocation(line: 88, column: 5, scope: !59)
!73 = !DILocation(line: 89, column: 5, scope: !59)
!74 = !DILocation(line: 90, column: 5, scope: !59)
!75 = !DILocation(line: 93, column: 5, scope: !59)
!76 = !DILocation(line: 94, column: 5, scope: !59)
!77 = !DILocation(line: 95, column: 5, scope: !59)
!78 = !DILocation(line: 97, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 48, type: !18, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 50, type: !4)
!81 = !DILocation(line: 50, column: 15, scope: !79)
!82 = !DILocation(line: 51, column: 23, scope: !79)
!83 = !DILocation(line: 51, column: 12, scope: !79)
!84 = !DILocation(line: 51, column: 10, scope: !79)
!85 = !DILocation(line: 52, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !17, line: 52, column: 9)
!87 = !DILocation(line: 52, column: 14, scope: !86)
!88 = !DILocation(line: 52, column: 9, scope: !79)
!89 = !DILocation(line: 52, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !17, line: 52, column: 23)
!91 = !DILocation(line: 53, column: 5, scope: !79)
!92 = !DILabel(scope: !79, name: "source", file: !17, line: 54)
!93 = !DILocation(line: 54, column: 1, scope: !79)
!94 = !DILocation(line: 56, column: 13, scope: !79)
!95 = !DILocation(line: 56, column: 5, scope: !79)
!96 = !DILocation(line: 57, column: 5, scope: !79)
!97 = !DILocation(line: 57, column: 16, scope: !79)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !17, line: 59, type: !40)
!99 = distinct !DILexicalBlock(scope: !79, file: !17, line: 58, column: 5)
!100 = !DILocation(line: 59, column: 17, scope: !99)
!101 = !DILocation(line: 61, column: 17, scope: !99)
!102 = !DILocation(line: 61, column: 23, scope: !99)
!103 = !DILocation(line: 61, column: 36, scope: !99)
!104 = !DILocation(line: 61, column: 29, scope: !99)
!105 = !DILocation(line: 61, column: 9, scope: !99)
!106 = !DILocation(line: 62, column: 9, scope: !99)
!107 = !DILocation(line: 62, column: 20, scope: !99)
!108 = !DILocation(line: 63, column: 20, scope: !99)
!109 = !DILocation(line: 63, column: 9, scope: !99)
!110 = !DILocation(line: 64, column: 14, scope: !99)
!111 = !DILocation(line: 64, column: 9, scope: !99)
!112 = !DILocation(line: 66, column: 1, scope: !79)
