; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !41
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !42
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !40
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !43
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !44
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !45
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !46
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %8, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %9 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !51
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %9, align 8, !dbg !52
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !53, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %i, metadata !59, metadata !DIExpression()), !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !68
  %cmp = icmp ult i64 %11, 100, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %12 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !74
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !75
  store i32 0, i32* %intOne, align 8, !dbg !76
  %13 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !78
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !79
  store i32 0, i32* %intTwo, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %14, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !87, metadata !DIExpression()), !dbg !89
  store i64 0, i64* %i4, align 8, !dbg !90
  br label %for.cond5, !dbg !92

for.cond5:                                        ; preds = %for.inc10, %for.end
  %15 = load i64, i64* %i4, align 8, !dbg !93
  %cmp6 = icmp ult i64 %15, 100, !dbg !95
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !96

for.body7:                                        ; preds = %for.cond5
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !97
  %17 = load i64, i64* %i4, align 8, !dbg !99
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 %17, !dbg !97
  %18 = load i64, i64* %i4, align 8, !dbg !100
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %18, !dbg !101
  %19 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !101
  %20 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %19, i8* align 8 %20, i64 8, i1 false), !dbg !101
  br label %for.inc10, !dbg !102

for.inc10:                                        ; preds = %for.body7
  %21 = load i64, i64* %i4, align 8, !dbg !103
  %inc11 = add i64 %21, 1, !dbg !103
  store i64 %inc11, i64* %i4, align 8, !dbg !103
  br label %for.cond5, !dbg !104, !llvm.loop !105

for.end12:                                        ; preds = %for.cond5
  %22 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !107
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %22, i64 0, !dbg !107
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32_good() #0 !dbg !110 {
entry:
  call void @goodG2B(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call i64 @time(i64* null) #5, !dbg !123
  %conv = trunc i64 %call to i32, !dbg !124
  call void @srand(i32 %conv) #5, !dbg !125
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !126
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32_good(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32_bad(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !131
  ret i32 0, !dbg !132
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !133 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !136, metadata !DIExpression()), !dbg !137
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !138, metadata !DIExpression()), !dbg !139
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = alloca i8, i64 400, align 16, !dbg !142
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !143
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %2 = alloca i8, i64 800, align 16, !dbg !146
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !147
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !148, metadata !DIExpression()), !dbg !150
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !151
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !152
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !150
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !153
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !154
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !155
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !156
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %8, align 8, !dbg !157
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !158, metadata !DIExpression()), !dbg !160
  %9 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !161
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %9, align 8, !dbg !162
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data2, align 8, !dbg !160
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !163, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !172
  %cmp = icmp ult i64 %11, 100, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %12 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !178
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !179
  store i32 0, i32* %intOne, align 8, !dbg !180
  %13 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !182
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !183
  store i32 0, i32* %intTwo, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %14, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !190, metadata !DIExpression()), !dbg !192
  store i64 0, i64* %i4, align 8, !dbg !193
  br label %for.cond5, !dbg !195

for.cond5:                                        ; preds = %for.inc10, %for.end
  %15 = load i64, i64* %i4, align 8, !dbg !196
  %cmp6 = icmp ult i64 %15, 100, !dbg !198
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !199

for.body7:                                        ; preds = %for.cond5
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !200
  %17 = load i64, i64* %i4, align 8, !dbg !202
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 %17, !dbg !200
  %18 = load i64, i64* %i4, align 8, !dbg !203
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %18, !dbg !204
  %19 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !204
  %20 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !204
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %19, i8* align 8 %20, i64 8, i1 false), !dbg !204
  br label %for.inc10, !dbg !205

for.inc10:                                        ; preds = %for.body7
  %21 = load i64, i64* %i4, align 8, !dbg !206
  %inc11 = add i64 %21, 1, !dbg !206
  store i64 %inc11, i64* %i4, align 8, !dbg !206
  br label %for.cond5, !dbg !207, !llvm.loop !208

for.end12:                                        ; preds = %for.cond5
  %22 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !210
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %22, i64 0, !dbg !210
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !211
  ret void, !dbg !212
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataPtr1", scope: !19, file: !20, line: 24, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!27 = !DILocation(line: 24, column: 22, scope: !19)
!28 = !DILocalVariable(name: "dataPtr2", scope: !19, file: !20, line: 25, type: !26)
!29 = !DILocation(line: 25, column: 22, scope: !19)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 26, type: !4)
!31 = !DILocation(line: 26, column: 21, scope: !19)
!32 = !DILocation(line: 26, column: 54, scope: !19)
!33 = !DILocation(line: 26, column: 37, scope: !19)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 27, type: !4)
!35 = !DILocation(line: 27, column: 21, scope: !19)
!36 = !DILocation(line: 27, column: 55, scope: !19)
!37 = !DILocation(line: 27, column: 38, scope: !19)
!38 = !DILocalVariable(name: "data", scope: !39, file: !20, line: 29, type: !4)
!39 = distinct !DILexicalBlock(scope: !19, file: !20, line: 28, column: 5)
!40 = !DILocation(line: 29, column: 25, scope: !39)
!41 = !DILocation(line: 29, column: 33, scope: !39)
!42 = !DILocation(line: 29, column: 32, scope: !39)
!43 = !DILocation(line: 32, column: 16, scope: !39)
!44 = !DILocation(line: 32, column: 14, scope: !39)
!45 = !DILocation(line: 33, column: 21, scope: !39)
!46 = !DILocation(line: 33, column: 10, scope: !39)
!47 = !DILocation(line: 33, column: 19, scope: !39)
!48 = !DILocalVariable(name: "data", scope: !49, file: !20, line: 36, type: !4)
!49 = distinct !DILexicalBlock(scope: !19, file: !20, line: 35, column: 5)
!50 = !DILocation(line: 36, column: 25, scope: !49)
!51 = !DILocation(line: 36, column: 33, scope: !49)
!52 = !DILocation(line: 36, column: 32, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !20, line: 38, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !20, line: 37, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 38, column: 27, scope: !54)
!59 = !DILocalVariable(name: "i", scope: !60, file: !20, line: 40, type: !61)
!60 = distinct !DILexicalBlock(scope: !54, file: !20, line: 39, column: 13)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !62, line: 46, baseType: !63)
!62 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!63 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!64 = !DILocation(line: 40, column: 24, scope: !60)
!65 = !DILocation(line: 42, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !20, line: 42, column: 17)
!67 = !DILocation(line: 42, column: 22, scope: !66)
!68 = !DILocation(line: 42, column: 29, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !20, line: 42, column: 17)
!70 = !DILocation(line: 42, column: 31, scope: !69)
!71 = !DILocation(line: 42, column: 17, scope: !66)
!72 = !DILocation(line: 44, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !20, line: 43, column: 17)
!74 = !DILocation(line: 44, column: 21, scope: !73)
!75 = !DILocation(line: 44, column: 31, scope: !73)
!76 = !DILocation(line: 44, column: 38, scope: !73)
!77 = !DILocation(line: 45, column: 28, scope: !73)
!78 = !DILocation(line: 45, column: 21, scope: !73)
!79 = !DILocation(line: 45, column: 31, scope: !73)
!80 = !DILocation(line: 45, column: 38, scope: !73)
!81 = !DILocation(line: 46, column: 17, scope: !73)
!82 = !DILocation(line: 42, column: 39, scope: !69)
!83 = !DILocation(line: 42, column: 17, scope: !69)
!84 = distinct !{!84, !71, !85, !86}
!85 = !DILocation(line: 46, column: 17, scope: !66)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocalVariable(name: "i", scope: !88, file: !20, line: 49, type: !61)
!88 = distinct !DILexicalBlock(scope: !54, file: !20, line: 48, column: 13)
!89 = !DILocation(line: 49, column: 24, scope: !88)
!90 = !DILocation(line: 51, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !20, line: 51, column: 17)
!92 = !DILocation(line: 51, column: 22, scope: !91)
!93 = !DILocation(line: 51, column: 29, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !20, line: 51, column: 17)
!95 = !DILocation(line: 51, column: 31, scope: !94)
!96 = !DILocation(line: 51, column: 17, scope: !91)
!97 = !DILocation(line: 53, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !20, line: 52, column: 17)
!99 = !DILocation(line: 53, column: 26, scope: !98)
!100 = !DILocation(line: 53, column: 38, scope: !98)
!101 = !DILocation(line: 53, column: 31, scope: !98)
!102 = !DILocation(line: 54, column: 17, scope: !98)
!103 = !DILocation(line: 51, column: 39, scope: !94)
!104 = !DILocation(line: 51, column: 17, scope: !94)
!105 = distinct !{!105, !96, !106, !86}
!106 = !DILocation(line: 54, column: 17, scope: !91)
!107 = !DILocation(line: 55, column: 34, scope: !88)
!108 = !DILocation(line: 55, column: 17, scope: !88)
!109 = !DILocation(line: 59, column: 1, scope: !19)
!110 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_32_good", scope: !20, file: !20, line: 105, type: !21, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 107, column: 5, scope: !110)
!112 = !DILocation(line: 108, column: 1, scope: !110)
!113 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 119, type: !114, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!10, !10, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!119 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !20, line: 119, type: !10)
!120 = !DILocation(line: 119, column: 14, scope: !113)
!121 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !20, line: 119, type: !116)
!122 = !DILocation(line: 119, column: 27, scope: !113)
!123 = !DILocation(line: 122, column: 22, scope: !113)
!124 = !DILocation(line: 122, column: 12, scope: !113)
!125 = !DILocation(line: 122, column: 5, scope: !113)
!126 = !DILocation(line: 124, column: 5, scope: !113)
!127 = !DILocation(line: 125, column: 5, scope: !113)
!128 = !DILocation(line: 126, column: 5, scope: !113)
!129 = !DILocation(line: 129, column: 5, scope: !113)
!130 = !DILocation(line: 130, column: 5, scope: !113)
!131 = !DILocation(line: 131, column: 5, scope: !113)
!132 = !DILocation(line: 133, column: 5, scope: !113)
!133 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !20, line: 68, type: !4)
!135 = !DILocation(line: 68, column: 21, scope: !133)
!136 = !DILocalVariable(name: "dataPtr1", scope: !133, file: !20, line: 69, type: !26)
!137 = !DILocation(line: 69, column: 22, scope: !133)
!138 = !DILocalVariable(name: "dataPtr2", scope: !133, file: !20, line: 70, type: !26)
!139 = !DILocation(line: 70, column: 22, scope: !133)
!140 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !20, line: 71, type: !4)
!141 = !DILocation(line: 71, column: 21, scope: !133)
!142 = !DILocation(line: 71, column: 54, scope: !133)
!143 = !DILocation(line: 71, column: 37, scope: !133)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !20, line: 72, type: !4)
!145 = !DILocation(line: 72, column: 21, scope: !133)
!146 = !DILocation(line: 72, column: 55, scope: !133)
!147 = !DILocation(line: 72, column: 38, scope: !133)
!148 = !DILocalVariable(name: "data", scope: !149, file: !20, line: 74, type: !4)
!149 = distinct !DILexicalBlock(scope: !133, file: !20, line: 73, column: 5)
!150 = !DILocation(line: 74, column: 25, scope: !149)
!151 = !DILocation(line: 74, column: 33, scope: !149)
!152 = !DILocation(line: 74, column: 32, scope: !149)
!153 = !DILocation(line: 76, column: 16, scope: !149)
!154 = !DILocation(line: 76, column: 14, scope: !149)
!155 = !DILocation(line: 77, column: 21, scope: !149)
!156 = !DILocation(line: 77, column: 10, scope: !149)
!157 = !DILocation(line: 77, column: 19, scope: !149)
!158 = !DILocalVariable(name: "data", scope: !159, file: !20, line: 80, type: !4)
!159 = distinct !DILexicalBlock(scope: !133, file: !20, line: 79, column: 5)
!160 = !DILocation(line: 80, column: 25, scope: !159)
!161 = !DILocation(line: 80, column: 33, scope: !159)
!162 = !DILocation(line: 80, column: 32, scope: !159)
!163 = !DILocalVariable(name: "source", scope: !164, file: !20, line: 82, type: !55)
!164 = distinct !DILexicalBlock(scope: !159, file: !20, line: 81, column: 9)
!165 = !DILocation(line: 82, column: 27, scope: !164)
!166 = !DILocalVariable(name: "i", scope: !167, file: !20, line: 84, type: !61)
!167 = distinct !DILexicalBlock(scope: !164, file: !20, line: 83, column: 13)
!168 = !DILocation(line: 84, column: 24, scope: !167)
!169 = !DILocation(line: 86, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !20, line: 86, column: 17)
!171 = !DILocation(line: 86, column: 22, scope: !170)
!172 = !DILocation(line: 86, column: 29, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !20, line: 86, column: 17)
!174 = !DILocation(line: 86, column: 31, scope: !173)
!175 = !DILocation(line: 86, column: 17, scope: !170)
!176 = !DILocation(line: 88, column: 28, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !20, line: 87, column: 17)
!178 = !DILocation(line: 88, column: 21, scope: !177)
!179 = !DILocation(line: 88, column: 31, scope: !177)
!180 = !DILocation(line: 88, column: 38, scope: !177)
!181 = !DILocation(line: 89, column: 28, scope: !177)
!182 = !DILocation(line: 89, column: 21, scope: !177)
!183 = !DILocation(line: 89, column: 31, scope: !177)
!184 = !DILocation(line: 89, column: 38, scope: !177)
!185 = !DILocation(line: 90, column: 17, scope: !177)
!186 = !DILocation(line: 86, column: 39, scope: !173)
!187 = !DILocation(line: 86, column: 17, scope: !173)
!188 = distinct !{!188, !175, !189, !86}
!189 = !DILocation(line: 90, column: 17, scope: !170)
!190 = !DILocalVariable(name: "i", scope: !191, file: !20, line: 93, type: !61)
!191 = distinct !DILexicalBlock(scope: !164, file: !20, line: 92, column: 13)
!192 = !DILocation(line: 93, column: 24, scope: !191)
!193 = !DILocation(line: 95, column: 24, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !20, line: 95, column: 17)
!195 = !DILocation(line: 95, column: 22, scope: !194)
!196 = !DILocation(line: 95, column: 29, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !20, line: 95, column: 17)
!198 = !DILocation(line: 95, column: 31, scope: !197)
!199 = !DILocation(line: 95, column: 17, scope: !194)
!200 = !DILocation(line: 97, column: 21, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !20, line: 96, column: 17)
!202 = !DILocation(line: 97, column: 26, scope: !201)
!203 = !DILocation(line: 97, column: 38, scope: !201)
!204 = !DILocation(line: 97, column: 31, scope: !201)
!205 = !DILocation(line: 98, column: 17, scope: !201)
!206 = !DILocation(line: 95, column: 39, scope: !197)
!207 = !DILocation(line: 95, column: 17, scope: !197)
!208 = distinct !{!208, !199, !209, !86}
!209 = !DILocation(line: 98, column: 17, scope: !194)
!210 = !DILocation(line: 99, column: 34, scope: !191)
!211 = !DILocation(line: 99, column: 17, scope: !191)
!212 = !DILocation(line: 103, column: 1, scope: !133)
