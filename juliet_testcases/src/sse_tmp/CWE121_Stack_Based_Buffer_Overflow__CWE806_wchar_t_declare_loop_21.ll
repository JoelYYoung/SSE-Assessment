; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  store i32 1, i32* @badStatic, align 4, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @badSource(i32* %0), !dbg !37
  store i32* %call, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = load i32*, i32** %data, align 8, !dbg !51
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !52
  store i64 %call1, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !57
  %4 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp = icmp ult i64 %3, %4, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !62
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !62
  %7 = load i32, i32* %arrayidx, align 4, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !66
  store i32 %7, i32* %arrayidx2, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !74
  store i32 0, i32* %arrayidx3, align 4, !dbg !75
  %10 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* %10), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32, i32* @badStatic, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !87
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !89
  %2 = load i32*, i32** %data.addr, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !93
  ret i32* %3, !dbg !94
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21_good() #0 !dbg !95 {
entry:
  call void @goodG2B1(), !dbg !96
  call void @goodG2B2(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #7, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #7, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !124
  store i32* %arraydecay, i32** %data, align 8, !dbg !125
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !126
  %0 = load i32*, i32** %data, align 8, !dbg !127
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !128
  store i32* %call, i32** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = load i32*, i32** %data, align 8, !dbg !137
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !138
  store i64 %call1, i64* %dataLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !143
  %4 = load i64, i64* %dataLen, align 8, !dbg !145
  %cmp = icmp ult i64 %3, %4, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !148
  %6 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !148
  %7 = load i32, i32* %arrayidx, align 4, !dbg !148
  %8 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !152
  store i32 %7, i32* %arrayidx2, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %9, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !159
  store i32 0, i32* %arrayidx3, align 4, !dbg !160
  %10 = load i32*, i32** %data, align 8, !dbg !161
  call void @printWLine(i32* %10), !dbg !162
  ret void, !dbg !163
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !164 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !165, metadata !DIExpression()), !dbg !166
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !167
  %tobool = icmp ne i32 %0, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.else, !dbg !169

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !170
  br label %if.end, !dbg !172

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !173
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !175
  %2 = load i32*, i32** %data.addr, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !178
  ret i32* %3, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !185
  store i32* %arraydecay, i32** %data, align 8, !dbg !186
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !187
  %0 = load i32*, i32** %data, align 8, !dbg !188
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !189
  store i32* %call, i32** %data, align 8, !dbg !190
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !191, metadata !DIExpression()), !dbg !193
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %i, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !196, metadata !DIExpression()), !dbg !197
  %2 = load i32*, i32** %data, align 8, !dbg !198
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !199
  store i64 %call1, i64* %dataLen, align 8, !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !204
  %4 = load i64, i64* %dataLen, align 8, !dbg !206
  %cmp = icmp ult i64 %3, %4, !dbg !207
  br i1 %cmp, label %for.body, label %for.end, !dbg !208

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !209
  %6 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !209
  %7 = load i32, i32* %arrayidx, align 4, !dbg !209
  %8 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !213
  store i32 %7, i32* %arrayidx2, align 4, !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !216
  %inc = add i64 %9, 1, !dbg !216
  store i64 %inc, i64* %i, align 8, !dbg !216
  br label %for.cond, !dbg !217, !llvm.loop !218

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !220
  store i32 0, i32* %arrayidx3, align 4, !dbg !221
  %10 = load i32*, i32** %data, align 8, !dbg !222
  call void @printWLine(i32* %10), !dbg !223
  ret void, !dbg !224
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !225 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !226, metadata !DIExpression()), !dbg !227
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !228
  %tobool = icmp ne i32 %0, 0, !dbg !228
  br i1 %tobool, label %if.then, label %if.end, !dbg !230

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !231
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !233
  %2 = load i32*, i32** %data.addr, align 8, !dbg !234
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !234
  store i32 0, i32* %arrayidx, align 4, !dbg !235
  br label %if.end, !dbg !236

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !237
  ret i32* %3, !dbg !238
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 63, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 64, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21_bad", scope: !10, file: !10, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 39, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 39, column: 15, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 40, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 40, column: 13, scope: !20)
!33 = !DILocation(line: 41, column: 12, scope: !20)
!34 = !DILocation(line: 41, column: 10, scope: !20)
!35 = !DILocation(line: 42, column: 15, scope: !20)
!36 = !DILocation(line: 43, column: 22, scope: !20)
!37 = !DILocation(line: 43, column: 12, scope: !20)
!38 = !DILocation(line: 43, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 45, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !10, line: 44, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 45, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !10, line: 46, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 46, column: 16, scope: !40)
!49 = !DILocalVariable(name: "dataLen", scope: !40, file: !10, line: 46, type: !46)
!50 = !DILocation(line: 46, column: 19, scope: !40)
!51 = !DILocation(line: 47, column: 26, scope: !40)
!52 = !DILocation(line: 47, column: 19, scope: !40)
!53 = !DILocation(line: 47, column: 17, scope: !40)
!54 = !DILocation(line: 49, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !10, line: 49, column: 9)
!56 = !DILocation(line: 49, column: 14, scope: !55)
!57 = !DILocation(line: 49, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !10, line: 49, column: 9)
!59 = !DILocation(line: 49, column: 25, scope: !58)
!60 = !DILocation(line: 49, column: 23, scope: !58)
!61 = !DILocation(line: 49, column: 9, scope: !55)
!62 = !DILocation(line: 51, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 50, column: 9)
!64 = !DILocation(line: 51, column: 28, scope: !63)
!65 = !DILocation(line: 51, column: 18, scope: !63)
!66 = !DILocation(line: 51, column: 13, scope: !63)
!67 = !DILocation(line: 51, column: 21, scope: !63)
!68 = !DILocation(line: 52, column: 9, scope: !63)
!69 = !DILocation(line: 49, column: 35, scope: !58)
!70 = !DILocation(line: 49, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 52, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 53, column: 9, scope: !40)
!75 = !DILocation(line: 53, column: 20, scope: !40)
!76 = !DILocation(line: 54, column: 20, scope: !40)
!77 = !DILocation(line: 54, column: 9, scope: !40)
!78 = !DILocation(line: 56, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 26, type: !80, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!24, !24}
!82 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !10, line: 26, type: !24)
!83 = !DILocation(line: 26, column: 38, scope: !79)
!84 = !DILocation(line: 28, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !10, line: 28, column: 8)
!86 = !DILocation(line: 28, column: 8, scope: !79)
!87 = !DILocation(line: 31, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 29, column: 5)
!89 = !DILocation(line: 31, column: 9, scope: !88)
!90 = !DILocation(line: 32, column: 9, scope: !88)
!91 = !DILocation(line: 32, column: 21, scope: !88)
!92 = !DILocation(line: 33, column: 5, scope: !88)
!93 = !DILocation(line: 34, column: 12, scope: !79)
!94 = !DILocation(line: 34, column: 5, scope: !79)
!95 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_21_good", scope: !10, file: !10, line: 137, type: !21, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 139, column: 5, scope: !95)
!97 = !DILocation(line: 140, column: 5, scope: !95)
!98 = !DILocation(line: 141, column: 1, scope: !95)
!99 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 153, type: !100, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DISubroutineType(types: !101)
!101 = !{!11, !11, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !10, line: 153, type: !11)
!106 = !DILocation(line: 153, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !10, line: 153, type: !102)
!108 = !DILocation(line: 153, column: 27, scope: !99)
!109 = !DILocation(line: 156, column: 22, scope: !99)
!110 = !DILocation(line: 156, column: 12, scope: !99)
!111 = !DILocation(line: 156, column: 5, scope: !99)
!112 = !DILocation(line: 158, column: 5, scope: !99)
!113 = !DILocation(line: 159, column: 5, scope: !99)
!114 = !DILocation(line: 160, column: 5, scope: !99)
!115 = !DILocation(line: 163, column: 5, scope: !99)
!116 = !DILocation(line: 164, column: 5, scope: !99)
!117 = !DILocation(line: 165, column: 5, scope: !99)
!118 = !DILocation(line: 167, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", scope: !119, file: !10, line: 85, type: !24)
!121 = !DILocation(line: 85, column: 15, scope: !119)
!122 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !10, line: 86, type: !29)
!123 = !DILocation(line: 86, column: 13, scope: !119)
!124 = !DILocation(line: 87, column: 12, scope: !119)
!125 = !DILocation(line: 87, column: 10, scope: !119)
!126 = !DILocation(line: 88, column: 20, scope: !119)
!127 = !DILocation(line: 89, column: 27, scope: !119)
!128 = !DILocation(line: 89, column: 12, scope: !119)
!129 = !DILocation(line: 89, column: 10, scope: !119)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !10, line: 91, type: !41)
!131 = distinct !DILexicalBlock(scope: !119, file: !10, line: 90, column: 5)
!132 = !DILocation(line: 91, column: 17, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !10, line: 92, type: !46)
!134 = !DILocation(line: 92, column: 16, scope: !131)
!135 = !DILocalVariable(name: "dataLen", scope: !131, file: !10, line: 92, type: !46)
!136 = !DILocation(line: 92, column: 19, scope: !131)
!137 = !DILocation(line: 93, column: 26, scope: !131)
!138 = !DILocation(line: 93, column: 19, scope: !131)
!139 = !DILocation(line: 93, column: 17, scope: !131)
!140 = !DILocation(line: 95, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !10, line: 95, column: 9)
!142 = !DILocation(line: 95, column: 14, scope: !141)
!143 = !DILocation(line: 95, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !10, line: 95, column: 9)
!145 = !DILocation(line: 95, column: 25, scope: !144)
!146 = !DILocation(line: 95, column: 23, scope: !144)
!147 = !DILocation(line: 95, column: 9, scope: !141)
!148 = !DILocation(line: 97, column: 23, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !10, line: 96, column: 9)
!150 = !DILocation(line: 97, column: 28, scope: !149)
!151 = !DILocation(line: 97, column: 18, scope: !149)
!152 = !DILocation(line: 97, column: 13, scope: !149)
!153 = !DILocation(line: 97, column: 21, scope: !149)
!154 = !DILocation(line: 98, column: 9, scope: !149)
!155 = !DILocation(line: 95, column: 35, scope: !144)
!156 = !DILocation(line: 95, column: 9, scope: !144)
!157 = distinct !{!157, !147, !158, !73}
!158 = !DILocation(line: 98, column: 9, scope: !141)
!159 = !DILocation(line: 99, column: 9, scope: !131)
!160 = !DILocation(line: 99, column: 20, scope: !131)
!161 = !DILocation(line: 100, column: 20, scope: !131)
!162 = !DILocation(line: 100, column: 9, scope: !131)
!163 = !DILocation(line: 102, column: 1, scope: !119)
!164 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 67, type: !80, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!165 = !DILocalVariable(name: "data", arg: 1, scope: !164, file: !10, line: 67, type: !24)
!166 = !DILocation(line: 67, column: 43, scope: !164)
!167 = !DILocation(line: 69, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !10, line: 69, column: 8)
!169 = !DILocation(line: 69, column: 8, scope: !164)
!170 = !DILocation(line: 72, column: 9, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !10, line: 70, column: 5)
!172 = !DILocation(line: 73, column: 5, scope: !171)
!173 = !DILocation(line: 77, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !168, file: !10, line: 75, column: 5)
!175 = !DILocation(line: 77, column: 9, scope: !174)
!176 = !DILocation(line: 78, column: 9, scope: !174)
!177 = !DILocation(line: 78, column: 20, scope: !174)
!178 = !DILocation(line: 80, column: 12, scope: !164)
!179 = !DILocation(line: 80, column: 5, scope: !164)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 116, type: !21, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocalVariable(name: "data", scope: !180, file: !10, line: 118, type: !24)
!182 = !DILocation(line: 118, column: 15, scope: !180)
!183 = !DILocalVariable(name: "dataBuffer", scope: !180, file: !10, line: 119, type: !29)
!184 = !DILocation(line: 119, column: 13, scope: !180)
!185 = !DILocation(line: 120, column: 12, scope: !180)
!186 = !DILocation(line: 120, column: 10, scope: !180)
!187 = !DILocation(line: 121, column: 20, scope: !180)
!188 = !DILocation(line: 122, column: 27, scope: !180)
!189 = !DILocation(line: 122, column: 12, scope: !180)
!190 = !DILocation(line: 122, column: 10, scope: !180)
!191 = !DILocalVariable(name: "dest", scope: !192, file: !10, line: 124, type: !41)
!192 = distinct !DILexicalBlock(scope: !180, file: !10, line: 123, column: 5)
!193 = !DILocation(line: 124, column: 17, scope: !192)
!194 = !DILocalVariable(name: "i", scope: !192, file: !10, line: 125, type: !46)
!195 = !DILocation(line: 125, column: 16, scope: !192)
!196 = !DILocalVariable(name: "dataLen", scope: !192, file: !10, line: 125, type: !46)
!197 = !DILocation(line: 125, column: 19, scope: !192)
!198 = !DILocation(line: 126, column: 26, scope: !192)
!199 = !DILocation(line: 126, column: 19, scope: !192)
!200 = !DILocation(line: 126, column: 17, scope: !192)
!201 = !DILocation(line: 128, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !192, file: !10, line: 128, column: 9)
!203 = !DILocation(line: 128, column: 14, scope: !202)
!204 = !DILocation(line: 128, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !10, line: 128, column: 9)
!206 = !DILocation(line: 128, column: 25, scope: !205)
!207 = !DILocation(line: 128, column: 23, scope: !205)
!208 = !DILocation(line: 128, column: 9, scope: !202)
!209 = !DILocation(line: 130, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !10, line: 129, column: 9)
!211 = !DILocation(line: 130, column: 28, scope: !210)
!212 = !DILocation(line: 130, column: 18, scope: !210)
!213 = !DILocation(line: 130, column: 13, scope: !210)
!214 = !DILocation(line: 130, column: 21, scope: !210)
!215 = !DILocation(line: 131, column: 9, scope: !210)
!216 = !DILocation(line: 128, column: 35, scope: !205)
!217 = !DILocation(line: 128, column: 9, scope: !205)
!218 = distinct !{!218, !208, !219, !73}
!219 = !DILocation(line: 131, column: 9, scope: !202)
!220 = !DILocation(line: 132, column: 9, scope: !192)
!221 = !DILocation(line: 132, column: 20, scope: !192)
!222 = !DILocation(line: 133, column: 20, scope: !192)
!223 = !DILocation(line: 133, column: 9, scope: !192)
!224 = !DILocation(line: 135, column: 1, scope: !180)
!225 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 105, type: !80, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!226 = !DILocalVariable(name: "data", arg: 1, scope: !225, file: !10, line: 105, type: !24)
!227 = !DILocation(line: 105, column: 43, scope: !225)
!228 = !DILocation(line: 107, column: 8, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !10, line: 107, column: 8)
!230 = !DILocation(line: 107, column: 8, scope: !225)
!231 = !DILocation(line: 110, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !229, file: !10, line: 108, column: 5)
!233 = !DILocation(line: 110, column: 9, scope: !232)
!234 = !DILocation(line: 111, column: 9, scope: !232)
!235 = !DILocation(line: 111, column: 20, scope: !232)
!236 = !DILocation(line: 112, column: 5, scope: !232)
!237 = !DILocation(line: 113, column: 12, scope: !225)
!238 = !DILocation(line: 113, column: 5, scope: !225)
