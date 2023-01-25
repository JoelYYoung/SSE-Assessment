; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !17
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05_bad() #0 !dbg !26 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end2, !dbg !34

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !35
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !41
  br i1 %cmp, label %if.then1, label %if.end, !dbg !42

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !45

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !61
  %cmp3 = icmp ult i64 %3, 100, !dbg !63
  br i1 %cmp3, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !67
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !68
  store i32 0, i32* %intOne, align 8, !dbg !69
  %5 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !71
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !72
  store i32 0, i32* %intTwo, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %6, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !81
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !81
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !81
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !81
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !82
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !83
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !84
  call void @free(i8* %12) #6, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #6, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #6, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %0 = load i32, i32* @staticFalse, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end2, !dbg !120

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !121
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !123
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !127
  br i1 %cmp, label %if.then1, label %if.end, !dbg !128

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !140
  %cmp3 = icmp ult i64 %3, 100, !dbg !142
  br i1 %cmp3, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !146
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !147
  store i32 0, i32* %intOne, align 8, !dbg !148
  %5 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !150
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !151
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !159
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !160
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !161
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !169
  %tobool = icmp ne i32 %0, 0, !dbg !169
  br i1 %tobool, label %if.then, label %if.end2, !dbg !171

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !172
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !174
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !175
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !178
  br i1 %cmp, label %if.then1, label %if.end, !dbg !179

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !182

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %i, metadata !186, metadata !DIExpression()), !dbg !188
  store i64 0, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !192
  %cmp3 = icmp ult i64 %3, 100, !dbg !194
  br i1 %cmp3, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !198
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !199
  store i32 0, i32* %intOne, align 8, !dbg !200
  %5 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !202
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !203
  store i32 0, i32* %intTwo, align 4, !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !206
  %inc = add i64 %6, 1, !dbg !206
  store i64 %inc, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !210
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !211
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !211
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !211
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !211
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !212
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !212
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !213
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !214
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !214
  call void @free(i8* %12) #6, !dbg !215
  ret void, !dbg !216
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
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !19, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14, !15}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0, !17}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !19, line: 24, type: !12, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05_bad", scope: !19, file: !19, line: 28, type: !27, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !19, line: 30, type: !6)
!30 = !DILocation(line: 30, column: 21, scope: !26)
!31 = !DILocation(line: 31, column: 10, scope: !26)
!32 = !DILocation(line: 32, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !19, line: 32, column: 8)
!34 = !DILocation(line: 32, column: 8, scope: !26)
!35 = !DILocation(line: 35, column: 33, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !19, line: 33, column: 5)
!37 = !DILocation(line: 35, column: 16, scope: !36)
!38 = !DILocation(line: 35, column: 14, scope: !36)
!39 = !DILocation(line: 36, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 36, column: 13)
!41 = !DILocation(line: 36, column: 18, scope: !40)
!42 = !DILocation(line: 36, column: 13, scope: !36)
!43 = !DILocation(line: 36, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 36, column: 27)
!45 = !DILocation(line: 37, column: 5, scope: !36)
!46 = !DILocalVariable(name: "source", scope: !47, file: !19, line: 39, type: !48)
!47 = distinct !DILexicalBlock(scope: !26, file: !19, line: 38, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 39, column: 23, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !53, file: !19, line: 41, type: !54)
!53 = distinct !DILexicalBlock(scope: !47, file: !19, line: 40, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 41, column: 20, scope: !53)
!58 = !DILocation(line: 43, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !19, line: 43, column: 13)
!60 = !DILocation(line: 43, column: 18, scope: !59)
!61 = !DILocation(line: 43, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !19, line: 43, column: 13)
!63 = !DILocation(line: 43, column: 27, scope: !62)
!64 = !DILocation(line: 43, column: 13, scope: !59)
!65 = !DILocation(line: 45, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !19, line: 44, column: 13)
!67 = !DILocation(line: 45, column: 17, scope: !66)
!68 = !DILocation(line: 45, column: 27, scope: !66)
!69 = !DILocation(line: 45, column: 34, scope: !66)
!70 = !DILocation(line: 46, column: 24, scope: !66)
!71 = !DILocation(line: 46, column: 17, scope: !66)
!72 = !DILocation(line: 46, column: 27, scope: !66)
!73 = !DILocation(line: 46, column: 34, scope: !66)
!74 = !DILocation(line: 47, column: 13, scope: !66)
!75 = !DILocation(line: 43, column: 35, scope: !62)
!76 = !DILocation(line: 43, column: 13, scope: !62)
!77 = distinct !{!77, !64, !78, !79}
!78 = !DILocation(line: 47, column: 13, scope: !59)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 50, column: 17, scope: !47)
!81 = !DILocation(line: 50, column: 9, scope: !47)
!82 = !DILocation(line: 51, column: 26, scope: !47)
!83 = !DILocation(line: 51, column: 9, scope: !47)
!84 = !DILocation(line: 52, column: 14, scope: !47)
!85 = !DILocation(line: 52, column: 9, scope: !47)
!86 = !DILocation(line: 54, column: 1, scope: !26)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_05_good", scope: !19, file: !19, line: 123, type: !27, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 125, column: 5, scope: !87)
!89 = !DILocation(line: 126, column: 5, scope: !87)
!90 = !DILocation(line: 127, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 139, type: !92, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DISubroutineType(types: !93)
!93 = !{!12, !12, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !19, line: 139, type: !12)
!98 = !DILocation(line: 139, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !19, line: 139, type: !94)
!100 = !DILocation(line: 139, column: 27, scope: !91)
!101 = !DILocation(line: 142, column: 22, scope: !91)
!102 = !DILocation(line: 142, column: 12, scope: !91)
!103 = !DILocation(line: 142, column: 5, scope: !91)
!104 = !DILocation(line: 144, column: 5, scope: !91)
!105 = !DILocation(line: 145, column: 5, scope: !91)
!106 = !DILocation(line: 146, column: 5, scope: !91)
!107 = !DILocation(line: 149, column: 5, scope: !91)
!108 = !DILocation(line: 150, column: 5, scope: !91)
!109 = !DILocation(line: 151, column: 5, scope: !91)
!110 = !DILocation(line: 153, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 61, type: !27, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !19, line: 63, type: !6)
!113 = !DILocation(line: 63, column: 21, scope: !111)
!114 = !DILocation(line: 64, column: 10, scope: !111)
!115 = !DILocation(line: 65, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !19, line: 65, column: 8)
!117 = !DILocation(line: 65, column: 8, scope: !111)
!118 = !DILocation(line: 68, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !19, line: 66, column: 5)
!120 = !DILocation(line: 69, column: 5, scope: !119)
!121 = !DILocation(line: 73, column: 33, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !19, line: 71, column: 5)
!123 = !DILocation(line: 73, column: 16, scope: !122)
!124 = !DILocation(line: 73, column: 14, scope: !122)
!125 = !DILocation(line: 74, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !19, line: 74, column: 13)
!127 = !DILocation(line: 74, column: 18, scope: !126)
!128 = !DILocation(line: 74, column: 13, scope: !122)
!129 = !DILocation(line: 74, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !19, line: 74, column: 27)
!131 = !DILocalVariable(name: "source", scope: !132, file: !19, line: 77, type: !48)
!132 = distinct !DILexicalBlock(scope: !111, file: !19, line: 76, column: 5)
!133 = !DILocation(line: 77, column: 23, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !19, line: 79, type: !54)
!135 = distinct !DILexicalBlock(scope: !132, file: !19, line: 78, column: 9)
!136 = !DILocation(line: 79, column: 20, scope: !135)
!137 = !DILocation(line: 81, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !19, line: 81, column: 13)
!139 = !DILocation(line: 81, column: 18, scope: !138)
!140 = !DILocation(line: 81, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !19, line: 81, column: 13)
!142 = !DILocation(line: 81, column: 27, scope: !141)
!143 = !DILocation(line: 81, column: 13, scope: !138)
!144 = !DILocation(line: 83, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !19, line: 82, column: 13)
!146 = !DILocation(line: 83, column: 17, scope: !145)
!147 = !DILocation(line: 83, column: 27, scope: !145)
!148 = !DILocation(line: 83, column: 34, scope: !145)
!149 = !DILocation(line: 84, column: 24, scope: !145)
!150 = !DILocation(line: 84, column: 17, scope: !145)
!151 = !DILocation(line: 84, column: 27, scope: !145)
!152 = !DILocation(line: 84, column: 34, scope: !145)
!153 = !DILocation(line: 85, column: 13, scope: !145)
!154 = !DILocation(line: 81, column: 35, scope: !141)
!155 = !DILocation(line: 81, column: 13, scope: !141)
!156 = distinct !{!156, !143, !157, !79}
!157 = !DILocation(line: 85, column: 13, scope: !138)
!158 = !DILocation(line: 88, column: 17, scope: !132)
!159 = !DILocation(line: 88, column: 9, scope: !132)
!160 = !DILocation(line: 89, column: 26, scope: !132)
!161 = !DILocation(line: 89, column: 9, scope: !132)
!162 = !DILocation(line: 90, column: 14, scope: !132)
!163 = !DILocation(line: 90, column: 9, scope: !132)
!164 = !DILocation(line: 92, column: 1, scope: !111)
!165 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 95, type: !27, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!166 = !DILocalVariable(name: "data", scope: !165, file: !19, line: 97, type: !6)
!167 = !DILocation(line: 97, column: 21, scope: !165)
!168 = !DILocation(line: 98, column: 10, scope: !165)
!169 = !DILocation(line: 99, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !165, file: !19, line: 99, column: 8)
!171 = !DILocation(line: 99, column: 8, scope: !165)
!172 = !DILocation(line: 102, column: 33, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !19, line: 100, column: 5)
!174 = !DILocation(line: 102, column: 16, scope: !173)
!175 = !DILocation(line: 102, column: 14, scope: !173)
!176 = !DILocation(line: 103, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !19, line: 103, column: 13)
!178 = !DILocation(line: 103, column: 18, scope: !177)
!179 = !DILocation(line: 103, column: 13, scope: !173)
!180 = !DILocation(line: 103, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !19, line: 103, column: 27)
!182 = !DILocation(line: 104, column: 5, scope: !173)
!183 = !DILocalVariable(name: "source", scope: !184, file: !19, line: 106, type: !48)
!184 = distinct !DILexicalBlock(scope: !165, file: !19, line: 105, column: 5)
!185 = !DILocation(line: 106, column: 23, scope: !184)
!186 = !DILocalVariable(name: "i", scope: !187, file: !19, line: 108, type: !54)
!187 = distinct !DILexicalBlock(scope: !184, file: !19, line: 107, column: 9)
!188 = !DILocation(line: 108, column: 20, scope: !187)
!189 = !DILocation(line: 110, column: 20, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !19, line: 110, column: 13)
!191 = !DILocation(line: 110, column: 18, scope: !190)
!192 = !DILocation(line: 110, column: 25, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !19, line: 110, column: 13)
!194 = !DILocation(line: 110, column: 27, scope: !193)
!195 = !DILocation(line: 110, column: 13, scope: !190)
!196 = !DILocation(line: 112, column: 24, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !19, line: 111, column: 13)
!198 = !DILocation(line: 112, column: 17, scope: !197)
!199 = !DILocation(line: 112, column: 27, scope: !197)
!200 = !DILocation(line: 112, column: 34, scope: !197)
!201 = !DILocation(line: 113, column: 24, scope: !197)
!202 = !DILocation(line: 113, column: 17, scope: !197)
!203 = !DILocation(line: 113, column: 27, scope: !197)
!204 = !DILocation(line: 113, column: 34, scope: !197)
!205 = !DILocation(line: 114, column: 13, scope: !197)
!206 = !DILocation(line: 110, column: 35, scope: !193)
!207 = !DILocation(line: 110, column: 13, scope: !193)
!208 = distinct !{!208, !195, !209, !79}
!209 = !DILocation(line: 114, column: 13, scope: !190)
!210 = !DILocation(line: 117, column: 17, scope: !184)
!211 = !DILocation(line: 117, column: 9, scope: !184)
!212 = !DILocation(line: 118, column: 26, scope: !184)
!213 = !DILocation(line: 118, column: 9, scope: !184)
!214 = !DILocation(line: 119, column: 14, scope: !184)
!215 = !DILocation(line: 119, column: 9, scope: !184)
!216 = !DILocation(line: 121, column: 1, scope: !165)
