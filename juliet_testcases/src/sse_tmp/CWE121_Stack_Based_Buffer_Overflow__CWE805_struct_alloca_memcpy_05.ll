; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !16
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  %4 = load i32, i32* @staticTrue, align 4, !dbg !38
  %tobool = icmp ne i32 %4, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !41
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %6, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !66
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !67
  store i32 0, i32* %intOne, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !70
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !71
  store i32 0, i32* %intTwo, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %9, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !80
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !80
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !80
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !80
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !81
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 400, align 16, !dbg !113
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !114
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 800, align 16, !dbg !117
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !118
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !116
  %4 = load i32, i32* @staticFalse, align 4, !dbg !119
  %tobool = icmp ne i32 %4, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

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
  %cmp = icmp ult i64 %6, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !143
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !144
  store i32 0, i32* %intOne, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !147
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !148
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
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !157
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !158
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
  %4 = load i32, i32* @staticTrue, align 4, !dbg !171
  %tobool = icmp ne i32 %4, 0, !dbg !171
  br i1 %tobool, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !174
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !176
  br label %if.end, !dbg !177

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %i, metadata !181, metadata !DIExpression()), !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !187
  %cmp = icmp ult i64 %6, 100, !dbg !189
  br i1 %cmp, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !193
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !194
  store i32 0, i32* %intOne, align 8, !dbg !195
  %8 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !197
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !198
  store i32 0, i32* %intTwo, align 4, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !201
  %inc = add i64 %9, 1, !dbg !201
  store i64 %inc, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !205
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !206
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !206
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !206
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !206
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !207
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !207
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !208
  ret void, !dbg !209
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !18, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0, !16}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !18, line: 24, type: !12, isLocal: true, isDefinition: true)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05.c", directory: "/root/SSE-Assessment")
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05_bad", scope: !18, file: !18, line: 28, type: !26, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !18, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !18, line: 31, type: !6)
!31 = !DILocation(line: 31, column: 21, scope: !25)
!32 = !DILocation(line: 31, column: 54, scope: !25)
!33 = !DILocation(line: 31, column: 37, scope: !25)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !18, line: 32, type: !6)
!35 = !DILocation(line: 32, column: 21, scope: !25)
!36 = !DILocation(line: 32, column: 55, scope: !25)
!37 = !DILocation(line: 32, column: 38, scope: !25)
!38 = !DILocation(line: 33, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !25, file: !18, line: 33, column: 8)
!40 = !DILocation(line: 33, column: 8, scope: !25)
!41 = !DILocation(line: 37, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !18, line: 34, column: 5)
!43 = !DILocation(line: 37, column: 14, scope: !42)
!44 = !DILocation(line: 38, column: 5, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !18, line: 40, type: !47)
!46 = distinct !DILexicalBlock(scope: !25, file: !18, line: 39, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 40, column: 23, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !52, file: !18, line: 42, type: !53)
!52 = distinct !DILexicalBlock(scope: !46, file: !18, line: 41, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 42, column: 20, scope: !52)
!57 = !DILocation(line: 44, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !18, line: 44, column: 13)
!59 = !DILocation(line: 44, column: 18, scope: !58)
!60 = !DILocation(line: 44, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !18, line: 44, column: 13)
!62 = !DILocation(line: 44, column: 27, scope: !61)
!63 = !DILocation(line: 44, column: 13, scope: !58)
!64 = !DILocation(line: 46, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !18, line: 45, column: 13)
!66 = !DILocation(line: 46, column: 17, scope: !65)
!67 = !DILocation(line: 46, column: 27, scope: !65)
!68 = !DILocation(line: 46, column: 34, scope: !65)
!69 = !DILocation(line: 47, column: 24, scope: !65)
!70 = !DILocation(line: 47, column: 17, scope: !65)
!71 = !DILocation(line: 47, column: 27, scope: !65)
!72 = !DILocation(line: 47, column: 34, scope: !65)
!73 = !DILocation(line: 48, column: 13, scope: !65)
!74 = !DILocation(line: 44, column: 35, scope: !61)
!75 = !DILocation(line: 44, column: 13, scope: !61)
!76 = distinct !{!76, !63, !77, !78}
!77 = !DILocation(line: 48, column: 13, scope: !58)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 51, column: 16, scope: !46)
!80 = !DILocation(line: 51, column: 9, scope: !46)
!81 = !DILocation(line: 52, column: 26, scope: !46)
!82 = !DILocation(line: 52, column: 9, scope: !46)
!83 = !DILocation(line: 54, column: 1, scope: !25)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_05_good", scope: !18, file: !18, line: 121, type: !26, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 123, column: 5, scope: !84)
!86 = !DILocation(line: 124, column: 5, scope: !84)
!87 = !DILocation(line: 125, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 137, type: !89, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{!12, !12, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !18, line: 137, type: !12)
!95 = !DILocation(line: 137, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !18, line: 137, type: !91)
!97 = !DILocation(line: 137, column: 27, scope: !88)
!98 = !DILocation(line: 140, column: 22, scope: !88)
!99 = !DILocation(line: 140, column: 12, scope: !88)
!100 = !DILocation(line: 140, column: 5, scope: !88)
!101 = !DILocation(line: 142, column: 5, scope: !88)
!102 = !DILocation(line: 143, column: 5, scope: !88)
!103 = !DILocation(line: 144, column: 5, scope: !88)
!104 = !DILocation(line: 147, column: 5, scope: !88)
!105 = !DILocation(line: 148, column: 5, scope: !88)
!106 = !DILocation(line: 149, column: 5, scope: !88)
!107 = !DILocation(line: 151, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 61, type: !26, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !18, line: 63, type: !6)
!110 = !DILocation(line: 63, column: 21, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !18, line: 64, type: !6)
!112 = !DILocation(line: 64, column: 21, scope: !108)
!113 = !DILocation(line: 64, column: 54, scope: !108)
!114 = !DILocation(line: 64, column: 37, scope: !108)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !18, line: 65, type: !6)
!116 = !DILocation(line: 65, column: 21, scope: !108)
!117 = !DILocation(line: 65, column: 55, scope: !108)
!118 = !DILocation(line: 65, column: 38, scope: !108)
!119 = !DILocation(line: 66, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !18, line: 66, column: 8)
!121 = !DILocation(line: 66, column: 8, scope: !108)
!122 = !DILocation(line: 69, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !18, line: 67, column: 5)
!124 = !DILocation(line: 70, column: 5, scope: !123)
!125 = !DILocation(line: 74, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !18, line: 72, column: 5)
!127 = !DILocation(line: 74, column: 14, scope: !126)
!128 = !DILocalVariable(name: "source", scope: !129, file: !18, line: 77, type: !47)
!129 = distinct !DILexicalBlock(scope: !108, file: !18, line: 76, column: 5)
!130 = !DILocation(line: 77, column: 23, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !18, line: 79, type: !53)
!132 = distinct !DILexicalBlock(scope: !129, file: !18, line: 78, column: 9)
!133 = !DILocation(line: 79, column: 20, scope: !132)
!134 = !DILocation(line: 81, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !18, line: 81, column: 13)
!136 = !DILocation(line: 81, column: 18, scope: !135)
!137 = !DILocation(line: 81, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !18, line: 81, column: 13)
!139 = !DILocation(line: 81, column: 27, scope: !138)
!140 = !DILocation(line: 81, column: 13, scope: !135)
!141 = !DILocation(line: 83, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !18, line: 82, column: 13)
!143 = !DILocation(line: 83, column: 17, scope: !142)
!144 = !DILocation(line: 83, column: 27, scope: !142)
!145 = !DILocation(line: 83, column: 34, scope: !142)
!146 = !DILocation(line: 84, column: 24, scope: !142)
!147 = !DILocation(line: 84, column: 17, scope: !142)
!148 = !DILocation(line: 84, column: 27, scope: !142)
!149 = !DILocation(line: 84, column: 34, scope: !142)
!150 = !DILocation(line: 85, column: 13, scope: !142)
!151 = !DILocation(line: 81, column: 35, scope: !138)
!152 = !DILocation(line: 81, column: 13, scope: !138)
!153 = distinct !{!153, !140, !154, !78}
!154 = !DILocation(line: 85, column: 13, scope: !135)
!155 = !DILocation(line: 88, column: 16, scope: !129)
!156 = !DILocation(line: 88, column: 9, scope: !129)
!157 = !DILocation(line: 89, column: 26, scope: !129)
!158 = !DILocation(line: 89, column: 9, scope: !129)
!159 = !DILocation(line: 91, column: 1, scope: !108)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 94, type: !26, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!161 = !DILocalVariable(name: "data", scope: !160, file: !18, line: 96, type: !6)
!162 = !DILocation(line: 96, column: 21, scope: !160)
!163 = !DILocalVariable(name: "dataBadBuffer", scope: !160, file: !18, line: 97, type: !6)
!164 = !DILocation(line: 97, column: 21, scope: !160)
!165 = !DILocation(line: 97, column: 54, scope: !160)
!166 = !DILocation(line: 97, column: 37, scope: !160)
!167 = !DILocalVariable(name: "dataGoodBuffer", scope: !160, file: !18, line: 98, type: !6)
!168 = !DILocation(line: 98, column: 21, scope: !160)
!169 = !DILocation(line: 98, column: 55, scope: !160)
!170 = !DILocation(line: 98, column: 38, scope: !160)
!171 = !DILocation(line: 99, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !160, file: !18, line: 99, column: 8)
!173 = !DILocation(line: 99, column: 8, scope: !160)
!174 = !DILocation(line: 102, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !18, line: 100, column: 5)
!176 = !DILocation(line: 102, column: 14, scope: !175)
!177 = !DILocation(line: 103, column: 5, scope: !175)
!178 = !DILocalVariable(name: "source", scope: !179, file: !18, line: 105, type: !47)
!179 = distinct !DILexicalBlock(scope: !160, file: !18, line: 104, column: 5)
!180 = !DILocation(line: 105, column: 23, scope: !179)
!181 = !DILocalVariable(name: "i", scope: !182, file: !18, line: 107, type: !53)
!182 = distinct !DILexicalBlock(scope: !179, file: !18, line: 106, column: 9)
!183 = !DILocation(line: 107, column: 20, scope: !182)
!184 = !DILocation(line: 109, column: 20, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !18, line: 109, column: 13)
!186 = !DILocation(line: 109, column: 18, scope: !185)
!187 = !DILocation(line: 109, column: 25, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !18, line: 109, column: 13)
!189 = !DILocation(line: 109, column: 27, scope: !188)
!190 = !DILocation(line: 109, column: 13, scope: !185)
!191 = !DILocation(line: 111, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !18, line: 110, column: 13)
!193 = !DILocation(line: 111, column: 17, scope: !192)
!194 = !DILocation(line: 111, column: 27, scope: !192)
!195 = !DILocation(line: 111, column: 34, scope: !192)
!196 = !DILocation(line: 112, column: 24, scope: !192)
!197 = !DILocation(line: 112, column: 17, scope: !192)
!198 = !DILocation(line: 112, column: 27, scope: !192)
!199 = !DILocation(line: 112, column: 34, scope: !192)
!200 = !DILocation(line: 113, column: 13, scope: !192)
!201 = !DILocation(line: 109, column: 35, scope: !188)
!202 = !DILocation(line: 109, column: 13, scope: !188)
!203 = distinct !{!203, !190, !204, !78}
!204 = !DILocation(line: 113, column: 13, scope: !185)
!205 = !DILocation(line: 116, column: 16, scope: !179)
!206 = !DILocation(line: 116, column: 9, scope: !179)
!207 = !DILocation(line: 117, column: 26, scope: !179)
!208 = !DILocation(line: 117, column: 9, scope: !179)
!209 = !DILocation(line: 119, column: 1, scope: !160)
