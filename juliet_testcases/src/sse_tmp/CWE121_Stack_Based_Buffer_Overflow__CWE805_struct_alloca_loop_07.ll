; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07_bad() #0 !dbg !23 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32, i32* @staticFive, align 4, !dbg !36
  %cmp = icmp eq i32 %4, 5, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !40
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !59
  %cmp1 = icmp ult i64 %6, 100, !dbg !61
  br i1 %cmp1, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !65
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !66
  store i32 0, i32* %intOne, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !69
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !70
  store i32 0, i32* %intTwo, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %9, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !78, metadata !DIExpression()), !dbg !80
  store i64 0, i64* %i3, align 8, !dbg !81
  br label %for.cond4, !dbg !83

for.cond4:                                        ; preds = %for.inc9, %for.end
  %10 = load i64, i64* %i3, align 8, !dbg !84
  %cmp5 = icmp ult i64 %10, 100, !dbg !86
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !87

for.body6:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %12 = load i64, i64* %i3, align 8, !dbg !90
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !88
  %13 = load i64, i64* %i3, align 8, !dbg !91
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !92
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !92
  %15 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !92
  br label %for.inc9, !dbg !93

for.inc9:                                         ; preds = %for.body6
  %16 = load i64, i64* %i3, align 8, !dbg !94
  %inc10 = add i64 %16, 1, !dbg !94
  store i64 %inc10, i64* %i3, align 8, !dbg !94
  br label %for.cond4, !dbg !95, !llvm.loop !96

for.end11:                                        ; preds = %for.cond4
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !98
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !98
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07_good() #0 !dbg !101 {
entry:
  call void @goodG2B1(), !dbg !102
  call void @goodG2B2(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i64 @time(i64* null) #5, !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 %conv) #5, !dbg !117
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !118
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07_good(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07_bad(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !125 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = alloca i8, i64 400, align 16, !dbg !130
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !131
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %2 = alloca i8, i64 800, align 16, !dbg !134
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !135
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !133
  %4 = load i32, i32* @staticFive, align 4, !dbg !136
  %cmp = icmp ne i32 %4, 5, !dbg !138
  br i1 %cmp, label %if.then, label %if.else, !dbg !139

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
  %cmp1 = icmp ult i64 %6, 100, !dbg !157
  br i1 %cmp1, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !161
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !162
  store i32 0, i32* %intOne, align 8, !dbg !163
  %8 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !165
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !166
  store i32 0, i32* %intTwo, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %9, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !173, metadata !DIExpression()), !dbg !175
  store i64 0, i64* %i3, align 8, !dbg !176
  br label %for.cond4, !dbg !178

for.cond4:                                        ; preds = %for.inc9, %for.end
  %10 = load i64, i64* %i3, align 8, !dbg !179
  %cmp5 = icmp ult i64 %10, 100, !dbg !181
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !182

for.body6:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %12 = load i64, i64* %i3, align 8, !dbg !185
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !183
  %13 = load i64, i64* %i3, align 8, !dbg !186
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !187
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !187
  %15 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !187
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !187
  br label %for.inc9, !dbg !188

for.inc9:                                         ; preds = %for.body6
  %16 = load i64, i64* %i3, align 8, !dbg !189
  %inc10 = add i64 %16, 1, !dbg !189
  store i64 %inc10, i64* %i3, align 8, !dbg !189
  br label %for.cond4, !dbg !190, !llvm.loop !191

for.end11:                                        ; preds = %for.cond4
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !193
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !193
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !194
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
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !199, metadata !DIExpression()), !dbg !200
  %0 = alloca i8, i64 400, align 16, !dbg !201
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !202
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !200
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !203, metadata !DIExpression()), !dbg !204
  %2 = alloca i8, i64 800, align 16, !dbg !205
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !206
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !204
  %4 = load i32, i32* @staticFive, align 4, !dbg !207
  %cmp = icmp eq i32 %4, 5, !dbg !209
  br i1 %cmp, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !211
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !213
  br label %if.end, !dbg !214

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !215, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i64* %i, metadata !218, metadata !DIExpression()), !dbg !220
  store i64 0, i64* %i, align 8, !dbg !221
  br label %for.cond, !dbg !223

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !224
  %cmp1 = icmp ult i64 %6, 100, !dbg !226
  br i1 %cmp1, label %for.body, label %for.end, !dbg !227

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !230
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !231
  store i32 0, i32* %intOne, align 8, !dbg !232
  %8 = load i64, i64* %i, align 8, !dbg !233
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !234
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !235
  store i32 0, i32* %intTwo, align 4, !dbg !236
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !238
  %inc = add i64 %9, 1, !dbg !238
  store i64 %inc, i64* %i, align 8, !dbg !238
  br label %for.cond, !dbg !239, !llvm.loop !240

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !242, metadata !DIExpression()), !dbg !244
  store i64 0, i64* %i3, align 8, !dbg !245
  br label %for.cond4, !dbg !247

for.cond4:                                        ; preds = %for.inc9, %for.end
  %10 = load i64, i64* %i3, align 8, !dbg !248
  %cmp5 = icmp ult i64 %10, 100, !dbg !250
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !251

for.body6:                                        ; preds = %for.cond4
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !252
  %12 = load i64, i64* %i3, align 8, !dbg !254
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !252
  %13 = load i64, i64* %i3, align 8, !dbg !255
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !256
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !256
  %15 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !256
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !256
  br label %for.inc9, !dbg !257

for.inc9:                                         ; preds = %for.body6
  %16 = load i64, i64* %i3, align 8, !dbg !258
  %inc10 = add i64 %16, 1, !dbg !258
  store i64 %inc10, i64* %i3, align 8, !dbg !258
  br label %for.cond4, !dbg !259, !llvm.loop !260

for.end11:                                        ; preds = %for.cond4
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !262
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !262
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !263
  ret void, !dbg !264
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !16, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0}
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07_bad", scope: !16, file: !16, line: 27, type: !24, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !16, line: 29, type: !6)
!27 = !DILocation(line: 29, column: 21, scope: !23)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !16, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 21, scope: !23)
!30 = !DILocation(line: 30, column: 54, scope: !23)
!31 = !DILocation(line: 30, column: 37, scope: !23)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !16, line: 31, type: !6)
!33 = !DILocation(line: 31, column: 21, scope: !23)
!34 = !DILocation(line: 31, column: 55, scope: !23)
!35 = !DILocation(line: 31, column: 38, scope: !23)
!36 = !DILocation(line: 32, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !16, line: 32, column: 8)
!38 = !DILocation(line: 32, column: 18, scope: !37)
!39 = !DILocation(line: 32, column: 8, scope: !23)
!40 = !DILocation(line: 36, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !16, line: 33, column: 5)
!42 = !DILocation(line: 36, column: 14, scope: !41)
!43 = !DILocation(line: 37, column: 5, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 39, type: !46)
!45 = distinct !DILexicalBlock(scope: !23, file: !16, line: 38, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 39, column: 23, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !51, file: !16, line: 41, type: !52)
!51 = distinct !DILexicalBlock(scope: !45, file: !16, line: 40, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 41, column: 20, scope: !51)
!56 = !DILocation(line: 43, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !16, line: 43, column: 13)
!58 = !DILocation(line: 43, column: 18, scope: !57)
!59 = !DILocation(line: 43, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !16, line: 43, column: 13)
!61 = !DILocation(line: 43, column: 27, scope: !60)
!62 = !DILocation(line: 43, column: 13, scope: !57)
!63 = !DILocation(line: 45, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !16, line: 44, column: 13)
!65 = !DILocation(line: 45, column: 17, scope: !64)
!66 = !DILocation(line: 45, column: 27, scope: !64)
!67 = !DILocation(line: 45, column: 34, scope: !64)
!68 = !DILocation(line: 46, column: 24, scope: !64)
!69 = !DILocation(line: 46, column: 17, scope: !64)
!70 = !DILocation(line: 46, column: 27, scope: !64)
!71 = !DILocation(line: 46, column: 34, scope: !64)
!72 = !DILocation(line: 47, column: 13, scope: !64)
!73 = !DILocation(line: 43, column: 35, scope: !60)
!74 = !DILocation(line: 43, column: 13, scope: !60)
!75 = distinct !{!75, !62, !76, !77}
!76 = !DILocation(line: 47, column: 13, scope: !57)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocalVariable(name: "i", scope: !79, file: !16, line: 50, type: !52)
!79 = distinct !DILexicalBlock(scope: !45, file: !16, line: 49, column: 9)
!80 = !DILocation(line: 50, column: 20, scope: !79)
!81 = !DILocation(line: 52, column: 20, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !16, line: 52, column: 13)
!83 = !DILocation(line: 52, column: 18, scope: !82)
!84 = !DILocation(line: 52, column: 25, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !16, line: 52, column: 13)
!86 = !DILocation(line: 52, column: 27, scope: !85)
!87 = !DILocation(line: 52, column: 13, scope: !82)
!88 = !DILocation(line: 54, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !16, line: 53, column: 13)
!90 = !DILocation(line: 54, column: 22, scope: !89)
!91 = !DILocation(line: 54, column: 34, scope: !89)
!92 = !DILocation(line: 54, column: 27, scope: !89)
!93 = !DILocation(line: 55, column: 13, scope: !89)
!94 = !DILocation(line: 52, column: 35, scope: !85)
!95 = !DILocation(line: 52, column: 13, scope: !85)
!96 = distinct !{!96, !87, !97, !77}
!97 = !DILocation(line: 55, column: 13, scope: !82)
!98 = !DILocation(line: 56, column: 30, scope: !79)
!99 = !DILocation(line: 56, column: 13, scope: !79)
!100 = !DILocation(line: 59, column: 1, scope: !23)
!101 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_07_good", scope: !16, file: !16, line: 138, type: !24, scopeLine: 139, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocation(line: 140, column: 5, scope: !101)
!103 = !DILocation(line: 141, column: 5, scope: !101)
!104 = !DILocation(line: 142, column: 1, scope: !101)
!105 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 154, type: !106, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DISubroutineType(types: !107)
!107 = !{!12, !12, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !16, line: 154, type: !12)
!112 = !DILocation(line: 154, column: 14, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !16, line: 154, type: !108)
!114 = !DILocation(line: 154, column: 27, scope: !105)
!115 = !DILocation(line: 157, column: 22, scope: !105)
!116 = !DILocation(line: 157, column: 12, scope: !105)
!117 = !DILocation(line: 157, column: 5, scope: !105)
!118 = !DILocation(line: 159, column: 5, scope: !105)
!119 = !DILocation(line: 160, column: 5, scope: !105)
!120 = !DILocation(line: 161, column: 5, scope: !105)
!121 = !DILocation(line: 164, column: 5, scope: !105)
!122 = !DILocation(line: 165, column: 5, scope: !105)
!123 = !DILocation(line: 166, column: 5, scope: !105)
!124 = !DILocation(line: 168, column: 5, scope: !105)
!125 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 66, type: !24, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !16, line: 68, type: !6)
!127 = !DILocation(line: 68, column: 21, scope: !125)
!128 = !DILocalVariable(name: "dataBadBuffer", scope: !125, file: !16, line: 69, type: !6)
!129 = !DILocation(line: 69, column: 21, scope: !125)
!130 = !DILocation(line: 69, column: 54, scope: !125)
!131 = !DILocation(line: 69, column: 37, scope: !125)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !125, file: !16, line: 70, type: !6)
!133 = !DILocation(line: 70, column: 21, scope: !125)
!134 = !DILocation(line: 70, column: 55, scope: !125)
!135 = !DILocation(line: 70, column: 38, scope: !125)
!136 = !DILocation(line: 71, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !125, file: !16, line: 71, column: 8)
!138 = !DILocation(line: 71, column: 18, scope: !137)
!139 = !DILocation(line: 71, column: 8, scope: !125)
!140 = !DILocation(line: 74, column: 9, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !16, line: 72, column: 5)
!142 = !DILocation(line: 75, column: 5, scope: !141)
!143 = !DILocation(line: 79, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !16, line: 77, column: 5)
!145 = !DILocation(line: 79, column: 14, scope: !144)
!146 = !DILocalVariable(name: "source", scope: !147, file: !16, line: 82, type: !46)
!147 = distinct !DILexicalBlock(scope: !125, file: !16, line: 81, column: 5)
!148 = !DILocation(line: 82, column: 23, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !16, line: 84, type: !52)
!150 = distinct !DILexicalBlock(scope: !147, file: !16, line: 83, column: 9)
!151 = !DILocation(line: 84, column: 20, scope: !150)
!152 = !DILocation(line: 86, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !16, line: 86, column: 13)
!154 = !DILocation(line: 86, column: 18, scope: !153)
!155 = !DILocation(line: 86, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !16, line: 86, column: 13)
!157 = !DILocation(line: 86, column: 27, scope: !156)
!158 = !DILocation(line: 86, column: 13, scope: !153)
!159 = !DILocation(line: 88, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !16, line: 87, column: 13)
!161 = !DILocation(line: 88, column: 17, scope: !160)
!162 = !DILocation(line: 88, column: 27, scope: !160)
!163 = !DILocation(line: 88, column: 34, scope: !160)
!164 = !DILocation(line: 89, column: 24, scope: !160)
!165 = !DILocation(line: 89, column: 17, scope: !160)
!166 = !DILocation(line: 89, column: 27, scope: !160)
!167 = !DILocation(line: 89, column: 34, scope: !160)
!168 = !DILocation(line: 90, column: 13, scope: !160)
!169 = !DILocation(line: 86, column: 35, scope: !156)
!170 = !DILocation(line: 86, column: 13, scope: !156)
!171 = distinct !{!171, !158, !172, !77}
!172 = !DILocation(line: 90, column: 13, scope: !153)
!173 = !DILocalVariable(name: "i", scope: !174, file: !16, line: 93, type: !52)
!174 = distinct !DILexicalBlock(scope: !147, file: !16, line: 92, column: 9)
!175 = !DILocation(line: 93, column: 20, scope: !174)
!176 = !DILocation(line: 95, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !16, line: 95, column: 13)
!178 = !DILocation(line: 95, column: 18, scope: !177)
!179 = !DILocation(line: 95, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !16, line: 95, column: 13)
!181 = !DILocation(line: 95, column: 27, scope: !180)
!182 = !DILocation(line: 95, column: 13, scope: !177)
!183 = !DILocation(line: 97, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !16, line: 96, column: 13)
!185 = !DILocation(line: 97, column: 22, scope: !184)
!186 = !DILocation(line: 97, column: 34, scope: !184)
!187 = !DILocation(line: 97, column: 27, scope: !184)
!188 = !DILocation(line: 98, column: 13, scope: !184)
!189 = !DILocation(line: 95, column: 35, scope: !180)
!190 = !DILocation(line: 95, column: 13, scope: !180)
!191 = distinct !{!191, !182, !192, !77}
!192 = !DILocation(line: 98, column: 13, scope: !177)
!193 = !DILocation(line: 99, column: 30, scope: !174)
!194 = !DILocation(line: 99, column: 13, scope: !174)
!195 = !DILocation(line: 102, column: 1, scope: !125)
!196 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 105, type: !24, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DILocalVariable(name: "data", scope: !196, file: !16, line: 107, type: !6)
!198 = !DILocation(line: 107, column: 21, scope: !196)
!199 = !DILocalVariable(name: "dataBadBuffer", scope: !196, file: !16, line: 108, type: !6)
!200 = !DILocation(line: 108, column: 21, scope: !196)
!201 = !DILocation(line: 108, column: 54, scope: !196)
!202 = !DILocation(line: 108, column: 37, scope: !196)
!203 = !DILocalVariable(name: "dataGoodBuffer", scope: !196, file: !16, line: 109, type: !6)
!204 = !DILocation(line: 109, column: 21, scope: !196)
!205 = !DILocation(line: 109, column: 55, scope: !196)
!206 = !DILocation(line: 109, column: 38, scope: !196)
!207 = !DILocation(line: 110, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !196, file: !16, line: 110, column: 8)
!209 = !DILocation(line: 110, column: 18, scope: !208)
!210 = !DILocation(line: 110, column: 8, scope: !196)
!211 = !DILocation(line: 113, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !16, line: 111, column: 5)
!213 = !DILocation(line: 113, column: 14, scope: !212)
!214 = !DILocation(line: 114, column: 5, scope: !212)
!215 = !DILocalVariable(name: "source", scope: !216, file: !16, line: 116, type: !46)
!216 = distinct !DILexicalBlock(scope: !196, file: !16, line: 115, column: 5)
!217 = !DILocation(line: 116, column: 23, scope: !216)
!218 = !DILocalVariable(name: "i", scope: !219, file: !16, line: 118, type: !52)
!219 = distinct !DILexicalBlock(scope: !216, file: !16, line: 117, column: 9)
!220 = !DILocation(line: 118, column: 20, scope: !219)
!221 = !DILocation(line: 120, column: 20, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !16, line: 120, column: 13)
!223 = !DILocation(line: 120, column: 18, scope: !222)
!224 = !DILocation(line: 120, column: 25, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !16, line: 120, column: 13)
!226 = !DILocation(line: 120, column: 27, scope: !225)
!227 = !DILocation(line: 120, column: 13, scope: !222)
!228 = !DILocation(line: 122, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !16, line: 121, column: 13)
!230 = !DILocation(line: 122, column: 17, scope: !229)
!231 = !DILocation(line: 122, column: 27, scope: !229)
!232 = !DILocation(line: 122, column: 34, scope: !229)
!233 = !DILocation(line: 123, column: 24, scope: !229)
!234 = !DILocation(line: 123, column: 17, scope: !229)
!235 = !DILocation(line: 123, column: 27, scope: !229)
!236 = !DILocation(line: 123, column: 34, scope: !229)
!237 = !DILocation(line: 124, column: 13, scope: !229)
!238 = !DILocation(line: 120, column: 35, scope: !225)
!239 = !DILocation(line: 120, column: 13, scope: !225)
!240 = distinct !{!240, !227, !241, !77}
!241 = !DILocation(line: 124, column: 13, scope: !222)
!242 = !DILocalVariable(name: "i", scope: !243, file: !16, line: 127, type: !52)
!243 = distinct !DILexicalBlock(scope: !216, file: !16, line: 126, column: 9)
!244 = !DILocation(line: 127, column: 20, scope: !243)
!245 = !DILocation(line: 129, column: 20, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !16, line: 129, column: 13)
!247 = !DILocation(line: 129, column: 18, scope: !246)
!248 = !DILocation(line: 129, column: 25, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !16, line: 129, column: 13)
!250 = !DILocation(line: 129, column: 27, scope: !249)
!251 = !DILocation(line: 129, column: 13, scope: !246)
!252 = !DILocation(line: 131, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !16, line: 130, column: 13)
!254 = !DILocation(line: 131, column: 22, scope: !253)
!255 = !DILocation(line: 131, column: 34, scope: !253)
!256 = !DILocation(line: 131, column: 27, scope: !253)
!257 = !DILocation(line: 132, column: 13, scope: !253)
!258 = !DILocation(line: 129, column: 35, scope: !249)
!259 = !DILocation(line: 129, column: 13, scope: !249)
!260 = distinct !{!260, !251, !261, !77}
!261 = !DILocation(line: 132, column: 13, scope: !246)
!262 = !DILocation(line: 133, column: 30, scope: !243)
!263 = !DILocation(line: 133, column: 13, scope: !243)
!264 = !DILocation(line: 136, column: 1, scope: !196)
