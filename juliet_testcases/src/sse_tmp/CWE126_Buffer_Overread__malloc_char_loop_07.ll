; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %cmp1 = icmp eq i8* %1, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx4, align 1, !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !60
  store i64 %call6, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !65
  %5 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp7 = icmp ult i64 %4, %5, !dbg !68
  br i1 %cmp7, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !70
  %7 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !70
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !70
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !74
  store i8 %8, i8* %arrayidx9, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %10, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx10, align 1, !dbg !83
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @printLine(i8* %arraydecay11), !dbg !85
  %11 = load i8*, i8** %data, align 8, !dbg !86
  call void @free(i8* %11) #7, !dbg !87
  ret void, !dbg !88
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_07_good() #0 !dbg !89 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_char_loop_07_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__malloc_char_loop_07_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* null, i8** %data, align 8, !dbg !114
  %0 = load i32, i32* @staticFive, align 4, !dbg !115
  %cmp = icmp ne i32 %0, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end3, !dbg !121

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !122
  store i8* %call, i8** %data, align 8, !dbg !124
  %1 = load i8*, i8** %data, align 8, !dbg !125
  %cmp1 = icmp eq i8* %1, null, !dbg !127
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !128

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !132
  %3 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !142
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !143
  store i8 0, i8* %arrayidx4, align 1, !dbg !144
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !146
  store i64 %call6, i64* %destLen, align 8, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !151
  %5 = load i64, i64* %destLen, align 8, !dbg !153
  %cmp7 = icmp ult i64 %4, %5, !dbg !154
  br i1 %cmp7, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !156
  %7 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !156
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !156
  %9 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !160
  store i8 %8, i8* %arrayidx9, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %10, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx10, align 1, !dbg !168
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !169
  call void @printLine(i8* %arraydecay11), !dbg !170
  %11 = load i8*, i8** %data, align 8, !dbg !171
  call void @free(i8* %11) #7, !dbg !172
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !174 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !175, metadata !DIExpression()), !dbg !176
  store i8* null, i8** %data, align 8, !dbg !177
  %0 = load i32, i32* @staticFive, align 4, !dbg !178
  %cmp = icmp eq i32 %0, 5, !dbg !180
  br i1 %cmp, label %if.then, label %if.end3, !dbg !181

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !182
  store i8* %call, i8** %data, align 8, !dbg !184
  %1 = load i8*, i8** %data, align 8, !dbg !185
  %cmp1 = icmp eq i8* %1, null, !dbg !187
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !188

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !189
  unreachable, !dbg !189

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !192
  %3 = load i8*, i8** %data, align 8, !dbg !193
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !193
  store i8 0, i8* %arrayidx, align 1, !dbg !194
  br label %if.end3, !dbg !195

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !196, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !201, metadata !DIExpression()), !dbg !202
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !203
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !204
  store i8 0, i8* %arrayidx4, align 1, !dbg !205
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !206
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !207
  store i64 %call6, i64* %destLen, align 8, !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !212
  %5 = load i64, i64* %destLen, align 8, !dbg !214
  %cmp7 = icmp ult i64 %4, %5, !dbg !215
  br i1 %cmp7, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !217
  %7 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !217
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !217
  %9 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !221
  store i8 %8, i8* %arrayidx9, align 1, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !224
  %inc = add i64 %10, 1, !dbg !224
  store i64 %inc, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !228
  store i8 0, i8* %arrayidx10, align 1, !dbg !229
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !230
  call void @printLine(i8* %arraydecay11), !dbg !231
  %11 = load i8*, i8** %data, align 8, !dbg !232
  call void @free(i8* %11) #7, !dbg !233
  ret void, !dbg !234
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
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_07.c", directory: "/root/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 10, scope: !19)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !19)
!29 = !DILocation(line: 36, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 34, column: 5)
!31 = !DILocation(line: 36, column: 14, scope: !30)
!32 = !DILocation(line: 37, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 13)
!34 = !DILocation(line: 37, column: 18, scope: !33)
!35 = !DILocation(line: 37, column: 13, scope: !30)
!36 = !DILocation(line: 37, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 37, column: 27)
!38 = !DILocation(line: 38, column: 16, scope: !30)
!39 = !DILocation(line: 38, column: 9, scope: !30)
!40 = !DILocation(line: 39, column: 9, scope: !30)
!41 = !DILocation(line: 39, column: 20, scope: !30)
!42 = !DILocation(line: 40, column: 5, scope: !30)
!43 = !DILocalVariable(name: "i", scope: !44, file: !11, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !19, file: !11, line: 41, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !44)
!49 = !DILocalVariable(name: "destLen", scope: !44, file: !11, line: 42, type: !45)
!50 = !DILocation(line: 42, column: 19, scope: !44)
!51 = !DILocalVariable(name: "dest", scope: !44, file: !11, line: 43, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 43, column: 14, scope: !44)
!56 = !DILocation(line: 44, column: 9, scope: !44)
!57 = !DILocation(line: 45, column: 9, scope: !44)
!58 = !DILocation(line: 45, column: 21, scope: !44)
!59 = !DILocation(line: 46, column: 26, scope: !44)
!60 = !DILocation(line: 46, column: 19, scope: !44)
!61 = !DILocation(line: 46, column: 17, scope: !44)
!62 = !DILocation(line: 49, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !44, file: !11, line: 49, column: 9)
!64 = !DILocation(line: 49, column: 14, scope: !63)
!65 = !DILocation(line: 49, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !11, line: 49, column: 9)
!67 = !DILocation(line: 49, column: 25, scope: !66)
!68 = !DILocation(line: 49, column: 23, scope: !66)
!69 = !DILocation(line: 49, column: 9, scope: !63)
!70 = !DILocation(line: 51, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !11, line: 50, column: 9)
!72 = !DILocation(line: 51, column: 28, scope: !71)
!73 = !DILocation(line: 51, column: 18, scope: !71)
!74 = !DILocation(line: 51, column: 13, scope: !71)
!75 = !DILocation(line: 51, column: 21, scope: !71)
!76 = !DILocation(line: 52, column: 9, scope: !71)
!77 = !DILocation(line: 49, column: 35, scope: !66)
!78 = !DILocation(line: 49, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 52, column: 9, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 53, column: 9, scope: !44)
!83 = !DILocation(line: 53, column: 21, scope: !44)
!84 = !DILocation(line: 54, column: 19, scope: !44)
!85 = !DILocation(line: 54, column: 9, scope: !44)
!86 = !DILocation(line: 55, column: 14, scope: !44)
!87 = !DILocation(line: 55, column: 9, scope: !44)
!88 = !DILocation(line: 57, column: 1, scope: !19)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_07_good", scope: !11, file: !11, line: 130, type: !20, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocation(line: 132, column: 5, scope: !89)
!91 = !DILocation(line: 133, column: 5, scope: !89)
!92 = !DILocation(line: 134, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 146, type: !94, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!12, !12, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !11, line: 146, type: !12)
!98 = !DILocation(line: 146, column: 14, scope: !93)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !11, line: 146, type: !96)
!100 = !DILocation(line: 146, column: 27, scope: !93)
!101 = !DILocation(line: 149, column: 22, scope: !93)
!102 = !DILocation(line: 149, column: 12, scope: !93)
!103 = !DILocation(line: 149, column: 5, scope: !93)
!104 = !DILocation(line: 151, column: 5, scope: !93)
!105 = !DILocation(line: 152, column: 5, scope: !93)
!106 = !DILocation(line: 153, column: 5, scope: !93)
!107 = !DILocation(line: 156, column: 5, scope: !93)
!108 = !DILocation(line: 157, column: 5, scope: !93)
!109 = !DILocation(line: 158, column: 5, scope: !93)
!110 = !DILocation(line: 160, column: 5, scope: !93)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 64, type: !20, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !11, line: 66, type: !6)
!113 = !DILocation(line: 66, column: 12, scope: !111)
!114 = !DILocation(line: 67, column: 10, scope: !111)
!115 = !DILocation(line: 68, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !11, line: 68, column: 8)
!117 = !DILocation(line: 68, column: 18, scope: !116)
!118 = !DILocation(line: 68, column: 8, scope: !111)
!119 = !DILocation(line: 71, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !11, line: 69, column: 5)
!121 = !DILocation(line: 72, column: 5, scope: !120)
!122 = !DILocation(line: 76, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !11, line: 74, column: 5)
!124 = !DILocation(line: 76, column: 14, scope: !123)
!125 = !DILocation(line: 77, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !11, line: 77, column: 13)
!127 = !DILocation(line: 77, column: 18, scope: !126)
!128 = !DILocation(line: 77, column: 13, scope: !123)
!129 = !DILocation(line: 77, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !11, line: 77, column: 27)
!131 = !DILocation(line: 78, column: 16, scope: !123)
!132 = !DILocation(line: 78, column: 9, scope: !123)
!133 = !DILocation(line: 79, column: 9, scope: !123)
!134 = !DILocation(line: 79, column: 21, scope: !123)
!135 = !DILocalVariable(name: "i", scope: !136, file: !11, line: 82, type: !45)
!136 = distinct !DILexicalBlock(scope: !111, file: !11, line: 81, column: 5)
!137 = !DILocation(line: 82, column: 16, scope: !136)
!138 = !DILocalVariable(name: "destLen", scope: !136, file: !11, line: 82, type: !45)
!139 = !DILocation(line: 82, column: 19, scope: !136)
!140 = !DILocalVariable(name: "dest", scope: !136, file: !11, line: 83, type: !52)
!141 = !DILocation(line: 83, column: 14, scope: !136)
!142 = !DILocation(line: 84, column: 9, scope: !136)
!143 = !DILocation(line: 85, column: 9, scope: !136)
!144 = !DILocation(line: 85, column: 21, scope: !136)
!145 = !DILocation(line: 86, column: 26, scope: !136)
!146 = !DILocation(line: 86, column: 19, scope: !136)
!147 = !DILocation(line: 86, column: 17, scope: !136)
!148 = !DILocation(line: 89, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !136, file: !11, line: 89, column: 9)
!150 = !DILocation(line: 89, column: 14, scope: !149)
!151 = !DILocation(line: 89, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !11, line: 89, column: 9)
!153 = !DILocation(line: 89, column: 25, scope: !152)
!154 = !DILocation(line: 89, column: 23, scope: !152)
!155 = !DILocation(line: 89, column: 9, scope: !149)
!156 = !DILocation(line: 91, column: 23, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !11, line: 90, column: 9)
!158 = !DILocation(line: 91, column: 28, scope: !157)
!159 = !DILocation(line: 91, column: 18, scope: !157)
!160 = !DILocation(line: 91, column: 13, scope: !157)
!161 = !DILocation(line: 91, column: 21, scope: !157)
!162 = !DILocation(line: 92, column: 9, scope: !157)
!163 = !DILocation(line: 89, column: 35, scope: !152)
!164 = !DILocation(line: 89, column: 9, scope: !152)
!165 = distinct !{!165, !155, !166, !81}
!166 = !DILocation(line: 92, column: 9, scope: !149)
!167 = !DILocation(line: 93, column: 9, scope: !136)
!168 = !DILocation(line: 93, column: 21, scope: !136)
!169 = !DILocation(line: 94, column: 19, scope: !136)
!170 = !DILocation(line: 94, column: 9, scope: !136)
!171 = !DILocation(line: 95, column: 14, scope: !136)
!172 = !DILocation(line: 95, column: 9, scope: !136)
!173 = !DILocation(line: 97, column: 1, scope: !111)
!174 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 100, type: !20, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!175 = !DILocalVariable(name: "data", scope: !174, file: !11, line: 102, type: !6)
!176 = !DILocation(line: 102, column: 12, scope: !174)
!177 = !DILocation(line: 103, column: 10, scope: !174)
!178 = !DILocation(line: 104, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !11, line: 104, column: 8)
!180 = !DILocation(line: 104, column: 18, scope: !179)
!181 = !DILocation(line: 104, column: 8, scope: !174)
!182 = !DILocation(line: 107, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !11, line: 105, column: 5)
!184 = !DILocation(line: 107, column: 14, scope: !183)
!185 = !DILocation(line: 108, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !11, line: 108, column: 13)
!187 = !DILocation(line: 108, column: 18, scope: !186)
!188 = !DILocation(line: 108, column: 13, scope: !183)
!189 = !DILocation(line: 108, column: 28, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !11, line: 108, column: 27)
!191 = !DILocation(line: 109, column: 16, scope: !183)
!192 = !DILocation(line: 109, column: 9, scope: !183)
!193 = !DILocation(line: 110, column: 9, scope: !183)
!194 = !DILocation(line: 110, column: 21, scope: !183)
!195 = !DILocation(line: 111, column: 5, scope: !183)
!196 = !DILocalVariable(name: "i", scope: !197, file: !11, line: 113, type: !45)
!197 = distinct !DILexicalBlock(scope: !174, file: !11, line: 112, column: 5)
!198 = !DILocation(line: 113, column: 16, scope: !197)
!199 = !DILocalVariable(name: "destLen", scope: !197, file: !11, line: 113, type: !45)
!200 = !DILocation(line: 113, column: 19, scope: !197)
!201 = !DILocalVariable(name: "dest", scope: !197, file: !11, line: 114, type: !52)
!202 = !DILocation(line: 114, column: 14, scope: !197)
!203 = !DILocation(line: 115, column: 9, scope: !197)
!204 = !DILocation(line: 116, column: 9, scope: !197)
!205 = !DILocation(line: 116, column: 21, scope: !197)
!206 = !DILocation(line: 117, column: 26, scope: !197)
!207 = !DILocation(line: 117, column: 19, scope: !197)
!208 = !DILocation(line: 117, column: 17, scope: !197)
!209 = !DILocation(line: 120, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !197, file: !11, line: 120, column: 9)
!211 = !DILocation(line: 120, column: 14, scope: !210)
!212 = !DILocation(line: 120, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !11, line: 120, column: 9)
!214 = !DILocation(line: 120, column: 25, scope: !213)
!215 = !DILocation(line: 120, column: 23, scope: !213)
!216 = !DILocation(line: 120, column: 9, scope: !210)
!217 = !DILocation(line: 122, column: 23, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !11, line: 121, column: 9)
!219 = !DILocation(line: 122, column: 28, scope: !218)
!220 = !DILocation(line: 122, column: 18, scope: !218)
!221 = !DILocation(line: 122, column: 13, scope: !218)
!222 = !DILocation(line: 122, column: 21, scope: !218)
!223 = !DILocation(line: 123, column: 9, scope: !218)
!224 = !DILocation(line: 120, column: 35, scope: !213)
!225 = !DILocation(line: 120, column: 9, scope: !213)
!226 = distinct !{!226, !216, !227, !81}
!227 = !DILocation(line: 123, column: 9, scope: !210)
!228 = !DILocation(line: 124, column: 9, scope: !197)
!229 = !DILocation(line: 124, column: 21, scope: !197)
!230 = !DILocation(line: 125, column: 19, scope: !197)
!231 = !DILocation(line: 125, column: 9, scope: !197)
!232 = !DILocation(line: 126, column: 14, scope: !197)
!233 = !DILocation(line: 126, column: 9, scope: !197)
!234 = !DILocation(line: 128, column: 1, scope: !174)
