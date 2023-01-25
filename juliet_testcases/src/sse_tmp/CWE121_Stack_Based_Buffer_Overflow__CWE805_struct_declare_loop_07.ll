; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !19, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @staticFive, align 4, !dbg !38
  %cmp = icmp eq i32 %0, 5, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !58
  %cmp1 = icmp ult i64 %1, 100, !dbg !60
  br i1 %cmp1, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %4, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !77, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i3, align 8, !dbg !80
  br label %for.cond4, !dbg !82

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !83
  %cmp5 = icmp ult i64 %5, 100, !dbg !85
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !86

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %7 = load i64, i64* %i3, align 8, !dbg !89
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !87
  %8 = load i64, i64* %i3, align 8, !dbg !90
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !91
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !91
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !91
  br label %for.inc9, !dbg !92

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !93
  %inc10 = add i64 %11, 1, !dbg !93
  store i64 %inc10, i64* %i3, align 8, !dbg !93
  br label %for.cond4, !dbg !94, !llvm.loop !95

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !97
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_good() #0 !dbg !100 {
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
  %call = call i64 @time(i64* null) #5, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #5, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !124 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %0 = load i32, i32* @staticFive, align 4, !dbg !131
  %cmp = icmp ne i32 %0, 5, !dbg !133
  br i1 %cmp, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !135
  br label %if.end, !dbg !137

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !138
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !150
  %cmp1 = icmp ult i64 %1, 100, !dbg !152
  br i1 %cmp1, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !156
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !157
  store i32 0, i32* %intOne, align 8, !dbg !158
  %3 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !160
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !161
  store i32 0, i32* %intTwo, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %4, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !168, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i3, align 8, !dbg !171
  br label %for.cond4, !dbg !173

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !174
  %cmp5 = icmp ult i64 %5, 100, !dbg !176
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !177

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !178
  %7 = load i64, i64* %i3, align 8, !dbg !180
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !178
  %8 = load i64, i64* %i3, align 8, !dbg !181
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !182
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !182
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !182
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !182
  br label %for.inc9, !dbg !183

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !184
  %inc10 = add i64 %11, 1, !dbg !184
  store i64 %inc10, i64* %i3, align 8, !dbg !184
  br label %for.cond4, !dbg !185, !llvm.loop !186

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !188
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !188
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !189
  ret void, !dbg !190
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !191 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = load i32, i32* @staticFive, align 4, !dbg !198
  %cmp = icmp eq i32 %0, 5, !dbg !200
  br i1 %cmp, label %if.then, label %if.end, !dbg !201

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
  %1 = load i64, i64* %i, align 8, !dbg !215
  %cmp1 = icmp ult i64 %1, 100, !dbg !217
  br i1 %cmp1, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !221
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !222
  store i32 0, i32* %intOne, align 8, !dbg !223
  %3 = load i64, i64* %i, align 8, !dbg !224
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !225
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !226
  store i32 0, i32* %intTwo, align 4, !dbg !227
  br label %for.inc, !dbg !228

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !229
  %inc = add i64 %4, 1, !dbg !229
  store i64 %inc, i64* %i, align 8, !dbg !229
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !233, metadata !DIExpression()), !dbg !235
  store i64 0, i64* %i3, align 8, !dbg !236
  br label %for.cond4, !dbg !238

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !239
  %cmp5 = icmp ult i64 %5, 100, !dbg !241
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !242

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !243
  %7 = load i64, i64* %i3, align 8, !dbg !245
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !243
  %8 = load i64, i64* %i3, align 8, !dbg !246
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !247
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !247
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !247
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !247
  br label %for.inc9, !dbg !248

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !249
  %inc10 = add i64 %11, 1, !dbg !249
  store i64 %inc10, i64* %i3, align 8, !dbg !249
  br label %for.cond4, !dbg !250, !llvm.loop !251

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !253
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !253
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !254
  ret void, !dbg !255
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !22, line: 100, baseType: !23)
!22 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !22, line: 96, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !23, file: !22, line: 98, baseType: !9, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !23, file: !22, line: 99, baseType: !9, size: 32, offset: 32)
!27 = !DILocation(line: 29, column: 21, scope: !16)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 30, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 30, column: 19, scope: !16)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 31, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 31, column: 19, scope: !16)
!38 = !DILocation(line: 32, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!40 = !DILocation(line: 32, column: 18, scope: !39)
!41 = !DILocation(line: 32, column: 8, scope: !16)
!42 = !DILocation(line: 36, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !8, line: 33, column: 5)
!44 = !DILocation(line: 36, column: 14, scope: !43)
!45 = !DILocation(line: 37, column: 5, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !8, line: 39, type: !34)
!47 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 23, scope: !47)
!49 = !DILocalVariable(name: "i", scope: !50, file: !8, line: 41, type: !51)
!50 = distinct !DILexicalBlock(scope: !47, file: !8, line: 40, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 41, column: 20, scope: !50)
!55 = !DILocation(line: 43, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !8, line: 43, column: 13)
!57 = !DILocation(line: 43, column: 18, scope: !56)
!58 = !DILocation(line: 43, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !8, line: 43, column: 13)
!60 = !DILocation(line: 43, column: 27, scope: !59)
!61 = !DILocation(line: 43, column: 13, scope: !56)
!62 = !DILocation(line: 45, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !8, line: 44, column: 13)
!64 = !DILocation(line: 45, column: 17, scope: !63)
!65 = !DILocation(line: 45, column: 27, scope: !63)
!66 = !DILocation(line: 45, column: 34, scope: !63)
!67 = !DILocation(line: 46, column: 24, scope: !63)
!68 = !DILocation(line: 46, column: 17, scope: !63)
!69 = !DILocation(line: 46, column: 27, scope: !63)
!70 = !DILocation(line: 46, column: 34, scope: !63)
!71 = !DILocation(line: 47, column: 13, scope: !63)
!72 = !DILocation(line: 43, column: 35, scope: !59)
!73 = !DILocation(line: 43, column: 13, scope: !59)
!74 = distinct !{!74, !61, !75, !76}
!75 = !DILocation(line: 47, column: 13, scope: !56)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocalVariable(name: "i", scope: !78, file: !8, line: 50, type: !51)
!78 = distinct !DILexicalBlock(scope: !47, file: !8, line: 49, column: 9)
!79 = !DILocation(line: 50, column: 20, scope: !78)
!80 = !DILocation(line: 52, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !8, line: 52, column: 13)
!82 = !DILocation(line: 52, column: 18, scope: !81)
!83 = !DILocation(line: 52, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !8, line: 52, column: 13)
!85 = !DILocation(line: 52, column: 27, scope: !84)
!86 = !DILocation(line: 52, column: 13, scope: !81)
!87 = !DILocation(line: 54, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !8, line: 53, column: 13)
!89 = !DILocation(line: 54, column: 22, scope: !88)
!90 = !DILocation(line: 54, column: 34, scope: !88)
!91 = !DILocation(line: 54, column: 27, scope: !88)
!92 = !DILocation(line: 55, column: 13, scope: !88)
!93 = !DILocation(line: 52, column: 35, scope: !84)
!94 = !DILocation(line: 52, column: 13, scope: !84)
!95 = distinct !{!95, !86, !96, !76}
!96 = !DILocation(line: 55, column: 13, scope: !81)
!97 = !DILocation(line: 56, column: 30, scope: !78)
!98 = !DILocation(line: 56, column: 13, scope: !78)
!99 = !DILocation(line: 59, column: 1, scope: !16)
!100 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_good", scope: !8, file: !8, line: 138, type: !17, scopeLine: 139, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocation(line: 140, column: 5, scope: !100)
!102 = !DILocation(line: 141, column: 5, scope: !100)
!103 = !DILocation(line: 142, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 154, type: !105, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!9, !9, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !8, line: 154, type: !9)
!111 = !DILocation(line: 154, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !8, line: 154, type: !107)
!113 = !DILocation(line: 154, column: 27, scope: !104)
!114 = !DILocation(line: 157, column: 22, scope: !104)
!115 = !DILocation(line: 157, column: 12, scope: !104)
!116 = !DILocation(line: 157, column: 5, scope: !104)
!117 = !DILocation(line: 159, column: 5, scope: !104)
!118 = !DILocation(line: 160, column: 5, scope: !104)
!119 = !DILocation(line: 161, column: 5, scope: !104)
!120 = !DILocation(line: 164, column: 5, scope: !104)
!121 = !DILocation(line: 165, column: 5, scope: !104)
!122 = !DILocation(line: 166, column: 5, scope: !104)
!123 = !DILocation(line: 168, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !8, line: 68, type: !20)
!126 = !DILocation(line: 68, column: 21, scope: !124)
!127 = !DILocalVariable(name: "dataBadBuffer", scope: !124, file: !8, line: 69, type: !29)
!128 = !DILocation(line: 69, column: 19, scope: !124)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !124, file: !8, line: 70, type: !34)
!130 = !DILocation(line: 70, column: 19, scope: !124)
!131 = !DILocation(line: 71, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !8, line: 71, column: 8)
!133 = !DILocation(line: 71, column: 18, scope: !132)
!134 = !DILocation(line: 71, column: 8, scope: !124)
!135 = !DILocation(line: 74, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !8, line: 72, column: 5)
!137 = !DILocation(line: 75, column: 5, scope: !136)
!138 = !DILocation(line: 79, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !8, line: 77, column: 5)
!140 = !DILocation(line: 79, column: 14, scope: !139)
!141 = !DILocalVariable(name: "source", scope: !142, file: !8, line: 82, type: !34)
!142 = distinct !DILexicalBlock(scope: !124, file: !8, line: 81, column: 5)
!143 = !DILocation(line: 82, column: 23, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !145, file: !8, line: 84, type: !51)
!145 = distinct !DILexicalBlock(scope: !142, file: !8, line: 83, column: 9)
!146 = !DILocation(line: 84, column: 20, scope: !145)
!147 = !DILocation(line: 86, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !8, line: 86, column: 13)
!149 = !DILocation(line: 86, column: 18, scope: !148)
!150 = !DILocation(line: 86, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !8, line: 86, column: 13)
!152 = !DILocation(line: 86, column: 27, scope: !151)
!153 = !DILocation(line: 86, column: 13, scope: !148)
!154 = !DILocation(line: 88, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !8, line: 87, column: 13)
!156 = !DILocation(line: 88, column: 17, scope: !155)
!157 = !DILocation(line: 88, column: 27, scope: !155)
!158 = !DILocation(line: 88, column: 34, scope: !155)
!159 = !DILocation(line: 89, column: 24, scope: !155)
!160 = !DILocation(line: 89, column: 17, scope: !155)
!161 = !DILocation(line: 89, column: 27, scope: !155)
!162 = !DILocation(line: 89, column: 34, scope: !155)
!163 = !DILocation(line: 90, column: 13, scope: !155)
!164 = !DILocation(line: 86, column: 35, scope: !151)
!165 = !DILocation(line: 86, column: 13, scope: !151)
!166 = distinct !{!166, !153, !167, !76}
!167 = !DILocation(line: 90, column: 13, scope: !148)
!168 = !DILocalVariable(name: "i", scope: !169, file: !8, line: 93, type: !51)
!169 = distinct !DILexicalBlock(scope: !142, file: !8, line: 92, column: 9)
!170 = !DILocation(line: 93, column: 20, scope: !169)
!171 = !DILocation(line: 95, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !8, line: 95, column: 13)
!173 = !DILocation(line: 95, column: 18, scope: !172)
!174 = !DILocation(line: 95, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !8, line: 95, column: 13)
!176 = !DILocation(line: 95, column: 27, scope: !175)
!177 = !DILocation(line: 95, column: 13, scope: !172)
!178 = !DILocation(line: 97, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !8, line: 96, column: 13)
!180 = !DILocation(line: 97, column: 22, scope: !179)
!181 = !DILocation(line: 97, column: 34, scope: !179)
!182 = !DILocation(line: 97, column: 27, scope: !179)
!183 = !DILocation(line: 98, column: 13, scope: !179)
!184 = !DILocation(line: 95, column: 35, scope: !175)
!185 = !DILocation(line: 95, column: 13, scope: !175)
!186 = distinct !{!186, !177, !187, !76}
!187 = !DILocation(line: 98, column: 13, scope: !172)
!188 = !DILocation(line: 99, column: 30, scope: !169)
!189 = !DILocation(line: 99, column: 13, scope: !169)
!190 = !DILocation(line: 102, column: 1, scope: !124)
!191 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!192 = !DILocalVariable(name: "data", scope: !191, file: !8, line: 107, type: !20)
!193 = !DILocation(line: 107, column: 21, scope: !191)
!194 = !DILocalVariable(name: "dataBadBuffer", scope: !191, file: !8, line: 108, type: !29)
!195 = !DILocation(line: 108, column: 19, scope: !191)
!196 = !DILocalVariable(name: "dataGoodBuffer", scope: !191, file: !8, line: 109, type: !34)
!197 = !DILocation(line: 109, column: 19, scope: !191)
!198 = !DILocation(line: 110, column: 8, scope: !199)
!199 = distinct !DILexicalBlock(scope: !191, file: !8, line: 110, column: 8)
!200 = !DILocation(line: 110, column: 18, scope: !199)
!201 = !DILocation(line: 110, column: 8, scope: !191)
!202 = !DILocation(line: 113, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !8, line: 111, column: 5)
!204 = !DILocation(line: 113, column: 14, scope: !203)
!205 = !DILocation(line: 114, column: 5, scope: !203)
!206 = !DILocalVariable(name: "source", scope: !207, file: !8, line: 116, type: !34)
!207 = distinct !DILexicalBlock(scope: !191, file: !8, line: 115, column: 5)
!208 = !DILocation(line: 116, column: 23, scope: !207)
!209 = !DILocalVariable(name: "i", scope: !210, file: !8, line: 118, type: !51)
!210 = distinct !DILexicalBlock(scope: !207, file: !8, line: 117, column: 9)
!211 = !DILocation(line: 118, column: 20, scope: !210)
!212 = !DILocation(line: 120, column: 20, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !8, line: 120, column: 13)
!214 = !DILocation(line: 120, column: 18, scope: !213)
!215 = !DILocation(line: 120, column: 25, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !8, line: 120, column: 13)
!217 = !DILocation(line: 120, column: 27, scope: !216)
!218 = !DILocation(line: 120, column: 13, scope: !213)
!219 = !DILocation(line: 122, column: 24, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !8, line: 121, column: 13)
!221 = !DILocation(line: 122, column: 17, scope: !220)
!222 = !DILocation(line: 122, column: 27, scope: !220)
!223 = !DILocation(line: 122, column: 34, scope: !220)
!224 = !DILocation(line: 123, column: 24, scope: !220)
!225 = !DILocation(line: 123, column: 17, scope: !220)
!226 = !DILocation(line: 123, column: 27, scope: !220)
!227 = !DILocation(line: 123, column: 34, scope: !220)
!228 = !DILocation(line: 124, column: 13, scope: !220)
!229 = !DILocation(line: 120, column: 35, scope: !216)
!230 = !DILocation(line: 120, column: 13, scope: !216)
!231 = distinct !{!231, !218, !232, !76}
!232 = !DILocation(line: 124, column: 13, scope: !213)
!233 = !DILocalVariable(name: "i", scope: !234, file: !8, line: 127, type: !51)
!234 = distinct !DILexicalBlock(scope: !207, file: !8, line: 126, column: 9)
!235 = !DILocation(line: 127, column: 20, scope: !234)
!236 = !DILocation(line: 129, column: 20, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !8, line: 129, column: 13)
!238 = !DILocation(line: 129, column: 18, scope: !237)
!239 = !DILocation(line: 129, column: 25, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !8, line: 129, column: 13)
!241 = !DILocation(line: 129, column: 27, scope: !240)
!242 = !DILocation(line: 129, column: 13, scope: !237)
!243 = !DILocation(line: 131, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !8, line: 130, column: 13)
!245 = !DILocation(line: 131, column: 22, scope: !244)
!246 = !DILocation(line: 131, column: 34, scope: !244)
!247 = !DILocation(line: 131, column: 27, scope: !244)
!248 = !DILocation(line: 132, column: 13, scope: !244)
!249 = !DILocation(line: 129, column: 35, scope: !240)
!250 = !DILocation(line: 129, column: 13, scope: !240)
!251 = distinct !{!251, !242, !252, !76}
!252 = !DILocation(line: 132, column: 13, scope: !237)
!253 = !DILocation(line: 133, column: 30, scope: !234)
!254 = !DILocation(line: 133, column: 13, scope: !234)
!255 = !DILocation(line: 136, column: 1, scope: !191)
