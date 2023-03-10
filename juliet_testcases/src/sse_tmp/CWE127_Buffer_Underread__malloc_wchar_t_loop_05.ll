; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_05.c"
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !35
  %1 = bitcast i8* %call to i32*, !dbg !36
  store i32* %1, i32** %dataBuffer, align 8, !dbg !34
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %cmp = icmp eq i32* %2, null, !dbg !39
  br i1 %cmp, label %if.then1, label %if.end, !dbg !40

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !44
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !47
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !48
  store i32* %add.ptr, i32** %data, align 8, !dbg !49
  br label %if.end3, !dbg !50

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !62
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx5, align 4, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !68
  %cmp6 = icmp ult i64 %6, 100, !dbg !70
  br i1 %cmp6, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !72
  %8 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !72
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !72
  %10 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !76
  store i32 %9, i32* %arrayidx8, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %11, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx9, align 4, !dbg !85
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  call void @printWLine(i32* %arraydecay10), !dbg !87
  ret void, !dbg !88
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_05_good() #0 !dbg !89 {
entry:
  call void @goodG2B1(), !dbg !90
  call void @goodG2B2(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_05_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_05_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  %0 = load i32, i32* @staticFalse, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end3, !dbg !122

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !126
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !127
  %1 = bitcast i8* %call to i32*, !dbg !128
  store i32* %1, i32** %dataBuffer, align 8, !dbg !126
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !129
  %cmp = icmp eq i32* %2, null, !dbg !131
  br i1 %cmp, label %if.then1, label %if.end, !dbg !132

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !135
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !136
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !139
  store i32* %5, i32** %data, align 8, !dbg !140
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !147
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx5, align 4, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !153
  %cmp6 = icmp ult i64 %6, 100, !dbg !155
  br i1 %cmp6, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !157
  %8 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !157
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !157
  %10 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !161
  store i32 %9, i32* %arrayidx8, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %11, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx9, align 4, !dbg !169
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay10), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !173 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !174, metadata !DIExpression()), !dbg !175
  store i32* null, i32** %data, align 8, !dbg !176
  %0 = load i32, i32* @staticTrue, align 4, !dbg !177
  %tobool = icmp ne i32 %0, 0, !dbg !177
  br i1 %tobool, label %if.then, label %if.end3, !dbg !179

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !180, metadata !DIExpression()), !dbg !183
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !184
  %1 = bitcast i8* %call to i32*, !dbg !185
  store i32* %1, i32** %dataBuffer, align 8, !dbg !183
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !186
  %cmp = icmp eq i32* %2, null, !dbg !188
  br i1 %cmp, label %if.then1, label %if.end, !dbg !189

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !190
  unreachable, !dbg !190

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !192
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !193
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !194
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !194
  store i32 0, i32* %arrayidx, align 4, !dbg !195
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !196
  store i32* %5, i32** %data, align 8, !dbg !197
  br label %if.end3, !dbg !198

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !199, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !202, metadata !DIExpression()), !dbg !203
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !204
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !205
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !206
  store i32 0, i32* %arrayidx5, align 4, !dbg !207
  store i64 0, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !211
  %cmp6 = icmp ult i64 %6, 100, !dbg !213
  br i1 %cmp6, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !215
  %8 = load i64, i64* %i, align 8, !dbg !217
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !215
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !215
  %10 = load i64, i64* %i, align 8, !dbg !218
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !219
  store i32 %9, i32* %arrayidx8, align 4, !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !222
  %inc = add i64 %11, 1, !dbg !222
  store i64 %inc, i64* %i, align 8, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !226
  store i32 0, i32* %arrayidx9, align 4, !dbg !227
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !228
  call void @printWLine(i32* %arraydecay10), !dbg !229
  ret void, !dbg !230
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !15, line: 37, type: !6)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 36, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 23, scope: !32)
!35 = !DILocation(line: 37, column: 47, scope: !32)
!36 = !DILocation(line: 37, column: 36, scope: !32)
!37 = !DILocation(line: 38, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 17)
!39 = !DILocation(line: 38, column: 28, scope: !38)
!40 = !DILocation(line: 38, column: 17, scope: !32)
!41 = !DILocation(line: 38, column: 38, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 38, column: 37)
!43 = !DILocation(line: 39, column: 21, scope: !32)
!44 = !DILocation(line: 39, column: 13, scope: !32)
!45 = !DILocation(line: 40, column: 13, scope: !32)
!46 = !DILocation(line: 40, column: 31, scope: !32)
!47 = !DILocation(line: 42, column: 20, scope: !32)
!48 = !DILocation(line: 42, column: 31, scope: !32)
!49 = !DILocation(line: 42, column: 18, scope: !32)
!50 = !DILocation(line: 44, column: 5, scope: !33)
!51 = !DILocalVariable(name: "i", scope: !52, file: !15, line: 46, type: !53)
!52 = distinct !DILexicalBlock(scope: !22, file: !15, line: 45, column: 5)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 46, column: 16, scope: !52)
!56 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 47, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 47, column: 17, scope: !52)
!61 = !DILocation(line: 48, column: 17, scope: !52)
!62 = !DILocation(line: 48, column: 9, scope: !52)
!63 = !DILocation(line: 49, column: 9, scope: !52)
!64 = !DILocation(line: 49, column: 21, scope: !52)
!65 = !DILocation(line: 51, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !52, file: !15, line: 51, column: 9)
!67 = !DILocation(line: 51, column: 14, scope: !66)
!68 = !DILocation(line: 51, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 51, column: 9)
!70 = !DILocation(line: 51, column: 23, scope: !69)
!71 = !DILocation(line: 51, column: 9, scope: !66)
!72 = !DILocation(line: 53, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 52, column: 9)
!74 = !DILocation(line: 53, column: 28, scope: !73)
!75 = !DILocation(line: 53, column: 18, scope: !73)
!76 = !DILocation(line: 53, column: 13, scope: !73)
!77 = !DILocation(line: 53, column: 21, scope: !73)
!78 = !DILocation(line: 54, column: 9, scope: !73)
!79 = !DILocation(line: 51, column: 31, scope: !69)
!80 = !DILocation(line: 51, column: 9, scope: !69)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 54, column: 9, scope: !66)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 56, column: 9, scope: !52)
!85 = !DILocation(line: 56, column: 21, scope: !52)
!86 = !DILocation(line: 57, column: 20, scope: !52)
!87 = !DILocation(line: 57, column: 9, scope: !52)
!88 = !DILocation(line: 61, column: 1, scope: !22)
!89 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_05_good", scope: !15, file: !15, line: 140, type: !23, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocation(line: 142, column: 5, scope: !89)
!91 = !DILocation(line: 143, column: 5, scope: !89)
!92 = !DILocation(line: 144, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 156, type: !94, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!9, !9, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !15, line: 156, type: !9)
!100 = !DILocation(line: 156, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !15, line: 156, type: !96)
!102 = !DILocation(line: 156, column: 27, scope: !93)
!103 = !DILocation(line: 159, column: 22, scope: !93)
!104 = !DILocation(line: 159, column: 12, scope: !93)
!105 = !DILocation(line: 159, column: 5, scope: !93)
!106 = !DILocation(line: 161, column: 5, scope: !93)
!107 = !DILocation(line: 162, column: 5, scope: !93)
!108 = !DILocation(line: 163, column: 5, scope: !93)
!109 = !DILocation(line: 166, column: 5, scope: !93)
!110 = !DILocation(line: 167, column: 5, scope: !93)
!111 = !DILocation(line: 168, column: 5, scope: !93)
!112 = !DILocation(line: 170, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 68, type: !23, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 70, type: !6)
!115 = !DILocation(line: 70, column: 15, scope: !113)
!116 = !DILocation(line: 71, column: 10, scope: !113)
!117 = !DILocation(line: 72, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 72, column: 8)
!119 = !DILocation(line: 72, column: 8, scope: !113)
!120 = !DILocation(line: 75, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 73, column: 5)
!122 = !DILocation(line: 76, column: 5, scope: !121)
!123 = !DILocalVariable(name: "dataBuffer", scope: !124, file: !15, line: 80, type: !6)
!124 = distinct !DILexicalBlock(scope: !125, file: !15, line: 79, column: 9)
!125 = distinct !DILexicalBlock(scope: !118, file: !15, line: 78, column: 5)
!126 = !DILocation(line: 80, column: 23, scope: !124)
!127 = !DILocation(line: 80, column: 47, scope: !124)
!128 = !DILocation(line: 80, column: 36, scope: !124)
!129 = !DILocation(line: 81, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !15, line: 81, column: 17)
!131 = !DILocation(line: 81, column: 28, scope: !130)
!132 = !DILocation(line: 81, column: 17, scope: !124)
!133 = !DILocation(line: 81, column: 38, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 81, column: 37)
!135 = !DILocation(line: 82, column: 21, scope: !124)
!136 = !DILocation(line: 82, column: 13, scope: !124)
!137 = !DILocation(line: 83, column: 13, scope: !124)
!138 = !DILocation(line: 83, column: 31, scope: !124)
!139 = !DILocation(line: 85, column: 20, scope: !124)
!140 = !DILocation(line: 85, column: 18, scope: !124)
!141 = !DILocalVariable(name: "i", scope: !142, file: !15, line: 89, type: !53)
!142 = distinct !DILexicalBlock(scope: !113, file: !15, line: 88, column: 5)
!143 = !DILocation(line: 89, column: 16, scope: !142)
!144 = !DILocalVariable(name: "dest", scope: !142, file: !15, line: 90, type: !57)
!145 = !DILocation(line: 90, column: 17, scope: !142)
!146 = !DILocation(line: 91, column: 17, scope: !142)
!147 = !DILocation(line: 91, column: 9, scope: !142)
!148 = !DILocation(line: 92, column: 9, scope: !142)
!149 = !DILocation(line: 92, column: 21, scope: !142)
!150 = !DILocation(line: 94, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !142, file: !15, line: 94, column: 9)
!152 = !DILocation(line: 94, column: 14, scope: !151)
!153 = !DILocation(line: 94, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !15, line: 94, column: 9)
!155 = !DILocation(line: 94, column: 23, scope: !154)
!156 = !DILocation(line: 94, column: 9, scope: !151)
!157 = !DILocation(line: 96, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 95, column: 9)
!159 = !DILocation(line: 96, column: 28, scope: !158)
!160 = !DILocation(line: 96, column: 18, scope: !158)
!161 = !DILocation(line: 96, column: 13, scope: !158)
!162 = !DILocation(line: 96, column: 21, scope: !158)
!163 = !DILocation(line: 97, column: 9, scope: !158)
!164 = !DILocation(line: 94, column: 31, scope: !154)
!165 = !DILocation(line: 94, column: 9, scope: !154)
!166 = distinct !{!166, !156, !167, !83}
!167 = !DILocation(line: 97, column: 9, scope: !151)
!168 = !DILocation(line: 99, column: 9, scope: !142)
!169 = !DILocation(line: 99, column: 21, scope: !142)
!170 = !DILocation(line: 100, column: 20, scope: !142)
!171 = !DILocation(line: 100, column: 9, scope: !142)
!172 = !DILocation(line: 104, column: 1, scope: !113)
!173 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 107, type: !23, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!174 = !DILocalVariable(name: "data", scope: !173, file: !15, line: 109, type: !6)
!175 = !DILocation(line: 109, column: 15, scope: !173)
!176 = !DILocation(line: 110, column: 10, scope: !173)
!177 = !DILocation(line: 111, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !173, file: !15, line: 111, column: 8)
!179 = !DILocation(line: 111, column: 8, scope: !173)
!180 = !DILocalVariable(name: "dataBuffer", scope: !181, file: !15, line: 114, type: !6)
!181 = distinct !DILexicalBlock(scope: !182, file: !15, line: 113, column: 9)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 112, column: 5)
!183 = !DILocation(line: 114, column: 23, scope: !181)
!184 = !DILocation(line: 114, column: 47, scope: !181)
!185 = !DILocation(line: 114, column: 36, scope: !181)
!186 = !DILocation(line: 115, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !181, file: !15, line: 115, column: 17)
!188 = !DILocation(line: 115, column: 28, scope: !187)
!189 = !DILocation(line: 115, column: 17, scope: !181)
!190 = !DILocation(line: 115, column: 38, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !15, line: 115, column: 37)
!192 = !DILocation(line: 116, column: 21, scope: !181)
!193 = !DILocation(line: 116, column: 13, scope: !181)
!194 = !DILocation(line: 117, column: 13, scope: !181)
!195 = !DILocation(line: 117, column: 31, scope: !181)
!196 = !DILocation(line: 119, column: 20, scope: !181)
!197 = !DILocation(line: 119, column: 18, scope: !181)
!198 = !DILocation(line: 121, column: 5, scope: !182)
!199 = !DILocalVariable(name: "i", scope: !200, file: !15, line: 123, type: !53)
!200 = distinct !DILexicalBlock(scope: !173, file: !15, line: 122, column: 5)
!201 = !DILocation(line: 123, column: 16, scope: !200)
!202 = !DILocalVariable(name: "dest", scope: !200, file: !15, line: 124, type: !57)
!203 = !DILocation(line: 124, column: 17, scope: !200)
!204 = !DILocation(line: 125, column: 17, scope: !200)
!205 = !DILocation(line: 125, column: 9, scope: !200)
!206 = !DILocation(line: 126, column: 9, scope: !200)
!207 = !DILocation(line: 126, column: 21, scope: !200)
!208 = !DILocation(line: 128, column: 16, scope: !209)
!209 = distinct !DILexicalBlock(scope: !200, file: !15, line: 128, column: 9)
!210 = !DILocation(line: 128, column: 14, scope: !209)
!211 = !DILocation(line: 128, column: 21, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !15, line: 128, column: 9)
!213 = !DILocation(line: 128, column: 23, scope: !212)
!214 = !DILocation(line: 128, column: 9, scope: !209)
!215 = !DILocation(line: 130, column: 23, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !15, line: 129, column: 9)
!217 = !DILocation(line: 130, column: 28, scope: !216)
!218 = !DILocation(line: 130, column: 18, scope: !216)
!219 = !DILocation(line: 130, column: 13, scope: !216)
!220 = !DILocation(line: 130, column: 21, scope: !216)
!221 = !DILocation(line: 131, column: 9, scope: !216)
!222 = !DILocation(line: 128, column: 31, scope: !212)
!223 = !DILocation(line: 128, column: 9, scope: !212)
!224 = distinct !{!224, !214, !225, !83}
!225 = !DILocation(line: 131, column: 9, scope: !209)
!226 = !DILocation(line: 133, column: 9, scope: !200)
!227 = !DILocation(line: 133, column: 21, scope: !200)
!228 = !DILocation(line: 134, column: 20, scope: !200)
!229 = !DILocation(line: 134, column: 9, scope: !200)
!230 = !DILocation(line: 138, column: 1, scope: !173)
