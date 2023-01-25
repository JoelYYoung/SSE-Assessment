; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !21, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %0 = load i32, i32* @staticTrue, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %1, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !65
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !66
  store i32 0, i32* %intOne, align 8, !dbg !67
  %3 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !69
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !70
  store i32 0, i32* %intTwo, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %4, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !78, metadata !DIExpression()), !dbg !80
  store i64 0, i64* %i2, align 8, !dbg !81
  br label %for.cond3, !dbg !83

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !84
  %cmp4 = icmp ult i64 %5, 100, !dbg !86
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !87

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %7 = load i64, i64* %i2, align 8, !dbg !90
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !88
  %8 = load i64, i64* %i2, align 8, !dbg !91
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !92
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !92
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !92
  br label %for.inc8, !dbg !93

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !94
  %inc9 = add i64 %11, 1, !dbg !94
  store i64 %inc9, i64* %i2, align 8, !dbg !94
  br label %for.cond3, !dbg !95, !llvm.loop !96

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !98
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !98
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05_good() #0 !dbg !101 {
entry:
  call void @goodG2B1(), !dbg !102
  call void @goodG2B2(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i64 @time(i64* null) #5, !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 %conv) #5, !dbg !117
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !118
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05_good(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05_bad(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !125 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load i32, i32* @staticFalse, align 4, !dbg !132
  %tobool = icmp ne i32 %0, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.else, !dbg !134

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
  %cmp = icmp ult i64 %1, 100, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !156
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !157
  store i32 0, i32* %intOne, align 8, !dbg !158
  %3 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !160
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !161
  store i32 0, i32* %intTwo, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %4, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !168, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i2, align 8, !dbg !171
  br label %for.cond3, !dbg !173

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !174
  %cmp4 = icmp ult i64 %5, 100, !dbg !176
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !177

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !178
  %7 = load i64, i64* %i2, align 8, !dbg !180
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !178
  %8 = load i64, i64* %i2, align 8, !dbg !181
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !182
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !182
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !182
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !182
  br label %for.inc8, !dbg !183

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !184
  %inc9 = add i64 %11, 1, !dbg !184
  store i64 %inc9, i64* %i2, align 8, !dbg !184
  br label %for.cond3, !dbg !185, !llvm.loop !186

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !188
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !188
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !189
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
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = load i32, i32* @staticTrue, align 4, !dbg !198
  %tobool = icmp ne i32 %0, 0, !dbg !198
  br i1 %tobool, label %if.then, label %if.end, !dbg !200

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !201
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !203
  br label %if.end, !dbg !204

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !205, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i64* %i, metadata !208, metadata !DIExpression()), !dbg !210
  store i64 0, i64* %i, align 8, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !214
  %cmp = icmp ult i64 %1, 100, !dbg !216
  br i1 %cmp, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !218
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !220
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !221
  store i32 0, i32* %intOne, align 8, !dbg !222
  %3 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !224
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !225
  store i32 0, i32* %intTwo, align 4, !dbg !226
  br label %for.inc, !dbg !227

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !228
  %inc = add i64 %4, 1, !dbg !228
  store i64 %inc, i64* %i, align 8, !dbg !228
  br label %for.cond, !dbg !229, !llvm.loop !230

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !232, metadata !DIExpression()), !dbg !234
  store i64 0, i64* %i2, align 8, !dbg !235
  br label %for.cond3, !dbg !237

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !238
  %cmp4 = icmp ult i64 %5, 100, !dbg !240
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !241

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !242
  %7 = load i64, i64* %i2, align 8, !dbg !244
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !242
  %8 = load i64, i64* %i2, align 8, !dbg !245
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !246
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !246
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !246
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !246
  br label %for.inc8, !dbg !247

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !248
  %inc9 = add i64 %11, 1, !dbg !248
  store i64 %inc9, i64* %i2, align 8, !dbg !248
  br label %for.cond3, !dbg !249, !llvm.loop !250

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !252
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !252
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !253
  ret void, !dbg !254
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !24, line: 100, baseType: !25)
!24 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !24, line: 96, size: 64, elements: !26)
!26 = !{!27, !28}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !25, file: !24, line: 98, baseType: !11, size: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !25, file: !24, line: 99, baseType: !11, size: 32, offset: 32)
!29 = !DILocation(line: 30, column: 21, scope: !18)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 31, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 31, column: 19, scope: !18)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 32, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 32, column: 19, scope: !18)
!40 = !DILocation(line: 33, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!42 = !DILocation(line: 33, column: 8, scope: !18)
!43 = !DILocation(line: 37, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 34, column: 5)
!45 = !DILocation(line: 37, column: 14, scope: !44)
!46 = !DILocation(line: 38, column: 5, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !10, line: 40, type: !36)
!48 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 5)
!49 = !DILocation(line: 40, column: 23, scope: !48)
!50 = !DILocalVariable(name: "i", scope: !51, file: !10, line: 42, type: !52)
!51 = distinct !DILexicalBlock(scope: !48, file: !10, line: 41, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 42, column: 20, scope: !51)
!56 = !DILocation(line: 44, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !10, line: 44, column: 13)
!58 = !DILocation(line: 44, column: 18, scope: !57)
!59 = !DILocation(line: 44, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !10, line: 44, column: 13)
!61 = !DILocation(line: 44, column: 27, scope: !60)
!62 = !DILocation(line: 44, column: 13, scope: !57)
!63 = !DILocation(line: 46, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !10, line: 45, column: 13)
!65 = !DILocation(line: 46, column: 17, scope: !64)
!66 = !DILocation(line: 46, column: 27, scope: !64)
!67 = !DILocation(line: 46, column: 34, scope: !64)
!68 = !DILocation(line: 47, column: 24, scope: !64)
!69 = !DILocation(line: 47, column: 17, scope: !64)
!70 = !DILocation(line: 47, column: 27, scope: !64)
!71 = !DILocation(line: 47, column: 34, scope: !64)
!72 = !DILocation(line: 48, column: 13, scope: !64)
!73 = !DILocation(line: 44, column: 35, scope: !60)
!74 = !DILocation(line: 44, column: 13, scope: !60)
!75 = distinct !{!75, !62, !76, !77}
!76 = !DILocation(line: 48, column: 13, scope: !57)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocalVariable(name: "i", scope: !79, file: !10, line: 51, type: !52)
!79 = distinct !DILexicalBlock(scope: !48, file: !10, line: 50, column: 9)
!80 = !DILocation(line: 51, column: 20, scope: !79)
!81 = !DILocation(line: 53, column: 20, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !10, line: 53, column: 13)
!83 = !DILocation(line: 53, column: 18, scope: !82)
!84 = !DILocation(line: 53, column: 25, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 53, column: 13)
!86 = !DILocation(line: 53, column: 27, scope: !85)
!87 = !DILocation(line: 53, column: 13, scope: !82)
!88 = !DILocation(line: 55, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !10, line: 54, column: 13)
!90 = !DILocation(line: 55, column: 22, scope: !89)
!91 = !DILocation(line: 55, column: 34, scope: !89)
!92 = !DILocation(line: 55, column: 27, scope: !89)
!93 = !DILocation(line: 56, column: 13, scope: !89)
!94 = !DILocation(line: 53, column: 35, scope: !85)
!95 = !DILocation(line: 53, column: 13, scope: !85)
!96 = distinct !{!96, !87, !97, !77}
!97 = !DILocation(line: 56, column: 13, scope: !82)
!98 = !DILocation(line: 57, column: 30, scope: !79)
!99 = !DILocation(line: 57, column: 13, scope: !79)
!100 = !DILocation(line: 60, column: 1, scope: !18)
!101 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_05_good", scope: !10, file: !10, line: 139, type: !19, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocation(line: 141, column: 5, scope: !101)
!103 = !DILocation(line: 142, column: 5, scope: !101)
!104 = !DILocation(line: 143, column: 1, scope: !101)
!105 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 155, type: !106, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DISubroutineType(types: !107)
!107 = !{!11, !11, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !10, line: 155, type: !11)
!112 = !DILocation(line: 155, column: 14, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !10, line: 155, type: !108)
!114 = !DILocation(line: 155, column: 27, scope: !105)
!115 = !DILocation(line: 158, column: 22, scope: !105)
!116 = !DILocation(line: 158, column: 12, scope: !105)
!117 = !DILocation(line: 158, column: 5, scope: !105)
!118 = !DILocation(line: 160, column: 5, scope: !105)
!119 = !DILocation(line: 161, column: 5, scope: !105)
!120 = !DILocation(line: 162, column: 5, scope: !105)
!121 = !DILocation(line: 165, column: 5, scope: !105)
!122 = !DILocation(line: 166, column: 5, scope: !105)
!123 = !DILocation(line: 167, column: 5, scope: !105)
!124 = !DILocation(line: 169, column: 5, scope: !105)
!125 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 67, type: !19, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !10, line: 69, type: !22)
!127 = !DILocation(line: 69, column: 21, scope: !125)
!128 = !DILocalVariable(name: "dataBadBuffer", scope: !125, file: !10, line: 70, type: !31)
!129 = !DILocation(line: 70, column: 19, scope: !125)
!130 = !DILocalVariable(name: "dataGoodBuffer", scope: !125, file: !10, line: 71, type: !36)
!131 = !DILocation(line: 71, column: 19, scope: !125)
!132 = !DILocation(line: 72, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !125, file: !10, line: 72, column: 8)
!134 = !DILocation(line: 72, column: 8, scope: !125)
!135 = !DILocation(line: 75, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !10, line: 73, column: 5)
!137 = !DILocation(line: 76, column: 5, scope: !136)
!138 = !DILocation(line: 80, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !10, line: 78, column: 5)
!140 = !DILocation(line: 80, column: 14, scope: !139)
!141 = !DILocalVariable(name: "source", scope: !142, file: !10, line: 83, type: !36)
!142 = distinct !DILexicalBlock(scope: !125, file: !10, line: 82, column: 5)
!143 = !DILocation(line: 83, column: 23, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !145, file: !10, line: 85, type: !52)
!145 = distinct !DILexicalBlock(scope: !142, file: !10, line: 84, column: 9)
!146 = !DILocation(line: 85, column: 20, scope: !145)
!147 = !DILocation(line: 87, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !10, line: 87, column: 13)
!149 = !DILocation(line: 87, column: 18, scope: !148)
!150 = !DILocation(line: 87, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !10, line: 87, column: 13)
!152 = !DILocation(line: 87, column: 27, scope: !151)
!153 = !DILocation(line: 87, column: 13, scope: !148)
!154 = !DILocation(line: 89, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !10, line: 88, column: 13)
!156 = !DILocation(line: 89, column: 17, scope: !155)
!157 = !DILocation(line: 89, column: 27, scope: !155)
!158 = !DILocation(line: 89, column: 34, scope: !155)
!159 = !DILocation(line: 90, column: 24, scope: !155)
!160 = !DILocation(line: 90, column: 17, scope: !155)
!161 = !DILocation(line: 90, column: 27, scope: !155)
!162 = !DILocation(line: 90, column: 34, scope: !155)
!163 = !DILocation(line: 91, column: 13, scope: !155)
!164 = !DILocation(line: 87, column: 35, scope: !151)
!165 = !DILocation(line: 87, column: 13, scope: !151)
!166 = distinct !{!166, !153, !167, !77}
!167 = !DILocation(line: 91, column: 13, scope: !148)
!168 = !DILocalVariable(name: "i", scope: !169, file: !10, line: 94, type: !52)
!169 = distinct !DILexicalBlock(scope: !142, file: !10, line: 93, column: 9)
!170 = !DILocation(line: 94, column: 20, scope: !169)
!171 = !DILocation(line: 96, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !10, line: 96, column: 13)
!173 = !DILocation(line: 96, column: 18, scope: !172)
!174 = !DILocation(line: 96, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !10, line: 96, column: 13)
!176 = !DILocation(line: 96, column: 27, scope: !175)
!177 = !DILocation(line: 96, column: 13, scope: !172)
!178 = !DILocation(line: 98, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !10, line: 97, column: 13)
!180 = !DILocation(line: 98, column: 22, scope: !179)
!181 = !DILocation(line: 98, column: 34, scope: !179)
!182 = !DILocation(line: 98, column: 27, scope: !179)
!183 = !DILocation(line: 99, column: 13, scope: !179)
!184 = !DILocation(line: 96, column: 35, scope: !175)
!185 = !DILocation(line: 96, column: 13, scope: !175)
!186 = distinct !{!186, !177, !187, !77}
!187 = !DILocation(line: 99, column: 13, scope: !172)
!188 = !DILocation(line: 100, column: 30, scope: !169)
!189 = !DILocation(line: 100, column: 13, scope: !169)
!190 = !DILocation(line: 103, column: 1, scope: !125)
!191 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 106, type: !19, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!192 = !DILocalVariable(name: "data", scope: !191, file: !10, line: 108, type: !22)
!193 = !DILocation(line: 108, column: 21, scope: !191)
!194 = !DILocalVariable(name: "dataBadBuffer", scope: !191, file: !10, line: 109, type: !31)
!195 = !DILocation(line: 109, column: 19, scope: !191)
!196 = !DILocalVariable(name: "dataGoodBuffer", scope: !191, file: !10, line: 110, type: !36)
!197 = !DILocation(line: 110, column: 19, scope: !191)
!198 = !DILocation(line: 111, column: 8, scope: !199)
!199 = distinct !DILexicalBlock(scope: !191, file: !10, line: 111, column: 8)
!200 = !DILocation(line: 111, column: 8, scope: !191)
!201 = !DILocation(line: 114, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !10, line: 112, column: 5)
!203 = !DILocation(line: 114, column: 14, scope: !202)
!204 = !DILocation(line: 115, column: 5, scope: !202)
!205 = !DILocalVariable(name: "source", scope: !206, file: !10, line: 117, type: !36)
!206 = distinct !DILexicalBlock(scope: !191, file: !10, line: 116, column: 5)
!207 = !DILocation(line: 117, column: 23, scope: !206)
!208 = !DILocalVariable(name: "i", scope: !209, file: !10, line: 119, type: !52)
!209 = distinct !DILexicalBlock(scope: !206, file: !10, line: 118, column: 9)
!210 = !DILocation(line: 119, column: 20, scope: !209)
!211 = !DILocation(line: 121, column: 20, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !10, line: 121, column: 13)
!213 = !DILocation(line: 121, column: 18, scope: !212)
!214 = !DILocation(line: 121, column: 25, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !10, line: 121, column: 13)
!216 = !DILocation(line: 121, column: 27, scope: !215)
!217 = !DILocation(line: 121, column: 13, scope: !212)
!218 = !DILocation(line: 123, column: 24, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !10, line: 122, column: 13)
!220 = !DILocation(line: 123, column: 17, scope: !219)
!221 = !DILocation(line: 123, column: 27, scope: !219)
!222 = !DILocation(line: 123, column: 34, scope: !219)
!223 = !DILocation(line: 124, column: 24, scope: !219)
!224 = !DILocation(line: 124, column: 17, scope: !219)
!225 = !DILocation(line: 124, column: 27, scope: !219)
!226 = !DILocation(line: 124, column: 34, scope: !219)
!227 = !DILocation(line: 125, column: 13, scope: !219)
!228 = !DILocation(line: 121, column: 35, scope: !215)
!229 = !DILocation(line: 121, column: 13, scope: !215)
!230 = distinct !{!230, !217, !231, !77}
!231 = !DILocation(line: 125, column: 13, scope: !212)
!232 = !DILocalVariable(name: "i", scope: !233, file: !10, line: 128, type: !52)
!233 = distinct !DILexicalBlock(scope: !206, file: !10, line: 127, column: 9)
!234 = !DILocation(line: 128, column: 20, scope: !233)
!235 = !DILocation(line: 130, column: 20, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !10, line: 130, column: 13)
!237 = !DILocation(line: 130, column: 18, scope: !236)
!238 = !DILocation(line: 130, column: 25, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !10, line: 130, column: 13)
!240 = !DILocation(line: 130, column: 27, scope: !239)
!241 = !DILocation(line: 130, column: 13, scope: !236)
!242 = !DILocation(line: 132, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !10, line: 131, column: 13)
!244 = !DILocation(line: 132, column: 22, scope: !243)
!245 = !DILocation(line: 132, column: 34, scope: !243)
!246 = !DILocation(line: 132, column: 27, scope: !243)
!247 = !DILocation(line: 133, column: 13, scope: !243)
!248 = !DILocation(line: 130, column: 35, scope: !239)
!249 = !DILocation(line: 130, column: 13, scope: !239)
!250 = distinct !{!250, !241, !251, !77}
!251 = !DILocation(line: 133, column: 13, scope: !236)
!252 = !DILocation(line: 134, column: 30, scope: !233)
!253 = !DILocation(line: 134, column: 13, scope: !233)
!254 = !DILocation(line: 137, column: 1, scope: !191)
