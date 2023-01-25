; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !36
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx2, align 1, !dbg !38
  %0 = load i32, i32* @staticFive, align 4, !dbg !39
  %cmp = icmp eq i32 %0, 5, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i8* %arraydecay3, i8** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !56
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx5, align 1, !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !61
  store i64 %call, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !66
  %2 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp7 = icmp ult i64 %1, %2, !dbg !69
  br i1 %cmp7, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !71
  %4 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !71
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !71
  %6 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !75
  store i8 %5, i8* %arrayidx9, align 1, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %7, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx10, align 1, !dbg !84
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  call void @printLine(i8* %arraydecay11), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_07_good() #0 !dbg !88 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__char_declare_loop_07_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__char_declare_loop_07_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !117
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx2, align 1, !dbg !122
  %0 = load i32, i32* @staticFive, align 4, !dbg !123
  %cmp = icmp ne i32 %0, 5, !dbg !125
  br i1 %cmp, label %if.then, label %if.else, !dbg !126

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !127
  br label %if.end, !dbg !129

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !130
  store i8* %arraydecay3, i8** %data, align 8, !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx5, align 1, !dbg !142
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !144
  store i64 %call, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !149
  %2 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp7 = icmp ult i64 %1, %2, !dbg !152
  br i1 %cmp7, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !154
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !154
  %6 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !158
  store i8 %5, i8* %arrayidx9, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %7, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx10, align 1, !dbg !166
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay11), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !177
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !178
  store i8 0, i8* %arrayidx, align 1, !dbg !179
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !180
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !181
  store i8 0, i8* %arrayidx2, align 1, !dbg !182
  %0 = load i32, i32* @staticFive, align 4, !dbg !183
  %cmp = icmp eq i32 %0, 5, !dbg !185
  br i1 %cmp, label %if.then, label %if.end, !dbg !186

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !187
  store i8* %arraydecay3, i8** %data, align 8, !dbg !189
  br label %if.end, !dbg !190

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !191, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !196, metadata !DIExpression()), !dbg !197
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !198
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !199
  store i8 0, i8* %arrayidx5, align 1, !dbg !200
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !201
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !202
  store i64 %call, i64* %destLen, align 8, !dbg !203
  store i64 0, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !207
  %2 = load i64, i64* %destLen, align 8, !dbg !209
  %cmp7 = icmp ult i64 %1, %2, !dbg !210
  br i1 %cmp7, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !212
  %4 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !212
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !212
  %6 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !216
  store i8 %5, i8* %arrayidx9, align 1, !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !219
  %inc = add i64 %7, 1, !dbg !219
  store i64 %inc, i64* %i, align 8, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !223
  store i8 0, i8* %arrayidx10, align 1, !dbg !224
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !225
  call void @printLine(i8* %arraydecay11), !dbg !226
  ret void, !dbg !227
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 10, scope: !16)
!33 = !DILocation(line: 34, column: 5, scope: !16)
!34 = !DILocation(line: 35, column: 5, scope: !16)
!35 = !DILocation(line: 35, column: 25, scope: !16)
!36 = !DILocation(line: 36, column: 5, scope: !16)
!37 = !DILocation(line: 37, column: 5, scope: !16)
!38 = !DILocation(line: 37, column: 27, scope: !16)
!39 = !DILocation(line: 38, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 8)
!41 = !DILocation(line: 38, column: 18, scope: !40)
!42 = !DILocation(line: 38, column: 8, scope: !16)
!43 = !DILocation(line: 41, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !8, line: 39, column: 5)
!45 = !DILocation(line: 41, column: 14, scope: !44)
!46 = !DILocation(line: 42, column: 5, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !8, line: 44, type: !49)
!48 = distinct !DILexicalBlock(scope: !16, file: !8, line: 43, column: 5)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 44, column: 16, scope: !48)
!53 = !DILocalVariable(name: "destLen", scope: !48, file: !8, line: 44, type: !49)
!54 = !DILocation(line: 44, column: 19, scope: !48)
!55 = !DILocalVariable(name: "dest", scope: !48, file: !8, line: 45, type: !29)
!56 = !DILocation(line: 45, column: 14, scope: !48)
!57 = !DILocation(line: 46, column: 9, scope: !48)
!58 = !DILocation(line: 47, column: 9, scope: !48)
!59 = !DILocation(line: 47, column: 21, scope: !48)
!60 = !DILocation(line: 48, column: 26, scope: !48)
!61 = !DILocation(line: 48, column: 19, scope: !48)
!62 = !DILocation(line: 48, column: 17, scope: !48)
!63 = !DILocation(line: 51, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !48, file: !8, line: 51, column: 9)
!65 = !DILocation(line: 51, column: 14, scope: !64)
!66 = !DILocation(line: 51, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !8, line: 51, column: 9)
!68 = !DILocation(line: 51, column: 25, scope: !67)
!69 = !DILocation(line: 51, column: 23, scope: !67)
!70 = !DILocation(line: 51, column: 9, scope: !64)
!71 = !DILocation(line: 53, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !8, line: 52, column: 9)
!73 = !DILocation(line: 53, column: 28, scope: !72)
!74 = !DILocation(line: 53, column: 18, scope: !72)
!75 = !DILocation(line: 53, column: 13, scope: !72)
!76 = !DILocation(line: 53, column: 21, scope: !72)
!77 = !DILocation(line: 54, column: 9, scope: !72)
!78 = !DILocation(line: 51, column: 35, scope: !67)
!79 = !DILocation(line: 51, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 54, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 55, column: 9, scope: !48)
!84 = !DILocation(line: 55, column: 21, scope: !48)
!85 = !DILocation(line: 56, column: 19, scope: !48)
!86 = !DILocation(line: 56, column: 9, scope: !48)
!87 = !DILocation(line: 58, column: 1, scope: !16)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_07_good", scope: !8, file: !8, line: 133, type: !17, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocation(line: 135, column: 5, scope: !88)
!90 = !DILocation(line: 136, column: 5, scope: !88)
!91 = !DILocation(line: 137, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 149, type: !93, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DISubroutineType(types: !94)
!94 = !{!9, !9, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !8, line: 149, type: !9)
!97 = !DILocation(line: 149, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !8, line: 149, type: !95)
!99 = !DILocation(line: 149, column: 27, scope: !92)
!100 = !DILocation(line: 152, column: 22, scope: !92)
!101 = !DILocation(line: 152, column: 12, scope: !92)
!102 = !DILocation(line: 152, column: 5, scope: !92)
!103 = !DILocation(line: 154, column: 5, scope: !92)
!104 = !DILocation(line: 155, column: 5, scope: !92)
!105 = !DILocation(line: 156, column: 5, scope: !92)
!106 = !DILocation(line: 159, column: 5, scope: !92)
!107 = !DILocation(line: 160, column: 5, scope: !92)
!108 = !DILocation(line: 161, column: 5, scope: !92)
!109 = !DILocation(line: 163, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !8, line: 67, type: !20)
!112 = !DILocation(line: 67, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !8, line: 68, type: !24)
!114 = !DILocation(line: 68, column: 10, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !8, line: 69, type: !29)
!116 = !DILocation(line: 69, column: 10, scope: !110)
!117 = !DILocation(line: 70, column: 5, scope: !110)
!118 = !DILocation(line: 71, column: 5, scope: !110)
!119 = !DILocation(line: 71, column: 25, scope: !110)
!120 = !DILocation(line: 72, column: 5, scope: !110)
!121 = !DILocation(line: 73, column: 5, scope: !110)
!122 = !DILocation(line: 73, column: 27, scope: !110)
!123 = !DILocation(line: 74, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !110, file: !8, line: 74, column: 8)
!125 = !DILocation(line: 74, column: 18, scope: !124)
!126 = !DILocation(line: 74, column: 8, scope: !110)
!127 = !DILocation(line: 77, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !8, line: 75, column: 5)
!129 = !DILocation(line: 78, column: 5, scope: !128)
!130 = !DILocation(line: 82, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !8, line: 80, column: 5)
!132 = !DILocation(line: 82, column: 14, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !8, line: 85, type: !49)
!134 = distinct !DILexicalBlock(scope: !110, file: !8, line: 84, column: 5)
!135 = !DILocation(line: 85, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !8, line: 85, type: !49)
!137 = !DILocation(line: 85, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !8, line: 86, type: !29)
!139 = !DILocation(line: 86, column: 14, scope: !134)
!140 = !DILocation(line: 87, column: 9, scope: !134)
!141 = !DILocation(line: 88, column: 9, scope: !134)
!142 = !DILocation(line: 88, column: 21, scope: !134)
!143 = !DILocation(line: 89, column: 26, scope: !134)
!144 = !DILocation(line: 89, column: 19, scope: !134)
!145 = !DILocation(line: 89, column: 17, scope: !134)
!146 = !DILocation(line: 92, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !8, line: 92, column: 9)
!148 = !DILocation(line: 92, column: 14, scope: !147)
!149 = !DILocation(line: 92, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !8, line: 92, column: 9)
!151 = !DILocation(line: 92, column: 25, scope: !150)
!152 = !DILocation(line: 92, column: 23, scope: !150)
!153 = !DILocation(line: 92, column: 9, scope: !147)
!154 = !DILocation(line: 94, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !8, line: 93, column: 9)
!156 = !DILocation(line: 94, column: 28, scope: !155)
!157 = !DILocation(line: 94, column: 18, scope: !155)
!158 = !DILocation(line: 94, column: 13, scope: !155)
!159 = !DILocation(line: 94, column: 21, scope: !155)
!160 = !DILocation(line: 95, column: 9, scope: !155)
!161 = !DILocation(line: 92, column: 35, scope: !150)
!162 = !DILocation(line: 92, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !82}
!164 = !DILocation(line: 95, column: 9, scope: !147)
!165 = !DILocation(line: 96, column: 9, scope: !134)
!166 = !DILocation(line: 96, column: 21, scope: !134)
!167 = !DILocation(line: 97, column: 19, scope: !134)
!168 = !DILocation(line: 97, column: 9, scope: !134)
!169 = !DILocation(line: 99, column: 1, scope: !110)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "data", scope: !170, file: !8, line: 104, type: !20)
!172 = !DILocation(line: 104, column: 12, scope: !170)
!173 = !DILocalVariable(name: "dataBadBuffer", scope: !170, file: !8, line: 105, type: !24)
!174 = !DILocation(line: 105, column: 10, scope: !170)
!175 = !DILocalVariable(name: "dataGoodBuffer", scope: !170, file: !8, line: 106, type: !29)
!176 = !DILocation(line: 106, column: 10, scope: !170)
!177 = !DILocation(line: 107, column: 5, scope: !170)
!178 = !DILocation(line: 108, column: 5, scope: !170)
!179 = !DILocation(line: 108, column: 25, scope: !170)
!180 = !DILocation(line: 109, column: 5, scope: !170)
!181 = !DILocation(line: 110, column: 5, scope: !170)
!182 = !DILocation(line: 110, column: 27, scope: !170)
!183 = !DILocation(line: 111, column: 8, scope: !184)
!184 = distinct !DILexicalBlock(scope: !170, file: !8, line: 111, column: 8)
!185 = !DILocation(line: 111, column: 18, scope: !184)
!186 = !DILocation(line: 111, column: 8, scope: !170)
!187 = !DILocation(line: 114, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !8, line: 112, column: 5)
!189 = !DILocation(line: 114, column: 14, scope: !188)
!190 = !DILocation(line: 115, column: 5, scope: !188)
!191 = !DILocalVariable(name: "i", scope: !192, file: !8, line: 117, type: !49)
!192 = distinct !DILexicalBlock(scope: !170, file: !8, line: 116, column: 5)
!193 = !DILocation(line: 117, column: 16, scope: !192)
!194 = !DILocalVariable(name: "destLen", scope: !192, file: !8, line: 117, type: !49)
!195 = !DILocation(line: 117, column: 19, scope: !192)
!196 = !DILocalVariable(name: "dest", scope: !192, file: !8, line: 118, type: !29)
!197 = !DILocation(line: 118, column: 14, scope: !192)
!198 = !DILocation(line: 119, column: 9, scope: !192)
!199 = !DILocation(line: 120, column: 9, scope: !192)
!200 = !DILocation(line: 120, column: 21, scope: !192)
!201 = !DILocation(line: 121, column: 26, scope: !192)
!202 = !DILocation(line: 121, column: 19, scope: !192)
!203 = !DILocation(line: 121, column: 17, scope: !192)
!204 = !DILocation(line: 124, column: 16, scope: !205)
!205 = distinct !DILexicalBlock(scope: !192, file: !8, line: 124, column: 9)
!206 = !DILocation(line: 124, column: 14, scope: !205)
!207 = !DILocation(line: 124, column: 21, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !8, line: 124, column: 9)
!209 = !DILocation(line: 124, column: 25, scope: !208)
!210 = !DILocation(line: 124, column: 23, scope: !208)
!211 = !DILocation(line: 124, column: 9, scope: !205)
!212 = !DILocation(line: 126, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !208, file: !8, line: 125, column: 9)
!214 = !DILocation(line: 126, column: 28, scope: !213)
!215 = !DILocation(line: 126, column: 18, scope: !213)
!216 = !DILocation(line: 126, column: 13, scope: !213)
!217 = !DILocation(line: 126, column: 21, scope: !213)
!218 = !DILocation(line: 127, column: 9, scope: !213)
!219 = !DILocation(line: 124, column: 35, scope: !208)
!220 = !DILocation(line: 124, column: 9, scope: !208)
!221 = distinct !{!221, !211, !222, !82}
!222 = !DILocation(line: 127, column: 9, scope: !205)
!223 = !DILocation(line: 128, column: 9, scope: !192)
!224 = !DILocation(line: 128, column: 21, scope: !192)
!225 = !DILocation(line: 129, column: 19, scope: !192)
!226 = !DILocation(line: 129, column: 9, scope: !192)
!227 = !DILocation(line: 131, column: 1, scope: !170)
