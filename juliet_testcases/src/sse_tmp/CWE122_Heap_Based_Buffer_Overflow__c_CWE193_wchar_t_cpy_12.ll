; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !36

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !37
  %2 = bitcast i8* %call3 to i32*, !dbg !39
  store i32* %2, i32** %data, align 8, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %cmp4 = icmp eq i32* %3, null, !dbg !43
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !44

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !45
  unreachable, !dbg !45

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_bad.source to i8*), i64 44, i1 false), !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call8 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %6), !dbg !57
  %7 = load i32*, i32** %data, align 8, !dbg !58
  %8 = bitcast i32* %7 to i8*, !dbg !58
  call void @free(i8* %8) #6, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !91
  %0 = bitcast i8* %call1 to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then2, label %if.end, !dbg !98

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !101

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !102
  %2 = bitcast i8* %call3 to i32*, !dbg !104
  store i32* %2, i32** %data, align 8, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %cmp4 = icmp eq i32* %3, null, !dbg !108
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !109

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !116
  %call8 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !117
  %6 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %6), !dbg !119
  %7 = load i32*, i32** %data, align 8, !dbg !120
  %8 = bitcast i32* %7 to i8*, !dbg !120
  call void @free(i8* %8) #6, !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 8)
!25 = !DILocation(line: 32, column: 8, scope: !16)
!26 = !DILocation(line: 35, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 33, column: 5)
!28 = !DILocation(line: 35, column: 16, scope: !27)
!29 = !DILocation(line: 35, column: 14, scope: !27)
!30 = !DILocation(line: 36, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 36, column: 13)
!32 = !DILocation(line: 36, column: 18, scope: !31)
!33 = !DILocation(line: 36, column: 13, scope: !27)
!34 = !DILocation(line: 36, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 36, column: 27)
!36 = !DILocation(line: 37, column: 5, scope: !27)
!37 = !DILocation(line: 41, column: 27, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !17, line: 39, column: 5)
!39 = !DILocation(line: 41, column: 16, scope: !38)
!40 = !DILocation(line: 41, column: 14, scope: !38)
!41 = !DILocation(line: 42, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !17, line: 42, column: 13)
!43 = !DILocation(line: 42, column: 18, scope: !42)
!44 = !DILocation(line: 42, column: 13, scope: !38)
!45 = !DILocation(line: 42, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !17, line: 42, column: 27)
!47 = !DILocalVariable(name: "source", scope: !48, file: !17, line: 45, type: !49)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 45, column: 17, scope: !48)
!53 = !DILocation(line: 47, column: 16, scope: !48)
!54 = !DILocation(line: 47, column: 22, scope: !48)
!55 = !DILocation(line: 47, column: 9, scope: !48)
!56 = !DILocation(line: 48, column: 20, scope: !48)
!57 = !DILocation(line: 48, column: 9, scope: !48)
!58 = !DILocation(line: 49, column: 14, scope: !48)
!59 = !DILocation(line: 49, column: 9, scope: !48)
!60 = !DILocation(line: 51, column: 1, scope: !16)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_12_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 86, column: 5, scope: !61)
!63 = !DILocation(line: 87, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !65, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 99, type: !7)
!71 = !DILocation(line: 99, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 99, type: !67)
!73 = !DILocation(line: 99, column: 27, scope: !64)
!74 = !DILocation(line: 102, column: 22, scope: !64)
!75 = !DILocation(line: 102, column: 12, scope: !64)
!76 = !DILocation(line: 102, column: 5, scope: !64)
!77 = !DILocation(line: 104, column: 5, scope: !64)
!78 = !DILocation(line: 105, column: 5, scope: !64)
!79 = !DILocation(line: 106, column: 5, scope: !64)
!80 = !DILocation(line: 109, column: 5, scope: !64)
!81 = !DILocation(line: 110, column: 5, scope: !64)
!82 = !DILocation(line: 111, column: 5, scope: !64)
!83 = !DILocation(line: 113, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 61, type: !4)
!86 = !DILocation(line: 61, column: 15, scope: !84)
!87 = !DILocation(line: 62, column: 10, scope: !84)
!88 = !DILocation(line: 63, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !17, line: 63, column: 8)
!90 = !DILocation(line: 63, column: 8, scope: !84)
!91 = !DILocation(line: 66, column: 27, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !17, line: 64, column: 5)
!93 = !DILocation(line: 66, column: 16, scope: !92)
!94 = !DILocation(line: 66, column: 14, scope: !92)
!95 = !DILocation(line: 67, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 67, column: 13)
!97 = !DILocation(line: 67, column: 18, scope: !96)
!98 = !DILocation(line: 67, column: 13, scope: !92)
!99 = !DILocation(line: 67, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 67, column: 27)
!101 = !DILocation(line: 68, column: 5, scope: !92)
!102 = !DILocation(line: 72, column: 27, scope: !103)
!103 = distinct !DILexicalBlock(scope: !89, file: !17, line: 70, column: 5)
!104 = !DILocation(line: 72, column: 16, scope: !103)
!105 = !DILocation(line: 72, column: 14, scope: !103)
!106 = !DILocation(line: 73, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !17, line: 73, column: 13)
!108 = !DILocation(line: 73, column: 18, scope: !107)
!109 = !DILocation(line: 73, column: 13, scope: !103)
!110 = !DILocation(line: 73, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !17, line: 73, column: 27)
!112 = !DILocalVariable(name: "source", scope: !113, file: !17, line: 76, type: !49)
!113 = distinct !DILexicalBlock(scope: !84, file: !17, line: 75, column: 5)
!114 = !DILocation(line: 76, column: 17, scope: !113)
!115 = !DILocation(line: 78, column: 16, scope: !113)
!116 = !DILocation(line: 78, column: 22, scope: !113)
!117 = !DILocation(line: 78, column: 9, scope: !113)
!118 = !DILocation(line: 79, column: 20, scope: !113)
!119 = !DILocation(line: 79, column: 9, scope: !113)
!120 = !DILocation(line: 80, column: 14, scope: !113)
!121 = !DILocation(line: 80, column: 9, scope: !113)
!122 = !DILocation(line: 82, column: 1, scope: !84)
