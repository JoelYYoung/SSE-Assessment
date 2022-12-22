; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !33
  %cmp = icmp eq i32 %4, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !37
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !56
  %cmp1 = icmp ult i64 %6, 100, !dbg !58
  br i1 %cmp1, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %9, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !76
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !76
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !76
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !76
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !77
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !110
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 800, align 16, !dbg !113
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !114
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !115
  %cmp = icmp ne i32 %4, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !122
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !134
  %cmp1 = icmp ult i64 %6, 100, !dbg !136
  br i1 %cmp1, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !140
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !141
  store i32 0, i32* %intOne, align 8, !dbg !142
  %8 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !144
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !145
  store i32 0, i32* %intTwo, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %9, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !153
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !153
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !153
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !153
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !154
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !154
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = alloca i8, i64 400, align 16, !dbg !162
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !163
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %2 = alloca i8, i64 800, align 16, !dbg !166
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !167
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !165
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !168
  %cmp = icmp eq i32 %4, 5, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !172
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !174
  br label %if.end, !dbg !175

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !176, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !185
  %cmp1 = icmp ult i64 %6, 100, !dbg !187
  br i1 %cmp1, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !191
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !192
  store i32 0, i32* %intOne, align 8, !dbg !193
  %8 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !195
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !196
  store i32 0, i32* %intTwo, align 4, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %9, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !203
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !204
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !204
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !204
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !204
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !205
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !205
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !206
  ret void, !dbg !207
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13.c", directory: "/root/SSE-Assessment")
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
!33 = !DILocation(line: 26, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!35 = !DILocation(line: 26, column: 25, scope: !34)
!36 = !DILocation(line: 26, column: 8, scope: !19)
!37 = !DILocation(line: 30, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !20, line: 27, column: 5)
!39 = !DILocation(line: 30, column: 14, scope: !38)
!40 = !DILocation(line: 31, column: 5, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !20, line: 33, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 33, column: 23, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !20, line: 35, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !20, line: 34, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 35, column: 20, scope: !48)
!53 = !DILocation(line: 37, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !20, line: 37, column: 13)
!55 = !DILocation(line: 37, column: 18, scope: !54)
!56 = !DILocation(line: 37, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !20, line: 37, column: 13)
!58 = !DILocation(line: 37, column: 27, scope: !57)
!59 = !DILocation(line: 37, column: 13, scope: !54)
!60 = !DILocation(line: 39, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !20, line: 38, column: 13)
!62 = !DILocation(line: 39, column: 17, scope: !61)
!63 = !DILocation(line: 39, column: 27, scope: !61)
!64 = !DILocation(line: 39, column: 34, scope: !61)
!65 = !DILocation(line: 40, column: 24, scope: !61)
!66 = !DILocation(line: 40, column: 17, scope: !61)
!67 = !DILocation(line: 40, column: 27, scope: !61)
!68 = !DILocation(line: 40, column: 34, scope: !61)
!69 = !DILocation(line: 41, column: 13, scope: !61)
!70 = !DILocation(line: 37, column: 35, scope: !57)
!71 = !DILocation(line: 37, column: 13, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 41, column: 13, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 44, column: 17, scope: !42)
!76 = !DILocation(line: 44, column: 9, scope: !42)
!77 = !DILocation(line: 45, column: 26, scope: !42)
!78 = !DILocation(line: 45, column: 9, scope: !42)
!79 = !DILocation(line: 47, column: 1, scope: !19)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_13_good", scope: !20, file: !20, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 116, column: 5, scope: !80)
!82 = !DILocation(line: 117, column: 5, scope: !80)
!83 = !DILocation(line: 118, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 130, type: !85, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!10, !10, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !20, line: 130, type: !10)
!91 = !DILocation(line: 130, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !20, line: 130, type: !87)
!93 = !DILocation(line: 130, column: 27, scope: !84)
!94 = !DILocation(line: 133, column: 22, scope: !84)
!95 = !DILocation(line: 133, column: 12, scope: !84)
!96 = !DILocation(line: 133, column: 5, scope: !84)
!97 = !DILocation(line: 135, column: 5, scope: !84)
!98 = !DILocation(line: 136, column: 5, scope: !84)
!99 = !DILocation(line: 137, column: 5, scope: !84)
!100 = !DILocation(line: 140, column: 5, scope: !84)
!101 = !DILocation(line: 141, column: 5, scope: !84)
!102 = !DILocation(line: 142, column: 5, scope: !84)
!103 = !DILocation(line: 144, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !20, line: 56, type: !4)
!106 = !DILocation(line: 56, column: 21, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !20, line: 57, type: !4)
!108 = !DILocation(line: 57, column: 21, scope: !104)
!109 = !DILocation(line: 57, column: 54, scope: !104)
!110 = !DILocation(line: 57, column: 37, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !20, line: 58, type: !4)
!112 = !DILocation(line: 58, column: 21, scope: !104)
!113 = !DILocation(line: 58, column: 55, scope: !104)
!114 = !DILocation(line: 58, column: 38, scope: !104)
!115 = !DILocation(line: 59, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !20, line: 59, column: 8)
!117 = !DILocation(line: 59, column: 25, scope: !116)
!118 = !DILocation(line: 59, column: 8, scope: !104)
!119 = !DILocation(line: 62, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !20, line: 60, column: 5)
!121 = !DILocation(line: 63, column: 5, scope: !120)
!122 = !DILocation(line: 67, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !20, line: 65, column: 5)
!124 = !DILocation(line: 67, column: 14, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !126, file: !20, line: 70, type: !43)
!126 = distinct !DILexicalBlock(scope: !104, file: !20, line: 69, column: 5)
!127 = !DILocation(line: 70, column: 23, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !129, file: !20, line: 72, type: !49)
!129 = distinct !DILexicalBlock(scope: !126, file: !20, line: 71, column: 9)
!130 = !DILocation(line: 72, column: 20, scope: !129)
!131 = !DILocation(line: 74, column: 20, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !20, line: 74, column: 13)
!133 = !DILocation(line: 74, column: 18, scope: !132)
!134 = !DILocation(line: 74, column: 25, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !20, line: 74, column: 13)
!136 = !DILocation(line: 74, column: 27, scope: !135)
!137 = !DILocation(line: 74, column: 13, scope: !132)
!138 = !DILocation(line: 76, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !20, line: 75, column: 13)
!140 = !DILocation(line: 76, column: 17, scope: !139)
!141 = !DILocation(line: 76, column: 27, scope: !139)
!142 = !DILocation(line: 76, column: 34, scope: !139)
!143 = !DILocation(line: 77, column: 24, scope: !139)
!144 = !DILocation(line: 77, column: 17, scope: !139)
!145 = !DILocation(line: 77, column: 27, scope: !139)
!146 = !DILocation(line: 77, column: 34, scope: !139)
!147 = !DILocation(line: 78, column: 13, scope: !139)
!148 = !DILocation(line: 74, column: 35, scope: !135)
!149 = !DILocation(line: 74, column: 13, scope: !135)
!150 = distinct !{!150, !137, !151, !74}
!151 = !DILocation(line: 78, column: 13, scope: !132)
!152 = !DILocation(line: 81, column: 17, scope: !126)
!153 = !DILocation(line: 81, column: 9, scope: !126)
!154 = !DILocation(line: 82, column: 26, scope: !126)
!155 = !DILocation(line: 82, column: 9, scope: !126)
!156 = !DILocation(line: 84, column: 1, scope: !104)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !20, line: 89, type: !4)
!159 = !DILocation(line: 89, column: 21, scope: !157)
!160 = !DILocalVariable(name: "dataBadBuffer", scope: !157, file: !20, line: 90, type: !4)
!161 = !DILocation(line: 90, column: 21, scope: !157)
!162 = !DILocation(line: 90, column: 54, scope: !157)
!163 = !DILocation(line: 90, column: 37, scope: !157)
!164 = !DILocalVariable(name: "dataGoodBuffer", scope: !157, file: !20, line: 91, type: !4)
!165 = !DILocation(line: 91, column: 21, scope: !157)
!166 = !DILocation(line: 91, column: 55, scope: !157)
!167 = !DILocation(line: 91, column: 38, scope: !157)
!168 = !DILocation(line: 92, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !157, file: !20, line: 92, column: 8)
!170 = !DILocation(line: 92, column: 25, scope: !169)
!171 = !DILocation(line: 92, column: 8, scope: !157)
!172 = !DILocation(line: 95, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !20, line: 93, column: 5)
!174 = !DILocation(line: 95, column: 14, scope: !173)
!175 = !DILocation(line: 96, column: 5, scope: !173)
!176 = !DILocalVariable(name: "source", scope: !177, file: !20, line: 98, type: !43)
!177 = distinct !DILexicalBlock(scope: !157, file: !20, line: 97, column: 5)
!178 = !DILocation(line: 98, column: 23, scope: !177)
!179 = !DILocalVariable(name: "i", scope: !180, file: !20, line: 100, type: !49)
!180 = distinct !DILexicalBlock(scope: !177, file: !20, line: 99, column: 9)
!181 = !DILocation(line: 100, column: 20, scope: !180)
!182 = !DILocation(line: 102, column: 20, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !20, line: 102, column: 13)
!184 = !DILocation(line: 102, column: 18, scope: !183)
!185 = !DILocation(line: 102, column: 25, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !20, line: 102, column: 13)
!187 = !DILocation(line: 102, column: 27, scope: !186)
!188 = !DILocation(line: 102, column: 13, scope: !183)
!189 = !DILocation(line: 104, column: 24, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !20, line: 103, column: 13)
!191 = !DILocation(line: 104, column: 17, scope: !190)
!192 = !DILocation(line: 104, column: 27, scope: !190)
!193 = !DILocation(line: 104, column: 34, scope: !190)
!194 = !DILocation(line: 105, column: 24, scope: !190)
!195 = !DILocation(line: 105, column: 17, scope: !190)
!196 = !DILocation(line: 105, column: 27, scope: !190)
!197 = !DILocation(line: 105, column: 34, scope: !190)
!198 = !DILocation(line: 106, column: 13, scope: !190)
!199 = !DILocation(line: 102, column: 35, scope: !186)
!200 = !DILocation(line: 102, column: 13, scope: !186)
!201 = distinct !{!201, !188, !202, !74}
!202 = !DILocation(line: 106, column: 13, scope: !183)
!203 = !DILocation(line: 109, column: 17, scope: !177)
!204 = !DILocation(line: 109, column: 9, scope: !177)
!205 = !DILocation(line: 110, column: 26, scope: !177)
!206 = !DILocation(line: 110, column: 9, scope: !177)
!207 = !DILocation(line: 112, column: 1, scope: !157)
