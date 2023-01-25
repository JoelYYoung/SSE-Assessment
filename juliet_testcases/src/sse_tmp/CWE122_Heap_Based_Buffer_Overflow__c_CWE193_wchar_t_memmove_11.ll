; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

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
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_bad.source to i8*), i64 44, i1 false), !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  %4 = bitcast i32* %3 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %5 = bitcast i32* %arraydecay to i8*, !dbg !44
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !46
  %add = add i64 %call5, 1, !dbg !47
  %mul = mul i64 %add, 4, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %6), !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %8 = bitcast i32* %7 to i8*, !dbg !51
  call void @free(i8* %8) #7, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32* null, i32** %data, align 8, !dbg !81
  %call = call i32 (...) @globalReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end3, !dbg !87

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !88
  %0 = bitcast i8* %call1 to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then2, label %if.end, !dbg !95

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %4 = bitcast i32* %3 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !102
  %5 = bitcast i32* %arraydecay to i8*, !dbg !102
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !104
  %add = add i64 %call5, 1, !dbg !105
  %mul = mul i64 %add, 4, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %6), !dbg !108
  %7 = load i32*, i32** %data, align 8, !dbg !109
  %8 = bitcast i32* %7 to i8*, !dbg !109
  call void @free(i8* %8) #7, !dbg !110
  ret void, !dbg !111
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %call = call i32 (...) @globalReturnsTrue(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end3, !dbg !118

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !119
  %0 = bitcast i8* %call1 to i32*, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then2, label %if.end, !dbg !126

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !132
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %4 = bitcast i32* %3 to i8*, !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !134
  %5 = bitcast i32* %arraydecay to i8*, !dbg !134
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !136
  %add = add i64 %call5, 1, !dbg !137
  %mul = mul i64 %add, 4, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !134
  %6 = load i32*, i32** %data, align 8, !dbg !139
  call void @printWLine(i32* %6), !dbg !140
  %7 = load i32*, i32** %data, align 8, !dbg !141
  %8 = bitcast i32* %7 to i8*, !dbg !141
  call void @free(i8* %8) #7, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 39, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 39, column: 17, scope: !38)
!43 = !DILocation(line: 42, column: 17, scope: !38)
!44 = !DILocation(line: 42, column: 9, scope: !38)
!45 = !DILocation(line: 42, column: 39, scope: !38)
!46 = !DILocation(line: 42, column: 32, scope: !38)
!47 = !DILocation(line: 42, column: 47, scope: !38)
!48 = !DILocation(line: 42, column: 52, scope: !38)
!49 = !DILocation(line: 43, column: 20, scope: !38)
!50 = !DILocation(line: 43, column: 9, scope: !38)
!51 = !DILocation(line: 44, column: 14, scope: !38)
!52 = !DILocation(line: 44, column: 9, scope: !38)
!53 = !DILocation(line: 46, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_11_good", scope: !17, file: !17, line: 99, type: !18, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 101, column: 5, scope: !54)
!56 = !DILocation(line: 102, column: 5, scope: !54)
!57 = !DILocation(line: 103, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 115, type: !59, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 115, type: !7)
!65 = !DILocation(line: 115, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 115, type: !61)
!67 = !DILocation(line: 115, column: 27, scope: !58)
!68 = !DILocation(line: 118, column: 22, scope: !58)
!69 = !DILocation(line: 118, column: 12, scope: !58)
!70 = !DILocation(line: 118, column: 5, scope: !58)
!71 = !DILocation(line: 120, column: 5, scope: !58)
!72 = !DILocation(line: 121, column: 5, scope: !58)
!73 = !DILocation(line: 122, column: 5, scope: !58)
!74 = !DILocation(line: 125, column: 5, scope: !58)
!75 = !DILocation(line: 126, column: 5, scope: !58)
!76 = !DILocation(line: 127, column: 5, scope: !58)
!77 = !DILocation(line: 129, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !17, line: 55, type: !4)
!80 = !DILocation(line: 55, column: 15, scope: !78)
!81 = !DILocation(line: 56, column: 10, scope: !78)
!82 = !DILocation(line: 57, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !17, line: 57, column: 8)
!84 = !DILocation(line: 57, column: 8, scope: !78)
!85 = !DILocation(line: 60, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !17, line: 58, column: 5)
!87 = !DILocation(line: 61, column: 5, scope: !86)
!88 = !DILocation(line: 65, column: 27, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !17, line: 63, column: 5)
!90 = !DILocation(line: 65, column: 16, scope: !89)
!91 = !DILocation(line: 65, column: 14, scope: !89)
!92 = !DILocation(line: 66, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 66, column: 13)
!94 = !DILocation(line: 66, column: 18, scope: !93)
!95 = !DILocation(line: 66, column: 13, scope: !89)
!96 = !DILocation(line: 66, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 66, column: 27)
!98 = !DILocalVariable(name: "source", scope: !99, file: !17, line: 69, type: !39)
!99 = distinct !DILexicalBlock(scope: !78, file: !17, line: 68, column: 5)
!100 = !DILocation(line: 69, column: 17, scope: !99)
!101 = !DILocation(line: 72, column: 17, scope: !99)
!102 = !DILocation(line: 72, column: 9, scope: !99)
!103 = !DILocation(line: 72, column: 39, scope: !99)
!104 = !DILocation(line: 72, column: 32, scope: !99)
!105 = !DILocation(line: 72, column: 47, scope: !99)
!106 = !DILocation(line: 72, column: 52, scope: !99)
!107 = !DILocation(line: 73, column: 20, scope: !99)
!108 = !DILocation(line: 73, column: 9, scope: !99)
!109 = !DILocation(line: 74, column: 14, scope: !99)
!110 = !DILocation(line: 74, column: 9, scope: !99)
!111 = !DILocation(line: 76, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 79, type: !18, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 81, type: !4)
!114 = !DILocation(line: 81, column: 15, scope: !112)
!115 = !DILocation(line: 82, column: 10, scope: !112)
!116 = !DILocation(line: 83, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !17, line: 83, column: 8)
!118 = !DILocation(line: 83, column: 8, scope: !112)
!119 = !DILocation(line: 86, column: 27, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !17, line: 84, column: 5)
!121 = !DILocation(line: 86, column: 16, scope: !120)
!122 = !DILocation(line: 86, column: 14, scope: !120)
!123 = !DILocation(line: 87, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 87, column: 13)
!125 = !DILocation(line: 87, column: 18, scope: !124)
!126 = !DILocation(line: 87, column: 13, scope: !120)
!127 = !DILocation(line: 87, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 87, column: 27)
!129 = !DILocation(line: 88, column: 5, scope: !120)
!130 = !DILocalVariable(name: "source", scope: !131, file: !17, line: 90, type: !39)
!131 = distinct !DILexicalBlock(scope: !112, file: !17, line: 89, column: 5)
!132 = !DILocation(line: 90, column: 17, scope: !131)
!133 = !DILocation(line: 93, column: 17, scope: !131)
!134 = !DILocation(line: 93, column: 9, scope: !131)
!135 = !DILocation(line: 93, column: 39, scope: !131)
!136 = !DILocation(line: 93, column: 32, scope: !131)
!137 = !DILocation(line: 93, column: 47, scope: !131)
!138 = !DILocation(line: 93, column: 52, scope: !131)
!139 = !DILocation(line: 94, column: 20, scope: !131)
!140 = !DILocation(line: 94, column: 9, scope: !131)
!141 = !DILocation(line: 95, column: 14, scope: !131)
!142 = !DILocation(line: 95, column: 9, scope: !131)
!143 = !DILocation(line: 97, column: 1, scope: !112)
