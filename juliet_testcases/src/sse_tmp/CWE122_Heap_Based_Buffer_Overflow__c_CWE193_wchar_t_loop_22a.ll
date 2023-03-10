; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_bad.source to i8*), i64 44, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !46
  store i64 %call1, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !51
  %3 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %3, 1, !dbg !54
  %cmp = icmp ult i64 %2, %add, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !59
  %5 = load i32, i32* %arrayidx, align 4, !dbg !59
  %6 = load i32*, i32** %data, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !60
  store i32 %5, i32* %arrayidx2, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %9), !dbg !70
  %10 = load i32*, i32** %data, align 8, !dbg !71
  %11 = bitcast i32* %10 to i8*, !dbg !71
  call void @free(i8* %11) #7, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Global, align 4, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Source(i32* %0), !dbg !104
  store i32* %call, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !113
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !114
  store i64 %call1, i64* %sourceLen, align 8, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !119
  %3 = load i64, i64* %sourceLen, align 8, !dbg !121
  %add = add i64 %3, 1, !dbg !122
  %cmp = icmp ult i64 %2, %add, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !127
  %5 = load i32, i32* %arrayidx, align 4, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !128
  store i32 %5, i32* %arrayidx2, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %8, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %9), !dbg !137
  %10 = load i32*, i32** %data, align 8, !dbg !138
  %11 = bitcast i32* %10 to i8*, !dbg !138
  call void @free(i8* %11) #7, !dbg !139
  ret void, !dbg !140
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i32* null, i32** %data, align 8, !dbg !144
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Global, align 4, !dbg !145
  %0 = load i32*, i32** %data, align 8, !dbg !146
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Source(i32* %0), !dbg !147
  store i32* %call, i32** %data, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !154, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !156
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !157
  store i64 %call1, i64* %sourceLen, align 8, !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !162
  %3 = load i64, i64* %sourceLen, align 8, !dbg !164
  %add = add i64 %3, 1, !dbg !165
  %cmp = icmp ult i64 %2, %add, !dbg !166
  br i1 %cmp, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !170
  %5 = load i32, i32* %arrayidx, align 4, !dbg !170
  %6 = load i32*, i32** %data, align 8, !dbg !171
  %7 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !171
  store i32 %5, i32* %arrayidx2, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %8, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !179
  call void @printWLine(i32* %9), !dbg !180
  %10 = load i32*, i32** %data, align 8, !dbg !181
  %11 = bitcast i32* %10 to i8*, !dbg !181
  call void @free(i8* %11) #7, !dbg !182
  ret void, !dbg !183
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badGlobal", scope: !2, file: !10, line: 29, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Global", scope: !2, file: !10, line: 59, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Global", scope: !2, file: !10, line: 60, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_bad", scope: !10, file: !10, line: 33, type: !21, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 35, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 35, column: 15, scope: !20)
!28 = !DILocation(line: 36, column: 10, scope: !20)
!29 = !DILocation(line: 37, column: 75, scope: !20)
!30 = !DILocation(line: 38, column: 82, scope: !20)
!31 = !DILocation(line: 38, column: 12, scope: !20)
!32 = !DILocation(line: 38, column: 10, scope: !20)
!33 = !DILocalVariable(name: "source", scope: !34, file: !10, line: 40, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 39, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 40, column: 17, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 41, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 41, column: 16, scope: !34)
!43 = !DILocalVariable(name: "sourceLen", scope: !34, file: !10, line: 41, type: !40)
!44 = !DILocation(line: 41, column: 19, scope: !34)
!45 = !DILocation(line: 42, column: 28, scope: !34)
!46 = !DILocation(line: 42, column: 21, scope: !34)
!47 = !DILocation(line: 42, column: 19, scope: !34)
!48 = !DILocation(line: 45, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !34, file: !10, line: 45, column: 9)
!50 = !DILocation(line: 45, column: 14, scope: !49)
!51 = !DILocation(line: 45, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !10, line: 45, column: 9)
!53 = !DILocation(line: 45, column: 25, scope: !52)
!54 = !DILocation(line: 45, column: 35, scope: !52)
!55 = !DILocation(line: 45, column: 23, scope: !52)
!56 = !DILocation(line: 45, column: 9, scope: !49)
!57 = !DILocation(line: 47, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !10, line: 46, column: 9)
!59 = !DILocation(line: 47, column: 23, scope: !58)
!60 = !DILocation(line: 47, column: 13, scope: !58)
!61 = !DILocation(line: 47, column: 18, scope: !58)
!62 = !DILocation(line: 47, column: 21, scope: !58)
!63 = !DILocation(line: 48, column: 9, scope: !58)
!64 = !DILocation(line: 45, column: 41, scope: !52)
!65 = !DILocation(line: 45, column: 9, scope: !52)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 48, column: 9, scope: !49)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 49, column: 20, scope: !34)
!70 = !DILocation(line: 49, column: 9, scope: !34)
!71 = !DILocation(line: 50, column: 14, scope: !34)
!72 = !DILocation(line: 50, column: 9, scope: !34)
!73 = !DILocation(line: 52, column: 1, scope: !20)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_good", scope: !10, file: !10, line: 110, type: !21, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 112, column: 5, scope: !74)
!76 = !DILocation(line: 113, column: 5, scope: !74)
!77 = !DILocation(line: 114, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 126, type: !79, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!11, !11, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !10, line: 126, type: !11)
!85 = !DILocation(line: 126, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !10, line: 126, type: !81)
!87 = !DILocation(line: 126, column: 27, scope: !78)
!88 = !DILocation(line: 129, column: 22, scope: !78)
!89 = !DILocation(line: 129, column: 12, scope: !78)
!90 = !DILocation(line: 129, column: 5, scope: !78)
!91 = !DILocation(line: 131, column: 5, scope: !78)
!92 = !DILocation(line: 132, column: 5, scope: !78)
!93 = !DILocation(line: 133, column: 5, scope: !78)
!94 = !DILocation(line: 136, column: 5, scope: !78)
!95 = !DILocation(line: 137, column: 5, scope: !78)
!96 = !DILocation(line: 138, column: 5, scope: !78)
!97 = !DILocation(line: 140, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 65, type: !21, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !10, line: 67, type: !24)
!100 = !DILocation(line: 67, column: 15, scope: !98)
!101 = !DILocation(line: 68, column: 10, scope: !98)
!102 = !DILocation(line: 69, column: 80, scope: !98)
!103 = !DILocation(line: 70, column: 87, scope: !98)
!104 = !DILocation(line: 70, column: 12, scope: !98)
!105 = !DILocation(line: 70, column: 10, scope: !98)
!106 = !DILocalVariable(name: "source", scope: !107, file: !10, line: 72, type: !35)
!107 = distinct !DILexicalBlock(scope: !98, file: !10, line: 71, column: 5)
!108 = !DILocation(line: 72, column: 17, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !107, file: !10, line: 73, type: !40)
!110 = !DILocation(line: 73, column: 16, scope: !107)
!111 = !DILocalVariable(name: "sourceLen", scope: !107, file: !10, line: 73, type: !40)
!112 = !DILocation(line: 73, column: 19, scope: !107)
!113 = !DILocation(line: 74, column: 28, scope: !107)
!114 = !DILocation(line: 74, column: 21, scope: !107)
!115 = !DILocation(line: 74, column: 19, scope: !107)
!116 = !DILocation(line: 77, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !10, line: 77, column: 9)
!118 = !DILocation(line: 77, column: 14, scope: !117)
!119 = !DILocation(line: 77, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !10, line: 77, column: 9)
!121 = !DILocation(line: 77, column: 25, scope: !120)
!122 = !DILocation(line: 77, column: 35, scope: !120)
!123 = !DILocation(line: 77, column: 23, scope: !120)
!124 = !DILocation(line: 77, column: 9, scope: !117)
!125 = !DILocation(line: 79, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !10, line: 78, column: 9)
!127 = !DILocation(line: 79, column: 23, scope: !126)
!128 = !DILocation(line: 79, column: 13, scope: !126)
!129 = !DILocation(line: 79, column: 18, scope: !126)
!130 = !DILocation(line: 79, column: 21, scope: !126)
!131 = !DILocation(line: 80, column: 9, scope: !126)
!132 = !DILocation(line: 77, column: 41, scope: !120)
!133 = !DILocation(line: 77, column: 9, scope: !120)
!134 = distinct !{!134, !124, !135, !68}
!135 = !DILocation(line: 80, column: 9, scope: !117)
!136 = !DILocation(line: 81, column: 20, scope: !107)
!137 = !DILocation(line: 81, column: 9, scope: !107)
!138 = !DILocation(line: 82, column: 14, scope: !107)
!139 = !DILocation(line: 82, column: 9, scope: !107)
!140 = !DILocation(line: 84, column: 1, scope: !98)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!142 = !DILocalVariable(name: "data", scope: !141, file: !10, line: 91, type: !24)
!143 = !DILocation(line: 91, column: 15, scope: !141)
!144 = !DILocation(line: 92, column: 10, scope: !141)
!145 = !DILocation(line: 93, column: 80, scope: !141)
!146 = !DILocation(line: 94, column: 87, scope: !141)
!147 = !DILocation(line: 94, column: 12, scope: !141)
!148 = !DILocation(line: 94, column: 10, scope: !141)
!149 = !DILocalVariable(name: "source", scope: !150, file: !10, line: 96, type: !35)
!150 = distinct !DILexicalBlock(scope: !141, file: !10, line: 95, column: 5)
!151 = !DILocation(line: 96, column: 17, scope: !150)
!152 = !DILocalVariable(name: "i", scope: !150, file: !10, line: 97, type: !40)
!153 = !DILocation(line: 97, column: 16, scope: !150)
!154 = !DILocalVariable(name: "sourceLen", scope: !150, file: !10, line: 97, type: !40)
!155 = !DILocation(line: 97, column: 19, scope: !150)
!156 = !DILocation(line: 98, column: 28, scope: !150)
!157 = !DILocation(line: 98, column: 21, scope: !150)
!158 = !DILocation(line: 98, column: 19, scope: !150)
!159 = !DILocation(line: 101, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !150, file: !10, line: 101, column: 9)
!161 = !DILocation(line: 101, column: 14, scope: !160)
!162 = !DILocation(line: 101, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !10, line: 101, column: 9)
!164 = !DILocation(line: 101, column: 25, scope: !163)
!165 = !DILocation(line: 101, column: 35, scope: !163)
!166 = !DILocation(line: 101, column: 23, scope: !163)
!167 = !DILocation(line: 101, column: 9, scope: !160)
!168 = !DILocation(line: 103, column: 30, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !10, line: 102, column: 9)
!170 = !DILocation(line: 103, column: 23, scope: !169)
!171 = !DILocation(line: 103, column: 13, scope: !169)
!172 = !DILocation(line: 103, column: 18, scope: !169)
!173 = !DILocation(line: 103, column: 21, scope: !169)
!174 = !DILocation(line: 104, column: 9, scope: !169)
!175 = !DILocation(line: 101, column: 41, scope: !163)
!176 = !DILocation(line: 101, column: 9, scope: !163)
!177 = distinct !{!177, !167, !178, !68}
!178 = !DILocation(line: 104, column: 9, scope: !160)
!179 = !DILocation(line: 105, column: 20, scope: !150)
!180 = !DILocation(line: 105, column: 9, scope: !150)
!181 = !DILocation(line: 106, column: 14, scope: !150)
!182 = !DILocation(line: 106, column: 9, scope: !150)
!183 = !DILocation(line: 108, column: 1, scope: !141)
