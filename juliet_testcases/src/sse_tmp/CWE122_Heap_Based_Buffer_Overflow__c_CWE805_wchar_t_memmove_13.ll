; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end3, !dbg !26

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !27
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %data, align 8, !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %cmp1 = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !34

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end3, !dbg !39

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !47
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx5, align 4, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %5 = bitcast i32* %4 to i8*, !dbg !51
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !52
  store i32 0, i32* %arrayidx7, align 4, !dbg !53
  %8 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %8), !dbg !55
  %9 = load i32*, i32** %data, align 8, !dbg !56
  %10 = bitcast i32* %9 to i8*, !dbg !56
  call void @free(i8* %10) #6, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !87
  %cmp = icmp ne i32 %0, 5, !dbg !89
  br i1 %cmp, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end3, !dbg !93

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !94
  %1 = bitcast i8* %call to i32*, !dbg !96
  store i32* %1, i32** %data, align 8, !dbg !97
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %cmp1 = icmp eq i32* %2, null, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !101

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !110
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %4 = load i32*, i32** %data, align 8, !dbg !113
  %5 = bitcast i32* %4 to i8*, !dbg !114
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !114
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !115
  store i32 0, i32* %arrayidx7, align 4, !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %8), !dbg !118
  %9 = load i32*, i32** %data, align 8, !dbg !119
  %10 = bitcast i32* %9 to i8*, !dbg !119
  call void @free(i8* %10) #6, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !122 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i32* null, i32** %data, align 8, !dbg !125
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !126
  %cmp = icmp eq i32 %0, 5, !dbg !128
  br i1 %cmp, label %if.then, label %if.end3, !dbg !129

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !130
  %1 = bitcast i8* %call to i32*, !dbg !132
  store i32* %1, i32** %data, align 8, !dbg !133
  %2 = load i32*, i32** %data, align 8, !dbg !134
  %cmp1 = icmp eq i32* %2, null, !dbg !136
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !137

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  br label %if.end3, !dbg !142

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !147
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx5, align 4, !dbg !149
  %4 = load i32*, i32** %data, align 8, !dbg !150
  %5 = bitcast i32* %4 to i8*, !dbg !151
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !151
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !151
  %7 = load i32*, i32** %data, align 8, !dbg !152
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !152
  store i32 0, i32* %arrayidx7, align 4, !dbg !153
  %8 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %8), !dbg !155
  %9 = load i32*, i32** %data, align 8, !dbg !156
  %10 = bitcast i32* %9 to i8*, !dbg !156
  call void @free(i8* %10) #6, !dbg !157
  ret void, !dbg !158
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 25, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocation(line: 30, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !28)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 9, scope: !28)
!38 = !DILocation(line: 32, column: 17, scope: !28)
!39 = !DILocation(line: 33, column: 5, scope: !28)
!40 = !DILocalVariable(name: "source", scope: !41, file: !17, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 35, column: 17, scope: !41)
!46 = !DILocation(line: 36, column: 17, scope: !41)
!47 = !DILocation(line: 36, column: 9, scope: !41)
!48 = !DILocation(line: 37, column: 9, scope: !41)
!49 = !DILocation(line: 37, column: 23, scope: !41)
!50 = !DILocation(line: 39, column: 17, scope: !41)
!51 = !DILocation(line: 39, column: 9, scope: !41)
!52 = !DILocation(line: 40, column: 9, scope: !41)
!53 = !DILocation(line: 40, column: 21, scope: !41)
!54 = !DILocation(line: 41, column: 20, scope: !41)
!55 = !DILocation(line: 41, column: 9, scope: !41)
!56 = !DILocation(line: 42, column: 14, scope: !41)
!57 = !DILocation(line: 42, column: 9, scope: !41)
!58 = !DILocation(line: 44, column: 1, scope: !16)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_13_good", scope: !17, file: !17, line: 103, type: !18, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 105, column: 5, scope: !59)
!61 = !DILocation(line: 106, column: 5, scope: !59)
!62 = !DILocation(line: 107, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 119, type: !64, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 119, type: !7)
!70 = !DILocation(line: 119, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 119, type: !66)
!72 = !DILocation(line: 119, column: 27, scope: !63)
!73 = !DILocation(line: 122, column: 22, scope: !63)
!74 = !DILocation(line: 122, column: 12, scope: !63)
!75 = !DILocation(line: 122, column: 5, scope: !63)
!76 = !DILocation(line: 124, column: 5, scope: !63)
!77 = !DILocation(line: 125, column: 5, scope: !63)
!78 = !DILocation(line: 126, column: 5, scope: !63)
!79 = !DILocation(line: 129, column: 5, scope: !63)
!80 = !DILocation(line: 130, column: 5, scope: !63)
!81 = !DILocation(line: 131, column: 5, scope: !63)
!82 = !DILocation(line: 133, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 53, type: !4)
!85 = !DILocation(line: 53, column: 15, scope: !83)
!86 = !DILocation(line: 54, column: 10, scope: !83)
!87 = !DILocation(line: 55, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !17, line: 55, column: 8)
!89 = !DILocation(line: 55, column: 25, scope: !88)
!90 = !DILocation(line: 55, column: 8, scope: !83)
!91 = !DILocation(line: 58, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !17, line: 56, column: 5)
!93 = !DILocation(line: 59, column: 5, scope: !92)
!94 = !DILocation(line: 63, column: 27, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !17, line: 61, column: 5)
!96 = !DILocation(line: 63, column: 16, scope: !95)
!97 = !DILocation(line: 63, column: 14, scope: !95)
!98 = !DILocation(line: 64, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 64, column: 13)
!100 = !DILocation(line: 64, column: 18, scope: !99)
!101 = !DILocation(line: 64, column: 13, scope: !95)
!102 = !DILocation(line: 64, column: 28, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 64, column: 27)
!104 = !DILocation(line: 65, column: 9, scope: !95)
!105 = !DILocation(line: 65, column: 17, scope: !95)
!106 = !DILocalVariable(name: "source", scope: !107, file: !17, line: 68, type: !42)
!107 = distinct !DILexicalBlock(scope: !83, file: !17, line: 67, column: 5)
!108 = !DILocation(line: 68, column: 17, scope: !107)
!109 = !DILocation(line: 69, column: 17, scope: !107)
!110 = !DILocation(line: 69, column: 9, scope: !107)
!111 = !DILocation(line: 70, column: 9, scope: !107)
!112 = !DILocation(line: 70, column: 23, scope: !107)
!113 = !DILocation(line: 72, column: 17, scope: !107)
!114 = !DILocation(line: 72, column: 9, scope: !107)
!115 = !DILocation(line: 73, column: 9, scope: !107)
!116 = !DILocation(line: 73, column: 21, scope: !107)
!117 = !DILocation(line: 74, column: 20, scope: !107)
!118 = !DILocation(line: 74, column: 9, scope: !107)
!119 = !DILocation(line: 75, column: 14, scope: !107)
!120 = !DILocation(line: 75, column: 9, scope: !107)
!121 = !DILocation(line: 77, column: 1, scope: !83)
!122 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !17, line: 82, type: !4)
!124 = !DILocation(line: 82, column: 15, scope: !122)
!125 = !DILocation(line: 83, column: 10, scope: !122)
!126 = !DILocation(line: 84, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !17, line: 84, column: 8)
!128 = !DILocation(line: 84, column: 25, scope: !127)
!129 = !DILocation(line: 84, column: 8, scope: !122)
!130 = !DILocation(line: 87, column: 27, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 85, column: 5)
!132 = !DILocation(line: 87, column: 16, scope: !131)
!133 = !DILocation(line: 87, column: 14, scope: !131)
!134 = !DILocation(line: 88, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !17, line: 88, column: 13)
!136 = !DILocation(line: 88, column: 18, scope: !135)
!137 = !DILocation(line: 88, column: 13, scope: !131)
!138 = !DILocation(line: 88, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !17, line: 88, column: 27)
!140 = !DILocation(line: 89, column: 9, scope: !131)
!141 = !DILocation(line: 89, column: 17, scope: !131)
!142 = !DILocation(line: 90, column: 5, scope: !131)
!143 = !DILocalVariable(name: "source", scope: !144, file: !17, line: 92, type: !42)
!144 = distinct !DILexicalBlock(scope: !122, file: !17, line: 91, column: 5)
!145 = !DILocation(line: 92, column: 17, scope: !144)
!146 = !DILocation(line: 93, column: 17, scope: !144)
!147 = !DILocation(line: 93, column: 9, scope: !144)
!148 = !DILocation(line: 94, column: 9, scope: !144)
!149 = !DILocation(line: 94, column: 23, scope: !144)
!150 = !DILocation(line: 96, column: 17, scope: !144)
!151 = !DILocation(line: 96, column: 9, scope: !144)
!152 = !DILocation(line: 97, column: 9, scope: !144)
!153 = !DILocation(line: 97, column: 21, scope: !144)
!154 = !DILocation(line: 98, column: 20, scope: !144)
!155 = !DILocation(line: 98, column: 9, scope: !144)
!156 = !DILocation(line: 99, column: 14, scope: !144)
!157 = !DILocation(line: 99, column: 9, scope: !144)
!158 = !DILocation(line: 101, column: 1, scope: !122)
