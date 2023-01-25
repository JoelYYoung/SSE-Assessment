; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !31
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !38

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !57
  %cmp4 = icmp ult i64 %3, 100, !dbg !59
  br i1 %cmp4, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %6, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i6, align 8, !dbg !79
  br label %for.cond7, !dbg !81

for.cond7:                                        ; preds = %for.inc12, %for.end
  %7 = load i64, i64* %i6, align 8, !dbg !82
  %cmp8 = icmp ult i64 %7, 100, !dbg !84
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !85

for.body9:                                        ; preds = %for.cond7
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %9 = load i64, i64* %i6, align 8, !dbg !88
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !86
  %10 = load i64, i64* %i6, align 8, !dbg !89
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !90
  %11 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !90
  %12 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !90
  br label %for.inc12, !dbg !91

for.inc12:                                        ; preds = %for.body9
  %13 = load i64, i64* %i6, align 8, !dbg !92
  %inc13 = add i64 %13, 1, !dbg !92
  store i64 %inc13, i64* %i6, align 8, !dbg !92
  br label %for.cond7, !dbg !93, !llvm.loop !94

for.end14:                                        ; preds = %for.cond7
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !96
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !97
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !98
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !98
  call void @free(i8* %16) #6, !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13_good() #0 !dbg !101 {
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
  %call = call i64 @time(i64* null) #6, !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 %conv) #6, !dbg !117
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !118
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13_good(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13_bad(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !125 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !129
  %cmp = icmp ne i32 %0, 5, !dbg !131
  br i1 %cmp, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !133
  br label %if.end3, !dbg !135

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !136
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !138
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !142
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !143

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !155
  %cmp4 = icmp ult i64 %3, 100, !dbg !157
  br i1 %cmp4, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !161
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !162
  store i32 0, i32* %intOne, align 8, !dbg !163
  %5 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !165
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !166
  store i32 0, i32* %intTwo, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %6, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !173, metadata !DIExpression()), !dbg !175
  store i64 0, i64* %i6, align 8, !dbg !176
  br label %for.cond7, !dbg !178

for.cond7:                                        ; preds = %for.inc12, %for.end
  %7 = load i64, i64* %i6, align 8, !dbg !179
  %cmp8 = icmp ult i64 %7, 100, !dbg !181
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !182

for.body9:                                        ; preds = %for.cond7
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %9 = load i64, i64* %i6, align 8, !dbg !185
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !183
  %10 = load i64, i64* %i6, align 8, !dbg !186
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !187
  %11 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !187
  %12 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !187
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !187
  br label %for.inc12, !dbg !188

for.inc12:                                        ; preds = %for.body9
  %13 = load i64, i64* %i6, align 8, !dbg !189
  %inc13 = add i64 %13, 1, !dbg !189
  store i64 %inc13, i64* %i6, align 8, !dbg !189
  br label %for.cond7, !dbg !190, !llvm.loop !191

for.end14:                                        ; preds = %for.cond7
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !193
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !193
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !194
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !195
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !195
  call void @free(i8* %16) #6, !dbg !196
  ret void, !dbg !197
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !198 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !199, metadata !DIExpression()), !dbg !200
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !201
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !202
  %cmp = icmp eq i32 %0, 5, !dbg !204
  br i1 %cmp, label %if.then, label %if.end3, !dbg !205

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !206
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !208
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !209
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !210
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !212
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !213

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !214
  unreachable, !dbg !214

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !216

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !217, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i64* %i, metadata !220, metadata !DIExpression()), !dbg !222
  store i64 0, i64* %i, align 8, !dbg !223
  br label %for.cond, !dbg !225

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !226
  %cmp4 = icmp ult i64 %3, 100, !dbg !228
  br i1 %cmp4, label %for.body, label %for.end, !dbg !229

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !230
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !232
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !233
  store i32 0, i32* %intOne, align 8, !dbg !234
  %5 = load i64, i64* %i, align 8, !dbg !235
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !236
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !237
  store i32 0, i32* %intTwo, align 4, !dbg !238
  br label %for.inc, !dbg !239

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !240
  %inc = add i64 %6, 1, !dbg !240
  store i64 %inc, i64* %i, align 8, !dbg !240
  br label %for.cond, !dbg !241, !llvm.loop !242

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !244, metadata !DIExpression()), !dbg !246
  store i64 0, i64* %i6, align 8, !dbg !247
  br label %for.cond7, !dbg !249

for.cond7:                                        ; preds = %for.inc12, %for.end
  %7 = load i64, i64* %i6, align 8, !dbg !250
  %cmp8 = icmp ult i64 %7, 100, !dbg !252
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !253

for.body9:                                        ; preds = %for.cond7
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !254
  %9 = load i64, i64* %i6, align 8, !dbg !256
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !254
  %10 = load i64, i64* %i6, align 8, !dbg !257
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !258
  %11 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !258
  %12 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !258
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !258
  br label %for.inc12, !dbg !259

for.inc12:                                        ; preds = %for.body9
  %13 = load i64, i64* %i6, align 8, !dbg !260
  %inc13 = add i64 %13, 1, !dbg !260
  store i64 %inc13, i64* %i6, align 8, !dbg !260
  br label %for.cond7, !dbg !261, !llvm.loop !262

for.end14:                                        ; preds = %for.cond7
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !264
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !264
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !265
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !266
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !266
  call void @free(i8* %16) #6, !dbg !267
  ret void, !dbg !268
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 25, column: 8)
!29 = !DILocation(line: 25, column: 25, scope: !28)
!30 = !DILocation(line: 25, column: 8, scope: !20)
!31 = !DILocation(line: 28, column: 33, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !21, line: 26, column: 5)
!33 = !DILocation(line: 28, column: 16, scope: !32)
!34 = !DILocation(line: 28, column: 14, scope: !32)
!35 = !DILocation(line: 29, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !21, line: 29, column: 13)
!37 = !DILocation(line: 29, column: 18, scope: !36)
!38 = !DILocation(line: 29, column: 13, scope: !32)
!39 = !DILocation(line: 29, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !21, line: 29, column: 27)
!41 = !DILocation(line: 30, column: 5, scope: !32)
!42 = !DILocalVariable(name: "source", scope: !43, file: !21, line: 32, type: !44)
!43 = distinct !DILexicalBlock(scope: !20, file: !21, line: 31, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 32, column: 23, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !49, file: !21, line: 34, type: !50)
!49 = distinct !DILexicalBlock(scope: !43, file: !21, line: 33, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 34, column: 20, scope: !49)
!54 = !DILocation(line: 36, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !21, line: 36, column: 13)
!56 = !DILocation(line: 36, column: 18, scope: !55)
!57 = !DILocation(line: 36, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !21, line: 36, column: 13)
!59 = !DILocation(line: 36, column: 27, scope: !58)
!60 = !DILocation(line: 36, column: 13, scope: !55)
!61 = !DILocation(line: 38, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !21, line: 37, column: 13)
!63 = !DILocation(line: 38, column: 17, scope: !62)
!64 = !DILocation(line: 38, column: 27, scope: !62)
!65 = !DILocation(line: 38, column: 34, scope: !62)
!66 = !DILocation(line: 39, column: 24, scope: !62)
!67 = !DILocation(line: 39, column: 17, scope: !62)
!68 = !DILocation(line: 39, column: 27, scope: !62)
!69 = !DILocation(line: 39, column: 34, scope: !62)
!70 = !DILocation(line: 40, column: 13, scope: !62)
!71 = !DILocation(line: 36, column: 35, scope: !58)
!72 = !DILocation(line: 36, column: 13, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 40, column: 13, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocalVariable(name: "i", scope: !77, file: !21, line: 43, type: !50)
!77 = distinct !DILexicalBlock(scope: !43, file: !21, line: 42, column: 9)
!78 = !DILocation(line: 43, column: 20, scope: !77)
!79 = !DILocation(line: 45, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !21, line: 45, column: 13)
!81 = !DILocation(line: 45, column: 18, scope: !80)
!82 = !DILocation(line: 45, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !21, line: 45, column: 13)
!84 = !DILocation(line: 45, column: 27, scope: !83)
!85 = !DILocation(line: 45, column: 13, scope: !80)
!86 = !DILocation(line: 47, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !21, line: 46, column: 13)
!88 = !DILocation(line: 47, column: 22, scope: !87)
!89 = !DILocation(line: 47, column: 34, scope: !87)
!90 = !DILocation(line: 47, column: 27, scope: !87)
!91 = !DILocation(line: 48, column: 13, scope: !87)
!92 = !DILocation(line: 45, column: 35, scope: !83)
!93 = !DILocation(line: 45, column: 13, scope: !83)
!94 = distinct !{!94, !85, !95, !75}
!95 = !DILocation(line: 48, column: 13, scope: !80)
!96 = !DILocation(line: 49, column: 30, scope: !77)
!97 = !DILocation(line: 49, column: 13, scope: !77)
!98 = !DILocation(line: 50, column: 18, scope: !77)
!99 = !DILocation(line: 50, column: 13, scope: !77)
!100 = !DILocation(line: 53, column: 1, scope: !20)
!101 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_13_good", scope: !21, file: !21, line: 134, type: !22, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 136, column: 5, scope: !101)
!103 = !DILocation(line: 137, column: 5, scope: !101)
!104 = !DILocation(line: 138, column: 1, scope: !101)
!105 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 150, type: !106, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DISubroutineType(types: !107)
!107 = !{!10, !10, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !21, line: 150, type: !10)
!112 = !DILocation(line: 150, column: 14, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !21, line: 150, type: !108)
!114 = !DILocation(line: 150, column: 27, scope: !105)
!115 = !DILocation(line: 153, column: 22, scope: !105)
!116 = !DILocation(line: 153, column: 12, scope: !105)
!117 = !DILocation(line: 153, column: 5, scope: !105)
!118 = !DILocation(line: 155, column: 5, scope: !105)
!119 = !DILocation(line: 156, column: 5, scope: !105)
!120 = !DILocation(line: 157, column: 5, scope: !105)
!121 = !DILocation(line: 160, column: 5, scope: !105)
!122 = !DILocation(line: 161, column: 5, scope: !105)
!123 = !DILocation(line: 162, column: 5, scope: !105)
!124 = !DILocation(line: 164, column: 5, scope: !105)
!125 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !21, line: 62, type: !4)
!127 = !DILocation(line: 62, column: 21, scope: !125)
!128 = !DILocation(line: 63, column: 10, scope: !125)
!129 = !DILocation(line: 64, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !21, line: 64, column: 8)
!131 = !DILocation(line: 64, column: 25, scope: !130)
!132 = !DILocation(line: 64, column: 8, scope: !125)
!133 = !DILocation(line: 67, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !21, line: 65, column: 5)
!135 = !DILocation(line: 68, column: 5, scope: !134)
!136 = !DILocation(line: 72, column: 33, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !21, line: 70, column: 5)
!138 = !DILocation(line: 72, column: 16, scope: !137)
!139 = !DILocation(line: 72, column: 14, scope: !137)
!140 = !DILocation(line: 73, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !21, line: 73, column: 13)
!142 = !DILocation(line: 73, column: 18, scope: !141)
!143 = !DILocation(line: 73, column: 13, scope: !137)
!144 = !DILocation(line: 73, column: 28, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !21, line: 73, column: 27)
!146 = !DILocalVariable(name: "source", scope: !147, file: !21, line: 76, type: !44)
!147 = distinct !DILexicalBlock(scope: !125, file: !21, line: 75, column: 5)
!148 = !DILocation(line: 76, column: 23, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !21, line: 78, type: !50)
!150 = distinct !DILexicalBlock(scope: !147, file: !21, line: 77, column: 9)
!151 = !DILocation(line: 78, column: 20, scope: !150)
!152 = !DILocation(line: 80, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !21, line: 80, column: 13)
!154 = !DILocation(line: 80, column: 18, scope: !153)
!155 = !DILocation(line: 80, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !21, line: 80, column: 13)
!157 = !DILocation(line: 80, column: 27, scope: !156)
!158 = !DILocation(line: 80, column: 13, scope: !153)
!159 = !DILocation(line: 82, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !21, line: 81, column: 13)
!161 = !DILocation(line: 82, column: 17, scope: !160)
!162 = !DILocation(line: 82, column: 27, scope: !160)
!163 = !DILocation(line: 82, column: 34, scope: !160)
!164 = !DILocation(line: 83, column: 24, scope: !160)
!165 = !DILocation(line: 83, column: 17, scope: !160)
!166 = !DILocation(line: 83, column: 27, scope: !160)
!167 = !DILocation(line: 83, column: 34, scope: !160)
!168 = !DILocation(line: 84, column: 13, scope: !160)
!169 = !DILocation(line: 80, column: 35, scope: !156)
!170 = !DILocation(line: 80, column: 13, scope: !156)
!171 = distinct !{!171, !158, !172, !75}
!172 = !DILocation(line: 84, column: 13, scope: !153)
!173 = !DILocalVariable(name: "i", scope: !174, file: !21, line: 87, type: !50)
!174 = distinct !DILexicalBlock(scope: !147, file: !21, line: 86, column: 9)
!175 = !DILocation(line: 87, column: 20, scope: !174)
!176 = !DILocation(line: 89, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !21, line: 89, column: 13)
!178 = !DILocation(line: 89, column: 18, scope: !177)
!179 = !DILocation(line: 89, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !21, line: 89, column: 13)
!181 = !DILocation(line: 89, column: 27, scope: !180)
!182 = !DILocation(line: 89, column: 13, scope: !177)
!183 = !DILocation(line: 91, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !21, line: 90, column: 13)
!185 = !DILocation(line: 91, column: 22, scope: !184)
!186 = !DILocation(line: 91, column: 34, scope: !184)
!187 = !DILocation(line: 91, column: 27, scope: !184)
!188 = !DILocation(line: 92, column: 13, scope: !184)
!189 = !DILocation(line: 89, column: 35, scope: !180)
!190 = !DILocation(line: 89, column: 13, scope: !180)
!191 = distinct !{!191, !182, !192, !75}
!192 = !DILocation(line: 92, column: 13, scope: !177)
!193 = !DILocation(line: 93, column: 30, scope: !174)
!194 = !DILocation(line: 93, column: 13, scope: !174)
!195 = !DILocation(line: 94, column: 18, scope: !174)
!196 = !DILocation(line: 94, column: 13, scope: !174)
!197 = !DILocation(line: 97, column: 1, scope: !125)
!198 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 100, type: !22, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!199 = !DILocalVariable(name: "data", scope: !198, file: !21, line: 102, type: !4)
!200 = !DILocation(line: 102, column: 21, scope: !198)
!201 = !DILocation(line: 103, column: 10, scope: !198)
!202 = !DILocation(line: 104, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !21, line: 104, column: 8)
!204 = !DILocation(line: 104, column: 25, scope: !203)
!205 = !DILocation(line: 104, column: 8, scope: !198)
!206 = !DILocation(line: 107, column: 33, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !21, line: 105, column: 5)
!208 = !DILocation(line: 107, column: 16, scope: !207)
!209 = !DILocation(line: 107, column: 14, scope: !207)
!210 = !DILocation(line: 108, column: 13, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !21, line: 108, column: 13)
!212 = !DILocation(line: 108, column: 18, scope: !211)
!213 = !DILocation(line: 108, column: 13, scope: !207)
!214 = !DILocation(line: 108, column: 28, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !21, line: 108, column: 27)
!216 = !DILocation(line: 109, column: 5, scope: !207)
!217 = !DILocalVariable(name: "source", scope: !218, file: !21, line: 111, type: !44)
!218 = distinct !DILexicalBlock(scope: !198, file: !21, line: 110, column: 5)
!219 = !DILocation(line: 111, column: 23, scope: !218)
!220 = !DILocalVariable(name: "i", scope: !221, file: !21, line: 113, type: !50)
!221 = distinct !DILexicalBlock(scope: !218, file: !21, line: 112, column: 9)
!222 = !DILocation(line: 113, column: 20, scope: !221)
!223 = !DILocation(line: 115, column: 20, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !21, line: 115, column: 13)
!225 = !DILocation(line: 115, column: 18, scope: !224)
!226 = !DILocation(line: 115, column: 25, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !21, line: 115, column: 13)
!228 = !DILocation(line: 115, column: 27, scope: !227)
!229 = !DILocation(line: 115, column: 13, scope: !224)
!230 = !DILocation(line: 117, column: 24, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !21, line: 116, column: 13)
!232 = !DILocation(line: 117, column: 17, scope: !231)
!233 = !DILocation(line: 117, column: 27, scope: !231)
!234 = !DILocation(line: 117, column: 34, scope: !231)
!235 = !DILocation(line: 118, column: 24, scope: !231)
!236 = !DILocation(line: 118, column: 17, scope: !231)
!237 = !DILocation(line: 118, column: 27, scope: !231)
!238 = !DILocation(line: 118, column: 34, scope: !231)
!239 = !DILocation(line: 119, column: 13, scope: !231)
!240 = !DILocation(line: 115, column: 35, scope: !227)
!241 = !DILocation(line: 115, column: 13, scope: !227)
!242 = distinct !{!242, !229, !243, !75}
!243 = !DILocation(line: 119, column: 13, scope: !224)
!244 = !DILocalVariable(name: "i", scope: !245, file: !21, line: 122, type: !50)
!245 = distinct !DILexicalBlock(scope: !218, file: !21, line: 121, column: 9)
!246 = !DILocation(line: 122, column: 20, scope: !245)
!247 = !DILocation(line: 124, column: 20, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !21, line: 124, column: 13)
!249 = !DILocation(line: 124, column: 18, scope: !248)
!250 = !DILocation(line: 124, column: 25, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !21, line: 124, column: 13)
!252 = !DILocation(line: 124, column: 27, scope: !251)
!253 = !DILocation(line: 124, column: 13, scope: !248)
!254 = !DILocation(line: 126, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !21, line: 125, column: 13)
!256 = !DILocation(line: 126, column: 22, scope: !255)
!257 = !DILocation(line: 126, column: 34, scope: !255)
!258 = !DILocation(line: 126, column: 27, scope: !255)
!259 = !DILocation(line: 127, column: 13, scope: !255)
!260 = !DILocation(line: 124, column: 35, scope: !251)
!261 = !DILocation(line: 124, column: 13, scope: !251)
!262 = distinct !{!262, !253, !263, !75}
!263 = !DILocation(line: 127, column: 13, scope: !248)
!264 = !DILocation(line: 128, column: 30, scope: !245)
!265 = !DILocation(line: 128, column: 13, scope: !245)
!266 = !DILocation(line: 129, column: 18, scope: !245)
!267 = !DILocation(line: 129, column: 13, scope: !245)
!268 = !DILocation(line: 132, column: 1, scope: !198)
