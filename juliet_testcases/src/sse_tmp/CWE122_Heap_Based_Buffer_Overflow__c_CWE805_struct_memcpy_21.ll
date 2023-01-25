; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21_bad() #0 !dbg !28 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
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
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !73
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !73
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !73
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !74
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !75
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !76
  call void @free(i8* %10) #6, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32, i32* @badStatic, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end2, !dbg !86

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !87
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !89
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !90
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !91
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !93
  br i1 %cmp, label %if.then1, label %if.end, !dbg !94

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !97

if.end2:                                          ; preds = %if.end, %entry
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !98
  ret %struct._twoIntsStruct* %3, !dbg !99
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21_good() #0 !dbg !100 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
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
define internal void @goodG2B1() #0 !dbg !124 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !127
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !128
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %call = call %struct._twoIntsStruct* @goodG2B1Source(%struct._twoIntsStruct* %0), !dbg !130
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !141
  %cmp = icmp ult i64 %1, 100, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !147
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !148
  store i32 0, i32* %intOne, align 8, !dbg !149
  %3 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !151
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !152
  store i32 0, i32* %intTwo, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %4, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !159
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !160
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !160
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !160
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !161
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !161
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !162
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !163
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !163
  call void @free(i8* %10) #6, !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2B1Source(%struct._twoIntsStruct* %data) #0 !dbg !166 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !167, metadata !DIExpression()), !dbg !168
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !169
  %tobool = icmp ne i32 %0, 0, !dbg !169
  br i1 %tobool, label %if.then, label %if.else, !dbg !171

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !172
  br label %if.end2, !dbg !174

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !175
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !177
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !178
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !179
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !181
  br i1 %cmp, label %if.then1, label %if.end, !dbg !182

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !183
  unreachable, !dbg !183

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !185
  ret %struct._twoIntsStruct* %3, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !187 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !188, metadata !DIExpression()), !dbg !189
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !190
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !191
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !192
  %call = call %struct._twoIntsStruct* @goodG2B2Source(%struct._twoIntsStruct* %0), !dbg !193
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !194
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !195, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i64* %i, metadata !198, metadata !DIExpression()), !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !204
  %cmp = icmp ult i64 %1, 100, !dbg !206
  br i1 %cmp, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !208
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !210
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !211
  store i32 0, i32* %intOne, align 8, !dbg !212
  %3 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !214
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !215
  store i32 0, i32* %intTwo, align 4, !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !218
  %inc = add i64 %4, 1, !dbg !218
  store i64 %inc, i64* %i, align 8, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !222
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !223
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !223
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !223
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !223
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !224
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !224
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !225
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !226
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !226
  call void @free(i8* %10) #6, !dbg !227
  ret void, !dbg !228
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2B2Source(%struct._twoIntsStruct* %data) #0 !dbg !229 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !230, metadata !DIExpression()), !dbg !231
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !232
  %tobool = icmp ne i32 %0, 0, !dbg !232
  br i1 %tobool, label %if.then, label %if.end2, !dbg !234

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !235
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !237
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !238
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !239
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !241
  br i1 %cmp, label %if.then1, label %if.end, !dbg !242

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !243
  unreachable, !dbg !243

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !245

if.end2:                                          ; preds = %if.end, %entry
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !246
  ret %struct._twoIntsStruct* %3, !dbg !247
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !19, line: 64, type: !13, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !19, line: 65, type: !13, isLocal: true, isDefinition: true)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"clang version 13.0.0"}
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21_bad", scope: !19, file: !19, line: 35, type: !29, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!72 = !DILocation(line: 53, column: 16, scope: !39)
!73 = !DILocation(line: 53, column: 9, scope: !39)
!74 = !DILocation(line: 54, column: 26, scope: !39)
!75 = !DILocation(line: 54, column: 9, scope: !39)
!76 = !DILocation(line: 55, column: 14, scope: !39)
!77 = !DILocation(line: 55, column: 9, scope: !39)
!78 = !DILocation(line: 57, column: 1, scope: !28)
!79 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 24, type: !80, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7}
!82 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !19, line: 24, type: !7)
!83 = !DILocation(line: 24, column: 50, scope: !79)
!84 = !DILocation(line: 26, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !19, line: 26, column: 8)
!86 = !DILocation(line: 26, column: 8, scope: !79)
!87 = !DILocation(line: 29, column: 33, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !19, line: 27, column: 5)
!89 = !DILocation(line: 29, column: 16, scope: !88)
!90 = !DILocation(line: 29, column: 14, scope: !88)
!91 = !DILocation(line: 30, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !19, line: 30, column: 13)
!93 = !DILocation(line: 30, column: 18, scope: !92)
!94 = !DILocation(line: 30, column: 13, scope: !88)
!95 = !DILocation(line: 30, column: 28, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !19, line: 30, column: 27)
!97 = !DILocation(line: 31, column: 5, scope: !88)
!98 = !DILocation(line: 32, column: 12, scope: !79)
!99 = !DILocation(line: 32, column: 5, scope: !79)
!100 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_21_good", scope: !19, file: !19, line: 144, type: !29, scopeLine: 145, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocation(line: 146, column: 5, scope: !100)
!102 = !DILocation(line: 147, column: 5, scope: !100)
!103 = !DILocation(line: 148, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 160, type: !105, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!13, !13, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !19, line: 160, type: !13)
!111 = !DILocation(line: 160, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !19, line: 160, type: !107)
!113 = !DILocation(line: 160, column: 27, scope: !104)
!114 = !DILocation(line: 163, column: 22, scope: !104)
!115 = !DILocation(line: 163, column: 12, scope: !104)
!116 = !DILocation(line: 163, column: 5, scope: !104)
!117 = !DILocation(line: 165, column: 5, scope: !104)
!118 = !DILocation(line: 166, column: 5, scope: !104)
!119 = !DILocation(line: 167, column: 5, scope: !104)
!120 = !DILocation(line: 170, column: 5, scope: !104)
!121 = !DILocation(line: 171, column: 5, scope: !104)
!122 = !DILocation(line: 172, column: 5, scope: !104)
!123 = !DILocation(line: 174, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 84, type: !29, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !19, line: 86, type: !7)
!126 = !DILocation(line: 86, column: 21, scope: !124)
!127 = !DILocation(line: 87, column: 10, scope: !124)
!128 = !DILocation(line: 88, column: 20, scope: !124)
!129 = !DILocation(line: 89, column: 27, scope: !124)
!130 = !DILocation(line: 89, column: 12, scope: !124)
!131 = !DILocation(line: 89, column: 10, scope: !124)
!132 = !DILocalVariable(name: "source", scope: !133, file: !19, line: 91, type: !40)
!133 = distinct !DILexicalBlock(scope: !124, file: !19, line: 90, column: 5)
!134 = !DILocation(line: 91, column: 23, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !19, line: 93, type: !46)
!136 = distinct !DILexicalBlock(scope: !133, file: !19, line: 92, column: 9)
!137 = !DILocation(line: 93, column: 20, scope: !136)
!138 = !DILocation(line: 95, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !19, line: 95, column: 13)
!140 = !DILocation(line: 95, column: 18, scope: !139)
!141 = !DILocation(line: 95, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !19, line: 95, column: 13)
!143 = !DILocation(line: 95, column: 27, scope: !142)
!144 = !DILocation(line: 95, column: 13, scope: !139)
!145 = !DILocation(line: 97, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !19, line: 96, column: 13)
!147 = !DILocation(line: 97, column: 17, scope: !146)
!148 = !DILocation(line: 97, column: 27, scope: !146)
!149 = !DILocation(line: 97, column: 34, scope: !146)
!150 = !DILocation(line: 98, column: 24, scope: !146)
!151 = !DILocation(line: 98, column: 17, scope: !146)
!152 = !DILocation(line: 98, column: 27, scope: !146)
!153 = !DILocation(line: 98, column: 34, scope: !146)
!154 = !DILocation(line: 99, column: 13, scope: !146)
!155 = !DILocation(line: 95, column: 35, scope: !142)
!156 = !DILocation(line: 95, column: 13, scope: !142)
!157 = distinct !{!157, !144, !158, !71}
!158 = !DILocation(line: 99, column: 13, scope: !139)
!159 = !DILocation(line: 102, column: 16, scope: !133)
!160 = !DILocation(line: 102, column: 9, scope: !133)
!161 = !DILocation(line: 103, column: 26, scope: !133)
!162 = !DILocation(line: 103, column: 9, scope: !133)
!163 = !DILocation(line: 104, column: 14, scope: !133)
!164 = !DILocation(line: 104, column: 9, scope: !133)
!165 = !DILocation(line: 106, column: 1, scope: !124)
!166 = distinct !DISubprogram(name: "goodG2B1Source", scope: !19, file: !19, line: 68, type: !80, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocalVariable(name: "data", arg: 1, scope: !166, file: !19, line: 68, type: !7)
!168 = !DILocation(line: 68, column: 55, scope: !166)
!169 = !DILocation(line: 70, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !19, line: 70, column: 8)
!171 = !DILocation(line: 70, column: 8, scope: !166)
!172 = !DILocation(line: 73, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !19, line: 71, column: 5)
!174 = !DILocation(line: 74, column: 5, scope: !173)
!175 = !DILocation(line: 78, column: 33, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !19, line: 76, column: 5)
!177 = !DILocation(line: 78, column: 16, scope: !176)
!178 = !DILocation(line: 78, column: 14, scope: !176)
!179 = !DILocation(line: 79, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !19, line: 79, column: 13)
!181 = !DILocation(line: 79, column: 18, scope: !180)
!182 = !DILocation(line: 79, column: 13, scope: !176)
!183 = !DILocation(line: 79, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !19, line: 79, column: 27)
!185 = !DILocation(line: 81, column: 12, scope: !166)
!186 = !DILocation(line: 81, column: 5, scope: !166)
!187 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 120, type: !29, scopeLine: 121, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocalVariable(name: "data", scope: !187, file: !19, line: 122, type: !7)
!189 = !DILocation(line: 122, column: 21, scope: !187)
!190 = !DILocation(line: 123, column: 10, scope: !187)
!191 = !DILocation(line: 124, column: 20, scope: !187)
!192 = !DILocation(line: 125, column: 27, scope: !187)
!193 = !DILocation(line: 125, column: 12, scope: !187)
!194 = !DILocation(line: 125, column: 10, scope: !187)
!195 = !DILocalVariable(name: "source", scope: !196, file: !19, line: 127, type: !40)
!196 = distinct !DILexicalBlock(scope: !187, file: !19, line: 126, column: 5)
!197 = !DILocation(line: 127, column: 23, scope: !196)
!198 = !DILocalVariable(name: "i", scope: !199, file: !19, line: 129, type: !46)
!199 = distinct !DILexicalBlock(scope: !196, file: !19, line: 128, column: 9)
!200 = !DILocation(line: 129, column: 20, scope: !199)
!201 = !DILocation(line: 131, column: 20, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !19, line: 131, column: 13)
!203 = !DILocation(line: 131, column: 18, scope: !202)
!204 = !DILocation(line: 131, column: 25, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !19, line: 131, column: 13)
!206 = !DILocation(line: 131, column: 27, scope: !205)
!207 = !DILocation(line: 131, column: 13, scope: !202)
!208 = !DILocation(line: 133, column: 24, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !19, line: 132, column: 13)
!210 = !DILocation(line: 133, column: 17, scope: !209)
!211 = !DILocation(line: 133, column: 27, scope: !209)
!212 = !DILocation(line: 133, column: 34, scope: !209)
!213 = !DILocation(line: 134, column: 24, scope: !209)
!214 = !DILocation(line: 134, column: 17, scope: !209)
!215 = !DILocation(line: 134, column: 27, scope: !209)
!216 = !DILocation(line: 134, column: 34, scope: !209)
!217 = !DILocation(line: 135, column: 13, scope: !209)
!218 = !DILocation(line: 131, column: 35, scope: !205)
!219 = !DILocation(line: 131, column: 13, scope: !205)
!220 = distinct !{!220, !207, !221, !71}
!221 = !DILocation(line: 135, column: 13, scope: !202)
!222 = !DILocation(line: 138, column: 16, scope: !196)
!223 = !DILocation(line: 138, column: 9, scope: !196)
!224 = !DILocation(line: 139, column: 26, scope: !196)
!225 = !DILocation(line: 139, column: 9, scope: !196)
!226 = !DILocation(line: 140, column: 14, scope: !196)
!227 = !DILocation(line: 140, column: 9, scope: !196)
!228 = !DILocation(line: 142, column: 1, scope: !187)
!229 = distinct !DISubprogram(name: "goodG2B2Source", scope: !19, file: !19, line: 109, type: !80, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!230 = !DILocalVariable(name: "data", arg: 1, scope: !229, file: !19, line: 109, type: !7)
!231 = !DILocation(line: 109, column: 55, scope: !229)
!232 = !DILocation(line: 111, column: 8, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !19, line: 111, column: 8)
!234 = !DILocation(line: 111, column: 8, scope: !229)
!235 = !DILocation(line: 114, column: 33, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !19, line: 112, column: 5)
!237 = !DILocation(line: 114, column: 16, scope: !236)
!238 = !DILocation(line: 114, column: 14, scope: !236)
!239 = !DILocation(line: 115, column: 13, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !19, line: 115, column: 13)
!241 = !DILocation(line: 115, column: 18, scope: !240)
!242 = !DILocation(line: 115, column: 13, scope: !236)
!243 = !DILocation(line: 115, column: 28, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !19, line: 115, column: 27)
!245 = !DILocation(line: 116, column: 5, scope: !236)
!246 = !DILocation(line: 117, column: 12, scope: !229)
!247 = !DILocation(line: 117, column: 5, scope: !229)
