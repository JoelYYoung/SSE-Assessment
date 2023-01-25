; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !35
  %cmp = icmp eq i32 %0, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !55
  %cmp1 = icmp ult i64 %1, 100, !dbg !57
  br i1 %cmp1, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %3 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %4, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !74, metadata !DIExpression()), !dbg !76
  store i64 0, i64* %i3, align 8, !dbg !77
  br label %for.cond4, !dbg !79

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !80
  %cmp5 = icmp ult i64 %5, 100, !dbg !82
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !83

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %7 = load i64, i64* %i3, align 8, !dbg !86
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !84
  %8 = load i64, i64* %i3, align 8, !dbg !87
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !88
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !88
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !88
  br label %for.inc9, !dbg !89

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !90
  %inc10 = add i64 %11, 1, !dbg !90
  store i64 %inc10, i64* %i3, align 8, !dbg !90
  br label %for.cond4, !dbg !91, !llvm.loop !92

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !94
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13_good() #0 !dbg !97 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !121 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !128
  %cmp = icmp ne i32 %0, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !135
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !137
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !147
  %cmp1 = icmp ult i64 %1, 100, !dbg !149
  br i1 %cmp1, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !153
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !154
  store i32 0, i32* %intOne, align 8, !dbg !155
  %3 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !157
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !158
  store i32 0, i32* %intTwo, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %4, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !165, metadata !DIExpression()), !dbg !167
  store i64 0, i64* %i3, align 8, !dbg !168
  br label %for.cond4, !dbg !170

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !171
  %cmp5 = icmp ult i64 %5, 100, !dbg !173
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !174

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !175
  %7 = load i64, i64* %i3, align 8, !dbg !177
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !175
  %8 = load i64, i64* %i3, align 8, !dbg !178
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !179
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !179
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !179
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !179
  br label %for.inc9, !dbg !180

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !181
  %inc10 = add i64 %11, 1, !dbg !181
  store i64 %inc10, i64* %i3, align 8, !dbg !181
  br label %for.cond4, !dbg !182, !llvm.loop !183

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !185
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !188 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !193, metadata !DIExpression()), !dbg !194
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !195
  %cmp = icmp eq i32 %0, 5, !dbg !197
  br i1 %cmp, label %if.then, label %if.end, !dbg !198

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !199
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !201
  br label %if.end, !dbg !202

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !203, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i64* %i, metadata !206, metadata !DIExpression()), !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !212
  %cmp1 = icmp ult i64 %1, 100, !dbg !214
  br i1 %cmp1, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !218
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !219
  store i32 0, i32* %intOne, align 8, !dbg !220
  %3 = load i64, i64* %i, align 8, !dbg !221
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !222
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !223
  store i32 0, i32* %intTwo, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !226
  %inc = add i64 %4, 1, !dbg !226
  store i64 %inc, i64* %i, align 8, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !230, metadata !DIExpression()), !dbg !232
  store i64 0, i64* %i3, align 8, !dbg !233
  br label %for.cond4, !dbg !235

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !236
  %cmp5 = icmp ult i64 %5, 100, !dbg !238
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !239

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !240
  %7 = load i64, i64* %i3, align 8, !dbg !242
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !240
  %8 = load i64, i64* %i3, align 8, !dbg !243
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !244
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !244
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !244
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !244
  br label %for.inc9, !dbg !245

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !246
  %inc10 = add i64 %11, 1, !dbg !246
  store i64 %inc10, i64* %i3, align 8, !dbg !246
  br label %for.cond4, !dbg !247, !llvm.loop !248

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !250
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !250
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !251
  ret void, !dbg !252
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
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
!37 = !DILocation(line: 26, column: 25, scope: !36)
!38 = !DILocation(line: 26, column: 8, scope: !11)
!39 = !DILocation(line: 30, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 5)
!41 = !DILocation(line: 30, column: 14, scope: !40)
!42 = !DILocation(line: 31, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 33, type: !31)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!45 = !DILocation(line: 33, column: 23, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 35, type: !48)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 34, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 20, scope: !47)
!52 = !DILocation(line: 37, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !12, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 27, scope: !56)
!58 = !DILocation(line: 37, column: 13, scope: !53)
!59 = !DILocation(line: 39, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 38, column: 13)
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
!74 = !DILocalVariable(name: "i", scope: !75, file: !12, line: 44, type: !48)
!75 = distinct !DILexicalBlock(scope: !44, file: !12, line: 43, column: 9)
!76 = !DILocation(line: 44, column: 20, scope: !75)
!77 = !DILocation(line: 46, column: 20, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !12, line: 46, column: 13)
!79 = !DILocation(line: 46, column: 18, scope: !78)
!80 = !DILocation(line: 46, column: 25, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !12, line: 46, column: 13)
!82 = !DILocation(line: 46, column: 27, scope: !81)
!83 = !DILocation(line: 46, column: 13, scope: !78)
!84 = !DILocation(line: 48, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 47, column: 13)
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
!96 = !DILocation(line: 53, column: 1, scope: !11)
!97 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_13_good", scope: !12, file: !12, line: 132, type: !13, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 134, column: 5, scope: !97)
!99 = !DILocation(line: 135, column: 5, scope: !97)
!100 = !DILocation(line: 136, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 148, type: !102, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!22, !22, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !12, line: 148, type: !22)
!108 = !DILocation(line: 148, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !12, line: 148, type: !104)
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
!121 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 62, type: !16)
!123 = !DILocation(line: 62, column: 21, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !12, line: 63, type: !26)
!125 = !DILocation(line: 63, column: 19, scope: !121)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !12, line: 64, type: !31)
!127 = !DILocation(line: 64, column: 19, scope: !121)
!128 = !DILocation(line: 65, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !12, line: 65, column: 8)
!130 = !DILocation(line: 65, column: 25, scope: !129)
!131 = !DILocation(line: 65, column: 8, scope: !121)
!132 = !DILocation(line: 68, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 66, column: 5)
!134 = !DILocation(line: 69, column: 5, scope: !133)
!135 = !DILocation(line: 73, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !12, line: 71, column: 5)
!137 = !DILocation(line: 73, column: 14, scope: !136)
!138 = !DILocalVariable(name: "source", scope: !139, file: !12, line: 76, type: !31)
!139 = distinct !DILexicalBlock(scope: !121, file: !12, line: 75, column: 5)
!140 = !DILocation(line: 76, column: 23, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !12, line: 78, type: !48)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 77, column: 9)
!143 = !DILocation(line: 78, column: 20, scope: !142)
!144 = !DILocation(line: 80, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 80, column: 13)
!146 = !DILocation(line: 80, column: 18, scope: !145)
!147 = !DILocation(line: 80, column: 25, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !12, line: 80, column: 13)
!149 = !DILocation(line: 80, column: 27, scope: !148)
!150 = !DILocation(line: 80, column: 13, scope: !145)
!151 = !DILocation(line: 82, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !12, line: 81, column: 13)
!153 = !DILocation(line: 82, column: 17, scope: !152)
!154 = !DILocation(line: 82, column: 27, scope: !152)
!155 = !DILocation(line: 82, column: 34, scope: !152)
!156 = !DILocation(line: 83, column: 24, scope: !152)
!157 = !DILocation(line: 83, column: 17, scope: !152)
!158 = !DILocation(line: 83, column: 27, scope: !152)
!159 = !DILocation(line: 83, column: 34, scope: !152)
!160 = !DILocation(line: 84, column: 13, scope: !152)
!161 = !DILocation(line: 80, column: 35, scope: !148)
!162 = !DILocation(line: 80, column: 13, scope: !148)
!163 = distinct !{!163, !150, !164, !73}
!164 = !DILocation(line: 84, column: 13, scope: !145)
!165 = !DILocalVariable(name: "i", scope: !166, file: !12, line: 87, type: !48)
!166 = distinct !DILexicalBlock(scope: !139, file: !12, line: 86, column: 9)
!167 = !DILocation(line: 87, column: 20, scope: !166)
!168 = !DILocation(line: 89, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !12, line: 89, column: 13)
!170 = !DILocation(line: 89, column: 18, scope: !169)
!171 = !DILocation(line: 89, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !12, line: 89, column: 13)
!173 = !DILocation(line: 89, column: 27, scope: !172)
!174 = !DILocation(line: 89, column: 13, scope: !169)
!175 = !DILocation(line: 91, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !12, line: 90, column: 13)
!177 = !DILocation(line: 91, column: 22, scope: !176)
!178 = !DILocation(line: 91, column: 34, scope: !176)
!179 = !DILocation(line: 91, column: 27, scope: !176)
!180 = !DILocation(line: 92, column: 13, scope: !176)
!181 = !DILocation(line: 89, column: 35, scope: !172)
!182 = !DILocation(line: 89, column: 13, scope: !172)
!183 = distinct !{!183, !174, !184, !73}
!184 = !DILocation(line: 92, column: 13, scope: !169)
!185 = !DILocation(line: 93, column: 30, scope: !166)
!186 = !DILocation(line: 93, column: 13, scope: !166)
!187 = !DILocation(line: 96, column: 1, scope: !121)
!188 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!189 = !DILocalVariable(name: "data", scope: !188, file: !12, line: 101, type: !16)
!190 = !DILocation(line: 101, column: 21, scope: !188)
!191 = !DILocalVariable(name: "dataBadBuffer", scope: !188, file: !12, line: 102, type: !26)
!192 = !DILocation(line: 102, column: 19, scope: !188)
!193 = !DILocalVariable(name: "dataGoodBuffer", scope: !188, file: !12, line: 103, type: !31)
!194 = !DILocation(line: 103, column: 19, scope: !188)
!195 = !DILocation(line: 104, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !188, file: !12, line: 104, column: 8)
!197 = !DILocation(line: 104, column: 25, scope: !196)
!198 = !DILocation(line: 104, column: 8, scope: !188)
!199 = !DILocation(line: 107, column: 16, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !12, line: 105, column: 5)
!201 = !DILocation(line: 107, column: 14, scope: !200)
!202 = !DILocation(line: 108, column: 5, scope: !200)
!203 = !DILocalVariable(name: "source", scope: !204, file: !12, line: 110, type: !31)
!204 = distinct !DILexicalBlock(scope: !188, file: !12, line: 109, column: 5)
!205 = !DILocation(line: 110, column: 23, scope: !204)
!206 = !DILocalVariable(name: "i", scope: !207, file: !12, line: 112, type: !48)
!207 = distinct !DILexicalBlock(scope: !204, file: !12, line: 111, column: 9)
!208 = !DILocation(line: 112, column: 20, scope: !207)
!209 = !DILocation(line: 114, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !12, line: 114, column: 13)
!211 = !DILocation(line: 114, column: 18, scope: !210)
!212 = !DILocation(line: 114, column: 25, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !12, line: 114, column: 13)
!214 = !DILocation(line: 114, column: 27, scope: !213)
!215 = !DILocation(line: 114, column: 13, scope: !210)
!216 = !DILocation(line: 116, column: 24, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !12, line: 115, column: 13)
!218 = !DILocation(line: 116, column: 17, scope: !217)
!219 = !DILocation(line: 116, column: 27, scope: !217)
!220 = !DILocation(line: 116, column: 34, scope: !217)
!221 = !DILocation(line: 117, column: 24, scope: !217)
!222 = !DILocation(line: 117, column: 17, scope: !217)
!223 = !DILocation(line: 117, column: 27, scope: !217)
!224 = !DILocation(line: 117, column: 34, scope: !217)
!225 = !DILocation(line: 118, column: 13, scope: !217)
!226 = !DILocation(line: 114, column: 35, scope: !213)
!227 = !DILocation(line: 114, column: 13, scope: !213)
!228 = distinct !{!228, !215, !229, !73}
!229 = !DILocation(line: 118, column: 13, scope: !210)
!230 = !DILocalVariable(name: "i", scope: !231, file: !12, line: 121, type: !48)
!231 = distinct !DILexicalBlock(scope: !204, file: !12, line: 120, column: 9)
!232 = !DILocation(line: 121, column: 20, scope: !231)
!233 = !DILocation(line: 123, column: 20, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !12, line: 123, column: 13)
!235 = !DILocation(line: 123, column: 18, scope: !234)
!236 = !DILocation(line: 123, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !12, line: 123, column: 13)
!238 = !DILocation(line: 123, column: 27, scope: !237)
!239 = !DILocation(line: 123, column: 13, scope: !234)
!240 = !DILocation(line: 125, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !12, line: 124, column: 13)
!242 = !DILocation(line: 125, column: 22, scope: !241)
!243 = !DILocation(line: 125, column: 34, scope: !241)
!244 = !DILocation(line: 125, column: 27, scope: !241)
!245 = !DILocation(line: 126, column: 13, scope: !241)
!246 = !DILocation(line: 123, column: 35, scope: !237)
!247 = !DILocation(line: 123, column: 13, scope: !237)
!248 = distinct !{!248, !239, !249, !73}
!249 = !DILocation(line: 126, column: 13, scope: !234)
!250 = !DILocation(line: 127, column: 30, scope: !231)
!251 = !DILocation(line: 127, column: 13, scope: !231)
!252 = !DILocation(line: 130, column: 1, scope: !188)
