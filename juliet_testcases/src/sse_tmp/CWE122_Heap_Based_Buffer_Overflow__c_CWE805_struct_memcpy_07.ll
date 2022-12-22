; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07_bad() #0 !dbg !24 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end3, !dbg !33

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !34
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !40
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !41

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !60
  %cmp4 = icmp ult i64 %3, 100, !dbg !62
  br i1 %cmp4, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !66
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !67
  store i32 0, i32* %intOne, align 8, !dbg !68
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !70
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !71
  store i32 0, i32* %intTwo, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %6, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !80
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !80
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !80
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !80
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !81
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !82
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !83
  call void @free(i8* %12) #6, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #6, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #6, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !111, metadata !DIExpression()), !dbg !112
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %0 = load i32, i32* @staticFive, align 4, !dbg !114
  %cmp = icmp ne i32 %0, 5, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end3, !dbg !120

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !121
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !123
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !127
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !128

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !140
  %cmp4 = icmp ult i64 %3, 100, !dbg !142
  br i1 %cmp4, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !146
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !147
  store i32 0, i32* %intOne, align 8, !dbg !148
  %5 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !150
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !151
  store i32 0, i32* %intTwo, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %6, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !158
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !159
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !159
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !159
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !159
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !160
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !161
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !162
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !162
  call void @free(i8* %12) #6, !dbg !163
  ret void, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !165 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !166, metadata !DIExpression()), !dbg !167
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !168
  %0 = load i32, i32* @staticFive, align 4, !dbg !169
  %cmp = icmp eq i32 %0, 5, !dbg !171
  br i1 %cmp, label %if.then, label %if.end3, !dbg !172

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !173
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !175
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !177
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !179
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !180

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !181
  unreachable, !dbg !181

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !183

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !184, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %i, metadata !187, metadata !DIExpression()), !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !193
  %cmp4 = icmp ult i64 %3, 100, !dbg !195
  br i1 %cmp4, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !199
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !200
  store i32 0, i32* %intOne, align 8, !dbg !201
  %5 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !203
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !204
  store i32 0, i32* %intTwo, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %6, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !211
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !212
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !212
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !212
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !212
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !213
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !213
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !214
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !215
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !215
  call void @free(i8* %12) #6, !dbg !216
  ret void, !dbg !217
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !17, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14, !15}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0}
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07.c", directory: "/root/SSE-Assessment")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07_bad", scope: !17, file: !17, line: 27, type: !25, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !17, line: 29, type: !6)
!28 = !DILocation(line: 29, column: 21, scope: !24)
!29 = !DILocation(line: 30, column: 10, scope: !24)
!30 = !DILocation(line: 31, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 31, column: 8)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 8, scope: !24)
!34 = !DILocation(line: 34, column: 33, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 32, column: 5)
!36 = !DILocation(line: 34, column: 16, scope: !35)
!37 = !DILocation(line: 34, column: 14, scope: !35)
!38 = !DILocation(line: 35, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !17, line: 35, column: 13)
!40 = !DILocation(line: 35, column: 18, scope: !39)
!41 = !DILocation(line: 35, column: 13, scope: !35)
!42 = !DILocation(line: 35, column: 28, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 35, column: 27)
!44 = !DILocation(line: 36, column: 5, scope: !35)
!45 = !DILocalVariable(name: "source", scope: !46, file: !17, line: 38, type: !47)
!46 = distinct !DILexicalBlock(scope: !24, file: !17, line: 37, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 38, column: 23, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !52, file: !17, line: 40, type: !53)
!52 = distinct !DILexicalBlock(scope: !46, file: !17, line: 39, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 40, column: 20, scope: !52)
!57 = !DILocation(line: 42, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !17, line: 42, column: 13)
!59 = !DILocation(line: 42, column: 18, scope: !58)
!60 = !DILocation(line: 42, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !17, line: 42, column: 13)
!62 = !DILocation(line: 42, column: 27, scope: !61)
!63 = !DILocation(line: 42, column: 13, scope: !58)
!64 = !DILocation(line: 44, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !17, line: 43, column: 13)
!66 = !DILocation(line: 44, column: 17, scope: !65)
!67 = !DILocation(line: 44, column: 27, scope: !65)
!68 = !DILocation(line: 44, column: 34, scope: !65)
!69 = !DILocation(line: 45, column: 24, scope: !65)
!70 = !DILocation(line: 45, column: 17, scope: !65)
!71 = !DILocation(line: 45, column: 27, scope: !65)
!72 = !DILocation(line: 45, column: 34, scope: !65)
!73 = !DILocation(line: 46, column: 13, scope: !65)
!74 = !DILocation(line: 42, column: 35, scope: !61)
!75 = !DILocation(line: 42, column: 13, scope: !61)
!76 = distinct !{!76, !63, !77, !78}
!77 = !DILocation(line: 46, column: 13, scope: !58)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 49, column: 16, scope: !46)
!80 = !DILocation(line: 49, column: 9, scope: !46)
!81 = !DILocation(line: 50, column: 26, scope: !46)
!82 = !DILocation(line: 50, column: 9, scope: !46)
!83 = !DILocation(line: 51, column: 14, scope: !46)
!84 = !DILocation(line: 51, column: 9, scope: !46)
!85 = !DILocation(line: 53, column: 1, scope: !24)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_07_good", scope: !17, file: !17, line: 122, type: !25, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocation(line: 124, column: 5, scope: !86)
!88 = !DILocation(line: 125, column: 5, scope: !86)
!89 = !DILocation(line: 126, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 138, type: !91, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{!12, !12, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !17, line: 138, type: !12)
!97 = !DILocation(line: 138, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !17, line: 138, type: !93)
!99 = !DILocation(line: 138, column: 27, scope: !90)
!100 = !DILocation(line: 141, column: 22, scope: !90)
!101 = !DILocation(line: 141, column: 12, scope: !90)
!102 = !DILocation(line: 141, column: 5, scope: !90)
!103 = !DILocation(line: 143, column: 5, scope: !90)
!104 = !DILocation(line: 144, column: 5, scope: !90)
!105 = !DILocation(line: 145, column: 5, scope: !90)
!106 = !DILocation(line: 148, column: 5, scope: !90)
!107 = !DILocation(line: 149, column: 5, scope: !90)
!108 = !DILocation(line: 150, column: 5, scope: !90)
!109 = !DILocation(line: 152, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 60, type: !25, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 62, type: !6)
!112 = !DILocation(line: 62, column: 21, scope: !110)
!113 = !DILocation(line: 63, column: 10, scope: !110)
!114 = !DILocation(line: 64, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !17, line: 64, column: 8)
!116 = !DILocation(line: 64, column: 18, scope: !115)
!117 = !DILocation(line: 64, column: 8, scope: !110)
!118 = !DILocation(line: 67, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 65, column: 5)
!120 = !DILocation(line: 68, column: 5, scope: !119)
!121 = !DILocation(line: 72, column: 33, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !17, line: 70, column: 5)
!123 = !DILocation(line: 72, column: 16, scope: !122)
!124 = !DILocation(line: 72, column: 14, scope: !122)
!125 = !DILocation(line: 73, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !17, line: 73, column: 13)
!127 = !DILocation(line: 73, column: 18, scope: !126)
!128 = !DILocation(line: 73, column: 13, scope: !122)
!129 = !DILocation(line: 73, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 73, column: 27)
!131 = !DILocalVariable(name: "source", scope: !132, file: !17, line: 76, type: !47)
!132 = distinct !DILexicalBlock(scope: !110, file: !17, line: 75, column: 5)
!133 = !DILocation(line: 76, column: 23, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !17, line: 78, type: !53)
!135 = distinct !DILexicalBlock(scope: !132, file: !17, line: 77, column: 9)
!136 = !DILocation(line: 78, column: 20, scope: !135)
!137 = !DILocation(line: 80, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !17, line: 80, column: 13)
!139 = !DILocation(line: 80, column: 18, scope: !138)
!140 = !DILocation(line: 80, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !17, line: 80, column: 13)
!142 = !DILocation(line: 80, column: 27, scope: !141)
!143 = !DILocation(line: 80, column: 13, scope: !138)
!144 = !DILocation(line: 82, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !17, line: 81, column: 13)
!146 = !DILocation(line: 82, column: 17, scope: !145)
!147 = !DILocation(line: 82, column: 27, scope: !145)
!148 = !DILocation(line: 82, column: 34, scope: !145)
!149 = !DILocation(line: 83, column: 24, scope: !145)
!150 = !DILocation(line: 83, column: 17, scope: !145)
!151 = !DILocation(line: 83, column: 27, scope: !145)
!152 = !DILocation(line: 83, column: 34, scope: !145)
!153 = !DILocation(line: 84, column: 13, scope: !145)
!154 = !DILocation(line: 80, column: 35, scope: !141)
!155 = !DILocation(line: 80, column: 13, scope: !141)
!156 = distinct !{!156, !143, !157, !78}
!157 = !DILocation(line: 84, column: 13, scope: !138)
!158 = !DILocation(line: 87, column: 16, scope: !132)
!159 = !DILocation(line: 87, column: 9, scope: !132)
!160 = !DILocation(line: 88, column: 26, scope: !132)
!161 = !DILocation(line: 88, column: 9, scope: !132)
!162 = !DILocation(line: 89, column: 14, scope: !132)
!163 = !DILocation(line: 89, column: 9, scope: !132)
!164 = !DILocation(line: 91, column: 1, scope: !110)
!165 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 94, type: !25, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!166 = !DILocalVariable(name: "data", scope: !165, file: !17, line: 96, type: !6)
!167 = !DILocation(line: 96, column: 21, scope: !165)
!168 = !DILocation(line: 97, column: 10, scope: !165)
!169 = !DILocation(line: 98, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !165, file: !17, line: 98, column: 8)
!171 = !DILocation(line: 98, column: 18, scope: !170)
!172 = !DILocation(line: 98, column: 8, scope: !165)
!173 = !DILocation(line: 101, column: 33, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !17, line: 99, column: 5)
!175 = !DILocation(line: 101, column: 16, scope: !174)
!176 = !DILocation(line: 101, column: 14, scope: !174)
!177 = !DILocation(line: 102, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !17, line: 102, column: 13)
!179 = !DILocation(line: 102, column: 18, scope: !178)
!180 = !DILocation(line: 102, column: 13, scope: !174)
!181 = !DILocation(line: 102, column: 28, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !17, line: 102, column: 27)
!183 = !DILocation(line: 103, column: 5, scope: !174)
!184 = !DILocalVariable(name: "source", scope: !185, file: !17, line: 105, type: !47)
!185 = distinct !DILexicalBlock(scope: !165, file: !17, line: 104, column: 5)
!186 = !DILocation(line: 105, column: 23, scope: !185)
!187 = !DILocalVariable(name: "i", scope: !188, file: !17, line: 107, type: !53)
!188 = distinct !DILexicalBlock(scope: !185, file: !17, line: 106, column: 9)
!189 = !DILocation(line: 107, column: 20, scope: !188)
!190 = !DILocation(line: 109, column: 20, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !17, line: 109, column: 13)
!192 = !DILocation(line: 109, column: 18, scope: !191)
!193 = !DILocation(line: 109, column: 25, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !17, line: 109, column: 13)
!195 = !DILocation(line: 109, column: 27, scope: !194)
!196 = !DILocation(line: 109, column: 13, scope: !191)
!197 = !DILocation(line: 111, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !17, line: 110, column: 13)
!199 = !DILocation(line: 111, column: 17, scope: !198)
!200 = !DILocation(line: 111, column: 27, scope: !198)
!201 = !DILocation(line: 111, column: 34, scope: !198)
!202 = !DILocation(line: 112, column: 24, scope: !198)
!203 = !DILocation(line: 112, column: 17, scope: !198)
!204 = !DILocation(line: 112, column: 27, scope: !198)
!205 = !DILocation(line: 112, column: 34, scope: !198)
!206 = !DILocation(line: 113, column: 13, scope: !198)
!207 = !DILocation(line: 109, column: 35, scope: !194)
!208 = !DILocation(line: 109, column: 13, scope: !194)
!209 = distinct !{!209, !196, !210, !78}
!210 = !DILocation(line: 113, column: 13, scope: !191)
!211 = !DILocation(line: 116, column: 16, scope: !185)
!212 = !DILocation(line: 116, column: 9, scope: !185)
!213 = !DILocation(line: 117, column: 26, scope: !185)
!214 = !DILocation(line: 117, column: 9, scope: !185)
!215 = !DILocation(line: 118, column: 14, scope: !185)
!216 = !DILocation(line: 118, column: 9, scope: !185)
!217 = !DILocation(line: 120, column: 1, scope: !165)
