; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15_bad() #0 !dbg !19 {
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
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %5, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !56
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !57
  store i32 0, i32* %intOne, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !60
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !61
  store i32 0, i32* %intTwo, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !69, metadata !DIExpression()), !dbg !71
  store i64 0, i64* %i2, align 8, !dbg !72
  br label %for.cond3, !dbg !74

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !75
  %cmp4 = icmp ult i64 %9, 100, !dbg !77
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !78

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %11 = load i64, i64* %i2, align 8, !dbg !81
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !79
  %12 = load i64, i64* %i2, align 8, !dbg !82
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !83
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !83
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !83
  br label %for.inc8, !dbg !84

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !85
  %inc9 = add i64 %15, 1, !dbg !85
  store i64 %inc9, i64* %i2, align 8, !dbg !85
  br label %for.cond3, !dbg !86, !llvm.loop !87

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !89
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15_good() #0 !dbg !92 {
entry:
  call void @goodG2B1(), !dbg !93
  call void @goodG2B2(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #5, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #5, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !116 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 400, align 16, !dbg !121
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !122
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %2 = alloca i8, i64 800, align 16, !dbg !125
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !126
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !124
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !127
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !138
  %cmp = icmp ult i64 %5, 100, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !144
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !145
  store i32 0, i32* %intOne, align 8, !dbg !146
  %7 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !148
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !149
  store i32 0, i32* %intTwo, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %8, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i2, align 8, !dbg !159
  br label %for.cond3, !dbg !161

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !162
  %cmp4 = icmp ult i64 %9, 100, !dbg !164
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !165

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !166
  %11 = load i64, i64* %i2, align 8, !dbg !168
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !166
  %12 = load i64, i64* %i2, align 8, !dbg !169
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !170
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !170
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !170
  br label %for.inc8, !dbg !171

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !172
  %inc9 = add i64 %15, 1, !dbg !172
  store i64 %inc9, i64* %i2, align 8, !dbg !172
  br label %for.cond3, !dbg !173, !llvm.loop !174

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !176
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !177
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !179 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !182, metadata !DIExpression()), !dbg !183
  %0 = alloca i8, i64 400, align 16, !dbg !184
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !185
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !183
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !186, metadata !DIExpression()), !dbg !187
  %2 = alloca i8, i64 800, align 16, !dbg !188
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !189
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !187
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !190
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !192, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i64* %i, metadata !195, metadata !DIExpression()), !dbg !197
  store i64 0, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !201
  %cmp = icmp ult i64 %5, 100, !dbg !203
  br i1 %cmp, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !207
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !208
  store i32 0, i32* %intOne, align 8, !dbg !209
  %7 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !211
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !212
  store i32 0, i32* %intTwo, align 4, !dbg !213
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !215
  %inc = add i64 %8, 1, !dbg !215
  store i64 %inc, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !216, !llvm.loop !217

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !219, metadata !DIExpression()), !dbg !221
  store i64 0, i64* %i2, align 8, !dbg !222
  br label %for.cond3, !dbg !224

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !225
  %cmp4 = icmp ult i64 %9, 100, !dbg !227
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !228

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !229
  %11 = load i64, i64* %i2, align 8, !dbg !231
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !229
  %12 = load i64, i64* %i2, align 8, !dbg !232
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !233
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !233
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !233
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !233
  br label %for.inc8, !dbg !234

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !235
  %inc9 = add i64 %15, 1, !dbg !235
  store i64 %inc9, i64* %i2, align 8, !dbg !235
  br label %for.cond3, !dbg !236, !llvm.loop !237

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !239
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !239
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !240
  ret void, !dbg !241
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15.c", directory: "/root/SSE-Assessment")
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
!33 = !DILocation(line: 31, column: 16, scope: !19)
!34 = !DILocation(line: 31, column: 14, scope: !19)
!35 = !DILocalVariable(name: "source", scope: !36, file: !20, line: 39, type: !37)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 38, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 39, column: 23, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !20, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !20, line: 40, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 41, column: 20, scope: !42)
!47 = !DILocation(line: 43, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !20, line: 43, column: 13)
!49 = !DILocation(line: 43, column: 18, scope: !48)
!50 = !DILocation(line: 43, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !20, line: 43, column: 13)
!52 = !DILocation(line: 43, column: 27, scope: !51)
!53 = !DILocation(line: 43, column: 13, scope: !48)
!54 = !DILocation(line: 45, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !20, line: 44, column: 13)
!56 = !DILocation(line: 45, column: 17, scope: !55)
!57 = !DILocation(line: 45, column: 27, scope: !55)
!58 = !DILocation(line: 45, column: 34, scope: !55)
!59 = !DILocation(line: 46, column: 24, scope: !55)
!60 = !DILocation(line: 46, column: 17, scope: !55)
!61 = !DILocation(line: 46, column: 27, scope: !55)
!62 = !DILocation(line: 46, column: 34, scope: !55)
!63 = !DILocation(line: 47, column: 13, scope: !55)
!64 = !DILocation(line: 43, column: 35, scope: !51)
!65 = !DILocation(line: 43, column: 13, scope: !51)
!66 = distinct !{!66, !53, !67, !68}
!67 = !DILocation(line: 47, column: 13, scope: !48)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocalVariable(name: "i", scope: !70, file: !20, line: 50, type: !43)
!70 = distinct !DILexicalBlock(scope: !36, file: !20, line: 49, column: 9)
!71 = !DILocation(line: 50, column: 20, scope: !70)
!72 = !DILocation(line: 52, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !20, line: 52, column: 13)
!74 = !DILocation(line: 52, column: 18, scope: !73)
!75 = !DILocation(line: 52, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !20, line: 52, column: 13)
!77 = !DILocation(line: 52, column: 27, scope: !76)
!78 = !DILocation(line: 52, column: 13, scope: !73)
!79 = !DILocation(line: 54, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !20, line: 53, column: 13)
!81 = !DILocation(line: 54, column: 22, scope: !80)
!82 = !DILocation(line: 54, column: 34, scope: !80)
!83 = !DILocation(line: 54, column: 27, scope: !80)
!84 = !DILocation(line: 55, column: 13, scope: !80)
!85 = !DILocation(line: 52, column: 35, scope: !76)
!86 = !DILocation(line: 52, column: 13, scope: !76)
!87 = distinct !{!87, !78, !88, !68}
!88 = !DILocation(line: 55, column: 13, scope: !73)
!89 = !DILocation(line: 56, column: 30, scope: !70)
!90 = !DILocation(line: 56, column: 13, scope: !70)
!91 = !DILocation(line: 59, column: 1, scope: !19)
!92 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_15_good", scope: !20, file: !20, line: 145, type: !21, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 147, column: 5, scope: !92)
!94 = !DILocation(line: 148, column: 5, scope: !92)
!95 = !DILocation(line: 149, column: 1, scope: !92)
!96 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 161, type: !97, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!10, !10, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !20, line: 161, type: !10)
!103 = !DILocation(line: 161, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !20, line: 161, type: !99)
!105 = !DILocation(line: 161, column: 27, scope: !96)
!106 = !DILocation(line: 164, column: 22, scope: !96)
!107 = !DILocation(line: 164, column: 12, scope: !96)
!108 = !DILocation(line: 164, column: 5, scope: !96)
!109 = !DILocation(line: 166, column: 5, scope: !96)
!110 = !DILocation(line: 167, column: 5, scope: !96)
!111 = !DILocation(line: 168, column: 5, scope: !96)
!112 = !DILocation(line: 171, column: 5, scope: !96)
!113 = !DILocation(line: 172, column: 5, scope: !96)
!114 = !DILocation(line: 173, column: 5, scope: !96)
!115 = !DILocation(line: 175, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !20, line: 68, type: !4)
!118 = !DILocation(line: 68, column: 21, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !20, line: 69, type: !4)
!120 = !DILocation(line: 69, column: 21, scope: !116)
!121 = !DILocation(line: 69, column: 54, scope: !116)
!122 = !DILocation(line: 69, column: 37, scope: !116)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !20, line: 70, type: !4)
!124 = !DILocation(line: 70, column: 21, scope: !116)
!125 = !DILocation(line: 70, column: 55, scope: !116)
!126 = !DILocation(line: 70, column: 38, scope: !116)
!127 = !DILocation(line: 79, column: 16, scope: !116)
!128 = !DILocation(line: 79, column: 14, scope: !116)
!129 = !DILocalVariable(name: "source", scope: !130, file: !20, line: 83, type: !37)
!130 = distinct !DILexicalBlock(scope: !116, file: !20, line: 82, column: 5)
!131 = !DILocation(line: 83, column: 23, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !133, file: !20, line: 85, type: !43)
!133 = distinct !DILexicalBlock(scope: !130, file: !20, line: 84, column: 9)
!134 = !DILocation(line: 85, column: 20, scope: !133)
!135 = !DILocation(line: 87, column: 20, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !20, line: 87, column: 13)
!137 = !DILocation(line: 87, column: 18, scope: !136)
!138 = !DILocation(line: 87, column: 25, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !20, line: 87, column: 13)
!140 = !DILocation(line: 87, column: 27, scope: !139)
!141 = !DILocation(line: 87, column: 13, scope: !136)
!142 = !DILocation(line: 89, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !20, line: 88, column: 13)
!144 = !DILocation(line: 89, column: 17, scope: !143)
!145 = !DILocation(line: 89, column: 27, scope: !143)
!146 = !DILocation(line: 89, column: 34, scope: !143)
!147 = !DILocation(line: 90, column: 24, scope: !143)
!148 = !DILocation(line: 90, column: 17, scope: !143)
!149 = !DILocation(line: 90, column: 27, scope: !143)
!150 = !DILocation(line: 90, column: 34, scope: !143)
!151 = !DILocation(line: 91, column: 13, scope: !143)
!152 = !DILocation(line: 87, column: 35, scope: !139)
!153 = !DILocation(line: 87, column: 13, scope: !139)
!154 = distinct !{!154, !141, !155, !68}
!155 = !DILocation(line: 91, column: 13, scope: !136)
!156 = !DILocalVariable(name: "i", scope: !157, file: !20, line: 94, type: !43)
!157 = distinct !DILexicalBlock(scope: !130, file: !20, line: 93, column: 9)
!158 = !DILocation(line: 94, column: 20, scope: !157)
!159 = !DILocation(line: 96, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !20, line: 96, column: 13)
!161 = !DILocation(line: 96, column: 18, scope: !160)
!162 = !DILocation(line: 96, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !20, line: 96, column: 13)
!164 = !DILocation(line: 96, column: 27, scope: !163)
!165 = !DILocation(line: 96, column: 13, scope: !160)
!166 = !DILocation(line: 98, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !20, line: 97, column: 13)
!168 = !DILocation(line: 98, column: 22, scope: !167)
!169 = !DILocation(line: 98, column: 34, scope: !167)
!170 = !DILocation(line: 98, column: 27, scope: !167)
!171 = !DILocation(line: 99, column: 13, scope: !167)
!172 = !DILocation(line: 96, column: 35, scope: !163)
!173 = !DILocation(line: 96, column: 13, scope: !163)
!174 = distinct !{!174, !165, !175, !68}
!175 = !DILocation(line: 99, column: 13, scope: !160)
!176 = !DILocation(line: 100, column: 30, scope: !157)
!177 = !DILocation(line: 100, column: 13, scope: !157)
!178 = !DILocation(line: 103, column: 1, scope: !116)
!179 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DILocalVariable(name: "data", scope: !179, file: !20, line: 108, type: !4)
!181 = !DILocation(line: 108, column: 21, scope: !179)
!182 = !DILocalVariable(name: "dataBadBuffer", scope: !179, file: !20, line: 109, type: !4)
!183 = !DILocation(line: 109, column: 21, scope: !179)
!184 = !DILocation(line: 109, column: 54, scope: !179)
!185 = !DILocation(line: 109, column: 37, scope: !179)
!186 = !DILocalVariable(name: "dataGoodBuffer", scope: !179, file: !20, line: 110, type: !4)
!187 = !DILocation(line: 110, column: 21, scope: !179)
!188 = !DILocation(line: 110, column: 55, scope: !179)
!189 = !DILocation(line: 110, column: 38, scope: !179)
!190 = !DILocation(line: 115, column: 16, scope: !179)
!191 = !DILocation(line: 115, column: 14, scope: !179)
!192 = !DILocalVariable(name: "source", scope: !193, file: !20, line: 123, type: !37)
!193 = distinct !DILexicalBlock(scope: !179, file: !20, line: 122, column: 5)
!194 = !DILocation(line: 123, column: 23, scope: !193)
!195 = !DILocalVariable(name: "i", scope: !196, file: !20, line: 125, type: !43)
!196 = distinct !DILexicalBlock(scope: !193, file: !20, line: 124, column: 9)
!197 = !DILocation(line: 125, column: 20, scope: !196)
!198 = !DILocation(line: 127, column: 20, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !20, line: 127, column: 13)
!200 = !DILocation(line: 127, column: 18, scope: !199)
!201 = !DILocation(line: 127, column: 25, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !20, line: 127, column: 13)
!203 = !DILocation(line: 127, column: 27, scope: !202)
!204 = !DILocation(line: 127, column: 13, scope: !199)
!205 = !DILocation(line: 129, column: 24, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !20, line: 128, column: 13)
!207 = !DILocation(line: 129, column: 17, scope: !206)
!208 = !DILocation(line: 129, column: 27, scope: !206)
!209 = !DILocation(line: 129, column: 34, scope: !206)
!210 = !DILocation(line: 130, column: 24, scope: !206)
!211 = !DILocation(line: 130, column: 17, scope: !206)
!212 = !DILocation(line: 130, column: 27, scope: !206)
!213 = !DILocation(line: 130, column: 34, scope: !206)
!214 = !DILocation(line: 131, column: 13, scope: !206)
!215 = !DILocation(line: 127, column: 35, scope: !202)
!216 = !DILocation(line: 127, column: 13, scope: !202)
!217 = distinct !{!217, !204, !218, !68}
!218 = !DILocation(line: 131, column: 13, scope: !199)
!219 = !DILocalVariable(name: "i", scope: !220, file: !20, line: 134, type: !43)
!220 = distinct !DILexicalBlock(scope: !193, file: !20, line: 133, column: 9)
!221 = !DILocation(line: 134, column: 20, scope: !220)
!222 = !DILocation(line: 136, column: 20, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !20, line: 136, column: 13)
!224 = !DILocation(line: 136, column: 18, scope: !223)
!225 = !DILocation(line: 136, column: 25, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !20, line: 136, column: 13)
!227 = !DILocation(line: 136, column: 27, scope: !226)
!228 = !DILocation(line: 136, column: 13, scope: !223)
!229 = !DILocation(line: 138, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !20, line: 137, column: 13)
!231 = !DILocation(line: 138, column: 22, scope: !230)
!232 = !DILocation(line: 138, column: 34, scope: !230)
!233 = !DILocation(line: 138, column: 27, scope: !230)
!234 = !DILocation(line: 139, column: 13, scope: !230)
!235 = !DILocation(line: 136, column: 35, scope: !226)
!236 = !DILocation(line: 136, column: 13, scope: !226)
!237 = distinct !{!237, !228, !238, !68}
!238 = !DILocation(line: 139, column: 13, scope: !223)
!239 = !DILocation(line: 140, column: 30, scope: !220)
!240 = !DILocation(line: 140, column: 13, scope: !220)
!241 = !DILocation(line: 143, column: 1, scope: !179)
