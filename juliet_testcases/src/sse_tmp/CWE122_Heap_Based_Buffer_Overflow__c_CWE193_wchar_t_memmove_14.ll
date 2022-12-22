; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @globalFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end3, !dbg !26

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !27
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %data, align 8, !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %cmp1 = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !34

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_bad.source to i8*), i64 44, i1 false), !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %5 = bitcast i32* %4 to i8*, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %6 = bitcast i32* %arraydecay to i8*, !dbg !45
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !47
  %add = add i64 %call5, 1, !dbg !48
  %mul = mul i64 %add, 4, !dbg !49
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 %mul, i1 false), !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %7), !dbg !51
  %8 = load i32*, i32** %data, align 8, !dbg !52
  %9 = bitcast i32* %8 to i8*, !dbg !52
  call void @free(i8* %9) #7, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %0 = load i32, i32* @globalFive, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end3, !dbg !89

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !90
  %1 = bitcast i8* %call to i32*, !dbg !92
  store i32* %1, i32** %data, align 8, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %cmp1 = icmp eq i32* %2, null, !dbg !96
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %5 = bitcast i32* %4 to i8*, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %6 = bitcast i32* %arraydecay to i8*, !dbg !104
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !106
  %add = add i64 %call5, 1, !dbg !107
  %mul = mul i64 %add, 4, !dbg !108
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 %mul, i1 false), !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %7), !dbg !110
  %8 = load i32*, i32** %data, align 8, !dbg !111
  %9 = bitcast i32* %8 to i8*, !dbg !111
  call void @free(i8* %9) #7, !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32* null, i32** %data, align 8, !dbg !117
  %0 = load i32, i32* @globalFive, align 4, !dbg !118
  %cmp = icmp eq i32 %0, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end3, !dbg !121

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !122
  %1 = bitcast i8* %call to i32*, !dbg !124
  store i32* %1, i32** %data, align 8, !dbg !125
  %2 = load i32*, i32** %data, align 8, !dbg !126
  %cmp1 = icmp eq i32* %2, null, !dbg !128
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !129

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !132

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !135
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !135
  %4 = load i32*, i32** %data, align 8, !dbg !136
  %5 = bitcast i32* %4 to i8*, !dbg !137
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !137
  %6 = bitcast i32* %arraydecay to i8*, !dbg !137
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !138
  %call5 = call i64 @wcslen(i32* %arraydecay4) #9, !dbg !139
  %add = add i64 %call5, 1, !dbg !140
  %mul = mul i64 %add, 4, !dbg !141
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 %mul, i1 false), !dbg !137
  %7 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* %7), !dbg !143
  %8 = load i32*, i32** %data, align 8, !dbg !144
  %9 = bitcast i32* %8 to i8*, !dbg !144
  call void @free(i8* %9) #7, !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 8)
!25 = !DILocation(line: 32, column: 18, scope: !24)
!26 = !DILocation(line: 32, column: 8, scope: !16)
!27 = !DILocation(line: 35, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 33, column: 5)
!29 = !DILocation(line: 35, column: 16, scope: !28)
!30 = !DILocation(line: 35, column: 14, scope: !28)
!31 = !DILocation(line: 36, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 36, column: 13)
!33 = !DILocation(line: 36, column: 18, scope: !32)
!34 = !DILocation(line: 36, column: 13, scope: !28)
!35 = !DILocation(line: 36, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 36, column: 27)
!37 = !DILocation(line: 37, column: 5, scope: !28)
!38 = !DILocalVariable(name: "source", scope: !39, file: !17, line: 39, type: !40)
!39 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 39, column: 17, scope: !39)
!44 = !DILocation(line: 42, column: 17, scope: !39)
!45 = !DILocation(line: 42, column: 9, scope: !39)
!46 = !DILocation(line: 42, column: 39, scope: !39)
!47 = !DILocation(line: 42, column: 32, scope: !39)
!48 = !DILocation(line: 42, column: 47, scope: !39)
!49 = !DILocation(line: 42, column: 52, scope: !39)
!50 = !DILocation(line: 43, column: 20, scope: !39)
!51 = !DILocation(line: 43, column: 9, scope: !39)
!52 = !DILocation(line: 44, column: 14, scope: !39)
!53 = !DILocation(line: 44, column: 9, scope: !39)
!54 = !DILocation(line: 46, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_14_good", scope: !17, file: !17, line: 99, type: !18, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 101, column: 5, scope: !55)
!57 = !DILocation(line: 102, column: 5, scope: !55)
!58 = !DILocation(line: 103, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 115, type: !60, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !17, line: 115, type: !7)
!66 = !DILocation(line: 115, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !17, line: 115, type: !62)
!68 = !DILocation(line: 115, column: 27, scope: !59)
!69 = !DILocation(line: 118, column: 22, scope: !59)
!70 = !DILocation(line: 118, column: 12, scope: !59)
!71 = !DILocation(line: 118, column: 5, scope: !59)
!72 = !DILocation(line: 120, column: 5, scope: !59)
!73 = !DILocation(line: 121, column: 5, scope: !59)
!74 = !DILocation(line: 122, column: 5, scope: !59)
!75 = !DILocation(line: 125, column: 5, scope: !59)
!76 = !DILocation(line: 126, column: 5, scope: !59)
!77 = !DILocation(line: 127, column: 5, scope: !59)
!78 = !DILocation(line: 129, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 55, type: !4)
!81 = !DILocation(line: 55, column: 15, scope: !79)
!82 = !DILocation(line: 56, column: 10, scope: !79)
!83 = !DILocation(line: 57, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !17, line: 57, column: 8)
!85 = !DILocation(line: 57, column: 18, scope: !84)
!86 = !DILocation(line: 57, column: 8, scope: !79)
!87 = !DILocation(line: 60, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !17, line: 58, column: 5)
!89 = !DILocation(line: 61, column: 5, scope: !88)
!90 = !DILocation(line: 65, column: 27, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !17, line: 63, column: 5)
!92 = !DILocation(line: 65, column: 16, scope: !91)
!93 = !DILocation(line: 65, column: 14, scope: !91)
!94 = !DILocation(line: 66, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !17, line: 66, column: 13)
!96 = !DILocation(line: 66, column: 18, scope: !95)
!97 = !DILocation(line: 66, column: 13, scope: !91)
!98 = !DILocation(line: 66, column: 28, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 66, column: 27)
!100 = !DILocalVariable(name: "source", scope: !101, file: !17, line: 69, type: !40)
!101 = distinct !DILexicalBlock(scope: !79, file: !17, line: 68, column: 5)
!102 = !DILocation(line: 69, column: 17, scope: !101)
!103 = !DILocation(line: 72, column: 17, scope: !101)
!104 = !DILocation(line: 72, column: 9, scope: !101)
!105 = !DILocation(line: 72, column: 39, scope: !101)
!106 = !DILocation(line: 72, column: 32, scope: !101)
!107 = !DILocation(line: 72, column: 47, scope: !101)
!108 = !DILocation(line: 72, column: 52, scope: !101)
!109 = !DILocation(line: 73, column: 20, scope: !101)
!110 = !DILocation(line: 73, column: 9, scope: !101)
!111 = !DILocation(line: 74, column: 14, scope: !101)
!112 = !DILocation(line: 74, column: 9, scope: !101)
!113 = !DILocation(line: 76, column: 1, scope: !79)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 79, type: !18, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !17, line: 81, type: !4)
!116 = !DILocation(line: 81, column: 15, scope: !114)
!117 = !DILocation(line: 82, column: 10, scope: !114)
!118 = !DILocation(line: 83, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !17, line: 83, column: 8)
!120 = !DILocation(line: 83, column: 18, scope: !119)
!121 = !DILocation(line: 83, column: 8, scope: !114)
!122 = !DILocation(line: 86, column: 27, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 84, column: 5)
!124 = !DILocation(line: 86, column: 16, scope: !123)
!125 = !DILocation(line: 86, column: 14, scope: !123)
!126 = !DILocation(line: 87, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !17, line: 87, column: 13)
!128 = !DILocation(line: 87, column: 18, scope: !127)
!129 = !DILocation(line: 87, column: 13, scope: !123)
!130 = !DILocation(line: 87, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 87, column: 27)
!132 = !DILocation(line: 88, column: 5, scope: !123)
!133 = !DILocalVariable(name: "source", scope: !134, file: !17, line: 90, type: !40)
!134 = distinct !DILexicalBlock(scope: !114, file: !17, line: 89, column: 5)
!135 = !DILocation(line: 90, column: 17, scope: !134)
!136 = !DILocation(line: 93, column: 17, scope: !134)
!137 = !DILocation(line: 93, column: 9, scope: !134)
!138 = !DILocation(line: 93, column: 39, scope: !134)
!139 = !DILocation(line: 93, column: 32, scope: !134)
!140 = !DILocation(line: 93, column: 47, scope: !134)
!141 = !DILocation(line: 93, column: 52, scope: !134)
!142 = !DILocation(line: 94, column: 20, scope: !134)
!143 = !DILocation(line: 94, column: 9, scope: !134)
!144 = !DILocation(line: 95, column: 14, scope: !134)
!145 = !DILocation(line: 95, column: 9, scope: !134)
!146 = !DILocation(line: 97, column: 1, scope: !114)
