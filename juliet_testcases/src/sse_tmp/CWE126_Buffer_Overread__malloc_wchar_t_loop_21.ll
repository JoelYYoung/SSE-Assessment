; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_21.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !51
  store i64 %call3, i64* %destLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !56
  %2 = load i64, i64* %destLen, align 8, !dbg !58
  %cmp = icmp ult i64 %1, %2, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !61
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !61
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !61
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !65
  store i32 %5, i32* %arrayidx5, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %7, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !73
  store i32 0, i32* %arrayidx6, align 4, !dbg !74
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  call void @printWLine(i32* %arraydecay7), !dbg !76
  %8 = load i32*, i32** %data, align 8, !dbg !77
  %9 = bitcast i32* %8 to i8*, !dbg !77
  call void @free(i8* %9) #6, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !80 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i32, i32* @badStatic, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.end3, !dbg !87

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !88
  %1 = bitcast i8* %call to i32*, !dbg !90
  store i32* %1, i32** %data.addr, align 8, !dbg !91
  %2 = load i32*, i32** %data.addr, align 8, !dbg !92
  %cmp = icmp eq i32* %2, null, !dbg !94
  br i1 %cmp, label %if.then1, label %if.end, !dbg !95

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !98
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !99
  %4 = load i32*, i32** %data.addr, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  br label %if.end3, !dbg !102

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data.addr, align 8, !dbg !103
  ret i32* %5, !dbg !104
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_21_good() #0 !dbg !105 {
entry:
  call void @goodG2B1(), !dbg !106
  call void @goodG2B2(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* null) #6, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #6, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_21_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_21_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32* null, i32** %data, align 8, !dbg !132
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !133
  %0 = load i32*, i32** %data, align 8, !dbg !134
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !135
  store i32* %call, i32** %data, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !145
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !149
  store i64 %call3, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !154
  %2 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp = icmp ult i64 %1, %2, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !159
  %4 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !159
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !159
  %6 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !163
  store i32 %5, i32* %arrayidx5, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %7, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx6, align 4, !dbg !171
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  call void @printWLine(i32* %arraydecay7), !dbg !173
  %8 = load i32*, i32** %data, align 8, !dbg !174
  %9 = bitcast i32* %8 to i8*, !dbg !174
  call void @free(i8* %9) #6, !dbg !175
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !177 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !178, metadata !DIExpression()), !dbg !179
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !180
  %tobool = icmp ne i32 %0, 0, !dbg !180
  br i1 %tobool, label %if.then, label %if.else, !dbg !182

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !183
  br label %if.end3, !dbg !185

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !186
  %1 = bitcast i8* %call to i32*, !dbg !188
  store i32* %1, i32** %data.addr, align 8, !dbg !189
  %2 = load i32*, i32** %data.addr, align 8, !dbg !190
  %cmp = icmp eq i32* %2, null, !dbg !192
  br i1 %cmp, label %if.then1, label %if.end, !dbg !193

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !194
  unreachable, !dbg !194

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !196
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !197
  %4 = load i32*, i32** %data.addr, align 8, !dbg !198
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !198
  store i32 0, i32* %arrayidx, align 4, !dbg !199
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data.addr, align 8, !dbg !200
  ret i32* %5, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !202 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !203, metadata !DIExpression()), !dbg !204
  store i32* null, i32** %data, align 8, !dbg !205
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !206
  %0 = load i32*, i32** %data, align 8, !dbg !207
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !208
  store i32* %call, i32** %data, align 8, !dbg !209
  call void @llvm.dbg.declare(metadata i64* %i, metadata !210, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !215, metadata !DIExpression()), !dbg !216
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !217
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !218
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !219
  store i32 0, i32* %arrayidx, align 4, !dbg !220
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !221
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !222
  store i64 %call3, i64* %destLen, align 8, !dbg !223
  store i64 0, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !227
  %2 = load i64, i64* %destLen, align 8, !dbg !229
  %cmp = icmp ult i64 %1, %2, !dbg !230
  br i1 %cmp, label %for.body, label %for.end, !dbg !231

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !232
  %4 = load i64, i64* %i, align 8, !dbg !234
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !232
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !232
  %6 = load i64, i64* %i, align 8, !dbg !235
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !236
  store i32 %5, i32* %arrayidx5, align 4, !dbg !237
  br label %for.inc, !dbg !238

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !239
  %inc = add i64 %7, 1, !dbg !239
  store i64 %inc, i64* %i, align 8, !dbg !239
  br label %for.cond, !dbg !240, !llvm.loop !241

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !243
  store i32 0, i32* %arrayidx6, align 4, !dbg !244
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !245
  call void @printWLine(i32* %arraydecay7), !dbg !246
  %8 = load i32*, i32** %data, align 8, !dbg !247
  %9 = bitcast i32* %8 to i8*, !dbg !247
  call void @free(i8* %9) #6, !dbg !248
  ret void, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !250 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !251, metadata !DIExpression()), !dbg !252
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !253
  %tobool = icmp ne i32 %0, 0, !dbg !253
  br i1 %tobool, label %if.then, label %if.end3, !dbg !255

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !256
  %1 = bitcast i8* %call to i32*, !dbg !258
  store i32* %1, i32** %data.addr, align 8, !dbg !259
  %2 = load i32*, i32** %data.addr, align 8, !dbg !260
  %cmp = icmp eq i32* %2, null, !dbg !262
  br i1 %cmp, label %if.then1, label %if.end, !dbg !263

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !264
  unreachable, !dbg !264

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !266
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !267
  %4 = load i32*, i32** %data.addr, align 8, !dbg !268
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !268
  store i32 0, i32* %arrayidx, align 4, !dbg !269
  br label %if.end3, !dbg !270

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data.addr, align 8, !dbg !271
  ret i32* %5, !dbg !272
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 68, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 69, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_21_bad", scope: !15, file: !15, line: 39, type: !25, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 41, type: !7)
!28 = !DILocation(line: 41, column: 15, scope: !24)
!29 = !DILocation(line: 42, column: 10, scope: !24)
!30 = !DILocation(line: 43, column: 15, scope: !24)
!31 = !DILocation(line: 44, column: 22, scope: !24)
!32 = !DILocation(line: 44, column: 12, scope: !24)
!33 = !DILocation(line: 44, column: 10, scope: !24)
!34 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 46, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 45, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !37)
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 46, column: 16, scope: !35)
!39 = !DILocalVariable(name: "destLen", scope: !35, file: !15, line: 46, type: !36)
!40 = !DILocation(line: 46, column: 19, scope: !35)
!41 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 47, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 47, column: 17, scope: !35)
!46 = !DILocation(line: 48, column: 17, scope: !35)
!47 = !DILocation(line: 48, column: 9, scope: !35)
!48 = !DILocation(line: 49, column: 9, scope: !35)
!49 = !DILocation(line: 49, column: 21, scope: !35)
!50 = !DILocation(line: 50, column: 26, scope: !35)
!51 = !DILocation(line: 50, column: 19, scope: !35)
!52 = !DILocation(line: 50, column: 17, scope: !35)
!53 = !DILocation(line: 53, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !35, file: !15, line: 53, column: 9)
!55 = !DILocation(line: 53, column: 14, scope: !54)
!56 = !DILocation(line: 53, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !15, line: 53, column: 9)
!58 = !DILocation(line: 53, column: 25, scope: !57)
!59 = !DILocation(line: 53, column: 23, scope: !57)
!60 = !DILocation(line: 53, column: 9, scope: !54)
!61 = !DILocation(line: 55, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !15, line: 54, column: 9)
!63 = !DILocation(line: 55, column: 28, scope: !62)
!64 = !DILocation(line: 55, column: 18, scope: !62)
!65 = !DILocation(line: 55, column: 13, scope: !62)
!66 = !DILocation(line: 55, column: 21, scope: !62)
!67 = !DILocation(line: 56, column: 9, scope: !62)
!68 = !DILocation(line: 53, column: 35, scope: !57)
!69 = !DILocation(line: 53, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 56, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 57, column: 9, scope: !35)
!74 = !DILocation(line: 57, column: 21, scope: !35)
!75 = !DILocation(line: 58, column: 20, scope: !35)
!76 = !DILocation(line: 58, column: 9, scope: !35)
!77 = !DILocation(line: 59, column: 14, scope: !35)
!78 = !DILocation(line: 59, column: 9, scope: !35)
!79 = !DILocation(line: 61, column: 1, scope: !24)
!80 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !81, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7}
!83 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !15, line: 26, type: !7)
!84 = !DILocation(line: 26, column: 38, scope: !80)
!85 = !DILocation(line: 28, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !15, line: 28, column: 8)
!87 = !DILocation(line: 28, column: 8, scope: !80)
!88 = !DILocation(line: 31, column: 27, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !15, line: 29, column: 5)
!90 = !DILocation(line: 31, column: 16, scope: !89)
!91 = !DILocation(line: 31, column: 14, scope: !89)
!92 = !DILocation(line: 32, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 32, column: 13)
!94 = !DILocation(line: 32, column: 18, scope: !93)
!95 = !DILocation(line: 32, column: 13, scope: !89)
!96 = !DILocation(line: 32, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 32, column: 27)
!98 = !DILocation(line: 33, column: 17, scope: !89)
!99 = !DILocation(line: 33, column: 9, scope: !89)
!100 = !DILocation(line: 34, column: 9, scope: !89)
!101 = !DILocation(line: 34, column: 20, scope: !89)
!102 = !DILocation(line: 35, column: 5, scope: !89)
!103 = !DILocation(line: 36, column: 12, scope: !80)
!104 = !DILocation(line: 36, column: 5, scope: !80)
!105 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_21_good", scope: !15, file: !15, line: 152, type: !25, scopeLine: 153, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocation(line: 154, column: 5, scope: !105)
!107 = !DILocation(line: 155, column: 5, scope: !105)
!108 = !DILocation(line: 156, column: 1, scope: !105)
!109 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 168, type: !110, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DISubroutineType(types: !111)
!111 = !{!10, !10, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !15, line: 168, type: !10)
!116 = !DILocation(line: 168, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !15, line: 168, type: !112)
!118 = !DILocation(line: 168, column: 27, scope: !109)
!119 = !DILocation(line: 171, column: 22, scope: !109)
!120 = !DILocation(line: 171, column: 12, scope: !109)
!121 = !DILocation(line: 171, column: 5, scope: !109)
!122 = !DILocation(line: 173, column: 5, scope: !109)
!123 = !DILocation(line: 174, column: 5, scope: !109)
!124 = !DILocation(line: 175, column: 5, scope: !109)
!125 = !DILocation(line: 178, column: 5, scope: !109)
!126 = !DILocation(line: 179, column: 5, scope: !109)
!127 = !DILocation(line: 180, column: 5, scope: !109)
!128 = !DILocation(line: 182, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 90, type: !25, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !15, line: 92, type: !7)
!131 = !DILocation(line: 92, column: 15, scope: !129)
!132 = !DILocation(line: 93, column: 10, scope: !129)
!133 = !DILocation(line: 94, column: 20, scope: !129)
!134 = !DILocation(line: 95, column: 27, scope: !129)
!135 = !DILocation(line: 95, column: 12, scope: !129)
!136 = !DILocation(line: 95, column: 10, scope: !129)
!137 = !DILocalVariable(name: "i", scope: !138, file: !15, line: 97, type: !36)
!138 = distinct !DILexicalBlock(scope: !129, file: !15, line: 96, column: 5)
!139 = !DILocation(line: 97, column: 16, scope: !138)
!140 = !DILocalVariable(name: "destLen", scope: !138, file: !15, line: 97, type: !36)
!141 = !DILocation(line: 97, column: 19, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !138, file: !15, line: 98, type: !42)
!143 = !DILocation(line: 98, column: 17, scope: !138)
!144 = !DILocation(line: 99, column: 17, scope: !138)
!145 = !DILocation(line: 99, column: 9, scope: !138)
!146 = !DILocation(line: 100, column: 9, scope: !138)
!147 = !DILocation(line: 100, column: 21, scope: !138)
!148 = !DILocation(line: 101, column: 26, scope: !138)
!149 = !DILocation(line: 101, column: 19, scope: !138)
!150 = !DILocation(line: 101, column: 17, scope: !138)
!151 = !DILocation(line: 104, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !138, file: !15, line: 104, column: 9)
!153 = !DILocation(line: 104, column: 14, scope: !152)
!154 = !DILocation(line: 104, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !15, line: 104, column: 9)
!156 = !DILocation(line: 104, column: 25, scope: !155)
!157 = !DILocation(line: 104, column: 23, scope: !155)
!158 = !DILocation(line: 104, column: 9, scope: !152)
!159 = !DILocation(line: 106, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !15, line: 105, column: 9)
!161 = !DILocation(line: 106, column: 28, scope: !160)
!162 = !DILocation(line: 106, column: 18, scope: !160)
!163 = !DILocation(line: 106, column: 13, scope: !160)
!164 = !DILocation(line: 106, column: 21, scope: !160)
!165 = !DILocation(line: 107, column: 9, scope: !160)
!166 = !DILocation(line: 104, column: 35, scope: !155)
!167 = !DILocation(line: 104, column: 9, scope: !155)
!168 = distinct !{!168, !158, !169, !72}
!169 = !DILocation(line: 107, column: 9, scope: !152)
!170 = !DILocation(line: 108, column: 9, scope: !138)
!171 = !DILocation(line: 108, column: 21, scope: !138)
!172 = !DILocation(line: 109, column: 20, scope: !138)
!173 = !DILocation(line: 109, column: 9, scope: !138)
!174 = !DILocation(line: 110, column: 14, scope: !138)
!175 = !DILocation(line: 110, column: 9, scope: !138)
!176 = !DILocation(line: 112, column: 1, scope: !129)
!177 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 72, type: !81, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!178 = !DILocalVariable(name: "data", arg: 1, scope: !177, file: !15, line: 72, type: !7)
!179 = !DILocation(line: 72, column: 43, scope: !177)
!180 = !DILocation(line: 74, column: 8, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !15, line: 74, column: 8)
!182 = !DILocation(line: 74, column: 8, scope: !177)
!183 = !DILocation(line: 77, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 75, column: 5)
!185 = !DILocation(line: 78, column: 5, scope: !184)
!186 = !DILocation(line: 82, column: 27, scope: !187)
!187 = distinct !DILexicalBlock(scope: !181, file: !15, line: 80, column: 5)
!188 = !DILocation(line: 82, column: 16, scope: !187)
!189 = !DILocation(line: 82, column: 14, scope: !187)
!190 = !DILocation(line: 83, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !15, line: 83, column: 13)
!192 = !DILocation(line: 83, column: 18, scope: !191)
!193 = !DILocation(line: 83, column: 13, scope: !187)
!194 = !DILocation(line: 83, column: 28, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !15, line: 83, column: 27)
!196 = !DILocation(line: 84, column: 17, scope: !187)
!197 = !DILocation(line: 84, column: 9, scope: !187)
!198 = !DILocation(line: 85, column: 9, scope: !187)
!199 = !DILocation(line: 85, column: 21, scope: !187)
!200 = !DILocation(line: 87, column: 12, scope: !177)
!201 = !DILocation(line: 87, column: 5, scope: !177)
!202 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 128, type: !25, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocalVariable(name: "data", scope: !202, file: !15, line: 130, type: !7)
!204 = !DILocation(line: 130, column: 15, scope: !202)
!205 = !DILocation(line: 131, column: 10, scope: !202)
!206 = !DILocation(line: 132, column: 20, scope: !202)
!207 = !DILocation(line: 133, column: 27, scope: !202)
!208 = !DILocation(line: 133, column: 12, scope: !202)
!209 = !DILocation(line: 133, column: 10, scope: !202)
!210 = !DILocalVariable(name: "i", scope: !211, file: !15, line: 135, type: !36)
!211 = distinct !DILexicalBlock(scope: !202, file: !15, line: 134, column: 5)
!212 = !DILocation(line: 135, column: 16, scope: !211)
!213 = !DILocalVariable(name: "destLen", scope: !211, file: !15, line: 135, type: !36)
!214 = !DILocation(line: 135, column: 19, scope: !211)
!215 = !DILocalVariable(name: "dest", scope: !211, file: !15, line: 136, type: !42)
!216 = !DILocation(line: 136, column: 17, scope: !211)
!217 = !DILocation(line: 137, column: 17, scope: !211)
!218 = !DILocation(line: 137, column: 9, scope: !211)
!219 = !DILocation(line: 138, column: 9, scope: !211)
!220 = !DILocation(line: 138, column: 21, scope: !211)
!221 = !DILocation(line: 139, column: 26, scope: !211)
!222 = !DILocation(line: 139, column: 19, scope: !211)
!223 = !DILocation(line: 139, column: 17, scope: !211)
!224 = !DILocation(line: 142, column: 16, scope: !225)
!225 = distinct !DILexicalBlock(scope: !211, file: !15, line: 142, column: 9)
!226 = !DILocation(line: 142, column: 14, scope: !225)
!227 = !DILocation(line: 142, column: 21, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !15, line: 142, column: 9)
!229 = !DILocation(line: 142, column: 25, scope: !228)
!230 = !DILocation(line: 142, column: 23, scope: !228)
!231 = !DILocation(line: 142, column: 9, scope: !225)
!232 = !DILocation(line: 144, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !15, line: 143, column: 9)
!234 = !DILocation(line: 144, column: 28, scope: !233)
!235 = !DILocation(line: 144, column: 18, scope: !233)
!236 = !DILocation(line: 144, column: 13, scope: !233)
!237 = !DILocation(line: 144, column: 21, scope: !233)
!238 = !DILocation(line: 145, column: 9, scope: !233)
!239 = !DILocation(line: 142, column: 35, scope: !228)
!240 = !DILocation(line: 142, column: 9, scope: !228)
!241 = distinct !{!241, !231, !242, !72}
!242 = !DILocation(line: 145, column: 9, scope: !225)
!243 = !DILocation(line: 146, column: 9, scope: !211)
!244 = !DILocation(line: 146, column: 21, scope: !211)
!245 = !DILocation(line: 147, column: 20, scope: !211)
!246 = !DILocation(line: 147, column: 9, scope: !211)
!247 = !DILocation(line: 148, column: 14, scope: !211)
!248 = !DILocation(line: 148, column: 9, scope: !211)
!249 = !DILocation(line: 150, column: 1, scope: !202)
!250 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 115, type: !81, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!251 = !DILocalVariable(name: "data", arg: 1, scope: !250, file: !15, line: 115, type: !7)
!252 = !DILocation(line: 115, column: 43, scope: !250)
!253 = !DILocation(line: 117, column: 8, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !15, line: 117, column: 8)
!255 = !DILocation(line: 117, column: 8, scope: !250)
!256 = !DILocation(line: 120, column: 27, scope: !257)
!257 = distinct !DILexicalBlock(scope: !254, file: !15, line: 118, column: 5)
!258 = !DILocation(line: 120, column: 16, scope: !257)
!259 = !DILocation(line: 120, column: 14, scope: !257)
!260 = !DILocation(line: 121, column: 13, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !15, line: 121, column: 13)
!262 = !DILocation(line: 121, column: 18, scope: !261)
!263 = !DILocation(line: 121, column: 13, scope: !257)
!264 = !DILocation(line: 121, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !15, line: 121, column: 27)
!266 = !DILocation(line: 122, column: 17, scope: !257)
!267 = !DILocation(line: 122, column: 9, scope: !257)
!268 = !DILocation(line: 123, column: 9, scope: !257)
!269 = !DILocation(line: 123, column: 21, scope: !257)
!270 = !DILocation(line: 124, column: 5, scope: !257)
!271 = !DILocation(line: 125, column: 12, scope: !250)
!272 = !DILocation(line: 125, column: 5, scope: !250)
