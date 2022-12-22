; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = load i8*, i8** %data, align 8, !dbg !51
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !52
  store i64 %call1, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !57
  %4 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp = icmp ult i64 %3, %4, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !62
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !62
  %7 = load i8, i8* %arrayidx, align 1, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !66
  store i8 %7, i8* %arrayidx2, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !74
  store i8 0, i8* %arrayidx3, align 1, !dbg !75
  %10 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %10), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32, i32* @badStatic, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !89
  %2 = load i8*, i8** %data.addr, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !93
  ret i8* %3, !dbg !94
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21_good() #0 !dbg !95 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #7, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #7, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !122
  store i8* %arraydecay, i8** %data, align 8, !dbg !123
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !124
  %0 = load i8*, i8** %data, align 8, !dbg !125
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !126
  store i8* %call, i8** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !133, metadata !DIExpression()), !dbg !134
  %2 = load i8*, i8** %data, align 8, !dbg !135
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !136
  store i64 %call1, i64* %dataLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !141
  %4 = load i64, i64* %dataLen, align 8, !dbg !143
  %cmp = icmp ult i64 %3, %4, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !146
  %6 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !146
  %7 = load i8, i8* %arrayidx, align 1, !dbg !146
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !150
  store i8 %7, i8* %arrayidx2, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %9, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !157
  store i8 0, i8* %arrayidx3, align 1, !dbg !158
  %10 = load i8*, i8** %data, align 8, !dbg !159
  call void @printLine(i8* %10), !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !162 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !165
  %tobool = icmp ne i32 %0, 0, !dbg !165
  br i1 %tobool, label %if.then, label %if.else, !dbg !167

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !168
  br label %if.end, !dbg !170

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !173
  %2 = load i8*, i8** %data.addr, align 8, !dbg !174
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !174
  store i8 0, i8* %arrayidx, align 1, !dbg !175
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !176
  ret i8* %3, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !178 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !183
  store i8* %arraydecay, i8** %data, align 8, !dbg !184
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !185
  %0 = load i8*, i8** %data, align 8, !dbg !186
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !187
  store i8* %call, i8** %data, align 8, !dbg !188
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !189, metadata !DIExpression()), !dbg !191
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !191
  call void @llvm.dbg.declare(metadata i64* %i, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !194, metadata !DIExpression()), !dbg !195
  %2 = load i8*, i8** %data, align 8, !dbg !196
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !197
  store i64 %call1, i64* %dataLen, align 8, !dbg !198
  store i64 0, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !202
  %4 = load i64, i64* %dataLen, align 8, !dbg !204
  %cmp = icmp ult i64 %3, %4, !dbg !205
  br i1 %cmp, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !207
  %6 = load i64, i64* %i, align 8, !dbg !209
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !207
  %7 = load i8, i8* %arrayidx, align 1, !dbg !207
  %8 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !211
  store i8 %7, i8* %arrayidx2, align 1, !dbg !212
  br label %for.inc, !dbg !213

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !214
  %inc = add i64 %9, 1, !dbg !214
  store i64 %inc, i64* %i, align 8, !dbg !214
  br label %for.cond, !dbg !215, !llvm.loop !216

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !218
  store i8 0, i8* %arrayidx3, align 1, !dbg !219
  %10 = load i8*, i8** %data, align 8, !dbg !220
  call void @printLine(i8* %10), !dbg !221
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 63, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 64, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21_bad", scope: !10, file: !10, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 39, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 39, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 40, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 40, column: 10, scope: !20)
!32 = !DILocation(line: 41, column: 12, scope: !20)
!33 = !DILocation(line: 41, column: 10, scope: !20)
!34 = !DILocation(line: 42, column: 15, scope: !20)
!35 = !DILocation(line: 43, column: 22, scope: !20)
!36 = !DILocation(line: 43, column: 12, scope: !20)
!37 = !DILocation(line: 43, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 45, column: 14, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !10, line: 46, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 46, column: 16, scope: !39)
!49 = !DILocalVariable(name: "dataLen", scope: !39, file: !10, line: 46, type: !45)
!50 = !DILocation(line: 46, column: 19, scope: !39)
!51 = !DILocation(line: 47, column: 26, scope: !39)
!52 = !DILocation(line: 47, column: 19, scope: !39)
!53 = !DILocation(line: 47, column: 17, scope: !39)
!54 = !DILocation(line: 49, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !39, file: !10, line: 49, column: 9)
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
!74 = !DILocation(line: 53, column: 9, scope: !39)
!75 = !DILocation(line: 53, column: 20, scope: !39)
!76 = !DILocation(line: 54, column: 19, scope: !39)
!77 = !DILocation(line: 54, column: 9, scope: !39)
!78 = !DILocation(line: 56, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 26, type: !80, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!24, !24}
!82 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !10, line: 26, type: !24)
!83 = !DILocation(line: 26, column: 32, scope: !79)
!84 = !DILocation(line: 28, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !10, line: 28, column: 8)
!86 = !DILocation(line: 28, column: 8, scope: !79)
!87 = !DILocation(line: 31, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 29, column: 5)
!89 = !DILocation(line: 31, column: 9, scope: !88)
!90 = !DILocation(line: 32, column: 9, scope: !88)
!91 = !DILocation(line: 32, column: 21, scope: !88)
!92 = !DILocation(line: 33, column: 5, scope: !88)
!93 = !DILocation(line: 34, column: 12, scope: !79)
!94 = !DILocation(line: 34, column: 5, scope: !79)
!95 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_21_good", scope: !10, file: !10, line: 137, type: !21, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 139, column: 5, scope: !95)
!97 = !DILocation(line: 140, column: 5, scope: !95)
!98 = !DILocation(line: 141, column: 1, scope: !95)
!99 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 153, type: !100, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DISubroutineType(types: !101)
!101 = !{!11, !11, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !10, line: 153, type: !11)
!104 = !DILocation(line: 153, column: 14, scope: !99)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !10, line: 153, type: !102)
!106 = !DILocation(line: 153, column: 27, scope: !99)
!107 = !DILocation(line: 156, column: 22, scope: !99)
!108 = !DILocation(line: 156, column: 12, scope: !99)
!109 = !DILocation(line: 156, column: 5, scope: !99)
!110 = !DILocation(line: 158, column: 5, scope: !99)
!111 = !DILocation(line: 159, column: 5, scope: !99)
!112 = !DILocation(line: 160, column: 5, scope: !99)
!113 = !DILocation(line: 163, column: 5, scope: !99)
!114 = !DILocation(line: 164, column: 5, scope: !99)
!115 = !DILocation(line: 165, column: 5, scope: !99)
!116 = !DILocation(line: 167, column: 5, scope: !99)
!117 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !10, line: 85, type: !24)
!119 = !DILocation(line: 85, column: 12, scope: !117)
!120 = !DILocalVariable(name: "dataBuffer", scope: !117, file: !10, line: 86, type: !28)
!121 = !DILocation(line: 86, column: 10, scope: !117)
!122 = !DILocation(line: 87, column: 12, scope: !117)
!123 = !DILocation(line: 87, column: 10, scope: !117)
!124 = !DILocation(line: 88, column: 20, scope: !117)
!125 = !DILocation(line: 89, column: 27, scope: !117)
!126 = !DILocation(line: 89, column: 12, scope: !117)
!127 = !DILocation(line: 89, column: 10, scope: !117)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !10, line: 91, type: !40)
!129 = distinct !DILexicalBlock(scope: !117, file: !10, line: 90, column: 5)
!130 = !DILocation(line: 91, column: 14, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !10, line: 92, type: !45)
!132 = !DILocation(line: 92, column: 16, scope: !129)
!133 = !DILocalVariable(name: "dataLen", scope: !129, file: !10, line: 92, type: !45)
!134 = !DILocation(line: 92, column: 19, scope: !129)
!135 = !DILocation(line: 93, column: 26, scope: !129)
!136 = !DILocation(line: 93, column: 19, scope: !129)
!137 = !DILocation(line: 93, column: 17, scope: !129)
!138 = !DILocation(line: 95, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !10, line: 95, column: 9)
!140 = !DILocation(line: 95, column: 14, scope: !139)
!141 = !DILocation(line: 95, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !10, line: 95, column: 9)
!143 = !DILocation(line: 95, column: 25, scope: !142)
!144 = !DILocation(line: 95, column: 23, scope: !142)
!145 = !DILocation(line: 95, column: 9, scope: !139)
!146 = !DILocation(line: 97, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !10, line: 96, column: 9)
!148 = !DILocation(line: 97, column: 28, scope: !147)
!149 = !DILocation(line: 97, column: 18, scope: !147)
!150 = !DILocation(line: 97, column: 13, scope: !147)
!151 = !DILocation(line: 97, column: 21, scope: !147)
!152 = !DILocation(line: 98, column: 9, scope: !147)
!153 = !DILocation(line: 95, column: 35, scope: !142)
!154 = !DILocation(line: 95, column: 9, scope: !142)
!155 = distinct !{!155, !145, !156, !73}
!156 = !DILocation(line: 98, column: 9, scope: !139)
!157 = !DILocation(line: 99, column: 9, scope: !129)
!158 = !DILocation(line: 99, column: 20, scope: !129)
!159 = !DILocation(line: 100, column: 19, scope: !129)
!160 = !DILocation(line: 100, column: 9, scope: !129)
!161 = !DILocation(line: 102, column: 1, scope: !117)
!162 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 67, type: !80, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocalVariable(name: "data", arg: 1, scope: !162, file: !10, line: 67, type: !24)
!164 = !DILocation(line: 67, column: 37, scope: !162)
!165 = !DILocation(line: 69, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !10, line: 69, column: 8)
!167 = !DILocation(line: 69, column: 8, scope: !162)
!168 = !DILocation(line: 72, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !10, line: 70, column: 5)
!170 = !DILocation(line: 73, column: 5, scope: !169)
!171 = !DILocation(line: 77, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !10, line: 75, column: 5)
!173 = !DILocation(line: 77, column: 9, scope: !172)
!174 = !DILocation(line: 78, column: 9, scope: !172)
!175 = !DILocation(line: 78, column: 20, scope: !172)
!176 = !DILocation(line: 80, column: 12, scope: !162)
!177 = !DILocation(line: 80, column: 5, scope: !162)
!178 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 116, type: !21, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!179 = !DILocalVariable(name: "data", scope: !178, file: !10, line: 118, type: !24)
!180 = !DILocation(line: 118, column: 12, scope: !178)
!181 = !DILocalVariable(name: "dataBuffer", scope: !178, file: !10, line: 119, type: !28)
!182 = !DILocation(line: 119, column: 10, scope: !178)
!183 = !DILocation(line: 120, column: 12, scope: !178)
!184 = !DILocation(line: 120, column: 10, scope: !178)
!185 = !DILocation(line: 121, column: 20, scope: !178)
!186 = !DILocation(line: 122, column: 27, scope: !178)
!187 = !DILocation(line: 122, column: 12, scope: !178)
!188 = !DILocation(line: 122, column: 10, scope: !178)
!189 = !DILocalVariable(name: "dest", scope: !190, file: !10, line: 124, type: !40)
!190 = distinct !DILexicalBlock(scope: !178, file: !10, line: 123, column: 5)
!191 = !DILocation(line: 124, column: 14, scope: !190)
!192 = !DILocalVariable(name: "i", scope: !190, file: !10, line: 125, type: !45)
!193 = !DILocation(line: 125, column: 16, scope: !190)
!194 = !DILocalVariable(name: "dataLen", scope: !190, file: !10, line: 125, type: !45)
!195 = !DILocation(line: 125, column: 19, scope: !190)
!196 = !DILocation(line: 126, column: 26, scope: !190)
!197 = !DILocation(line: 126, column: 19, scope: !190)
!198 = !DILocation(line: 126, column: 17, scope: !190)
!199 = !DILocation(line: 128, column: 16, scope: !200)
!200 = distinct !DILexicalBlock(scope: !190, file: !10, line: 128, column: 9)
!201 = !DILocation(line: 128, column: 14, scope: !200)
!202 = !DILocation(line: 128, column: 21, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !10, line: 128, column: 9)
!204 = !DILocation(line: 128, column: 25, scope: !203)
!205 = !DILocation(line: 128, column: 23, scope: !203)
!206 = !DILocation(line: 128, column: 9, scope: !200)
!207 = !DILocation(line: 130, column: 23, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !10, line: 129, column: 9)
!209 = !DILocation(line: 130, column: 28, scope: !208)
!210 = !DILocation(line: 130, column: 18, scope: !208)
!211 = !DILocation(line: 130, column: 13, scope: !208)
!212 = !DILocation(line: 130, column: 21, scope: !208)
!213 = !DILocation(line: 131, column: 9, scope: !208)
!214 = !DILocation(line: 128, column: 35, scope: !203)
!215 = !DILocation(line: 128, column: 9, scope: !203)
!216 = distinct !{!216, !206, !217, !73}
!217 = !DILocation(line: 131, column: 9, scope: !200)
!218 = !DILocation(line: 132, column: 9, scope: !190)
!219 = !DILocation(line: 132, column: 20, scope: !190)
!220 = !DILocation(line: 133, column: 19, scope: !190)
!221 = !DILocation(line: 133, column: 9, scope: !190)
!222 = !DILocation(line: 135, column: 1, scope: !178)
!223 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 105, type: !80, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!224 = !DILocalVariable(name: "data", arg: 1, scope: !223, file: !10, line: 105, type: !24)
!225 = !DILocation(line: 105, column: 37, scope: !223)
!226 = !DILocation(line: 107, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !10, line: 107, column: 8)
!228 = !DILocation(line: 107, column: 8, scope: !223)
!229 = !DILocation(line: 110, column: 16, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !10, line: 108, column: 5)
!231 = !DILocation(line: 110, column: 9, scope: !230)
!232 = !DILocation(line: 111, column: 9, scope: !230)
!233 = !DILocation(line: 111, column: 20, scope: !230)
!234 = !DILocation(line: 112, column: 5, scope: !230)
!235 = !DILocation(line: 113, column: 12, scope: !223)
!236 = !DILocation(line: 113, column: 5, scope: !223)
