; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !17
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !20

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21_bad() #0 !dbg !28 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !31, metadata !DIExpression()), !dbg !32
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %call = call %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %0), !dbg !36
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %1, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !59
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !60
  store i32 0, i32* %intOne, align 8, !dbg !61
  %3 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !63
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !64
  store i32 0, i32* %intTwo, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %4, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !72, metadata !DIExpression()), !dbg !74
  store i64 0, i64* %i2, align 8, !dbg !75
  br label %for.cond3, !dbg !77

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !78
  %cmp4 = icmp ult i64 %5, 100, !dbg !80
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !81

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %7 = load i64, i64* %i2, align 8, !dbg !84
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !82
  %8 = load i64, i64* %i2, align 8, !dbg !85
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !86
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !86
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !86
  br label %for.inc8, !dbg !87

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !88
  %inc9 = add i64 %11, 1, !dbg !88
  store i64 %inc9, i64* %i2, align 8, !dbg !88
  br label %for.cond3, !dbg !89, !llvm.loop !90

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !92
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !92
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !93
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !94
  call void @free(i8* %14) #6, !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32, i32* @badStatic, align 4, !dbg !102
  %tobool = icmp ne i32 %0, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.end2, !dbg !104

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !105
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !107
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !108
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !109
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !111
  br i1 %cmp, label %if.then1, label %if.end, !dbg !112

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !115

if.end2:                                          ; preds = %if.end, %entry
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !116
  ret %struct._twoIntsStruct* %3, !dbg !117
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21_good() #0 !dbg !118 {
entry:
  call void @goodG2B1(), !dbg !119
  call void @goodG2B2(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !128, metadata !DIExpression()), !dbg !129
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call i64 @time(i64* null) #6, !dbg !132
  %conv = trunc i64 %call to i32, !dbg !133
  call void @srand(i32 %conv) #6, !dbg !134
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !135
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21_good(), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !137
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !138
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21_bad(), !dbg !139
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !140
  ret i32 0, !dbg !141
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !142 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !143, metadata !DIExpression()), !dbg !144
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !145
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !146
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %call = call %struct._twoIntsStruct* @goodG2B1Source(%struct._twoIntsStruct* %0), !dbg !148
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !159
  %cmp = icmp ult i64 %1, 100, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !165
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !166
  store i32 0, i32* %intOne, align 8, !dbg !167
  %3 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !169
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !170
  store i32 0, i32* %intTwo, align 4, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %4, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !177, metadata !DIExpression()), !dbg !179
  store i64 0, i64* %i2, align 8, !dbg !180
  br label %for.cond3, !dbg !182

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !183
  %cmp4 = icmp ult i64 %5, 100, !dbg !185
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !186

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !187
  %7 = load i64, i64* %i2, align 8, !dbg !189
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !187
  %8 = load i64, i64* %i2, align 8, !dbg !190
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !191
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !191
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !191
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !191
  br label %for.inc8, !dbg !192

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !193
  %inc9 = add i64 %11, 1, !dbg !193
  store i64 %inc9, i64* %i2, align 8, !dbg !193
  br label %for.cond3, !dbg !194, !llvm.loop !195

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !197
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !197
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !198
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !199
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !199
  call void @free(i8* %14) #6, !dbg !200
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2B1Source(%struct._twoIntsStruct* %data) #0 !dbg !202 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !203, metadata !DIExpression()), !dbg !204
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !205
  %tobool = icmp ne i32 %0, 0, !dbg !205
  br i1 %tobool, label %if.then, label %if.else, !dbg !207

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !208
  br label %if.end2, !dbg !210

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !211
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !213
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !214
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !215
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !217
  br i1 %cmp, label %if.then1, label %if.end, !dbg !218

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !219
  unreachable, !dbg !219

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !221
  ret %struct._twoIntsStruct* %3, !dbg !222
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !223 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !224, metadata !DIExpression()), !dbg !225
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !226
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !227
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !228
  %call = call %struct._twoIntsStruct* @goodG2B2Source(%struct._twoIntsStruct* %0), !dbg !229
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !230
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !231, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata i64* %i, metadata !234, metadata !DIExpression()), !dbg !236
  store i64 0, i64* %i, align 8, !dbg !237
  br label %for.cond, !dbg !239

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !240
  %cmp = icmp ult i64 %1, 100, !dbg !242
  br i1 %cmp, label %for.body, label %for.end, !dbg !243

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !244
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !246
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !247
  store i32 0, i32* %intOne, align 8, !dbg !248
  %3 = load i64, i64* %i, align 8, !dbg !249
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !250
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !251
  store i32 0, i32* %intTwo, align 4, !dbg !252
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !254
  %inc = add i64 %4, 1, !dbg !254
  store i64 %inc, i64* %i, align 8, !dbg !254
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !258, metadata !DIExpression()), !dbg !260
  store i64 0, i64* %i2, align 8, !dbg !261
  br label %for.cond3, !dbg !263

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !264
  %cmp4 = icmp ult i64 %5, 100, !dbg !266
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !267

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !268
  %7 = load i64, i64* %i2, align 8, !dbg !270
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !268
  %8 = load i64, i64* %i2, align 8, !dbg !271
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !272
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !272
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !272
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !272
  br label %for.inc8, !dbg !273

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !274
  %inc9 = add i64 %11, 1, !dbg !274
  store i64 %inc9, i64* %i2, align 8, !dbg !274
  br label %for.cond3, !dbg !275, !llvm.loop !276

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !278
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !278
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !279
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !280
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !280
  call void @free(i8* %14) #6, !dbg !281
  ret void, !dbg !282
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2B2Source(%struct._twoIntsStruct* %data) #0 !dbg !283 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !284, metadata !DIExpression()), !dbg !285
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !286
  %tobool = icmp ne i32 %0, 0, !dbg !286
  br i1 %tobool, label %if.then, label %if.end2, !dbg !288

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !289
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !291
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !292
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !293
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !295
  br i1 %cmp, label %if.then1, label %if.end, !dbg !296

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !297
  unreachable, !dbg !297

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !299

if.end2:                                          ; preds = %if.end, %entry
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !300
  ret %struct._twoIntsStruct* %3, !dbg !301
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !19, line: 22, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !15}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !9, line: 100, baseType: !10)
!9 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !9, line: 96, size: 64, elements: !11)
!11 = !{!12, !14}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !10, file: !9, line: 98, baseType: !13, size: 32)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !10, file: !9, line: 99, baseType: !13, size: 32, offset: 32)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !{!0, !17, !20}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !19, line: 70, type: !13, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !19, line: 71, type: !13, isLocal: true, isDefinition: true)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"clang version 13.0.0"}
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21_bad", scope: !19, file: !19, line: 35, type: !29, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{null}
!31 = !DILocalVariable(name: "data", scope: !28, file: !19, line: 37, type: !7)
!32 = !DILocation(line: 37, column: 21, scope: !28)
!33 = !DILocation(line: 38, column: 10, scope: !28)
!34 = !DILocation(line: 39, column: 15, scope: !28)
!35 = !DILocation(line: 40, column: 22, scope: !28)
!36 = !DILocation(line: 40, column: 12, scope: !28)
!37 = !DILocation(line: 40, column: 10, scope: !28)
!38 = !DILocalVariable(name: "source", scope: !39, file: !19, line: 42, type: !40)
!39 = distinct !DILexicalBlock(scope: !28, file: !19, line: 41, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 42, column: 23, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !19, line: 44, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !19, line: 43, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 44, column: 20, scope: !45)
!50 = !DILocation(line: 46, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !19, line: 46, column: 13)
!52 = !DILocation(line: 46, column: 18, scope: !51)
!53 = !DILocation(line: 46, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !19, line: 46, column: 13)
!55 = !DILocation(line: 46, column: 27, scope: !54)
!56 = !DILocation(line: 46, column: 13, scope: !51)
!57 = !DILocation(line: 48, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !19, line: 47, column: 13)
!59 = !DILocation(line: 48, column: 17, scope: !58)
!60 = !DILocation(line: 48, column: 27, scope: !58)
!61 = !DILocation(line: 48, column: 34, scope: !58)
!62 = !DILocation(line: 49, column: 24, scope: !58)
!63 = !DILocation(line: 49, column: 17, scope: !58)
!64 = !DILocation(line: 49, column: 27, scope: !58)
!65 = !DILocation(line: 49, column: 34, scope: !58)
!66 = !DILocation(line: 50, column: 13, scope: !58)
!67 = !DILocation(line: 46, column: 35, scope: !54)
!68 = !DILocation(line: 46, column: 13, scope: !54)
!69 = distinct !{!69, !56, !70, !71}
!70 = !DILocation(line: 50, column: 13, scope: !51)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocalVariable(name: "i", scope: !73, file: !19, line: 53, type: !46)
!73 = distinct !DILexicalBlock(scope: !39, file: !19, line: 52, column: 9)
!74 = !DILocation(line: 53, column: 20, scope: !73)
!75 = !DILocation(line: 55, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !19, line: 55, column: 13)
!77 = !DILocation(line: 55, column: 18, scope: !76)
!78 = !DILocation(line: 55, column: 25, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !19, line: 55, column: 13)
!80 = !DILocation(line: 55, column: 27, scope: !79)
!81 = !DILocation(line: 55, column: 13, scope: !76)
!82 = !DILocation(line: 57, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !19, line: 56, column: 13)
!84 = !DILocation(line: 57, column: 22, scope: !83)
!85 = !DILocation(line: 57, column: 34, scope: !83)
!86 = !DILocation(line: 57, column: 27, scope: !83)
!87 = !DILocation(line: 58, column: 13, scope: !83)
!88 = !DILocation(line: 55, column: 35, scope: !79)
!89 = !DILocation(line: 55, column: 13, scope: !79)
!90 = distinct !{!90, !81, !91, !71}
!91 = !DILocation(line: 58, column: 13, scope: !76)
!92 = !DILocation(line: 59, column: 30, scope: !73)
!93 = !DILocation(line: 59, column: 13, scope: !73)
!94 = !DILocation(line: 60, column: 18, scope: !73)
!95 = !DILocation(line: 60, column: 13, scope: !73)
!96 = !DILocation(line: 63, column: 1, scope: !28)
!97 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 24, type: !98, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{!7, !7}
!100 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !19, line: 24, type: !7)
!101 = !DILocation(line: 24, column: 50, scope: !97)
!102 = !DILocation(line: 26, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !19, line: 26, column: 8)
!104 = !DILocation(line: 26, column: 8, scope: !97)
!105 = !DILocation(line: 29, column: 33, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !19, line: 27, column: 5)
!107 = !DILocation(line: 29, column: 16, scope: !106)
!108 = !DILocation(line: 29, column: 14, scope: !106)
!109 = !DILocation(line: 30, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !19, line: 30, column: 13)
!111 = !DILocation(line: 30, column: 18, scope: !110)
!112 = !DILocation(line: 30, column: 13, scope: !106)
!113 = !DILocation(line: 30, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !19, line: 30, column: 27)
!115 = !DILocation(line: 31, column: 5, scope: !106)
!116 = !DILocation(line: 32, column: 12, scope: !97)
!117 = !DILocation(line: 32, column: 5, scope: !97)
!118 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_21_good", scope: !19, file: !19, line: 162, type: !29, scopeLine: 163, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocation(line: 164, column: 5, scope: !118)
!120 = !DILocation(line: 165, column: 5, scope: !118)
!121 = !DILocation(line: 166, column: 1, scope: !118)
!122 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 178, type: !123, scopeLine: 179, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DISubroutineType(types: !124)
!124 = !{!13, !13, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!128 = !DILocalVariable(name: "argc", arg: 1, scope: !122, file: !19, line: 178, type: !13)
!129 = !DILocation(line: 178, column: 14, scope: !122)
!130 = !DILocalVariable(name: "argv", arg: 2, scope: !122, file: !19, line: 178, type: !125)
!131 = !DILocation(line: 178, column: 27, scope: !122)
!132 = !DILocation(line: 181, column: 22, scope: !122)
!133 = !DILocation(line: 181, column: 12, scope: !122)
!134 = !DILocation(line: 181, column: 5, scope: !122)
!135 = !DILocation(line: 183, column: 5, scope: !122)
!136 = !DILocation(line: 184, column: 5, scope: !122)
!137 = !DILocation(line: 185, column: 5, scope: !122)
!138 = !DILocation(line: 188, column: 5, scope: !122)
!139 = !DILocation(line: 189, column: 5, scope: !122)
!140 = !DILocation(line: 190, column: 5, scope: !122)
!141 = !DILocation(line: 192, column: 5, scope: !122)
!142 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 90, type: !29, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!143 = !DILocalVariable(name: "data", scope: !142, file: !19, line: 92, type: !7)
!144 = !DILocation(line: 92, column: 21, scope: !142)
!145 = !DILocation(line: 93, column: 10, scope: !142)
!146 = !DILocation(line: 94, column: 20, scope: !142)
!147 = !DILocation(line: 95, column: 27, scope: !142)
!148 = !DILocation(line: 95, column: 12, scope: !142)
!149 = !DILocation(line: 95, column: 10, scope: !142)
!150 = !DILocalVariable(name: "source", scope: !151, file: !19, line: 97, type: !40)
!151 = distinct !DILexicalBlock(scope: !142, file: !19, line: 96, column: 5)
!152 = !DILocation(line: 97, column: 23, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !154, file: !19, line: 99, type: !46)
!154 = distinct !DILexicalBlock(scope: !151, file: !19, line: 98, column: 9)
!155 = !DILocation(line: 99, column: 20, scope: !154)
!156 = !DILocation(line: 101, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !19, line: 101, column: 13)
!158 = !DILocation(line: 101, column: 18, scope: !157)
!159 = !DILocation(line: 101, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !19, line: 101, column: 13)
!161 = !DILocation(line: 101, column: 27, scope: !160)
!162 = !DILocation(line: 101, column: 13, scope: !157)
!163 = !DILocation(line: 103, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !19, line: 102, column: 13)
!165 = !DILocation(line: 103, column: 17, scope: !164)
!166 = !DILocation(line: 103, column: 27, scope: !164)
!167 = !DILocation(line: 103, column: 34, scope: !164)
!168 = !DILocation(line: 104, column: 24, scope: !164)
!169 = !DILocation(line: 104, column: 17, scope: !164)
!170 = !DILocation(line: 104, column: 27, scope: !164)
!171 = !DILocation(line: 104, column: 34, scope: !164)
!172 = !DILocation(line: 105, column: 13, scope: !164)
!173 = !DILocation(line: 101, column: 35, scope: !160)
!174 = !DILocation(line: 101, column: 13, scope: !160)
!175 = distinct !{!175, !162, !176, !71}
!176 = !DILocation(line: 105, column: 13, scope: !157)
!177 = !DILocalVariable(name: "i", scope: !178, file: !19, line: 108, type: !46)
!178 = distinct !DILexicalBlock(scope: !151, file: !19, line: 107, column: 9)
!179 = !DILocation(line: 108, column: 20, scope: !178)
!180 = !DILocation(line: 110, column: 20, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !19, line: 110, column: 13)
!182 = !DILocation(line: 110, column: 18, scope: !181)
!183 = !DILocation(line: 110, column: 25, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !19, line: 110, column: 13)
!185 = !DILocation(line: 110, column: 27, scope: !184)
!186 = !DILocation(line: 110, column: 13, scope: !181)
!187 = !DILocation(line: 112, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !19, line: 111, column: 13)
!189 = !DILocation(line: 112, column: 22, scope: !188)
!190 = !DILocation(line: 112, column: 34, scope: !188)
!191 = !DILocation(line: 112, column: 27, scope: !188)
!192 = !DILocation(line: 113, column: 13, scope: !188)
!193 = !DILocation(line: 110, column: 35, scope: !184)
!194 = !DILocation(line: 110, column: 13, scope: !184)
!195 = distinct !{!195, !186, !196, !71}
!196 = !DILocation(line: 113, column: 13, scope: !181)
!197 = !DILocation(line: 114, column: 30, scope: !178)
!198 = !DILocation(line: 114, column: 13, scope: !178)
!199 = !DILocation(line: 115, column: 18, scope: !178)
!200 = !DILocation(line: 115, column: 13, scope: !178)
!201 = !DILocation(line: 118, column: 1, scope: !142)
!202 = distinct !DISubprogram(name: "goodG2B1Source", scope: !19, file: !19, line: 74, type: !98, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocalVariable(name: "data", arg: 1, scope: !202, file: !19, line: 74, type: !7)
!204 = !DILocation(line: 74, column: 55, scope: !202)
!205 = !DILocation(line: 76, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !19, line: 76, column: 8)
!207 = !DILocation(line: 76, column: 8, scope: !202)
!208 = !DILocation(line: 79, column: 9, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !19, line: 77, column: 5)
!210 = !DILocation(line: 80, column: 5, scope: !209)
!211 = !DILocation(line: 84, column: 33, scope: !212)
!212 = distinct !DILexicalBlock(scope: !206, file: !19, line: 82, column: 5)
!213 = !DILocation(line: 84, column: 16, scope: !212)
!214 = !DILocation(line: 84, column: 14, scope: !212)
!215 = !DILocation(line: 85, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !19, line: 85, column: 13)
!217 = !DILocation(line: 85, column: 18, scope: !216)
!218 = !DILocation(line: 85, column: 13, scope: !212)
!219 = !DILocation(line: 85, column: 28, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !19, line: 85, column: 27)
!221 = !DILocation(line: 87, column: 12, scope: !202)
!222 = !DILocation(line: 87, column: 5, scope: !202)
!223 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 132, type: !29, scopeLine: 133, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!224 = !DILocalVariable(name: "data", scope: !223, file: !19, line: 134, type: !7)
!225 = !DILocation(line: 134, column: 21, scope: !223)
!226 = !DILocation(line: 135, column: 10, scope: !223)
!227 = !DILocation(line: 136, column: 20, scope: !223)
!228 = !DILocation(line: 137, column: 27, scope: !223)
!229 = !DILocation(line: 137, column: 12, scope: !223)
!230 = !DILocation(line: 137, column: 10, scope: !223)
!231 = !DILocalVariable(name: "source", scope: !232, file: !19, line: 139, type: !40)
!232 = distinct !DILexicalBlock(scope: !223, file: !19, line: 138, column: 5)
!233 = !DILocation(line: 139, column: 23, scope: !232)
!234 = !DILocalVariable(name: "i", scope: !235, file: !19, line: 141, type: !46)
!235 = distinct !DILexicalBlock(scope: !232, file: !19, line: 140, column: 9)
!236 = !DILocation(line: 141, column: 20, scope: !235)
!237 = !DILocation(line: 143, column: 20, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !19, line: 143, column: 13)
!239 = !DILocation(line: 143, column: 18, scope: !238)
!240 = !DILocation(line: 143, column: 25, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !19, line: 143, column: 13)
!242 = !DILocation(line: 143, column: 27, scope: !241)
!243 = !DILocation(line: 143, column: 13, scope: !238)
!244 = !DILocation(line: 145, column: 24, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !19, line: 144, column: 13)
!246 = !DILocation(line: 145, column: 17, scope: !245)
!247 = !DILocation(line: 145, column: 27, scope: !245)
!248 = !DILocation(line: 145, column: 34, scope: !245)
!249 = !DILocation(line: 146, column: 24, scope: !245)
!250 = !DILocation(line: 146, column: 17, scope: !245)
!251 = !DILocation(line: 146, column: 27, scope: !245)
!252 = !DILocation(line: 146, column: 34, scope: !245)
!253 = !DILocation(line: 147, column: 13, scope: !245)
!254 = !DILocation(line: 143, column: 35, scope: !241)
!255 = !DILocation(line: 143, column: 13, scope: !241)
!256 = distinct !{!256, !243, !257, !71}
!257 = !DILocation(line: 147, column: 13, scope: !238)
!258 = !DILocalVariable(name: "i", scope: !259, file: !19, line: 150, type: !46)
!259 = distinct !DILexicalBlock(scope: !232, file: !19, line: 149, column: 9)
!260 = !DILocation(line: 150, column: 20, scope: !259)
!261 = !DILocation(line: 152, column: 20, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !19, line: 152, column: 13)
!263 = !DILocation(line: 152, column: 18, scope: !262)
!264 = !DILocation(line: 152, column: 25, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !19, line: 152, column: 13)
!266 = !DILocation(line: 152, column: 27, scope: !265)
!267 = !DILocation(line: 152, column: 13, scope: !262)
!268 = !DILocation(line: 154, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !19, line: 153, column: 13)
!270 = !DILocation(line: 154, column: 22, scope: !269)
!271 = !DILocation(line: 154, column: 34, scope: !269)
!272 = !DILocation(line: 154, column: 27, scope: !269)
!273 = !DILocation(line: 155, column: 13, scope: !269)
!274 = !DILocation(line: 152, column: 35, scope: !265)
!275 = !DILocation(line: 152, column: 13, scope: !265)
!276 = distinct !{!276, !267, !277, !71}
!277 = !DILocation(line: 155, column: 13, scope: !262)
!278 = !DILocation(line: 156, column: 30, scope: !259)
!279 = !DILocation(line: 156, column: 13, scope: !259)
!280 = !DILocation(line: 157, column: 18, scope: !259)
!281 = !DILocation(line: 157, column: 13, scope: !259)
!282 = !DILocation(line: 160, column: 1, scope: !223)
!283 = distinct !DISubprogram(name: "goodG2B2Source", scope: !19, file: !19, line: 121, type: !98, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!284 = !DILocalVariable(name: "data", arg: 1, scope: !283, file: !19, line: 121, type: !7)
!285 = !DILocation(line: 121, column: 55, scope: !283)
!286 = !DILocation(line: 123, column: 8, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !19, line: 123, column: 8)
!288 = !DILocation(line: 123, column: 8, scope: !283)
!289 = !DILocation(line: 126, column: 33, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !19, line: 124, column: 5)
!291 = !DILocation(line: 126, column: 16, scope: !290)
!292 = !DILocation(line: 126, column: 14, scope: !290)
!293 = !DILocation(line: 127, column: 13, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !19, line: 127, column: 13)
!295 = !DILocation(line: 127, column: 18, scope: !294)
!296 = !DILocation(line: 127, column: 13, scope: !290)
!297 = !DILocation(line: 127, column: 28, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !19, line: 127, column: 27)
!299 = !DILocation(line: 128, column: 5, scope: !290)
!300 = !DILocation(line: 129, column: 12, scope: !283)
!301 = !DILocation(line: 129, column: 5, scope: !283)
