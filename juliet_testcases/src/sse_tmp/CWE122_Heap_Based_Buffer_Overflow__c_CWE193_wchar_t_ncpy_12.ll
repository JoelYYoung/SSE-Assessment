; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !36

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !37
  %2 = bitcast i8* %call3 to i32*, !dbg !39
  store i32* %2, i32** %data, align 8, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %cmp4 = icmp eq i32* %3, null, !dbg !43
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !44

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !45
  unreachable, !dbg !45

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_bad.source to i8*), i64 44, i1 false), !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %arraydecay8 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !56
  %add = add i64 %call9, 1, !dbg !57
  %call10 = call i32* @wcsncpy(i32* %5, i32* %arraydecay, i64 %add) #7, !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %6), !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %8 = bitcast i32* %7 to i8*, !dbg !61
  call void @free(i8* %8) #7, !dbg !62
  ret void, !dbg !63
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
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_good() #0 !dbg !64 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !94
  %0 = bitcast i8* %call1 to i32*, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then2, label %if.end, !dbg !101

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !104

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !105
  %2 = bitcast i8* %call3 to i32*, !dbg !107
  store i32* %2, i32** %data, align 8, !dbg !108
  %3 = load i32*, i32** %data, align 8, !dbg !109
  %cmp4 = icmp eq i32* %3, null, !dbg !111
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !112

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !119
  %arraydecay8 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !120
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !121
  %add = add i64 %call9, 1, !dbg !122
  %call10 = call i32* @wcsncpy(i32* %5, i32* %arraydecay, i64 %add) #7, !dbg !123
  %6 = load i32*, i32** %data, align 8, !dbg !124
  call void @printWLine(i32* %6), !dbg !125
  %7 = load i32*, i32** %data, align 8, !dbg !126
  %8 = bitcast i32* %7 to i8*, !dbg !126
  call void @free(i8* %8) #7, !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!53 = !DILocation(line: 48, column: 17, scope: !48)
!54 = !DILocation(line: 48, column: 23, scope: !48)
!55 = !DILocation(line: 48, column: 38, scope: !48)
!56 = !DILocation(line: 48, column: 31, scope: !48)
!57 = !DILocation(line: 48, column: 46, scope: !48)
!58 = !DILocation(line: 48, column: 9, scope: !48)
!59 = !DILocation(line: 49, column: 20, scope: !48)
!60 = !DILocation(line: 49, column: 9, scope: !48)
!61 = !DILocation(line: 50, column: 14, scope: !48)
!62 = !DILocation(line: 50, column: 9, scope: !48)
!63 = !DILocation(line: 52, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_12_good", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 88, column: 5, scope: !64)
!66 = !DILocation(line: 89, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 101, type: !68, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 101, type: !7)
!74 = !DILocation(line: 101, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 101, type: !70)
!76 = !DILocation(line: 101, column: 27, scope: !67)
!77 = !DILocation(line: 104, column: 22, scope: !67)
!78 = !DILocation(line: 104, column: 12, scope: !67)
!79 = !DILocation(line: 104, column: 5, scope: !67)
!80 = !DILocation(line: 106, column: 5, scope: !67)
!81 = !DILocation(line: 107, column: 5, scope: !67)
!82 = !DILocation(line: 108, column: 5, scope: !67)
!83 = !DILocation(line: 111, column: 5, scope: !67)
!84 = !DILocation(line: 112, column: 5, scope: !67)
!85 = !DILocation(line: 113, column: 5, scope: !67)
!86 = !DILocation(line: 115, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 62, type: !4)
!89 = !DILocation(line: 62, column: 15, scope: !87)
!90 = !DILocation(line: 63, column: 10, scope: !87)
!91 = !DILocation(line: 64, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !17, line: 64, column: 8)
!93 = !DILocation(line: 64, column: 8, scope: !87)
!94 = !DILocation(line: 67, column: 27, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !17, line: 65, column: 5)
!96 = !DILocation(line: 67, column: 16, scope: !95)
!97 = !DILocation(line: 67, column: 14, scope: !95)
!98 = !DILocation(line: 68, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 68, column: 13)
!100 = !DILocation(line: 68, column: 18, scope: !99)
!101 = !DILocation(line: 68, column: 13, scope: !95)
!102 = !DILocation(line: 68, column: 28, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 68, column: 27)
!104 = !DILocation(line: 69, column: 5, scope: !95)
!105 = !DILocation(line: 73, column: 27, scope: !106)
!106 = distinct !DILexicalBlock(scope: !92, file: !17, line: 71, column: 5)
!107 = !DILocation(line: 73, column: 16, scope: !106)
!108 = !DILocation(line: 73, column: 14, scope: !106)
!109 = !DILocation(line: 74, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 74, column: 13)
!111 = !DILocation(line: 74, column: 18, scope: !110)
!112 = !DILocation(line: 74, column: 13, scope: !106)
!113 = !DILocation(line: 74, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 74, column: 27)
!115 = !DILocalVariable(name: "source", scope: !116, file: !17, line: 77, type: !49)
!116 = distinct !DILexicalBlock(scope: !87, file: !17, line: 76, column: 5)
!117 = !DILocation(line: 77, column: 17, scope: !116)
!118 = !DILocation(line: 80, column: 17, scope: !116)
!119 = !DILocation(line: 80, column: 23, scope: !116)
!120 = !DILocation(line: 80, column: 38, scope: !116)
!121 = !DILocation(line: 80, column: 31, scope: !116)
!122 = !DILocation(line: 80, column: 46, scope: !116)
!123 = !DILocation(line: 80, column: 9, scope: !116)
!124 = !DILocation(line: 81, column: 20, scope: !116)
!125 = !DILocation(line: 81, column: 9, scope: !116)
!126 = !DILocation(line: 82, column: 14, scope: !116)
!127 = !DILocation(line: 82, column: 9, scope: !116)
!128 = !DILocation(line: 84, column: 1, scope: !87)
