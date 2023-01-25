; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end3, !dbg !29

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !36
  br i1 %cmp, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !56
  %cmp4 = icmp ult i64 %2, 100, !dbg !58
  br i1 %cmp4, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %5, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !75, metadata !DIExpression()), !dbg !77
  store i64 0, i64* %i6, align 8, !dbg !78
  br label %for.cond7, !dbg !80

for.cond7:                                        ; preds = %for.inc12, %for.end
  %6 = load i64, i64* %i6, align 8, !dbg !81
  %cmp8 = icmp ult i64 %6, 100, !dbg !83
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !84

for.body9:                                        ; preds = %for.cond7
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !85
  %8 = load i64, i64* %i6, align 8, !dbg !87
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !85
  %9 = load i64, i64* %i6, align 8, !dbg !88
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !89
  %10 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !89
  %11 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !89
  br label %for.inc12, !dbg !90

for.inc12:                                        ; preds = %for.body9
  %12 = load i64, i64* %i6, align 8, !dbg !91
  %inc13 = add i64 %12, 1, !dbg !91
  store i64 %inc13, i64* %i6, align 8, !dbg !91
  br label %for.cond7, !dbg !92, !llvm.loop !93

for.end14:                                        ; preds = %for.cond7
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !95
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !96
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !97
  call void @free(i8* %15) #6, !dbg !98
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08_good() #0 !dbg !100 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !124 {
entry:
  ret i32 1, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !128 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %call = call i32 @staticReturnsFalse(), !dbg !132
  %tobool = icmp ne i32 %call, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !135
  br label %if.end3, !dbg !137

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !138
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !140
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !144
  br i1 %cmp, label %if.then2, label %if.end, !dbg !145

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !157
  %cmp4 = icmp ult i64 %2, 100, !dbg !159
  br i1 %cmp4, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !163
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !164
  store i32 0, i32* %intOne, align 8, !dbg !165
  %4 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !167
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !168
  store i32 0, i32* %intTwo, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %5, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !175, metadata !DIExpression()), !dbg !177
  store i64 0, i64* %i6, align 8, !dbg !178
  br label %for.cond7, !dbg !180

for.cond7:                                        ; preds = %for.inc12, %for.end
  %6 = load i64, i64* %i6, align 8, !dbg !181
  %cmp8 = icmp ult i64 %6, 100, !dbg !183
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !184

for.body9:                                        ; preds = %for.cond7
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %8 = load i64, i64* %i6, align 8, !dbg !187
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !185
  %9 = load i64, i64* %i6, align 8, !dbg !188
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !189
  %10 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !189
  %11 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !189
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !189
  br label %for.inc12, !dbg !190

for.inc12:                                        ; preds = %for.body9
  %12 = load i64, i64* %i6, align 8, !dbg !191
  %inc13 = add i64 %12, 1, !dbg !191
  store i64 %inc13, i64* %i6, align 8, !dbg !191
  br label %for.cond7, !dbg !192, !llvm.loop !193

for.end14:                                        ; preds = %for.cond7
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !195
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !195
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !196
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !197
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !197
  call void @free(i8* %15) #6, !dbg !198
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !200 {
entry:
  ret i32 0, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !202 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !203, metadata !DIExpression()), !dbg !204
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !205
  %call = call i32 @staticReturnsTrue(), !dbg !206
  %tobool = icmp ne i32 %call, 0, !dbg !206
  br i1 %tobool, label %if.then, label %if.end3, !dbg !208

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !209
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !211
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !212
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !213
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !215
  br i1 %cmp, label %if.then2, label %if.end, !dbg !216

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
  %2 = load i64, i64* %i, align 8, !dbg !229
  %cmp4 = icmp ult i64 %2, 100, !dbg !231
  br i1 %cmp4, label %for.body, label %for.end, !dbg !232

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !233
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !235
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !236
  store i32 0, i32* %intOne, align 8, !dbg !237
  %4 = load i64, i64* %i, align 8, !dbg !238
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !239
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !240
  store i32 0, i32* %intTwo, align 4, !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !243
  %inc = add i64 %5, 1, !dbg !243
  store i64 %inc, i64* %i, align 8, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !247, metadata !DIExpression()), !dbg !249
  store i64 0, i64* %i6, align 8, !dbg !250
  br label %for.cond7, !dbg !252

for.cond7:                                        ; preds = %for.inc12, %for.end
  %6 = load i64, i64* %i6, align 8, !dbg !253
  %cmp8 = icmp ult i64 %6, 100, !dbg !255
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !256

for.body9:                                        ; preds = %for.cond7
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !257
  %8 = load i64, i64* %i6, align 8, !dbg !259
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !257
  %9 = load i64, i64* %i6, align 8, !dbg !260
  %arrayidx11 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !261
  %10 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !261
  %11 = bitcast %struct._twoIntsStruct* %arrayidx11 to i8*, !dbg !261
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !261
  br label %for.inc12, !dbg !262

for.inc12:                                        ; preds = %for.body9
  %12 = load i64, i64* %i6, align 8, !dbg !263
  %inc13 = add i64 %12, 1, !dbg !263
  store i64 %inc13, i64* %i6, align 8, !dbg !263
  br label %for.cond7, !dbg !264, !llvm.loop !265

for.end14:                                        ; preds = %for.cond7
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !267
  %arrayidx15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !267
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx15), !dbg !268
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !269
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !269
  call void @free(i8* %15) #6, !dbg !270
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08_bad", scope: !21, file: !21, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 37, type: !4)
!25 = !DILocation(line: 37, column: 21, scope: !20)
!26 = !DILocation(line: 38, column: 10, scope: !20)
!27 = !DILocation(line: 39, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 39, column: 8)
!29 = !DILocation(line: 39, column: 8, scope: !20)
!30 = !DILocation(line: 42, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !21, line: 40, column: 5)
!32 = !DILocation(line: 42, column: 16, scope: !31)
!33 = !DILocation(line: 42, column: 14, scope: !31)
!34 = !DILocation(line: 43, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 43, column: 13)
!36 = !DILocation(line: 43, column: 18, scope: !35)
!37 = !DILocation(line: 43, column: 13, scope: !31)
!38 = !DILocation(line: 43, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !21, line: 43, column: 27)
!40 = !DILocation(line: 44, column: 5, scope: !31)
!41 = !DILocalVariable(name: "source", scope: !42, file: !21, line: 46, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !21, line: 45, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 46, column: 23, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !21, line: 48, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !21, line: 47, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 48, column: 20, scope: !48)
!53 = !DILocation(line: 50, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !21, line: 50, column: 13)
!55 = !DILocation(line: 50, column: 18, scope: !54)
!56 = !DILocation(line: 50, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !21, line: 50, column: 13)
!58 = !DILocation(line: 50, column: 27, scope: !57)
!59 = !DILocation(line: 50, column: 13, scope: !54)
!60 = !DILocation(line: 52, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !21, line: 51, column: 13)
!62 = !DILocation(line: 52, column: 17, scope: !61)
!63 = !DILocation(line: 52, column: 27, scope: !61)
!64 = !DILocation(line: 52, column: 34, scope: !61)
!65 = !DILocation(line: 53, column: 24, scope: !61)
!66 = !DILocation(line: 53, column: 17, scope: !61)
!67 = !DILocation(line: 53, column: 27, scope: !61)
!68 = !DILocation(line: 53, column: 34, scope: !61)
!69 = !DILocation(line: 54, column: 13, scope: !61)
!70 = !DILocation(line: 50, column: 35, scope: !57)
!71 = !DILocation(line: 50, column: 13, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 54, column: 13, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocalVariable(name: "i", scope: !76, file: !21, line: 57, type: !49)
!76 = distinct !DILexicalBlock(scope: !42, file: !21, line: 56, column: 9)
!77 = !DILocation(line: 57, column: 20, scope: !76)
!78 = !DILocation(line: 59, column: 20, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !21, line: 59, column: 13)
!80 = !DILocation(line: 59, column: 18, scope: !79)
!81 = !DILocation(line: 59, column: 25, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !21, line: 59, column: 13)
!83 = !DILocation(line: 59, column: 27, scope: !82)
!84 = !DILocation(line: 59, column: 13, scope: !79)
!85 = !DILocation(line: 61, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !21, line: 60, column: 13)
!87 = !DILocation(line: 61, column: 22, scope: !86)
!88 = !DILocation(line: 61, column: 34, scope: !86)
!89 = !DILocation(line: 61, column: 27, scope: !86)
!90 = !DILocation(line: 62, column: 13, scope: !86)
!91 = !DILocation(line: 59, column: 35, scope: !82)
!92 = !DILocation(line: 59, column: 13, scope: !82)
!93 = distinct !{!93, !84, !94, !74}
!94 = !DILocation(line: 62, column: 13, scope: !79)
!95 = !DILocation(line: 63, column: 30, scope: !76)
!96 = !DILocation(line: 63, column: 13, scope: !76)
!97 = !DILocation(line: 64, column: 18, scope: !76)
!98 = !DILocation(line: 64, column: 13, scope: !76)
!99 = !DILocation(line: 67, column: 1, scope: !20)
!100 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_08_good", scope: !21, file: !21, line: 148, type: !22, scopeLine: 149, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 150, column: 5, scope: !100)
!102 = !DILocation(line: 151, column: 5, scope: !100)
!103 = !DILocation(line: 152, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 164, type: !105, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!10, !10, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !21, line: 164, type: !10)
!111 = !DILocation(line: 164, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !21, line: 164, type: !107)
!113 = !DILocation(line: 164, column: 27, scope: !104)
!114 = !DILocation(line: 167, column: 22, scope: !104)
!115 = !DILocation(line: 167, column: 12, scope: !104)
!116 = !DILocation(line: 167, column: 5, scope: !104)
!117 = !DILocation(line: 169, column: 5, scope: !104)
!118 = !DILocation(line: 170, column: 5, scope: !104)
!119 = !DILocation(line: 171, column: 5, scope: !104)
!120 = !DILocation(line: 174, column: 5, scope: !104)
!121 = !DILocation(line: 175, column: 5, scope: !104)
!122 = !DILocation(line: 176, column: 5, scope: !104)
!123 = !DILocation(line: 178, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !21, file: !21, line: 23, type: !125, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DISubroutineType(types: !126)
!126 = !{!10}
!127 = !DILocation(line: 25, column: 5, scope: !124)
!128 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 74, type: !22, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", scope: !128, file: !21, line: 76, type: !4)
!130 = !DILocation(line: 76, column: 21, scope: !128)
!131 = !DILocation(line: 77, column: 10, scope: !128)
!132 = !DILocation(line: 78, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !21, line: 78, column: 8)
!134 = !DILocation(line: 78, column: 8, scope: !128)
!135 = !DILocation(line: 81, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !21, line: 79, column: 5)
!137 = !DILocation(line: 82, column: 5, scope: !136)
!138 = !DILocation(line: 86, column: 33, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !21, line: 84, column: 5)
!140 = !DILocation(line: 86, column: 16, scope: !139)
!141 = !DILocation(line: 86, column: 14, scope: !139)
!142 = !DILocation(line: 87, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !21, line: 87, column: 13)
!144 = !DILocation(line: 87, column: 18, scope: !143)
!145 = !DILocation(line: 87, column: 13, scope: !139)
!146 = !DILocation(line: 87, column: 28, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !21, line: 87, column: 27)
!148 = !DILocalVariable(name: "source", scope: !149, file: !21, line: 90, type: !43)
!149 = distinct !DILexicalBlock(scope: !128, file: !21, line: 89, column: 5)
!150 = !DILocation(line: 90, column: 23, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !152, file: !21, line: 92, type: !49)
!152 = distinct !DILexicalBlock(scope: !149, file: !21, line: 91, column: 9)
!153 = !DILocation(line: 92, column: 20, scope: !152)
!154 = !DILocation(line: 94, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !21, line: 94, column: 13)
!156 = !DILocation(line: 94, column: 18, scope: !155)
!157 = !DILocation(line: 94, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !21, line: 94, column: 13)
!159 = !DILocation(line: 94, column: 27, scope: !158)
!160 = !DILocation(line: 94, column: 13, scope: !155)
!161 = !DILocation(line: 96, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !21, line: 95, column: 13)
!163 = !DILocation(line: 96, column: 17, scope: !162)
!164 = !DILocation(line: 96, column: 27, scope: !162)
!165 = !DILocation(line: 96, column: 34, scope: !162)
!166 = !DILocation(line: 97, column: 24, scope: !162)
!167 = !DILocation(line: 97, column: 17, scope: !162)
!168 = !DILocation(line: 97, column: 27, scope: !162)
!169 = !DILocation(line: 97, column: 34, scope: !162)
!170 = !DILocation(line: 98, column: 13, scope: !162)
!171 = !DILocation(line: 94, column: 35, scope: !158)
!172 = !DILocation(line: 94, column: 13, scope: !158)
!173 = distinct !{!173, !160, !174, !74}
!174 = !DILocation(line: 98, column: 13, scope: !155)
!175 = !DILocalVariable(name: "i", scope: !176, file: !21, line: 101, type: !49)
!176 = distinct !DILexicalBlock(scope: !149, file: !21, line: 100, column: 9)
!177 = !DILocation(line: 101, column: 20, scope: !176)
!178 = !DILocation(line: 103, column: 20, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !21, line: 103, column: 13)
!180 = !DILocation(line: 103, column: 18, scope: !179)
!181 = !DILocation(line: 103, column: 25, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !21, line: 103, column: 13)
!183 = !DILocation(line: 103, column: 27, scope: !182)
!184 = !DILocation(line: 103, column: 13, scope: !179)
!185 = !DILocation(line: 105, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !21, line: 104, column: 13)
!187 = !DILocation(line: 105, column: 22, scope: !186)
!188 = !DILocation(line: 105, column: 34, scope: !186)
!189 = !DILocation(line: 105, column: 27, scope: !186)
!190 = !DILocation(line: 106, column: 13, scope: !186)
!191 = !DILocation(line: 103, column: 35, scope: !182)
!192 = !DILocation(line: 103, column: 13, scope: !182)
!193 = distinct !{!193, !184, !194, !74}
!194 = !DILocation(line: 106, column: 13, scope: !179)
!195 = !DILocation(line: 107, column: 30, scope: !176)
!196 = !DILocation(line: 107, column: 13, scope: !176)
!197 = !DILocation(line: 108, column: 18, scope: !176)
!198 = !DILocation(line: 108, column: 13, scope: !176)
!199 = !DILocation(line: 111, column: 1, scope: !128)
!200 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !21, file: !21, line: 28, type: !125, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!201 = !DILocation(line: 30, column: 5, scope: !200)
!202 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 114, type: !22, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!203 = !DILocalVariable(name: "data", scope: !202, file: !21, line: 116, type: !4)
!204 = !DILocation(line: 116, column: 21, scope: !202)
!205 = !DILocation(line: 117, column: 10, scope: !202)
!206 = !DILocation(line: 118, column: 8, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !21, line: 118, column: 8)
!208 = !DILocation(line: 118, column: 8, scope: !202)
!209 = !DILocation(line: 121, column: 33, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !21, line: 119, column: 5)
!211 = !DILocation(line: 121, column: 16, scope: !210)
!212 = !DILocation(line: 121, column: 14, scope: !210)
!213 = !DILocation(line: 122, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !21, line: 122, column: 13)
!215 = !DILocation(line: 122, column: 18, scope: !214)
!216 = !DILocation(line: 122, column: 13, scope: !210)
!217 = !DILocation(line: 122, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !21, line: 122, column: 27)
!219 = !DILocation(line: 123, column: 5, scope: !210)
!220 = !DILocalVariable(name: "source", scope: !221, file: !21, line: 125, type: !43)
!221 = distinct !DILexicalBlock(scope: !202, file: !21, line: 124, column: 5)
!222 = !DILocation(line: 125, column: 23, scope: !221)
!223 = !DILocalVariable(name: "i", scope: !224, file: !21, line: 127, type: !49)
!224 = distinct !DILexicalBlock(scope: !221, file: !21, line: 126, column: 9)
!225 = !DILocation(line: 127, column: 20, scope: !224)
!226 = !DILocation(line: 129, column: 20, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !21, line: 129, column: 13)
!228 = !DILocation(line: 129, column: 18, scope: !227)
!229 = !DILocation(line: 129, column: 25, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !21, line: 129, column: 13)
!231 = !DILocation(line: 129, column: 27, scope: !230)
!232 = !DILocation(line: 129, column: 13, scope: !227)
!233 = !DILocation(line: 131, column: 24, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !21, line: 130, column: 13)
!235 = !DILocation(line: 131, column: 17, scope: !234)
!236 = !DILocation(line: 131, column: 27, scope: !234)
!237 = !DILocation(line: 131, column: 34, scope: !234)
!238 = !DILocation(line: 132, column: 24, scope: !234)
!239 = !DILocation(line: 132, column: 17, scope: !234)
!240 = !DILocation(line: 132, column: 27, scope: !234)
!241 = !DILocation(line: 132, column: 34, scope: !234)
!242 = !DILocation(line: 133, column: 13, scope: !234)
!243 = !DILocation(line: 129, column: 35, scope: !230)
!244 = !DILocation(line: 129, column: 13, scope: !230)
!245 = distinct !{!245, !232, !246, !74}
!246 = !DILocation(line: 133, column: 13, scope: !227)
!247 = !DILocalVariable(name: "i", scope: !248, file: !21, line: 136, type: !49)
!248 = distinct !DILexicalBlock(scope: !221, file: !21, line: 135, column: 9)
!249 = !DILocation(line: 136, column: 20, scope: !248)
!250 = !DILocation(line: 138, column: 20, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !21, line: 138, column: 13)
!252 = !DILocation(line: 138, column: 18, scope: !251)
!253 = !DILocation(line: 138, column: 25, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !21, line: 138, column: 13)
!255 = !DILocation(line: 138, column: 27, scope: !254)
!256 = !DILocation(line: 138, column: 13, scope: !251)
!257 = !DILocation(line: 140, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !21, line: 139, column: 13)
!259 = !DILocation(line: 140, column: 22, scope: !258)
!260 = !DILocation(line: 140, column: 34, scope: !258)
!261 = !DILocation(line: 140, column: 27, scope: !258)
!262 = !DILocation(line: 141, column: 13, scope: !258)
!263 = !DILocation(line: 138, column: 35, scope: !254)
!264 = !DILocation(line: 138, column: 13, scope: !254)
!265 = distinct !{!265, !256, !266, !74}
!266 = !DILocation(line: 141, column: 13, scope: !251)
!267 = !DILocation(line: 142, column: 30, scope: !248)
!268 = !DILocation(line: 142, column: 13, scope: !248)
!269 = !DILocation(line: 143, column: 18, scope: !248)
!270 = !DILocation(line: 143, column: 13, scope: !248)
!271 = !DILocation(line: 146, column: 1, scope: !202)
