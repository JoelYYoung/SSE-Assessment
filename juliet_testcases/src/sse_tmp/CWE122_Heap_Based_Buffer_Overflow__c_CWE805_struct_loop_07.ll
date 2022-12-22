; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07_bad() #0 !dbg !24 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end3, !dbg !33

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !34
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !40
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !41

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !60
  %cmp4 = icmp ult i64 %3, 100, !dbg !62
  br i1 %cmp4, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !66
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !67
  store i32 0, i32* %intOne, align 8, !dbg !68
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !70
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !71
  store i32 0, i32* %intTwo, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %6, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !79, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i6, align 8, !dbg !82
  br label %for.cond7, !dbg !84

for.cond7:                                        ; preds = %for.inc12, %for.end
  %7 = load i64, i64* %i6, align 8, !dbg !85
  %cmp8 = icmp ult i64 %7, 100, !dbg !87
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !88

for.body9:                                        ; preds = %for.cond7
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %9 = load i64, i64* %i6, align 8, !dbg !91
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !89
  %10 = load i64, i64* %i6, align 8, !dbg !92
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !93
  %11 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !93
  %12 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !93
  br label %for.inc12, !dbg !94

for.inc12:                                        ; preds = %for.body9
  %13 = load i64, i64* %i6, align 8, !dbg !95
  %inc13 = add i64 %13, 1, !dbg !95
  store i64 %inc13, i64* %i6, align 8, !dbg !95
  br label %for.cond7, !dbg !96, !llvm.loop !97

for.end14:                                        ; preds = %for.cond7
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !99
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !100
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !101
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !101
  call void @free(i8* %16) #6, !dbg !102
  ret void, !dbg !103
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07_good() #0 !dbg !104 {
entry:
  call void @goodG2B1(), !dbg !105
  call void @goodG2B2(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !108 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i64 @time(i64* null) #6, !dbg !118
  %conv = trunc i64 %call to i32, !dbg !119
  call void @srand(i32 %conv) #6, !dbg !120
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !121
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07_good(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !124
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07_bad(), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  ret i32 0, !dbg !127
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !128 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %0 = load i32, i32* @staticFive, align 4, !dbg !132
  %cmp = icmp ne i32 %0, 5, !dbg !134
  br i1 %cmp, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !136
  br label %if.end3, !dbg !138

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !139
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !141
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !145
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !146

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !158
  %cmp4 = icmp ult i64 %3, 100, !dbg !160
  br i1 %cmp4, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !164
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !165
  store i32 0, i32* %intOne, align 8, !dbg !166
  %5 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !168
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !169
  store i32 0, i32* %intTwo, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %6, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !176, metadata !DIExpression()), !dbg !178
  store i64 0, i64* %i6, align 8, !dbg !179
  br label %for.cond7, !dbg !181

for.cond7:                                        ; preds = %for.inc12, %for.end
  %7 = load i64, i64* %i6, align 8, !dbg !182
  %cmp8 = icmp ult i64 %7, 100, !dbg !184
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !185

for.body9:                                        ; preds = %for.cond7
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !186
  %9 = load i64, i64* %i6, align 8, !dbg !188
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !186
  %10 = load i64, i64* %i6, align 8, !dbg !189
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !190
  %11 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !190
  %12 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !190
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !190
  br label %for.inc12, !dbg !191

for.inc12:                                        ; preds = %for.body9
  %13 = load i64, i64* %i6, align 8, !dbg !192
  %inc13 = add i64 %13, 1, !dbg !192
  store i64 %inc13, i64* %i6, align 8, !dbg !192
  br label %for.cond7, !dbg !193, !llvm.loop !194

for.end14:                                        ; preds = %for.cond7
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !196
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !197
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !198
  call void @free(i8* %16) #6, !dbg !199
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !201 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !202, metadata !DIExpression()), !dbg !203
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !204
  %0 = load i32, i32* @staticFive, align 4, !dbg !205
  %cmp = icmp eq i32 %0, 5, !dbg !207
  br i1 %cmp, label %if.then, label %if.end3, !dbg !208

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !209
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !211
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !212
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !213
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !215
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !216

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !217
  unreachable, !dbg !217

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !219

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !220, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i64* %i, metadata !223, metadata !DIExpression()), !dbg !225
  store i64 0, i64* %i, align 8, !dbg !226
  br label %for.cond, !dbg !228

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !229
  %cmp4 = icmp ult i64 %3, 100, !dbg !231
  br i1 %cmp4, label %for.body, label %for.end, !dbg !232

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !233
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !235
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !236
  store i32 0, i32* %intOne, align 8, !dbg !237
  %5 = load i64, i64* %i, align 8, !dbg !238
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !239
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !240
  store i32 0, i32* %intTwo, align 4, !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !243
  %inc = add i64 %6, 1, !dbg !243
  store i64 %inc, i64* %i, align 8, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !247, metadata !DIExpression()), !dbg !249
  store i64 0, i64* %i6, align 8, !dbg !250
  br label %for.cond7, !dbg !252

for.cond7:                                        ; preds = %for.inc12, %for.end
  %7 = load i64, i64* %i6, align 8, !dbg !253
  %cmp8 = icmp ult i64 %7, 100, !dbg !255
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !256

for.body9:                                        ; preds = %for.cond7
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !257
  %9 = load i64, i64* %i6, align 8, !dbg !259
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !257
  %10 = load i64, i64* %i6, align 8, !dbg !260
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !261
  %11 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !261
  %12 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !261
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !261
  br label %for.inc12, !dbg !262

for.inc12:                                        ; preds = %for.body9
  %13 = load i64, i64* %i6, align 8, !dbg !263
  %inc13 = add i64 %13, 1, !dbg !263
  store i64 %inc13, i64* %i6, align 8, !dbg !263
  br label %for.cond7, !dbg !264, !llvm.loop !265

for.end14:                                        ; preds = %for.cond7
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !267
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !267
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !268
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !269
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !269
  call void @free(i8* %16) #6, !dbg !270
  ret void, !dbg !271
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !17, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14, !15}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0}
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07.c", directory: "/root/SSE-Assessment")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07_bad", scope: !17, file: !17, line: 27, type: !25, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !17, line: 29, type: !6)
!28 = !DILocation(line: 29, column: 21, scope: !24)
!29 = !DILocation(line: 30, column: 10, scope: !24)
!30 = !DILocation(line: 31, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 31, column: 8)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 8, scope: !24)
!34 = !DILocation(line: 34, column: 33, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 32, column: 5)
!36 = !DILocation(line: 34, column: 16, scope: !35)
!37 = !DILocation(line: 34, column: 14, scope: !35)
!38 = !DILocation(line: 35, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !17, line: 35, column: 13)
!40 = !DILocation(line: 35, column: 18, scope: !39)
!41 = !DILocation(line: 35, column: 13, scope: !35)
!42 = !DILocation(line: 35, column: 28, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 35, column: 27)
!44 = !DILocation(line: 36, column: 5, scope: !35)
!45 = !DILocalVariable(name: "source", scope: !46, file: !17, line: 38, type: !47)
!46 = distinct !DILexicalBlock(scope: !24, file: !17, line: 37, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 38, column: 23, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !52, file: !17, line: 40, type: !53)
!52 = distinct !DILexicalBlock(scope: !46, file: !17, line: 39, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 40, column: 20, scope: !52)
!57 = !DILocation(line: 42, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !17, line: 42, column: 13)
!59 = !DILocation(line: 42, column: 18, scope: !58)
!60 = !DILocation(line: 42, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !17, line: 42, column: 13)
!62 = !DILocation(line: 42, column: 27, scope: !61)
!63 = !DILocation(line: 42, column: 13, scope: !58)
!64 = !DILocation(line: 44, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !17, line: 43, column: 13)
!66 = !DILocation(line: 44, column: 17, scope: !65)
!67 = !DILocation(line: 44, column: 27, scope: !65)
!68 = !DILocation(line: 44, column: 34, scope: !65)
!69 = !DILocation(line: 45, column: 24, scope: !65)
!70 = !DILocation(line: 45, column: 17, scope: !65)
!71 = !DILocation(line: 45, column: 27, scope: !65)
!72 = !DILocation(line: 45, column: 34, scope: !65)
!73 = !DILocation(line: 46, column: 13, scope: !65)
!74 = !DILocation(line: 42, column: 35, scope: !61)
!75 = !DILocation(line: 42, column: 13, scope: !61)
!76 = distinct !{!76, !63, !77, !78}
!77 = !DILocation(line: 46, column: 13, scope: !58)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocalVariable(name: "i", scope: !80, file: !17, line: 49, type: !53)
!80 = distinct !DILexicalBlock(scope: !46, file: !17, line: 48, column: 9)
!81 = !DILocation(line: 49, column: 20, scope: !80)
!82 = !DILocation(line: 51, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !17, line: 51, column: 13)
!84 = !DILocation(line: 51, column: 18, scope: !83)
!85 = !DILocation(line: 51, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !17, line: 51, column: 13)
!87 = !DILocation(line: 51, column: 27, scope: !86)
!88 = !DILocation(line: 51, column: 13, scope: !83)
!89 = !DILocation(line: 53, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !17, line: 52, column: 13)
!91 = !DILocation(line: 53, column: 22, scope: !90)
!92 = !DILocation(line: 53, column: 34, scope: !90)
!93 = !DILocation(line: 53, column: 27, scope: !90)
!94 = !DILocation(line: 54, column: 13, scope: !90)
!95 = !DILocation(line: 51, column: 35, scope: !86)
!96 = !DILocation(line: 51, column: 13, scope: !86)
!97 = distinct !{!97, !88, !98, !78}
!98 = !DILocation(line: 54, column: 13, scope: !83)
!99 = !DILocation(line: 55, column: 30, scope: !80)
!100 = !DILocation(line: 55, column: 13, scope: !80)
!101 = !DILocation(line: 56, column: 18, scope: !80)
!102 = !DILocation(line: 56, column: 13, scope: !80)
!103 = !DILocation(line: 59, column: 1, scope: !24)
!104 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_07_good", scope: !17, file: !17, line: 140, type: !25, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocation(line: 142, column: 5, scope: !104)
!106 = !DILocation(line: 143, column: 5, scope: !104)
!107 = !DILocation(line: 144, column: 1, scope: !104)
!108 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 156, type: !109, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DISubroutineType(types: !110)
!110 = !{!12, !12, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!114 = !DILocalVariable(name: "argc", arg: 1, scope: !108, file: !17, line: 156, type: !12)
!115 = !DILocation(line: 156, column: 14, scope: !108)
!116 = !DILocalVariable(name: "argv", arg: 2, scope: !108, file: !17, line: 156, type: !111)
!117 = !DILocation(line: 156, column: 27, scope: !108)
!118 = !DILocation(line: 159, column: 22, scope: !108)
!119 = !DILocation(line: 159, column: 12, scope: !108)
!120 = !DILocation(line: 159, column: 5, scope: !108)
!121 = !DILocation(line: 161, column: 5, scope: !108)
!122 = !DILocation(line: 162, column: 5, scope: !108)
!123 = !DILocation(line: 163, column: 5, scope: !108)
!124 = !DILocation(line: 166, column: 5, scope: !108)
!125 = !DILocation(line: 167, column: 5, scope: !108)
!126 = !DILocation(line: 168, column: 5, scope: !108)
!127 = !DILocation(line: 170, column: 5, scope: !108)
!128 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 66, type: !25, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !17, line: 68, type: !6)
!130 = !DILocation(line: 68, column: 21, scope: !128)
!131 = !DILocation(line: 69, column: 10, scope: !128)
!132 = !DILocation(line: 70, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !17, line: 70, column: 8)
!134 = !DILocation(line: 70, column: 18, scope: !133)
!135 = !DILocation(line: 70, column: 8, scope: !128)
!136 = !DILocation(line: 73, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !17, line: 71, column: 5)
!138 = !DILocation(line: 74, column: 5, scope: !137)
!139 = !DILocation(line: 78, column: 33, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !17, line: 76, column: 5)
!141 = !DILocation(line: 78, column: 16, scope: !140)
!142 = !DILocation(line: 78, column: 14, scope: !140)
!143 = !DILocation(line: 79, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 79, column: 13)
!145 = !DILocation(line: 79, column: 18, scope: !144)
!146 = !DILocation(line: 79, column: 13, scope: !140)
!147 = !DILocation(line: 79, column: 28, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !17, line: 79, column: 27)
!149 = !DILocalVariable(name: "source", scope: !150, file: !17, line: 82, type: !47)
!150 = distinct !DILexicalBlock(scope: !128, file: !17, line: 81, column: 5)
!151 = !DILocation(line: 82, column: 23, scope: !150)
!152 = !DILocalVariable(name: "i", scope: !153, file: !17, line: 84, type: !53)
!153 = distinct !DILexicalBlock(scope: !150, file: !17, line: 83, column: 9)
!154 = !DILocation(line: 84, column: 20, scope: !153)
!155 = !DILocation(line: 86, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !17, line: 86, column: 13)
!157 = !DILocation(line: 86, column: 18, scope: !156)
!158 = !DILocation(line: 86, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !17, line: 86, column: 13)
!160 = !DILocation(line: 86, column: 27, scope: !159)
!161 = !DILocation(line: 86, column: 13, scope: !156)
!162 = !DILocation(line: 88, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !17, line: 87, column: 13)
!164 = !DILocation(line: 88, column: 17, scope: !163)
!165 = !DILocation(line: 88, column: 27, scope: !163)
!166 = !DILocation(line: 88, column: 34, scope: !163)
!167 = !DILocation(line: 89, column: 24, scope: !163)
!168 = !DILocation(line: 89, column: 17, scope: !163)
!169 = !DILocation(line: 89, column: 27, scope: !163)
!170 = !DILocation(line: 89, column: 34, scope: !163)
!171 = !DILocation(line: 90, column: 13, scope: !163)
!172 = !DILocation(line: 86, column: 35, scope: !159)
!173 = !DILocation(line: 86, column: 13, scope: !159)
!174 = distinct !{!174, !161, !175, !78}
!175 = !DILocation(line: 90, column: 13, scope: !156)
!176 = !DILocalVariable(name: "i", scope: !177, file: !17, line: 93, type: !53)
!177 = distinct !DILexicalBlock(scope: !150, file: !17, line: 92, column: 9)
!178 = !DILocation(line: 93, column: 20, scope: !177)
!179 = !DILocation(line: 95, column: 20, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !17, line: 95, column: 13)
!181 = !DILocation(line: 95, column: 18, scope: !180)
!182 = !DILocation(line: 95, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !17, line: 95, column: 13)
!184 = !DILocation(line: 95, column: 27, scope: !183)
!185 = !DILocation(line: 95, column: 13, scope: !180)
!186 = !DILocation(line: 97, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !17, line: 96, column: 13)
!188 = !DILocation(line: 97, column: 22, scope: !187)
!189 = !DILocation(line: 97, column: 34, scope: !187)
!190 = !DILocation(line: 97, column: 27, scope: !187)
!191 = !DILocation(line: 98, column: 13, scope: !187)
!192 = !DILocation(line: 95, column: 35, scope: !183)
!193 = !DILocation(line: 95, column: 13, scope: !183)
!194 = distinct !{!194, !185, !195, !78}
!195 = !DILocation(line: 98, column: 13, scope: !180)
!196 = !DILocation(line: 99, column: 30, scope: !177)
!197 = !DILocation(line: 99, column: 13, scope: !177)
!198 = !DILocation(line: 100, column: 18, scope: !177)
!199 = !DILocation(line: 100, column: 13, scope: !177)
!200 = !DILocation(line: 103, column: 1, scope: !128)
!201 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 106, type: !25, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocalVariable(name: "data", scope: !201, file: !17, line: 108, type: !6)
!203 = !DILocation(line: 108, column: 21, scope: !201)
!204 = !DILocation(line: 109, column: 10, scope: !201)
!205 = !DILocation(line: 110, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !17, line: 110, column: 8)
!207 = !DILocation(line: 110, column: 18, scope: !206)
!208 = !DILocation(line: 110, column: 8, scope: !201)
!209 = !DILocation(line: 113, column: 33, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !17, line: 111, column: 5)
!211 = !DILocation(line: 113, column: 16, scope: !210)
!212 = !DILocation(line: 113, column: 14, scope: !210)
!213 = !DILocation(line: 114, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !17, line: 114, column: 13)
!215 = !DILocation(line: 114, column: 18, scope: !214)
!216 = !DILocation(line: 114, column: 13, scope: !210)
!217 = !DILocation(line: 114, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !17, line: 114, column: 27)
!219 = !DILocation(line: 115, column: 5, scope: !210)
!220 = !DILocalVariable(name: "source", scope: !221, file: !17, line: 117, type: !47)
!221 = distinct !DILexicalBlock(scope: !201, file: !17, line: 116, column: 5)
!222 = !DILocation(line: 117, column: 23, scope: !221)
!223 = !DILocalVariable(name: "i", scope: !224, file: !17, line: 119, type: !53)
!224 = distinct !DILexicalBlock(scope: !221, file: !17, line: 118, column: 9)
!225 = !DILocation(line: 119, column: 20, scope: !224)
!226 = !DILocation(line: 121, column: 20, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !17, line: 121, column: 13)
!228 = !DILocation(line: 121, column: 18, scope: !227)
!229 = !DILocation(line: 121, column: 25, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !17, line: 121, column: 13)
!231 = !DILocation(line: 121, column: 27, scope: !230)
!232 = !DILocation(line: 121, column: 13, scope: !227)
!233 = !DILocation(line: 123, column: 24, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !17, line: 122, column: 13)
!235 = !DILocation(line: 123, column: 17, scope: !234)
!236 = !DILocation(line: 123, column: 27, scope: !234)
!237 = !DILocation(line: 123, column: 34, scope: !234)
!238 = !DILocation(line: 124, column: 24, scope: !234)
!239 = !DILocation(line: 124, column: 17, scope: !234)
!240 = !DILocation(line: 124, column: 27, scope: !234)
!241 = !DILocation(line: 124, column: 34, scope: !234)
!242 = !DILocation(line: 125, column: 13, scope: !234)
!243 = !DILocation(line: 121, column: 35, scope: !230)
!244 = !DILocation(line: 121, column: 13, scope: !230)
!245 = distinct !{!245, !232, !246, !78}
!246 = !DILocation(line: 125, column: 13, scope: !227)
!247 = !DILocalVariable(name: "i", scope: !248, file: !17, line: 128, type: !53)
!248 = distinct !DILexicalBlock(scope: !221, file: !17, line: 127, column: 9)
!249 = !DILocation(line: 128, column: 20, scope: !248)
!250 = !DILocation(line: 130, column: 20, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !17, line: 130, column: 13)
!252 = !DILocation(line: 130, column: 18, scope: !251)
!253 = !DILocation(line: 130, column: 25, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !17, line: 130, column: 13)
!255 = !DILocation(line: 130, column: 27, scope: !254)
!256 = !DILocation(line: 130, column: 13, scope: !251)
!257 = !DILocation(line: 132, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !17, line: 131, column: 13)
!259 = !DILocation(line: 132, column: 22, scope: !258)
!260 = !DILocation(line: 132, column: 34, scope: !258)
!261 = !DILocation(line: 132, column: 27, scope: !258)
!262 = !DILocation(line: 133, column: 13, scope: !258)
!263 = !DILocation(line: 130, column: 35, scope: !254)
!264 = !DILocation(line: 130, column: 13, scope: !254)
!265 = distinct !{!265, !256, !266, !78}
!266 = !DILocation(line: 133, column: 13, scope: !251)
!267 = !DILocation(line: 134, column: 30, scope: !248)
!268 = !DILocation(line: 134, column: 13, scope: !248)
!269 = !DILocation(line: 135, column: 18, scope: !248)
!270 = !DILocation(line: 135, column: 13, scope: !248)
!271 = !DILocation(line: 138, column: 1, scope: !201)
