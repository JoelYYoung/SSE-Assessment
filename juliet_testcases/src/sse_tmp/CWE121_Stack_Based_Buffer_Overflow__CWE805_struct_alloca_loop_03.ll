; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !33
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %5, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 0, i32* %intOne, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !63
  store i32 0, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %8, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !71, metadata !DIExpression()), !dbg !73
  store i64 0, i64* %i2, align 8, !dbg !74
  br label %for.cond3, !dbg !76

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !77
  %cmp4 = icmp ult i64 %9, 100, !dbg !79
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !80

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %11 = load i64, i64* %i2, align 8, !dbg !83
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !81
  %12 = load i64, i64* %i2, align 8, !dbg !84
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !85
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !85
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !85
  br label %for.inc8, !dbg !86

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !87
  %inc9 = add i64 %15, 1, !dbg !87
  store i64 %inc9, i64* %i2, align 8, !dbg !87
  br label %for.cond3, !dbg !88, !llvm.loop !89

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !91
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !91
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03_good() #0 !dbg !94 {
entry:
  call void @goodG2B1(), !dbg !95
  call void @goodG2B2(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #5, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #5, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !118 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = alloca i8, i64 400, align 16, !dbg !123
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !124
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %2 = alloca i8, i64 800, align 16, !dbg !127
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !128
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !126
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !129
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !142
  %cmp = icmp ult i64 %5, 100, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !148
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !149
  store i32 0, i32* %intOne, align 8, !dbg !150
  %7 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !152
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !153
  store i32 0, i32* %intTwo, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %8, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !160, metadata !DIExpression()), !dbg !162
  store i64 0, i64* %i2, align 8, !dbg !163
  br label %for.cond3, !dbg !165

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !166
  %cmp4 = icmp ult i64 %9, 100, !dbg !168
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !169

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !170
  %11 = load i64, i64* %i2, align 8, !dbg !172
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !170
  %12 = load i64, i64* %i2, align 8, !dbg !173
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !174
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !174
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !174
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !174
  br label %for.inc8, !dbg !175

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !176
  %inc9 = add i64 %15, 1, !dbg !176
  store i64 %inc9, i64* %i2, align 8, !dbg !176
  br label %for.cond3, !dbg !177, !llvm.loop !178

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !180
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !180
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !181
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !183 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !186, metadata !DIExpression()), !dbg !187
  %0 = alloca i8, i64 400, align 16, !dbg !188
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !189
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !190, metadata !DIExpression()), !dbg !191
  %2 = alloca i8, i64 800, align 16, !dbg !192
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !193
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !191
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !194
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !197
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i64* %i, metadata !201, metadata !DIExpression()), !dbg !203
  store i64 0, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !207
  %cmp = icmp ult i64 %5, 100, !dbg !209
  br i1 %cmp, label %for.body, label %for.end, !dbg !210

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !213
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !214
  store i32 0, i32* %intOne, align 8, !dbg !215
  %7 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !217
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !218
  store i32 0, i32* %intTwo, align 4, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !221
  %inc = add i64 %8, 1, !dbg !221
  store i64 %inc, i64* %i, align 8, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !225, metadata !DIExpression()), !dbg !227
  store i64 0, i64* %i2, align 8, !dbg !228
  br label %for.cond3, !dbg !230

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !231
  %cmp4 = icmp ult i64 %9, 100, !dbg !233
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !234

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !235
  %11 = load i64, i64* %i2, align 8, !dbg !237
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !235
  %12 = load i64, i64* %i2, align 8, !dbg !238
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !239
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !239
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !239
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !239
  br label %for.inc8, !dbg !240

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !241
  %inc9 = add i64 %15, 1, !dbg !241
  store i64 %inc9, i64* %i2, align 8, !dbg !241
  br label %for.cond3, !dbg !242, !llvm.loop !243

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !245
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !245
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !246
  ret void, !dbg !247
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocation(line: 24, column: 54, scope: !19)
!28 = !DILocation(line: 24, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 21, scope: !19)
!31 = !DILocation(line: 25, column: 55, scope: !19)
!32 = !DILocation(line: 25, column: 38, scope: !19)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !20, line: 27, column: 5)
!35 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!36 = !DILocation(line: 30, column: 14, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !20, line: 33, type: !39)
!38 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 33, column: 23, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !20, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !20, line: 34, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 35, column: 20, scope: !44)
!49 = !DILocation(line: 37, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !20, line: 37, column: 13)
!51 = !DILocation(line: 37, column: 18, scope: !50)
!52 = !DILocation(line: 37, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !20, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 27, scope: !53)
!55 = !DILocation(line: 37, column: 13, scope: !50)
!56 = !DILocation(line: 39, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !20, line: 38, column: 13)
!58 = !DILocation(line: 39, column: 17, scope: !57)
!59 = !DILocation(line: 39, column: 27, scope: !57)
!60 = !DILocation(line: 39, column: 34, scope: !57)
!61 = !DILocation(line: 40, column: 24, scope: !57)
!62 = !DILocation(line: 40, column: 17, scope: !57)
!63 = !DILocation(line: 40, column: 27, scope: !57)
!64 = !DILocation(line: 40, column: 34, scope: !57)
!65 = !DILocation(line: 41, column: 13, scope: !57)
!66 = !DILocation(line: 37, column: 35, scope: !53)
!67 = !DILocation(line: 37, column: 13, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 41, column: 13, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocalVariable(name: "i", scope: !72, file: !20, line: 44, type: !45)
!72 = distinct !DILexicalBlock(scope: !38, file: !20, line: 43, column: 9)
!73 = !DILocation(line: 44, column: 20, scope: !72)
!74 = !DILocation(line: 46, column: 20, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !20, line: 46, column: 13)
!76 = !DILocation(line: 46, column: 18, scope: !75)
!77 = !DILocation(line: 46, column: 25, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !20, line: 46, column: 13)
!79 = !DILocation(line: 46, column: 27, scope: !78)
!80 = !DILocation(line: 46, column: 13, scope: !75)
!81 = !DILocation(line: 48, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !20, line: 47, column: 13)
!83 = !DILocation(line: 48, column: 22, scope: !82)
!84 = !DILocation(line: 48, column: 34, scope: !82)
!85 = !DILocation(line: 48, column: 27, scope: !82)
!86 = !DILocation(line: 49, column: 13, scope: !82)
!87 = !DILocation(line: 46, column: 35, scope: !78)
!88 = !DILocation(line: 46, column: 13, scope: !78)
!89 = distinct !{!89, !80, !90, !70}
!90 = !DILocation(line: 49, column: 13, scope: !75)
!91 = !DILocation(line: 50, column: 30, scope: !72)
!92 = !DILocation(line: 50, column: 13, scope: !72)
!93 = !DILocation(line: 53, column: 1, scope: !19)
!94 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_03_good", scope: !20, file: !20, line: 132, type: !21, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 134, column: 5, scope: !94)
!96 = !DILocation(line: 135, column: 5, scope: !94)
!97 = !DILocation(line: 136, column: 1, scope: !94)
!98 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 148, type: !99, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!10, !10, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !20, line: 148, type: !10)
!105 = !DILocation(line: 148, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !20, line: 148, type: !101)
!107 = !DILocation(line: 148, column: 27, scope: !98)
!108 = !DILocation(line: 151, column: 22, scope: !98)
!109 = !DILocation(line: 151, column: 12, scope: !98)
!110 = !DILocation(line: 151, column: 5, scope: !98)
!111 = !DILocation(line: 153, column: 5, scope: !98)
!112 = !DILocation(line: 154, column: 5, scope: !98)
!113 = !DILocation(line: 155, column: 5, scope: !98)
!114 = !DILocation(line: 158, column: 5, scope: !98)
!115 = !DILocation(line: 159, column: 5, scope: !98)
!116 = !DILocation(line: 160, column: 5, scope: !98)
!117 = !DILocation(line: 162, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !20, line: 62, type: !4)
!120 = !DILocation(line: 62, column: 21, scope: !118)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !118, file: !20, line: 63, type: !4)
!122 = !DILocation(line: 63, column: 21, scope: !118)
!123 = !DILocation(line: 63, column: 54, scope: !118)
!124 = !DILocation(line: 63, column: 37, scope: !118)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !118, file: !20, line: 64, type: !4)
!126 = !DILocation(line: 64, column: 21, scope: !118)
!127 = !DILocation(line: 64, column: 55, scope: !118)
!128 = !DILocation(line: 64, column: 38, scope: !118)
!129 = !DILocation(line: 73, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !20, line: 71, column: 5)
!131 = distinct !DILexicalBlock(scope: !118, file: !20, line: 65, column: 8)
!132 = !DILocation(line: 73, column: 14, scope: !130)
!133 = !DILocalVariable(name: "source", scope: !134, file: !20, line: 76, type: !39)
!134 = distinct !DILexicalBlock(scope: !118, file: !20, line: 75, column: 5)
!135 = !DILocation(line: 76, column: 23, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !137, file: !20, line: 78, type: !45)
!137 = distinct !DILexicalBlock(scope: !134, file: !20, line: 77, column: 9)
!138 = !DILocation(line: 78, column: 20, scope: !137)
!139 = !DILocation(line: 80, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !20, line: 80, column: 13)
!141 = !DILocation(line: 80, column: 18, scope: !140)
!142 = !DILocation(line: 80, column: 25, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !20, line: 80, column: 13)
!144 = !DILocation(line: 80, column: 27, scope: !143)
!145 = !DILocation(line: 80, column: 13, scope: !140)
!146 = !DILocation(line: 82, column: 24, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !20, line: 81, column: 13)
!148 = !DILocation(line: 82, column: 17, scope: !147)
!149 = !DILocation(line: 82, column: 27, scope: !147)
!150 = !DILocation(line: 82, column: 34, scope: !147)
!151 = !DILocation(line: 83, column: 24, scope: !147)
!152 = !DILocation(line: 83, column: 17, scope: !147)
!153 = !DILocation(line: 83, column: 27, scope: !147)
!154 = !DILocation(line: 83, column: 34, scope: !147)
!155 = !DILocation(line: 84, column: 13, scope: !147)
!156 = !DILocation(line: 80, column: 35, scope: !143)
!157 = !DILocation(line: 80, column: 13, scope: !143)
!158 = distinct !{!158, !145, !159, !70}
!159 = !DILocation(line: 84, column: 13, scope: !140)
!160 = !DILocalVariable(name: "i", scope: !161, file: !20, line: 87, type: !45)
!161 = distinct !DILexicalBlock(scope: !134, file: !20, line: 86, column: 9)
!162 = !DILocation(line: 87, column: 20, scope: !161)
!163 = !DILocation(line: 89, column: 20, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !20, line: 89, column: 13)
!165 = !DILocation(line: 89, column: 18, scope: !164)
!166 = !DILocation(line: 89, column: 25, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !20, line: 89, column: 13)
!168 = !DILocation(line: 89, column: 27, scope: !167)
!169 = !DILocation(line: 89, column: 13, scope: !164)
!170 = !DILocation(line: 91, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !20, line: 90, column: 13)
!172 = !DILocation(line: 91, column: 22, scope: !171)
!173 = !DILocation(line: 91, column: 34, scope: !171)
!174 = !DILocation(line: 91, column: 27, scope: !171)
!175 = !DILocation(line: 92, column: 13, scope: !171)
!176 = !DILocation(line: 89, column: 35, scope: !167)
!177 = !DILocation(line: 89, column: 13, scope: !167)
!178 = distinct !{!178, !169, !179, !70}
!179 = !DILocation(line: 92, column: 13, scope: !164)
!180 = !DILocation(line: 93, column: 30, scope: !161)
!181 = !DILocation(line: 93, column: 13, scope: !161)
!182 = !DILocation(line: 96, column: 1, scope: !118)
!183 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 99, type: !21, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!184 = !DILocalVariable(name: "data", scope: !183, file: !20, line: 101, type: !4)
!185 = !DILocation(line: 101, column: 21, scope: !183)
!186 = !DILocalVariable(name: "dataBadBuffer", scope: !183, file: !20, line: 102, type: !4)
!187 = !DILocation(line: 102, column: 21, scope: !183)
!188 = !DILocation(line: 102, column: 54, scope: !183)
!189 = !DILocation(line: 102, column: 37, scope: !183)
!190 = !DILocalVariable(name: "dataGoodBuffer", scope: !183, file: !20, line: 103, type: !4)
!191 = !DILocation(line: 103, column: 21, scope: !183)
!192 = !DILocation(line: 103, column: 55, scope: !183)
!193 = !DILocation(line: 103, column: 38, scope: !183)
!194 = !DILocation(line: 107, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !20, line: 105, column: 5)
!196 = distinct !DILexicalBlock(scope: !183, file: !20, line: 104, column: 8)
!197 = !DILocation(line: 107, column: 14, scope: !195)
!198 = !DILocalVariable(name: "source", scope: !199, file: !20, line: 110, type: !39)
!199 = distinct !DILexicalBlock(scope: !183, file: !20, line: 109, column: 5)
!200 = !DILocation(line: 110, column: 23, scope: !199)
!201 = !DILocalVariable(name: "i", scope: !202, file: !20, line: 112, type: !45)
!202 = distinct !DILexicalBlock(scope: !199, file: !20, line: 111, column: 9)
!203 = !DILocation(line: 112, column: 20, scope: !202)
!204 = !DILocation(line: 114, column: 20, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !20, line: 114, column: 13)
!206 = !DILocation(line: 114, column: 18, scope: !205)
!207 = !DILocation(line: 114, column: 25, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !20, line: 114, column: 13)
!209 = !DILocation(line: 114, column: 27, scope: !208)
!210 = !DILocation(line: 114, column: 13, scope: !205)
!211 = !DILocation(line: 116, column: 24, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !20, line: 115, column: 13)
!213 = !DILocation(line: 116, column: 17, scope: !212)
!214 = !DILocation(line: 116, column: 27, scope: !212)
!215 = !DILocation(line: 116, column: 34, scope: !212)
!216 = !DILocation(line: 117, column: 24, scope: !212)
!217 = !DILocation(line: 117, column: 17, scope: !212)
!218 = !DILocation(line: 117, column: 27, scope: !212)
!219 = !DILocation(line: 117, column: 34, scope: !212)
!220 = !DILocation(line: 118, column: 13, scope: !212)
!221 = !DILocation(line: 114, column: 35, scope: !208)
!222 = !DILocation(line: 114, column: 13, scope: !208)
!223 = distinct !{!223, !210, !224, !70}
!224 = !DILocation(line: 118, column: 13, scope: !205)
!225 = !DILocalVariable(name: "i", scope: !226, file: !20, line: 121, type: !45)
!226 = distinct !DILexicalBlock(scope: !199, file: !20, line: 120, column: 9)
!227 = !DILocation(line: 121, column: 20, scope: !226)
!228 = !DILocation(line: 123, column: 20, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !20, line: 123, column: 13)
!230 = !DILocation(line: 123, column: 18, scope: !229)
!231 = !DILocation(line: 123, column: 25, scope: !232)
!232 = distinct !DILexicalBlock(scope: !229, file: !20, line: 123, column: 13)
!233 = !DILocation(line: 123, column: 27, scope: !232)
!234 = !DILocation(line: 123, column: 13, scope: !229)
!235 = !DILocation(line: 125, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !20, line: 124, column: 13)
!237 = !DILocation(line: 125, column: 22, scope: !236)
!238 = !DILocation(line: 125, column: 34, scope: !236)
!239 = !DILocation(line: 125, column: 27, scope: !236)
!240 = !DILocation(line: 126, column: 13, scope: !236)
!241 = !DILocation(line: 123, column: 35, scope: !232)
!242 = !DILocation(line: 123, column: 13, scope: !232)
!243 = distinct !{!243, !234, !244, !70}
!244 = !DILocation(line: 126, column: 13, scope: !229)
!245 = !DILocation(line: 127, column: 30, scope: !226)
!246 = !DILocation(line: 127, column: 13, scope: !226)
!247 = !DILocation(line: 130, column: 1, scope: !183)
