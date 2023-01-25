; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @globalTrue, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end2, !dbg !25

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !26
  %1 = bitcast i8* %call to i32*, !dbg !28
  store i32* %1, i32** %data, align 8, !dbg !29
  %2 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %2, null, !dbg !32
  br i1 %cmp, label %if.then1, label %if.end, !dbg !33

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !36

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_bad.source to i8*), i64 44, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !50
  store i64 %call3, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !55
  %5 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %5, 1, !dbg !58
  %cmp4 = icmp ult i64 %4, %add, !dbg !59
  br i1 %cmp4, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !63
  %7 = load i32, i32* %arrayidx, align 4, !dbg !63
  %8 = load i32*, i32** %data, align 8, !dbg !64
  %9 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !64
  store i32 %7, i32* %arrayidx5, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %10, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %11), !dbg !74
  %12 = load i32*, i32** %data, align 8, !dbg !75
  %13 = bitcast i32* %12 to i8*, !dbg !75
  call void @free(i8* %13) #7, !dbg !76
  ret void, !dbg !77
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

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i32* null, i32** %data, align 8, !dbg !105
  %0 = load i32, i32* @globalFalse, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end2, !dbg !111

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !112
  %1 = bitcast i8* %call to i32*, !dbg !114
  store i32* %1, i32** %data, align 8, !dbg !115
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %2, null, !dbg !118
  br i1 %cmp, label %if.then1, label %if.end, !dbg !119

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !129
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !130
  store i64 %call3, i64* %sourceLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !135
  %5 = load i64, i64* %sourceLen, align 8, !dbg !137
  %add = add i64 %5, 1, !dbg !138
  %cmp4 = icmp ult i64 %4, %add, !dbg !139
  br i1 %cmp4, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !143
  %7 = load i32, i32* %arrayidx, align 4, !dbg !143
  %8 = load i32*, i32** %data, align 8, !dbg !144
  %9 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !144
  store i32 %7, i32* %arrayidx5, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %10, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %11), !dbg !153
  %12 = load i32*, i32** %data, align 8, !dbg !154
  %13 = bitcast i32* %12 to i8*, !dbg !154
  call void @free(i8* %13) #7, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !158, metadata !DIExpression()), !dbg !159
  store i32* null, i32** %data, align 8, !dbg !160
  %0 = load i32, i32* @globalTrue, align 4, !dbg !161
  %tobool = icmp ne i32 %0, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end2, !dbg !163

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !164
  %1 = bitcast i8* %call to i32*, !dbg !166
  store i32* %1, i32** %data, align 8, !dbg !167
  %2 = load i32*, i32** %data, align 8, !dbg !168
  %cmp = icmp eq i32* %2, null, !dbg !170
  br i1 %cmp, label %if.then1, label %if.end, !dbg !171

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !174

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !175, metadata !DIExpression()), !dbg !177
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !180, metadata !DIExpression()), !dbg !181
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !182
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !183
  store i64 %call3, i64* %sourceLen, align 8, !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !188
  %5 = load i64, i64* %sourceLen, align 8, !dbg !190
  %add = add i64 %5, 1, !dbg !191
  %cmp4 = icmp ult i64 %4, %add, !dbg !192
  br i1 %cmp4, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !196
  %7 = load i32, i32* %arrayidx, align 4, !dbg !196
  %8 = load i32*, i32** %data, align 8, !dbg !197
  %9 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !197
  store i32 %7, i32* %arrayidx5, align 4, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !201
  %inc = add i64 %10, 1, !dbg !201
  store i64 %inc, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !205
  call void @printWLine(i32* %11), !dbg !206
  %12 = load i32*, i32** %data, align 8, !dbg !207
  %13 = bitcast i32* %12 to i8*, !dbg !207
  call void @free(i8* %13) #7, !dbg !208
  ret void, !dbg !209
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!43 = !DILocalVariable(name: "i", scope: !38, file: !17, line: 40, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 40, column: 16, scope: !38)
!47 = !DILocalVariable(name: "sourceLen", scope: !38, file: !17, line: 40, type: !44)
!48 = !DILocation(line: 40, column: 19, scope: !38)
!49 = !DILocation(line: 41, column: 28, scope: !38)
!50 = !DILocation(line: 41, column: 21, scope: !38)
!51 = !DILocation(line: 41, column: 19, scope: !38)
!52 = !DILocation(line: 44, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !17, line: 44, column: 9)
!54 = !DILocation(line: 44, column: 14, scope: !53)
!55 = !DILocation(line: 44, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !17, line: 44, column: 9)
!57 = !DILocation(line: 44, column: 25, scope: !56)
!58 = !DILocation(line: 44, column: 35, scope: !56)
!59 = !DILocation(line: 44, column: 23, scope: !56)
!60 = !DILocation(line: 44, column: 9, scope: !53)
!61 = !DILocation(line: 46, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !17, line: 45, column: 9)
!63 = !DILocation(line: 46, column: 23, scope: !62)
!64 = !DILocation(line: 46, column: 13, scope: !62)
!65 = !DILocation(line: 46, column: 18, scope: !62)
!66 = !DILocation(line: 46, column: 21, scope: !62)
!67 = !DILocation(line: 47, column: 9, scope: !62)
!68 = !DILocation(line: 44, column: 41, scope: !56)
!69 = !DILocation(line: 44, column: 9, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 47, column: 9, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 48, column: 20, scope: !38)
!74 = !DILocation(line: 48, column: 9, scope: !38)
!75 = !DILocation(line: 49, column: 14, scope: !38)
!76 = !DILocation(line: 49, column: 9, scope: !38)
!77 = !DILocation(line: 51, column: 1, scope: !16)
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_10_good", scope: !17, file: !17, line: 114, type: !18, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 116, column: 5, scope: !78)
!80 = !DILocation(line: 117, column: 5, scope: !78)
!81 = !DILocation(line: 118, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 130, type: !83, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!7, !7, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !17, line: 130, type: !7)
!89 = !DILocation(line: 130, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !17, line: 130, type: !85)
!91 = !DILocation(line: 130, column: 27, scope: !82)
!92 = !DILocation(line: 133, column: 22, scope: !82)
!93 = !DILocation(line: 133, column: 12, scope: !82)
!94 = !DILocation(line: 133, column: 5, scope: !82)
!95 = !DILocation(line: 135, column: 5, scope: !82)
!96 = !DILocation(line: 136, column: 5, scope: !82)
!97 = !DILocation(line: 137, column: 5, scope: !82)
!98 = !DILocation(line: 140, column: 5, scope: !82)
!99 = !DILocation(line: 141, column: 5, scope: !82)
!100 = !DILocation(line: 142, column: 5, scope: !82)
!101 = !DILocation(line: 144, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !17, line: 60, type: !4)
!104 = !DILocation(line: 60, column: 15, scope: !102)
!105 = !DILocation(line: 61, column: 10, scope: !102)
!106 = !DILocation(line: 62, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !17, line: 62, column: 8)
!108 = !DILocation(line: 62, column: 8, scope: !102)
!109 = !DILocation(line: 65, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !17, line: 63, column: 5)
!111 = !DILocation(line: 66, column: 5, scope: !110)
!112 = !DILocation(line: 70, column: 27, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !17, line: 68, column: 5)
!114 = !DILocation(line: 70, column: 16, scope: !113)
!115 = !DILocation(line: 70, column: 14, scope: !113)
!116 = !DILocation(line: 71, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 71, column: 13)
!118 = !DILocation(line: 71, column: 18, scope: !117)
!119 = !DILocation(line: 71, column: 13, scope: !113)
!120 = !DILocation(line: 71, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 71, column: 27)
!122 = !DILocalVariable(name: "source", scope: !123, file: !17, line: 74, type: !39)
!123 = distinct !DILexicalBlock(scope: !102, file: !17, line: 73, column: 5)
!124 = !DILocation(line: 74, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !17, line: 75, type: !44)
!126 = !DILocation(line: 75, column: 16, scope: !123)
!127 = !DILocalVariable(name: "sourceLen", scope: !123, file: !17, line: 75, type: !44)
!128 = !DILocation(line: 75, column: 19, scope: !123)
!129 = !DILocation(line: 76, column: 28, scope: !123)
!130 = !DILocation(line: 76, column: 21, scope: !123)
!131 = !DILocation(line: 76, column: 19, scope: !123)
!132 = !DILocation(line: 79, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !17, line: 79, column: 9)
!134 = !DILocation(line: 79, column: 14, scope: !133)
!135 = !DILocation(line: 79, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !17, line: 79, column: 9)
!137 = !DILocation(line: 79, column: 25, scope: !136)
!138 = !DILocation(line: 79, column: 35, scope: !136)
!139 = !DILocation(line: 79, column: 23, scope: !136)
!140 = !DILocation(line: 79, column: 9, scope: !133)
!141 = !DILocation(line: 81, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !17, line: 80, column: 9)
!143 = !DILocation(line: 81, column: 23, scope: !142)
!144 = !DILocation(line: 81, column: 13, scope: !142)
!145 = !DILocation(line: 81, column: 18, scope: !142)
!146 = !DILocation(line: 81, column: 21, scope: !142)
!147 = !DILocation(line: 82, column: 9, scope: !142)
!148 = !DILocation(line: 79, column: 41, scope: !136)
!149 = !DILocation(line: 79, column: 9, scope: !136)
!150 = distinct !{!150, !140, !151, !72}
!151 = !DILocation(line: 82, column: 9, scope: !133)
!152 = !DILocation(line: 83, column: 20, scope: !123)
!153 = !DILocation(line: 83, column: 9, scope: !123)
!154 = !DILocation(line: 84, column: 14, scope: !123)
!155 = !DILocation(line: 84, column: 9, scope: !123)
!156 = !DILocation(line: 86, column: 1, scope: !102)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 89, type: !18, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !17, line: 91, type: !4)
!159 = !DILocation(line: 91, column: 15, scope: !157)
!160 = !DILocation(line: 92, column: 10, scope: !157)
!161 = !DILocation(line: 93, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !17, line: 93, column: 8)
!163 = !DILocation(line: 93, column: 8, scope: !157)
!164 = !DILocation(line: 96, column: 27, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !17, line: 94, column: 5)
!166 = !DILocation(line: 96, column: 16, scope: !165)
!167 = !DILocation(line: 96, column: 14, scope: !165)
!168 = !DILocation(line: 97, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !17, line: 97, column: 13)
!170 = !DILocation(line: 97, column: 18, scope: !169)
!171 = !DILocation(line: 97, column: 13, scope: !165)
!172 = !DILocation(line: 97, column: 28, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !17, line: 97, column: 27)
!174 = !DILocation(line: 98, column: 5, scope: !165)
!175 = !DILocalVariable(name: "source", scope: !176, file: !17, line: 100, type: !39)
!176 = distinct !DILexicalBlock(scope: !157, file: !17, line: 99, column: 5)
!177 = !DILocation(line: 100, column: 17, scope: !176)
!178 = !DILocalVariable(name: "i", scope: !176, file: !17, line: 101, type: !44)
!179 = !DILocation(line: 101, column: 16, scope: !176)
!180 = !DILocalVariable(name: "sourceLen", scope: !176, file: !17, line: 101, type: !44)
!181 = !DILocation(line: 101, column: 19, scope: !176)
!182 = !DILocation(line: 102, column: 28, scope: !176)
!183 = !DILocation(line: 102, column: 21, scope: !176)
!184 = !DILocation(line: 102, column: 19, scope: !176)
!185 = !DILocation(line: 105, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !17, line: 105, column: 9)
!187 = !DILocation(line: 105, column: 14, scope: !186)
!188 = !DILocation(line: 105, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !17, line: 105, column: 9)
!190 = !DILocation(line: 105, column: 25, scope: !189)
!191 = !DILocation(line: 105, column: 35, scope: !189)
!192 = !DILocation(line: 105, column: 23, scope: !189)
!193 = !DILocation(line: 105, column: 9, scope: !186)
!194 = !DILocation(line: 107, column: 30, scope: !195)
!195 = distinct !DILexicalBlock(scope: !189, file: !17, line: 106, column: 9)
!196 = !DILocation(line: 107, column: 23, scope: !195)
!197 = !DILocation(line: 107, column: 13, scope: !195)
!198 = !DILocation(line: 107, column: 18, scope: !195)
!199 = !DILocation(line: 107, column: 21, scope: !195)
!200 = !DILocation(line: 108, column: 9, scope: !195)
!201 = !DILocation(line: 105, column: 41, scope: !189)
!202 = !DILocation(line: 105, column: 9, scope: !189)
!203 = distinct !{!203, !193, !204, !72}
!204 = !DILocation(line: 108, column: 9, scope: !186)
!205 = !DILocation(line: 109, column: 20, scope: !176)
!206 = !DILocation(line: 109, column: 9, scope: !176)
!207 = !DILocation(line: 110, column: 14, scope: !176)
!208 = !DILocation(line: 110, column: 9, scope: !176)
!209 = !DILocation(line: 112, column: 1, scope: !157)
