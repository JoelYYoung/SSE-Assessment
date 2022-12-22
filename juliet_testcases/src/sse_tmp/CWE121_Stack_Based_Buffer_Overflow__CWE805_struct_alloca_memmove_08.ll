; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08_bad() #0 !dbg !19 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !36
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %5, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %8, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !75
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !75
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !75
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !75
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !76
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !103 {
entry:
  ret i32 1, !dbg !106
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !124
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !136
  %cmp = icmp ult i64 %5, 100, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !142
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !143
  store i32 0, i32* %intOne, align 8, !dbg !144
  %7 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !146
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !147
  store i32 0, i32* %intTwo, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %8, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !154
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !155
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !155
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !155
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !155
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !156
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !156
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !159 {
entry:
  ret i32 0, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = alloca i8, i64 400, align 16, !dbg !166
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !167
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  %2 = alloca i8, i64 800, align 16, !dbg !170
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !171
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !169
  %call = call i32 @staticReturnsTrue(), !dbg !172
  %tobool = icmp ne i32 %call, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !175
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !177
  br label %if.end, !dbg !178

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %i, metadata !182, metadata !DIExpression()), !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !188
  %cmp = icmp ult i64 %5, 100, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !194
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !195
  store i32 0, i32* %intOne, align 8, !dbg !196
  %7 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !198
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !199
  store i32 0, i32* %intTwo, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %8, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !206
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !207
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !207
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !207
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !207
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !208
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !208
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !209
  ret void, !dbg !210
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08_bad", scope: !20, file: !20, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 37, type: !4)
!24 = !DILocation(line: 37, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 38, type: !4)
!26 = !DILocation(line: 38, column: 21, scope: !19)
!27 = !DILocation(line: 38, column: 54, scope: !19)
!28 = !DILocation(line: 38, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 39, type: !4)
!30 = !DILocation(line: 39, column: 21, scope: !19)
!31 = !DILocation(line: 39, column: 55, scope: !19)
!32 = !DILocation(line: 39, column: 38, scope: !19)
!33 = !DILocation(line: 40, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !20, line: 40, column: 8)
!35 = !DILocation(line: 40, column: 8, scope: !19)
!36 = !DILocation(line: 44, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !20, line: 41, column: 5)
!38 = !DILocation(line: 44, column: 14, scope: !37)
!39 = !DILocation(line: 45, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !20, line: 47, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !20, line: 46, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 47, column: 23, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !20, line: 49, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !20, line: 48, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 49, column: 20, scope: !47)
!52 = !DILocation(line: 51, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !20, line: 51, column: 13)
!54 = !DILocation(line: 51, column: 18, scope: !53)
!55 = !DILocation(line: 51, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !20, line: 51, column: 13)
!57 = !DILocation(line: 51, column: 27, scope: !56)
!58 = !DILocation(line: 51, column: 13, scope: !53)
!59 = !DILocation(line: 53, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !20, line: 52, column: 13)
!61 = !DILocation(line: 53, column: 17, scope: !60)
!62 = !DILocation(line: 53, column: 27, scope: !60)
!63 = !DILocation(line: 53, column: 34, scope: !60)
!64 = !DILocation(line: 54, column: 24, scope: !60)
!65 = !DILocation(line: 54, column: 17, scope: !60)
!66 = !DILocation(line: 54, column: 27, scope: !60)
!67 = !DILocation(line: 54, column: 34, scope: !60)
!68 = !DILocation(line: 55, column: 13, scope: !60)
!69 = !DILocation(line: 51, column: 35, scope: !56)
!70 = !DILocation(line: 51, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 55, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 58, column: 17, scope: !41)
!75 = !DILocation(line: 58, column: 9, scope: !41)
!76 = !DILocation(line: 59, column: 26, scope: !41)
!77 = !DILocation(line: 59, column: 9, scope: !41)
!78 = !DILocation(line: 61, column: 1, scope: !19)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_08_good", scope: !20, file: !20, line: 128, type: !21, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 130, column: 5, scope: !79)
!81 = !DILocation(line: 131, column: 5, scope: !79)
!82 = !DILocation(line: 132, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 144, type: !84, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!10, !10, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !20, line: 144, type: !10)
!90 = !DILocation(line: 144, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !20, line: 144, type: !86)
!92 = !DILocation(line: 144, column: 27, scope: !83)
!93 = !DILocation(line: 147, column: 22, scope: !83)
!94 = !DILocation(line: 147, column: 12, scope: !83)
!95 = !DILocation(line: 147, column: 5, scope: !83)
!96 = !DILocation(line: 149, column: 5, scope: !83)
!97 = !DILocation(line: 150, column: 5, scope: !83)
!98 = !DILocation(line: 151, column: 5, scope: !83)
!99 = !DILocation(line: 154, column: 5, scope: !83)
!100 = !DILocation(line: 155, column: 5, scope: !83)
!101 = !DILocation(line: 156, column: 5, scope: !83)
!102 = !DILocation(line: 158, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !20, file: !20, line: 23, type: !104, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!10}
!106 = !DILocation(line: 25, column: 5, scope: !103)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 68, type: !21, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !20, line: 70, type: !4)
!109 = !DILocation(line: 70, column: 21, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !20, line: 71, type: !4)
!111 = !DILocation(line: 71, column: 21, scope: !107)
!112 = !DILocation(line: 71, column: 54, scope: !107)
!113 = !DILocation(line: 71, column: 37, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !20, line: 72, type: !4)
!115 = !DILocation(line: 72, column: 21, scope: !107)
!116 = !DILocation(line: 72, column: 55, scope: !107)
!117 = !DILocation(line: 72, column: 38, scope: !107)
!118 = !DILocation(line: 73, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !20, line: 73, column: 8)
!120 = !DILocation(line: 73, column: 8, scope: !107)
!121 = !DILocation(line: 76, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !20, line: 74, column: 5)
!123 = !DILocation(line: 77, column: 5, scope: !122)
!124 = !DILocation(line: 81, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !20, line: 79, column: 5)
!126 = !DILocation(line: 81, column: 14, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !128, file: !20, line: 84, type: !42)
!128 = distinct !DILexicalBlock(scope: !107, file: !20, line: 83, column: 5)
!129 = !DILocation(line: 84, column: 23, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !131, file: !20, line: 86, type: !48)
!131 = distinct !DILexicalBlock(scope: !128, file: !20, line: 85, column: 9)
!132 = !DILocation(line: 86, column: 20, scope: !131)
!133 = !DILocation(line: 88, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !20, line: 88, column: 13)
!135 = !DILocation(line: 88, column: 18, scope: !134)
!136 = !DILocation(line: 88, column: 25, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !20, line: 88, column: 13)
!138 = !DILocation(line: 88, column: 27, scope: !137)
!139 = !DILocation(line: 88, column: 13, scope: !134)
!140 = !DILocation(line: 90, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !20, line: 89, column: 13)
!142 = !DILocation(line: 90, column: 17, scope: !141)
!143 = !DILocation(line: 90, column: 27, scope: !141)
!144 = !DILocation(line: 90, column: 34, scope: !141)
!145 = !DILocation(line: 91, column: 24, scope: !141)
!146 = !DILocation(line: 91, column: 17, scope: !141)
!147 = !DILocation(line: 91, column: 27, scope: !141)
!148 = !DILocation(line: 91, column: 34, scope: !141)
!149 = !DILocation(line: 92, column: 13, scope: !141)
!150 = !DILocation(line: 88, column: 35, scope: !137)
!151 = !DILocation(line: 88, column: 13, scope: !137)
!152 = distinct !{!152, !139, !153, !73}
!153 = !DILocation(line: 92, column: 13, scope: !134)
!154 = !DILocation(line: 95, column: 17, scope: !128)
!155 = !DILocation(line: 95, column: 9, scope: !128)
!156 = !DILocation(line: 96, column: 26, scope: !128)
!157 = !DILocation(line: 96, column: 9, scope: !128)
!158 = !DILocation(line: 98, column: 1, scope: !107)
!159 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !20, file: !20, line: 28, type: !104, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocation(line: 30, column: 5, scope: !159)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 101, type: !21, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", scope: !161, file: !20, line: 103, type: !4)
!163 = !DILocation(line: 103, column: 21, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !20, line: 104, type: !4)
!165 = !DILocation(line: 104, column: 21, scope: !161)
!166 = !DILocation(line: 104, column: 54, scope: !161)
!167 = !DILocation(line: 104, column: 37, scope: !161)
!168 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !20, line: 105, type: !4)
!169 = !DILocation(line: 105, column: 21, scope: !161)
!170 = !DILocation(line: 105, column: 55, scope: !161)
!171 = !DILocation(line: 105, column: 38, scope: !161)
!172 = !DILocation(line: 106, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !20, line: 106, column: 8)
!174 = !DILocation(line: 106, column: 8, scope: !161)
!175 = !DILocation(line: 109, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !20, line: 107, column: 5)
!177 = !DILocation(line: 109, column: 14, scope: !176)
!178 = !DILocation(line: 110, column: 5, scope: !176)
!179 = !DILocalVariable(name: "source", scope: !180, file: !20, line: 112, type: !42)
!180 = distinct !DILexicalBlock(scope: !161, file: !20, line: 111, column: 5)
!181 = !DILocation(line: 112, column: 23, scope: !180)
!182 = !DILocalVariable(name: "i", scope: !183, file: !20, line: 114, type: !48)
!183 = distinct !DILexicalBlock(scope: !180, file: !20, line: 113, column: 9)
!184 = !DILocation(line: 114, column: 20, scope: !183)
!185 = !DILocation(line: 116, column: 20, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !20, line: 116, column: 13)
!187 = !DILocation(line: 116, column: 18, scope: !186)
!188 = !DILocation(line: 116, column: 25, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !20, line: 116, column: 13)
!190 = !DILocation(line: 116, column: 27, scope: !189)
!191 = !DILocation(line: 116, column: 13, scope: !186)
!192 = !DILocation(line: 118, column: 24, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !20, line: 117, column: 13)
!194 = !DILocation(line: 118, column: 17, scope: !193)
!195 = !DILocation(line: 118, column: 27, scope: !193)
!196 = !DILocation(line: 118, column: 34, scope: !193)
!197 = !DILocation(line: 119, column: 24, scope: !193)
!198 = !DILocation(line: 119, column: 17, scope: !193)
!199 = !DILocation(line: 119, column: 27, scope: !193)
!200 = !DILocation(line: 119, column: 34, scope: !193)
!201 = !DILocation(line: 120, column: 13, scope: !193)
!202 = !DILocation(line: 116, column: 35, scope: !189)
!203 = !DILocation(line: 116, column: 13, scope: !189)
!204 = distinct !{!204, !191, !205, !73}
!205 = !DILocation(line: 120, column: 13, scope: !186)
!206 = !DILocation(line: 123, column: 17, scope: !180)
!207 = !DILocation(line: 123, column: 9, scope: !180)
!208 = !DILocation(line: 124, column: 26, scope: !180)
!209 = !DILocation(line: 124, column: 9, scope: !180)
!210 = !DILocation(line: 126, column: 1, scope: !161)
