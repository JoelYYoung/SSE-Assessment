; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !33
  %cmp = icmp eq i32 %4, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !37
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !56
  %cmp1 = icmp ult i64 %6, 100, !dbg !58
  br i1 %cmp1, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %9, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !75, metadata !DIExpression()), !dbg !77
  store i64 0, i64* %i3, align 8, !dbg !78
  br label %for.cond4, !dbg !80

for.cond4:                                        ; preds = %for.inc9, %for.end
  %10 = load i64, i64* %i3, align 8, !dbg !81
  %cmp5 = icmp ult i64 %10, 100, !dbg !83
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !84

for.body6:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !85
  %12 = load i64, i64* %i3, align 8, !dbg !87
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !85
  %13 = load i64, i64* %i3, align 8, !dbg !88
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !89
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !89
  %15 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !89
  br label %for.inc9, !dbg !90

for.inc9:                                         ; preds = %for.body6
  %16 = load i64, i64* %i3, align 8, !dbg !91
  %inc10 = add i64 %16, 1, !dbg !91
  store i64 %inc10, i64* %i3, align 8, !dbg !91
  br label %for.cond4, !dbg !92, !llvm.loop !93

for.end11:                                        ; preds = %for.cond4
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !95
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13_good() #0 !dbg !98 {
entry:
  call void @goodG2B1(), !dbg !99
  call void @goodG2B2(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i64 @time(i64* null) #5, !dbg !112
  %conv = trunc i64 %call to i32, !dbg !113
  call void @srand(i32 %conv) #5, !dbg !114
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13_good(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13_bad(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  ret i32 0, !dbg !121
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !122 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = alloca i8, i64 400, align 16, !dbg !127
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !128
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = alloca i8, i64 800, align 16, !dbg !131
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !132
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !130
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !133
  %cmp = icmp ne i32 %4, 5, !dbg !135
  br i1 %cmp, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !137
  br label %if.end, !dbg !139

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !140
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !152
  %cmp1 = icmp ult i64 %6, 100, !dbg !154
  br i1 %cmp1, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !158
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !159
  store i32 0, i32* %intOne, align 8, !dbg !160
  %8 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !162
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !163
  store i32 0, i32* %intTwo, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %9, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !170, metadata !DIExpression()), !dbg !172
  store i64 0, i64* %i3, align 8, !dbg !173
  br label %for.cond4, !dbg !175

for.cond4:                                        ; preds = %for.inc9, %for.end
  %10 = load i64, i64* %i3, align 8, !dbg !176
  %cmp5 = icmp ult i64 %10, 100, !dbg !178
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !179

for.body6:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !180
  %12 = load i64, i64* %i3, align 8, !dbg !182
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !180
  %13 = load i64, i64* %i3, align 8, !dbg !183
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !184
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !184
  %15 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !184
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !184
  br label %for.inc9, !dbg !185

for.inc9:                                         ; preds = %for.body6
  %16 = load i64, i64* %i3, align 8, !dbg !186
  %inc10 = add i64 %16, 1, !dbg !186
  store i64 %inc10, i64* %i3, align 8, !dbg !186
  br label %for.cond4, !dbg !187, !llvm.loop !188

for.end11:                                        ; preds = %for.cond4
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !190
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !191
  ret void, !dbg !192
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !193 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = alloca i8, i64 400, align 16, !dbg !198
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !199
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !197
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !200, metadata !DIExpression()), !dbg !201
  %2 = alloca i8, i64 800, align 16, !dbg !202
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !203
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !201
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !204
  %cmp = icmp eq i32 %4, 5, !dbg !206
  br i1 %cmp, label %if.then, label %if.end, !dbg !207

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !208
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !210
  br label %if.end, !dbg !211

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !212, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata i64* %i, metadata !215, metadata !DIExpression()), !dbg !217
  store i64 0, i64* %i, align 8, !dbg !218
  br label %for.cond, !dbg !220

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !221
  %cmp1 = icmp ult i64 %6, 100, !dbg !223
  br i1 %cmp1, label %for.body, label %for.end, !dbg !224

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !225
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !227
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !228
  store i32 0, i32* %intOne, align 8, !dbg !229
  %8 = load i64, i64* %i, align 8, !dbg !230
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !231
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !232
  store i32 0, i32* %intTwo, align 4, !dbg !233
  br label %for.inc, !dbg !234

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !235
  %inc = add i64 %9, 1, !dbg !235
  store i64 %inc, i64* %i, align 8, !dbg !235
  br label %for.cond, !dbg !236, !llvm.loop !237

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !239, metadata !DIExpression()), !dbg !241
  store i64 0, i64* %i3, align 8, !dbg !242
  br label %for.cond4, !dbg !244

for.cond4:                                        ; preds = %for.inc9, %for.end
  %10 = load i64, i64* %i3, align 8, !dbg !245
  %cmp5 = icmp ult i64 %10, 100, !dbg !247
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !248

for.body6:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !249
  %12 = load i64, i64* %i3, align 8, !dbg !251
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !249
  %13 = load i64, i64* %i3, align 8, !dbg !252
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !253
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !253
  %15 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !253
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !253
  br label %for.inc9, !dbg !254

for.inc9:                                         ; preds = %for.body6
  %16 = load i64, i64* %i3, align 8, !dbg !255
  %inc10 = add i64 %16, 1, !dbg !255
  store i64 %inc10, i64* %i3, align 8, !dbg !255
  br label %for.cond4, !dbg !256, !llvm.loop !257

for.end11:                                        ; preds = %for.cond4
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !259
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !259
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !260
  ret void, !dbg !261
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocation(line: 24, column: 54, scope: !19)
!28 = !DILocation(line: 24, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 21, scope: !19)
!31 = !DILocation(line: 25, column: 55, scope: !19)
!32 = !DILocation(line: 25, column: 38, scope: !19)
!33 = !DILocation(line: 26, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!35 = !DILocation(line: 26, column: 25, scope: !34)
!36 = !DILocation(line: 26, column: 8, scope: !19)
!37 = !DILocation(line: 30, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !20, line: 27, column: 5)
!39 = !DILocation(line: 30, column: 14, scope: !38)
!40 = !DILocation(line: 31, column: 5, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !20, line: 33, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 33, column: 23, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !20, line: 35, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !20, line: 34, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 35, column: 20, scope: !48)
!53 = !DILocation(line: 37, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !20, line: 37, column: 13)
!55 = !DILocation(line: 37, column: 18, scope: !54)
!56 = !DILocation(line: 37, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !20, line: 37, column: 13)
!58 = !DILocation(line: 37, column: 27, scope: !57)
!59 = !DILocation(line: 37, column: 13, scope: !54)
!60 = !DILocation(line: 39, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !20, line: 38, column: 13)
!62 = !DILocation(line: 39, column: 17, scope: !61)
!63 = !DILocation(line: 39, column: 27, scope: !61)
!64 = !DILocation(line: 39, column: 34, scope: !61)
!65 = !DILocation(line: 40, column: 24, scope: !61)
!66 = !DILocation(line: 40, column: 17, scope: !61)
!67 = !DILocation(line: 40, column: 27, scope: !61)
!68 = !DILocation(line: 40, column: 34, scope: !61)
!69 = !DILocation(line: 41, column: 13, scope: !61)
!70 = !DILocation(line: 37, column: 35, scope: !57)
!71 = !DILocation(line: 37, column: 13, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 41, column: 13, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocalVariable(name: "i", scope: !76, file: !20, line: 44, type: !49)
!76 = distinct !DILexicalBlock(scope: !42, file: !20, line: 43, column: 9)
!77 = !DILocation(line: 44, column: 20, scope: !76)
!78 = !DILocation(line: 46, column: 20, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !20, line: 46, column: 13)
!80 = !DILocation(line: 46, column: 18, scope: !79)
!81 = !DILocation(line: 46, column: 25, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !20, line: 46, column: 13)
!83 = !DILocation(line: 46, column: 27, scope: !82)
!84 = !DILocation(line: 46, column: 13, scope: !79)
!85 = !DILocation(line: 48, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !20, line: 47, column: 13)
!87 = !DILocation(line: 48, column: 22, scope: !86)
!88 = !DILocation(line: 48, column: 34, scope: !86)
!89 = !DILocation(line: 48, column: 27, scope: !86)
!90 = !DILocation(line: 49, column: 13, scope: !86)
!91 = !DILocation(line: 46, column: 35, scope: !82)
!92 = !DILocation(line: 46, column: 13, scope: !82)
!93 = distinct !{!93, !84, !94, !74}
!94 = !DILocation(line: 49, column: 13, scope: !79)
!95 = !DILocation(line: 50, column: 30, scope: !76)
!96 = !DILocation(line: 50, column: 13, scope: !76)
!97 = !DILocation(line: 53, column: 1, scope: !19)
!98 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_13_good", scope: !20, file: !20, line: 132, type: !21, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocation(line: 134, column: 5, scope: !98)
!100 = !DILocation(line: 135, column: 5, scope: !98)
!101 = !DILocation(line: 136, column: 1, scope: !98)
!102 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 148, type: !103, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!10, !10, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!108 = !DILocalVariable(name: "argc", arg: 1, scope: !102, file: !20, line: 148, type: !10)
!109 = !DILocation(line: 148, column: 14, scope: !102)
!110 = !DILocalVariable(name: "argv", arg: 2, scope: !102, file: !20, line: 148, type: !105)
!111 = !DILocation(line: 148, column: 27, scope: !102)
!112 = !DILocation(line: 151, column: 22, scope: !102)
!113 = !DILocation(line: 151, column: 12, scope: !102)
!114 = !DILocation(line: 151, column: 5, scope: !102)
!115 = !DILocation(line: 153, column: 5, scope: !102)
!116 = !DILocation(line: 154, column: 5, scope: !102)
!117 = !DILocation(line: 155, column: 5, scope: !102)
!118 = !DILocation(line: 158, column: 5, scope: !102)
!119 = !DILocation(line: 159, column: 5, scope: !102)
!120 = !DILocation(line: 160, column: 5, scope: !102)
!121 = !DILocation(line: 162, column: 5, scope: !102)
!122 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !20, line: 62, type: !4)
!124 = !DILocation(line: 62, column: 21, scope: !122)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !122, file: !20, line: 63, type: !4)
!126 = !DILocation(line: 63, column: 21, scope: !122)
!127 = !DILocation(line: 63, column: 54, scope: !122)
!128 = !DILocation(line: 63, column: 37, scope: !122)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !122, file: !20, line: 64, type: !4)
!130 = !DILocation(line: 64, column: 21, scope: !122)
!131 = !DILocation(line: 64, column: 55, scope: !122)
!132 = !DILocation(line: 64, column: 38, scope: !122)
!133 = !DILocation(line: 65, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !122, file: !20, line: 65, column: 8)
!135 = !DILocation(line: 65, column: 25, scope: !134)
!136 = !DILocation(line: 65, column: 8, scope: !122)
!137 = !DILocation(line: 68, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !20, line: 66, column: 5)
!139 = !DILocation(line: 69, column: 5, scope: !138)
!140 = !DILocation(line: 73, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !134, file: !20, line: 71, column: 5)
!142 = !DILocation(line: 73, column: 14, scope: !141)
!143 = !DILocalVariable(name: "source", scope: !144, file: !20, line: 76, type: !43)
!144 = distinct !DILexicalBlock(scope: !122, file: !20, line: 75, column: 5)
!145 = !DILocation(line: 76, column: 23, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !147, file: !20, line: 78, type: !49)
!147 = distinct !DILexicalBlock(scope: !144, file: !20, line: 77, column: 9)
!148 = !DILocation(line: 78, column: 20, scope: !147)
!149 = !DILocation(line: 80, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !20, line: 80, column: 13)
!151 = !DILocation(line: 80, column: 18, scope: !150)
!152 = !DILocation(line: 80, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !20, line: 80, column: 13)
!154 = !DILocation(line: 80, column: 27, scope: !153)
!155 = !DILocation(line: 80, column: 13, scope: !150)
!156 = !DILocation(line: 82, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !20, line: 81, column: 13)
!158 = !DILocation(line: 82, column: 17, scope: !157)
!159 = !DILocation(line: 82, column: 27, scope: !157)
!160 = !DILocation(line: 82, column: 34, scope: !157)
!161 = !DILocation(line: 83, column: 24, scope: !157)
!162 = !DILocation(line: 83, column: 17, scope: !157)
!163 = !DILocation(line: 83, column: 27, scope: !157)
!164 = !DILocation(line: 83, column: 34, scope: !157)
!165 = !DILocation(line: 84, column: 13, scope: !157)
!166 = !DILocation(line: 80, column: 35, scope: !153)
!167 = !DILocation(line: 80, column: 13, scope: !153)
!168 = distinct !{!168, !155, !169, !74}
!169 = !DILocation(line: 84, column: 13, scope: !150)
!170 = !DILocalVariable(name: "i", scope: !171, file: !20, line: 87, type: !49)
!171 = distinct !DILexicalBlock(scope: !144, file: !20, line: 86, column: 9)
!172 = !DILocation(line: 87, column: 20, scope: !171)
!173 = !DILocation(line: 89, column: 20, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !20, line: 89, column: 13)
!175 = !DILocation(line: 89, column: 18, scope: !174)
!176 = !DILocation(line: 89, column: 25, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !20, line: 89, column: 13)
!178 = !DILocation(line: 89, column: 27, scope: !177)
!179 = !DILocation(line: 89, column: 13, scope: !174)
!180 = !DILocation(line: 91, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !20, line: 90, column: 13)
!182 = !DILocation(line: 91, column: 22, scope: !181)
!183 = !DILocation(line: 91, column: 34, scope: !181)
!184 = !DILocation(line: 91, column: 27, scope: !181)
!185 = !DILocation(line: 92, column: 13, scope: !181)
!186 = !DILocation(line: 89, column: 35, scope: !177)
!187 = !DILocation(line: 89, column: 13, scope: !177)
!188 = distinct !{!188, !179, !189, !74}
!189 = !DILocation(line: 92, column: 13, scope: !174)
!190 = !DILocation(line: 93, column: 30, scope: !171)
!191 = !DILocation(line: 93, column: 13, scope: !171)
!192 = !DILocation(line: 96, column: 1, scope: !122)
!193 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 99, type: !21, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!194 = !DILocalVariable(name: "data", scope: !193, file: !20, line: 101, type: !4)
!195 = !DILocation(line: 101, column: 21, scope: !193)
!196 = !DILocalVariable(name: "dataBadBuffer", scope: !193, file: !20, line: 102, type: !4)
!197 = !DILocation(line: 102, column: 21, scope: !193)
!198 = !DILocation(line: 102, column: 54, scope: !193)
!199 = !DILocation(line: 102, column: 37, scope: !193)
!200 = !DILocalVariable(name: "dataGoodBuffer", scope: !193, file: !20, line: 103, type: !4)
!201 = !DILocation(line: 103, column: 21, scope: !193)
!202 = !DILocation(line: 103, column: 55, scope: !193)
!203 = !DILocation(line: 103, column: 38, scope: !193)
!204 = !DILocation(line: 104, column: 8, scope: !205)
!205 = distinct !DILexicalBlock(scope: !193, file: !20, line: 104, column: 8)
!206 = !DILocation(line: 104, column: 25, scope: !205)
!207 = !DILocation(line: 104, column: 8, scope: !193)
!208 = !DILocation(line: 107, column: 16, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !20, line: 105, column: 5)
!210 = !DILocation(line: 107, column: 14, scope: !209)
!211 = !DILocation(line: 108, column: 5, scope: !209)
!212 = !DILocalVariable(name: "source", scope: !213, file: !20, line: 110, type: !43)
!213 = distinct !DILexicalBlock(scope: !193, file: !20, line: 109, column: 5)
!214 = !DILocation(line: 110, column: 23, scope: !213)
!215 = !DILocalVariable(name: "i", scope: !216, file: !20, line: 112, type: !49)
!216 = distinct !DILexicalBlock(scope: !213, file: !20, line: 111, column: 9)
!217 = !DILocation(line: 112, column: 20, scope: !216)
!218 = !DILocation(line: 114, column: 20, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !20, line: 114, column: 13)
!220 = !DILocation(line: 114, column: 18, scope: !219)
!221 = !DILocation(line: 114, column: 25, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !20, line: 114, column: 13)
!223 = !DILocation(line: 114, column: 27, scope: !222)
!224 = !DILocation(line: 114, column: 13, scope: !219)
!225 = !DILocation(line: 116, column: 24, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !20, line: 115, column: 13)
!227 = !DILocation(line: 116, column: 17, scope: !226)
!228 = !DILocation(line: 116, column: 27, scope: !226)
!229 = !DILocation(line: 116, column: 34, scope: !226)
!230 = !DILocation(line: 117, column: 24, scope: !226)
!231 = !DILocation(line: 117, column: 17, scope: !226)
!232 = !DILocation(line: 117, column: 27, scope: !226)
!233 = !DILocation(line: 117, column: 34, scope: !226)
!234 = !DILocation(line: 118, column: 13, scope: !226)
!235 = !DILocation(line: 114, column: 35, scope: !222)
!236 = !DILocation(line: 114, column: 13, scope: !222)
!237 = distinct !{!237, !224, !238, !74}
!238 = !DILocation(line: 118, column: 13, scope: !219)
!239 = !DILocalVariable(name: "i", scope: !240, file: !20, line: 121, type: !49)
!240 = distinct !DILexicalBlock(scope: !213, file: !20, line: 120, column: 9)
!241 = !DILocation(line: 121, column: 20, scope: !240)
!242 = !DILocation(line: 123, column: 20, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !20, line: 123, column: 13)
!244 = !DILocation(line: 123, column: 18, scope: !243)
!245 = !DILocation(line: 123, column: 25, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !20, line: 123, column: 13)
!247 = !DILocation(line: 123, column: 27, scope: !246)
!248 = !DILocation(line: 123, column: 13, scope: !243)
!249 = !DILocation(line: 125, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !20, line: 124, column: 13)
!251 = !DILocation(line: 125, column: 22, scope: !250)
!252 = !DILocation(line: 125, column: 34, scope: !250)
!253 = !DILocation(line: 125, column: 27, scope: !250)
!254 = !DILocation(line: 126, column: 13, scope: !250)
!255 = !DILocation(line: 123, column: 35, scope: !246)
!256 = !DILocation(line: 123, column: 13, scope: !246)
!257 = distinct !{!257, !248, !258, !74}
!258 = !DILocation(line: 126, column: 13, scope: !243)
!259 = !DILocation(line: 127, column: 30, scope: !240)
!260 = !DILocation(line: 127, column: 13, scope: !240)
!261 = !DILocation(line: 130, column: 1, scope: !193)
