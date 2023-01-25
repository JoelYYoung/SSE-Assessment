; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11_bad() #0 !dbg !19 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !33
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

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11_good() #0 !dbg !97 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !121 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 400, align 16, !dbg !126
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !127
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %2 = alloca i8, i64 800, align 16, !dbg !130
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !131
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !129
  %call = call i32 (...) @globalReturnsFalse(), !dbg !132
  %tobool = icmp ne i32 %call, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !135
  br label %if.end, !dbg !137

if.else:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !138
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !150
  %cmp = icmp ult i64 %5, 100, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !156
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !157
  store i32 0, i32* %intOne, align 8, !dbg !158
  %7 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !160
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !161
  store i32 0, i32* %intTwo, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %8, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !168, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i2, align 8, !dbg !171
  br label %for.cond3, !dbg !173

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !174
  %cmp4 = icmp ult i64 %9, 100, !dbg !176
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !177

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !178
  %11 = load i64, i64* %i2, align 8, !dbg !180
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !178
  %12 = load i64, i64* %i2, align 8, !dbg !181
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !182
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !182
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !182
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !182
  br label %for.inc8, !dbg !183

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !184
  %inc9 = add i64 %15, 1, !dbg !184
  store i64 %inc9, i64* %i2, align 8, !dbg !184
  br label %for.cond3, !dbg !185, !llvm.loop !186

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !188
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !188
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !189
  ret void, !dbg !190
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !191 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !194, metadata !DIExpression()), !dbg !195
  %0 = alloca i8, i64 400, align 16, !dbg !196
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !197
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !195
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !198, metadata !DIExpression()), !dbg !199
  %2 = alloca i8, i64 800, align 16, !dbg !200
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !201
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !199
  %call = call i32 (...) @globalReturnsTrue(), !dbg !202
  %tobool = icmp ne i32 %call, 0, !dbg !202
  br i1 %tobool, label %if.then, label %if.end, !dbg !204

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !205
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !207
  br label %if.end, !dbg !208

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !209, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i64* %i, metadata !212, metadata !DIExpression()), !dbg !214
  store i64 0, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !218
  %cmp = icmp ult i64 %5, 100, !dbg !220
  br i1 %cmp, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !222
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !224
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !225
  store i32 0, i32* %intOne, align 8, !dbg !226
  %7 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !228
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !229
  store i32 0, i32* %intTwo, align 4, !dbg !230
  br label %for.inc, !dbg !231

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !232
  %inc = add i64 %8, 1, !dbg !232
  store i64 %inc, i64* %i, align 8, !dbg !232
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !236, metadata !DIExpression()), !dbg !238
  store i64 0, i64* %i2, align 8, !dbg !239
  br label %for.cond3, !dbg !241

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !242
  %cmp4 = icmp ult i64 %9, 100, !dbg !244
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !245

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !246
  %11 = load i64, i64* %i2, align 8, !dbg !248
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !246
  %12 = load i64, i64* %i2, align 8, !dbg !249
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !250
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !250
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !250
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !250
  br label %for.inc8, !dbg !251

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !252
  %inc9 = add i64 %15, 1, !dbg !252
  store i64 %inc9, i64* %i2, align 8, !dbg !252
  br label %for.cond3, !dbg !253, !llvm.loop !254

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !256
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !256
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !257
  ret void, !dbg !258
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocation(line: 26, column: 8, scope: !19)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !20, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !20, line: 33, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 33, column: 23, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !20, line: 35, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !20, line: 34, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 20, scope: !47)
!52 = !DILocation(line: 37, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !20, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !20, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 27, scope: !56)
!58 = !DILocation(line: 37, column: 13, scope: !53)
!59 = !DILocation(line: 39, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !20, line: 38, column: 13)
!61 = !DILocation(line: 39, column: 17, scope: !60)
!62 = !DILocation(line: 39, column: 27, scope: !60)
!63 = !DILocation(line: 39, column: 34, scope: !60)
!64 = !DILocation(line: 40, column: 24, scope: !60)
!65 = !DILocation(line: 40, column: 17, scope: !60)
!66 = !DILocation(line: 40, column: 27, scope: !60)
!67 = !DILocation(line: 40, column: 34, scope: !60)
!68 = !DILocation(line: 41, column: 13, scope: !60)
!69 = !DILocation(line: 37, column: 35, scope: !56)
!70 = !DILocation(line: 37, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 41, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocalVariable(name: "i", scope: !75, file: !20, line: 44, type: !48)
!75 = distinct !DILexicalBlock(scope: !41, file: !20, line: 43, column: 9)
!76 = !DILocation(line: 44, column: 20, scope: !75)
!77 = !DILocation(line: 46, column: 20, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !20, line: 46, column: 13)
!79 = !DILocation(line: 46, column: 18, scope: !78)
!80 = !DILocation(line: 46, column: 25, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !20, line: 46, column: 13)
!82 = !DILocation(line: 46, column: 27, scope: !81)
!83 = !DILocation(line: 46, column: 13, scope: !78)
!84 = !DILocation(line: 48, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !20, line: 47, column: 13)
!86 = !DILocation(line: 48, column: 22, scope: !85)
!87 = !DILocation(line: 48, column: 34, scope: !85)
!88 = !DILocation(line: 48, column: 27, scope: !85)
!89 = !DILocation(line: 49, column: 13, scope: !85)
!90 = !DILocation(line: 46, column: 35, scope: !81)
!91 = !DILocation(line: 46, column: 13, scope: !81)
!92 = distinct !{!92, !83, !93, !73}
!93 = !DILocation(line: 49, column: 13, scope: !78)
!94 = !DILocation(line: 50, column: 30, scope: !75)
!95 = !DILocation(line: 50, column: 13, scope: !75)
!96 = !DILocation(line: 53, column: 1, scope: !19)
!97 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_11_good", scope: !20, file: !20, line: 132, type: !21, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 134, column: 5, scope: !97)
!99 = !DILocation(line: 135, column: 5, scope: !97)
!100 = !DILocation(line: 136, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 148, type: !102, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!10, !10, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !20, line: 148, type: !10)
!108 = !DILocation(line: 148, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !20, line: 148, type: !104)
!110 = !DILocation(line: 148, column: 27, scope: !101)
!111 = !DILocation(line: 151, column: 22, scope: !101)
!112 = !DILocation(line: 151, column: 12, scope: !101)
!113 = !DILocation(line: 151, column: 5, scope: !101)
!114 = !DILocation(line: 153, column: 5, scope: !101)
!115 = !DILocation(line: 154, column: 5, scope: !101)
!116 = !DILocation(line: 155, column: 5, scope: !101)
!117 = !DILocation(line: 158, column: 5, scope: !101)
!118 = !DILocation(line: 159, column: 5, scope: !101)
!119 = !DILocation(line: 160, column: 5, scope: !101)
!120 = !DILocation(line: 162, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !20, line: 62, type: !4)
!123 = !DILocation(line: 62, column: 21, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !20, line: 63, type: !4)
!125 = !DILocation(line: 63, column: 21, scope: !121)
!126 = !DILocation(line: 63, column: 54, scope: !121)
!127 = !DILocation(line: 63, column: 37, scope: !121)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !20, line: 64, type: !4)
!129 = !DILocation(line: 64, column: 21, scope: !121)
!130 = !DILocation(line: 64, column: 55, scope: !121)
!131 = !DILocation(line: 64, column: 38, scope: !121)
!132 = !DILocation(line: 65, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !121, file: !20, line: 65, column: 8)
!134 = !DILocation(line: 65, column: 8, scope: !121)
!135 = !DILocation(line: 68, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !20, line: 66, column: 5)
!137 = !DILocation(line: 69, column: 5, scope: !136)
!138 = !DILocation(line: 73, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !20, line: 71, column: 5)
!140 = !DILocation(line: 73, column: 14, scope: !139)
!141 = !DILocalVariable(name: "source", scope: !142, file: !20, line: 76, type: !42)
!142 = distinct !DILexicalBlock(scope: !121, file: !20, line: 75, column: 5)
!143 = !DILocation(line: 76, column: 23, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !145, file: !20, line: 78, type: !48)
!145 = distinct !DILexicalBlock(scope: !142, file: !20, line: 77, column: 9)
!146 = !DILocation(line: 78, column: 20, scope: !145)
!147 = !DILocation(line: 80, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !20, line: 80, column: 13)
!149 = !DILocation(line: 80, column: 18, scope: !148)
!150 = !DILocation(line: 80, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !20, line: 80, column: 13)
!152 = !DILocation(line: 80, column: 27, scope: !151)
!153 = !DILocation(line: 80, column: 13, scope: !148)
!154 = !DILocation(line: 82, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !20, line: 81, column: 13)
!156 = !DILocation(line: 82, column: 17, scope: !155)
!157 = !DILocation(line: 82, column: 27, scope: !155)
!158 = !DILocation(line: 82, column: 34, scope: !155)
!159 = !DILocation(line: 83, column: 24, scope: !155)
!160 = !DILocation(line: 83, column: 17, scope: !155)
!161 = !DILocation(line: 83, column: 27, scope: !155)
!162 = !DILocation(line: 83, column: 34, scope: !155)
!163 = !DILocation(line: 84, column: 13, scope: !155)
!164 = !DILocation(line: 80, column: 35, scope: !151)
!165 = !DILocation(line: 80, column: 13, scope: !151)
!166 = distinct !{!166, !153, !167, !73}
!167 = !DILocation(line: 84, column: 13, scope: !148)
!168 = !DILocalVariable(name: "i", scope: !169, file: !20, line: 87, type: !48)
!169 = distinct !DILexicalBlock(scope: !142, file: !20, line: 86, column: 9)
!170 = !DILocation(line: 87, column: 20, scope: !169)
!171 = !DILocation(line: 89, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !20, line: 89, column: 13)
!173 = !DILocation(line: 89, column: 18, scope: !172)
!174 = !DILocation(line: 89, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !20, line: 89, column: 13)
!176 = !DILocation(line: 89, column: 27, scope: !175)
!177 = !DILocation(line: 89, column: 13, scope: !172)
!178 = !DILocation(line: 91, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !20, line: 90, column: 13)
!180 = !DILocation(line: 91, column: 22, scope: !179)
!181 = !DILocation(line: 91, column: 34, scope: !179)
!182 = !DILocation(line: 91, column: 27, scope: !179)
!183 = !DILocation(line: 92, column: 13, scope: !179)
!184 = !DILocation(line: 89, column: 35, scope: !175)
!185 = !DILocation(line: 89, column: 13, scope: !175)
!186 = distinct !{!186, !177, !187, !73}
!187 = !DILocation(line: 92, column: 13, scope: !172)
!188 = !DILocation(line: 93, column: 30, scope: !169)
!189 = !DILocation(line: 93, column: 13, scope: !169)
!190 = !DILocation(line: 96, column: 1, scope: !121)
!191 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 99, type: !21, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!192 = !DILocalVariable(name: "data", scope: !191, file: !20, line: 101, type: !4)
!193 = !DILocation(line: 101, column: 21, scope: !191)
!194 = !DILocalVariable(name: "dataBadBuffer", scope: !191, file: !20, line: 102, type: !4)
!195 = !DILocation(line: 102, column: 21, scope: !191)
!196 = !DILocation(line: 102, column: 54, scope: !191)
!197 = !DILocation(line: 102, column: 37, scope: !191)
!198 = !DILocalVariable(name: "dataGoodBuffer", scope: !191, file: !20, line: 103, type: !4)
!199 = !DILocation(line: 103, column: 21, scope: !191)
!200 = !DILocation(line: 103, column: 55, scope: !191)
!201 = !DILocation(line: 103, column: 38, scope: !191)
!202 = !DILocation(line: 104, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !191, file: !20, line: 104, column: 8)
!204 = !DILocation(line: 104, column: 8, scope: !191)
!205 = !DILocation(line: 107, column: 16, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !20, line: 105, column: 5)
!207 = !DILocation(line: 107, column: 14, scope: !206)
!208 = !DILocation(line: 108, column: 5, scope: !206)
!209 = !DILocalVariable(name: "source", scope: !210, file: !20, line: 110, type: !42)
!210 = distinct !DILexicalBlock(scope: !191, file: !20, line: 109, column: 5)
!211 = !DILocation(line: 110, column: 23, scope: !210)
!212 = !DILocalVariable(name: "i", scope: !213, file: !20, line: 112, type: !48)
!213 = distinct !DILexicalBlock(scope: !210, file: !20, line: 111, column: 9)
!214 = !DILocation(line: 112, column: 20, scope: !213)
!215 = !DILocation(line: 114, column: 20, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !20, line: 114, column: 13)
!217 = !DILocation(line: 114, column: 18, scope: !216)
!218 = !DILocation(line: 114, column: 25, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !20, line: 114, column: 13)
!220 = !DILocation(line: 114, column: 27, scope: !219)
!221 = !DILocation(line: 114, column: 13, scope: !216)
!222 = !DILocation(line: 116, column: 24, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !20, line: 115, column: 13)
!224 = !DILocation(line: 116, column: 17, scope: !223)
!225 = !DILocation(line: 116, column: 27, scope: !223)
!226 = !DILocation(line: 116, column: 34, scope: !223)
!227 = !DILocation(line: 117, column: 24, scope: !223)
!228 = !DILocation(line: 117, column: 17, scope: !223)
!229 = !DILocation(line: 117, column: 27, scope: !223)
!230 = !DILocation(line: 117, column: 34, scope: !223)
!231 = !DILocation(line: 118, column: 13, scope: !223)
!232 = !DILocation(line: 114, column: 35, scope: !219)
!233 = !DILocation(line: 114, column: 13, scope: !219)
!234 = distinct !{!234, !221, !235, !73}
!235 = !DILocation(line: 118, column: 13, scope: !216)
!236 = !DILocalVariable(name: "i", scope: !237, file: !20, line: 121, type: !48)
!237 = distinct !DILexicalBlock(scope: !210, file: !20, line: 120, column: 9)
!238 = !DILocation(line: 121, column: 20, scope: !237)
!239 = !DILocation(line: 123, column: 20, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !20, line: 123, column: 13)
!241 = !DILocation(line: 123, column: 18, scope: !240)
!242 = !DILocation(line: 123, column: 25, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !20, line: 123, column: 13)
!244 = !DILocation(line: 123, column: 27, scope: !243)
!245 = !DILocation(line: 123, column: 13, scope: !240)
!246 = !DILocation(line: 125, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !20, line: 124, column: 13)
!248 = !DILocation(line: 125, column: 22, scope: !247)
!249 = !DILocation(line: 125, column: 34, scope: !247)
!250 = !DILocation(line: 125, column: 27, scope: !247)
!251 = !DILocation(line: 126, column: 13, scope: !247)
!252 = !DILocation(line: 123, column: 35, scope: !243)
!253 = !DILocation(line: 123, column: 13, scope: !243)
!254 = distinct !{!254, !245, !255, !73}
!255 = !DILocation(line: 126, column: 13, scope: !240)
!256 = !DILocation(line: 127, column: 30, scope: !237)
!257 = !DILocation(line: 127, column: 13, scope: !237)
!258 = !DILocation(line: 130, column: 1, scope: !191)
