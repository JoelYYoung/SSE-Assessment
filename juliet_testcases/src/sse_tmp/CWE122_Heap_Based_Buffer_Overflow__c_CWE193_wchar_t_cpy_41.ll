; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_badSink.source to i8*), i64 44, i1 false), !dbg !27
  %1 = load i32*, i32** %data.addr, align 8, !dbg !28
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !29
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #6, !dbg !30
  %2 = load i32*, i32** %data.addr, align 8, !dbg !31
  call void @printWLine(i32* %2), !dbg !32
  %3 = load i32*, i32** %data.addr, align 8, !dbg !33
  %4 = bitcast i32* %3 to i8*, !dbg !33
  call void @free(i8* %4) #6, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  store i32* null, i32** %data, align 8, !dbg !41
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !42
  %0 = bitcast i8* %call to i32*, !dbg !43
  store i32* %0, i32** %data, align 8, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %cmp = icmp eq i32* %1, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_badSink(i32* %2), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_goodG2BSink(i32* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !57, metadata !DIExpression()), !dbg !59
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !59
  %1 = load i32*, i32** %data.addr, align 8, !dbg !60
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !61
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #6, !dbg !62
  %2 = load i32*, i32** %data.addr, align 8, !dbg !63
  call void @printWLine(i32* %2), !dbg !64
  %3 = load i32*, i32** %data.addr, align 8, !dbg !65
  %4 = bitcast i32* %3 to i8*, !dbg !65
  call void @free(i8* %4) #6, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !95
  %0 = bitcast i8* %call to i32*, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_goodG2BSink(i32* %2), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_badSink", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 28, type: !4)
!21 = !DILocation(line: 28, column: 83, scope: !16)
!22 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 31, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 11)
!27 = !DILocation(line: 31, column: 17, scope: !23)
!28 = !DILocation(line: 33, column: 16, scope: !23)
!29 = !DILocation(line: 33, column: 22, scope: !23)
!30 = !DILocation(line: 33, column: 9, scope: !23)
!31 = !DILocation(line: 34, column: 20, scope: !23)
!32 = !DILocation(line: 34, column: 9, scope: !23)
!33 = !DILocation(line: 35, column: 14, scope: !23)
!34 = !DILocation(line: 35, column: 9, scope: !23)
!35 = !DILocation(line: 37, column: 1, scope: !16)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_bad", scope: !17, file: !17, line: 39, type: !37, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !17, line: 41, type: !4)
!40 = !DILocation(line: 41, column: 15, scope: !36)
!41 = !DILocation(line: 42, column: 10, scope: !36)
!42 = !DILocation(line: 44, column: 23, scope: !36)
!43 = !DILocation(line: 44, column: 12, scope: !36)
!44 = !DILocation(line: 44, column: 10, scope: !36)
!45 = !DILocation(line: 45, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !36, file: !17, line: 45, column: 9)
!47 = !DILocation(line: 45, column: 14, scope: !46)
!48 = !DILocation(line: 45, column: 9, scope: !36)
!49 = !DILocation(line: 45, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !17, line: 45, column: 23)
!51 = !DILocation(line: 46, column: 72, scope: !36)
!52 = !DILocation(line: 46, column: 5, scope: !36)
!53 = !DILocation(line: 47, column: 1, scope: !36)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_goodG2BSink", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !17, line: 53, type: !4)
!56 = !DILocation(line: 53, column: 87, scope: !54)
!57 = !DILocalVariable(name: "source", scope: !58, file: !17, line: 56, type: !24)
!58 = distinct !DILexicalBlock(scope: !54, file: !17, line: 55, column: 5)
!59 = !DILocation(line: 56, column: 17, scope: !58)
!60 = !DILocation(line: 58, column: 16, scope: !58)
!61 = !DILocation(line: 58, column: 22, scope: !58)
!62 = !DILocation(line: 58, column: 9, scope: !58)
!63 = !DILocation(line: 59, column: 20, scope: !58)
!64 = !DILocation(line: 59, column: 9, scope: !58)
!65 = !DILocation(line: 60, column: 14, scope: !58)
!66 = !DILocation(line: 60, column: 9, scope: !58)
!67 = !DILocation(line: 62, column: 1, scope: !54)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_41_good", scope: !17, file: !17, line: 75, type: !37, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 77, column: 5, scope: !68)
!70 = !DILocation(line: 78, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 90, type: !72, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!7, !7, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !17, line: 90, type: !7)
!78 = !DILocation(line: 90, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !17, line: 90, type: !74)
!80 = !DILocation(line: 90, column: 27, scope: !71)
!81 = !DILocation(line: 93, column: 22, scope: !71)
!82 = !DILocation(line: 93, column: 12, scope: !71)
!83 = !DILocation(line: 93, column: 5, scope: !71)
!84 = !DILocation(line: 95, column: 5, scope: !71)
!85 = !DILocation(line: 96, column: 5, scope: !71)
!86 = !DILocation(line: 97, column: 5, scope: !71)
!87 = !DILocation(line: 100, column: 5, scope: !71)
!88 = !DILocation(line: 101, column: 5, scope: !71)
!89 = !DILocation(line: 102, column: 5, scope: !71)
!90 = !DILocation(line: 104, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 65, type: !37, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 67, type: !4)
!93 = !DILocation(line: 67, column: 15, scope: !91)
!94 = !DILocation(line: 68, column: 10, scope: !91)
!95 = !DILocation(line: 70, column: 23, scope: !91)
!96 = !DILocation(line: 70, column: 12, scope: !91)
!97 = !DILocation(line: 70, column: 10, scope: !91)
!98 = !DILocation(line: 71, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !91, file: !17, line: 71, column: 9)
!100 = !DILocation(line: 71, column: 14, scope: !99)
!101 = !DILocation(line: 71, column: 9, scope: !91)
!102 = !DILocation(line: 71, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 71, column: 23)
!104 = !DILocation(line: 72, column: 76, scope: !91)
!105 = !DILocation(line: 72, column: 5, scope: !91)
!106 = !DILocation(line: 73, column: 1, scope: !91)
