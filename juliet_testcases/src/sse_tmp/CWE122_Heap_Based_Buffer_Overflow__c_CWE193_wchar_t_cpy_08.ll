; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

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
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_bad.source to i8*), i64 44, i1 false), !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call4 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %4), !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %6 = bitcast i32* %5 to i8*, !dbg !48
  call void @free(i8* %6) #6, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !75 {
entry:
  ret i32 1, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %call = call i32 @staticReturnsFalse(), !dbg !83
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end3, !dbg !88

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !89
  %0 = bitcast i8* %call1 to i32*, !dbg !91
  store i32* %0, i32** %data, align 8, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %cmp = icmp eq i32* %1, null, !dbg !95
  br i1 %cmp, label %if.then2, label %if.end, !dbg !96

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %call4 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %4), !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %6 = bitcast i32* %5 to i8*, !dbg !107
  call void @free(i8* %6) #6, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !110 {
entry:
  ret i32 0, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %call = call i32 @staticReturnsTrue(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end3, !dbg !118

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !119
  %0 = bitcast i8* %call1 to i32*, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then2, label %if.end, !dbg !126

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !132
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !134
  %call4 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !135
  %4 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %4), !dbg !137
  %5 = load i32*, i32** %data, align 8, !dbg !138
  %6 = bitcast i32* %5 to i8*, !dbg !138
  call void @free(i8* %6) #6, !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_bad", scope: !17, file: !17, line: 42, type: !18, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 44, type: !4)
!21 = !DILocation(line: 44, column: 15, scope: !16)
!22 = !DILocation(line: 45, column: 10, scope: !16)
!23 = !DILocation(line: 46, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 46, column: 8)
!25 = !DILocation(line: 46, column: 8, scope: !16)
!26 = !DILocation(line: 49, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 47, column: 5)
!28 = !DILocation(line: 49, column: 16, scope: !27)
!29 = !DILocation(line: 49, column: 14, scope: !27)
!30 = !DILocation(line: 50, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 50, column: 13)
!32 = !DILocation(line: 50, column: 18, scope: !31)
!33 = !DILocation(line: 50, column: 13, scope: !27)
!34 = !DILocation(line: 50, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 50, column: 27)
!36 = !DILocation(line: 51, column: 5, scope: !27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 53, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 52, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 53, column: 17, scope: !38)
!43 = !DILocation(line: 55, column: 16, scope: !38)
!44 = !DILocation(line: 55, column: 22, scope: !38)
!45 = !DILocation(line: 55, column: 9, scope: !38)
!46 = !DILocation(line: 56, column: 20, scope: !38)
!47 = !DILocation(line: 56, column: 9, scope: !38)
!48 = !DILocation(line: 57, column: 14, scope: !38)
!49 = !DILocation(line: 57, column: 9, scope: !38)
!50 = !DILocation(line: 59, column: 1, scope: !16)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_08_good", scope: !17, file: !17, line: 110, type: !18, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 112, column: 5, scope: !51)
!53 = !DILocation(line: 113, column: 5, scope: !51)
!54 = !DILocation(line: 114, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 126, type: !56, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !17, line: 126, type: !7)
!62 = !DILocation(line: 126, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !17, line: 126, type: !58)
!64 = !DILocation(line: 126, column: 27, scope: !55)
!65 = !DILocation(line: 129, column: 22, scope: !55)
!66 = !DILocation(line: 129, column: 12, scope: !55)
!67 = !DILocation(line: 129, column: 5, scope: !55)
!68 = !DILocation(line: 131, column: 5, scope: !55)
!69 = !DILocation(line: 132, column: 5, scope: !55)
!70 = !DILocation(line: 133, column: 5, scope: !55)
!71 = !DILocation(line: 136, column: 5, scope: !55)
!72 = !DILocation(line: 137, column: 5, scope: !55)
!73 = !DILocation(line: 138, column: 5, scope: !55)
!74 = !DILocation(line: 140, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 30, type: !76, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!7}
!78 = !DILocation(line: 32, column: 5, scope: !75)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 66, type: !18, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 68, type: !4)
!81 = !DILocation(line: 68, column: 15, scope: !79)
!82 = !DILocation(line: 69, column: 10, scope: !79)
!83 = !DILocation(line: 70, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !17, line: 70, column: 8)
!85 = !DILocation(line: 70, column: 8, scope: !79)
!86 = !DILocation(line: 73, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !17, line: 71, column: 5)
!88 = !DILocation(line: 74, column: 5, scope: !87)
!89 = !DILocation(line: 78, column: 27, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !17, line: 76, column: 5)
!91 = !DILocation(line: 78, column: 16, scope: !90)
!92 = !DILocation(line: 78, column: 14, scope: !90)
!93 = !DILocation(line: 79, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 79, column: 13)
!95 = !DILocation(line: 79, column: 18, scope: !94)
!96 = !DILocation(line: 79, column: 13, scope: !90)
!97 = !DILocation(line: 79, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !17, line: 79, column: 27)
!99 = !DILocalVariable(name: "source", scope: !100, file: !17, line: 82, type: !39)
!100 = distinct !DILexicalBlock(scope: !79, file: !17, line: 81, column: 5)
!101 = !DILocation(line: 82, column: 17, scope: !100)
!102 = !DILocation(line: 84, column: 16, scope: !100)
!103 = !DILocation(line: 84, column: 22, scope: !100)
!104 = !DILocation(line: 84, column: 9, scope: !100)
!105 = !DILocation(line: 85, column: 20, scope: !100)
!106 = !DILocation(line: 85, column: 9, scope: !100)
!107 = !DILocation(line: 86, column: 14, scope: !100)
!108 = !DILocation(line: 86, column: 9, scope: !100)
!109 = !DILocation(line: 88, column: 1, scope: !79)
!110 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 35, type: !76, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 37, column: 5, scope: !110)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 91, type: !18, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 93, type: !4)
!114 = !DILocation(line: 93, column: 15, scope: !112)
!115 = !DILocation(line: 94, column: 10, scope: !112)
!116 = !DILocation(line: 95, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !17, line: 95, column: 8)
!118 = !DILocation(line: 95, column: 8, scope: !112)
!119 = !DILocation(line: 98, column: 27, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !17, line: 96, column: 5)
!121 = !DILocation(line: 98, column: 16, scope: !120)
!122 = !DILocation(line: 98, column: 14, scope: !120)
!123 = !DILocation(line: 99, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 99, column: 13)
!125 = !DILocation(line: 99, column: 18, scope: !124)
!126 = !DILocation(line: 99, column: 13, scope: !120)
!127 = !DILocation(line: 99, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 99, column: 27)
!129 = !DILocation(line: 100, column: 5, scope: !120)
!130 = !DILocalVariable(name: "source", scope: !131, file: !17, line: 102, type: !39)
!131 = distinct !DILexicalBlock(scope: !112, file: !17, line: 101, column: 5)
!132 = !DILocation(line: 102, column: 17, scope: !131)
!133 = !DILocation(line: 104, column: 16, scope: !131)
!134 = !DILocation(line: 104, column: 22, scope: !131)
!135 = !DILocation(line: 104, column: 9, scope: !131)
!136 = !DILocation(line: 105, column: 20, scope: !131)
!137 = !DILocation(line: 105, column: 9, scope: !131)
!138 = !DILocation(line: 106, column: 14, scope: !131)
!139 = !DILocation(line: 106, column: 9, scope: !131)
!140 = !DILocation(line: 108, column: 1, scope: !112)
