; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !13
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #7, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #7, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !68, metadata !DIExpression()), !dbg !73
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %i, metadata !74, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !80
  %call = call i64 @wcslen(i32* %arraydecay) #9, !dbg !81
  store i64 %call, i64* %sourceLen, align 8, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !86
  %3 = load i64, i64* %sourceLen, align 8, !dbg !88
  %add = add i64 %3, 1, !dbg !89
  %cmp = icmp ult i64 %2, %add, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !94
  %5 = load i32, i32* %arrayidx, align 4, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  %7 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !95
  store i32 %5, i32* %arrayidx1, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %8, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %9), !dbg !105
  %10 = load i32*, i32** %data, align 8, !dbg !106
  %11 = bitcast i32* %10 to i8*, !dbg !106
  call void @free(i8* %11) #7, !dbg !107
  ret void, !dbg !108
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32* null, i32** %data, align 8, !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !122
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_goodG2BData, align 8, !dbg !123
  call void @goodG2BSink(), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !126 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_goodG2BData, align 8, !dbg !129
  store i32* %0, i32** %data, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !137
  %call = call i64 @wcslen(i32* %arraydecay) #9, !dbg !138
  store i64 %call, i64* %sourceLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !143
  %3 = load i64, i64* %sourceLen, align 8, !dbg !145
  %add = add i64 %3, 1, !dbg !146
  %cmp = icmp ult i64 %2, %add, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !151
  %5 = load i32, i32* %arrayidx, align 4, !dbg !151
  %6 = load i32*, i32** %data, align 8, !dbg !152
  %7 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !152
  store i32 %5, i32* %arrayidx1, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %8, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !160
  call void @printWLine(i32* %9), !dbg !161
  %10 = load i32*, i32** %data, align 8, !dbg !162
  %11 = bitcast i32* %10 to i8*, !dbg !162
  call void @free(i8* %11) #7, !dbg !163
  ret void, !dbg !164
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_badData", scope: !2, file: !15, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_goodG2BData", scope: !2, file: !15, line: 27, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_bad", scope: !15, file: !15, line: 49, type: !23, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 51, type: !6)
!26 = !DILocation(line: 51, column: 15, scope: !22)
!27 = !DILocation(line: 52, column: 10, scope: !22)
!28 = !DILocation(line: 54, column: 23, scope: !22)
!29 = !DILocation(line: 54, column: 12, scope: !22)
!30 = !DILocation(line: 54, column: 10, scope: !22)
!31 = !DILocation(line: 55, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 55, column: 9)
!33 = !DILocation(line: 55, column: 14, scope: !32)
!34 = !DILocation(line: 55, column: 9, scope: !22)
!35 = !DILocation(line: 55, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 55, column: 23)
!37 = !DILocation(line: 56, column: 75, scope: !22)
!38 = !DILocation(line: 56, column: 73, scope: !22)
!39 = !DILocation(line: 57, column: 5, scope: !22)
!40 = !DILocation(line: 58, column: 1, scope: !22)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_45_good", scope: !15, file: !15, line: 94, type: !23, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 96, column: 5, scope: !41)
!43 = !DILocation(line: 97, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 108, type: !45, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !15, line: 108, type: !9)
!51 = !DILocation(line: 108, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !15, line: 108, type: !47)
!53 = !DILocation(line: 108, column: 27, scope: !44)
!54 = !DILocation(line: 111, column: 22, scope: !44)
!55 = !DILocation(line: 111, column: 12, scope: !44)
!56 = !DILocation(line: 111, column: 5, scope: !44)
!57 = !DILocation(line: 113, column: 5, scope: !44)
!58 = !DILocation(line: 114, column: 5, scope: !44)
!59 = !DILocation(line: 115, column: 5, scope: !44)
!60 = !DILocation(line: 118, column: 5, scope: !44)
!61 = !DILocation(line: 119, column: 5, scope: !44)
!62 = !DILocation(line: 120, column: 5, scope: !44)
!63 = !DILocation(line: 122, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 31, type: !23, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !15, line: 33, type: !6)
!66 = !DILocation(line: 33, column: 15, scope: !64)
!67 = !DILocation(line: 33, column: 22, scope: !64)
!68 = !DILocalVariable(name: "source", scope: !69, file: !15, line: 35, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !15, line: 34, column: 5)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 11)
!73 = !DILocation(line: 35, column: 17, scope: !69)
!74 = !DILocalVariable(name: "i", scope: !69, file: !15, line: 36, type: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !76)
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 36, column: 16, scope: !69)
!78 = !DILocalVariable(name: "sourceLen", scope: !69, file: !15, line: 36, type: !75)
!79 = !DILocation(line: 36, column: 19, scope: !69)
!80 = !DILocation(line: 37, column: 28, scope: !69)
!81 = !DILocation(line: 37, column: 21, scope: !69)
!82 = !DILocation(line: 37, column: 19, scope: !69)
!83 = !DILocation(line: 40, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !69, file: !15, line: 40, column: 9)
!85 = !DILocation(line: 40, column: 14, scope: !84)
!86 = !DILocation(line: 40, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !15, line: 40, column: 9)
!88 = !DILocation(line: 40, column: 25, scope: !87)
!89 = !DILocation(line: 40, column: 35, scope: !87)
!90 = !DILocation(line: 40, column: 23, scope: !87)
!91 = !DILocation(line: 40, column: 9, scope: !84)
!92 = !DILocation(line: 42, column: 30, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !15, line: 41, column: 9)
!94 = !DILocation(line: 42, column: 23, scope: !93)
!95 = !DILocation(line: 42, column: 13, scope: !93)
!96 = !DILocation(line: 42, column: 18, scope: !93)
!97 = !DILocation(line: 42, column: 21, scope: !93)
!98 = !DILocation(line: 43, column: 9, scope: !93)
!99 = !DILocation(line: 40, column: 41, scope: !87)
!100 = !DILocation(line: 40, column: 9, scope: !87)
!101 = distinct !{!101, !91, !102, !103}
!102 = !DILocation(line: 43, column: 9, scope: !84)
!103 = !{!"llvm.loop.mustprogress"}
!104 = !DILocation(line: 44, column: 20, scope: !69)
!105 = !DILocation(line: 44, column: 9, scope: !69)
!106 = !DILocation(line: 45, column: 14, scope: !69)
!107 = !DILocation(line: 45, column: 9, scope: !69)
!108 = !DILocation(line: 47, column: 1, scope: !64)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 83, type: !23, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 85, type: !6)
!111 = !DILocation(line: 85, column: 15, scope: !109)
!112 = !DILocation(line: 86, column: 10, scope: !109)
!113 = !DILocation(line: 88, column: 23, scope: !109)
!114 = !DILocation(line: 88, column: 12, scope: !109)
!115 = !DILocation(line: 88, column: 10, scope: !109)
!116 = !DILocation(line: 89, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !15, line: 89, column: 9)
!118 = !DILocation(line: 89, column: 14, scope: !117)
!119 = !DILocation(line: 89, column: 9, scope: !109)
!120 = !DILocation(line: 89, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 89, column: 23)
!122 = !DILocation(line: 90, column: 79, scope: !109)
!123 = !DILocation(line: 90, column: 77, scope: !109)
!124 = !DILocation(line: 91, column: 5, scope: !109)
!125 = !DILocation(line: 92, column: 1, scope: !109)
!126 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 65, type: !23, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 67, type: !6)
!128 = !DILocation(line: 67, column: 15, scope: !126)
!129 = !DILocation(line: 67, column: 22, scope: !126)
!130 = !DILocalVariable(name: "source", scope: !131, file: !15, line: 69, type: !70)
!131 = distinct !DILexicalBlock(scope: !126, file: !15, line: 68, column: 5)
!132 = !DILocation(line: 69, column: 17, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !15, line: 70, type: !75)
!134 = !DILocation(line: 70, column: 16, scope: !131)
!135 = !DILocalVariable(name: "sourceLen", scope: !131, file: !15, line: 70, type: !75)
!136 = !DILocation(line: 70, column: 19, scope: !131)
!137 = !DILocation(line: 71, column: 28, scope: !131)
!138 = !DILocation(line: 71, column: 21, scope: !131)
!139 = !DILocation(line: 71, column: 19, scope: !131)
!140 = !DILocation(line: 74, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !15, line: 74, column: 9)
!142 = !DILocation(line: 74, column: 14, scope: !141)
!143 = !DILocation(line: 74, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !15, line: 74, column: 9)
!145 = !DILocation(line: 74, column: 25, scope: !144)
!146 = !DILocation(line: 74, column: 35, scope: !144)
!147 = !DILocation(line: 74, column: 23, scope: !144)
!148 = !DILocation(line: 74, column: 9, scope: !141)
!149 = !DILocation(line: 76, column: 30, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !15, line: 75, column: 9)
!151 = !DILocation(line: 76, column: 23, scope: !150)
!152 = !DILocation(line: 76, column: 13, scope: !150)
!153 = !DILocation(line: 76, column: 18, scope: !150)
!154 = !DILocation(line: 76, column: 21, scope: !150)
!155 = !DILocation(line: 77, column: 9, scope: !150)
!156 = !DILocation(line: 74, column: 41, scope: !144)
!157 = !DILocation(line: 74, column: 9, scope: !144)
!158 = distinct !{!158, !148, !159, !103}
!159 = !DILocation(line: 77, column: 9, scope: !141)
!160 = !DILocation(line: 78, column: 20, scope: !131)
!161 = !DILocation(line: 78, column: 9, scope: !131)
!162 = !DILocation(line: 79, column: 14, scope: !131)
!163 = !DILocation(line: 79, column: 9, scope: !131)
!164 = !DILocation(line: 81, column: 1, scope: !126)
