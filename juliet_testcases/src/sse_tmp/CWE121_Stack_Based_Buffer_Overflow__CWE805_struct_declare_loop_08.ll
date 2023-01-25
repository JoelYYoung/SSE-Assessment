; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08_bad() #0 !dbg !11 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
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
  %0 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %0, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %3, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !73, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i2, align 8, !dbg !76
  br label %for.cond3, !dbg !78

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !79
  %cmp4 = icmp ult i64 %4, 100, !dbg !81
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !82

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %6 = load i64, i64* %i2, align 8, !dbg !85
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !83
  %7 = load i64, i64* %i2, align 8, !dbg !86
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !87
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !87
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !87
  br label %for.inc8, !dbg !88

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !89
  %inc9 = add i64 %10, 1, !dbg !89
  store i64 %inc9, i64* %i2, align 8, !dbg !89
  br label %for.cond3, !dbg !90, !llvm.loop !91

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !93
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08_good() #0 !dbg !96 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !120 {
entry:
  ret i32 1, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !124 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %call = call i32 @staticReturnsFalse(), !dbg !131
  %tobool = icmp ne i32 %call, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.else, !dbg !133

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !134
  br label %if.end, !dbg !136

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !137
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !149
  %cmp = icmp ult i64 %0, 100, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !155
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !156
  store i32 0, i32* %intOne, align 8, !dbg !157
  %2 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !159
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !160
  store i32 0, i32* %intTwo, align 4, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %3, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !167, metadata !DIExpression()), !dbg !169
  store i64 0, i64* %i2, align 8, !dbg !170
  br label %for.cond3, !dbg !172

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !173
  %cmp4 = icmp ult i64 %4, 100, !dbg !175
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !176

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !177
  %6 = load i64, i64* %i2, align 8, !dbg !179
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !177
  %7 = load i64, i64* %i2, align 8, !dbg !180
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !181
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !181
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !181
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !181
  br label %for.inc8, !dbg !182

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !183
  %inc9 = add i64 %10, 1, !dbg !183
  store i64 %inc9, i64* %i2, align 8, !dbg !183
  br label %for.cond3, !dbg !184, !llvm.loop !185

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !187
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !187
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !188
  ret void, !dbg !189
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !190 {
entry:
  ret i32 0, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !192 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !197, metadata !DIExpression()), !dbg !198
  %call = call i32 @staticReturnsTrue(), !dbg !199
  %tobool = icmp ne i32 %call, 0, !dbg !199
  br i1 %tobool, label %if.then, label %if.end, !dbg !201

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !202
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !204
  br label %if.end, !dbg !205

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !206, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata i64* %i, metadata !209, metadata !DIExpression()), !dbg !211
  store i64 0, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !215
  %cmp = icmp ult i64 %0, 100, !dbg !217
  br i1 %cmp, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !221
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !222
  store i32 0, i32* %intOne, align 8, !dbg !223
  %2 = load i64, i64* %i, align 8, !dbg !224
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !225
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !226
  store i32 0, i32* %intTwo, align 4, !dbg !227
  br label %for.inc, !dbg !228

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !229
  %inc = add i64 %3, 1, !dbg !229
  store i64 %inc, i64* %i, align 8, !dbg !229
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !233, metadata !DIExpression()), !dbg !235
  store i64 0, i64* %i2, align 8, !dbg !236
  br label %for.cond3, !dbg !238

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !239
  %cmp4 = icmp ult i64 %4, 100, !dbg !241
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !242

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !243
  %6 = load i64, i64* %i2, align 8, !dbg !245
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !243
  %7 = load i64, i64* %i2, align 8, !dbg !246
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !247
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !247
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !247
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !247
  br label %for.inc8, !dbg !248

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !249
  %inc9 = add i64 %10, 1, !dbg !249
  store i64 %inc9, i64* %i2, align 8, !dbg !249
  br label %for.cond3, !dbg !250, !llvm.loop !251

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !253
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !253
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !254
  ret void, !dbg !255
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 37, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 38, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 39, column: 19, scope: !11)
!35 = !DILocation(line: 40, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!37 = !DILocation(line: 40, column: 8, scope: !11)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 5, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 47, type: !31)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!44 = !DILocation(line: 47, column: 23, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 49, type: !47)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 48, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 49, column: 20, scope: !46)
!51 = !DILocation(line: 51, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !12, line: 51, column: 13)
!53 = !DILocation(line: 51, column: 18, scope: !52)
!54 = !DILocation(line: 51, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 51, column: 13)
!56 = !DILocation(line: 51, column: 27, scope: !55)
!57 = !DILocation(line: 51, column: 13, scope: !52)
!58 = !DILocation(line: 53, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 52, column: 13)
!60 = !DILocation(line: 53, column: 17, scope: !59)
!61 = !DILocation(line: 53, column: 27, scope: !59)
!62 = !DILocation(line: 53, column: 34, scope: !59)
!63 = !DILocation(line: 54, column: 24, scope: !59)
!64 = !DILocation(line: 54, column: 17, scope: !59)
!65 = !DILocation(line: 54, column: 27, scope: !59)
!66 = !DILocation(line: 54, column: 34, scope: !59)
!67 = !DILocation(line: 55, column: 13, scope: !59)
!68 = !DILocation(line: 51, column: 35, scope: !55)
!69 = !DILocation(line: 51, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 55, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocalVariable(name: "i", scope: !74, file: !12, line: 58, type: !47)
!74 = distinct !DILexicalBlock(scope: !43, file: !12, line: 57, column: 9)
!75 = !DILocation(line: 58, column: 20, scope: !74)
!76 = !DILocation(line: 60, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 60, column: 13)
!78 = !DILocation(line: 60, column: 18, scope: !77)
!79 = !DILocation(line: 60, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 60, column: 13)
!81 = !DILocation(line: 60, column: 27, scope: !80)
!82 = !DILocation(line: 60, column: 13, scope: !77)
!83 = !DILocation(line: 62, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 61, column: 13)
!85 = !DILocation(line: 62, column: 22, scope: !84)
!86 = !DILocation(line: 62, column: 34, scope: !84)
!87 = !DILocation(line: 62, column: 27, scope: !84)
!88 = !DILocation(line: 63, column: 13, scope: !84)
!89 = !DILocation(line: 60, column: 35, scope: !80)
!90 = !DILocation(line: 60, column: 13, scope: !80)
!91 = distinct !{!91, !82, !92, !72}
!92 = !DILocation(line: 63, column: 13, scope: !77)
!93 = !DILocation(line: 64, column: 30, scope: !74)
!94 = !DILocation(line: 64, column: 13, scope: !74)
!95 = !DILocation(line: 67, column: 1, scope: !11)
!96 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_08_good", scope: !12, file: !12, line: 146, type: !13, scopeLine: 147, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 148, column: 5, scope: !96)
!98 = !DILocation(line: 149, column: 5, scope: !96)
!99 = !DILocation(line: 150, column: 1, scope: !96)
!100 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 162, type: !101, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!22, !22, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !12, line: 162, type: !22)
!107 = !DILocation(line: 162, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !12, line: 162, type: !103)
!109 = !DILocation(line: 162, column: 27, scope: !100)
!110 = !DILocation(line: 165, column: 22, scope: !100)
!111 = !DILocation(line: 165, column: 12, scope: !100)
!112 = !DILocation(line: 165, column: 5, scope: !100)
!113 = !DILocation(line: 167, column: 5, scope: !100)
!114 = !DILocation(line: 168, column: 5, scope: !100)
!115 = !DILocation(line: 169, column: 5, scope: !100)
!116 = !DILocation(line: 172, column: 5, scope: !100)
!117 = !DILocation(line: 173, column: 5, scope: !100)
!118 = !DILocation(line: 174, column: 5, scope: !100)
!119 = !DILocation(line: 176, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !121, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DISubroutineType(types: !122)
!122 = !{!22}
!123 = !DILocation(line: 25, column: 5, scope: !120)
!124 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !12, line: 76, type: !16)
!126 = !DILocation(line: 76, column: 21, scope: !124)
!127 = !DILocalVariable(name: "dataBadBuffer", scope: !124, file: !12, line: 77, type: !26)
!128 = !DILocation(line: 77, column: 19, scope: !124)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !124, file: !12, line: 78, type: !31)
!130 = !DILocation(line: 78, column: 19, scope: !124)
!131 = !DILocation(line: 79, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !12, line: 79, column: 8)
!133 = !DILocation(line: 79, column: 8, scope: !124)
!134 = !DILocation(line: 82, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !12, line: 80, column: 5)
!136 = !DILocation(line: 83, column: 5, scope: !135)
!137 = !DILocation(line: 87, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !12, line: 85, column: 5)
!139 = !DILocation(line: 87, column: 14, scope: !138)
!140 = !DILocalVariable(name: "source", scope: !141, file: !12, line: 90, type: !31)
!141 = distinct !DILexicalBlock(scope: !124, file: !12, line: 89, column: 5)
!142 = !DILocation(line: 90, column: 23, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !12, line: 92, type: !47)
!144 = distinct !DILexicalBlock(scope: !141, file: !12, line: 91, column: 9)
!145 = !DILocation(line: 92, column: 20, scope: !144)
!146 = !DILocation(line: 94, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 94, column: 13)
!148 = !DILocation(line: 94, column: 18, scope: !147)
!149 = !DILocation(line: 94, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 94, column: 13)
!151 = !DILocation(line: 94, column: 27, scope: !150)
!152 = !DILocation(line: 94, column: 13, scope: !147)
!153 = !DILocation(line: 96, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 95, column: 13)
!155 = !DILocation(line: 96, column: 17, scope: !154)
!156 = !DILocation(line: 96, column: 27, scope: !154)
!157 = !DILocation(line: 96, column: 34, scope: !154)
!158 = !DILocation(line: 97, column: 24, scope: !154)
!159 = !DILocation(line: 97, column: 17, scope: !154)
!160 = !DILocation(line: 97, column: 27, scope: !154)
!161 = !DILocation(line: 97, column: 34, scope: !154)
!162 = !DILocation(line: 98, column: 13, scope: !154)
!163 = !DILocation(line: 94, column: 35, scope: !150)
!164 = !DILocation(line: 94, column: 13, scope: !150)
!165 = distinct !{!165, !152, !166, !72}
!166 = !DILocation(line: 98, column: 13, scope: !147)
!167 = !DILocalVariable(name: "i", scope: !168, file: !12, line: 101, type: !47)
!168 = distinct !DILexicalBlock(scope: !141, file: !12, line: 100, column: 9)
!169 = !DILocation(line: 101, column: 20, scope: !168)
!170 = !DILocation(line: 103, column: 20, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 103, column: 13)
!172 = !DILocation(line: 103, column: 18, scope: !171)
!173 = !DILocation(line: 103, column: 25, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !12, line: 103, column: 13)
!175 = !DILocation(line: 103, column: 27, scope: !174)
!176 = !DILocation(line: 103, column: 13, scope: !171)
!177 = !DILocation(line: 105, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !12, line: 104, column: 13)
!179 = !DILocation(line: 105, column: 22, scope: !178)
!180 = !DILocation(line: 105, column: 34, scope: !178)
!181 = !DILocation(line: 105, column: 27, scope: !178)
!182 = !DILocation(line: 106, column: 13, scope: !178)
!183 = !DILocation(line: 103, column: 35, scope: !174)
!184 = !DILocation(line: 103, column: 13, scope: !174)
!185 = distinct !{!185, !176, !186, !72}
!186 = !DILocation(line: 106, column: 13, scope: !171)
!187 = !DILocation(line: 107, column: 30, scope: !168)
!188 = !DILocation(line: 107, column: 13, scope: !168)
!189 = !DILocation(line: 110, column: 1, scope: !124)
!190 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !121, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!191 = !DILocation(line: 30, column: 5, scope: !190)
!192 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!193 = !DILocalVariable(name: "data", scope: !192, file: !12, line: 115, type: !16)
!194 = !DILocation(line: 115, column: 21, scope: !192)
!195 = !DILocalVariable(name: "dataBadBuffer", scope: !192, file: !12, line: 116, type: !26)
!196 = !DILocation(line: 116, column: 19, scope: !192)
!197 = !DILocalVariable(name: "dataGoodBuffer", scope: !192, file: !12, line: 117, type: !31)
!198 = !DILocation(line: 117, column: 19, scope: !192)
!199 = !DILocation(line: 118, column: 8, scope: !200)
!200 = distinct !DILexicalBlock(scope: !192, file: !12, line: 118, column: 8)
!201 = !DILocation(line: 118, column: 8, scope: !192)
!202 = !DILocation(line: 121, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !12, line: 119, column: 5)
!204 = !DILocation(line: 121, column: 14, scope: !203)
!205 = !DILocation(line: 122, column: 5, scope: !203)
!206 = !DILocalVariable(name: "source", scope: !207, file: !12, line: 124, type: !31)
!207 = distinct !DILexicalBlock(scope: !192, file: !12, line: 123, column: 5)
!208 = !DILocation(line: 124, column: 23, scope: !207)
!209 = !DILocalVariable(name: "i", scope: !210, file: !12, line: 126, type: !47)
!210 = distinct !DILexicalBlock(scope: !207, file: !12, line: 125, column: 9)
!211 = !DILocation(line: 126, column: 20, scope: !210)
!212 = !DILocation(line: 128, column: 20, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !12, line: 128, column: 13)
!214 = !DILocation(line: 128, column: 18, scope: !213)
!215 = !DILocation(line: 128, column: 25, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !12, line: 128, column: 13)
!217 = !DILocation(line: 128, column: 27, scope: !216)
!218 = !DILocation(line: 128, column: 13, scope: !213)
!219 = !DILocation(line: 130, column: 24, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !12, line: 129, column: 13)
!221 = !DILocation(line: 130, column: 17, scope: !220)
!222 = !DILocation(line: 130, column: 27, scope: !220)
!223 = !DILocation(line: 130, column: 34, scope: !220)
!224 = !DILocation(line: 131, column: 24, scope: !220)
!225 = !DILocation(line: 131, column: 17, scope: !220)
!226 = !DILocation(line: 131, column: 27, scope: !220)
!227 = !DILocation(line: 131, column: 34, scope: !220)
!228 = !DILocation(line: 132, column: 13, scope: !220)
!229 = !DILocation(line: 128, column: 35, scope: !216)
!230 = !DILocation(line: 128, column: 13, scope: !216)
!231 = distinct !{!231, !218, !232, !72}
!232 = !DILocation(line: 132, column: 13, scope: !213)
!233 = !DILocalVariable(name: "i", scope: !234, file: !12, line: 135, type: !47)
!234 = distinct !DILexicalBlock(scope: !207, file: !12, line: 134, column: 9)
!235 = !DILocation(line: 135, column: 20, scope: !234)
!236 = !DILocation(line: 137, column: 20, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !12, line: 137, column: 13)
!238 = !DILocation(line: 137, column: 18, scope: !237)
!239 = !DILocation(line: 137, column: 25, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !12, line: 137, column: 13)
!241 = !DILocation(line: 137, column: 27, scope: !240)
!242 = !DILocation(line: 137, column: 13, scope: !237)
!243 = !DILocation(line: 139, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !12, line: 138, column: 13)
!245 = !DILocation(line: 139, column: 22, scope: !244)
!246 = !DILocation(line: 139, column: 34, scope: !244)
!247 = !DILocation(line: 139, column: 27, scope: !244)
!248 = !DILocation(line: 140, column: 13, scope: !244)
!249 = !DILocation(line: 137, column: 35, scope: !240)
!250 = !DILocation(line: 137, column: 13, scope: !240)
!251 = distinct !{!251, !242, !252, !72}
!252 = !DILocation(line: 140, column: 13, scope: !237)
!253 = !DILocation(line: 141, column: 30, scope: !234)
!254 = !DILocation(line: 141, column: 13, scope: !234)
!255 = !DILocation(line: 144, column: 1, scope: !192)
