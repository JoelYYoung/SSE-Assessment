; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %2, 0, !dbg !36
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !38

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !55, metadata !DIExpression()), !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %call4 = call i64 @wcslen(i32* %6) #9, !dbg !58
  store i64 %call4, i64* %dataLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end3
  %7 = load i64, i64* %i, align 8, !dbg !63
  %8 = load i64, i64* %dataLen, align 8, !dbg !65
  %cmp5 = icmp ult i64 %7, %8, !dbg !66
  br i1 %cmp5, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !68
  %10 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !68
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !68
  %12 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !72
  store i32 %11, i32* %arrayidx7, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %13, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !80
  store i32 0, i32* %arrayidx8, align 4, !dbg !81
  %14 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* %14), !dbg !83
  %15 = load i32*, i32** %data, align 8, !dbg !84
  %16 = bitcast i32* %15 to i8*, !dbg !84
  call void @free(i8* %16) #7, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %data, align 8, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !123
  %tobool = icmp ne i32 %2, 0, !dbg !123
  br i1 %tobool, label %if.then1, label %if.else, !dbg !125

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  br label %if.end3, !dbg !128

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !129
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !131
  %4 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !139, metadata !DIExpression()), !dbg !140
  %6 = load i32*, i32** %data, align 8, !dbg !141
  %call4 = call i64 @wcslen(i32* %6) #9, !dbg !142
  store i64 %call4, i64* %dataLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end3
  %7 = load i64, i64* %i, align 8, !dbg !147
  %8 = load i64, i64* %dataLen, align 8, !dbg !149
  %cmp5 = icmp ult i64 %7, %8, !dbg !150
  br i1 %cmp5, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !152
  %10 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !152
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !152
  %12 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !156
  store i32 %11, i32* %arrayidx7, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %13, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !163
  store i32 0, i32* %arrayidx8, align 4, !dbg !164
  %14 = load i32*, i32** %data, align 8, !dbg !165
  call void @printWLine(i32* %14), !dbg !166
  %15 = load i32*, i32** %data, align 8, !dbg !167
  %16 = bitcast i32* %15 to i8*, !dbg !167
  call void @free(i8* %16) #7, !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !171, metadata !DIExpression()), !dbg !172
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !173
  %0 = bitcast i8* %call to i32*, !dbg !174
  store i32* %0, i32** %data, align 8, !dbg !175
  %1 = load i32*, i32** %data, align 8, !dbg !176
  %cmp = icmp eq i32* %1, null, !dbg !178
  br i1 %cmp, label %if.then, label %if.end, !dbg !179

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !182
  %tobool = icmp ne i32 %2, 0, !dbg !182
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !184

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !185
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !187
  %4 = load i32*, i32** %data, align 8, !dbg !188
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !189
  br label %if.end3, !dbg !190

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !191, metadata !DIExpression()), !dbg !193
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %i, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !196, metadata !DIExpression()), !dbg !197
  %6 = load i32*, i32** %data, align 8, !dbg !198
  %call4 = call i64 @wcslen(i32* %6) #9, !dbg !199
  store i64 %call4, i64* %dataLen, align 8, !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.end3
  %7 = load i64, i64* %i, align 8, !dbg !204
  %8 = load i64, i64* %dataLen, align 8, !dbg !206
  %cmp5 = icmp ult i64 %7, %8, !dbg !207
  br i1 %cmp5, label %for.body, label %for.end, !dbg !208

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !209
  %10 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !209
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !209
  %12 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !213
  store i32 %11, i32* %arrayidx7, align 4, !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !216
  %inc = add i64 %13, 1, !dbg !216
  store i64 %inc, i64* %i, align 8, !dbg !216
  br label %for.cond, !dbg !217, !llvm.loop !218

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !220
  store i32 0, i32* %arrayidx8, align 4, !dbg !221
  %14 = load i32*, i32** %data, align 8, !dbg !222
  call void @printWLine(i32* %14), !dbg !223
  %15 = load i32*, i32** %data, align 8, !dbg !224
  %16 = bitcast i32* %15 to i8*, !dbg !224
  call void @free(i8* %16) #7, !dbg !225
  ret void, !dbg !226
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 23, scope: !22)
!28 = !DILocation(line: 33, column: 12, scope: !22)
!29 = !DILocation(line: 33, column: 10, scope: !22)
!30 = !DILocation(line: 34, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 9)
!32 = !DILocation(line: 34, column: 14, scope: !31)
!33 = !DILocation(line: 34, column: 9, scope: !22)
!34 = !DILocation(line: 34, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 34, column: 23)
!36 = !DILocation(line: 35, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 8)
!38 = !DILocation(line: 35, column: 8, scope: !22)
!39 = !DILocation(line: 38, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 36, column: 5)
!41 = !DILocation(line: 38, column: 9, scope: !40)
!42 = !DILocation(line: 39, column: 9, scope: !40)
!43 = !DILocation(line: 39, column: 21, scope: !40)
!44 = !DILocation(line: 40, column: 5, scope: !40)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !15, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 42, column: 17, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !46, file: !15, line: 43, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 43, column: 16, scope: !46)
!55 = !DILocalVariable(name: "dataLen", scope: !46, file: !15, line: 43, type: !52)
!56 = !DILocation(line: 43, column: 19, scope: !46)
!57 = !DILocation(line: 44, column: 26, scope: !46)
!58 = !DILocation(line: 44, column: 19, scope: !46)
!59 = !DILocation(line: 44, column: 17, scope: !46)
!60 = !DILocation(line: 46, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !46, file: !15, line: 46, column: 9)
!62 = !DILocation(line: 46, column: 14, scope: !61)
!63 = !DILocation(line: 46, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !15, line: 46, column: 9)
!65 = !DILocation(line: 46, column: 25, scope: !64)
!66 = !DILocation(line: 46, column: 23, scope: !64)
!67 = !DILocation(line: 46, column: 9, scope: !61)
!68 = !DILocation(line: 48, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !15, line: 47, column: 9)
!70 = !DILocation(line: 48, column: 28, scope: !69)
!71 = !DILocation(line: 48, column: 18, scope: !69)
!72 = !DILocation(line: 48, column: 13, scope: !69)
!73 = !DILocation(line: 48, column: 21, scope: !69)
!74 = !DILocation(line: 49, column: 9, scope: !69)
!75 = !DILocation(line: 46, column: 35, scope: !64)
!76 = !DILocation(line: 46, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 49, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 50, column: 9, scope: !46)
!81 = !DILocation(line: 50, column: 20, scope: !46)
!82 = !DILocation(line: 51, column: 20, scope: !46)
!83 = !DILocation(line: 51, column: 9, scope: !46)
!84 = !DILocation(line: 52, column: 14, scope: !46)
!85 = !DILocation(line: 52, column: 9, scope: !46)
!86 = !DILocation(line: 54, column: 1, scope: !22)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_05_good", scope: !15, file: !15, line: 119, type: !23, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 121, column: 5, scope: !87)
!89 = !DILocation(line: 122, column: 5, scope: !87)
!90 = !DILocation(line: 123, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 135, type: !92, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DISubroutineType(types: !93)
!93 = !{!9, !9, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !15, line: 135, type: !9)
!98 = !DILocation(line: 135, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !15, line: 135, type: !94)
!100 = !DILocation(line: 135, column: 27, scope: !91)
!101 = !DILocation(line: 138, column: 22, scope: !91)
!102 = !DILocation(line: 138, column: 12, scope: !91)
!103 = !DILocation(line: 138, column: 5, scope: !91)
!104 = !DILocation(line: 140, column: 5, scope: !91)
!105 = !DILocation(line: 141, column: 5, scope: !91)
!106 = !DILocation(line: 142, column: 5, scope: !91)
!107 = !DILocation(line: 145, column: 5, scope: !91)
!108 = !DILocation(line: 146, column: 5, scope: !91)
!109 = !DILocation(line: 147, column: 5, scope: !91)
!110 = !DILocation(line: 149, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !23, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 63, type: !6)
!113 = !DILocation(line: 63, column: 15, scope: !111)
!114 = !DILocation(line: 64, column: 23, scope: !111)
!115 = !DILocation(line: 64, column: 12, scope: !111)
!116 = !DILocation(line: 64, column: 10, scope: !111)
!117 = !DILocation(line: 65, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !15, line: 65, column: 9)
!119 = !DILocation(line: 65, column: 14, scope: !118)
!120 = !DILocation(line: 65, column: 9, scope: !111)
!121 = !DILocation(line: 65, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 65, column: 23)
!123 = !DILocation(line: 66, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !111, file: !15, line: 66, column: 8)
!125 = !DILocation(line: 66, column: 8, scope: !111)
!126 = !DILocation(line: 69, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 67, column: 5)
!128 = !DILocation(line: 70, column: 5, scope: !127)
!129 = !DILocation(line: 74, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !15, line: 72, column: 5)
!131 = !DILocation(line: 74, column: 9, scope: !130)
!132 = !DILocation(line: 75, column: 9, scope: !130)
!133 = !DILocation(line: 75, column: 20, scope: !130)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !15, line: 78, type: !47)
!135 = distinct !DILexicalBlock(scope: !111, file: !15, line: 77, column: 5)
!136 = !DILocation(line: 78, column: 17, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !15, line: 79, type: !52)
!138 = !DILocation(line: 79, column: 16, scope: !135)
!139 = !DILocalVariable(name: "dataLen", scope: !135, file: !15, line: 79, type: !52)
!140 = !DILocation(line: 79, column: 19, scope: !135)
!141 = !DILocation(line: 80, column: 26, scope: !135)
!142 = !DILocation(line: 80, column: 19, scope: !135)
!143 = !DILocation(line: 80, column: 17, scope: !135)
!144 = !DILocation(line: 82, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !15, line: 82, column: 9)
!146 = !DILocation(line: 82, column: 14, scope: !145)
!147 = !DILocation(line: 82, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !15, line: 82, column: 9)
!149 = !DILocation(line: 82, column: 25, scope: !148)
!150 = !DILocation(line: 82, column: 23, scope: !148)
!151 = !DILocation(line: 82, column: 9, scope: !145)
!152 = !DILocation(line: 84, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !15, line: 83, column: 9)
!154 = !DILocation(line: 84, column: 28, scope: !153)
!155 = !DILocation(line: 84, column: 18, scope: !153)
!156 = !DILocation(line: 84, column: 13, scope: !153)
!157 = !DILocation(line: 84, column: 21, scope: !153)
!158 = !DILocation(line: 85, column: 9, scope: !153)
!159 = !DILocation(line: 82, column: 35, scope: !148)
!160 = !DILocation(line: 82, column: 9, scope: !148)
!161 = distinct !{!161, !151, !162, !79}
!162 = !DILocation(line: 85, column: 9, scope: !145)
!163 = !DILocation(line: 86, column: 9, scope: !135)
!164 = !DILocation(line: 86, column: 20, scope: !135)
!165 = !DILocation(line: 87, column: 20, scope: !135)
!166 = !DILocation(line: 87, column: 9, scope: !135)
!167 = !DILocation(line: 88, column: 14, scope: !135)
!168 = !DILocation(line: 88, column: 9, scope: !135)
!169 = !DILocation(line: 90, column: 1, scope: !111)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "data", scope: !170, file: !15, line: 95, type: !6)
!172 = !DILocation(line: 95, column: 15, scope: !170)
!173 = !DILocation(line: 96, column: 23, scope: !170)
!174 = !DILocation(line: 96, column: 12, scope: !170)
!175 = !DILocation(line: 96, column: 10, scope: !170)
!176 = !DILocation(line: 97, column: 9, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !15, line: 97, column: 9)
!178 = !DILocation(line: 97, column: 14, scope: !177)
!179 = !DILocation(line: 97, column: 9, scope: !170)
!180 = !DILocation(line: 97, column: 24, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !15, line: 97, column: 23)
!182 = !DILocation(line: 98, column: 8, scope: !183)
!183 = distinct !DILexicalBlock(scope: !170, file: !15, line: 98, column: 8)
!184 = !DILocation(line: 98, column: 8, scope: !170)
!185 = !DILocation(line: 101, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !15, line: 99, column: 5)
!187 = !DILocation(line: 101, column: 9, scope: !186)
!188 = !DILocation(line: 102, column: 9, scope: !186)
!189 = !DILocation(line: 102, column: 20, scope: !186)
!190 = !DILocation(line: 103, column: 5, scope: !186)
!191 = !DILocalVariable(name: "dest", scope: !192, file: !15, line: 105, type: !47)
!192 = distinct !DILexicalBlock(scope: !170, file: !15, line: 104, column: 5)
!193 = !DILocation(line: 105, column: 17, scope: !192)
!194 = !DILocalVariable(name: "i", scope: !192, file: !15, line: 106, type: !52)
!195 = !DILocation(line: 106, column: 16, scope: !192)
!196 = !DILocalVariable(name: "dataLen", scope: !192, file: !15, line: 106, type: !52)
!197 = !DILocation(line: 106, column: 19, scope: !192)
!198 = !DILocation(line: 107, column: 26, scope: !192)
!199 = !DILocation(line: 107, column: 19, scope: !192)
!200 = !DILocation(line: 107, column: 17, scope: !192)
!201 = !DILocation(line: 109, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !192, file: !15, line: 109, column: 9)
!203 = !DILocation(line: 109, column: 14, scope: !202)
!204 = !DILocation(line: 109, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !15, line: 109, column: 9)
!206 = !DILocation(line: 109, column: 25, scope: !205)
!207 = !DILocation(line: 109, column: 23, scope: !205)
!208 = !DILocation(line: 109, column: 9, scope: !202)
!209 = !DILocation(line: 111, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !15, line: 110, column: 9)
!211 = !DILocation(line: 111, column: 28, scope: !210)
!212 = !DILocation(line: 111, column: 18, scope: !210)
!213 = !DILocation(line: 111, column: 13, scope: !210)
!214 = !DILocation(line: 111, column: 21, scope: !210)
!215 = !DILocation(line: 112, column: 9, scope: !210)
!216 = !DILocation(line: 109, column: 35, scope: !205)
!217 = !DILocation(line: 109, column: 9, scope: !205)
!218 = distinct !{!218, !208, !219, !79}
!219 = !DILocation(line: 112, column: 9, scope: !202)
!220 = !DILocation(line: 113, column: 9, scope: !192)
!221 = !DILocation(line: 113, column: 20, scope: !192)
!222 = !DILocation(line: 114, column: 20, scope: !192)
!223 = !DILocation(line: 114, column: 9, scope: !192)
!224 = !DILocation(line: 115, column: 14, scope: !192)
!225 = !DILocation(line: 115, column: 9, scope: !192)
!226 = !DILocation(line: 117, column: 1, scope: !170)
