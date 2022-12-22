; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06_bad() #0 !dbg !11 {
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
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %0, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !57
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !58
  store i32 0, i32* %intOne, align 8, !dbg !59
  %2 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !61
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !62
  store i32 0, i32* %intTwo, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %3, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !70, metadata !DIExpression()), !dbg !72
  store i64 0, i64* %i2, align 8, !dbg !73
  br label %for.cond3, !dbg !75

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !76
  %cmp4 = icmp ult i64 %4, 100, !dbg !78
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !79

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %6 = load i64, i64* %i2, align 8, !dbg !82
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !80
  %7 = load i64, i64* %i2, align 8, !dbg !83
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !84
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !84
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !84
  br label %for.inc8, !dbg !85

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !86
  %inc9 = add i64 %10, 1, !dbg !86
  store i64 %inc9, i64* %i2, align 8, !dbg !86
  br label %for.cond3, !dbg !87, !llvm.loop !88

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !90
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !90
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06_good() #0 !dbg !93 {
entry:
  call void @goodG2B1(), !dbg !94
  call void @goodG2B2(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #5, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #5, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !117 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %0, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !143
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !144
  store i32 0, i32* %intOne, align 8, !dbg !145
  %2 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !147
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !148
  store i32 0, i32* %intTwo, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %3, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !155, metadata !DIExpression()), !dbg !157
  store i64 0, i64* %i2, align 8, !dbg !158
  br label %for.cond3, !dbg !160

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !161
  %cmp4 = icmp ult i64 %4, 100, !dbg !163
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !164

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !165
  %6 = load i64, i64* %i2, align 8, !dbg !167
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !165
  %7 = load i64, i64* %i2, align 8, !dbg !168
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !169
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !169
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !169
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !169
  br label %for.inc8, !dbg !170

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !171
  %inc9 = add i64 %10, 1, !dbg !171
  store i64 %inc9, i64* %i2, align 8, !dbg !171
  br label %for.cond3, !dbg !172, !llvm.loop !173

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !175
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !175
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !176
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !178 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !185
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !188
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !189, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata i64* %i, metadata !192, metadata !DIExpression()), !dbg !194
  store i64 0, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !198
  %cmp = icmp ult i64 %0, 100, !dbg !200
  br i1 %cmp, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !204
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !205
  store i32 0, i32* %intOne, align 8, !dbg !206
  %2 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !208
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !209
  store i32 0, i32* %intTwo, align 4, !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !212
  %inc = add i64 %3, 1, !dbg !212
  store i64 %inc, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !216, metadata !DIExpression()), !dbg !218
  store i64 0, i64* %i2, align 8, !dbg !219
  br label %for.cond3, !dbg !221

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !222
  %cmp4 = icmp ult i64 %4, 100, !dbg !224
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !225

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !226
  %6 = load i64, i64* %i2, align 8, !dbg !228
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !226
  %7 = load i64, i64* %i2, align 8, !dbg !229
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !230
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !230
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !230
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !230
  br label %for.inc8, !dbg !231

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !232
  %inc9 = add i64 %10, 1, !dbg !232
  store i64 %inc9, i64* %i2, align 8, !dbg !232
  br label %for.cond3, !dbg !233, !llvm.loop !234

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !236
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !236
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !237
  ret void, !dbg !238
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 27, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 28, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 29, column: 19, scope: !11)
!35 = !DILocation(line: 34, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !12, line: 31, column: 5)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 8)
!38 = !DILocation(line: 34, column: 14, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 37, type: !31)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!41 = !DILocation(line: 37, column: 23, scope: !40)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 39, type: !44)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 38, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 39, column: 20, scope: !43)
!48 = !DILocation(line: 41, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !12, line: 41, column: 13)
!50 = !DILocation(line: 41, column: 18, scope: !49)
!51 = !DILocation(line: 41, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 41, column: 13)
!53 = !DILocation(line: 41, column: 27, scope: !52)
!54 = !DILocation(line: 41, column: 13, scope: !49)
!55 = !DILocation(line: 43, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 42, column: 13)
!57 = !DILocation(line: 43, column: 17, scope: !56)
!58 = !DILocation(line: 43, column: 27, scope: !56)
!59 = !DILocation(line: 43, column: 34, scope: !56)
!60 = !DILocation(line: 44, column: 24, scope: !56)
!61 = !DILocation(line: 44, column: 17, scope: !56)
!62 = !DILocation(line: 44, column: 27, scope: !56)
!63 = !DILocation(line: 44, column: 34, scope: !56)
!64 = !DILocation(line: 45, column: 13, scope: !56)
!65 = !DILocation(line: 41, column: 35, scope: !52)
!66 = !DILocation(line: 41, column: 13, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 45, column: 13, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocalVariable(name: "i", scope: !71, file: !12, line: 48, type: !44)
!71 = distinct !DILexicalBlock(scope: !40, file: !12, line: 47, column: 9)
!72 = !DILocation(line: 48, column: 20, scope: !71)
!73 = !DILocation(line: 50, column: 20, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !12, line: 50, column: 13)
!75 = !DILocation(line: 50, column: 18, scope: !74)
!76 = !DILocation(line: 50, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 50, column: 13)
!78 = !DILocation(line: 50, column: 27, scope: !77)
!79 = !DILocation(line: 50, column: 13, scope: !74)
!80 = !DILocation(line: 52, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !12, line: 51, column: 13)
!82 = !DILocation(line: 52, column: 22, scope: !81)
!83 = !DILocation(line: 52, column: 34, scope: !81)
!84 = !DILocation(line: 52, column: 27, scope: !81)
!85 = !DILocation(line: 53, column: 13, scope: !81)
!86 = !DILocation(line: 50, column: 35, scope: !77)
!87 = !DILocation(line: 50, column: 13, scope: !77)
!88 = distinct !{!88, !79, !89, !69}
!89 = !DILocation(line: 53, column: 13, scope: !74)
!90 = !DILocation(line: 54, column: 30, scope: !71)
!91 = !DILocation(line: 54, column: 13, scope: !71)
!92 = !DILocation(line: 57, column: 1, scope: !11)
!93 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_06_good", scope: !12, file: !12, line: 136, type: !13, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 138, column: 5, scope: !93)
!95 = !DILocation(line: 139, column: 5, scope: !93)
!96 = !DILocation(line: 140, column: 1, scope: !93)
!97 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 152, type: !98, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!22, !22, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !12, line: 152, type: !22)
!104 = !DILocation(line: 152, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !12, line: 152, type: !100)
!106 = !DILocation(line: 152, column: 27, scope: !97)
!107 = !DILocation(line: 155, column: 22, scope: !97)
!108 = !DILocation(line: 155, column: 12, scope: !97)
!109 = !DILocation(line: 155, column: 5, scope: !97)
!110 = !DILocation(line: 157, column: 5, scope: !97)
!111 = !DILocation(line: 158, column: 5, scope: !97)
!112 = !DILocation(line: 159, column: 5, scope: !97)
!113 = !DILocation(line: 162, column: 5, scope: !97)
!114 = !DILocation(line: 163, column: 5, scope: !97)
!115 = !DILocation(line: 164, column: 5, scope: !97)
!116 = !DILocation(line: 166, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 66, type: !16)
!119 = !DILocation(line: 66, column: 21, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !12, line: 67, type: !26)
!121 = !DILocation(line: 67, column: 19, scope: !117)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !12, line: 68, type: !31)
!123 = !DILocation(line: 68, column: 19, scope: !117)
!124 = !DILocation(line: 77, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !126, file: !12, line: 75, column: 5)
!126 = distinct !DILexicalBlock(scope: !117, file: !12, line: 69, column: 8)
!127 = !DILocation(line: 77, column: 14, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !12, line: 80, type: !31)
!129 = distinct !DILexicalBlock(scope: !117, file: !12, line: 79, column: 5)
!130 = !DILocation(line: 80, column: 23, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !12, line: 82, type: !44)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 81, column: 9)
!133 = !DILocation(line: 82, column: 20, scope: !132)
!134 = !DILocation(line: 84, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !12, line: 84, column: 13)
!136 = !DILocation(line: 84, column: 18, scope: !135)
!137 = !DILocation(line: 84, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 84, column: 13)
!139 = !DILocation(line: 84, column: 27, scope: !138)
!140 = !DILocation(line: 84, column: 13, scope: !135)
!141 = !DILocation(line: 86, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !12, line: 85, column: 13)
!143 = !DILocation(line: 86, column: 17, scope: !142)
!144 = !DILocation(line: 86, column: 27, scope: !142)
!145 = !DILocation(line: 86, column: 34, scope: !142)
!146 = !DILocation(line: 87, column: 24, scope: !142)
!147 = !DILocation(line: 87, column: 17, scope: !142)
!148 = !DILocation(line: 87, column: 27, scope: !142)
!149 = !DILocation(line: 87, column: 34, scope: !142)
!150 = !DILocation(line: 88, column: 13, scope: !142)
!151 = !DILocation(line: 84, column: 35, scope: !138)
!152 = !DILocation(line: 84, column: 13, scope: !138)
!153 = distinct !{!153, !140, !154, !69}
!154 = !DILocation(line: 88, column: 13, scope: !135)
!155 = !DILocalVariable(name: "i", scope: !156, file: !12, line: 91, type: !44)
!156 = distinct !DILexicalBlock(scope: !129, file: !12, line: 90, column: 9)
!157 = !DILocation(line: 91, column: 20, scope: !156)
!158 = !DILocation(line: 93, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 93, column: 13)
!160 = !DILocation(line: 93, column: 18, scope: !159)
!161 = !DILocation(line: 93, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 93, column: 13)
!163 = !DILocation(line: 93, column: 27, scope: !162)
!164 = !DILocation(line: 93, column: 13, scope: !159)
!165 = !DILocation(line: 95, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 94, column: 13)
!167 = !DILocation(line: 95, column: 22, scope: !166)
!168 = !DILocation(line: 95, column: 34, scope: !166)
!169 = !DILocation(line: 95, column: 27, scope: !166)
!170 = !DILocation(line: 96, column: 13, scope: !166)
!171 = !DILocation(line: 93, column: 35, scope: !162)
!172 = !DILocation(line: 93, column: 13, scope: !162)
!173 = distinct !{!173, !164, !174, !69}
!174 = !DILocation(line: 96, column: 13, scope: !159)
!175 = !DILocation(line: 97, column: 30, scope: !156)
!176 = !DILocation(line: 97, column: 13, scope: !156)
!177 = !DILocation(line: 100, column: 1, scope: !117)
!178 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!179 = !DILocalVariable(name: "data", scope: !178, file: !12, line: 105, type: !16)
!180 = !DILocation(line: 105, column: 21, scope: !178)
!181 = !DILocalVariable(name: "dataBadBuffer", scope: !178, file: !12, line: 106, type: !26)
!182 = !DILocation(line: 106, column: 19, scope: !178)
!183 = !DILocalVariable(name: "dataGoodBuffer", scope: !178, file: !12, line: 107, type: !31)
!184 = !DILocation(line: 107, column: 19, scope: !178)
!185 = !DILocation(line: 111, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !12, line: 109, column: 5)
!187 = distinct !DILexicalBlock(scope: !178, file: !12, line: 108, column: 8)
!188 = !DILocation(line: 111, column: 14, scope: !186)
!189 = !DILocalVariable(name: "source", scope: !190, file: !12, line: 114, type: !31)
!190 = distinct !DILexicalBlock(scope: !178, file: !12, line: 113, column: 5)
!191 = !DILocation(line: 114, column: 23, scope: !190)
!192 = !DILocalVariable(name: "i", scope: !193, file: !12, line: 116, type: !44)
!193 = distinct !DILexicalBlock(scope: !190, file: !12, line: 115, column: 9)
!194 = !DILocation(line: 116, column: 20, scope: !193)
!195 = !DILocation(line: 118, column: 20, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 118, column: 13)
!197 = !DILocation(line: 118, column: 18, scope: !196)
!198 = !DILocation(line: 118, column: 25, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !12, line: 118, column: 13)
!200 = !DILocation(line: 118, column: 27, scope: !199)
!201 = !DILocation(line: 118, column: 13, scope: !196)
!202 = !DILocation(line: 120, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !12, line: 119, column: 13)
!204 = !DILocation(line: 120, column: 17, scope: !203)
!205 = !DILocation(line: 120, column: 27, scope: !203)
!206 = !DILocation(line: 120, column: 34, scope: !203)
!207 = !DILocation(line: 121, column: 24, scope: !203)
!208 = !DILocation(line: 121, column: 17, scope: !203)
!209 = !DILocation(line: 121, column: 27, scope: !203)
!210 = !DILocation(line: 121, column: 34, scope: !203)
!211 = !DILocation(line: 122, column: 13, scope: !203)
!212 = !DILocation(line: 118, column: 35, scope: !199)
!213 = !DILocation(line: 118, column: 13, scope: !199)
!214 = distinct !{!214, !201, !215, !69}
!215 = !DILocation(line: 122, column: 13, scope: !196)
!216 = !DILocalVariable(name: "i", scope: !217, file: !12, line: 125, type: !44)
!217 = distinct !DILexicalBlock(scope: !190, file: !12, line: 124, column: 9)
!218 = !DILocation(line: 125, column: 20, scope: !217)
!219 = !DILocation(line: 127, column: 20, scope: !220)
!220 = distinct !DILexicalBlock(scope: !217, file: !12, line: 127, column: 13)
!221 = !DILocation(line: 127, column: 18, scope: !220)
!222 = !DILocation(line: 127, column: 25, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !12, line: 127, column: 13)
!224 = !DILocation(line: 127, column: 27, scope: !223)
!225 = !DILocation(line: 127, column: 13, scope: !220)
!226 = !DILocation(line: 129, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !12, line: 128, column: 13)
!228 = !DILocation(line: 129, column: 22, scope: !227)
!229 = !DILocation(line: 129, column: 34, scope: !227)
!230 = !DILocation(line: 129, column: 27, scope: !227)
!231 = !DILocation(line: 130, column: 13, scope: !227)
!232 = !DILocation(line: 127, column: 35, scope: !223)
!233 = !DILocation(line: 127, column: 13, scope: !223)
!234 = distinct !{!234, !225, !235, !69}
!235 = !DILocation(line: 130, column: 13, scope: !220)
!236 = !DILocation(line: 131, column: 30, scope: !217)
!237 = !DILocation(line: 131, column: 13, scope: !217)
!238 = !DILocation(line: 134, column: 1, scope: !178)
