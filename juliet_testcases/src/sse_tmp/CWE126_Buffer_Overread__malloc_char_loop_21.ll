; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_21.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !50
  store i64 %call2, i64* %destLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !55
  %2 = load i64, i64* %destLen, align 8, !dbg !57
  %cmp = icmp ult i64 %1, %2, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !60
  %4 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !60
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !64
  store i8 %5, i8* %arrayidx4, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %7, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx5, align 1, !dbg !73
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !74
  call void @printLine(i8* %arraydecay6), !dbg !75
  %8 = load i8*, i8** %data, align 8, !dbg !76
  call void @free(i8* %8) #8, !dbg !77
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
  br i1 %tobool, label %if.then, label %if.end2, !dbg !86

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !87
  store i8* %call, i8** %data.addr, align 8, !dbg !89
  %1 = load i8*, i8** %data.addr, align 8, !dbg !90
  %cmp = icmp eq i8* %1, null, !dbg !92
  br i1 %cmp, label %if.then1, label %if.end, !dbg !93

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !97
  %3 = load i8*, i8** %data.addr, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %if.end2, !dbg !100

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data.addr, align 8, !dbg !101
  ret i8* %4, !dbg !102
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_21_good() #0 !dbg !103 {
entry:
  call void @goodG2B1(), !dbg !104
  call void @goodG2B2(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !107 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i64 @time(i64* null) #8, !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 %conv) #8, !dbg !117
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !118
  call void @CWE126_Buffer_Overread__malloc_char_loop_21_good(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @CWE126_Buffer_Overread__malloc_char_loop_21_bad(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !125 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i8* null, i8** %data, align 8, !dbg !128
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !129
  %0 = load i8*, i8** %data, align 8, !dbg !130
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !131
  store i8* %call, i8** %data, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !144
  store i64 %call2, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !149
  %2 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp = icmp ult i64 %1, %2, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !154
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !154
  %6 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !158
  store i8 %5, i8* %arrayidx4, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %7, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx5, align 1, !dbg !166
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay6), !dbg !168
  %8 = load i8*, i8** %data, align 8, !dbg !169
  call void @free(i8* %8) #8, !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !172 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !175
  %tobool = icmp ne i32 %0, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.else, !dbg !177

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !178
  br label %if.end2, !dbg !180

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !181
  store i8* %call, i8** %data.addr, align 8, !dbg !183
  %1 = load i8*, i8** %data.addr, align 8, !dbg !184
  %cmp = icmp eq i8* %1, null, !dbg !186
  br i1 %cmp, label %if.then1, label %if.end, !dbg !187

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !188
  unreachable, !dbg !188

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !191
  %3 = load i8*, i8** %data.addr, align 8, !dbg !192
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !192
  store i8 0, i8* %arrayidx, align 1, !dbg !193
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i8*, i8** %data.addr, align 8, !dbg !194
  ret i8* %4, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !196 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !197, metadata !DIExpression()), !dbg !198
  store i8* null, i8** %data, align 8, !dbg !199
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !200
  %0 = load i8*, i8** %data, align 8, !dbg !201
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !202
  store i8* %call, i8** %data, align 8, !dbg !203
  call void @llvm.dbg.declare(metadata i64* %i, metadata !204, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !209, metadata !DIExpression()), !dbg !210
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !211
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !211
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !212
  store i8 0, i8* %arrayidx, align 1, !dbg !213
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !214
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !215
  store i64 %call2, i64* %destLen, align 8, !dbg !216
  store i64 0, i64* %i, align 8, !dbg !217
  br label %for.cond, !dbg !219

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !220
  %2 = load i64, i64* %destLen, align 8, !dbg !222
  %cmp = icmp ult i64 %1, %2, !dbg !223
  br i1 %cmp, label %for.body, label %for.end, !dbg !224

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !225
  %4 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !225
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !225
  %6 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !229
  store i8 %5, i8* %arrayidx4, align 1, !dbg !230
  br label %for.inc, !dbg !231

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !232
  %inc = add i64 %7, 1, !dbg !232
  store i64 %inc, i64* %i, align 8, !dbg !232
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !236
  store i8 0, i8* %arrayidx5, align 1, !dbg !237
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !238
  call void @printLine(i8* %arraydecay6), !dbg !239
  %8 = load i8*, i8** %data, align 8, !dbg !240
  call void @free(i8* %8) #8, !dbg !241
  ret void, !dbg !242
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !243 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !244, metadata !DIExpression()), !dbg !245
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !246
  %tobool = icmp ne i32 %0, 0, !dbg !246
  br i1 %tobool, label %if.then, label %if.end2, !dbg !248

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !249
  store i8* %call, i8** %data.addr, align 8, !dbg !251
  %1 = load i8*, i8** %data.addr, align 8, !dbg !252
  %cmp = icmp eq i8* %1, null, !dbg !254
  br i1 %cmp, label %if.then1, label %if.end, !dbg !255

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !256
  unreachable, !dbg !256

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !258
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !259
  %3 = load i8*, i8** %data.addr, align 8, !dbg !260
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !260
  store i8 0, i8* %arrayidx, align 1, !dbg !261
  br label %if.end2, !dbg !262

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data.addr, align 8, !dbg !263
  ret i8* %4, !dbg !264
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 68, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 69, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_21_bad", scope: !13, file: !13, line: 39, type: !24, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 41, type: !7)
!27 = !DILocation(line: 41, column: 12, scope: !23)
!28 = !DILocation(line: 42, column: 10, scope: !23)
!29 = !DILocation(line: 43, column: 15, scope: !23)
!30 = !DILocation(line: 44, column: 22, scope: !23)
!31 = !DILocation(line: 44, column: 12, scope: !23)
!32 = !DILocation(line: 44, column: 10, scope: !23)
!33 = !DILocalVariable(name: "i", scope: !34, file: !13, line: 46, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 45, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 46, column: 16, scope: !34)
!39 = !DILocalVariable(name: "destLen", scope: !34, file: !13, line: 46, type: !35)
!40 = !DILocation(line: 46, column: 19, scope: !34)
!41 = !DILocalVariable(name: "dest", scope: !34, file: !13, line: 47, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 47, column: 14, scope: !34)
!46 = !DILocation(line: 48, column: 9, scope: !34)
!47 = !DILocation(line: 49, column: 9, scope: !34)
!48 = !DILocation(line: 49, column: 21, scope: !34)
!49 = !DILocation(line: 50, column: 26, scope: !34)
!50 = !DILocation(line: 50, column: 19, scope: !34)
!51 = !DILocation(line: 50, column: 17, scope: !34)
!52 = !DILocation(line: 53, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !34, file: !13, line: 53, column: 9)
!54 = !DILocation(line: 53, column: 14, scope: !53)
!55 = !DILocation(line: 53, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !13, line: 53, column: 9)
!57 = !DILocation(line: 53, column: 25, scope: !56)
!58 = !DILocation(line: 53, column: 23, scope: !56)
!59 = !DILocation(line: 53, column: 9, scope: !53)
!60 = !DILocation(line: 55, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !13, line: 54, column: 9)
!62 = !DILocation(line: 55, column: 28, scope: !61)
!63 = !DILocation(line: 55, column: 18, scope: !61)
!64 = !DILocation(line: 55, column: 13, scope: !61)
!65 = !DILocation(line: 55, column: 21, scope: !61)
!66 = !DILocation(line: 56, column: 9, scope: !61)
!67 = !DILocation(line: 53, column: 35, scope: !56)
!68 = !DILocation(line: 53, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 56, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 57, column: 9, scope: !34)
!73 = !DILocation(line: 57, column: 21, scope: !34)
!74 = !DILocation(line: 58, column: 19, scope: !34)
!75 = !DILocation(line: 58, column: 9, scope: !34)
!76 = !DILocation(line: 59, column: 14, scope: !34)
!77 = !DILocation(line: 59, column: 9, scope: !34)
!78 = !DILocation(line: 61, column: 1, scope: !23)
!79 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !80, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7}
!82 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !13, line: 26, type: !7)
!83 = !DILocation(line: 26, column: 32, scope: !79)
!84 = !DILocation(line: 28, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !13, line: 28, column: 8)
!86 = !DILocation(line: 28, column: 8, scope: !79)
!87 = !DILocation(line: 31, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !13, line: 29, column: 5)
!89 = !DILocation(line: 31, column: 14, scope: !88)
!90 = !DILocation(line: 32, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !13, line: 32, column: 13)
!92 = !DILocation(line: 32, column: 18, scope: !91)
!93 = !DILocation(line: 32, column: 13, scope: !88)
!94 = !DILocation(line: 32, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !13, line: 32, column: 27)
!96 = !DILocation(line: 33, column: 16, scope: !88)
!97 = !DILocation(line: 33, column: 9, scope: !88)
!98 = !DILocation(line: 34, column: 9, scope: !88)
!99 = !DILocation(line: 34, column: 20, scope: !88)
!100 = !DILocation(line: 35, column: 5, scope: !88)
!101 = !DILocation(line: 36, column: 12, scope: !79)
!102 = !DILocation(line: 36, column: 5, scope: !79)
!103 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_21_good", scope: !13, file: !13, line: 152, type: !24, scopeLine: 153, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocation(line: 154, column: 5, scope: !103)
!105 = !DILocation(line: 155, column: 5, scope: !103)
!106 = !DILocation(line: 156, column: 1, scope: !103)
!107 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 168, type: !108, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DISubroutineType(types: !109)
!109 = !{!14, !14, !110}
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !107, file: !13, line: 168, type: !14)
!112 = !DILocation(line: 168, column: 14, scope: !107)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !107, file: !13, line: 168, type: !110)
!114 = !DILocation(line: 168, column: 27, scope: !107)
!115 = !DILocation(line: 171, column: 22, scope: !107)
!116 = !DILocation(line: 171, column: 12, scope: !107)
!117 = !DILocation(line: 171, column: 5, scope: !107)
!118 = !DILocation(line: 173, column: 5, scope: !107)
!119 = !DILocation(line: 174, column: 5, scope: !107)
!120 = !DILocation(line: 175, column: 5, scope: !107)
!121 = !DILocation(line: 178, column: 5, scope: !107)
!122 = !DILocation(line: 179, column: 5, scope: !107)
!123 = !DILocation(line: 180, column: 5, scope: !107)
!124 = !DILocation(line: 182, column: 5, scope: !107)
!125 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 90, type: !24, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !13, line: 92, type: !7)
!127 = !DILocation(line: 92, column: 12, scope: !125)
!128 = !DILocation(line: 93, column: 10, scope: !125)
!129 = !DILocation(line: 94, column: 20, scope: !125)
!130 = !DILocation(line: 95, column: 27, scope: !125)
!131 = !DILocation(line: 95, column: 12, scope: !125)
!132 = !DILocation(line: 95, column: 10, scope: !125)
!133 = !DILocalVariable(name: "i", scope: !134, file: !13, line: 97, type: !35)
!134 = distinct !DILexicalBlock(scope: !125, file: !13, line: 96, column: 5)
!135 = !DILocation(line: 97, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !13, line: 97, type: !35)
!137 = !DILocation(line: 97, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !13, line: 98, type: !42)
!139 = !DILocation(line: 98, column: 14, scope: !134)
!140 = !DILocation(line: 99, column: 9, scope: !134)
!141 = !DILocation(line: 100, column: 9, scope: !134)
!142 = !DILocation(line: 100, column: 21, scope: !134)
!143 = !DILocation(line: 101, column: 26, scope: !134)
!144 = !DILocation(line: 101, column: 19, scope: !134)
!145 = !DILocation(line: 101, column: 17, scope: !134)
!146 = !DILocation(line: 104, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !13, line: 104, column: 9)
!148 = !DILocation(line: 104, column: 14, scope: !147)
!149 = !DILocation(line: 104, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !13, line: 104, column: 9)
!151 = !DILocation(line: 104, column: 25, scope: !150)
!152 = !DILocation(line: 104, column: 23, scope: !150)
!153 = !DILocation(line: 104, column: 9, scope: !147)
!154 = !DILocation(line: 106, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !13, line: 105, column: 9)
!156 = !DILocation(line: 106, column: 28, scope: !155)
!157 = !DILocation(line: 106, column: 18, scope: !155)
!158 = !DILocation(line: 106, column: 13, scope: !155)
!159 = !DILocation(line: 106, column: 21, scope: !155)
!160 = !DILocation(line: 107, column: 9, scope: !155)
!161 = !DILocation(line: 104, column: 35, scope: !150)
!162 = !DILocation(line: 104, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !71}
!164 = !DILocation(line: 107, column: 9, scope: !147)
!165 = !DILocation(line: 108, column: 9, scope: !134)
!166 = !DILocation(line: 108, column: 21, scope: !134)
!167 = !DILocation(line: 109, column: 19, scope: !134)
!168 = !DILocation(line: 109, column: 9, scope: !134)
!169 = !DILocation(line: 110, column: 14, scope: !134)
!170 = !DILocation(line: 110, column: 9, scope: !134)
!171 = !DILocation(line: 112, column: 1, scope: !125)
!172 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 72, type: !80, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!173 = !DILocalVariable(name: "data", arg: 1, scope: !172, file: !13, line: 72, type: !7)
!174 = !DILocation(line: 72, column: 37, scope: !172)
!175 = !DILocation(line: 74, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 74, column: 8)
!177 = !DILocation(line: 74, column: 8, scope: !172)
!178 = !DILocation(line: 77, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !13, line: 75, column: 5)
!180 = !DILocation(line: 78, column: 5, scope: !179)
!181 = !DILocation(line: 82, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !13, line: 80, column: 5)
!183 = !DILocation(line: 82, column: 14, scope: !182)
!184 = !DILocation(line: 83, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !13, line: 83, column: 13)
!186 = !DILocation(line: 83, column: 18, scope: !185)
!187 = !DILocation(line: 83, column: 13, scope: !182)
!188 = !DILocation(line: 83, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !13, line: 83, column: 27)
!190 = !DILocation(line: 84, column: 16, scope: !182)
!191 = !DILocation(line: 84, column: 9, scope: !182)
!192 = !DILocation(line: 85, column: 9, scope: !182)
!193 = !DILocation(line: 85, column: 21, scope: !182)
!194 = !DILocation(line: 87, column: 12, scope: !172)
!195 = !DILocation(line: 87, column: 5, scope: !172)
!196 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 128, type: !24, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DILocalVariable(name: "data", scope: !196, file: !13, line: 130, type: !7)
!198 = !DILocation(line: 130, column: 12, scope: !196)
!199 = !DILocation(line: 131, column: 10, scope: !196)
!200 = !DILocation(line: 132, column: 20, scope: !196)
!201 = !DILocation(line: 133, column: 27, scope: !196)
!202 = !DILocation(line: 133, column: 12, scope: !196)
!203 = !DILocation(line: 133, column: 10, scope: !196)
!204 = !DILocalVariable(name: "i", scope: !205, file: !13, line: 135, type: !35)
!205 = distinct !DILexicalBlock(scope: !196, file: !13, line: 134, column: 5)
!206 = !DILocation(line: 135, column: 16, scope: !205)
!207 = !DILocalVariable(name: "destLen", scope: !205, file: !13, line: 135, type: !35)
!208 = !DILocation(line: 135, column: 19, scope: !205)
!209 = !DILocalVariable(name: "dest", scope: !205, file: !13, line: 136, type: !42)
!210 = !DILocation(line: 136, column: 14, scope: !205)
!211 = !DILocation(line: 137, column: 9, scope: !205)
!212 = !DILocation(line: 138, column: 9, scope: !205)
!213 = !DILocation(line: 138, column: 21, scope: !205)
!214 = !DILocation(line: 139, column: 26, scope: !205)
!215 = !DILocation(line: 139, column: 19, scope: !205)
!216 = !DILocation(line: 139, column: 17, scope: !205)
!217 = !DILocation(line: 142, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !205, file: !13, line: 142, column: 9)
!219 = !DILocation(line: 142, column: 14, scope: !218)
!220 = !DILocation(line: 142, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !13, line: 142, column: 9)
!222 = !DILocation(line: 142, column: 25, scope: !221)
!223 = !DILocation(line: 142, column: 23, scope: !221)
!224 = !DILocation(line: 142, column: 9, scope: !218)
!225 = !DILocation(line: 144, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !13, line: 143, column: 9)
!227 = !DILocation(line: 144, column: 28, scope: !226)
!228 = !DILocation(line: 144, column: 18, scope: !226)
!229 = !DILocation(line: 144, column: 13, scope: !226)
!230 = !DILocation(line: 144, column: 21, scope: !226)
!231 = !DILocation(line: 145, column: 9, scope: !226)
!232 = !DILocation(line: 142, column: 35, scope: !221)
!233 = !DILocation(line: 142, column: 9, scope: !221)
!234 = distinct !{!234, !224, !235, !71}
!235 = !DILocation(line: 145, column: 9, scope: !218)
!236 = !DILocation(line: 146, column: 9, scope: !205)
!237 = !DILocation(line: 146, column: 21, scope: !205)
!238 = !DILocation(line: 147, column: 19, scope: !205)
!239 = !DILocation(line: 147, column: 9, scope: !205)
!240 = !DILocation(line: 148, column: 14, scope: !205)
!241 = !DILocation(line: 148, column: 9, scope: !205)
!242 = !DILocation(line: 150, column: 1, scope: !196)
!243 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 115, type: !80, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!244 = !DILocalVariable(name: "data", arg: 1, scope: !243, file: !13, line: 115, type: !7)
!245 = !DILocation(line: 115, column: 37, scope: !243)
!246 = !DILocation(line: 117, column: 8, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !13, line: 117, column: 8)
!248 = !DILocation(line: 117, column: 8, scope: !243)
!249 = !DILocation(line: 120, column: 24, scope: !250)
!250 = distinct !DILexicalBlock(scope: !247, file: !13, line: 118, column: 5)
!251 = !DILocation(line: 120, column: 14, scope: !250)
!252 = !DILocation(line: 121, column: 13, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !13, line: 121, column: 13)
!254 = !DILocation(line: 121, column: 18, scope: !253)
!255 = !DILocation(line: 121, column: 13, scope: !250)
!256 = !DILocation(line: 121, column: 28, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !13, line: 121, column: 27)
!258 = !DILocation(line: 122, column: 16, scope: !250)
!259 = !DILocation(line: 122, column: 9, scope: !250)
!260 = !DILocation(line: 123, column: 9, scope: !250)
!261 = !DILocation(line: 123, column: 21, scope: !250)
!262 = !DILocation(line: 124, column: 5, scope: !250)
!263 = !DILocation(line: 125, column: 12, scope: !243)
!264 = !DILocation(line: 125, column: 5, scope: !243)
