; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end3, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_bad.source to i8*), i64 44, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !53
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !54
  store i64 %call4, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !59
  %5 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %5, 1, !dbg !62
  %cmp5 = icmp ult i64 %4, %add, !dbg !63
  br i1 %cmp5, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !67
  %7 = load i32, i32* %arrayidx, align 4, !dbg !67
  %8 = load i32*, i32** %data, align 8, !dbg !68
  %9 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !68
  store i32 %7, i32* %arrayidx6, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %10, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %11), !dbg !78
  %12 = load i32*, i32** %data, align 8, !dbg !79
  %13 = bitcast i32* %12 to i8*, !dbg !79
  call void @free(i8* %13) #7, !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  %0 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp = icmp ne i32 %0, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end3, !dbg !116

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !117
  %1 = bitcast i8* %call to i32*, !dbg !119
  store i32* %1, i32** %data, align 8, !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %cmp1 = icmp eq i32* %2, null, !dbg !123
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !124

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !134
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !135
  store i64 %call4, i64* %sourceLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !140
  %5 = load i64, i64* %sourceLen, align 8, !dbg !142
  %add = add i64 %5, 1, !dbg !143
  %cmp5 = icmp ult i64 %4, %add, !dbg !144
  br i1 %cmp5, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !148
  %7 = load i32, i32* %arrayidx, align 4, !dbg !148
  %8 = load i32*, i32** %data, align 8, !dbg !149
  %9 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !149
  store i32 %7, i32* %arrayidx6, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %10, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %11), !dbg !158
  %12 = load i32*, i32** %data, align 8, !dbg !159
  %13 = bitcast i32* %12 to i8*, !dbg !159
  call void @free(i8* %13) #7, !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !163, metadata !DIExpression()), !dbg !164
  store i32* null, i32** %data, align 8, !dbg !165
  %0 = load i32, i32* @staticFive, align 4, !dbg !166
  %cmp = icmp eq i32 %0, 5, !dbg !168
  br i1 %cmp, label %if.then, label %if.end3, !dbg !169

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !170
  %1 = bitcast i8* %call to i32*, !dbg !172
  store i32* %1, i32** %data, align 8, !dbg !173
  %2 = load i32*, i32** %data, align 8, !dbg !174
  %cmp1 = icmp eq i32* %2, null, !dbg !176
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !177

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !178
  unreachable, !dbg !178

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !180

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !181, metadata !DIExpression()), !dbg !183
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !186, metadata !DIExpression()), !dbg !187
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !188
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !189
  store i64 %call4, i64* %sourceLen, align 8, !dbg !190
  store i64 0, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !194
  %5 = load i64, i64* %sourceLen, align 8, !dbg !196
  %add = add i64 %5, 1, !dbg !197
  %cmp5 = icmp ult i64 %4, %add, !dbg !198
  br i1 %cmp5, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !202
  %7 = load i32, i32* %arrayidx, align 4, !dbg !202
  %8 = load i32*, i32** %data, align 8, !dbg !203
  %9 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !203
  store i32 %7, i32* %arrayidx6, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %10, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* %11), !dbg !212
  %12 = load i32*, i32** %data, align 8, !dbg !213
  %13 = bitcast i32* %12 to i8*, !dbg !213
  call void @free(i8* %13) #7, !dbg !214
  ret void, !dbg !215
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_bad", scope: !13, file: !13, line: 34, type: !21, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 36, type: !6)
!24 = !DILocation(line: 36, column: 15, scope: !20)
!25 = !DILocation(line: 37, column: 10, scope: !20)
!26 = !DILocation(line: 38, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 38, column: 8)
!28 = !DILocation(line: 38, column: 18, scope: !27)
!29 = !DILocation(line: 38, column: 8, scope: !20)
!30 = !DILocation(line: 41, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 39, column: 5)
!32 = !DILocation(line: 41, column: 16, scope: !31)
!33 = !DILocation(line: 41, column: 14, scope: !31)
!34 = !DILocation(line: 42, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 42, column: 13)
!36 = !DILocation(line: 42, column: 18, scope: !35)
!37 = !DILocation(line: 42, column: 13, scope: !31)
!38 = !DILocation(line: 42, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 42, column: 27)
!40 = !DILocation(line: 43, column: 5, scope: !31)
!41 = !DILocalVariable(name: "source", scope: !42, file: !13, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !13, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 11)
!46 = !DILocation(line: 45, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !13, line: 46, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 46, column: 16, scope: !42)
!51 = !DILocalVariable(name: "sourceLen", scope: !42, file: !13, line: 46, type: !48)
!52 = !DILocation(line: 46, column: 19, scope: !42)
!53 = !DILocation(line: 47, column: 28, scope: !42)
!54 = !DILocation(line: 47, column: 21, scope: !42)
!55 = !DILocation(line: 47, column: 19, scope: !42)
!56 = !DILocation(line: 50, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !42, file: !13, line: 50, column: 9)
!58 = !DILocation(line: 50, column: 14, scope: !57)
!59 = !DILocation(line: 50, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !13, line: 50, column: 9)
!61 = !DILocation(line: 50, column: 25, scope: !60)
!62 = !DILocation(line: 50, column: 35, scope: !60)
!63 = !DILocation(line: 50, column: 23, scope: !60)
!64 = !DILocation(line: 50, column: 9, scope: !57)
!65 = !DILocation(line: 52, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !13, line: 51, column: 9)
!67 = !DILocation(line: 52, column: 23, scope: !66)
!68 = !DILocation(line: 52, column: 13, scope: !66)
!69 = !DILocation(line: 52, column: 18, scope: !66)
!70 = !DILocation(line: 52, column: 21, scope: !66)
!71 = !DILocation(line: 53, column: 9, scope: !66)
!72 = !DILocation(line: 50, column: 41, scope: !60)
!73 = !DILocation(line: 50, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 53, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 54, column: 20, scope: !42)
!78 = !DILocation(line: 54, column: 9, scope: !42)
!79 = !DILocation(line: 55, column: 14, scope: !42)
!80 = !DILocation(line: 55, column: 9, scope: !42)
!81 = !DILocation(line: 57, column: 1, scope: !20)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_07_good", scope: !13, file: !13, line: 120, type: !21, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocation(line: 122, column: 5, scope: !82)
!84 = !DILocation(line: 123, column: 5, scope: !82)
!85 = !DILocation(line: 124, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 136, type: !87, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!9, !9, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !13, line: 136, type: !9)
!93 = !DILocation(line: 136, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !13, line: 136, type: !89)
!95 = !DILocation(line: 136, column: 27, scope: !86)
!96 = !DILocation(line: 139, column: 22, scope: !86)
!97 = !DILocation(line: 139, column: 12, scope: !86)
!98 = !DILocation(line: 139, column: 5, scope: !86)
!99 = !DILocation(line: 141, column: 5, scope: !86)
!100 = !DILocation(line: 142, column: 5, scope: !86)
!101 = !DILocation(line: 143, column: 5, scope: !86)
!102 = !DILocation(line: 146, column: 5, scope: !86)
!103 = !DILocation(line: 147, column: 5, scope: !86)
!104 = !DILocation(line: 148, column: 5, scope: !86)
!105 = !DILocation(line: 150, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 64, type: !21, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 66, type: !6)
!108 = !DILocation(line: 66, column: 15, scope: !106)
!109 = !DILocation(line: 67, column: 10, scope: !106)
!110 = !DILocation(line: 68, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !13, line: 68, column: 8)
!112 = !DILocation(line: 68, column: 18, scope: !111)
!113 = !DILocation(line: 68, column: 8, scope: !106)
!114 = !DILocation(line: 71, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !13, line: 69, column: 5)
!116 = !DILocation(line: 72, column: 5, scope: !115)
!117 = !DILocation(line: 76, column: 27, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !13, line: 74, column: 5)
!119 = !DILocation(line: 76, column: 16, scope: !118)
!120 = !DILocation(line: 76, column: 14, scope: !118)
!121 = !DILocation(line: 77, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 77, column: 13)
!123 = !DILocation(line: 77, column: 18, scope: !122)
!124 = !DILocation(line: 77, column: 13, scope: !118)
!125 = !DILocation(line: 77, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 77, column: 27)
!127 = !DILocalVariable(name: "source", scope: !128, file: !13, line: 80, type: !43)
!128 = distinct !DILexicalBlock(scope: !106, file: !13, line: 79, column: 5)
!129 = !DILocation(line: 80, column: 17, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !13, line: 81, type: !48)
!131 = !DILocation(line: 81, column: 16, scope: !128)
!132 = !DILocalVariable(name: "sourceLen", scope: !128, file: !13, line: 81, type: !48)
!133 = !DILocation(line: 81, column: 19, scope: !128)
!134 = !DILocation(line: 82, column: 28, scope: !128)
!135 = !DILocation(line: 82, column: 21, scope: !128)
!136 = !DILocation(line: 82, column: 19, scope: !128)
!137 = !DILocation(line: 85, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !13, line: 85, column: 9)
!139 = !DILocation(line: 85, column: 14, scope: !138)
!140 = !DILocation(line: 85, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !13, line: 85, column: 9)
!142 = !DILocation(line: 85, column: 25, scope: !141)
!143 = !DILocation(line: 85, column: 35, scope: !141)
!144 = !DILocation(line: 85, column: 23, scope: !141)
!145 = !DILocation(line: 85, column: 9, scope: !138)
!146 = !DILocation(line: 87, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !13, line: 86, column: 9)
!148 = !DILocation(line: 87, column: 23, scope: !147)
!149 = !DILocation(line: 87, column: 13, scope: !147)
!150 = !DILocation(line: 87, column: 18, scope: !147)
!151 = !DILocation(line: 87, column: 21, scope: !147)
!152 = !DILocation(line: 88, column: 9, scope: !147)
!153 = !DILocation(line: 85, column: 41, scope: !141)
!154 = !DILocation(line: 85, column: 9, scope: !141)
!155 = distinct !{!155, !145, !156, !76}
!156 = !DILocation(line: 88, column: 9, scope: !138)
!157 = !DILocation(line: 89, column: 20, scope: !128)
!158 = !DILocation(line: 89, column: 9, scope: !128)
!159 = !DILocation(line: 90, column: 14, scope: !128)
!160 = !DILocation(line: 90, column: 9, scope: !128)
!161 = !DILocation(line: 92, column: 1, scope: !106)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 95, type: !21, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocalVariable(name: "data", scope: !162, file: !13, line: 97, type: !6)
!164 = !DILocation(line: 97, column: 15, scope: !162)
!165 = !DILocation(line: 98, column: 10, scope: !162)
!166 = !DILocation(line: 99, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !13, line: 99, column: 8)
!168 = !DILocation(line: 99, column: 18, scope: !167)
!169 = !DILocation(line: 99, column: 8, scope: !162)
!170 = !DILocation(line: 102, column: 27, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !13, line: 100, column: 5)
!172 = !DILocation(line: 102, column: 16, scope: !171)
!173 = !DILocation(line: 102, column: 14, scope: !171)
!174 = !DILocation(line: 103, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !13, line: 103, column: 13)
!176 = !DILocation(line: 103, column: 18, scope: !175)
!177 = !DILocation(line: 103, column: 13, scope: !171)
!178 = !DILocation(line: 103, column: 28, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !13, line: 103, column: 27)
!180 = !DILocation(line: 104, column: 5, scope: !171)
!181 = !DILocalVariable(name: "source", scope: !182, file: !13, line: 106, type: !43)
!182 = distinct !DILexicalBlock(scope: !162, file: !13, line: 105, column: 5)
!183 = !DILocation(line: 106, column: 17, scope: !182)
!184 = !DILocalVariable(name: "i", scope: !182, file: !13, line: 107, type: !48)
!185 = !DILocation(line: 107, column: 16, scope: !182)
!186 = !DILocalVariable(name: "sourceLen", scope: !182, file: !13, line: 107, type: !48)
!187 = !DILocation(line: 107, column: 19, scope: !182)
!188 = !DILocation(line: 108, column: 28, scope: !182)
!189 = !DILocation(line: 108, column: 21, scope: !182)
!190 = !DILocation(line: 108, column: 19, scope: !182)
!191 = !DILocation(line: 111, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !182, file: !13, line: 111, column: 9)
!193 = !DILocation(line: 111, column: 14, scope: !192)
!194 = !DILocation(line: 111, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !13, line: 111, column: 9)
!196 = !DILocation(line: 111, column: 25, scope: !195)
!197 = !DILocation(line: 111, column: 35, scope: !195)
!198 = !DILocation(line: 111, column: 23, scope: !195)
!199 = !DILocation(line: 111, column: 9, scope: !192)
!200 = !DILocation(line: 113, column: 30, scope: !201)
!201 = distinct !DILexicalBlock(scope: !195, file: !13, line: 112, column: 9)
!202 = !DILocation(line: 113, column: 23, scope: !201)
!203 = !DILocation(line: 113, column: 13, scope: !201)
!204 = !DILocation(line: 113, column: 18, scope: !201)
!205 = !DILocation(line: 113, column: 21, scope: !201)
!206 = !DILocation(line: 114, column: 9, scope: !201)
!207 = !DILocation(line: 111, column: 41, scope: !195)
!208 = !DILocation(line: 111, column: 9, scope: !195)
!209 = distinct !{!209, !199, !210, !76}
!210 = !DILocation(line: 114, column: 9, scope: !192)
!211 = !DILocation(line: 115, column: 20, scope: !182)
!212 = !DILocation(line: 115, column: 9, scope: !182)
!213 = !DILocation(line: 116, column: 14, scope: !182)
!214 = !DILocation(line: 116, column: 9, scope: !182)
!215 = !DILocation(line: 118, column: 1, scope: !162)
