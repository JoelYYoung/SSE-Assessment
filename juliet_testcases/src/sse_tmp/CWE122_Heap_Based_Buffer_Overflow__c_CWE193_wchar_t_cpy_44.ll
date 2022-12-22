; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  call void %2(i32* %3), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !48
  %1 = load i32*, i32** %data.addr, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #6, !dbg !51
  %2 = load i32*, i32** %data.addr, align 8, !dbg !52
  call void @printWLine(i32* %2), !dbg !53
  %3 = load i32*, i32** %data.addr, align 8, !dbg !54
  %4 = bitcast i32* %3 to i8*, !dbg !54
  call void @free(i8* %4) #6, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !83, metadata !DIExpression()), !dbg !84
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  call void %2(i32* %3), !dbg !95
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !103
  %1 = load i32*, i32** %data.addr, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #6, !dbg !106
  %2 = load i32*, i32** %data.addr, align 8, !dbg !107
  call void @printWLine(i32* %2), !dbg !108
  %3 = load i32*, i32** %data.addr, align 8, !dbg !109
  %4 = bitcast i32* %3 to i8*, !dbg !109
  call void @free(i8* %4) #6, !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44_bad", scope: !17, file: !17, line: 39, type: !18, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 41, type: !4)
!21 = !DILocation(line: 41, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 43, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 43, column: 12, scope: !16)
!27 = !DILocation(line: 44, column: 10, scope: !16)
!28 = !DILocation(line: 46, column: 23, scope: !16)
!29 = !DILocation(line: 46, column: 12, scope: !16)
!30 = !DILocation(line: 46, column: 10, scope: !16)
!31 = !DILocation(line: 47, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 47, column: 9)
!33 = !DILocation(line: 47, column: 14, scope: !32)
!34 = !DILocation(line: 47, column: 9, scope: !16)
!35 = !DILocation(line: 47, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 47, column: 23)
!37 = !DILocation(line: 49, column: 5, scope: !16)
!38 = !DILocation(line: 49, column: 13, scope: !16)
!39 = !DILocation(line: 50, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 28, type: !24, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !17, line: 28, type: !4)
!42 = !DILocation(line: 28, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !17, line: 31, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 30, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 31, column: 17, scope: !44)
!49 = !DILocation(line: 33, column: 16, scope: !44)
!50 = !DILocation(line: 33, column: 22, scope: !44)
!51 = !DILocation(line: 33, column: 9, scope: !44)
!52 = !DILocation(line: 34, column: 20, scope: !44)
!53 = !DILocation(line: 34, column: 9, scope: !44)
!54 = !DILocation(line: 35, column: 14, scope: !44)
!55 = !DILocation(line: 35, column: 9, scope: !44)
!56 = !DILocation(line: 37, column: 1, scope: !40)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_44_good", scope: !17, file: !17, line: 79, type: !18, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 81, column: 5, scope: !57)
!59 = !DILocation(line: 82, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 93, type: !61, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !17, line: 93, type: !7)
!67 = !DILocation(line: 93, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !17, line: 93, type: !63)
!69 = !DILocation(line: 93, column: 27, scope: !60)
!70 = !DILocation(line: 96, column: 22, scope: !60)
!71 = !DILocation(line: 96, column: 12, scope: !60)
!72 = !DILocation(line: 96, column: 5, scope: !60)
!73 = !DILocation(line: 98, column: 5, scope: !60)
!74 = !DILocation(line: 99, column: 5, scope: !60)
!75 = !DILocation(line: 100, column: 5, scope: !60)
!76 = !DILocation(line: 103, column: 5, scope: !60)
!77 = !DILocation(line: 104, column: 5, scope: !60)
!78 = !DILocation(line: 105, column: 5, scope: !60)
!79 = !DILocation(line: 107, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 68, type: !18, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !17, line: 70, type: !4)
!82 = !DILocation(line: 70, column: 15, scope: !80)
!83 = !DILocalVariable(name: "funcPtr", scope: !80, file: !17, line: 71, type: !23)
!84 = !DILocation(line: 71, column: 12, scope: !80)
!85 = !DILocation(line: 72, column: 10, scope: !80)
!86 = !DILocation(line: 74, column: 23, scope: !80)
!87 = !DILocation(line: 74, column: 12, scope: !80)
!88 = !DILocation(line: 74, column: 10, scope: !80)
!89 = !DILocation(line: 75, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !17, line: 75, column: 9)
!91 = !DILocation(line: 75, column: 14, scope: !90)
!92 = !DILocation(line: 75, column: 9, scope: !80)
!93 = !DILocation(line: 75, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 75, column: 23)
!95 = !DILocation(line: 76, column: 5, scope: !80)
!96 = !DILocation(line: 76, column: 13, scope: !80)
!97 = !DILocation(line: 77, column: 1, scope: !80)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 57, type: !24, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !17, line: 57, type: !4)
!100 = !DILocation(line: 57, column: 35, scope: !98)
!101 = !DILocalVariable(name: "source", scope: !102, file: !17, line: 60, type: !45)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 59, column: 5)
!103 = !DILocation(line: 60, column: 17, scope: !102)
!104 = !DILocation(line: 62, column: 16, scope: !102)
!105 = !DILocation(line: 62, column: 22, scope: !102)
!106 = !DILocation(line: 62, column: 9, scope: !102)
!107 = !DILocation(line: 63, column: 20, scope: !102)
!108 = !DILocation(line: 63, column: 9, scope: !102)
!109 = !DILocation(line: 64, column: 14, scope: !102)
!110 = !DILocation(line: 64, column: 9, scope: !102)
!111 = !DILocation(line: 66, column: 1, scope: !98)
