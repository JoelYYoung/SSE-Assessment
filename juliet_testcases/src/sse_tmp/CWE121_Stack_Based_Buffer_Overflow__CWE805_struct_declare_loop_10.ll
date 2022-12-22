; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @globalTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %1, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %4, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !73, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i2, align 8, !dbg !76
  br label %for.cond3, !dbg !78

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !79
  %cmp4 = icmp ult i64 %5, 100, !dbg !81
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !82

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %7 = load i64, i64* %i2, align 8, !dbg !85
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !83
  %8 = load i64, i64* %i2, align 8, !dbg !86
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !87
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !87
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !87
  br label %for.inc8, !dbg !88

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !89
  %inc9 = add i64 %11, 1, !dbg !89
  store i64 %inc9, i64* %i2, align 8, !dbg !89
  br label %for.cond3, !dbg !90, !llvm.loop !91

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !93
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10_good() #0 !dbg !96 {
entry:
  call void @goodG2B1(), !dbg !97
  call void @goodG2B2(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #5, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #5, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !120 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i32, i32* @globalFalse, align 4, !dbg !127
  %tobool = icmp ne i32 %0, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.else, !dbg !129

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !130
  br label %if.end, !dbg !132

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !133
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !135
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !145
  %cmp = icmp ult i64 %1, 100, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !151
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !152
  store i32 0, i32* %intOne, align 8, !dbg !153
  %3 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !155
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !156
  store i32 0, i32* %intTwo, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %4, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !163, metadata !DIExpression()), !dbg !165
  store i64 0, i64* %i2, align 8, !dbg !166
  br label %for.cond3, !dbg !168

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !169
  %cmp4 = icmp ult i64 %5, 100, !dbg !171
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !172

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !173
  %7 = load i64, i64* %i2, align 8, !dbg !175
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !173
  %8 = load i64, i64* %i2, align 8, !dbg !176
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !177
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !177
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !177
  br label %for.inc8, !dbg !178

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !179
  %inc9 = add i64 %11, 1, !dbg !179
  store i64 %inc9, i64* %i2, align 8, !dbg !179
  br label %for.cond3, !dbg !180, !llvm.loop !181

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !183
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !184
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !186 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !191, metadata !DIExpression()), !dbg !192
  %0 = load i32, i32* @globalTrue, align 4, !dbg !193
  %tobool = icmp ne i32 %0, 0, !dbg !193
  br i1 %tobool, label %if.then, label %if.end, !dbg !195

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !196
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !198
  br label %if.end, !dbg !199

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i64* %i, metadata !203, metadata !DIExpression()), !dbg !205
  store i64 0, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !209
  %cmp = icmp ult i64 %1, 100, !dbg !211
  br i1 %cmp, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !215
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !216
  store i32 0, i32* %intOne, align 8, !dbg !217
  %3 = load i64, i64* %i, align 8, !dbg !218
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !219
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !220
  store i32 0, i32* %intTwo, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !223
  %inc = add i64 %4, 1, !dbg !223
  store i64 %inc, i64* %i, align 8, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !227, metadata !DIExpression()), !dbg !229
  store i64 0, i64* %i2, align 8, !dbg !230
  br label %for.cond3, !dbg !232

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !233
  %cmp4 = icmp ult i64 %5, 100, !dbg !235
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !236

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !237
  %7 = load i64, i64* %i2, align 8, !dbg !239
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !237
  %8 = load i64, i64* %i2, align 8, !dbg !240
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !241
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !241
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !241
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !241
  br label %for.inc8, !dbg !242

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !243
  %inc9 = add i64 %11, 1, !dbg !243
  store i64 %inc9, i64* %i2, align 8, !dbg !243
  br label %for.cond3, !dbg !244, !llvm.loop !245

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !247
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !247
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !248
  ret void, !dbg !249
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 24, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 25, column: 19, scope: !11)
!35 = !DILocation(line: 26, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!37 = !DILocation(line: 26, column: 8, scope: !11)
!38 = !DILocation(line: 30, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 5)
!40 = !DILocation(line: 30, column: 14, scope: !39)
!41 = !DILocation(line: 31, column: 5, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 33, type: !31)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!44 = !DILocation(line: 33, column: 23, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 35, type: !47)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 34, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 20, scope: !46)
!51 = !DILocation(line: 37, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !12, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 18, scope: !52)
!54 = !DILocation(line: 37, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 27, scope: !55)
!57 = !DILocation(line: 37, column: 13, scope: !52)
!58 = !DILocation(line: 39, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 38, column: 13)
!60 = !DILocation(line: 39, column: 17, scope: !59)
!61 = !DILocation(line: 39, column: 27, scope: !59)
!62 = !DILocation(line: 39, column: 34, scope: !59)
!63 = !DILocation(line: 40, column: 24, scope: !59)
!64 = !DILocation(line: 40, column: 17, scope: !59)
!65 = !DILocation(line: 40, column: 27, scope: !59)
!66 = !DILocation(line: 40, column: 34, scope: !59)
!67 = !DILocation(line: 41, column: 13, scope: !59)
!68 = !DILocation(line: 37, column: 35, scope: !55)
!69 = !DILocation(line: 37, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 41, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocalVariable(name: "i", scope: !74, file: !12, line: 44, type: !47)
!74 = distinct !DILexicalBlock(scope: !43, file: !12, line: 43, column: 9)
!75 = !DILocation(line: 44, column: 20, scope: !74)
!76 = !DILocation(line: 46, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 46, column: 13)
!78 = !DILocation(line: 46, column: 18, scope: !77)
!79 = !DILocation(line: 46, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 46, column: 13)
!81 = !DILocation(line: 46, column: 27, scope: !80)
!82 = !DILocation(line: 46, column: 13, scope: !77)
!83 = !DILocation(line: 48, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 47, column: 13)
!85 = !DILocation(line: 48, column: 22, scope: !84)
!86 = !DILocation(line: 48, column: 34, scope: !84)
!87 = !DILocation(line: 48, column: 27, scope: !84)
!88 = !DILocation(line: 49, column: 13, scope: !84)
!89 = !DILocation(line: 46, column: 35, scope: !80)
!90 = !DILocation(line: 46, column: 13, scope: !80)
!91 = distinct !{!91, !82, !92, !72}
!92 = !DILocation(line: 49, column: 13, scope: !77)
!93 = !DILocation(line: 50, column: 30, scope: !74)
!94 = !DILocation(line: 50, column: 13, scope: !74)
!95 = !DILocation(line: 53, column: 1, scope: !11)
!96 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_10_good", scope: !12, file: !12, line: 132, type: !13, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 134, column: 5, scope: !96)
!98 = !DILocation(line: 135, column: 5, scope: !96)
!99 = !DILocation(line: 136, column: 1, scope: !96)
!100 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 148, type: !101, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!22, !22, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !12, line: 148, type: !22)
!107 = !DILocation(line: 148, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !12, line: 148, type: !103)
!109 = !DILocation(line: 148, column: 27, scope: !100)
!110 = !DILocation(line: 151, column: 22, scope: !100)
!111 = !DILocation(line: 151, column: 12, scope: !100)
!112 = !DILocation(line: 151, column: 5, scope: !100)
!113 = !DILocation(line: 153, column: 5, scope: !100)
!114 = !DILocation(line: 154, column: 5, scope: !100)
!115 = !DILocation(line: 155, column: 5, scope: !100)
!116 = !DILocation(line: 158, column: 5, scope: !100)
!117 = !DILocation(line: 159, column: 5, scope: !100)
!118 = !DILocation(line: 160, column: 5, scope: !100)
!119 = !DILocation(line: 162, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 62, type: !16)
!122 = !DILocation(line: 62, column: 21, scope: !120)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !12, line: 63, type: !26)
!124 = !DILocation(line: 63, column: 19, scope: !120)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !12, line: 64, type: !31)
!126 = !DILocation(line: 64, column: 19, scope: !120)
!127 = !DILocation(line: 65, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !12, line: 65, column: 8)
!129 = !DILocation(line: 65, column: 8, scope: !120)
!130 = !DILocation(line: 68, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 66, column: 5)
!132 = !DILocation(line: 69, column: 5, scope: !131)
!133 = !DILocation(line: 73, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !12, line: 71, column: 5)
!135 = !DILocation(line: 73, column: 14, scope: !134)
!136 = !DILocalVariable(name: "source", scope: !137, file: !12, line: 76, type: !31)
!137 = distinct !DILexicalBlock(scope: !120, file: !12, line: 75, column: 5)
!138 = !DILocation(line: 76, column: 23, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !12, line: 78, type: !47)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 77, column: 9)
!141 = !DILocation(line: 78, column: 20, scope: !140)
!142 = !DILocation(line: 80, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 80, column: 13)
!144 = !DILocation(line: 80, column: 18, scope: !143)
!145 = !DILocation(line: 80, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 80, column: 13)
!147 = !DILocation(line: 80, column: 27, scope: !146)
!148 = !DILocation(line: 80, column: 13, scope: !143)
!149 = !DILocation(line: 82, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 81, column: 13)
!151 = !DILocation(line: 82, column: 17, scope: !150)
!152 = !DILocation(line: 82, column: 27, scope: !150)
!153 = !DILocation(line: 82, column: 34, scope: !150)
!154 = !DILocation(line: 83, column: 24, scope: !150)
!155 = !DILocation(line: 83, column: 17, scope: !150)
!156 = !DILocation(line: 83, column: 27, scope: !150)
!157 = !DILocation(line: 83, column: 34, scope: !150)
!158 = !DILocation(line: 84, column: 13, scope: !150)
!159 = !DILocation(line: 80, column: 35, scope: !146)
!160 = !DILocation(line: 80, column: 13, scope: !146)
!161 = distinct !{!161, !148, !162, !72}
!162 = !DILocation(line: 84, column: 13, scope: !143)
!163 = !DILocalVariable(name: "i", scope: !164, file: !12, line: 87, type: !47)
!164 = distinct !DILexicalBlock(scope: !137, file: !12, line: 86, column: 9)
!165 = !DILocation(line: 87, column: 20, scope: !164)
!166 = !DILocation(line: 89, column: 20, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 89, column: 13)
!168 = !DILocation(line: 89, column: 18, scope: !167)
!169 = !DILocation(line: 89, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !12, line: 89, column: 13)
!171 = !DILocation(line: 89, column: 27, scope: !170)
!172 = !DILocation(line: 89, column: 13, scope: !167)
!173 = !DILocation(line: 91, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !12, line: 90, column: 13)
!175 = !DILocation(line: 91, column: 22, scope: !174)
!176 = !DILocation(line: 91, column: 34, scope: !174)
!177 = !DILocation(line: 91, column: 27, scope: !174)
!178 = !DILocation(line: 92, column: 13, scope: !174)
!179 = !DILocation(line: 89, column: 35, scope: !170)
!180 = !DILocation(line: 89, column: 13, scope: !170)
!181 = distinct !{!181, !172, !182, !72}
!182 = !DILocation(line: 92, column: 13, scope: !167)
!183 = !DILocation(line: 93, column: 30, scope: !164)
!184 = !DILocation(line: 93, column: 13, scope: !164)
!185 = !DILocation(line: 96, column: 1, scope: !120)
!186 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!187 = !DILocalVariable(name: "data", scope: !186, file: !12, line: 101, type: !16)
!188 = !DILocation(line: 101, column: 21, scope: !186)
!189 = !DILocalVariable(name: "dataBadBuffer", scope: !186, file: !12, line: 102, type: !26)
!190 = !DILocation(line: 102, column: 19, scope: !186)
!191 = !DILocalVariable(name: "dataGoodBuffer", scope: !186, file: !12, line: 103, type: !31)
!192 = !DILocation(line: 103, column: 19, scope: !186)
!193 = !DILocation(line: 104, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !186, file: !12, line: 104, column: 8)
!195 = !DILocation(line: 104, column: 8, scope: !186)
!196 = !DILocation(line: 107, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !12, line: 105, column: 5)
!198 = !DILocation(line: 107, column: 14, scope: !197)
!199 = !DILocation(line: 108, column: 5, scope: !197)
!200 = !DILocalVariable(name: "source", scope: !201, file: !12, line: 110, type: !31)
!201 = distinct !DILexicalBlock(scope: !186, file: !12, line: 109, column: 5)
!202 = !DILocation(line: 110, column: 23, scope: !201)
!203 = !DILocalVariable(name: "i", scope: !204, file: !12, line: 112, type: !47)
!204 = distinct !DILexicalBlock(scope: !201, file: !12, line: 111, column: 9)
!205 = !DILocation(line: 112, column: 20, scope: !204)
!206 = !DILocation(line: 114, column: 20, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !12, line: 114, column: 13)
!208 = !DILocation(line: 114, column: 18, scope: !207)
!209 = !DILocation(line: 114, column: 25, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !12, line: 114, column: 13)
!211 = !DILocation(line: 114, column: 27, scope: !210)
!212 = !DILocation(line: 114, column: 13, scope: !207)
!213 = !DILocation(line: 116, column: 24, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !12, line: 115, column: 13)
!215 = !DILocation(line: 116, column: 17, scope: !214)
!216 = !DILocation(line: 116, column: 27, scope: !214)
!217 = !DILocation(line: 116, column: 34, scope: !214)
!218 = !DILocation(line: 117, column: 24, scope: !214)
!219 = !DILocation(line: 117, column: 17, scope: !214)
!220 = !DILocation(line: 117, column: 27, scope: !214)
!221 = !DILocation(line: 117, column: 34, scope: !214)
!222 = !DILocation(line: 118, column: 13, scope: !214)
!223 = !DILocation(line: 114, column: 35, scope: !210)
!224 = !DILocation(line: 114, column: 13, scope: !210)
!225 = distinct !{!225, !212, !226, !72}
!226 = !DILocation(line: 118, column: 13, scope: !207)
!227 = !DILocalVariable(name: "i", scope: !228, file: !12, line: 121, type: !47)
!228 = distinct !DILexicalBlock(scope: !201, file: !12, line: 120, column: 9)
!229 = !DILocation(line: 121, column: 20, scope: !228)
!230 = !DILocation(line: 123, column: 20, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !12, line: 123, column: 13)
!232 = !DILocation(line: 123, column: 18, scope: !231)
!233 = !DILocation(line: 123, column: 25, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !12, line: 123, column: 13)
!235 = !DILocation(line: 123, column: 27, scope: !234)
!236 = !DILocation(line: 123, column: 13, scope: !231)
!237 = !DILocation(line: 125, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !12, line: 124, column: 13)
!239 = !DILocation(line: 125, column: 22, scope: !238)
!240 = !DILocation(line: 125, column: 34, scope: !238)
!241 = !DILocation(line: 125, column: 27, scope: !238)
!242 = !DILocation(line: 126, column: 13, scope: !238)
!243 = !DILocation(line: 123, column: 35, scope: !234)
!244 = !DILocation(line: 123, column: 13, scope: !234)
!245 = distinct !{!245, !236, !246, !72}
!246 = !DILocation(line: 126, column: 13, scope: !231)
!247 = !DILocation(line: 127, column: 30, scope: !228)
!248 = !DILocation(line: 127, column: 13, scope: !228)
!249 = !DILocation(line: 130, column: 1, scope: !186)
