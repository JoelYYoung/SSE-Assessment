; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09_bad() #0 !dbg !19 {
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
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !33
  %tobool = icmp ne i32 %4, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !36
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %6, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !75
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !75
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !75
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !76
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09_good() #0 !dbg !79 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 400, align 16, !dbg !108
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !109
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = alloca i8, i64 800, align 16, !dbg !112
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !113
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !111
  %4 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !114
  %tobool = icmp ne i32 %4, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !120
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !132
  %cmp = icmp ult i64 %6, 100, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !138
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !139
  store i32 0, i32* %intOne, align 8, !dbg !140
  %8 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !142
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !143
  store i32 0, i32* %intTwo, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %9, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !151
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !151
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !151
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !152
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = alloca i8, i64 400, align 16, !dbg !160
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !161
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %2 = alloca i8, i64 800, align 16, !dbg !164
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !165
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !163
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !166
  %tobool = icmp ne i32 %4, 0, !dbg !166
  br i1 %tobool, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !169
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !173, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !178
  store i64 0, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !182
  %cmp = icmp ult i64 %6, 100, !dbg !184
  br i1 %cmp, label %for.body, label %for.end, !dbg !185

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !188
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !189
  store i32 0, i32* %intOne, align 8, !dbg !190
  %8 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !192
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !193
  store i32 0, i32* %intTwo, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %9, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !200
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !201
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !201
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !201
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !201
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !202
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !202
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !203
  ret void, !dbg !204
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocation(line: 26, column: 8, scope: !19)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !20, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !20, line: 33, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 33, column: 23, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !20, line: 35, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !20, line: 34, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 20, scope: !47)
!52 = !DILocation(line: 37, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !20, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !20, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 27, scope: !56)
!58 = !DILocation(line: 37, column: 13, scope: !53)
!59 = !DILocation(line: 39, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !20, line: 38, column: 13)
!61 = !DILocation(line: 39, column: 17, scope: !60)
!62 = !DILocation(line: 39, column: 27, scope: !60)
!63 = !DILocation(line: 39, column: 34, scope: !60)
!64 = !DILocation(line: 40, column: 24, scope: !60)
!65 = !DILocation(line: 40, column: 17, scope: !60)
!66 = !DILocation(line: 40, column: 27, scope: !60)
!67 = !DILocation(line: 40, column: 34, scope: !60)
!68 = !DILocation(line: 41, column: 13, scope: !60)
!69 = !DILocation(line: 37, column: 35, scope: !56)
!70 = !DILocation(line: 37, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 41, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 44, column: 16, scope: !41)
!75 = !DILocation(line: 44, column: 9, scope: !41)
!76 = !DILocation(line: 45, column: 26, scope: !41)
!77 = !DILocation(line: 45, column: 9, scope: !41)
!78 = !DILocation(line: 47, column: 1, scope: !19)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_09_good", scope: !20, file: !20, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 116, column: 5, scope: !79)
!81 = !DILocation(line: 117, column: 5, scope: !79)
!82 = !DILocation(line: 118, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 130, type: !84, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!10, !10, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !20, line: 130, type: !10)
!90 = !DILocation(line: 130, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !20, line: 130, type: !86)
!92 = !DILocation(line: 130, column: 27, scope: !83)
!93 = !DILocation(line: 133, column: 22, scope: !83)
!94 = !DILocation(line: 133, column: 12, scope: !83)
!95 = !DILocation(line: 133, column: 5, scope: !83)
!96 = !DILocation(line: 135, column: 5, scope: !83)
!97 = !DILocation(line: 136, column: 5, scope: !83)
!98 = !DILocation(line: 137, column: 5, scope: !83)
!99 = !DILocation(line: 140, column: 5, scope: !83)
!100 = !DILocation(line: 141, column: 5, scope: !83)
!101 = !DILocation(line: 142, column: 5, scope: !83)
!102 = !DILocation(line: 144, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !20, line: 56, type: !4)
!105 = !DILocation(line: 56, column: 21, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !20, line: 57, type: !4)
!107 = !DILocation(line: 57, column: 21, scope: !103)
!108 = !DILocation(line: 57, column: 54, scope: !103)
!109 = !DILocation(line: 57, column: 37, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !20, line: 58, type: !4)
!111 = !DILocation(line: 58, column: 21, scope: !103)
!112 = !DILocation(line: 58, column: 55, scope: !103)
!113 = !DILocation(line: 58, column: 38, scope: !103)
!114 = !DILocation(line: 59, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !103, file: !20, line: 59, column: 8)
!116 = !DILocation(line: 59, column: 8, scope: !103)
!117 = !DILocation(line: 62, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !20, line: 60, column: 5)
!119 = !DILocation(line: 63, column: 5, scope: !118)
!120 = !DILocation(line: 67, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !20, line: 65, column: 5)
!122 = !DILocation(line: 67, column: 14, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !124, file: !20, line: 70, type: !42)
!124 = distinct !DILexicalBlock(scope: !103, file: !20, line: 69, column: 5)
!125 = !DILocation(line: 70, column: 23, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !127, file: !20, line: 72, type: !48)
!127 = distinct !DILexicalBlock(scope: !124, file: !20, line: 71, column: 9)
!128 = !DILocation(line: 72, column: 20, scope: !127)
!129 = !DILocation(line: 74, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !20, line: 74, column: 13)
!131 = !DILocation(line: 74, column: 18, scope: !130)
!132 = !DILocation(line: 74, column: 25, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !20, line: 74, column: 13)
!134 = !DILocation(line: 74, column: 27, scope: !133)
!135 = !DILocation(line: 74, column: 13, scope: !130)
!136 = !DILocation(line: 76, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !20, line: 75, column: 13)
!138 = !DILocation(line: 76, column: 17, scope: !137)
!139 = !DILocation(line: 76, column: 27, scope: !137)
!140 = !DILocation(line: 76, column: 34, scope: !137)
!141 = !DILocation(line: 77, column: 24, scope: !137)
!142 = !DILocation(line: 77, column: 17, scope: !137)
!143 = !DILocation(line: 77, column: 27, scope: !137)
!144 = !DILocation(line: 77, column: 34, scope: !137)
!145 = !DILocation(line: 78, column: 13, scope: !137)
!146 = !DILocation(line: 74, column: 35, scope: !133)
!147 = !DILocation(line: 74, column: 13, scope: !133)
!148 = distinct !{!148, !135, !149, !73}
!149 = !DILocation(line: 78, column: 13, scope: !130)
!150 = !DILocation(line: 81, column: 16, scope: !124)
!151 = !DILocation(line: 81, column: 9, scope: !124)
!152 = !DILocation(line: 82, column: 26, scope: !124)
!153 = !DILocation(line: 82, column: 9, scope: !124)
!154 = !DILocation(line: 84, column: 1, scope: !103)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !20, line: 89, type: !4)
!157 = !DILocation(line: 89, column: 21, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !20, line: 90, type: !4)
!159 = !DILocation(line: 90, column: 21, scope: !155)
!160 = !DILocation(line: 90, column: 54, scope: !155)
!161 = !DILocation(line: 90, column: 37, scope: !155)
!162 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !20, line: 91, type: !4)
!163 = !DILocation(line: 91, column: 21, scope: !155)
!164 = !DILocation(line: 91, column: 55, scope: !155)
!165 = !DILocation(line: 91, column: 38, scope: !155)
!166 = !DILocation(line: 92, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !155, file: !20, line: 92, column: 8)
!168 = !DILocation(line: 92, column: 8, scope: !155)
!169 = !DILocation(line: 95, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !20, line: 93, column: 5)
!171 = !DILocation(line: 95, column: 14, scope: !170)
!172 = !DILocation(line: 96, column: 5, scope: !170)
!173 = !DILocalVariable(name: "source", scope: !174, file: !20, line: 98, type: !42)
!174 = distinct !DILexicalBlock(scope: !155, file: !20, line: 97, column: 5)
!175 = !DILocation(line: 98, column: 23, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !177, file: !20, line: 100, type: !48)
!177 = distinct !DILexicalBlock(scope: !174, file: !20, line: 99, column: 9)
!178 = !DILocation(line: 100, column: 20, scope: !177)
!179 = !DILocation(line: 102, column: 20, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !20, line: 102, column: 13)
!181 = !DILocation(line: 102, column: 18, scope: !180)
!182 = !DILocation(line: 102, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !20, line: 102, column: 13)
!184 = !DILocation(line: 102, column: 27, scope: !183)
!185 = !DILocation(line: 102, column: 13, scope: !180)
!186 = !DILocation(line: 104, column: 24, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !20, line: 103, column: 13)
!188 = !DILocation(line: 104, column: 17, scope: !187)
!189 = !DILocation(line: 104, column: 27, scope: !187)
!190 = !DILocation(line: 104, column: 34, scope: !187)
!191 = !DILocation(line: 105, column: 24, scope: !187)
!192 = !DILocation(line: 105, column: 17, scope: !187)
!193 = !DILocation(line: 105, column: 27, scope: !187)
!194 = !DILocation(line: 105, column: 34, scope: !187)
!195 = !DILocation(line: 106, column: 13, scope: !187)
!196 = !DILocation(line: 102, column: 35, scope: !183)
!197 = !DILocation(line: 102, column: 13, scope: !183)
!198 = distinct !{!198, !185, !199, !73}
!199 = !DILocation(line: 106, column: 13, scope: !180)
!200 = !DILocation(line: 109, column: 16, scope: !174)
!201 = !DILocation(line: 109, column: 9, scope: !174)
!202 = !DILocation(line: 110, column: 26, scope: !174)
!203 = !DILocation(line: 110, column: 9, scope: !174)
!204 = !DILocation(line: 112, column: 1, scope: !155)
