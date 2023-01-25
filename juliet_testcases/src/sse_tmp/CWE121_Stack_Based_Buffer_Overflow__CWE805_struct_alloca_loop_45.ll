; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !38
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_badData, align 8, !dbg !70
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !71, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %1, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !92
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !93
  store i32 0, i32* %intOne, align 8, !dbg !94
  %3 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !96
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !97
  store i32 0, i32* %intTwo, align 4, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %4, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !105, metadata !DIExpression()), !dbg !107
  store i64 0, i64* %i2, align 8, !dbg !108
  br label %for.cond3, !dbg !110

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !111
  %cmp4 = icmp ult i64 %5, 100, !dbg !113
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !114

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !115
  %7 = load i64, i64* %i2, align 8, !dbg !117
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !115
  %8 = load i64, i64* %i2, align 8, !dbg !118
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !119
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !119
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !119
  br label %for.inc8, !dbg !120

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !121
  %inc9 = add i64 %11, 1, !dbg !121
  store i64 %inc9, i64* %i2, align 8, !dbg !121
  br label %for.cond3, !dbg !122, !llvm.loop !123

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !125
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !128 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = alloca i8, i64 400, align 16, !dbg !133
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !134
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = alloca i8, i64 800, align 16, !dbg !137
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !138
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !136
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !139
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !141
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_goodG2BData, align 8, !dbg !142
  call void @goodG2BSink(), !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !145 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !146, metadata !DIExpression()), !dbg !147
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_goodG2BData, align 8, !dbg !148
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !158
  %cmp = icmp ult i64 %1, 100, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !164
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !165
  store i32 0, i32* %intOne, align 8, !dbg !166
  %3 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !168
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !169
  store i32 0, i32* %intTwo, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %4, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !176, metadata !DIExpression()), !dbg !178
  store i64 0, i64* %i2, align 8, !dbg !179
  br label %for.cond3, !dbg !181

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !182
  %cmp4 = icmp ult i64 %5, 100, !dbg !184
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !185

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !186
  %7 = load i64, i64* %i2, align 8, !dbg !188
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !186
  %8 = load i64, i64* %i2, align 8, !dbg !189
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !190
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !190
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !190
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !190
  br label %for.inc8, !dbg !191

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !192
  %inc9 = add i64 %11, 1, !dbg !192
  store i64 %inc9, i64* %i2, align 8, !dbg !192
  br label %for.cond3, !dbg !193, !llvm.loop !194

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !196
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !197
  ret void, !dbg !198
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_badData", scope: !2, file: !18, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0, !16}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_goodG2BData", scope: !2, file: !18, line: 20, type: !6, isLocal: true, isDefinition: true)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_bad", scope: !18, file: !18, line: 50, type: !26, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !18, line: 52, type: !6)
!29 = !DILocation(line: 52, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !18, line: 53, type: !6)
!31 = !DILocation(line: 53, column: 21, scope: !25)
!32 = !DILocation(line: 53, column: 54, scope: !25)
!33 = !DILocation(line: 53, column: 37, scope: !25)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !18, line: 54, type: !6)
!35 = !DILocation(line: 54, column: 21, scope: !25)
!36 = !DILocation(line: 54, column: 55, scope: !25)
!37 = !DILocation(line: 54, column: 38, scope: !25)
!38 = !DILocation(line: 57, column: 12, scope: !25)
!39 = !DILocation(line: 57, column: 10, scope: !25)
!40 = !DILocation(line: 58, column: 80, scope: !25)
!41 = !DILocation(line: 58, column: 78, scope: !25)
!42 = !DILocation(line: 59, column: 5, scope: !25)
!43 = !DILocation(line: 60, column: 1, scope: !25)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_45_good", scope: !18, file: !18, line: 104, type: !26, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 106, column: 5, scope: !44)
!46 = !DILocation(line: 107, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 118, type: !48, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!12, !12, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !18, line: 118, type: !12)
!54 = !DILocation(line: 118, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !18, line: 118, type: !50)
!56 = !DILocation(line: 118, column: 27, scope: !47)
!57 = !DILocation(line: 121, column: 22, scope: !47)
!58 = !DILocation(line: 121, column: 12, scope: !47)
!59 = !DILocation(line: 121, column: 5, scope: !47)
!60 = !DILocation(line: 123, column: 5, scope: !47)
!61 = !DILocation(line: 124, column: 5, scope: !47)
!62 = !DILocation(line: 125, column: 5, scope: !47)
!63 = !DILocation(line: 128, column: 5, scope: !47)
!64 = !DILocation(line: 129, column: 5, scope: !47)
!65 = !DILocation(line: 130, column: 5, scope: !47)
!66 = !DILocation(line: 132, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !18, file: !18, line: 24, type: !26, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !18, line: 26, type: !6)
!69 = !DILocation(line: 26, column: 21, scope: !67)
!70 = !DILocation(line: 26, column: 28, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !18, line: 28, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !18, line: 27, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 100)
!76 = !DILocation(line: 28, column: 23, scope: !72)
!77 = !DILocalVariable(name: "i", scope: !78, file: !18, line: 30, type: !79)
!78 = distinct !DILexicalBlock(scope: !72, file: !18, line: 29, column: 9)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !80, line: 46, baseType: !81)
!80 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!81 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!82 = !DILocation(line: 30, column: 20, scope: !78)
!83 = !DILocation(line: 32, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !18, line: 32, column: 13)
!85 = !DILocation(line: 32, column: 18, scope: !84)
!86 = !DILocation(line: 32, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !18, line: 32, column: 13)
!88 = !DILocation(line: 32, column: 27, scope: !87)
!89 = !DILocation(line: 32, column: 13, scope: !84)
!90 = !DILocation(line: 34, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !18, line: 33, column: 13)
!92 = !DILocation(line: 34, column: 17, scope: !91)
!93 = !DILocation(line: 34, column: 27, scope: !91)
!94 = !DILocation(line: 34, column: 34, scope: !91)
!95 = !DILocation(line: 35, column: 24, scope: !91)
!96 = !DILocation(line: 35, column: 17, scope: !91)
!97 = !DILocation(line: 35, column: 27, scope: !91)
!98 = !DILocation(line: 35, column: 34, scope: !91)
!99 = !DILocation(line: 36, column: 13, scope: !91)
!100 = !DILocation(line: 32, column: 35, scope: !87)
!101 = !DILocation(line: 32, column: 13, scope: !87)
!102 = distinct !{!102, !89, !103, !104}
!103 = !DILocation(line: 36, column: 13, scope: !84)
!104 = !{!"llvm.loop.mustprogress"}
!105 = !DILocalVariable(name: "i", scope: !106, file: !18, line: 39, type: !79)
!106 = distinct !DILexicalBlock(scope: !72, file: !18, line: 38, column: 9)
!107 = !DILocation(line: 39, column: 20, scope: !106)
!108 = !DILocation(line: 41, column: 20, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !18, line: 41, column: 13)
!110 = !DILocation(line: 41, column: 18, scope: !109)
!111 = !DILocation(line: 41, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !18, line: 41, column: 13)
!113 = !DILocation(line: 41, column: 27, scope: !112)
!114 = !DILocation(line: 41, column: 13, scope: !109)
!115 = !DILocation(line: 43, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !18, line: 42, column: 13)
!117 = !DILocation(line: 43, column: 22, scope: !116)
!118 = !DILocation(line: 43, column: 34, scope: !116)
!119 = !DILocation(line: 43, column: 27, scope: !116)
!120 = !DILocation(line: 44, column: 13, scope: !116)
!121 = !DILocation(line: 41, column: 35, scope: !112)
!122 = !DILocation(line: 41, column: 13, scope: !112)
!123 = distinct !{!123, !114, !124, !104}
!124 = !DILocation(line: 44, column: 13, scope: !109)
!125 = !DILocation(line: 45, column: 30, scope: !106)
!126 = !DILocation(line: 45, column: 13, scope: !106)
!127 = !DILocation(line: 48, column: 1, scope: !67)
!128 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 93, type: !26, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !18, line: 95, type: !6)
!130 = !DILocation(line: 95, column: 21, scope: !128)
!131 = !DILocalVariable(name: "dataBadBuffer", scope: !128, file: !18, line: 96, type: !6)
!132 = !DILocation(line: 96, column: 21, scope: !128)
!133 = !DILocation(line: 96, column: 54, scope: !128)
!134 = !DILocation(line: 96, column: 37, scope: !128)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !128, file: !18, line: 97, type: !6)
!136 = !DILocation(line: 97, column: 21, scope: !128)
!137 = !DILocation(line: 97, column: 55, scope: !128)
!138 = !DILocation(line: 97, column: 38, scope: !128)
!139 = !DILocation(line: 99, column: 12, scope: !128)
!140 = !DILocation(line: 99, column: 10, scope: !128)
!141 = !DILocation(line: 100, column: 84, scope: !128)
!142 = !DILocation(line: 100, column: 82, scope: !128)
!143 = !DILocation(line: 101, column: 5, scope: !128)
!144 = !DILocation(line: 102, column: 1, scope: !128)
!145 = distinct !DISubprogram(name: "goodG2BSink", scope: !18, file: !18, line: 67, type: !26, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!146 = !DILocalVariable(name: "data", scope: !145, file: !18, line: 69, type: !6)
!147 = !DILocation(line: 69, column: 21, scope: !145)
!148 = !DILocation(line: 69, column: 28, scope: !145)
!149 = !DILocalVariable(name: "source", scope: !150, file: !18, line: 71, type: !73)
!150 = distinct !DILexicalBlock(scope: !145, file: !18, line: 70, column: 5)
!151 = !DILocation(line: 71, column: 23, scope: !150)
!152 = !DILocalVariable(name: "i", scope: !153, file: !18, line: 73, type: !79)
!153 = distinct !DILexicalBlock(scope: !150, file: !18, line: 72, column: 9)
!154 = !DILocation(line: 73, column: 20, scope: !153)
!155 = !DILocation(line: 75, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !18, line: 75, column: 13)
!157 = !DILocation(line: 75, column: 18, scope: !156)
!158 = !DILocation(line: 75, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !18, line: 75, column: 13)
!160 = !DILocation(line: 75, column: 27, scope: !159)
!161 = !DILocation(line: 75, column: 13, scope: !156)
!162 = !DILocation(line: 77, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !18, line: 76, column: 13)
!164 = !DILocation(line: 77, column: 17, scope: !163)
!165 = !DILocation(line: 77, column: 27, scope: !163)
!166 = !DILocation(line: 77, column: 34, scope: !163)
!167 = !DILocation(line: 78, column: 24, scope: !163)
!168 = !DILocation(line: 78, column: 17, scope: !163)
!169 = !DILocation(line: 78, column: 27, scope: !163)
!170 = !DILocation(line: 78, column: 34, scope: !163)
!171 = !DILocation(line: 79, column: 13, scope: !163)
!172 = !DILocation(line: 75, column: 35, scope: !159)
!173 = !DILocation(line: 75, column: 13, scope: !159)
!174 = distinct !{!174, !161, !175, !104}
!175 = !DILocation(line: 79, column: 13, scope: !156)
!176 = !DILocalVariable(name: "i", scope: !177, file: !18, line: 82, type: !79)
!177 = distinct !DILexicalBlock(scope: !150, file: !18, line: 81, column: 9)
!178 = !DILocation(line: 82, column: 20, scope: !177)
!179 = !DILocation(line: 84, column: 20, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !18, line: 84, column: 13)
!181 = !DILocation(line: 84, column: 18, scope: !180)
!182 = !DILocation(line: 84, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !18, line: 84, column: 13)
!184 = !DILocation(line: 84, column: 27, scope: !183)
!185 = !DILocation(line: 84, column: 13, scope: !180)
!186 = !DILocation(line: 86, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !18, line: 85, column: 13)
!188 = !DILocation(line: 86, column: 22, scope: !187)
!189 = !DILocation(line: 86, column: 34, scope: !187)
!190 = !DILocation(line: 86, column: 27, scope: !187)
!191 = !DILocation(line: 87, column: 13, scope: !187)
!192 = !DILocation(line: 84, column: 35, scope: !183)
!193 = !DILocation(line: 84, column: 13, scope: !183)
!194 = distinct !{!194, !185, !195, !104}
!195 = !DILocation(line: 87, column: 13, scope: !180)
!196 = !DILocation(line: 88, column: 30, scope: !177)
!197 = !DILocation(line: 88, column: 13, scope: !177)
!198 = !DILocation(line: 91, column: 1, scope: !145)
