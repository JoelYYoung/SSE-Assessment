; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %cmp1 = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx4, align 1, !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !56
  store i64 %call6, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !61
  %5 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp7 = icmp ult i64 %4, %5, !dbg !64
  br i1 %cmp7, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !66
  %7 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !66
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !66
  %9 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !70
  store i8 %8, i8* %arrayidx9, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %10, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx10, align 1, !dbg !79
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @printLine(i8* %arraydecay11), !dbg !81
  %11 = load i8*, i8** %data, align 8, !dbg !82
  call void @free(i8* %11) #7, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_14_good() #0 !dbg !85 {
entry:
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__malloc_char_loop_14_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_char_loop_14_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  %0 = load i32, i32* @globalFive, align 4, !dbg !112
  %cmp = icmp ne i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end3, !dbg !118

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !119
  store i8* %call, i8** %data, align 8, !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %cmp1 = icmp eq i8* %1, null, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !125

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !129
  %3 = load i8*, i8** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx4, align 1, !dbg !141
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !143
  store i64 %call6, i64* %destLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !148
  %5 = load i64, i64* %destLen, align 8, !dbg !150
  %cmp7 = icmp ult i64 %4, %5, !dbg !151
  br i1 %cmp7, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !153
  %7 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !153
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !153
  %9 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !157
  store i8 %8, i8* %arrayidx9, align 1, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %10, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !164
  store i8 0, i8* %arrayidx10, align 1, !dbg !165
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @printLine(i8* %arraydecay11), !dbg !167
  %11 = load i8*, i8** %data, align 8, !dbg !168
  call void @free(i8* %11) #7, !dbg !169
  ret void, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !171 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !172, metadata !DIExpression()), !dbg !173
  store i8* null, i8** %data, align 8, !dbg !174
  %0 = load i32, i32* @globalFive, align 4, !dbg !175
  %cmp = icmp eq i32 %0, 5, !dbg !177
  br i1 %cmp, label %if.then, label %if.end3, !dbg !178

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !179
  store i8* %call, i8** %data, align 8, !dbg !181
  %1 = load i8*, i8** %data, align 8, !dbg !182
  %cmp1 = icmp eq i8* %1, null, !dbg !184
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !185

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !186
  unreachable, !dbg !186

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !189
  %3 = load i8*, i8** %data, align 8, !dbg !190
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !190
  store i8 0, i8* %arrayidx, align 1, !dbg !191
  br label %if.end3, !dbg !192

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !193, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !198, metadata !DIExpression()), !dbg !199
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !200
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !200
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !201
  store i8 0, i8* %arrayidx4, align 1, !dbg !202
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !203
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !204
  store i64 %call6, i64* %destLen, align 8, !dbg !205
  store i64 0, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !209
  %5 = load i64, i64* %destLen, align 8, !dbg !211
  %cmp7 = icmp ult i64 %4, %5, !dbg !212
  br i1 %cmp7, label %for.body, label %for.end, !dbg !213

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !214
  %7 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !214
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !214
  %9 = load i64, i64* %i, align 8, !dbg !217
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !218
  store i8 %8, i8* %arrayidx9, align 1, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !221
  %inc = add i64 %10, 1, !dbg !221
  store i64 %inc, i64* %i, align 8, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !225
  store i8 0, i8* %arrayidx10, align 1, !dbg !226
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !227
  call void @printLine(i8* %arraydecay11), !dbg !228
  %11 = load i8*, i8** %data, align 8, !dbg !229
  call void @free(i8* %11) #7, !dbg !230
  ret void, !dbg !231
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_14_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_14.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 18, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 14, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !26)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 16, scope: !26)
!35 = !DILocation(line: 32, column: 9, scope: !26)
!36 = !DILocation(line: 33, column: 9, scope: !26)
!37 = !DILocation(line: 33, column: 20, scope: !26)
!38 = !DILocation(line: 34, column: 5, scope: !26)
!39 = !DILocalVariable(name: "i", scope: !40, file: !15, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 36, column: 16, scope: !40)
!45 = !DILocalVariable(name: "destLen", scope: !40, file: !15, line: 36, type: !41)
!46 = !DILocation(line: 36, column: 19, scope: !40)
!47 = !DILocalVariable(name: "dest", scope: !40, file: !15, line: 37, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 37, column: 14, scope: !40)
!52 = !DILocation(line: 38, column: 9, scope: !40)
!53 = !DILocation(line: 39, column: 9, scope: !40)
!54 = !DILocation(line: 39, column: 21, scope: !40)
!55 = !DILocation(line: 40, column: 26, scope: !40)
!56 = !DILocation(line: 40, column: 19, scope: !40)
!57 = !DILocation(line: 40, column: 17, scope: !40)
!58 = !DILocation(line: 43, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !40, file: !15, line: 43, column: 9)
!60 = !DILocation(line: 43, column: 14, scope: !59)
!61 = !DILocation(line: 43, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 43, column: 9)
!63 = !DILocation(line: 43, column: 25, scope: !62)
!64 = !DILocation(line: 43, column: 23, scope: !62)
!65 = !DILocation(line: 43, column: 9, scope: !59)
!66 = !DILocation(line: 45, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !15, line: 44, column: 9)
!68 = !DILocation(line: 45, column: 28, scope: !67)
!69 = !DILocation(line: 45, column: 18, scope: !67)
!70 = !DILocation(line: 45, column: 13, scope: !67)
!71 = !DILocation(line: 45, column: 21, scope: !67)
!72 = !DILocation(line: 46, column: 9, scope: !67)
!73 = !DILocation(line: 43, column: 35, scope: !62)
!74 = !DILocation(line: 43, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 46, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 47, column: 9, scope: !40)
!79 = !DILocation(line: 47, column: 21, scope: !40)
!80 = !DILocation(line: 48, column: 19, scope: !40)
!81 = !DILocation(line: 48, column: 9, scope: !40)
!82 = !DILocation(line: 49, column: 14, scope: !40)
!83 = !DILocation(line: 49, column: 9, scope: !40)
!84 = !DILocation(line: 51, column: 1, scope: !14)
!85 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_14_good", scope: !15, file: !15, line: 124, type: !16, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 126, column: 5, scope: !85)
!87 = !DILocation(line: 127, column: 5, scope: !85)
!88 = !DILocation(line: 128, column: 1, scope: !85)
!89 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 140, type: !90, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !15, line: 140, type: !92)
!95 = !DILocation(line: 140, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !15, line: 140, type: !93)
!97 = !DILocation(line: 140, column: 27, scope: !89)
!98 = !DILocation(line: 143, column: 22, scope: !89)
!99 = !DILocation(line: 143, column: 12, scope: !89)
!100 = !DILocation(line: 143, column: 5, scope: !89)
!101 = !DILocation(line: 145, column: 5, scope: !89)
!102 = !DILocation(line: 146, column: 5, scope: !89)
!103 = !DILocation(line: 147, column: 5, scope: !89)
!104 = !DILocation(line: 150, column: 5, scope: !89)
!105 = !DILocation(line: 151, column: 5, scope: !89)
!106 = !DILocation(line: 152, column: 5, scope: !89)
!107 = !DILocation(line: 154, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 60, type: !4)
!110 = !DILocation(line: 60, column: 12, scope: !108)
!111 = !DILocation(line: 61, column: 10, scope: !108)
!112 = !DILocation(line: 62, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !15, line: 62, column: 8)
!114 = !DILocation(line: 62, column: 18, scope: !113)
!115 = !DILocation(line: 62, column: 8, scope: !108)
!116 = !DILocation(line: 65, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 63, column: 5)
!118 = !DILocation(line: 66, column: 5, scope: !117)
!119 = !DILocation(line: 70, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !15, line: 68, column: 5)
!121 = !DILocation(line: 70, column: 14, scope: !120)
!122 = !DILocation(line: 71, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !15, line: 71, column: 13)
!124 = !DILocation(line: 71, column: 18, scope: !123)
!125 = !DILocation(line: 71, column: 13, scope: !120)
!126 = !DILocation(line: 71, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 71, column: 27)
!128 = !DILocation(line: 72, column: 16, scope: !120)
!129 = !DILocation(line: 72, column: 9, scope: !120)
!130 = !DILocation(line: 73, column: 9, scope: !120)
!131 = !DILocation(line: 73, column: 21, scope: !120)
!132 = !DILocalVariable(name: "i", scope: !133, file: !15, line: 76, type: !41)
!133 = distinct !DILexicalBlock(scope: !108, file: !15, line: 75, column: 5)
!134 = !DILocation(line: 76, column: 16, scope: !133)
!135 = !DILocalVariable(name: "destLen", scope: !133, file: !15, line: 76, type: !41)
!136 = !DILocation(line: 76, column: 19, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !15, line: 77, type: !48)
!138 = !DILocation(line: 77, column: 14, scope: !133)
!139 = !DILocation(line: 78, column: 9, scope: !133)
!140 = !DILocation(line: 79, column: 9, scope: !133)
!141 = !DILocation(line: 79, column: 21, scope: !133)
!142 = !DILocation(line: 80, column: 26, scope: !133)
!143 = !DILocation(line: 80, column: 19, scope: !133)
!144 = !DILocation(line: 80, column: 17, scope: !133)
!145 = !DILocation(line: 83, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !133, file: !15, line: 83, column: 9)
!147 = !DILocation(line: 83, column: 14, scope: !146)
!148 = !DILocation(line: 83, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 83, column: 9)
!150 = !DILocation(line: 83, column: 25, scope: !149)
!151 = !DILocation(line: 83, column: 23, scope: !149)
!152 = !DILocation(line: 83, column: 9, scope: !146)
!153 = !DILocation(line: 85, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !15, line: 84, column: 9)
!155 = !DILocation(line: 85, column: 28, scope: !154)
!156 = !DILocation(line: 85, column: 18, scope: !154)
!157 = !DILocation(line: 85, column: 13, scope: !154)
!158 = !DILocation(line: 85, column: 21, scope: !154)
!159 = !DILocation(line: 86, column: 9, scope: !154)
!160 = !DILocation(line: 83, column: 35, scope: !149)
!161 = !DILocation(line: 83, column: 9, scope: !149)
!162 = distinct !{!162, !152, !163, !77}
!163 = !DILocation(line: 86, column: 9, scope: !146)
!164 = !DILocation(line: 87, column: 9, scope: !133)
!165 = !DILocation(line: 87, column: 21, scope: !133)
!166 = !DILocation(line: 88, column: 19, scope: !133)
!167 = !DILocation(line: 88, column: 9, scope: !133)
!168 = !DILocation(line: 89, column: 14, scope: !133)
!169 = !DILocation(line: 89, column: 9, scope: !133)
!170 = !DILocation(line: 91, column: 1, scope: !108)
!171 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!172 = !DILocalVariable(name: "data", scope: !171, file: !15, line: 96, type: !4)
!173 = !DILocation(line: 96, column: 12, scope: !171)
!174 = !DILocation(line: 97, column: 10, scope: !171)
!175 = !DILocation(line: 98, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !15, line: 98, column: 8)
!177 = !DILocation(line: 98, column: 18, scope: !176)
!178 = !DILocation(line: 98, column: 8, scope: !171)
!179 = !DILocation(line: 101, column: 24, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 99, column: 5)
!181 = !DILocation(line: 101, column: 14, scope: !180)
!182 = !DILocation(line: 102, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !15, line: 102, column: 13)
!184 = !DILocation(line: 102, column: 18, scope: !183)
!185 = !DILocation(line: 102, column: 13, scope: !180)
!186 = !DILocation(line: 102, column: 28, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !15, line: 102, column: 27)
!188 = !DILocation(line: 103, column: 16, scope: !180)
!189 = !DILocation(line: 103, column: 9, scope: !180)
!190 = !DILocation(line: 104, column: 9, scope: !180)
!191 = !DILocation(line: 104, column: 21, scope: !180)
!192 = !DILocation(line: 105, column: 5, scope: !180)
!193 = !DILocalVariable(name: "i", scope: !194, file: !15, line: 107, type: !41)
!194 = distinct !DILexicalBlock(scope: !171, file: !15, line: 106, column: 5)
!195 = !DILocation(line: 107, column: 16, scope: !194)
!196 = !DILocalVariable(name: "destLen", scope: !194, file: !15, line: 107, type: !41)
!197 = !DILocation(line: 107, column: 19, scope: !194)
!198 = !DILocalVariable(name: "dest", scope: !194, file: !15, line: 108, type: !48)
!199 = !DILocation(line: 108, column: 14, scope: !194)
!200 = !DILocation(line: 109, column: 9, scope: !194)
!201 = !DILocation(line: 110, column: 9, scope: !194)
!202 = !DILocation(line: 110, column: 21, scope: !194)
!203 = !DILocation(line: 111, column: 26, scope: !194)
!204 = !DILocation(line: 111, column: 19, scope: !194)
!205 = !DILocation(line: 111, column: 17, scope: !194)
!206 = !DILocation(line: 114, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !194, file: !15, line: 114, column: 9)
!208 = !DILocation(line: 114, column: 14, scope: !207)
!209 = !DILocation(line: 114, column: 21, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !15, line: 114, column: 9)
!211 = !DILocation(line: 114, column: 25, scope: !210)
!212 = !DILocation(line: 114, column: 23, scope: !210)
!213 = !DILocation(line: 114, column: 9, scope: !207)
!214 = !DILocation(line: 116, column: 23, scope: !215)
!215 = distinct !DILexicalBlock(scope: !210, file: !15, line: 115, column: 9)
!216 = !DILocation(line: 116, column: 28, scope: !215)
!217 = !DILocation(line: 116, column: 18, scope: !215)
!218 = !DILocation(line: 116, column: 13, scope: !215)
!219 = !DILocation(line: 116, column: 21, scope: !215)
!220 = !DILocation(line: 117, column: 9, scope: !215)
!221 = !DILocation(line: 114, column: 35, scope: !210)
!222 = !DILocation(line: 114, column: 9, scope: !210)
!223 = distinct !{!223, !213, !224, !77}
!224 = !DILocation(line: 117, column: 9, scope: !207)
!225 = !DILocation(line: 118, column: 9, scope: !194)
!226 = !DILocation(line: 118, column: 21, scope: !194)
!227 = !DILocation(line: 119, column: 19, scope: !194)
!228 = !DILocation(line: 119, column: 9, scope: !194)
!229 = !DILocation(line: 120, column: 14, scope: !194)
!230 = !DILocation(line: 120, column: 9, scope: !194)
!231 = !DILocation(line: 122, column: 1, scope: !171)
