; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !16
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  %4 = load i32, i32* @staticTrue, align 4, !dbg !38
  %tobool = icmp ne i32 %4, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !41
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %6, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !66
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !67
  store i32 0, i32* %intOne, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !70
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !71
  store i32 0, i32* %intTwo, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %9, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !79, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i2, align 8, !dbg !82
  br label %for.cond3, !dbg !84

for.cond3:                                        ; preds = %for.inc8, %for.end
  %10 = load i64, i64* %i2, align 8, !dbg !85
  %cmp4 = icmp ult i64 %10, 100, !dbg !87
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !88

for.body5:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %12 = load i64, i64* %i2, align 8, !dbg !91
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !89
  %13 = load i64, i64* %i2, align 8, !dbg !92
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !93
  %14 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !93
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !93
  br label %for.inc8, !dbg !94

for.inc8:                                         ; preds = %for.body5
  %16 = load i64, i64* %i2, align 8, !dbg !95
  %inc9 = add i64 %16, 1, !dbg !95
  store i64 %inc9, i64* %i2, align 8, !dbg !95
  br label %for.cond3, !dbg !96, !llvm.loop !97

for.end10:                                        ; preds = %for.cond3
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !99
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05_good() #0 !dbg !102 {
entry:
  call void @goodG2B1(), !dbg !103
  call void @goodG2B2(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !106 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call i64 @time(i64* null) #5, !dbg !116
  %conv = trunc i64 %call to i32, !dbg !117
  call void @srand(i32 %conv) #5, !dbg !118
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !119
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05_good(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !122
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05_bad(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !124
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !126 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %0 = alloca i8, i64 400, align 16, !dbg !131
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !132
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  %2 = alloca i8, i64 800, align 16, !dbg !135
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !136
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !134
  %4 = load i32, i32* @staticFalse, align 4, !dbg !137
  %tobool = icmp ne i32 %4, 0, !dbg !137
  br i1 %tobool, label %if.then, label %if.else, !dbg !139

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !140
  br label %if.end, !dbg !142

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !143
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !145
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !155
  %cmp = icmp ult i64 %6, 100, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !161
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !162
  store i32 0, i32* %intOne, align 8, !dbg !163
  %8 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !165
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !166
  store i32 0, i32* %intTwo, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %9, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !173, metadata !DIExpression()), !dbg !175
  store i64 0, i64* %i2, align 8, !dbg !176
  br label %for.cond3, !dbg !178

for.cond3:                                        ; preds = %for.inc8, %for.end
  %10 = load i64, i64* %i2, align 8, !dbg !179
  %cmp4 = icmp ult i64 %10, 100, !dbg !181
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !182

for.body5:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %12 = load i64, i64* %i2, align 8, !dbg !185
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !183
  %13 = load i64, i64* %i2, align 8, !dbg !186
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !187
  %14 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !187
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !187
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !187
  br label %for.inc8, !dbg !188

for.inc8:                                         ; preds = %for.body5
  %16 = load i64, i64* %i2, align 8, !dbg !189
  %inc9 = add i64 %16, 1, !dbg !189
  store i64 %inc9, i64* %i2, align 8, !dbg !189
  br label %for.cond3, !dbg !190, !llvm.loop !191

for.end10:                                        ; preds = %for.cond3
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !193
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !193
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !194
  ret void, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !196 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !199, metadata !DIExpression()), !dbg !200
  %0 = alloca i8, i64 400, align 16, !dbg !201
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !202
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !200
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !203, metadata !DIExpression()), !dbg !204
  %2 = alloca i8, i64 800, align 16, !dbg !205
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !206
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !204
  %4 = load i32, i32* @staticTrue, align 4, !dbg !207
  %tobool = icmp ne i32 %4, 0, !dbg !207
  br i1 %tobool, label %if.then, label %if.end, !dbg !209

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !210
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !212
  br label %if.end, !dbg !213

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !214, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i64* %i, metadata !217, metadata !DIExpression()), !dbg !219
  store i64 0, i64* %i, align 8, !dbg !220
  br label %for.cond, !dbg !222

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !223
  %cmp = icmp ult i64 %6, 100, !dbg !225
  br i1 %cmp, label %for.body, label %for.end, !dbg !226

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !229
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !230
  store i32 0, i32* %intOne, align 8, !dbg !231
  %8 = load i64, i64* %i, align 8, !dbg !232
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !233
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !234
  store i32 0, i32* %intTwo, align 4, !dbg !235
  br label %for.inc, !dbg !236

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !237
  %inc = add i64 %9, 1, !dbg !237
  store i64 %inc, i64* %i, align 8, !dbg !237
  br label %for.cond, !dbg !238, !llvm.loop !239

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !241, metadata !DIExpression()), !dbg !243
  store i64 0, i64* %i2, align 8, !dbg !244
  br label %for.cond3, !dbg !246

for.cond3:                                        ; preds = %for.inc8, %for.end
  %10 = load i64, i64* %i2, align 8, !dbg !247
  %cmp4 = icmp ult i64 %10, 100, !dbg !249
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !250

for.body5:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !251
  %12 = load i64, i64* %i2, align 8, !dbg !253
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !251
  %13 = load i64, i64* %i2, align 8, !dbg !254
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !255
  %14 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !255
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !255
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !255
  br label %for.inc8, !dbg !256

for.inc8:                                         ; preds = %for.body5
  %16 = load i64, i64* %i2, align 8, !dbg !257
  %inc9 = add i64 %16, 1, !dbg !257
  store i64 %inc9, i64* %i2, align 8, !dbg !257
  br label %for.cond3, !dbg !258, !llvm.loop !259

for.end10:                                        ; preds = %for.cond3
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !261
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !261
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !262
  ret void, !dbg !263
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !18, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0, !16}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !18, line: 24, type: !12, isLocal: true, isDefinition: true)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05_bad", scope: !18, file: !18, line: 28, type: !26, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !18, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !18, line: 31, type: !6)
!31 = !DILocation(line: 31, column: 21, scope: !25)
!32 = !DILocation(line: 31, column: 54, scope: !25)
!33 = !DILocation(line: 31, column: 37, scope: !25)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !18, line: 32, type: !6)
!35 = !DILocation(line: 32, column: 21, scope: !25)
!36 = !DILocation(line: 32, column: 55, scope: !25)
!37 = !DILocation(line: 32, column: 38, scope: !25)
!38 = !DILocation(line: 33, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !25, file: !18, line: 33, column: 8)
!40 = !DILocation(line: 33, column: 8, scope: !25)
!41 = !DILocation(line: 37, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !18, line: 34, column: 5)
!43 = !DILocation(line: 37, column: 14, scope: !42)
!44 = !DILocation(line: 38, column: 5, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !18, line: 40, type: !47)
!46 = distinct !DILexicalBlock(scope: !25, file: !18, line: 39, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 40, column: 23, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !52, file: !18, line: 42, type: !53)
!52 = distinct !DILexicalBlock(scope: !46, file: !18, line: 41, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 42, column: 20, scope: !52)
!57 = !DILocation(line: 44, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !18, line: 44, column: 13)
!59 = !DILocation(line: 44, column: 18, scope: !58)
!60 = !DILocation(line: 44, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !18, line: 44, column: 13)
!62 = !DILocation(line: 44, column: 27, scope: !61)
!63 = !DILocation(line: 44, column: 13, scope: !58)
!64 = !DILocation(line: 46, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !18, line: 45, column: 13)
!66 = !DILocation(line: 46, column: 17, scope: !65)
!67 = !DILocation(line: 46, column: 27, scope: !65)
!68 = !DILocation(line: 46, column: 34, scope: !65)
!69 = !DILocation(line: 47, column: 24, scope: !65)
!70 = !DILocation(line: 47, column: 17, scope: !65)
!71 = !DILocation(line: 47, column: 27, scope: !65)
!72 = !DILocation(line: 47, column: 34, scope: !65)
!73 = !DILocation(line: 48, column: 13, scope: !65)
!74 = !DILocation(line: 44, column: 35, scope: !61)
!75 = !DILocation(line: 44, column: 13, scope: !61)
!76 = distinct !{!76, !63, !77, !78}
!77 = !DILocation(line: 48, column: 13, scope: !58)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocalVariable(name: "i", scope: !80, file: !18, line: 51, type: !53)
!80 = distinct !DILexicalBlock(scope: !46, file: !18, line: 50, column: 9)
!81 = !DILocation(line: 51, column: 20, scope: !80)
!82 = !DILocation(line: 53, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !18, line: 53, column: 13)
!84 = !DILocation(line: 53, column: 18, scope: !83)
!85 = !DILocation(line: 53, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !18, line: 53, column: 13)
!87 = !DILocation(line: 53, column: 27, scope: !86)
!88 = !DILocation(line: 53, column: 13, scope: !83)
!89 = !DILocation(line: 55, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !18, line: 54, column: 13)
!91 = !DILocation(line: 55, column: 22, scope: !90)
!92 = !DILocation(line: 55, column: 34, scope: !90)
!93 = !DILocation(line: 55, column: 27, scope: !90)
!94 = !DILocation(line: 56, column: 13, scope: !90)
!95 = !DILocation(line: 53, column: 35, scope: !86)
!96 = !DILocation(line: 53, column: 13, scope: !86)
!97 = distinct !{!97, !88, !98, !78}
!98 = !DILocation(line: 56, column: 13, scope: !83)
!99 = !DILocation(line: 57, column: 30, scope: !80)
!100 = !DILocation(line: 57, column: 13, scope: !80)
!101 = !DILocation(line: 60, column: 1, scope: !25)
!102 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_05_good", scope: !18, file: !18, line: 139, type: !26, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocation(line: 141, column: 5, scope: !102)
!104 = !DILocation(line: 142, column: 5, scope: !102)
!105 = !DILocation(line: 143, column: 1, scope: !102)
!106 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 155, type: !107, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DISubroutineType(types: !108)
!108 = !{!12, !12, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!112 = !DILocalVariable(name: "argc", arg: 1, scope: !106, file: !18, line: 155, type: !12)
!113 = !DILocation(line: 155, column: 14, scope: !106)
!114 = !DILocalVariable(name: "argv", arg: 2, scope: !106, file: !18, line: 155, type: !109)
!115 = !DILocation(line: 155, column: 27, scope: !106)
!116 = !DILocation(line: 158, column: 22, scope: !106)
!117 = !DILocation(line: 158, column: 12, scope: !106)
!118 = !DILocation(line: 158, column: 5, scope: !106)
!119 = !DILocation(line: 160, column: 5, scope: !106)
!120 = !DILocation(line: 161, column: 5, scope: !106)
!121 = !DILocation(line: 162, column: 5, scope: !106)
!122 = !DILocation(line: 165, column: 5, scope: !106)
!123 = !DILocation(line: 166, column: 5, scope: !106)
!124 = !DILocation(line: 167, column: 5, scope: !106)
!125 = !DILocation(line: 169, column: 5, scope: !106)
!126 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 67, type: !26, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", scope: !126, file: !18, line: 69, type: !6)
!128 = !DILocation(line: 69, column: 21, scope: !126)
!129 = !DILocalVariable(name: "dataBadBuffer", scope: !126, file: !18, line: 70, type: !6)
!130 = !DILocation(line: 70, column: 21, scope: !126)
!131 = !DILocation(line: 70, column: 54, scope: !126)
!132 = !DILocation(line: 70, column: 37, scope: !126)
!133 = !DILocalVariable(name: "dataGoodBuffer", scope: !126, file: !18, line: 71, type: !6)
!134 = !DILocation(line: 71, column: 21, scope: !126)
!135 = !DILocation(line: 71, column: 55, scope: !126)
!136 = !DILocation(line: 71, column: 38, scope: !126)
!137 = !DILocation(line: 72, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !126, file: !18, line: 72, column: 8)
!139 = !DILocation(line: 72, column: 8, scope: !126)
!140 = !DILocation(line: 75, column: 9, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !18, line: 73, column: 5)
!142 = !DILocation(line: 76, column: 5, scope: !141)
!143 = !DILocation(line: 80, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !18, line: 78, column: 5)
!145 = !DILocation(line: 80, column: 14, scope: !144)
!146 = !DILocalVariable(name: "source", scope: !147, file: !18, line: 83, type: !47)
!147 = distinct !DILexicalBlock(scope: !126, file: !18, line: 82, column: 5)
!148 = !DILocation(line: 83, column: 23, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !18, line: 85, type: !53)
!150 = distinct !DILexicalBlock(scope: !147, file: !18, line: 84, column: 9)
!151 = !DILocation(line: 85, column: 20, scope: !150)
!152 = !DILocation(line: 87, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !18, line: 87, column: 13)
!154 = !DILocation(line: 87, column: 18, scope: !153)
!155 = !DILocation(line: 87, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !18, line: 87, column: 13)
!157 = !DILocation(line: 87, column: 27, scope: !156)
!158 = !DILocation(line: 87, column: 13, scope: !153)
!159 = !DILocation(line: 89, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !18, line: 88, column: 13)
!161 = !DILocation(line: 89, column: 17, scope: !160)
!162 = !DILocation(line: 89, column: 27, scope: !160)
!163 = !DILocation(line: 89, column: 34, scope: !160)
!164 = !DILocation(line: 90, column: 24, scope: !160)
!165 = !DILocation(line: 90, column: 17, scope: !160)
!166 = !DILocation(line: 90, column: 27, scope: !160)
!167 = !DILocation(line: 90, column: 34, scope: !160)
!168 = !DILocation(line: 91, column: 13, scope: !160)
!169 = !DILocation(line: 87, column: 35, scope: !156)
!170 = !DILocation(line: 87, column: 13, scope: !156)
!171 = distinct !{!171, !158, !172, !78}
!172 = !DILocation(line: 91, column: 13, scope: !153)
!173 = !DILocalVariable(name: "i", scope: !174, file: !18, line: 94, type: !53)
!174 = distinct !DILexicalBlock(scope: !147, file: !18, line: 93, column: 9)
!175 = !DILocation(line: 94, column: 20, scope: !174)
!176 = !DILocation(line: 96, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !18, line: 96, column: 13)
!178 = !DILocation(line: 96, column: 18, scope: !177)
!179 = !DILocation(line: 96, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !18, line: 96, column: 13)
!181 = !DILocation(line: 96, column: 27, scope: !180)
!182 = !DILocation(line: 96, column: 13, scope: !177)
!183 = !DILocation(line: 98, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !18, line: 97, column: 13)
!185 = !DILocation(line: 98, column: 22, scope: !184)
!186 = !DILocation(line: 98, column: 34, scope: !184)
!187 = !DILocation(line: 98, column: 27, scope: !184)
!188 = !DILocation(line: 99, column: 13, scope: !184)
!189 = !DILocation(line: 96, column: 35, scope: !180)
!190 = !DILocation(line: 96, column: 13, scope: !180)
!191 = distinct !{!191, !182, !192, !78}
!192 = !DILocation(line: 99, column: 13, scope: !177)
!193 = !DILocation(line: 100, column: 30, scope: !174)
!194 = !DILocation(line: 100, column: 13, scope: !174)
!195 = !DILocation(line: 103, column: 1, scope: !126)
!196 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 106, type: !26, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DILocalVariable(name: "data", scope: !196, file: !18, line: 108, type: !6)
!198 = !DILocation(line: 108, column: 21, scope: !196)
!199 = !DILocalVariable(name: "dataBadBuffer", scope: !196, file: !18, line: 109, type: !6)
!200 = !DILocation(line: 109, column: 21, scope: !196)
!201 = !DILocation(line: 109, column: 54, scope: !196)
!202 = !DILocation(line: 109, column: 37, scope: !196)
!203 = !DILocalVariable(name: "dataGoodBuffer", scope: !196, file: !18, line: 110, type: !6)
!204 = !DILocation(line: 110, column: 21, scope: !196)
!205 = !DILocation(line: 110, column: 55, scope: !196)
!206 = !DILocation(line: 110, column: 38, scope: !196)
!207 = !DILocation(line: 111, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !196, file: !18, line: 111, column: 8)
!209 = !DILocation(line: 111, column: 8, scope: !196)
!210 = !DILocation(line: 114, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !18, line: 112, column: 5)
!212 = !DILocation(line: 114, column: 14, scope: !211)
!213 = !DILocation(line: 115, column: 5, scope: !211)
!214 = !DILocalVariable(name: "source", scope: !215, file: !18, line: 117, type: !47)
!215 = distinct !DILexicalBlock(scope: !196, file: !18, line: 116, column: 5)
!216 = !DILocation(line: 117, column: 23, scope: !215)
!217 = !DILocalVariable(name: "i", scope: !218, file: !18, line: 119, type: !53)
!218 = distinct !DILexicalBlock(scope: !215, file: !18, line: 118, column: 9)
!219 = !DILocation(line: 119, column: 20, scope: !218)
!220 = !DILocation(line: 121, column: 20, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !18, line: 121, column: 13)
!222 = !DILocation(line: 121, column: 18, scope: !221)
!223 = !DILocation(line: 121, column: 25, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !18, line: 121, column: 13)
!225 = !DILocation(line: 121, column: 27, scope: !224)
!226 = !DILocation(line: 121, column: 13, scope: !221)
!227 = !DILocation(line: 123, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !18, line: 122, column: 13)
!229 = !DILocation(line: 123, column: 17, scope: !228)
!230 = !DILocation(line: 123, column: 27, scope: !228)
!231 = !DILocation(line: 123, column: 34, scope: !228)
!232 = !DILocation(line: 124, column: 24, scope: !228)
!233 = !DILocation(line: 124, column: 17, scope: !228)
!234 = !DILocation(line: 124, column: 27, scope: !228)
!235 = !DILocation(line: 124, column: 34, scope: !228)
!236 = !DILocation(line: 125, column: 13, scope: !228)
!237 = !DILocation(line: 121, column: 35, scope: !224)
!238 = !DILocation(line: 121, column: 13, scope: !224)
!239 = distinct !{!239, !226, !240, !78}
!240 = !DILocation(line: 125, column: 13, scope: !221)
!241 = !DILocalVariable(name: "i", scope: !242, file: !18, line: 128, type: !53)
!242 = distinct !DILexicalBlock(scope: !215, file: !18, line: 127, column: 9)
!243 = !DILocation(line: 128, column: 20, scope: !242)
!244 = !DILocation(line: 130, column: 20, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !18, line: 130, column: 13)
!246 = !DILocation(line: 130, column: 18, scope: !245)
!247 = !DILocation(line: 130, column: 25, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !18, line: 130, column: 13)
!249 = !DILocation(line: 130, column: 27, scope: !248)
!250 = !DILocation(line: 130, column: 13, scope: !245)
!251 = !DILocation(line: 132, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !18, line: 131, column: 13)
!253 = !DILocation(line: 132, column: 22, scope: !252)
!254 = !DILocation(line: 132, column: 34, scope: !252)
!255 = !DILocation(line: 132, column: 27, scope: !252)
!256 = !DILocation(line: 133, column: 13, scope: !252)
!257 = !DILocation(line: 130, column: 35, scope: !248)
!258 = !DILocation(line: 130, column: 13, scope: !248)
!259 = distinct !{!259, !250, !260, !78}
!260 = !DILocation(line: 133, column: 13, scope: !245)
!261 = !DILocation(line: 134, column: 30, scope: !242)
!262 = !DILocation(line: 134, column: 13, scope: !242)
!263 = !DILocation(line: 137, column: 1, scope: !196)
