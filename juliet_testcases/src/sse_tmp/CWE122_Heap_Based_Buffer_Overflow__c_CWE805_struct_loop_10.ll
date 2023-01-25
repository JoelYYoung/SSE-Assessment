; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !36
  br i1 %cmp, label %if.then1, label %if.end, !dbg !37

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !40

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !56
  %cmp3 = icmp ult i64 %3, 100, !dbg !58
  br i1 %cmp3, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %6, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !75, metadata !DIExpression()), !dbg !77
  store i64 0, i64* %i5, align 8, !dbg !78
  br label %for.cond6, !dbg !80

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i64, i64* %i5, align 8, !dbg !81
  %cmp7 = icmp ult i64 %7, 100, !dbg !83
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !84

for.body8:                                        ; preds = %for.cond6
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !85
  %9 = load i64, i64* %i5, align 8, !dbg !87
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !85
  %10 = load i64, i64* %i5, align 8, !dbg !88
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !89
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !89
  %12 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !89
  br label %for.inc11, !dbg !90

for.inc11:                                        ; preds = %for.body8
  %13 = load i64, i64* %i5, align 8, !dbg !91
  %inc12 = add i64 %13, 1, !dbg !91
  store i64 %inc12, i64* %i5, align 8, !dbg !91
  br label %for.cond6, !dbg !92, !llvm.loop !93

for.end13:                                        ; preds = %for.cond6
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !95
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !96
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !97
  call void @free(i8* %16) #6, !dbg !98
  ret void, !dbg !99
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10_good() #0 !dbg !100 {
entry:
  call void @goodG2B1(), !dbg !101
  call void @goodG2B2(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #6, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #6, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !124 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %0 = load i32, i32* @globalFalse, align 4, !dbg !128
  %tobool = icmp ne i32 %0, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !131
  br label %if.end2, !dbg !133

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !134
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !136
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !138
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !140
  br i1 %cmp, label %if.then1, label %if.end, !dbg !141

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !153
  %cmp3 = icmp ult i64 %3, 100, !dbg !155
  br i1 %cmp3, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !159
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !160
  store i32 0, i32* %intOne, align 8, !dbg !161
  %5 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !163
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !164
  store i32 0, i32* %intTwo, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %6, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i5, align 8, !dbg !174
  br label %for.cond6, !dbg !176

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i64, i64* %i5, align 8, !dbg !177
  %cmp7 = icmp ult i64 %7, 100, !dbg !179
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !180

for.body8:                                        ; preds = %for.cond6
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %9 = load i64, i64* %i5, align 8, !dbg !183
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !181
  %10 = load i64, i64* %i5, align 8, !dbg !184
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !185
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !185
  %12 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !185
  br label %for.inc11, !dbg !186

for.inc11:                                        ; preds = %for.body8
  %13 = load i64, i64* %i5, align 8, !dbg !187
  %inc12 = add i64 %13, 1, !dbg !187
  store i64 %inc12, i64* %i5, align 8, !dbg !187
  br label %for.cond6, !dbg !188, !llvm.loop !189

for.end13:                                        ; preds = %for.cond6
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !191
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !192
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !193
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !193
  call void @free(i8* %16) #6, !dbg !194
  ret void, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !196 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !197, metadata !DIExpression()), !dbg !198
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !199
  %0 = load i32, i32* @globalTrue, align 4, !dbg !200
  %tobool = icmp ne i32 %0, 0, !dbg !200
  br i1 %tobool, label %if.then, label %if.end2, !dbg !202

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !203
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !205
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !206
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !207
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !209
  br i1 %cmp, label %if.then1, label %if.end, !dbg !210

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !211
  unreachable, !dbg !211

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !213

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !214, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i64* %i, metadata !217, metadata !DIExpression()), !dbg !219
  store i64 0, i64* %i, align 8, !dbg !220
  br label %for.cond, !dbg !222

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !223
  %cmp3 = icmp ult i64 %3, 100, !dbg !225
  br i1 %cmp3, label %for.body, label %for.end, !dbg !226

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !229
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !230
  store i32 0, i32* %intOne, align 8, !dbg !231
  %5 = load i64, i64* %i, align 8, !dbg !232
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !233
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !234
  store i32 0, i32* %intTwo, align 4, !dbg !235
  br label %for.inc, !dbg !236

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !237
  %inc = add i64 %6, 1, !dbg !237
  store i64 %inc, i64* %i, align 8, !dbg !237
  br label %for.cond, !dbg !238, !llvm.loop !239

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !241, metadata !DIExpression()), !dbg !243
  store i64 0, i64* %i5, align 8, !dbg !244
  br label %for.cond6, !dbg !246

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i64, i64* %i5, align 8, !dbg !247
  %cmp7 = icmp ult i64 %7, 100, !dbg !249
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !250

for.body8:                                        ; preds = %for.cond6
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !251
  %9 = load i64, i64* %i5, align 8, !dbg !253
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 %9, !dbg !251
  %10 = load i64, i64* %i5, align 8, !dbg !254
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !255
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !255
  %12 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !255
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 8 %12, i64 8, i1 false), !dbg !255
  br label %for.inc11, !dbg !256

for.inc11:                                        ; preds = %for.body8
  %13 = load i64, i64* %i5, align 8, !dbg !257
  %inc12 = add i64 %13, 1, !dbg !257
  store i64 %inc12, i64* %i5, align 8, !dbg !257
  br label %for.cond6, !dbg !258, !llvm.loop !259

for.end13:                                        ; preds = %for.cond6
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !261
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !261
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !262
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !263
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !263
  call void @free(i8* %16) #6, !dbg !264
  ret void, !dbg !265
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 25, column: 8)
!29 = !DILocation(line: 25, column: 8, scope: !20)
!30 = !DILocation(line: 28, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !21, line: 26, column: 5)
!32 = !DILocation(line: 28, column: 16, scope: !31)
!33 = !DILocation(line: 28, column: 14, scope: !31)
!34 = !DILocation(line: 29, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 29, column: 13)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 13, scope: !31)
!38 = !DILocation(line: 29, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !21, line: 29, column: 27)
!40 = !DILocation(line: 30, column: 5, scope: !31)
!41 = !DILocalVariable(name: "source", scope: !42, file: !21, line: 32, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !21, line: 31, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 32, column: 23, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !21, line: 34, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !21, line: 33, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 34, column: 20, scope: !48)
!53 = !DILocation(line: 36, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !21, line: 36, column: 13)
!55 = !DILocation(line: 36, column: 18, scope: !54)
!56 = !DILocation(line: 36, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !21, line: 36, column: 13)
!58 = !DILocation(line: 36, column: 27, scope: !57)
!59 = !DILocation(line: 36, column: 13, scope: !54)
!60 = !DILocation(line: 38, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !21, line: 37, column: 13)
!62 = !DILocation(line: 38, column: 17, scope: !61)
!63 = !DILocation(line: 38, column: 27, scope: !61)
!64 = !DILocation(line: 38, column: 34, scope: !61)
!65 = !DILocation(line: 39, column: 24, scope: !61)
!66 = !DILocation(line: 39, column: 17, scope: !61)
!67 = !DILocation(line: 39, column: 27, scope: !61)
!68 = !DILocation(line: 39, column: 34, scope: !61)
!69 = !DILocation(line: 40, column: 13, scope: !61)
!70 = !DILocation(line: 36, column: 35, scope: !57)
!71 = !DILocation(line: 36, column: 13, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 40, column: 13, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocalVariable(name: "i", scope: !76, file: !21, line: 43, type: !49)
!76 = distinct !DILexicalBlock(scope: !42, file: !21, line: 42, column: 9)
!77 = !DILocation(line: 43, column: 20, scope: !76)
!78 = !DILocation(line: 45, column: 20, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !21, line: 45, column: 13)
!80 = !DILocation(line: 45, column: 18, scope: !79)
!81 = !DILocation(line: 45, column: 25, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !21, line: 45, column: 13)
!83 = !DILocation(line: 45, column: 27, scope: !82)
!84 = !DILocation(line: 45, column: 13, scope: !79)
!85 = !DILocation(line: 47, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !21, line: 46, column: 13)
!87 = !DILocation(line: 47, column: 22, scope: !86)
!88 = !DILocation(line: 47, column: 34, scope: !86)
!89 = !DILocation(line: 47, column: 27, scope: !86)
!90 = !DILocation(line: 48, column: 13, scope: !86)
!91 = !DILocation(line: 45, column: 35, scope: !82)
!92 = !DILocation(line: 45, column: 13, scope: !82)
!93 = distinct !{!93, !84, !94, !74}
!94 = !DILocation(line: 48, column: 13, scope: !79)
!95 = !DILocation(line: 49, column: 30, scope: !76)
!96 = !DILocation(line: 49, column: 13, scope: !76)
!97 = !DILocation(line: 50, column: 18, scope: !76)
!98 = !DILocation(line: 50, column: 13, scope: !76)
!99 = !DILocation(line: 53, column: 1, scope: !20)
!100 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_10_good", scope: !21, file: !21, line: 134, type: !22, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 136, column: 5, scope: !100)
!102 = !DILocation(line: 137, column: 5, scope: !100)
!103 = !DILocation(line: 138, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 150, type: !105, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!10, !10, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !21, line: 150, type: !10)
!111 = !DILocation(line: 150, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !21, line: 150, type: !107)
!113 = !DILocation(line: 150, column: 27, scope: !104)
!114 = !DILocation(line: 153, column: 22, scope: !104)
!115 = !DILocation(line: 153, column: 12, scope: !104)
!116 = !DILocation(line: 153, column: 5, scope: !104)
!117 = !DILocation(line: 155, column: 5, scope: !104)
!118 = !DILocation(line: 156, column: 5, scope: !104)
!119 = !DILocation(line: 157, column: 5, scope: !104)
!120 = !DILocation(line: 160, column: 5, scope: !104)
!121 = !DILocation(line: 161, column: 5, scope: !104)
!122 = !DILocation(line: 162, column: 5, scope: !104)
!123 = !DILocation(line: 164, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !21, line: 62, type: !4)
!126 = !DILocation(line: 62, column: 21, scope: !124)
!127 = !DILocation(line: 63, column: 10, scope: !124)
!128 = !DILocation(line: 64, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !21, line: 64, column: 8)
!130 = !DILocation(line: 64, column: 8, scope: !124)
!131 = !DILocation(line: 67, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !21, line: 65, column: 5)
!133 = !DILocation(line: 68, column: 5, scope: !132)
!134 = !DILocation(line: 72, column: 33, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !21, line: 70, column: 5)
!136 = !DILocation(line: 72, column: 16, scope: !135)
!137 = !DILocation(line: 72, column: 14, scope: !135)
!138 = !DILocation(line: 73, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !21, line: 73, column: 13)
!140 = !DILocation(line: 73, column: 18, scope: !139)
!141 = !DILocation(line: 73, column: 13, scope: !135)
!142 = !DILocation(line: 73, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !21, line: 73, column: 27)
!144 = !DILocalVariable(name: "source", scope: !145, file: !21, line: 76, type: !43)
!145 = distinct !DILexicalBlock(scope: !124, file: !21, line: 75, column: 5)
!146 = !DILocation(line: 76, column: 23, scope: !145)
!147 = !DILocalVariable(name: "i", scope: !148, file: !21, line: 78, type: !49)
!148 = distinct !DILexicalBlock(scope: !145, file: !21, line: 77, column: 9)
!149 = !DILocation(line: 78, column: 20, scope: !148)
!150 = !DILocation(line: 80, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !21, line: 80, column: 13)
!152 = !DILocation(line: 80, column: 18, scope: !151)
!153 = !DILocation(line: 80, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !21, line: 80, column: 13)
!155 = !DILocation(line: 80, column: 27, scope: !154)
!156 = !DILocation(line: 80, column: 13, scope: !151)
!157 = !DILocation(line: 82, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !21, line: 81, column: 13)
!159 = !DILocation(line: 82, column: 17, scope: !158)
!160 = !DILocation(line: 82, column: 27, scope: !158)
!161 = !DILocation(line: 82, column: 34, scope: !158)
!162 = !DILocation(line: 83, column: 24, scope: !158)
!163 = !DILocation(line: 83, column: 17, scope: !158)
!164 = !DILocation(line: 83, column: 27, scope: !158)
!165 = !DILocation(line: 83, column: 34, scope: !158)
!166 = !DILocation(line: 84, column: 13, scope: !158)
!167 = !DILocation(line: 80, column: 35, scope: !154)
!168 = !DILocation(line: 80, column: 13, scope: !154)
!169 = distinct !{!169, !156, !170, !74}
!170 = !DILocation(line: 84, column: 13, scope: !151)
!171 = !DILocalVariable(name: "i", scope: !172, file: !21, line: 87, type: !49)
!172 = distinct !DILexicalBlock(scope: !145, file: !21, line: 86, column: 9)
!173 = !DILocation(line: 87, column: 20, scope: !172)
!174 = !DILocation(line: 89, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !21, line: 89, column: 13)
!176 = !DILocation(line: 89, column: 18, scope: !175)
!177 = !DILocation(line: 89, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !21, line: 89, column: 13)
!179 = !DILocation(line: 89, column: 27, scope: !178)
!180 = !DILocation(line: 89, column: 13, scope: !175)
!181 = !DILocation(line: 91, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !21, line: 90, column: 13)
!183 = !DILocation(line: 91, column: 22, scope: !182)
!184 = !DILocation(line: 91, column: 34, scope: !182)
!185 = !DILocation(line: 91, column: 27, scope: !182)
!186 = !DILocation(line: 92, column: 13, scope: !182)
!187 = !DILocation(line: 89, column: 35, scope: !178)
!188 = !DILocation(line: 89, column: 13, scope: !178)
!189 = distinct !{!189, !180, !190, !74}
!190 = !DILocation(line: 92, column: 13, scope: !175)
!191 = !DILocation(line: 93, column: 30, scope: !172)
!192 = !DILocation(line: 93, column: 13, scope: !172)
!193 = !DILocation(line: 94, column: 18, scope: !172)
!194 = !DILocation(line: 94, column: 13, scope: !172)
!195 = !DILocation(line: 97, column: 1, scope: !124)
!196 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 100, type: !22, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!197 = !DILocalVariable(name: "data", scope: !196, file: !21, line: 102, type: !4)
!198 = !DILocation(line: 102, column: 21, scope: !196)
!199 = !DILocation(line: 103, column: 10, scope: !196)
!200 = !DILocation(line: 104, column: 8, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !21, line: 104, column: 8)
!202 = !DILocation(line: 104, column: 8, scope: !196)
!203 = !DILocation(line: 107, column: 33, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !21, line: 105, column: 5)
!205 = !DILocation(line: 107, column: 16, scope: !204)
!206 = !DILocation(line: 107, column: 14, scope: !204)
!207 = !DILocation(line: 108, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !21, line: 108, column: 13)
!209 = !DILocation(line: 108, column: 18, scope: !208)
!210 = !DILocation(line: 108, column: 13, scope: !204)
!211 = !DILocation(line: 108, column: 28, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !21, line: 108, column: 27)
!213 = !DILocation(line: 109, column: 5, scope: !204)
!214 = !DILocalVariable(name: "source", scope: !215, file: !21, line: 111, type: !43)
!215 = distinct !DILexicalBlock(scope: !196, file: !21, line: 110, column: 5)
!216 = !DILocation(line: 111, column: 23, scope: !215)
!217 = !DILocalVariable(name: "i", scope: !218, file: !21, line: 113, type: !49)
!218 = distinct !DILexicalBlock(scope: !215, file: !21, line: 112, column: 9)
!219 = !DILocation(line: 113, column: 20, scope: !218)
!220 = !DILocation(line: 115, column: 20, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !21, line: 115, column: 13)
!222 = !DILocation(line: 115, column: 18, scope: !221)
!223 = !DILocation(line: 115, column: 25, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !21, line: 115, column: 13)
!225 = !DILocation(line: 115, column: 27, scope: !224)
!226 = !DILocation(line: 115, column: 13, scope: !221)
!227 = !DILocation(line: 117, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !21, line: 116, column: 13)
!229 = !DILocation(line: 117, column: 17, scope: !228)
!230 = !DILocation(line: 117, column: 27, scope: !228)
!231 = !DILocation(line: 117, column: 34, scope: !228)
!232 = !DILocation(line: 118, column: 24, scope: !228)
!233 = !DILocation(line: 118, column: 17, scope: !228)
!234 = !DILocation(line: 118, column: 27, scope: !228)
!235 = !DILocation(line: 118, column: 34, scope: !228)
!236 = !DILocation(line: 119, column: 13, scope: !228)
!237 = !DILocation(line: 115, column: 35, scope: !224)
!238 = !DILocation(line: 115, column: 13, scope: !224)
!239 = distinct !{!239, !226, !240, !74}
!240 = !DILocation(line: 119, column: 13, scope: !221)
!241 = !DILocalVariable(name: "i", scope: !242, file: !21, line: 122, type: !49)
!242 = distinct !DILexicalBlock(scope: !215, file: !21, line: 121, column: 9)
!243 = !DILocation(line: 122, column: 20, scope: !242)
!244 = !DILocation(line: 124, column: 20, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !21, line: 124, column: 13)
!246 = !DILocation(line: 124, column: 18, scope: !245)
!247 = !DILocation(line: 124, column: 25, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !21, line: 124, column: 13)
!249 = !DILocation(line: 124, column: 27, scope: !248)
!250 = !DILocation(line: 124, column: 13, scope: !245)
!251 = !DILocation(line: 126, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !21, line: 125, column: 13)
!253 = !DILocation(line: 126, column: 22, scope: !252)
!254 = !DILocation(line: 126, column: 34, scope: !252)
!255 = !DILocation(line: 126, column: 27, scope: !252)
!256 = !DILocation(line: 127, column: 13, scope: !252)
!257 = !DILocation(line: 124, column: 35, scope: !248)
!258 = !DILocation(line: 124, column: 13, scope: !248)
!259 = distinct !{!259, !250, !260, !74}
!260 = !DILocation(line: 127, column: 13, scope: !245)
!261 = !DILocation(line: 128, column: 30, scope: !242)
!262 = !DILocation(line: 128, column: 13, scope: !242)
!263 = !DILocation(line: 129, column: 18, scope: !242)
!264 = !DILocation(line: 129, column: 13, scope: !242)
!265 = !DILocation(line: 132, column: 1, scope: !196)
