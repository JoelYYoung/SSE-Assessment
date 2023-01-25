; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !43
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !44
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !42
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data1, align 8, !dbg !46
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !47
  %3 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !48
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %3, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !50, metadata !DIExpression()), !dbg !52
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !53
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !54
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i, metadata !58, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %6, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !73
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !74
  store i32 0, i32* %intOne, align 8, !dbg !75
  %8 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !77
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !78
  store i32 0, i32* %intTwo, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %9, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !86, metadata !DIExpression()), !dbg !88
  store i64 0, i64* %i4, align 8, !dbg !89
  br label %for.cond5, !dbg !91

for.cond5:                                        ; preds = %for.inc10, %for.end
  %10 = load i64, i64* %i4, align 8, !dbg !92
  %cmp6 = icmp ult i64 %10, 100, !dbg !94
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !95

for.body7:                                        ; preds = %for.cond5
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !96
  %12 = load i64, i64* %i4, align 8, !dbg !98
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !96
  %13 = load i64, i64* %i4, align 8, !dbg !99
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !100
  %14 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !100
  %15 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !100
  br label %for.inc10, !dbg !101

for.inc10:                                        ; preds = %for.body7
  %16 = load i64, i64* %i4, align 8, !dbg !102
  %inc11 = add i64 %16, 1, !dbg !102
  store i64 %inc11, i64* %i4, align 8, !dbg !102
  br label %for.cond5, !dbg !103, !llvm.loop !104

for.end12:                                        ; preds = %for.cond5
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !106
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !106
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_good() #0 !dbg !109 {
entry:
  call void @goodG2B(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %call = call i64 @time(i64* null) #5, !dbg !122
  %conv = trunc i64 %call to i32, !dbg !123
  call void @srand(i32 %conv) #5, !dbg !124
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_good(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !128
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_bad(), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !130
  ret i32 0, !dbg !131
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !132 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !135, metadata !DIExpression()), !dbg !136
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !137, metadata !DIExpression()), !dbg !138
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !143, metadata !DIExpression()), !dbg !145
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !146
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !147
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !145
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !148
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data1, align 8, !dbg !149
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !150
  %3 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !151
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %3, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !153, metadata !DIExpression()), !dbg !155
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !156
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !157
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !167
  %cmp = icmp ult i64 %6, 100, !dbg !169
  br i1 %cmp, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !173
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !174
  store i32 0, i32* %intOne, align 8, !dbg !175
  %8 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !177
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !178
  store i32 0, i32* %intTwo, align 4, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %9, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !185, metadata !DIExpression()), !dbg !187
  store i64 0, i64* %i4, align 8, !dbg !188
  br label %for.cond5, !dbg !190

for.cond5:                                        ; preds = %for.inc10, %for.end
  %10 = load i64, i64* %i4, align 8, !dbg !191
  %cmp6 = icmp ult i64 %10, 100, !dbg !193
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !194

for.body7:                                        ; preds = %for.cond5
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !195
  %12 = load i64, i64* %i4, align 8, !dbg !197
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !195
  %13 = load i64, i64* %i4, align 8, !dbg !198
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !199
  %14 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !199
  %15 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !199
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !199
  br label %for.inc10, !dbg !200

for.inc10:                                        ; preds = %for.body7
  %16 = load i64, i64* %i4, align 8, !dbg !201
  %inc11 = add i64 %16, 1, !dbg !201
  store i64 %inc11, i64* %i4, align 8, !dbg !201
  br label %for.cond5, !dbg !202, !llvm.loop !203

for.end12:                                        ; preds = %for.cond5
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !205
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !205
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !206
  ret void, !dbg !207
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 24, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!27 = !DILocation(line: 24, column: 22, scope: !11)
!28 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 25, type: !26)
!29 = !DILocation(line: 25, column: 22, scope: !11)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 26, column: 19, scope: !11)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 27, column: 19, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 29, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!42 = !DILocation(line: 29, column: 25, scope: !41)
!43 = !DILocation(line: 29, column: 33, scope: !41)
!44 = !DILocation(line: 29, column: 32, scope: !41)
!45 = !DILocation(line: 32, column: 16, scope: !41)
!46 = !DILocation(line: 32, column: 14, scope: !41)
!47 = !DILocation(line: 33, column: 21, scope: !41)
!48 = !DILocation(line: 33, column: 10, scope: !41)
!49 = !DILocation(line: 33, column: 19, scope: !41)
!50 = !DILocalVariable(name: "data", scope: !51, file: !12, line: 36, type: !16)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!52 = !DILocation(line: 36, column: 25, scope: !51)
!53 = !DILocation(line: 36, column: 33, scope: !51)
!54 = !DILocation(line: 36, column: 32, scope: !51)
!55 = !DILocalVariable(name: "source", scope: !56, file: !12, line: 38, type: !36)
!56 = distinct !DILexicalBlock(scope: !51, file: !12, line: 37, column: 9)
!57 = !DILocation(line: 38, column: 27, scope: !56)
!58 = !DILocalVariable(name: "i", scope: !59, file: !12, line: 40, type: !60)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 39, column: 13)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 46, baseType: !62)
!61 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!62 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 40, column: 24, scope: !59)
!64 = !DILocation(line: 42, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !12, line: 42, column: 17)
!66 = !DILocation(line: 42, column: 22, scope: !65)
!67 = !DILocation(line: 42, column: 29, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 42, column: 17)
!69 = !DILocation(line: 42, column: 31, scope: !68)
!70 = !DILocation(line: 42, column: 17, scope: !65)
!71 = !DILocation(line: 44, column: 28, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !12, line: 43, column: 17)
!73 = !DILocation(line: 44, column: 21, scope: !72)
!74 = !DILocation(line: 44, column: 31, scope: !72)
!75 = !DILocation(line: 44, column: 38, scope: !72)
!76 = !DILocation(line: 45, column: 28, scope: !72)
!77 = !DILocation(line: 45, column: 21, scope: !72)
!78 = !DILocation(line: 45, column: 31, scope: !72)
!79 = !DILocation(line: 45, column: 38, scope: !72)
!80 = !DILocation(line: 46, column: 17, scope: !72)
!81 = !DILocation(line: 42, column: 39, scope: !68)
!82 = !DILocation(line: 42, column: 17, scope: !68)
!83 = distinct !{!83, !70, !84, !85}
!84 = !DILocation(line: 46, column: 17, scope: !65)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocalVariable(name: "i", scope: !87, file: !12, line: 49, type: !60)
!87 = distinct !DILexicalBlock(scope: !56, file: !12, line: 48, column: 13)
!88 = !DILocation(line: 49, column: 24, scope: !87)
!89 = !DILocation(line: 51, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 51, column: 17)
!91 = !DILocation(line: 51, column: 22, scope: !90)
!92 = !DILocation(line: 51, column: 29, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 51, column: 17)
!94 = !DILocation(line: 51, column: 31, scope: !93)
!95 = !DILocation(line: 51, column: 17, scope: !90)
!96 = !DILocation(line: 53, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 52, column: 17)
!98 = !DILocation(line: 53, column: 26, scope: !97)
!99 = !DILocation(line: 53, column: 38, scope: !97)
!100 = !DILocation(line: 53, column: 31, scope: !97)
!101 = !DILocation(line: 54, column: 17, scope: !97)
!102 = !DILocation(line: 51, column: 39, scope: !93)
!103 = !DILocation(line: 51, column: 17, scope: !93)
!104 = distinct !{!104, !95, !105, !85}
!105 = !DILocation(line: 54, column: 17, scope: !90)
!106 = !DILocation(line: 55, column: 34, scope: !87)
!107 = !DILocation(line: 55, column: 17, scope: !87)
!108 = !DILocation(line: 59, column: 1, scope: !11)
!109 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 107, column: 5, scope: !109)
!111 = !DILocation(line: 108, column: 1, scope: !109)
!112 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !113, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!22, !22, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!118 = !DILocalVariable(name: "argc", arg: 1, scope: !112, file: !12, line: 119, type: !22)
!119 = !DILocation(line: 119, column: 14, scope: !112)
!120 = !DILocalVariable(name: "argv", arg: 2, scope: !112, file: !12, line: 119, type: !115)
!121 = !DILocation(line: 119, column: 27, scope: !112)
!122 = !DILocation(line: 122, column: 22, scope: !112)
!123 = !DILocation(line: 122, column: 12, scope: !112)
!124 = !DILocation(line: 122, column: 5, scope: !112)
!125 = !DILocation(line: 124, column: 5, scope: !112)
!126 = !DILocation(line: 125, column: 5, scope: !112)
!127 = !DILocation(line: 126, column: 5, scope: !112)
!128 = !DILocation(line: 129, column: 5, scope: !112)
!129 = !DILocation(line: 130, column: 5, scope: !112)
!130 = !DILocation(line: 131, column: 5, scope: !112)
!131 = !DILocation(line: 133, column: 5, scope: !112)
!132 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !12, line: 68, type: !16)
!134 = !DILocation(line: 68, column: 21, scope: !132)
!135 = !DILocalVariable(name: "dataPtr1", scope: !132, file: !12, line: 69, type: !26)
!136 = !DILocation(line: 69, column: 22, scope: !132)
!137 = !DILocalVariable(name: "dataPtr2", scope: !132, file: !12, line: 70, type: !26)
!138 = !DILocation(line: 70, column: 22, scope: !132)
!139 = !DILocalVariable(name: "dataBadBuffer", scope: !132, file: !12, line: 71, type: !31)
!140 = !DILocation(line: 71, column: 19, scope: !132)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !132, file: !12, line: 72, type: !36)
!142 = !DILocation(line: 72, column: 19, scope: !132)
!143 = !DILocalVariable(name: "data", scope: !144, file: !12, line: 74, type: !16)
!144 = distinct !DILexicalBlock(scope: !132, file: !12, line: 73, column: 5)
!145 = !DILocation(line: 74, column: 25, scope: !144)
!146 = !DILocation(line: 74, column: 33, scope: !144)
!147 = !DILocation(line: 74, column: 32, scope: !144)
!148 = !DILocation(line: 76, column: 16, scope: !144)
!149 = !DILocation(line: 76, column: 14, scope: !144)
!150 = !DILocation(line: 77, column: 21, scope: !144)
!151 = !DILocation(line: 77, column: 10, scope: !144)
!152 = !DILocation(line: 77, column: 19, scope: !144)
!153 = !DILocalVariable(name: "data", scope: !154, file: !12, line: 80, type: !16)
!154 = distinct !DILexicalBlock(scope: !132, file: !12, line: 79, column: 5)
!155 = !DILocation(line: 80, column: 25, scope: !154)
!156 = !DILocation(line: 80, column: 33, scope: !154)
!157 = !DILocation(line: 80, column: 32, scope: !154)
!158 = !DILocalVariable(name: "source", scope: !159, file: !12, line: 82, type: !36)
!159 = distinct !DILexicalBlock(scope: !154, file: !12, line: 81, column: 9)
!160 = !DILocation(line: 82, column: 27, scope: !159)
!161 = !DILocalVariable(name: "i", scope: !162, file: !12, line: 84, type: !60)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 83, column: 13)
!163 = !DILocation(line: 84, column: 24, scope: !162)
!164 = !DILocation(line: 86, column: 24, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 86, column: 17)
!166 = !DILocation(line: 86, column: 22, scope: !165)
!167 = !DILocation(line: 86, column: 29, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 86, column: 17)
!169 = !DILocation(line: 86, column: 31, scope: !168)
!170 = !DILocation(line: 86, column: 17, scope: !165)
!171 = !DILocation(line: 88, column: 28, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !12, line: 87, column: 17)
!173 = !DILocation(line: 88, column: 21, scope: !172)
!174 = !DILocation(line: 88, column: 31, scope: !172)
!175 = !DILocation(line: 88, column: 38, scope: !172)
!176 = !DILocation(line: 89, column: 28, scope: !172)
!177 = !DILocation(line: 89, column: 21, scope: !172)
!178 = !DILocation(line: 89, column: 31, scope: !172)
!179 = !DILocation(line: 89, column: 38, scope: !172)
!180 = !DILocation(line: 90, column: 17, scope: !172)
!181 = !DILocation(line: 86, column: 39, scope: !168)
!182 = !DILocation(line: 86, column: 17, scope: !168)
!183 = distinct !{!183, !170, !184, !85}
!184 = !DILocation(line: 90, column: 17, scope: !165)
!185 = !DILocalVariable(name: "i", scope: !186, file: !12, line: 93, type: !60)
!186 = distinct !DILexicalBlock(scope: !159, file: !12, line: 92, column: 13)
!187 = !DILocation(line: 93, column: 24, scope: !186)
!188 = !DILocation(line: 95, column: 24, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !12, line: 95, column: 17)
!190 = !DILocation(line: 95, column: 22, scope: !189)
!191 = !DILocation(line: 95, column: 29, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !12, line: 95, column: 17)
!193 = !DILocation(line: 95, column: 31, scope: !192)
!194 = !DILocation(line: 95, column: 17, scope: !189)
!195 = !DILocation(line: 97, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !12, line: 96, column: 17)
!197 = !DILocation(line: 97, column: 26, scope: !196)
!198 = !DILocation(line: 97, column: 38, scope: !196)
!199 = !DILocation(line: 97, column: 31, scope: !196)
!200 = !DILocation(line: 98, column: 17, scope: !196)
!201 = !DILocation(line: 95, column: 39, scope: !192)
!202 = !DILocation(line: 95, column: 17, scope: !192)
!203 = distinct !{!203, !194, !204, !85}
!204 = !DILocation(line: 98, column: 17, scope: !189)
!205 = !DILocation(line: 99, column: 34, scope: !186)
!206 = !DILocation(line: 99, column: 17, scope: !186)
!207 = !DILocation(line: 103, column: 1, scope: !132)
