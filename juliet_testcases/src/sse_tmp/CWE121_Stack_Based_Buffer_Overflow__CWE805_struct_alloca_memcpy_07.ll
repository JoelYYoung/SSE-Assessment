; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07_bad() #0 !dbg !23 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32, i32* @staticFive, align 4, !dbg !36
  %cmp = icmp eq i32 %4, 5, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !40
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !59
  %cmp1 = icmp ult i64 %6, 100, !dbg !61
  br i1 %cmp1, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !65
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !66
  store i32 0, i32* %intOne, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !69
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !70
  store i32 0, i32* %intTwo, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %9, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !79
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !79
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !79
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !80
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #5, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #5, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 400, align 16, !dbg !112
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !113
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = alloca i8, i64 800, align 16, !dbg !116
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !117
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !115
  %4 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp = icmp ne i32 %4, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !125
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !137
  %cmp1 = icmp ult i64 %6, 100, !dbg !139
  br i1 %cmp1, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !143
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !144
  store i32 0, i32* %intOne, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !147
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !148
  store i32 0, i32* %intTwo, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %9, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !156
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !156
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !156
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !156
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !157
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !157
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !160 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = alloca i8, i64 400, align 16, !dbg !165
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !166
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !164
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !167, metadata !DIExpression()), !dbg !168
  %2 = alloca i8, i64 800, align 16, !dbg !169
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !170
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !168
  %4 = load i32, i32* @staticFive, align 4, !dbg !171
  %cmp = icmp eq i32 %4, 5, !dbg !173
  br i1 %cmp, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !175
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !177
  br label %if.end, !dbg !178

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %i, metadata !182, metadata !DIExpression()), !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !188
  %cmp1 = icmp ult i64 %6, 100, !dbg !190
  br i1 %cmp1, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !194
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !195
  store i32 0, i32* %intOne, align 8, !dbg !196
  %8 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !198
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !199
  store i32 0, i32* %intTwo, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %9, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !206
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !207
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !207
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !207
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !207
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !208
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !208
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !16, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = !{!0}
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07_bad", scope: !16, file: !16, line: 27, type: !24, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !16, line: 29, type: !6)
!27 = !DILocation(line: 29, column: 21, scope: !23)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !16, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 21, scope: !23)
!30 = !DILocation(line: 30, column: 54, scope: !23)
!31 = !DILocation(line: 30, column: 37, scope: !23)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !16, line: 31, type: !6)
!33 = !DILocation(line: 31, column: 21, scope: !23)
!34 = !DILocation(line: 31, column: 55, scope: !23)
!35 = !DILocation(line: 31, column: 38, scope: !23)
!36 = !DILocation(line: 32, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !16, line: 32, column: 8)
!38 = !DILocation(line: 32, column: 18, scope: !37)
!39 = !DILocation(line: 32, column: 8, scope: !23)
!40 = !DILocation(line: 36, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !16, line: 33, column: 5)
!42 = !DILocation(line: 36, column: 14, scope: !41)
!43 = !DILocation(line: 37, column: 5, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 39, type: !46)
!45 = distinct !DILexicalBlock(scope: !23, file: !16, line: 38, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 39, column: 23, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !51, file: !16, line: 41, type: !52)
!51 = distinct !DILexicalBlock(scope: !45, file: !16, line: 40, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 41, column: 20, scope: !51)
!56 = !DILocation(line: 43, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !16, line: 43, column: 13)
!58 = !DILocation(line: 43, column: 18, scope: !57)
!59 = !DILocation(line: 43, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !16, line: 43, column: 13)
!61 = !DILocation(line: 43, column: 27, scope: !60)
!62 = !DILocation(line: 43, column: 13, scope: !57)
!63 = !DILocation(line: 45, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !16, line: 44, column: 13)
!65 = !DILocation(line: 45, column: 17, scope: !64)
!66 = !DILocation(line: 45, column: 27, scope: !64)
!67 = !DILocation(line: 45, column: 34, scope: !64)
!68 = !DILocation(line: 46, column: 24, scope: !64)
!69 = !DILocation(line: 46, column: 17, scope: !64)
!70 = !DILocation(line: 46, column: 27, scope: !64)
!71 = !DILocation(line: 46, column: 34, scope: !64)
!72 = !DILocation(line: 47, column: 13, scope: !64)
!73 = !DILocation(line: 43, column: 35, scope: !60)
!74 = !DILocation(line: 43, column: 13, scope: !60)
!75 = distinct !{!75, !62, !76, !77}
!76 = !DILocation(line: 47, column: 13, scope: !57)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 50, column: 16, scope: !45)
!79 = !DILocation(line: 50, column: 9, scope: !45)
!80 = !DILocation(line: 51, column: 26, scope: !45)
!81 = !DILocation(line: 51, column: 9, scope: !45)
!82 = !DILocation(line: 53, column: 1, scope: !23)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_07_good", scope: !16, file: !16, line: 120, type: !24, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocation(line: 122, column: 5, scope: !83)
!85 = !DILocation(line: 123, column: 5, scope: !83)
!86 = !DILocation(line: 124, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 136, type: !88, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DISubroutineType(types: !89)
!89 = !{!12, !12, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !16, line: 136, type: !12)
!94 = !DILocation(line: 136, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !16, line: 136, type: !90)
!96 = !DILocation(line: 136, column: 27, scope: !87)
!97 = !DILocation(line: 139, column: 22, scope: !87)
!98 = !DILocation(line: 139, column: 12, scope: !87)
!99 = !DILocation(line: 139, column: 5, scope: !87)
!100 = !DILocation(line: 141, column: 5, scope: !87)
!101 = !DILocation(line: 142, column: 5, scope: !87)
!102 = !DILocation(line: 143, column: 5, scope: !87)
!103 = !DILocation(line: 146, column: 5, scope: !87)
!104 = !DILocation(line: 147, column: 5, scope: !87)
!105 = !DILocation(line: 148, column: 5, scope: !87)
!106 = !DILocation(line: 150, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 62, type: !6)
!109 = !DILocation(line: 62, column: 21, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !16, line: 63, type: !6)
!111 = !DILocation(line: 63, column: 21, scope: !107)
!112 = !DILocation(line: 63, column: 54, scope: !107)
!113 = !DILocation(line: 63, column: 37, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !16, line: 64, type: !6)
!115 = !DILocation(line: 64, column: 21, scope: !107)
!116 = !DILocation(line: 64, column: 55, scope: !107)
!117 = !DILocation(line: 64, column: 38, scope: !107)
!118 = !DILocation(line: 65, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !16, line: 65, column: 8)
!120 = !DILocation(line: 65, column: 18, scope: !119)
!121 = !DILocation(line: 65, column: 8, scope: !107)
!122 = !DILocation(line: 68, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !16, line: 66, column: 5)
!124 = !DILocation(line: 69, column: 5, scope: !123)
!125 = !DILocation(line: 73, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !16, line: 71, column: 5)
!127 = !DILocation(line: 73, column: 14, scope: !126)
!128 = !DILocalVariable(name: "source", scope: !129, file: !16, line: 76, type: !46)
!129 = distinct !DILexicalBlock(scope: !107, file: !16, line: 75, column: 5)
!130 = !DILocation(line: 76, column: 23, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !16, line: 78, type: !52)
!132 = distinct !DILexicalBlock(scope: !129, file: !16, line: 77, column: 9)
!133 = !DILocation(line: 78, column: 20, scope: !132)
!134 = !DILocation(line: 80, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !16, line: 80, column: 13)
!136 = !DILocation(line: 80, column: 18, scope: !135)
!137 = !DILocation(line: 80, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !16, line: 80, column: 13)
!139 = !DILocation(line: 80, column: 27, scope: !138)
!140 = !DILocation(line: 80, column: 13, scope: !135)
!141 = !DILocation(line: 82, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !16, line: 81, column: 13)
!143 = !DILocation(line: 82, column: 17, scope: !142)
!144 = !DILocation(line: 82, column: 27, scope: !142)
!145 = !DILocation(line: 82, column: 34, scope: !142)
!146 = !DILocation(line: 83, column: 24, scope: !142)
!147 = !DILocation(line: 83, column: 17, scope: !142)
!148 = !DILocation(line: 83, column: 27, scope: !142)
!149 = !DILocation(line: 83, column: 34, scope: !142)
!150 = !DILocation(line: 84, column: 13, scope: !142)
!151 = !DILocation(line: 80, column: 35, scope: !138)
!152 = !DILocation(line: 80, column: 13, scope: !138)
!153 = distinct !{!153, !140, !154, !77}
!154 = !DILocation(line: 84, column: 13, scope: !135)
!155 = !DILocation(line: 87, column: 16, scope: !129)
!156 = !DILocation(line: 87, column: 9, scope: !129)
!157 = !DILocation(line: 88, column: 26, scope: !129)
!158 = !DILocation(line: 88, column: 9, scope: !129)
!159 = !DILocation(line: 90, column: 1, scope: !107)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 93, type: !24, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!161 = !DILocalVariable(name: "data", scope: !160, file: !16, line: 95, type: !6)
!162 = !DILocation(line: 95, column: 21, scope: !160)
!163 = !DILocalVariable(name: "dataBadBuffer", scope: !160, file: !16, line: 96, type: !6)
!164 = !DILocation(line: 96, column: 21, scope: !160)
!165 = !DILocation(line: 96, column: 54, scope: !160)
!166 = !DILocation(line: 96, column: 37, scope: !160)
!167 = !DILocalVariable(name: "dataGoodBuffer", scope: !160, file: !16, line: 97, type: !6)
!168 = !DILocation(line: 97, column: 21, scope: !160)
!169 = !DILocation(line: 97, column: 55, scope: !160)
!170 = !DILocation(line: 97, column: 38, scope: !160)
!171 = !DILocation(line: 98, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !160, file: !16, line: 98, column: 8)
!173 = !DILocation(line: 98, column: 18, scope: !172)
!174 = !DILocation(line: 98, column: 8, scope: !160)
!175 = !DILocation(line: 101, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !16, line: 99, column: 5)
!177 = !DILocation(line: 101, column: 14, scope: !176)
!178 = !DILocation(line: 102, column: 5, scope: !176)
!179 = !DILocalVariable(name: "source", scope: !180, file: !16, line: 104, type: !46)
!180 = distinct !DILexicalBlock(scope: !160, file: !16, line: 103, column: 5)
!181 = !DILocation(line: 104, column: 23, scope: !180)
!182 = !DILocalVariable(name: "i", scope: !183, file: !16, line: 106, type: !52)
!183 = distinct !DILexicalBlock(scope: !180, file: !16, line: 105, column: 9)
!184 = !DILocation(line: 106, column: 20, scope: !183)
!185 = !DILocation(line: 108, column: 20, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !16, line: 108, column: 13)
!187 = !DILocation(line: 108, column: 18, scope: !186)
!188 = !DILocation(line: 108, column: 25, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !16, line: 108, column: 13)
!190 = !DILocation(line: 108, column: 27, scope: !189)
!191 = !DILocation(line: 108, column: 13, scope: !186)
!192 = !DILocation(line: 110, column: 24, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !16, line: 109, column: 13)
!194 = !DILocation(line: 110, column: 17, scope: !193)
!195 = !DILocation(line: 110, column: 27, scope: !193)
!196 = !DILocation(line: 110, column: 34, scope: !193)
!197 = !DILocation(line: 111, column: 24, scope: !193)
!198 = !DILocation(line: 111, column: 17, scope: !193)
!199 = !DILocation(line: 111, column: 27, scope: !193)
!200 = !DILocation(line: 111, column: 34, scope: !193)
!201 = !DILocation(line: 112, column: 13, scope: !193)
!202 = !DILocation(line: 108, column: 35, scope: !189)
!203 = !DILocation(line: 108, column: 13, scope: !189)
!204 = distinct !{!204, !191, !205, !77}
!205 = !DILocation(line: 112, column: 13, scope: !186)
!206 = !DILocation(line: 115, column: 16, scope: !180)
!207 = !DILocation(line: 115, column: 9, scope: !180)
!208 = !DILocation(line: 116, column: 26, scope: !180)
!209 = !DILocation(line: 116, column: 9, scope: !180)
!210 = !DILocation(line: 118, column: 1, scope: !160)
