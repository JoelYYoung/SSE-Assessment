; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !17
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05_bad() #0 !dbg !26 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end2, !dbg !34

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !35
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !41
  br i1 %cmp, label %if.then1, label %if.end, !dbg !42

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !45

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !61
  %cmp3 = icmp ult i64 %3, 100, !dbg !63
  br i1 %cmp3, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !67
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !68
  store i32 0, i32* %intOne, align 8, !dbg !69
  %5 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !71
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !72
  store i32 0, i32* %intTwo, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %6, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i5, align 8, !dbg !83
  br label %for.cond6, !dbg !85

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i64, i64* %i5, align 8, !dbg !86
  %cmp7 = icmp ult i64 %7, 100, !dbg !88
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !89

for.body8:                                        ; preds = %for.cond6
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !90
  %9 = load i64, i64* %i5, align 8, !dbg !92
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !90
  %10 = load i64, i64* %i5, align 8, !dbg !93
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !94
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !94
  %12 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !94
  br label %for.inc11, !dbg !95

for.inc11:                                        ; preds = %for.body8
  %13 = load i64, i64* %i5, align 8, !dbg !96
  %inc12 = add i64 %13, 1, !dbg !96
  store i64 %inc12, i64* %i5, align 8, !dbg !96
  br label %for.cond6, !dbg !97, !llvm.loop !98

for.end13:                                        ; preds = %for.cond6
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !100
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !100
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !101
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !102
  call void @free(i8* %16) #6, !dbg !103
  ret void, !dbg !104
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05_good() #0 !dbg !105 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !129 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %0 = load i32, i32* @staticFalse, align 4, !dbg !133
  %tobool = icmp ne i32 %0, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !136
  br label %if.end2, !dbg !138

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !139
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !141
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !145
  br i1 %cmp, label %if.then1, label %if.end, !dbg !146

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !158
  %cmp3 = icmp ult i64 %3, 100, !dbg !160
  br i1 %cmp3, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !164
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !165
  store i32 0, i32* %intOne, align 8, !dbg !166
  %5 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !168
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !169
  store i32 0, i32* %intTwo, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %6, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !176, metadata !DIExpression()), !dbg !178
  store i64 0, i64* %i5, align 8, !dbg !179
  br label %for.cond6, !dbg !181

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i64, i64* %i5, align 8, !dbg !182
  %cmp7 = icmp ult i64 %7, 100, !dbg !184
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !185

for.body8:                                        ; preds = %for.cond6
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !186
  %9 = load i64, i64* %i5, align 8, !dbg !188
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !186
  %10 = load i64, i64* %i5, align 8, !dbg !189
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !190
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !190
  %12 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !190
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !190
  br label %for.inc11, !dbg !191

for.inc11:                                        ; preds = %for.body8
  %13 = load i64, i64* %i5, align 8, !dbg !192
  %inc12 = add i64 %13, 1, !dbg !192
  store i64 %inc12, i64* %i5, align 8, !dbg !192
  br label %for.cond6, !dbg !193, !llvm.loop !194

for.end13:                                        ; preds = %for.cond6
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !196
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !197
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
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !202, metadata !DIExpression()), !dbg !203
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !204
  %0 = load i32, i32* @staticTrue, align 4, !dbg !205
  %tobool = icmp ne i32 %0, 0, !dbg !205
  br i1 %tobool, label %if.then, label %if.end2, !dbg !207

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !208
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !210
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !211
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !212
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !214
  br i1 %cmp, label %if.then1, label %if.end, !dbg !215

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !216
  unreachable, !dbg !216

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !218

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata i64* %i, metadata !222, metadata !DIExpression()), !dbg !224
  store i64 0, i64* %i, align 8, !dbg !225
  br label %for.cond, !dbg !227

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !228
  %cmp3 = icmp ult i64 %3, 100, !dbg !230
  br i1 %cmp3, label %for.body, label %for.end, !dbg !231

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !232
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !234
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !235
  store i32 0, i32* %intOne, align 8, !dbg !236
  %5 = load i64, i64* %i, align 8, !dbg !237
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !238
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !239
  store i32 0, i32* %intTwo, align 4, !dbg !240
  br label %for.inc, !dbg !241

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !242
  %inc = add i64 %6, 1, !dbg !242
  store i64 %inc, i64* %i, align 8, !dbg !242
  br label %for.cond, !dbg !243, !llvm.loop !244

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !246, metadata !DIExpression()), !dbg !248
  store i64 0, i64* %i5, align 8, !dbg !249
  br label %for.cond6, !dbg !251

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i64, i64* %i5, align 8, !dbg !252
  %cmp7 = icmp ult i64 %7, 100, !dbg !254
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !255

for.body8:                                        ; preds = %for.cond6
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !256
  %9 = load i64, i64* %i5, align 8, !dbg !258
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !256
  %10 = load i64, i64* %i5, align 8, !dbg !259
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !260
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !260
  %12 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !260
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !260
  br label %for.inc11, !dbg !261

for.inc11:                                        ; preds = %for.body8
  %13 = load i64, i64* %i5, align 8, !dbg !262
  %inc12 = add i64 %13, 1, !dbg !262
  store i64 %inc12, i64* %i5, align 8, !dbg !262
  br label %for.cond6, !dbg !263, !llvm.loop !264

for.end13:                                        ; preds = %for.cond6
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !266
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !266
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !267
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !268
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !268
  call void @free(i8* %16) #6, !dbg !269
  ret void, !dbg !270
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
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !19, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14, !15}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0, !17}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !19, line: 24, type: !12, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05_bad", scope: !19, file: !19, line: 28, type: !27, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !19, line: 30, type: !6)
!30 = !DILocation(line: 30, column: 21, scope: !26)
!31 = !DILocation(line: 31, column: 10, scope: !26)
!32 = !DILocation(line: 32, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !19, line: 32, column: 8)
!34 = !DILocation(line: 32, column: 8, scope: !26)
!35 = !DILocation(line: 35, column: 33, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !19, line: 33, column: 5)
!37 = !DILocation(line: 35, column: 16, scope: !36)
!38 = !DILocation(line: 35, column: 14, scope: !36)
!39 = !DILocation(line: 36, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 36, column: 13)
!41 = !DILocation(line: 36, column: 18, scope: !40)
!42 = !DILocation(line: 36, column: 13, scope: !36)
!43 = !DILocation(line: 36, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 36, column: 27)
!45 = !DILocation(line: 37, column: 5, scope: !36)
!46 = !DILocalVariable(name: "source", scope: !47, file: !19, line: 39, type: !48)
!47 = distinct !DILexicalBlock(scope: !26, file: !19, line: 38, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 39, column: 23, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !53, file: !19, line: 41, type: !54)
!53 = distinct !DILexicalBlock(scope: !47, file: !19, line: 40, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 41, column: 20, scope: !53)
!58 = !DILocation(line: 43, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !19, line: 43, column: 13)
!60 = !DILocation(line: 43, column: 18, scope: !59)
!61 = !DILocation(line: 43, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !19, line: 43, column: 13)
!63 = !DILocation(line: 43, column: 27, scope: !62)
!64 = !DILocation(line: 43, column: 13, scope: !59)
!65 = !DILocation(line: 45, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !19, line: 44, column: 13)
!67 = !DILocation(line: 45, column: 17, scope: !66)
!68 = !DILocation(line: 45, column: 27, scope: !66)
!69 = !DILocation(line: 45, column: 34, scope: !66)
!70 = !DILocation(line: 46, column: 24, scope: !66)
!71 = !DILocation(line: 46, column: 17, scope: !66)
!72 = !DILocation(line: 46, column: 27, scope: !66)
!73 = !DILocation(line: 46, column: 34, scope: !66)
!74 = !DILocation(line: 47, column: 13, scope: !66)
!75 = !DILocation(line: 43, column: 35, scope: !62)
!76 = !DILocation(line: 43, column: 13, scope: !62)
!77 = distinct !{!77, !64, !78, !79}
!78 = !DILocation(line: 47, column: 13, scope: !59)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocalVariable(name: "i", scope: !81, file: !19, line: 50, type: !54)
!81 = distinct !DILexicalBlock(scope: !47, file: !19, line: 49, column: 9)
!82 = !DILocation(line: 50, column: 20, scope: !81)
!83 = !DILocation(line: 52, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !19, line: 52, column: 13)
!85 = !DILocation(line: 52, column: 18, scope: !84)
!86 = !DILocation(line: 52, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !19, line: 52, column: 13)
!88 = !DILocation(line: 52, column: 27, scope: !87)
!89 = !DILocation(line: 52, column: 13, scope: !84)
!90 = !DILocation(line: 54, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 53, column: 13)
!92 = !DILocation(line: 54, column: 22, scope: !91)
!93 = !DILocation(line: 54, column: 34, scope: !91)
!94 = !DILocation(line: 54, column: 27, scope: !91)
!95 = !DILocation(line: 55, column: 13, scope: !91)
!96 = !DILocation(line: 52, column: 35, scope: !87)
!97 = !DILocation(line: 52, column: 13, scope: !87)
!98 = distinct !{!98, !89, !99, !79}
!99 = !DILocation(line: 55, column: 13, scope: !84)
!100 = !DILocation(line: 56, column: 30, scope: !81)
!101 = !DILocation(line: 56, column: 13, scope: !81)
!102 = !DILocation(line: 57, column: 18, scope: !81)
!103 = !DILocation(line: 57, column: 13, scope: !81)
!104 = !DILocation(line: 60, column: 1, scope: !26)
!105 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_05_good", scope: !19, file: !19, line: 141, type: !27, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocation(line: 143, column: 5, scope: !105)
!107 = !DILocation(line: 144, column: 5, scope: !105)
!108 = !DILocation(line: 145, column: 1, scope: !105)
!109 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 157, type: !110, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DISubroutineType(types: !111)
!111 = !{!12, !12, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !19, line: 157, type: !12)
!116 = !DILocation(line: 157, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !19, line: 157, type: !112)
!118 = !DILocation(line: 157, column: 27, scope: !109)
!119 = !DILocation(line: 160, column: 22, scope: !109)
!120 = !DILocation(line: 160, column: 12, scope: !109)
!121 = !DILocation(line: 160, column: 5, scope: !109)
!122 = !DILocation(line: 162, column: 5, scope: !109)
!123 = !DILocation(line: 163, column: 5, scope: !109)
!124 = !DILocation(line: 164, column: 5, scope: !109)
!125 = !DILocation(line: 167, column: 5, scope: !109)
!126 = !DILocation(line: 168, column: 5, scope: !109)
!127 = !DILocation(line: 169, column: 5, scope: !109)
!128 = !DILocation(line: 171, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 67, type: !27, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !19, line: 69, type: !6)
!131 = !DILocation(line: 69, column: 21, scope: !129)
!132 = !DILocation(line: 70, column: 10, scope: !129)
!133 = !DILocation(line: 71, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !19, line: 71, column: 8)
!135 = !DILocation(line: 71, column: 8, scope: !129)
!136 = !DILocation(line: 74, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !19, line: 72, column: 5)
!138 = !DILocation(line: 75, column: 5, scope: !137)
!139 = !DILocation(line: 79, column: 33, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !19, line: 77, column: 5)
!141 = !DILocation(line: 79, column: 16, scope: !140)
!142 = !DILocation(line: 79, column: 14, scope: !140)
!143 = !DILocation(line: 80, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !19, line: 80, column: 13)
!145 = !DILocation(line: 80, column: 18, scope: !144)
!146 = !DILocation(line: 80, column: 13, scope: !140)
!147 = !DILocation(line: 80, column: 28, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !19, line: 80, column: 27)
!149 = !DILocalVariable(name: "source", scope: !150, file: !19, line: 83, type: !48)
!150 = distinct !DILexicalBlock(scope: !129, file: !19, line: 82, column: 5)
!151 = !DILocation(line: 83, column: 23, scope: !150)
!152 = !DILocalVariable(name: "i", scope: !153, file: !19, line: 85, type: !54)
!153 = distinct !DILexicalBlock(scope: !150, file: !19, line: 84, column: 9)
!154 = !DILocation(line: 85, column: 20, scope: !153)
!155 = !DILocation(line: 87, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !19, line: 87, column: 13)
!157 = !DILocation(line: 87, column: 18, scope: !156)
!158 = !DILocation(line: 87, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !19, line: 87, column: 13)
!160 = !DILocation(line: 87, column: 27, scope: !159)
!161 = !DILocation(line: 87, column: 13, scope: !156)
!162 = !DILocation(line: 89, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !19, line: 88, column: 13)
!164 = !DILocation(line: 89, column: 17, scope: !163)
!165 = !DILocation(line: 89, column: 27, scope: !163)
!166 = !DILocation(line: 89, column: 34, scope: !163)
!167 = !DILocation(line: 90, column: 24, scope: !163)
!168 = !DILocation(line: 90, column: 17, scope: !163)
!169 = !DILocation(line: 90, column: 27, scope: !163)
!170 = !DILocation(line: 90, column: 34, scope: !163)
!171 = !DILocation(line: 91, column: 13, scope: !163)
!172 = !DILocation(line: 87, column: 35, scope: !159)
!173 = !DILocation(line: 87, column: 13, scope: !159)
!174 = distinct !{!174, !161, !175, !79}
!175 = !DILocation(line: 91, column: 13, scope: !156)
!176 = !DILocalVariable(name: "i", scope: !177, file: !19, line: 94, type: !54)
!177 = distinct !DILexicalBlock(scope: !150, file: !19, line: 93, column: 9)
!178 = !DILocation(line: 94, column: 20, scope: !177)
!179 = !DILocation(line: 96, column: 20, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !19, line: 96, column: 13)
!181 = !DILocation(line: 96, column: 18, scope: !180)
!182 = !DILocation(line: 96, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !19, line: 96, column: 13)
!184 = !DILocation(line: 96, column: 27, scope: !183)
!185 = !DILocation(line: 96, column: 13, scope: !180)
!186 = !DILocation(line: 98, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !19, line: 97, column: 13)
!188 = !DILocation(line: 98, column: 22, scope: !187)
!189 = !DILocation(line: 98, column: 34, scope: !187)
!190 = !DILocation(line: 98, column: 27, scope: !187)
!191 = !DILocation(line: 99, column: 13, scope: !187)
!192 = !DILocation(line: 96, column: 35, scope: !183)
!193 = !DILocation(line: 96, column: 13, scope: !183)
!194 = distinct !{!194, !185, !195, !79}
!195 = !DILocation(line: 99, column: 13, scope: !180)
!196 = !DILocation(line: 100, column: 30, scope: !177)
!197 = !DILocation(line: 100, column: 13, scope: !177)
!198 = !DILocation(line: 101, column: 18, scope: !177)
!199 = !DILocation(line: 101, column: 13, scope: !177)
!200 = !DILocation(line: 104, column: 1, scope: !129)
!201 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 107, type: !27, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocalVariable(name: "data", scope: !201, file: !19, line: 109, type: !6)
!203 = !DILocation(line: 109, column: 21, scope: !201)
!204 = !DILocation(line: 110, column: 10, scope: !201)
!205 = !DILocation(line: 111, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !19, line: 111, column: 8)
!207 = !DILocation(line: 111, column: 8, scope: !201)
!208 = !DILocation(line: 114, column: 33, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !19, line: 112, column: 5)
!210 = !DILocation(line: 114, column: 16, scope: !209)
!211 = !DILocation(line: 114, column: 14, scope: !209)
!212 = !DILocation(line: 115, column: 13, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !19, line: 115, column: 13)
!214 = !DILocation(line: 115, column: 18, scope: !213)
!215 = !DILocation(line: 115, column: 13, scope: !209)
!216 = !DILocation(line: 115, column: 28, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !19, line: 115, column: 27)
!218 = !DILocation(line: 116, column: 5, scope: !209)
!219 = !DILocalVariable(name: "source", scope: !220, file: !19, line: 118, type: !48)
!220 = distinct !DILexicalBlock(scope: !201, file: !19, line: 117, column: 5)
!221 = !DILocation(line: 118, column: 23, scope: !220)
!222 = !DILocalVariable(name: "i", scope: !223, file: !19, line: 120, type: !54)
!223 = distinct !DILexicalBlock(scope: !220, file: !19, line: 119, column: 9)
!224 = !DILocation(line: 120, column: 20, scope: !223)
!225 = !DILocation(line: 122, column: 20, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !19, line: 122, column: 13)
!227 = !DILocation(line: 122, column: 18, scope: !226)
!228 = !DILocation(line: 122, column: 25, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !19, line: 122, column: 13)
!230 = !DILocation(line: 122, column: 27, scope: !229)
!231 = !DILocation(line: 122, column: 13, scope: !226)
!232 = !DILocation(line: 124, column: 24, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !19, line: 123, column: 13)
!234 = !DILocation(line: 124, column: 17, scope: !233)
!235 = !DILocation(line: 124, column: 27, scope: !233)
!236 = !DILocation(line: 124, column: 34, scope: !233)
!237 = !DILocation(line: 125, column: 24, scope: !233)
!238 = !DILocation(line: 125, column: 17, scope: !233)
!239 = !DILocation(line: 125, column: 27, scope: !233)
!240 = !DILocation(line: 125, column: 34, scope: !233)
!241 = !DILocation(line: 126, column: 13, scope: !233)
!242 = !DILocation(line: 122, column: 35, scope: !229)
!243 = !DILocation(line: 122, column: 13, scope: !229)
!244 = distinct !{!244, !231, !245, !79}
!245 = !DILocation(line: 126, column: 13, scope: !226)
!246 = !DILocalVariable(name: "i", scope: !247, file: !19, line: 129, type: !54)
!247 = distinct !DILexicalBlock(scope: !220, file: !19, line: 128, column: 9)
!248 = !DILocation(line: 129, column: 20, scope: !247)
!249 = !DILocation(line: 131, column: 20, scope: !250)
!250 = distinct !DILexicalBlock(scope: !247, file: !19, line: 131, column: 13)
!251 = !DILocation(line: 131, column: 18, scope: !250)
!252 = !DILocation(line: 131, column: 25, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !19, line: 131, column: 13)
!254 = !DILocation(line: 131, column: 27, scope: !253)
!255 = !DILocation(line: 131, column: 13, scope: !250)
!256 = !DILocation(line: 133, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !19, line: 132, column: 13)
!258 = !DILocation(line: 133, column: 22, scope: !257)
!259 = !DILocation(line: 133, column: 34, scope: !257)
!260 = !DILocation(line: 133, column: 27, scope: !257)
!261 = !DILocation(line: 134, column: 13, scope: !257)
!262 = !DILocation(line: 131, column: 35, scope: !253)
!263 = !DILocation(line: 131, column: 13, scope: !253)
!264 = distinct !{!264, !255, !265, !79}
!265 = !DILocation(line: 134, column: 13, scope: !250)
!266 = !DILocation(line: 135, column: 30, scope: !247)
!267 = !DILocation(line: 135, column: 13, scope: !247)
!268 = !DILocation(line: 136, column: 18, scope: !247)
!269 = !DILocation(line: 136, column: 13, scope: !247)
!270 = !DILocation(line: 139, column: 1, scope: !201)
