; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end2, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !41

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_bad.source to i8*), i64 44, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !55
  store i64 %call3, i64* %sourceLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !60
  %5 = load i64, i64* %sourceLen, align 8, !dbg !62
  %add = add i64 %5, 1, !dbg !63
  %cmp4 = icmp ult i64 %4, %add, !dbg !64
  br i1 %cmp4, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !68
  %7 = load i32, i32* %arrayidx, align 4, !dbg !68
  %8 = load i32*, i32** %data, align 8, !dbg !69
  %9 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !69
  store i32 %7, i32* %arrayidx5, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %10, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %11), !dbg !79
  %12 = load i32*, i32** %data, align 8, !dbg !80
  %13 = bitcast i32* %12 to i8*, !dbg !80
  call void @free(i8* %13) #7, !dbg !81
  ret void, !dbg !82
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32* null, i32** %data, align 8, !dbg !110
  %0 = load i32, i32* @staticFalse, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end2, !dbg !116

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !117
  %1 = bitcast i8* %call to i32*, !dbg !119
  store i32* %1, i32** %data, align 8, !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %cmp = icmp eq i32* %2, null, !dbg !123
  br i1 %cmp, label %if.then1, label %if.end, !dbg !124

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !134
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !135
  store i64 %call3, i64* %sourceLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !140
  %5 = load i64, i64* %sourceLen, align 8, !dbg !142
  %add = add i64 %5, 1, !dbg !143
  %cmp4 = icmp ult i64 %4, %add, !dbg !144
  br i1 %cmp4, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !148
  %7 = load i32, i32* %arrayidx, align 4, !dbg !148
  %8 = load i32*, i32** %data, align 8, !dbg !149
  %9 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !149
  store i32 %7, i32* %arrayidx5, align 4, !dbg !151
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !166
  %tobool = icmp ne i32 %0, 0, !dbg !166
  br i1 %tobool, label %if.then, label %if.end2, !dbg !168

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !169
  %1 = bitcast i8* %call to i32*, !dbg !171
  store i32* %1, i32** %data, align 8, !dbg !172
  %2 = load i32*, i32** %data, align 8, !dbg !173
  %cmp = icmp eq i32* %2, null, !dbg !175
  br i1 %cmp, label %if.then1, label %if.end, !dbg !176

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !177
  unreachable, !dbg !177

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !179

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !180, metadata !DIExpression()), !dbg !182
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !182
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %i, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !185, metadata !DIExpression()), !dbg !186
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !187
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !188
  store i64 %call3, i64* %sourceLen, align 8, !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !193
  %5 = load i64, i64* %sourceLen, align 8, !dbg !195
  %add = add i64 %5, 1, !dbg !196
  %cmp4 = icmp ult i64 %4, %add, !dbg !197
  br i1 %cmp4, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !201
  %7 = load i32, i32* %arrayidx, align 4, !dbg !201
  %8 = load i32*, i32** %data, align 8, !dbg !202
  %9 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !202
  store i32 %7, i32* %arrayidx5, align 4, !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !206
  %inc = add i64 %10, 1, !dbg !206
  store i64 %inc, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !210
  call void @printWLine(i32* %11), !dbg !211
  %12 = load i32*, i32** %data, align 8, !dbg !212
  %13 = bitcast i32* %12 to i8*, !dbg !212
  call void @free(i8* %13) #7, !dbg !213
  ret void, !dbg !214
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
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 31, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_bad", scope: !15, file: !15, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 37, type: !6)
!26 = !DILocation(line: 37, column: 15, scope: !22)
!27 = !DILocation(line: 38, column: 10, scope: !22)
!28 = !DILocation(line: 39, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 8)
!30 = !DILocation(line: 39, column: 8, scope: !22)
!31 = !DILocation(line: 42, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 40, column: 5)
!33 = !DILocation(line: 42, column: 16, scope: !32)
!34 = !DILocation(line: 42, column: 14, scope: !32)
!35 = !DILocation(line: 43, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 43, column: 13)
!37 = !DILocation(line: 43, column: 18, scope: !36)
!38 = !DILocation(line: 43, column: 13, scope: !32)
!39 = !DILocation(line: 43, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 43, column: 27)
!41 = !DILocation(line: 44, column: 5, scope: !32)
!42 = !DILocalVariable(name: "source", scope: !43, file: !15, line: 46, type: !44)
!43 = distinct !DILexicalBlock(scope: !22, file: !15, line: 45, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 11)
!47 = !DILocation(line: 46, column: 17, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !15, line: 47, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 47, column: 16, scope: !43)
!52 = !DILocalVariable(name: "sourceLen", scope: !43, file: !15, line: 47, type: !49)
!53 = !DILocation(line: 47, column: 19, scope: !43)
!54 = !DILocation(line: 48, column: 28, scope: !43)
!55 = !DILocation(line: 48, column: 21, scope: !43)
!56 = !DILocation(line: 48, column: 19, scope: !43)
!57 = !DILocation(line: 51, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !43, file: !15, line: 51, column: 9)
!59 = !DILocation(line: 51, column: 14, scope: !58)
!60 = !DILocation(line: 51, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !15, line: 51, column: 9)
!62 = !DILocation(line: 51, column: 25, scope: !61)
!63 = !DILocation(line: 51, column: 35, scope: !61)
!64 = !DILocation(line: 51, column: 23, scope: !61)
!65 = !DILocation(line: 51, column: 9, scope: !58)
!66 = !DILocation(line: 53, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !15, line: 52, column: 9)
!68 = !DILocation(line: 53, column: 23, scope: !67)
!69 = !DILocation(line: 53, column: 13, scope: !67)
!70 = !DILocation(line: 53, column: 18, scope: !67)
!71 = !DILocation(line: 53, column: 21, scope: !67)
!72 = !DILocation(line: 54, column: 9, scope: !67)
!73 = !DILocation(line: 51, column: 41, scope: !61)
!74 = !DILocation(line: 51, column: 9, scope: !61)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 54, column: 9, scope: !58)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 55, column: 20, scope: !43)
!79 = !DILocation(line: 55, column: 9, scope: !43)
!80 = !DILocation(line: 56, column: 14, scope: !43)
!81 = !DILocation(line: 56, column: 9, scope: !43)
!82 = !DILocation(line: 58, column: 1, scope: !22)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_05_good", scope: !15, file: !15, line: 121, type: !23, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocation(line: 123, column: 5, scope: !83)
!85 = !DILocation(line: 124, column: 5, scope: !83)
!86 = !DILocation(line: 125, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 137, type: !88, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DISubroutineType(types: !89)
!89 = !{!9, !9, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !15, line: 137, type: !9)
!94 = !DILocation(line: 137, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !15, line: 137, type: !90)
!96 = !DILocation(line: 137, column: 27, scope: !87)
!97 = !DILocation(line: 140, column: 22, scope: !87)
!98 = !DILocation(line: 140, column: 12, scope: !87)
!99 = !DILocation(line: 140, column: 5, scope: !87)
!100 = !DILocation(line: 142, column: 5, scope: !87)
!101 = !DILocation(line: 143, column: 5, scope: !87)
!102 = !DILocation(line: 144, column: 5, scope: !87)
!103 = !DILocation(line: 147, column: 5, scope: !87)
!104 = !DILocation(line: 148, column: 5, scope: !87)
!105 = !DILocation(line: 149, column: 5, scope: !87)
!106 = !DILocation(line: 151, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 65, type: !23, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 67, type: !6)
!109 = !DILocation(line: 67, column: 15, scope: !107)
!110 = !DILocation(line: 68, column: 10, scope: !107)
!111 = !DILocation(line: 69, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 69, column: 8)
!113 = !DILocation(line: 69, column: 8, scope: !107)
!114 = !DILocation(line: 72, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 70, column: 5)
!116 = !DILocation(line: 73, column: 5, scope: !115)
!117 = !DILocation(line: 77, column: 27, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !15, line: 75, column: 5)
!119 = !DILocation(line: 77, column: 16, scope: !118)
!120 = !DILocation(line: 77, column: 14, scope: !118)
!121 = !DILocation(line: 78, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 78, column: 13)
!123 = !DILocation(line: 78, column: 18, scope: !122)
!124 = !DILocation(line: 78, column: 13, scope: !118)
!125 = !DILocation(line: 78, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 78, column: 27)
!127 = !DILocalVariable(name: "source", scope: !128, file: !15, line: 81, type: !44)
!128 = distinct !DILexicalBlock(scope: !107, file: !15, line: 80, column: 5)
!129 = !DILocation(line: 81, column: 17, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !15, line: 82, type: !49)
!131 = !DILocation(line: 82, column: 16, scope: !128)
!132 = !DILocalVariable(name: "sourceLen", scope: !128, file: !15, line: 82, type: !49)
!133 = !DILocation(line: 82, column: 19, scope: !128)
!134 = !DILocation(line: 83, column: 28, scope: !128)
!135 = !DILocation(line: 83, column: 21, scope: !128)
!136 = !DILocation(line: 83, column: 19, scope: !128)
!137 = !DILocation(line: 86, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !15, line: 86, column: 9)
!139 = !DILocation(line: 86, column: 14, scope: !138)
!140 = !DILocation(line: 86, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !15, line: 86, column: 9)
!142 = !DILocation(line: 86, column: 25, scope: !141)
!143 = !DILocation(line: 86, column: 35, scope: !141)
!144 = !DILocation(line: 86, column: 23, scope: !141)
!145 = !DILocation(line: 86, column: 9, scope: !138)
!146 = !DILocation(line: 88, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !15, line: 87, column: 9)
!148 = !DILocation(line: 88, column: 23, scope: !147)
!149 = !DILocation(line: 88, column: 13, scope: !147)
!150 = !DILocation(line: 88, column: 18, scope: !147)
!151 = !DILocation(line: 88, column: 21, scope: !147)
!152 = !DILocation(line: 89, column: 9, scope: !147)
!153 = !DILocation(line: 86, column: 41, scope: !141)
!154 = !DILocation(line: 86, column: 9, scope: !141)
!155 = distinct !{!155, !145, !156, !77}
!156 = !DILocation(line: 89, column: 9, scope: !138)
!157 = !DILocation(line: 90, column: 20, scope: !128)
!158 = !DILocation(line: 90, column: 9, scope: !128)
!159 = !DILocation(line: 91, column: 14, scope: !128)
!160 = !DILocation(line: 91, column: 9, scope: !128)
!161 = !DILocation(line: 93, column: 1, scope: !107)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 96, type: !23, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocalVariable(name: "data", scope: !162, file: !15, line: 98, type: !6)
!164 = !DILocation(line: 98, column: 15, scope: !162)
!165 = !DILocation(line: 99, column: 10, scope: !162)
!166 = !DILocation(line: 100, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !15, line: 100, column: 8)
!168 = !DILocation(line: 100, column: 8, scope: !162)
!169 = !DILocation(line: 103, column: 27, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 101, column: 5)
!171 = !DILocation(line: 103, column: 16, scope: !170)
!172 = !DILocation(line: 103, column: 14, scope: !170)
!173 = !DILocation(line: 104, column: 13, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 104, column: 13)
!175 = !DILocation(line: 104, column: 18, scope: !174)
!176 = !DILocation(line: 104, column: 13, scope: !170)
!177 = !DILocation(line: 104, column: 28, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !15, line: 104, column: 27)
!179 = !DILocation(line: 105, column: 5, scope: !170)
!180 = !DILocalVariable(name: "source", scope: !181, file: !15, line: 107, type: !44)
!181 = distinct !DILexicalBlock(scope: !162, file: !15, line: 106, column: 5)
!182 = !DILocation(line: 107, column: 17, scope: !181)
!183 = !DILocalVariable(name: "i", scope: !181, file: !15, line: 108, type: !49)
!184 = !DILocation(line: 108, column: 16, scope: !181)
!185 = !DILocalVariable(name: "sourceLen", scope: !181, file: !15, line: 108, type: !49)
!186 = !DILocation(line: 108, column: 19, scope: !181)
!187 = !DILocation(line: 109, column: 28, scope: !181)
!188 = !DILocation(line: 109, column: 21, scope: !181)
!189 = !DILocation(line: 109, column: 19, scope: !181)
!190 = !DILocation(line: 112, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !181, file: !15, line: 112, column: 9)
!192 = !DILocation(line: 112, column: 14, scope: !191)
!193 = !DILocation(line: 112, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !15, line: 112, column: 9)
!195 = !DILocation(line: 112, column: 25, scope: !194)
!196 = !DILocation(line: 112, column: 35, scope: !194)
!197 = !DILocation(line: 112, column: 23, scope: !194)
!198 = !DILocation(line: 112, column: 9, scope: !191)
!199 = !DILocation(line: 114, column: 30, scope: !200)
!200 = distinct !DILexicalBlock(scope: !194, file: !15, line: 113, column: 9)
!201 = !DILocation(line: 114, column: 23, scope: !200)
!202 = !DILocation(line: 114, column: 13, scope: !200)
!203 = !DILocation(line: 114, column: 18, scope: !200)
!204 = !DILocation(line: 114, column: 21, scope: !200)
!205 = !DILocation(line: 115, column: 9, scope: !200)
!206 = !DILocation(line: 112, column: 41, scope: !194)
!207 = !DILocation(line: 112, column: 9, scope: !194)
!208 = distinct !{!208, !198, !209, !77}
!209 = !DILocation(line: 115, column: 9, scope: !191)
!210 = !DILocation(line: 116, column: 20, scope: !181)
!211 = !DILocation(line: 116, column: 9, scope: !181)
!212 = !DILocation(line: 117, column: 14, scope: !181)
!213 = !DILocation(line: 117, column: 9, scope: !181)
!214 = !DILocation(line: 119, column: 1, scope: !162)
