; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  store i32 1, i32* @badStatic, align 4, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i8* @badSource(i8* %2), !dbg !34
  store i8* %call, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !50
  store i64 %call1, i64* %dataLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !55
  %6 = load i64, i64* %dataLen, align 8, !dbg !57
  %cmp = icmp ult i64 %5, %6, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !60
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !60
  %9 = load i8, i8* %arrayidx, align 1, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !64
  store i8 %9, i8* %arrayidx2, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %11, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !72
  store i8 0, i8* %arrayidx3, align 1, !dbg !73
  %12 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* %12), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !77 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i32, i32* @badStatic, align 4, !dbg !82
  %tobool = icmp ne i32 %0, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !87
  %2 = load i8*, i8** %data.addr, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end, !dbg !90

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !91
  ret i8* %3, !dbg !92
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21_good() #0 !dbg !93 {
entry:
  call void @goodG2B1(), !dbg !94
  call void @goodG2B2(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #7, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #7, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 100, align 16, !dbg !120
  store i8* %0, i8** %dataBuffer, align 8, !dbg !119
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  store i8* %1, i8** %data, align 8, !dbg !122
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !123
  %2 = load i8*, i8** %data, align 8, !dbg !124
  %call = call i8* @goodG2B1Source(i8* %2), !dbg !125
  store i8* %call, i8** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !132, metadata !DIExpression()), !dbg !133
  %4 = load i8*, i8** %data, align 8, !dbg !134
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !135
  store i64 %call1, i64* %dataLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !140
  %6 = load i64, i64* %dataLen, align 8, !dbg !142
  %cmp = icmp ult i64 %5, %6, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !145
  %9 = load i8, i8* %arrayidx, align 1, !dbg !145
  %10 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !149
  store i8 %9, i8* %arrayidx2, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %11, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !156
  store i8 0, i8* %arrayidx3, align 1, !dbg !157
  %12 = load i8*, i8** %data, align 8, !dbg !158
  call void @printLine(i8* %12), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !161 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !164
  %tobool = icmp ne i32 %0, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.else, !dbg !166

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !167
  br label %if.end, !dbg !169

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !172
  %2 = load i8*, i8** %data.addr, align 8, !dbg !173
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !173
  store i8 0, i8* %arrayidx, align 1, !dbg !174
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !175
  ret i8* %3, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !177 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !180, metadata !DIExpression()), !dbg !181
  %0 = alloca i8, i64 100, align 16, !dbg !182
  store i8* %0, i8** %dataBuffer, align 8, !dbg !181
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !183
  store i8* %1, i8** %data, align 8, !dbg !184
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !185
  %2 = load i8*, i8** %data, align 8, !dbg !186
  %call = call i8* @goodG2B2Source(i8* %2), !dbg !187
  store i8* %call, i8** %data, align 8, !dbg !188
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !189, metadata !DIExpression()), !dbg !191
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !191
  call void @llvm.dbg.declare(metadata i64* %i, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !194, metadata !DIExpression()), !dbg !195
  %4 = load i8*, i8** %data, align 8, !dbg !196
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !197
  store i64 %call1, i64* %dataLen, align 8, !dbg !198
  store i64 0, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !202
  %6 = load i64, i64* %dataLen, align 8, !dbg !204
  %cmp = icmp ult i64 %5, %6, !dbg !205
  br i1 %cmp, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !207
  %8 = load i64, i64* %i, align 8, !dbg !209
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !207
  %9 = load i8, i8* %arrayidx, align 1, !dbg !207
  %10 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !211
  store i8 %9, i8* %arrayidx2, align 1, !dbg !212
  br label %for.inc, !dbg !213

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !214
  %inc = add i64 %11, 1, !dbg !214
  store i64 %inc, i64* %i, align 8, !dbg !214
  br label %for.cond, !dbg !215, !llvm.loop !216

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !218
  store i8 0, i8* %arrayidx3, align 1, !dbg !219
  %12 = load i8*, i8** %data, align 8, !dbg !220
  call void @printLine(i8* %12), !dbg !221
  ret void, !dbg !222
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !223 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !226
  %tobool = icmp ne i32 %0, 0, !dbg !226
  br i1 %tobool, label %if.then, label %if.end, !dbg !228

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !229
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !231
  %2 = load i8*, i8** %data.addr, align 8, !dbg !232
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !232
  store i8 0, i8* %arrayidx, align 1, !dbg !233
  br label %if.end, !dbg !234

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !235
  ret i8* %3, !dbg !236
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
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !12, line: 24, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !12, line: 63, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21.c", directory: "/root/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !12, line: 64, type: !13, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21_bad", scope: !12, file: !12, line: 37, type: !23, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 39, type: !6)
!26 = !DILocation(line: 39, column: 12, scope: !22)
!27 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !12, line: 40, type: !6)
!28 = !DILocation(line: 40, column: 12, scope: !22)
!29 = !DILocation(line: 40, column: 33, scope: !22)
!30 = !DILocation(line: 41, column: 12, scope: !22)
!31 = !DILocation(line: 41, column: 10, scope: !22)
!32 = !DILocation(line: 42, column: 15, scope: !22)
!33 = !DILocation(line: 43, column: 22, scope: !22)
!34 = !DILocation(line: 43, column: 12, scope: !22)
!35 = !DILocation(line: 43, column: 10, scope: !22)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 45, type: !38)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 44, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 45, column: 14, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 46, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 46, column: 16, scope: !37)
!47 = !DILocalVariable(name: "dataLen", scope: !37, file: !12, line: 46, type: !43)
!48 = !DILocation(line: 46, column: 19, scope: !37)
!49 = !DILocation(line: 47, column: 26, scope: !37)
!50 = !DILocation(line: 47, column: 19, scope: !37)
!51 = !DILocation(line: 47, column: 17, scope: !37)
!52 = !DILocation(line: 49, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !37, file: !12, line: 49, column: 9)
!54 = !DILocation(line: 49, column: 14, scope: !53)
!55 = !DILocation(line: 49, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 49, column: 9)
!57 = !DILocation(line: 49, column: 25, scope: !56)
!58 = !DILocation(line: 49, column: 23, scope: !56)
!59 = !DILocation(line: 49, column: 9, scope: !53)
!60 = !DILocation(line: 51, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !12, line: 50, column: 9)
!62 = !DILocation(line: 51, column: 28, scope: !61)
!63 = !DILocation(line: 51, column: 18, scope: !61)
!64 = !DILocation(line: 51, column: 13, scope: !61)
!65 = !DILocation(line: 51, column: 21, scope: !61)
!66 = !DILocation(line: 52, column: 9, scope: !61)
!67 = !DILocation(line: 49, column: 35, scope: !56)
!68 = !DILocation(line: 49, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 52, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 53, column: 9, scope: !37)
!73 = !DILocation(line: 53, column: 20, scope: !37)
!74 = !DILocation(line: 54, column: 19, scope: !37)
!75 = !DILocation(line: 54, column: 9, scope: !37)
!76 = !DILocation(line: 56, column: 1, scope: !22)
!77 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 26, type: !78, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DISubroutineType(types: !79)
!79 = !{!6, !6}
!80 = !DILocalVariable(name: "data", arg: 1, scope: !77, file: !12, line: 26, type: !6)
!81 = !DILocation(line: 26, column: 32, scope: !77)
!82 = !DILocation(line: 28, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !12, line: 28, column: 8)
!84 = !DILocation(line: 28, column: 8, scope: !77)
!85 = !DILocation(line: 31, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !12, line: 29, column: 5)
!87 = !DILocation(line: 31, column: 9, scope: !86)
!88 = !DILocation(line: 32, column: 9, scope: !86)
!89 = !DILocation(line: 32, column: 21, scope: !86)
!90 = !DILocation(line: 33, column: 5, scope: !86)
!91 = !DILocation(line: 34, column: 12, scope: !77)
!92 = !DILocation(line: 34, column: 5, scope: !77)
!93 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_21_good", scope: !12, file: !12, line: 137, type: !23, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocation(line: 139, column: 5, scope: !93)
!95 = !DILocation(line: 140, column: 5, scope: !93)
!96 = !DILocation(line: 141, column: 1, scope: !93)
!97 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 153, type: !98, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{!13, !13, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !12, line: 153, type: !13)
!102 = !DILocation(line: 153, column: 14, scope: !97)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !12, line: 153, type: !100)
!104 = !DILocation(line: 153, column: 27, scope: !97)
!105 = !DILocation(line: 156, column: 22, scope: !97)
!106 = !DILocation(line: 156, column: 12, scope: !97)
!107 = !DILocation(line: 156, column: 5, scope: !97)
!108 = !DILocation(line: 158, column: 5, scope: !97)
!109 = !DILocation(line: 159, column: 5, scope: !97)
!110 = !DILocation(line: 160, column: 5, scope: !97)
!111 = !DILocation(line: 163, column: 5, scope: !97)
!112 = !DILocation(line: 164, column: 5, scope: !97)
!113 = !DILocation(line: 165, column: 5, scope: !97)
!114 = !DILocation(line: 167, column: 5, scope: !97)
!115 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 83, type: !23, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 85, type: !6)
!117 = !DILocation(line: 85, column: 12, scope: !115)
!118 = !DILocalVariable(name: "dataBuffer", scope: !115, file: !12, line: 86, type: !6)
!119 = !DILocation(line: 86, column: 12, scope: !115)
!120 = !DILocation(line: 86, column: 33, scope: !115)
!121 = !DILocation(line: 87, column: 12, scope: !115)
!122 = !DILocation(line: 87, column: 10, scope: !115)
!123 = !DILocation(line: 88, column: 20, scope: !115)
!124 = !DILocation(line: 89, column: 27, scope: !115)
!125 = !DILocation(line: 89, column: 12, scope: !115)
!126 = !DILocation(line: 89, column: 10, scope: !115)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !12, line: 91, type: !38)
!128 = distinct !DILexicalBlock(scope: !115, file: !12, line: 90, column: 5)
!129 = !DILocation(line: 91, column: 14, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 92, type: !43)
!131 = !DILocation(line: 92, column: 16, scope: !128)
!132 = !DILocalVariable(name: "dataLen", scope: !128, file: !12, line: 92, type: !43)
!133 = !DILocation(line: 92, column: 19, scope: !128)
!134 = !DILocation(line: 93, column: 26, scope: !128)
!135 = !DILocation(line: 93, column: 19, scope: !128)
!136 = !DILocation(line: 93, column: 17, scope: !128)
!137 = !DILocation(line: 95, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !12, line: 95, column: 9)
!139 = !DILocation(line: 95, column: 14, scope: !138)
!140 = !DILocation(line: 95, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 95, column: 9)
!142 = !DILocation(line: 95, column: 25, scope: !141)
!143 = !DILocation(line: 95, column: 23, scope: !141)
!144 = !DILocation(line: 95, column: 9, scope: !138)
!145 = !DILocation(line: 97, column: 23, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !12, line: 96, column: 9)
!147 = !DILocation(line: 97, column: 28, scope: !146)
!148 = !DILocation(line: 97, column: 18, scope: !146)
!149 = !DILocation(line: 97, column: 13, scope: !146)
!150 = !DILocation(line: 97, column: 21, scope: !146)
!151 = !DILocation(line: 98, column: 9, scope: !146)
!152 = !DILocation(line: 95, column: 35, scope: !141)
!153 = !DILocation(line: 95, column: 9, scope: !141)
!154 = distinct !{!154, !144, !155, !71}
!155 = !DILocation(line: 98, column: 9, scope: !138)
!156 = !DILocation(line: 99, column: 9, scope: !128)
!157 = !DILocation(line: 99, column: 20, scope: !128)
!158 = !DILocation(line: 100, column: 19, scope: !128)
!159 = !DILocation(line: 100, column: 9, scope: !128)
!160 = !DILocation(line: 102, column: 1, scope: !115)
!161 = distinct !DISubprogram(name: "goodG2B1Source", scope: !12, file: !12, line: 67, type: !78, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DILocalVariable(name: "data", arg: 1, scope: !161, file: !12, line: 67, type: !6)
!163 = !DILocation(line: 67, column: 37, scope: !161)
!164 = !DILocation(line: 69, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 69, column: 8)
!166 = !DILocation(line: 69, column: 8, scope: !161)
!167 = !DILocation(line: 72, column: 9, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 70, column: 5)
!169 = !DILocation(line: 73, column: 5, scope: !168)
!170 = !DILocation(line: 77, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !12, line: 75, column: 5)
!172 = !DILocation(line: 77, column: 9, scope: !171)
!173 = !DILocation(line: 78, column: 9, scope: !171)
!174 = !DILocation(line: 78, column: 20, scope: !171)
!175 = !DILocation(line: 80, column: 12, scope: !161)
!176 = !DILocation(line: 80, column: 5, scope: !161)
!177 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 116, type: !23, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!178 = !DILocalVariable(name: "data", scope: !177, file: !12, line: 118, type: !6)
!179 = !DILocation(line: 118, column: 12, scope: !177)
!180 = !DILocalVariable(name: "dataBuffer", scope: !177, file: !12, line: 119, type: !6)
!181 = !DILocation(line: 119, column: 12, scope: !177)
!182 = !DILocation(line: 119, column: 33, scope: !177)
!183 = !DILocation(line: 120, column: 12, scope: !177)
!184 = !DILocation(line: 120, column: 10, scope: !177)
!185 = !DILocation(line: 121, column: 20, scope: !177)
!186 = !DILocation(line: 122, column: 27, scope: !177)
!187 = !DILocation(line: 122, column: 12, scope: !177)
!188 = !DILocation(line: 122, column: 10, scope: !177)
!189 = !DILocalVariable(name: "dest", scope: !190, file: !12, line: 124, type: !38)
!190 = distinct !DILexicalBlock(scope: !177, file: !12, line: 123, column: 5)
!191 = !DILocation(line: 124, column: 14, scope: !190)
!192 = !DILocalVariable(name: "i", scope: !190, file: !12, line: 125, type: !43)
!193 = !DILocation(line: 125, column: 16, scope: !190)
!194 = !DILocalVariable(name: "dataLen", scope: !190, file: !12, line: 125, type: !43)
!195 = !DILocation(line: 125, column: 19, scope: !190)
!196 = !DILocation(line: 126, column: 26, scope: !190)
!197 = !DILocation(line: 126, column: 19, scope: !190)
!198 = !DILocation(line: 126, column: 17, scope: !190)
!199 = !DILocation(line: 128, column: 16, scope: !200)
!200 = distinct !DILexicalBlock(scope: !190, file: !12, line: 128, column: 9)
!201 = !DILocation(line: 128, column: 14, scope: !200)
!202 = !DILocation(line: 128, column: 21, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !12, line: 128, column: 9)
!204 = !DILocation(line: 128, column: 25, scope: !203)
!205 = !DILocation(line: 128, column: 23, scope: !203)
!206 = !DILocation(line: 128, column: 9, scope: !200)
!207 = !DILocation(line: 130, column: 23, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !12, line: 129, column: 9)
!209 = !DILocation(line: 130, column: 28, scope: !208)
!210 = !DILocation(line: 130, column: 18, scope: !208)
!211 = !DILocation(line: 130, column: 13, scope: !208)
!212 = !DILocation(line: 130, column: 21, scope: !208)
!213 = !DILocation(line: 131, column: 9, scope: !208)
!214 = !DILocation(line: 128, column: 35, scope: !203)
!215 = !DILocation(line: 128, column: 9, scope: !203)
!216 = distinct !{!216, !206, !217, !71}
!217 = !DILocation(line: 131, column: 9, scope: !200)
!218 = !DILocation(line: 132, column: 9, scope: !190)
!219 = !DILocation(line: 132, column: 20, scope: !190)
!220 = !DILocation(line: 133, column: 19, scope: !190)
!221 = !DILocation(line: 133, column: 9, scope: !190)
!222 = !DILocation(line: 135, column: 1, scope: !177)
!223 = distinct !DISubprogram(name: "goodG2B2Source", scope: !12, file: !12, line: 105, type: !78, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!224 = !DILocalVariable(name: "data", arg: 1, scope: !223, file: !12, line: 105, type: !6)
!225 = !DILocation(line: 105, column: 37, scope: !223)
!226 = !DILocation(line: 107, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !12, line: 107, column: 8)
!228 = !DILocation(line: 107, column: 8, scope: !223)
!229 = !DILocation(line: 110, column: 16, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !12, line: 108, column: 5)
!231 = !DILocation(line: 110, column: 9, scope: !230)
!232 = !DILocation(line: 111, column: 9, scope: !230)
!233 = !DILocation(line: 111, column: 20, scope: !230)
!234 = !DILocation(line: 112, column: 5, scope: !230)
!235 = !DILocation(line: 113, column: 12, scope: !223)
!236 = !DILocation(line: 113, column: 5, scope: !223)
