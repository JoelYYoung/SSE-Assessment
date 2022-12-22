; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_badSink.source to i8*), i64 44, i1 false), !dbg !27
  %1 = load i32*, i32** %data.addr, align 8, !dbg !28
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !29
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !30
  %call = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !31
  %add = add i64 %call, 1, !dbg !32
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay, i64 %add) #8, !dbg !33
  %2 = load i32*, i32** %data.addr, align 8, !dbg !34
  call void @printWLine(i32* %2), !dbg !35
  %3 = load i32*, i32** %data.addr, align 8, !dbg !36
  %4 = bitcast i32* %3 to i8*, !dbg !36
  call void @free(i8* %4) #8, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_bad() #0 !dbg !39 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !DIExpression()), !dbg !43
  store i32* null, i32** %data, align 8, !dbg !44
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !45
  %0 = bitcast i8* %call to i32*, !dbg !46
  store i32* %0, i32** %data, align 8, !dbg !47
  %1 = load i32*, i32** %data, align 8, !dbg !48
  %cmp = icmp eq i32* %1, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_badSink(i32* %2), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !60, metadata !DIExpression()), !dbg !62
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !62
  %1 = load i32*, i32** %data.addr, align 8, !dbg !63
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !64
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !65
  %call = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !66
  %add = add i64 %call, 1, !dbg !67
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay, i64 %add) #8, !dbg !68
  %2 = load i32*, i32** %data.addr, align 8, !dbg !69
  call void @printWLine(i32* %2), !dbg !70
  %3 = load i32*, i32** %data.addr, align 8, !dbg !71
  %4 = bitcast i32* %3 to i8*, !dbg !71
  call void @free(i8* %4) #8, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #8, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #8, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32* null, i32** %data, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_goodG2BSink(i32* %2), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_badSink", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 28, type: !4)
!21 = !DILocation(line: 28, column: 84, scope: !16)
!22 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 31, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 11)
!27 = !DILocation(line: 31, column: 17, scope: !23)
!28 = !DILocation(line: 34, column: 17, scope: !23)
!29 = !DILocation(line: 34, column: 23, scope: !23)
!30 = !DILocation(line: 34, column: 38, scope: !23)
!31 = !DILocation(line: 34, column: 31, scope: !23)
!32 = !DILocation(line: 34, column: 46, scope: !23)
!33 = !DILocation(line: 34, column: 9, scope: !23)
!34 = !DILocation(line: 35, column: 20, scope: !23)
!35 = !DILocation(line: 35, column: 9, scope: !23)
!36 = !DILocation(line: 36, column: 14, scope: !23)
!37 = !DILocation(line: 36, column: 9, scope: !23)
!38 = !DILocation(line: 38, column: 1, scope: !16)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_bad", scope: !17, file: !17, line: 40, type: !40, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !17, line: 42, type: !4)
!43 = !DILocation(line: 42, column: 15, scope: !39)
!44 = !DILocation(line: 43, column: 10, scope: !39)
!45 = !DILocation(line: 45, column: 23, scope: !39)
!46 = !DILocation(line: 45, column: 12, scope: !39)
!47 = !DILocation(line: 45, column: 10, scope: !39)
!48 = !DILocation(line: 46, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !39, file: !17, line: 46, column: 9)
!50 = !DILocation(line: 46, column: 14, scope: !49)
!51 = !DILocation(line: 46, column: 9, scope: !39)
!52 = !DILocation(line: 46, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !17, line: 46, column: 23)
!54 = !DILocation(line: 47, column: 73, scope: !39)
!55 = !DILocation(line: 47, column: 5, scope: !39)
!56 = !DILocation(line: 48, column: 1, scope: !39)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_goodG2BSink", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !17, line: 54, type: !4)
!59 = !DILocation(line: 54, column: 88, scope: !57)
!60 = !DILocalVariable(name: "source", scope: !61, file: !17, line: 57, type: !24)
!61 = distinct !DILexicalBlock(scope: !57, file: !17, line: 56, column: 5)
!62 = !DILocation(line: 57, column: 17, scope: !61)
!63 = !DILocation(line: 60, column: 17, scope: !61)
!64 = !DILocation(line: 60, column: 23, scope: !61)
!65 = !DILocation(line: 60, column: 38, scope: !61)
!66 = !DILocation(line: 60, column: 31, scope: !61)
!67 = !DILocation(line: 60, column: 46, scope: !61)
!68 = !DILocation(line: 60, column: 9, scope: !61)
!69 = !DILocation(line: 61, column: 20, scope: !61)
!70 = !DILocation(line: 61, column: 9, scope: !61)
!71 = !DILocation(line: 62, column: 14, scope: !61)
!72 = !DILocation(line: 62, column: 9, scope: !61)
!73 = !DILocation(line: 64, column: 1, scope: !57)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_41_good", scope: !17, file: !17, line: 77, type: !40, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 79, column: 5, scope: !74)
!76 = !DILocation(line: 80, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 92, type: !78, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !17, line: 92, type: !7)
!84 = !DILocation(line: 92, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !17, line: 92, type: !80)
!86 = !DILocation(line: 92, column: 27, scope: !77)
!87 = !DILocation(line: 95, column: 22, scope: !77)
!88 = !DILocation(line: 95, column: 12, scope: !77)
!89 = !DILocation(line: 95, column: 5, scope: !77)
!90 = !DILocation(line: 97, column: 5, scope: !77)
!91 = !DILocation(line: 98, column: 5, scope: !77)
!92 = !DILocation(line: 99, column: 5, scope: !77)
!93 = !DILocation(line: 102, column: 5, scope: !77)
!94 = !DILocation(line: 103, column: 5, scope: !77)
!95 = !DILocation(line: 104, column: 5, scope: !77)
!96 = !DILocation(line: 106, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 67, type: !40, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !17, line: 69, type: !4)
!99 = !DILocation(line: 69, column: 15, scope: !97)
!100 = !DILocation(line: 70, column: 10, scope: !97)
!101 = !DILocation(line: 72, column: 23, scope: !97)
!102 = !DILocation(line: 72, column: 12, scope: !97)
!103 = !DILocation(line: 72, column: 10, scope: !97)
!104 = !DILocation(line: 73, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !17, line: 73, column: 9)
!106 = !DILocation(line: 73, column: 14, scope: !105)
!107 = !DILocation(line: 73, column: 9, scope: !97)
!108 = !DILocation(line: 73, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 73, column: 23)
!110 = !DILocation(line: 74, column: 77, scope: !97)
!111 = !DILocation(line: 74, column: 5, scope: !97)
!112 = !DILocation(line: 75, column: 1, scope: !97)
