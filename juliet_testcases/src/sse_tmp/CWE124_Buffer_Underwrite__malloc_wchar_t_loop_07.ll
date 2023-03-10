; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end4, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !34
  %1 = bitcast i8* %call to i32*, !dbg !35
  store i32* %1, i32** %dataBuffer, align 8, !dbg !33
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !39

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !43
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !47
  store i32* %add.ptr, i32** %data, align 8, !dbg !48
  br label %if.end4, !dbg !49

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !60
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !61
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx6, align 4, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !67
  %cmp7 = icmp ult i64 %6, 100, !dbg !69
  br i1 %cmp7, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !73
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !73
  %9 = load i32*, i32** %data, align 8, !dbg !74
  %10 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !74
  store i32 %8, i32* %arrayidx9, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %11, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx10 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !83
  store i32 0, i32* %arrayidx10, align 4, !dbg !84
  %13 = load i32*, i32** %data, align 8, !dbg !85
  call void @printWLine(i32* %13), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07_good() #0 !dbg !88 {
entry:
  call void @goodG2B1(), !dbg !89
  call void @goodG2B2(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %0 = load i32, i32* @staticFive, align 4, !dbg !116
  %cmp = icmp ne i32 %0, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end4, !dbg !122

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !126
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !127
  %1 = bitcast i8* %call to i32*, !dbg !128
  store i32* %1, i32** %dataBuffer, align 8, !dbg !126
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !129
  %cmp1 = icmp eq i32* %2, null, !dbg !131
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !132

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !135
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !136
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !139
  store i32* %5, i32** %data, align 8, !dbg !140
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !147
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx6, align 4, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !153
  %cmp7 = icmp ult i64 %6, 100, !dbg !155
  br i1 %cmp7, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !159
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !159
  %9 = load i32*, i32** %data, align 8, !dbg !160
  %10 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !160
  store i32 %8, i32* %arrayidx9, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %11, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !168
  %arrayidx10 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !168
  store i32 0, i32* %arrayidx10, align 4, !dbg !169
  %13 = load i32*, i32** %data, align 8, !dbg !170
  call void @printWLine(i32* %13), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !173 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !174, metadata !DIExpression()), !dbg !175
  store i32* null, i32** %data, align 8, !dbg !176
  %0 = load i32, i32* @staticFive, align 4, !dbg !177
  %cmp = icmp eq i32 %0, 5, !dbg !179
  br i1 %cmp, label %if.then, label %if.end4, !dbg !180

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !181, metadata !DIExpression()), !dbg !184
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !185
  %1 = bitcast i8* %call to i32*, !dbg !186
  store i32* %1, i32** %dataBuffer, align 8, !dbg !184
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !187
  %cmp1 = icmp eq i32* %2, null, !dbg !189
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !190

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !191
  unreachable, !dbg !191

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !193
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !194
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !195
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !195
  store i32 0, i32* %arrayidx, align 4, !dbg !196
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !197
  store i32* %5, i32** %data, align 8, !dbg !198
  br label %if.end4, !dbg !199

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !203, metadata !DIExpression()), !dbg !204
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !205
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !206
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !207
  store i32 0, i32* %arrayidx6, align 4, !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !212
  %cmp7 = icmp ult i64 %6, 100, !dbg !214
  br i1 %cmp7, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !218
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !218
  %9 = load i32*, i32** %data, align 8, !dbg !219
  %10 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !219
  store i32 %8, i32* %arrayidx9, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !223
  %inc = add i64 %11, 1, !dbg !223
  store i64 %inc, i64* %i, align 8, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !227
  %arrayidx10 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !227
  store i32 0, i32* %arrayidx10, align 4, !dbg !228
  %13 = load i32*, i32** %data, align 8, !dbg !229
  call void @printWLine(i32* %13), !dbg !230
  ret void, !dbg !231
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !13, line: 36, type: !6)
!31 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 23, scope: !31)
!34 = !DILocation(line: 36, column: 47, scope: !31)
!35 = !DILocation(line: 36, column: 36, scope: !31)
!36 = !DILocation(line: 37, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 17)
!38 = !DILocation(line: 37, column: 28, scope: !37)
!39 = !DILocation(line: 37, column: 17, scope: !31)
!40 = !DILocation(line: 37, column: 38, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !13, line: 37, column: 37)
!42 = !DILocation(line: 38, column: 21, scope: !31)
!43 = !DILocation(line: 38, column: 13, scope: !31)
!44 = !DILocation(line: 39, column: 13, scope: !31)
!45 = !DILocation(line: 39, column: 31, scope: !31)
!46 = !DILocation(line: 41, column: 20, scope: !31)
!47 = !DILocation(line: 41, column: 31, scope: !31)
!48 = !DILocation(line: 41, column: 18, scope: !31)
!49 = !DILocation(line: 43, column: 5, scope: !32)
!50 = !DILocalVariable(name: "i", scope: !51, file: !13, line: 45, type: !52)
!51 = distinct !DILexicalBlock(scope: !20, file: !13, line: 44, column: 5)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 45, column: 16, scope: !51)
!55 = !DILocalVariable(name: "source", scope: !51, file: !13, line: 46, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 46, column: 17, scope: !51)
!60 = !DILocation(line: 47, column: 17, scope: !51)
!61 = !DILocation(line: 47, column: 9, scope: !51)
!62 = !DILocation(line: 48, column: 9, scope: !51)
!63 = !DILocation(line: 48, column: 23, scope: !51)
!64 = !DILocation(line: 50, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !51, file: !13, line: 50, column: 9)
!66 = !DILocation(line: 50, column: 14, scope: !65)
!67 = !DILocation(line: 50, column: 21, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !13, line: 50, column: 9)
!69 = !DILocation(line: 50, column: 23, scope: !68)
!70 = !DILocation(line: 50, column: 9, scope: !65)
!71 = !DILocation(line: 52, column: 30, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !13, line: 51, column: 9)
!73 = !DILocation(line: 52, column: 23, scope: !72)
!74 = !DILocation(line: 52, column: 13, scope: !72)
!75 = !DILocation(line: 52, column: 18, scope: !72)
!76 = !DILocation(line: 52, column: 21, scope: !72)
!77 = !DILocation(line: 53, column: 9, scope: !72)
!78 = !DILocation(line: 50, column: 31, scope: !68)
!79 = !DILocation(line: 50, column: 9, scope: !68)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 53, column: 9, scope: !65)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 55, column: 9, scope: !51)
!84 = !DILocation(line: 55, column: 21, scope: !51)
!85 = !DILocation(line: 56, column: 20, scope: !51)
!86 = !DILocation(line: 56, column: 9, scope: !51)
!87 = !DILocation(line: 60, column: 1, scope: !20)
!88 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_07_good", scope: !13, file: !13, line: 139, type: !21, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocation(line: 141, column: 5, scope: !88)
!90 = !DILocation(line: 142, column: 5, scope: !88)
!91 = !DILocation(line: 143, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 155, type: !93, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DISubroutineType(types: !94)
!94 = !{!9, !9, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !13, line: 155, type: !9)
!99 = !DILocation(line: 155, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !13, line: 155, type: !95)
!101 = !DILocation(line: 155, column: 27, scope: !92)
!102 = !DILocation(line: 158, column: 22, scope: !92)
!103 = !DILocation(line: 158, column: 12, scope: !92)
!104 = !DILocation(line: 158, column: 5, scope: !92)
!105 = !DILocation(line: 160, column: 5, scope: !92)
!106 = !DILocation(line: 161, column: 5, scope: !92)
!107 = !DILocation(line: 162, column: 5, scope: !92)
!108 = !DILocation(line: 165, column: 5, scope: !92)
!109 = !DILocation(line: 166, column: 5, scope: !92)
!110 = !DILocation(line: 167, column: 5, scope: !92)
!111 = !DILocation(line: 169, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 67, type: !21, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 69, type: !6)
!114 = !DILocation(line: 69, column: 15, scope: !112)
!115 = !DILocation(line: 70, column: 10, scope: !112)
!116 = !DILocation(line: 71, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !13, line: 71, column: 8)
!118 = !DILocation(line: 71, column: 18, scope: !117)
!119 = !DILocation(line: 71, column: 8, scope: !112)
!120 = !DILocation(line: 74, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !13, line: 72, column: 5)
!122 = !DILocation(line: 75, column: 5, scope: !121)
!123 = !DILocalVariable(name: "dataBuffer", scope: !124, file: !13, line: 79, type: !6)
!124 = distinct !DILexicalBlock(scope: !125, file: !13, line: 78, column: 9)
!125 = distinct !DILexicalBlock(scope: !117, file: !13, line: 77, column: 5)
!126 = !DILocation(line: 79, column: 23, scope: !124)
!127 = !DILocation(line: 79, column: 47, scope: !124)
!128 = !DILocation(line: 79, column: 36, scope: !124)
!129 = !DILocation(line: 80, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !13, line: 80, column: 17)
!131 = !DILocation(line: 80, column: 28, scope: !130)
!132 = !DILocation(line: 80, column: 17, scope: !124)
!133 = !DILocation(line: 80, column: 38, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 80, column: 37)
!135 = !DILocation(line: 81, column: 21, scope: !124)
!136 = !DILocation(line: 81, column: 13, scope: !124)
!137 = !DILocation(line: 82, column: 13, scope: !124)
!138 = !DILocation(line: 82, column: 31, scope: !124)
!139 = !DILocation(line: 84, column: 20, scope: !124)
!140 = !DILocation(line: 84, column: 18, scope: !124)
!141 = !DILocalVariable(name: "i", scope: !142, file: !13, line: 88, type: !52)
!142 = distinct !DILexicalBlock(scope: !112, file: !13, line: 87, column: 5)
!143 = !DILocation(line: 88, column: 16, scope: !142)
!144 = !DILocalVariable(name: "source", scope: !142, file: !13, line: 89, type: !56)
!145 = !DILocation(line: 89, column: 17, scope: !142)
!146 = !DILocation(line: 90, column: 17, scope: !142)
!147 = !DILocation(line: 90, column: 9, scope: !142)
!148 = !DILocation(line: 91, column: 9, scope: !142)
!149 = !DILocation(line: 91, column: 23, scope: !142)
!150 = !DILocation(line: 93, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !142, file: !13, line: 93, column: 9)
!152 = !DILocation(line: 93, column: 14, scope: !151)
!153 = !DILocation(line: 93, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !13, line: 93, column: 9)
!155 = !DILocation(line: 93, column: 23, scope: !154)
!156 = !DILocation(line: 93, column: 9, scope: !151)
!157 = !DILocation(line: 95, column: 30, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !13, line: 94, column: 9)
!159 = !DILocation(line: 95, column: 23, scope: !158)
!160 = !DILocation(line: 95, column: 13, scope: !158)
!161 = !DILocation(line: 95, column: 18, scope: !158)
!162 = !DILocation(line: 95, column: 21, scope: !158)
!163 = !DILocation(line: 96, column: 9, scope: !158)
!164 = !DILocation(line: 93, column: 31, scope: !154)
!165 = !DILocation(line: 93, column: 9, scope: !154)
!166 = distinct !{!166, !156, !167, !82}
!167 = !DILocation(line: 96, column: 9, scope: !151)
!168 = !DILocation(line: 98, column: 9, scope: !142)
!169 = !DILocation(line: 98, column: 21, scope: !142)
!170 = !DILocation(line: 99, column: 20, scope: !142)
!171 = !DILocation(line: 99, column: 9, scope: !142)
!172 = !DILocation(line: 103, column: 1, scope: !112)
!173 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!174 = !DILocalVariable(name: "data", scope: !173, file: !13, line: 108, type: !6)
!175 = !DILocation(line: 108, column: 15, scope: !173)
!176 = !DILocation(line: 109, column: 10, scope: !173)
!177 = !DILocation(line: 110, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !173, file: !13, line: 110, column: 8)
!179 = !DILocation(line: 110, column: 18, scope: !178)
!180 = !DILocation(line: 110, column: 8, scope: !173)
!181 = !DILocalVariable(name: "dataBuffer", scope: !182, file: !13, line: 113, type: !6)
!182 = distinct !DILexicalBlock(scope: !183, file: !13, line: 112, column: 9)
!183 = distinct !DILexicalBlock(scope: !178, file: !13, line: 111, column: 5)
!184 = !DILocation(line: 113, column: 23, scope: !182)
!185 = !DILocation(line: 113, column: 47, scope: !182)
!186 = !DILocation(line: 113, column: 36, scope: !182)
!187 = !DILocation(line: 114, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !13, line: 114, column: 17)
!189 = !DILocation(line: 114, column: 28, scope: !188)
!190 = !DILocation(line: 114, column: 17, scope: !182)
!191 = !DILocation(line: 114, column: 38, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !13, line: 114, column: 37)
!193 = !DILocation(line: 115, column: 21, scope: !182)
!194 = !DILocation(line: 115, column: 13, scope: !182)
!195 = !DILocation(line: 116, column: 13, scope: !182)
!196 = !DILocation(line: 116, column: 31, scope: !182)
!197 = !DILocation(line: 118, column: 20, scope: !182)
!198 = !DILocation(line: 118, column: 18, scope: !182)
!199 = !DILocation(line: 120, column: 5, scope: !183)
!200 = !DILocalVariable(name: "i", scope: !201, file: !13, line: 122, type: !52)
!201 = distinct !DILexicalBlock(scope: !173, file: !13, line: 121, column: 5)
!202 = !DILocation(line: 122, column: 16, scope: !201)
!203 = !DILocalVariable(name: "source", scope: !201, file: !13, line: 123, type: !56)
!204 = !DILocation(line: 123, column: 17, scope: !201)
!205 = !DILocation(line: 124, column: 17, scope: !201)
!206 = !DILocation(line: 124, column: 9, scope: !201)
!207 = !DILocation(line: 125, column: 9, scope: !201)
!208 = !DILocation(line: 125, column: 23, scope: !201)
!209 = !DILocation(line: 127, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !201, file: !13, line: 127, column: 9)
!211 = !DILocation(line: 127, column: 14, scope: !210)
!212 = !DILocation(line: 127, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !13, line: 127, column: 9)
!214 = !DILocation(line: 127, column: 23, scope: !213)
!215 = !DILocation(line: 127, column: 9, scope: !210)
!216 = !DILocation(line: 129, column: 30, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !13, line: 128, column: 9)
!218 = !DILocation(line: 129, column: 23, scope: !217)
!219 = !DILocation(line: 129, column: 13, scope: !217)
!220 = !DILocation(line: 129, column: 18, scope: !217)
!221 = !DILocation(line: 129, column: 21, scope: !217)
!222 = !DILocation(line: 130, column: 9, scope: !217)
!223 = !DILocation(line: 127, column: 31, scope: !213)
!224 = !DILocation(line: 127, column: 9, scope: !213)
!225 = distinct !{!225, !215, !226, !82}
!226 = !DILocation(line: 130, column: 9, scope: !210)
!227 = !DILocation(line: 132, column: 9, scope: !201)
!228 = !DILocation(line: 132, column: 21, scope: !201)
!229 = !DILocation(line: 133, column: 20, scope: !201)
!230 = !DILocation(line: 133, column: 9, scope: !201)
!231 = !DILocation(line: 137, column: 1, scope: !173)
