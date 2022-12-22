; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %call = call i32 @staticReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !36
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %5, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %8, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !74, metadata !DIExpression()), !dbg !76
  store i64 0, i64* %i2, align 8, !dbg !77
  br label %for.cond3, !dbg !79

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !80
  %cmp4 = icmp ult i64 %9, 100, !dbg !82
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !83

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %11 = load i64, i64* %i2, align 8, !dbg !86
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !84
  %12 = load i64, i64* %i2, align 8, !dbg !87
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !88
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !88
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !88
  br label %for.inc8, !dbg !89

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !90
  %inc9 = add i64 %15, 1, !dbg !90
  store i64 %inc9, i64* %i2, align 8, !dbg !90
  br label %for.cond3, !dbg !91, !llvm.loop !92

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !94
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08_good() #0 !dbg !97 {
entry:
  call void @goodG2B1(), !dbg !98
  call void @goodG2B2(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #5, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #5, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !121 {
entry:
  ret i32 1, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !125 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = alloca i8, i64 400, align 16, !dbg !130
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !131
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %2 = alloca i8, i64 800, align 16, !dbg !134
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !135
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !133
  %call = call i32 @staticReturnsFalse(), !dbg !136
  %tobool = icmp ne i32 %call, 0, !dbg !136
  br i1 %tobool, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !139
  br label %if.end, !dbg !141

if.else:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !142
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !154
  %cmp = icmp ult i64 %5, 100, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !160
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !161
  store i32 0, i32* %intOne, align 8, !dbg !162
  %7 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !164
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !165
  store i32 0, i32* %intTwo, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %8, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !172, metadata !DIExpression()), !dbg !174
  store i64 0, i64* %i2, align 8, !dbg !175
  br label %for.cond3, !dbg !177

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !178
  %cmp4 = icmp ult i64 %9, 100, !dbg !180
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !181

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !182
  %11 = load i64, i64* %i2, align 8, !dbg !184
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !182
  %12 = load i64, i64* %i2, align 8, !dbg !185
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !186
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !186
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !186
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !186
  br label %for.inc8, !dbg !187

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !188
  %inc9 = add i64 %15, 1, !dbg !188
  store i64 %inc9, i64* %i2, align 8, !dbg !188
  br label %for.cond3, !dbg !189, !llvm.loop !190

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !192
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !192
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !193
  ret void, !dbg !194
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !195 {
entry:
  ret i32 0, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !197 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !200, metadata !DIExpression()), !dbg !201
  %0 = alloca i8, i64 400, align 16, !dbg !202
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !203
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !201
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !204, metadata !DIExpression()), !dbg !205
  %2 = alloca i8, i64 800, align 16, !dbg !206
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !207
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !205
  %call = call i32 @staticReturnsTrue(), !dbg !208
  %tobool = icmp ne i32 %call, 0, !dbg !208
  br i1 %tobool, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !211
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !213
  br label %if.end, !dbg !214

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !215, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i64* %i, metadata !218, metadata !DIExpression()), !dbg !220
  store i64 0, i64* %i, align 8, !dbg !221
  br label %for.cond, !dbg !223

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !224
  %cmp = icmp ult i64 %5, 100, !dbg !226
  br i1 %cmp, label %for.body, label %for.end, !dbg !227

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !230
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !231
  store i32 0, i32* %intOne, align 8, !dbg !232
  %7 = load i64, i64* %i, align 8, !dbg !233
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !234
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !235
  store i32 0, i32* %intTwo, align 4, !dbg !236
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !238
  %inc = add i64 %8, 1, !dbg !238
  store i64 %inc, i64* %i, align 8, !dbg !238
  br label %for.cond, !dbg !239, !llvm.loop !240

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !242, metadata !DIExpression()), !dbg !244
  store i64 0, i64* %i2, align 8, !dbg !245
  br label %for.cond3, !dbg !247

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !248
  %cmp4 = icmp ult i64 %9, 100, !dbg !250
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !251

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !252
  %11 = load i64, i64* %i2, align 8, !dbg !254
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !252
  %12 = load i64, i64* %i2, align 8, !dbg !255
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !256
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !256
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !256
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !256
  br label %for.inc8, !dbg !257

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !258
  %inc9 = add i64 %15, 1, !dbg !258
  store i64 %inc9, i64* %i2, align 8, !dbg !258
  br label %for.cond3, !dbg !259, !llvm.loop !260

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !262
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !262
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !263
  ret void, !dbg !264
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08_bad", scope: !20, file: !20, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 37, type: !4)
!24 = !DILocation(line: 37, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 38, type: !4)
!26 = !DILocation(line: 38, column: 21, scope: !19)
!27 = !DILocation(line: 38, column: 54, scope: !19)
!28 = !DILocation(line: 38, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 39, type: !4)
!30 = !DILocation(line: 39, column: 21, scope: !19)
!31 = !DILocation(line: 39, column: 55, scope: !19)
!32 = !DILocation(line: 39, column: 38, scope: !19)
!33 = !DILocation(line: 40, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !20, line: 40, column: 8)
!35 = !DILocation(line: 40, column: 8, scope: !19)
!36 = !DILocation(line: 44, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !20, line: 41, column: 5)
!38 = !DILocation(line: 44, column: 14, scope: !37)
!39 = !DILocation(line: 45, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !20, line: 47, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !20, line: 46, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 47, column: 23, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !20, line: 49, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !20, line: 48, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 49, column: 20, scope: !47)
!52 = !DILocation(line: 51, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !20, line: 51, column: 13)
!54 = !DILocation(line: 51, column: 18, scope: !53)
!55 = !DILocation(line: 51, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !20, line: 51, column: 13)
!57 = !DILocation(line: 51, column: 27, scope: !56)
!58 = !DILocation(line: 51, column: 13, scope: !53)
!59 = !DILocation(line: 53, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !20, line: 52, column: 13)
!61 = !DILocation(line: 53, column: 17, scope: !60)
!62 = !DILocation(line: 53, column: 27, scope: !60)
!63 = !DILocation(line: 53, column: 34, scope: !60)
!64 = !DILocation(line: 54, column: 24, scope: !60)
!65 = !DILocation(line: 54, column: 17, scope: !60)
!66 = !DILocation(line: 54, column: 27, scope: !60)
!67 = !DILocation(line: 54, column: 34, scope: !60)
!68 = !DILocation(line: 55, column: 13, scope: !60)
!69 = !DILocation(line: 51, column: 35, scope: !56)
!70 = !DILocation(line: 51, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 55, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocalVariable(name: "i", scope: !75, file: !20, line: 58, type: !48)
!75 = distinct !DILexicalBlock(scope: !41, file: !20, line: 57, column: 9)
!76 = !DILocation(line: 58, column: 20, scope: !75)
!77 = !DILocation(line: 60, column: 20, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !20, line: 60, column: 13)
!79 = !DILocation(line: 60, column: 18, scope: !78)
!80 = !DILocation(line: 60, column: 25, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !20, line: 60, column: 13)
!82 = !DILocation(line: 60, column: 27, scope: !81)
!83 = !DILocation(line: 60, column: 13, scope: !78)
!84 = !DILocation(line: 62, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !20, line: 61, column: 13)
!86 = !DILocation(line: 62, column: 22, scope: !85)
!87 = !DILocation(line: 62, column: 34, scope: !85)
!88 = !DILocation(line: 62, column: 27, scope: !85)
!89 = !DILocation(line: 63, column: 13, scope: !85)
!90 = !DILocation(line: 60, column: 35, scope: !81)
!91 = !DILocation(line: 60, column: 13, scope: !81)
!92 = distinct !{!92, !83, !93, !73}
!93 = !DILocation(line: 63, column: 13, scope: !78)
!94 = !DILocation(line: 64, column: 30, scope: !75)
!95 = !DILocation(line: 64, column: 13, scope: !75)
!96 = !DILocation(line: 67, column: 1, scope: !19)
!97 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_08_good", scope: !20, file: !20, line: 146, type: !21, scopeLine: 147, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 148, column: 5, scope: !97)
!99 = !DILocation(line: 149, column: 5, scope: !97)
!100 = !DILocation(line: 150, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 162, type: !102, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!10, !10, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !20, line: 162, type: !10)
!108 = !DILocation(line: 162, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !20, line: 162, type: !104)
!110 = !DILocation(line: 162, column: 27, scope: !101)
!111 = !DILocation(line: 165, column: 22, scope: !101)
!112 = !DILocation(line: 165, column: 12, scope: !101)
!113 = !DILocation(line: 165, column: 5, scope: !101)
!114 = !DILocation(line: 167, column: 5, scope: !101)
!115 = !DILocation(line: 168, column: 5, scope: !101)
!116 = !DILocation(line: 169, column: 5, scope: !101)
!117 = !DILocation(line: 172, column: 5, scope: !101)
!118 = !DILocation(line: 173, column: 5, scope: !101)
!119 = !DILocation(line: 174, column: 5, scope: !101)
!120 = !DILocation(line: 176, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !20, file: !20, line: 23, type: !122, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DISubroutineType(types: !123)
!123 = !{!10}
!124 = !DILocation(line: 25, column: 5, scope: !121)
!125 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 74, type: !21, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !20, line: 76, type: !4)
!127 = !DILocation(line: 76, column: 21, scope: !125)
!128 = !DILocalVariable(name: "dataBadBuffer", scope: !125, file: !20, line: 77, type: !4)
!129 = !DILocation(line: 77, column: 21, scope: !125)
!130 = !DILocation(line: 77, column: 54, scope: !125)
!131 = !DILocation(line: 77, column: 37, scope: !125)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !125, file: !20, line: 78, type: !4)
!133 = !DILocation(line: 78, column: 21, scope: !125)
!134 = !DILocation(line: 78, column: 55, scope: !125)
!135 = !DILocation(line: 78, column: 38, scope: !125)
!136 = !DILocation(line: 79, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !125, file: !20, line: 79, column: 8)
!138 = !DILocation(line: 79, column: 8, scope: !125)
!139 = !DILocation(line: 82, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !20, line: 80, column: 5)
!141 = !DILocation(line: 83, column: 5, scope: !140)
!142 = !DILocation(line: 87, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !20, line: 85, column: 5)
!144 = !DILocation(line: 87, column: 14, scope: !143)
!145 = !DILocalVariable(name: "source", scope: !146, file: !20, line: 90, type: !42)
!146 = distinct !DILexicalBlock(scope: !125, file: !20, line: 89, column: 5)
!147 = !DILocation(line: 90, column: 23, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !20, line: 92, type: !48)
!149 = distinct !DILexicalBlock(scope: !146, file: !20, line: 91, column: 9)
!150 = !DILocation(line: 92, column: 20, scope: !149)
!151 = !DILocation(line: 94, column: 20, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !20, line: 94, column: 13)
!153 = !DILocation(line: 94, column: 18, scope: !152)
!154 = !DILocation(line: 94, column: 25, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !20, line: 94, column: 13)
!156 = !DILocation(line: 94, column: 27, scope: !155)
!157 = !DILocation(line: 94, column: 13, scope: !152)
!158 = !DILocation(line: 96, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !20, line: 95, column: 13)
!160 = !DILocation(line: 96, column: 17, scope: !159)
!161 = !DILocation(line: 96, column: 27, scope: !159)
!162 = !DILocation(line: 96, column: 34, scope: !159)
!163 = !DILocation(line: 97, column: 24, scope: !159)
!164 = !DILocation(line: 97, column: 17, scope: !159)
!165 = !DILocation(line: 97, column: 27, scope: !159)
!166 = !DILocation(line: 97, column: 34, scope: !159)
!167 = !DILocation(line: 98, column: 13, scope: !159)
!168 = !DILocation(line: 94, column: 35, scope: !155)
!169 = !DILocation(line: 94, column: 13, scope: !155)
!170 = distinct !{!170, !157, !171, !73}
!171 = !DILocation(line: 98, column: 13, scope: !152)
!172 = !DILocalVariable(name: "i", scope: !173, file: !20, line: 101, type: !48)
!173 = distinct !DILexicalBlock(scope: !146, file: !20, line: 100, column: 9)
!174 = !DILocation(line: 101, column: 20, scope: !173)
!175 = !DILocation(line: 103, column: 20, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !20, line: 103, column: 13)
!177 = !DILocation(line: 103, column: 18, scope: !176)
!178 = !DILocation(line: 103, column: 25, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !20, line: 103, column: 13)
!180 = !DILocation(line: 103, column: 27, scope: !179)
!181 = !DILocation(line: 103, column: 13, scope: !176)
!182 = !DILocation(line: 105, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !20, line: 104, column: 13)
!184 = !DILocation(line: 105, column: 22, scope: !183)
!185 = !DILocation(line: 105, column: 34, scope: !183)
!186 = !DILocation(line: 105, column: 27, scope: !183)
!187 = !DILocation(line: 106, column: 13, scope: !183)
!188 = !DILocation(line: 103, column: 35, scope: !179)
!189 = !DILocation(line: 103, column: 13, scope: !179)
!190 = distinct !{!190, !181, !191, !73}
!191 = !DILocation(line: 106, column: 13, scope: !176)
!192 = !DILocation(line: 107, column: 30, scope: !173)
!193 = !DILocation(line: 107, column: 13, scope: !173)
!194 = !DILocation(line: 110, column: 1, scope: !125)
!195 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !20, file: !20, line: 28, type: !122, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!196 = !DILocation(line: 30, column: 5, scope: !195)
!197 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 113, type: !21, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!198 = !DILocalVariable(name: "data", scope: !197, file: !20, line: 115, type: !4)
!199 = !DILocation(line: 115, column: 21, scope: !197)
!200 = !DILocalVariable(name: "dataBadBuffer", scope: !197, file: !20, line: 116, type: !4)
!201 = !DILocation(line: 116, column: 21, scope: !197)
!202 = !DILocation(line: 116, column: 54, scope: !197)
!203 = !DILocation(line: 116, column: 37, scope: !197)
!204 = !DILocalVariable(name: "dataGoodBuffer", scope: !197, file: !20, line: 117, type: !4)
!205 = !DILocation(line: 117, column: 21, scope: !197)
!206 = !DILocation(line: 117, column: 55, scope: !197)
!207 = !DILocation(line: 117, column: 38, scope: !197)
!208 = !DILocation(line: 118, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !197, file: !20, line: 118, column: 8)
!210 = !DILocation(line: 118, column: 8, scope: !197)
!211 = !DILocation(line: 121, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !20, line: 119, column: 5)
!213 = !DILocation(line: 121, column: 14, scope: !212)
!214 = !DILocation(line: 122, column: 5, scope: !212)
!215 = !DILocalVariable(name: "source", scope: !216, file: !20, line: 124, type: !42)
!216 = distinct !DILexicalBlock(scope: !197, file: !20, line: 123, column: 5)
!217 = !DILocation(line: 124, column: 23, scope: !216)
!218 = !DILocalVariable(name: "i", scope: !219, file: !20, line: 126, type: !48)
!219 = distinct !DILexicalBlock(scope: !216, file: !20, line: 125, column: 9)
!220 = !DILocation(line: 126, column: 20, scope: !219)
!221 = !DILocation(line: 128, column: 20, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !20, line: 128, column: 13)
!223 = !DILocation(line: 128, column: 18, scope: !222)
!224 = !DILocation(line: 128, column: 25, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !20, line: 128, column: 13)
!226 = !DILocation(line: 128, column: 27, scope: !225)
!227 = !DILocation(line: 128, column: 13, scope: !222)
!228 = !DILocation(line: 130, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !20, line: 129, column: 13)
!230 = !DILocation(line: 130, column: 17, scope: !229)
!231 = !DILocation(line: 130, column: 27, scope: !229)
!232 = !DILocation(line: 130, column: 34, scope: !229)
!233 = !DILocation(line: 131, column: 24, scope: !229)
!234 = !DILocation(line: 131, column: 17, scope: !229)
!235 = !DILocation(line: 131, column: 27, scope: !229)
!236 = !DILocation(line: 131, column: 34, scope: !229)
!237 = !DILocation(line: 132, column: 13, scope: !229)
!238 = !DILocation(line: 128, column: 35, scope: !225)
!239 = !DILocation(line: 128, column: 13, scope: !225)
!240 = distinct !{!240, !227, !241, !73}
!241 = !DILocation(line: 132, column: 13, scope: !222)
!242 = !DILocalVariable(name: "i", scope: !243, file: !20, line: 135, type: !48)
!243 = distinct !DILexicalBlock(scope: !216, file: !20, line: 134, column: 9)
!244 = !DILocation(line: 135, column: 20, scope: !243)
!245 = !DILocation(line: 137, column: 20, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !20, line: 137, column: 13)
!247 = !DILocation(line: 137, column: 18, scope: !246)
!248 = !DILocation(line: 137, column: 25, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !20, line: 137, column: 13)
!250 = !DILocation(line: 137, column: 27, scope: !249)
!251 = !DILocation(line: 137, column: 13, scope: !246)
!252 = !DILocation(line: 139, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !20, line: 138, column: 13)
!254 = !DILocation(line: 139, column: 22, scope: !253)
!255 = !DILocation(line: 139, column: 34, scope: !253)
!256 = !DILocation(line: 139, column: 27, scope: !253)
!257 = !DILocation(line: 140, column: 13, scope: !253)
!258 = !DILocation(line: 137, column: 35, scope: !249)
!259 = !DILocation(line: 137, column: 13, scope: !249)
!260 = distinct !{!260, !251, !261, !73}
!261 = !DILocation(line: 140, column: 13, scope: !246)
!262 = !DILocation(line: 141, column: 30, scope: !243)
!263 = !DILocation(line: 141, column: 13, scope: !243)
!264 = !DILocation(line: 144, column: 1, scope: !197)
