; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_bad.source to i8*), i64 44, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !51
  store i64 %call4, i64* %sourceLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !56
  %5 = load i64, i64* %sourceLen, align 8, !dbg !58
  %add = add i64 %5, 1, !dbg !59
  %cmp5 = icmp ult i64 %4, %add, !dbg !60
  br i1 %cmp5, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !64
  %7 = load i32, i32* %arrayidx, align 4, !dbg !64
  %8 = load i32*, i32** %data, align 8, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !65
  store i32 %7, i32* %arrayidx6, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %10, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %11), !dbg !75
  %12 = load i32*, i32** %data, align 8, !dbg !76
  %13 = bitcast i32* %12 to i8*, !dbg !76
  call void @free(i8* %13) #7, !dbg !77
  ret void, !dbg !78
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end3, !dbg !113

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !114
  %1 = bitcast i8* %call to i32*, !dbg !116
  store i32* %1, i32** %data, align 8, !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !118
  %cmp1 = icmp eq i32* %2, null, !dbg !120
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !121

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !131
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !132
  store i64 %call4, i64* %sourceLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !137
  %5 = load i64, i64* %sourceLen, align 8, !dbg !139
  %add = add i64 %5, 1, !dbg !140
  %cmp5 = icmp ult i64 %4, %add, !dbg !141
  br i1 %cmp5, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !145
  %7 = load i32, i32* %arrayidx, align 4, !dbg !145
  %8 = load i32*, i32** %data, align 8, !dbg !146
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !146
  store i32 %7, i32* %arrayidx6, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %10, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %11), !dbg !155
  %12 = load i32*, i32** %data, align 8, !dbg !156
  %13 = bitcast i32* %12 to i8*, !dbg !156
  call void @free(i8* %13) #7, !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !160, metadata !DIExpression()), !dbg !161
  store i32* null, i32** %data, align 8, !dbg !162
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !163
  %cmp = icmp eq i32 %0, 5, !dbg !165
  br i1 %cmp, label %if.then, label %if.end3, !dbg !166

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !167
  %1 = bitcast i8* %call to i32*, !dbg !169
  store i32* %1, i32** %data, align 8, !dbg !170
  %2 = load i32*, i32** %data, align 8, !dbg !171
  %cmp1 = icmp eq i32* %2, null, !dbg !173
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !174

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !175
  unreachable, !dbg !175

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !177

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !178, metadata !DIExpression()), !dbg !180
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !180
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %i, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !185
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !186
  store i64 %call4, i64* %sourceLen, align 8, !dbg !187
  store i64 0, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !191
  %5 = load i64, i64* %sourceLen, align 8, !dbg !193
  %add = add i64 %5, 1, !dbg !194
  %cmp5 = icmp ult i64 %4, %add, !dbg !195
  br i1 %cmp5, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !199
  %7 = load i32, i32* %arrayidx, align 4, !dbg !199
  %8 = load i32*, i32** %data, align 8, !dbg !200
  %9 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !200
  store i32 %7, i32* %arrayidx6, align 4, !dbg !202
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !204
  %inc = add i64 %10, 1, !dbg !204
  store i64 %inc, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !208
  call void @printWLine(i32* %11), !dbg !209
  %12 = load i32*, i32** %data, align 8, !dbg !210
  %13 = bitcast i32* %12 to i8*, !dbg !210
  call void @free(i8* %13) #7, !dbg !211
  ret void, !dbg !212
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 8)
!25 = !DILocation(line: 32, column: 25, scope: !24)
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
!44 = !DILocalVariable(name: "i", scope: !39, file: !17, line: 40, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 40, column: 16, scope: !39)
!48 = !DILocalVariable(name: "sourceLen", scope: !39, file: !17, line: 40, type: !45)
!49 = !DILocation(line: 40, column: 19, scope: !39)
!50 = !DILocation(line: 41, column: 28, scope: !39)
!51 = !DILocation(line: 41, column: 21, scope: !39)
!52 = !DILocation(line: 41, column: 19, scope: !39)
!53 = !DILocation(line: 44, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !17, line: 44, column: 9)
!55 = !DILocation(line: 44, column: 14, scope: !54)
!56 = !DILocation(line: 44, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !17, line: 44, column: 9)
!58 = !DILocation(line: 44, column: 25, scope: !57)
!59 = !DILocation(line: 44, column: 35, scope: !57)
!60 = !DILocation(line: 44, column: 23, scope: !57)
!61 = !DILocation(line: 44, column: 9, scope: !54)
!62 = !DILocation(line: 46, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !17, line: 45, column: 9)
!64 = !DILocation(line: 46, column: 23, scope: !63)
!65 = !DILocation(line: 46, column: 13, scope: !63)
!66 = !DILocation(line: 46, column: 18, scope: !63)
!67 = !DILocation(line: 46, column: 21, scope: !63)
!68 = !DILocation(line: 47, column: 9, scope: !63)
!69 = !DILocation(line: 44, column: 41, scope: !57)
!70 = !DILocation(line: 44, column: 9, scope: !57)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 47, column: 9, scope: !54)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 48, column: 20, scope: !39)
!75 = !DILocation(line: 48, column: 9, scope: !39)
!76 = !DILocation(line: 49, column: 14, scope: !39)
!77 = !DILocation(line: 49, column: 9, scope: !39)
!78 = !DILocation(line: 51, column: 1, scope: !16)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_13_good", scope: !17, file: !17, line: 114, type: !18, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 116, column: 5, scope: !79)
!81 = !DILocation(line: 117, column: 5, scope: !79)
!82 = !DILocation(line: 118, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 130, type: !84, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 130, type: !7)
!90 = !DILocation(line: 130, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 130, type: !86)
!92 = !DILocation(line: 130, column: 27, scope: !83)
!93 = !DILocation(line: 133, column: 22, scope: !83)
!94 = !DILocation(line: 133, column: 12, scope: !83)
!95 = !DILocation(line: 133, column: 5, scope: !83)
!96 = !DILocation(line: 135, column: 5, scope: !83)
!97 = !DILocation(line: 136, column: 5, scope: !83)
!98 = !DILocation(line: 137, column: 5, scope: !83)
!99 = !DILocation(line: 140, column: 5, scope: !83)
!100 = !DILocation(line: 141, column: 5, scope: !83)
!101 = !DILocation(line: 142, column: 5, scope: !83)
!102 = !DILocation(line: 144, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !17, line: 60, type: !4)
!105 = !DILocation(line: 60, column: 15, scope: !103)
!106 = !DILocation(line: 61, column: 10, scope: !103)
!107 = !DILocation(line: 62, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !17, line: 62, column: 8)
!109 = !DILocation(line: 62, column: 25, scope: !108)
!110 = !DILocation(line: 62, column: 8, scope: !103)
!111 = !DILocation(line: 65, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 63, column: 5)
!113 = !DILocation(line: 66, column: 5, scope: !112)
!114 = !DILocation(line: 70, column: 27, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !17, line: 68, column: 5)
!116 = !DILocation(line: 70, column: 16, scope: !115)
!117 = !DILocation(line: 70, column: 14, scope: !115)
!118 = !DILocation(line: 71, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 71, column: 13)
!120 = !DILocation(line: 71, column: 18, scope: !119)
!121 = !DILocation(line: 71, column: 13, scope: !115)
!122 = !DILocation(line: 71, column: 28, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 71, column: 27)
!124 = !DILocalVariable(name: "source", scope: !125, file: !17, line: 74, type: !40)
!125 = distinct !DILexicalBlock(scope: !103, file: !17, line: 73, column: 5)
!126 = !DILocation(line: 74, column: 17, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !17, line: 75, type: !45)
!128 = !DILocation(line: 75, column: 16, scope: !125)
!129 = !DILocalVariable(name: "sourceLen", scope: !125, file: !17, line: 75, type: !45)
!130 = !DILocation(line: 75, column: 19, scope: !125)
!131 = !DILocation(line: 76, column: 28, scope: !125)
!132 = !DILocation(line: 76, column: 21, scope: !125)
!133 = !DILocation(line: 76, column: 19, scope: !125)
!134 = !DILocation(line: 79, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !17, line: 79, column: 9)
!136 = !DILocation(line: 79, column: 14, scope: !135)
!137 = !DILocation(line: 79, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !17, line: 79, column: 9)
!139 = !DILocation(line: 79, column: 25, scope: !138)
!140 = !DILocation(line: 79, column: 35, scope: !138)
!141 = !DILocation(line: 79, column: 23, scope: !138)
!142 = !DILocation(line: 79, column: 9, scope: !135)
!143 = !DILocation(line: 81, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !17, line: 80, column: 9)
!145 = !DILocation(line: 81, column: 23, scope: !144)
!146 = !DILocation(line: 81, column: 13, scope: !144)
!147 = !DILocation(line: 81, column: 18, scope: !144)
!148 = !DILocation(line: 81, column: 21, scope: !144)
!149 = !DILocation(line: 82, column: 9, scope: !144)
!150 = !DILocation(line: 79, column: 41, scope: !138)
!151 = !DILocation(line: 79, column: 9, scope: !138)
!152 = distinct !{!152, !142, !153, !73}
!153 = !DILocation(line: 82, column: 9, scope: !135)
!154 = !DILocation(line: 83, column: 20, scope: !125)
!155 = !DILocation(line: 83, column: 9, scope: !125)
!156 = !DILocation(line: 84, column: 14, scope: !125)
!157 = !DILocation(line: 84, column: 9, scope: !125)
!158 = !DILocation(line: 86, column: 1, scope: !103)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 89, type: !18, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocalVariable(name: "data", scope: !159, file: !17, line: 91, type: !4)
!161 = !DILocation(line: 91, column: 15, scope: !159)
!162 = !DILocation(line: 92, column: 10, scope: !159)
!163 = !DILocation(line: 93, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !17, line: 93, column: 8)
!165 = !DILocation(line: 93, column: 25, scope: !164)
!166 = !DILocation(line: 93, column: 8, scope: !159)
!167 = !DILocation(line: 96, column: 27, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !17, line: 94, column: 5)
!169 = !DILocation(line: 96, column: 16, scope: !168)
!170 = !DILocation(line: 96, column: 14, scope: !168)
!171 = !DILocation(line: 97, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !17, line: 97, column: 13)
!173 = !DILocation(line: 97, column: 18, scope: !172)
!174 = !DILocation(line: 97, column: 13, scope: !168)
!175 = !DILocation(line: 97, column: 28, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !17, line: 97, column: 27)
!177 = !DILocation(line: 98, column: 5, scope: !168)
!178 = !DILocalVariable(name: "source", scope: !179, file: !17, line: 100, type: !40)
!179 = distinct !DILexicalBlock(scope: !159, file: !17, line: 99, column: 5)
!180 = !DILocation(line: 100, column: 17, scope: !179)
!181 = !DILocalVariable(name: "i", scope: !179, file: !17, line: 101, type: !45)
!182 = !DILocation(line: 101, column: 16, scope: !179)
!183 = !DILocalVariable(name: "sourceLen", scope: !179, file: !17, line: 101, type: !45)
!184 = !DILocation(line: 101, column: 19, scope: !179)
!185 = !DILocation(line: 102, column: 28, scope: !179)
!186 = !DILocation(line: 102, column: 21, scope: !179)
!187 = !DILocation(line: 102, column: 19, scope: !179)
!188 = !DILocation(line: 105, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !179, file: !17, line: 105, column: 9)
!190 = !DILocation(line: 105, column: 14, scope: !189)
!191 = !DILocation(line: 105, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !17, line: 105, column: 9)
!193 = !DILocation(line: 105, column: 25, scope: !192)
!194 = !DILocation(line: 105, column: 35, scope: !192)
!195 = !DILocation(line: 105, column: 23, scope: !192)
!196 = !DILocation(line: 105, column: 9, scope: !189)
!197 = !DILocation(line: 107, column: 30, scope: !198)
!198 = distinct !DILexicalBlock(scope: !192, file: !17, line: 106, column: 9)
!199 = !DILocation(line: 107, column: 23, scope: !198)
!200 = !DILocation(line: 107, column: 13, scope: !198)
!201 = !DILocation(line: 107, column: 18, scope: !198)
!202 = !DILocation(line: 107, column: 21, scope: !198)
!203 = !DILocation(line: 108, column: 9, scope: !198)
!204 = !DILocation(line: 105, column: 41, scope: !192)
!205 = !DILocation(line: 105, column: 9, scope: !192)
!206 = distinct !{!206, !196, !207, !73}
!207 = !DILocation(line: 108, column: 9, scope: !189)
!208 = !DILocation(line: 109, column: 20, scope: !179)
!209 = !DILocation(line: 109, column: 9, scope: !179)
!210 = !DILocation(line: 110, column: 14, scope: !179)
!211 = !DILocation(line: 110, column: 9, scope: !179)
!212 = !DILocation(line: 112, column: 1, scope: !159)
