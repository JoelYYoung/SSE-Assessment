; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end2, !dbg !43

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx3, align 1, !dbg !59
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !61
  store i64 %call5, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !66
  %5 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp6 = icmp ult i64 %4, %5, !dbg !69
  br i1 %cmp6, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !71
  %7 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !71
  %8 = load i8, i8* %arrayidx7, align 1, !dbg !71
  %9 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !75
  store i8 %8, i8* %arrayidx8, align 1, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %10, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx9, align 1, !dbg !84
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  call void @printLine(i8* %arraydecay10), !dbg !86
  %11 = load i8*, i8** %data, align 8, !dbg !87
  call void @free(i8* %11) #7, !dbg !88
  ret void, !dbg !89
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_05_good() #0 !dbg !90 {
entry:
  call void @goodG2B1(), !dbg !91
  call void @goodG2B2(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #7, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #7, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__malloc_char_loop_05_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__malloc_char_loop_05_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i8* null, i8** %data, align 8, !dbg !115
  %0 = load i32, i32* @staticFalse, align 4, !dbg !116
  %tobool = icmp ne i32 %0, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end2, !dbg !121

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !122
  store i8* %call, i8** %data, align 8, !dbg !124
  %1 = load i8*, i8** %data, align 8, !dbg !125
  %cmp = icmp eq i8* %1, null, !dbg !127
  br i1 %cmp, label %if.then1, label %if.end, !dbg !128

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !132
  %3 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !142
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !143
  store i8 0, i8* %arrayidx3, align 1, !dbg !144
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !146
  store i64 %call5, i64* %destLen, align 8, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !151
  %5 = load i64, i64* %destLen, align 8, !dbg !153
  %cmp6 = icmp ult i64 %4, %5, !dbg !154
  br i1 %cmp6, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !156
  %7 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !156
  %8 = load i8, i8* %arrayidx7, align 1, !dbg !156
  %9 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !160
  store i8 %8, i8* %arrayidx8, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %10, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx9, align 1, !dbg !168
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !169
  call void @printLine(i8* %arraydecay10), !dbg !170
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !178
  %tobool = icmp ne i32 %0, 0, !dbg !178
  br i1 %tobool, label %if.then, label %if.end2, !dbg !180

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !181
  store i8* %call, i8** %data, align 8, !dbg !183
  %1 = load i8*, i8** %data, align 8, !dbg !184
  %cmp = icmp eq i8* %1, null, !dbg !186
  br i1 %cmp, label %if.then1, label %if.end, !dbg !187

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !188
  unreachable, !dbg !188

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !191
  %3 = load i8*, i8** %data, align 8, !dbg !192
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !192
  store i8 0, i8* %arrayidx, align 1, !dbg !193
  br label %if.end2, !dbg !194

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !195, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !200, metadata !DIExpression()), !dbg !201
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !202
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !202
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !203
  store i8 0, i8* %arrayidx3, align 1, !dbg !204
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !205
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !206
  store i64 %call5, i64* %destLen, align 8, !dbg !207
  store i64 0, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !211
  %5 = load i64, i64* %destLen, align 8, !dbg !213
  %cmp6 = icmp ult i64 %4, %5, !dbg !214
  br i1 %cmp6, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !216
  %7 = load i64, i64* %i, align 8, !dbg !218
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !216
  %8 = load i8, i8* %arrayidx7, align 1, !dbg !216
  %9 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !220
  store i8 %8, i8* %arrayidx8, align 1, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !223
  %inc = add i64 %10, 1, !dbg !223
  store i64 %inc, i64* %i, align 8, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !227
  store i8 0, i8* %arrayidx9, align 1, !dbg !228
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !229
  call void @printLine(i8* %arraydecay10), !dbg !230
  %11 = load i8*, i8** %data, align 8, !dbg !231
  call void @free(i8* %11) #7, !dbg !232
  ret void, !dbg !233
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !21)
!30 = !DILocation(line: 37, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 18, scope: !34)
!36 = !DILocation(line: 38, column: 13, scope: !31)
!37 = !DILocation(line: 38, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 38, column: 27)
!39 = !DILocation(line: 39, column: 16, scope: !31)
!40 = !DILocation(line: 39, column: 9, scope: !31)
!41 = !DILocation(line: 40, column: 9, scope: !31)
!42 = !DILocation(line: 40, column: 20, scope: !31)
!43 = !DILocation(line: 41, column: 5, scope: !31)
!44 = !DILocalVariable(name: "i", scope: !45, file: !13, line: 43, type: !46)
!45 = distinct !DILexicalBlock(scope: !21, file: !13, line: 42, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 43, column: 16, scope: !45)
!50 = !DILocalVariable(name: "destLen", scope: !45, file: !13, line: 43, type: !46)
!51 = !DILocation(line: 43, column: 19, scope: !45)
!52 = !DILocalVariable(name: "dest", scope: !45, file: !13, line: 44, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 44, column: 14, scope: !45)
!57 = !DILocation(line: 45, column: 9, scope: !45)
!58 = !DILocation(line: 46, column: 9, scope: !45)
!59 = !DILocation(line: 46, column: 21, scope: !45)
!60 = !DILocation(line: 47, column: 26, scope: !45)
!61 = !DILocation(line: 47, column: 19, scope: !45)
!62 = !DILocation(line: 47, column: 17, scope: !45)
!63 = !DILocation(line: 50, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !45, file: !13, line: 50, column: 9)
!65 = !DILocation(line: 50, column: 14, scope: !64)
!66 = !DILocation(line: 50, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !13, line: 50, column: 9)
!68 = !DILocation(line: 50, column: 25, scope: !67)
!69 = !DILocation(line: 50, column: 23, scope: !67)
!70 = !DILocation(line: 50, column: 9, scope: !64)
!71 = !DILocation(line: 52, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !13, line: 51, column: 9)
!73 = !DILocation(line: 52, column: 28, scope: !72)
!74 = !DILocation(line: 52, column: 18, scope: !72)
!75 = !DILocation(line: 52, column: 13, scope: !72)
!76 = !DILocation(line: 52, column: 21, scope: !72)
!77 = !DILocation(line: 53, column: 9, scope: !72)
!78 = !DILocation(line: 50, column: 35, scope: !67)
!79 = !DILocation(line: 50, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 53, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 54, column: 9, scope: !45)
!84 = !DILocation(line: 54, column: 21, scope: !45)
!85 = !DILocation(line: 55, column: 19, scope: !45)
!86 = !DILocation(line: 55, column: 9, scope: !45)
!87 = !DILocation(line: 56, column: 14, scope: !45)
!88 = !DILocation(line: 56, column: 9, scope: !45)
!89 = !DILocation(line: 58, column: 1, scope: !21)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_05_good", scope: !13, file: !13, line: 131, type: !22, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocation(line: 133, column: 5, scope: !90)
!92 = !DILocation(line: 134, column: 5, scope: !90)
!93 = !DILocation(line: 135, column: 1, scope: !90)
!94 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 147, type: !95, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DISubroutineType(types: !96)
!96 = !{!14, !14, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !13, line: 147, type: !14)
!99 = !DILocation(line: 147, column: 14, scope: !94)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !13, line: 147, type: !97)
!101 = !DILocation(line: 147, column: 27, scope: !94)
!102 = !DILocation(line: 150, column: 22, scope: !94)
!103 = !DILocation(line: 150, column: 12, scope: !94)
!104 = !DILocation(line: 150, column: 5, scope: !94)
!105 = !DILocation(line: 152, column: 5, scope: !94)
!106 = !DILocation(line: 153, column: 5, scope: !94)
!107 = !DILocation(line: 154, column: 5, scope: !94)
!108 = !DILocation(line: 157, column: 5, scope: !94)
!109 = !DILocation(line: 158, column: 5, scope: !94)
!110 = !DILocation(line: 159, column: 5, scope: !94)
!111 = !DILocation(line: 161, column: 5, scope: !94)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 65, type: !22, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 67, type: !6)
!114 = !DILocation(line: 67, column: 12, scope: !112)
!115 = !DILocation(line: 68, column: 10, scope: !112)
!116 = !DILocation(line: 69, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !13, line: 69, column: 8)
!118 = !DILocation(line: 69, column: 8, scope: !112)
!119 = !DILocation(line: 72, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !13, line: 70, column: 5)
!121 = !DILocation(line: 73, column: 5, scope: !120)
!122 = !DILocation(line: 77, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !13, line: 75, column: 5)
!124 = !DILocation(line: 77, column: 14, scope: !123)
!125 = !DILocation(line: 78, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !13, line: 78, column: 13)
!127 = !DILocation(line: 78, column: 18, scope: !126)
!128 = !DILocation(line: 78, column: 13, scope: !123)
!129 = !DILocation(line: 78, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !13, line: 78, column: 27)
!131 = !DILocation(line: 79, column: 16, scope: !123)
!132 = !DILocation(line: 79, column: 9, scope: !123)
!133 = !DILocation(line: 80, column: 9, scope: !123)
!134 = !DILocation(line: 80, column: 21, scope: !123)
!135 = !DILocalVariable(name: "i", scope: !136, file: !13, line: 83, type: !46)
!136 = distinct !DILexicalBlock(scope: !112, file: !13, line: 82, column: 5)
!137 = !DILocation(line: 83, column: 16, scope: !136)
!138 = !DILocalVariable(name: "destLen", scope: !136, file: !13, line: 83, type: !46)
!139 = !DILocation(line: 83, column: 19, scope: !136)
!140 = !DILocalVariable(name: "dest", scope: !136, file: !13, line: 84, type: !53)
!141 = !DILocation(line: 84, column: 14, scope: !136)
!142 = !DILocation(line: 85, column: 9, scope: !136)
!143 = !DILocation(line: 86, column: 9, scope: !136)
!144 = !DILocation(line: 86, column: 21, scope: !136)
!145 = !DILocation(line: 87, column: 26, scope: !136)
!146 = !DILocation(line: 87, column: 19, scope: !136)
!147 = !DILocation(line: 87, column: 17, scope: !136)
!148 = !DILocation(line: 90, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !136, file: !13, line: 90, column: 9)
!150 = !DILocation(line: 90, column: 14, scope: !149)
!151 = !DILocation(line: 90, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !13, line: 90, column: 9)
!153 = !DILocation(line: 90, column: 25, scope: !152)
!154 = !DILocation(line: 90, column: 23, scope: !152)
!155 = !DILocation(line: 90, column: 9, scope: !149)
!156 = !DILocation(line: 92, column: 23, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !13, line: 91, column: 9)
!158 = !DILocation(line: 92, column: 28, scope: !157)
!159 = !DILocation(line: 92, column: 18, scope: !157)
!160 = !DILocation(line: 92, column: 13, scope: !157)
!161 = !DILocation(line: 92, column: 21, scope: !157)
!162 = !DILocation(line: 93, column: 9, scope: !157)
!163 = !DILocation(line: 90, column: 35, scope: !152)
!164 = !DILocation(line: 90, column: 9, scope: !152)
!165 = distinct !{!165, !155, !166, !82}
!166 = !DILocation(line: 93, column: 9, scope: !149)
!167 = !DILocation(line: 94, column: 9, scope: !136)
!168 = !DILocation(line: 94, column: 21, scope: !136)
!169 = !DILocation(line: 95, column: 19, scope: !136)
!170 = !DILocation(line: 95, column: 9, scope: !136)
!171 = !DILocation(line: 96, column: 14, scope: !136)
!172 = !DILocation(line: 96, column: 9, scope: !136)
!173 = !DILocation(line: 98, column: 1, scope: !112)
!174 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 101, type: !22, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!175 = !DILocalVariable(name: "data", scope: !174, file: !13, line: 103, type: !6)
!176 = !DILocation(line: 103, column: 12, scope: !174)
!177 = !DILocation(line: 104, column: 10, scope: !174)
!178 = !DILocation(line: 105, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !13, line: 105, column: 8)
!180 = !DILocation(line: 105, column: 8, scope: !174)
!181 = !DILocation(line: 108, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !13, line: 106, column: 5)
!183 = !DILocation(line: 108, column: 14, scope: !182)
!184 = !DILocation(line: 109, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !13, line: 109, column: 13)
!186 = !DILocation(line: 109, column: 18, scope: !185)
!187 = !DILocation(line: 109, column: 13, scope: !182)
!188 = !DILocation(line: 109, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !13, line: 109, column: 27)
!190 = !DILocation(line: 110, column: 16, scope: !182)
!191 = !DILocation(line: 110, column: 9, scope: !182)
!192 = !DILocation(line: 111, column: 9, scope: !182)
!193 = !DILocation(line: 111, column: 21, scope: !182)
!194 = !DILocation(line: 112, column: 5, scope: !182)
!195 = !DILocalVariable(name: "i", scope: !196, file: !13, line: 114, type: !46)
!196 = distinct !DILexicalBlock(scope: !174, file: !13, line: 113, column: 5)
!197 = !DILocation(line: 114, column: 16, scope: !196)
!198 = !DILocalVariable(name: "destLen", scope: !196, file: !13, line: 114, type: !46)
!199 = !DILocation(line: 114, column: 19, scope: !196)
!200 = !DILocalVariable(name: "dest", scope: !196, file: !13, line: 115, type: !53)
!201 = !DILocation(line: 115, column: 14, scope: !196)
!202 = !DILocation(line: 116, column: 9, scope: !196)
!203 = !DILocation(line: 117, column: 9, scope: !196)
!204 = !DILocation(line: 117, column: 21, scope: !196)
!205 = !DILocation(line: 118, column: 26, scope: !196)
!206 = !DILocation(line: 118, column: 19, scope: !196)
!207 = !DILocation(line: 118, column: 17, scope: !196)
!208 = !DILocation(line: 121, column: 16, scope: !209)
!209 = distinct !DILexicalBlock(scope: !196, file: !13, line: 121, column: 9)
!210 = !DILocation(line: 121, column: 14, scope: !209)
!211 = !DILocation(line: 121, column: 21, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !13, line: 121, column: 9)
!213 = !DILocation(line: 121, column: 25, scope: !212)
!214 = !DILocation(line: 121, column: 23, scope: !212)
!215 = !DILocation(line: 121, column: 9, scope: !209)
!216 = !DILocation(line: 123, column: 23, scope: !217)
!217 = distinct !DILexicalBlock(scope: !212, file: !13, line: 122, column: 9)
!218 = !DILocation(line: 123, column: 28, scope: !217)
!219 = !DILocation(line: 123, column: 18, scope: !217)
!220 = !DILocation(line: 123, column: 13, scope: !217)
!221 = !DILocation(line: 123, column: 21, scope: !217)
!222 = !DILocation(line: 124, column: 9, scope: !217)
!223 = !DILocation(line: 121, column: 35, scope: !212)
!224 = !DILocation(line: 121, column: 9, scope: !212)
!225 = distinct !{!225, !215, !226, !82}
!226 = !DILocation(line: 124, column: 9, scope: !209)
!227 = !DILocation(line: 125, column: 9, scope: !196)
!228 = !DILocation(line: 125, column: 21, scope: !196)
!229 = !DILocation(line: 126, column: 19, scope: !196)
!230 = !DILocation(line: 126, column: 9, scope: !196)
!231 = !DILocation(line: 127, column: 14, scope: !196)
!232 = !DILocation(line: 127, column: 9, scope: !196)
!233 = !DILocation(line: 129, column: 1, scope: !174)
