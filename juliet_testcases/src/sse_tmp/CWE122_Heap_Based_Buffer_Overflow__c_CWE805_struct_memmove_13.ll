; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !31
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !38

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !57
  %cmp4 = icmp ult i64 %3, 100, !dbg !59
  br i1 %cmp4, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %6, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !77
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !77
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !77
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !77
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !79
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !80
  call void @free(i8* %12) #6, !dbg !81
  ret void, !dbg !82
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13_good() #0 !dbg !83 {
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
  %call = call i64 @time(i64* null) #6, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #6, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !110
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !111
  %cmp = icmp ne i32 %0, 5, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end3, !dbg !117

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !118
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !120
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !125

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !137
  %cmp4 = icmp ult i64 %3, 100, !dbg !139
  br i1 %cmp4, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !143
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !144
  store i32 0, i32* %intOne, align 8, !dbg !145
  %5 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !147
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !148
  store i32 0, i32* %intTwo, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %6, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !156
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !156
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !156
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !156
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !157
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !157
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !158
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !159
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !159
  call void @free(i8* %12) #6, !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !163, metadata !DIExpression()), !dbg !164
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !165
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !166
  %cmp = icmp eq i32 %0, 5, !dbg !168
  br i1 %cmp, label %if.then, label %if.end3, !dbg !169

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !170
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !172
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !173
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !174
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !176
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !177

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !178
  unreachable, !dbg !178

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !180

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !181, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !186
  store i64 0, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !190
  %cmp4 = icmp ult i64 %3, 100, !dbg !192
  br i1 %cmp4, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !196
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !197
  store i32 0, i32* %intOne, align 8, !dbg !198
  %5 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !200
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !201
  store i32 0, i32* %intTwo, align 4, !dbg !202
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !204
  %inc = add i64 %6, 1, !dbg !204
  store i64 %inc, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !208
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !209
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !209
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !209
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !209
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !210
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !210
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !211
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !212
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !212
  call void @free(i8* %12) #6, !dbg !213
  ret void, !dbg !214
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 25, column: 8)
!29 = !DILocation(line: 25, column: 25, scope: !28)
!30 = !DILocation(line: 25, column: 8, scope: !20)
!31 = !DILocation(line: 28, column: 33, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !21, line: 26, column: 5)
!33 = !DILocation(line: 28, column: 16, scope: !32)
!34 = !DILocation(line: 28, column: 14, scope: !32)
!35 = !DILocation(line: 29, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !21, line: 29, column: 13)
!37 = !DILocation(line: 29, column: 18, scope: !36)
!38 = !DILocation(line: 29, column: 13, scope: !32)
!39 = !DILocation(line: 29, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !21, line: 29, column: 27)
!41 = !DILocation(line: 30, column: 5, scope: !32)
!42 = !DILocalVariable(name: "source", scope: !43, file: !21, line: 32, type: !44)
!43 = distinct !DILexicalBlock(scope: !20, file: !21, line: 31, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 32, column: 23, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !49, file: !21, line: 34, type: !50)
!49 = distinct !DILexicalBlock(scope: !43, file: !21, line: 33, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 34, column: 20, scope: !49)
!54 = !DILocation(line: 36, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !21, line: 36, column: 13)
!56 = !DILocation(line: 36, column: 18, scope: !55)
!57 = !DILocation(line: 36, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !21, line: 36, column: 13)
!59 = !DILocation(line: 36, column: 27, scope: !58)
!60 = !DILocation(line: 36, column: 13, scope: !55)
!61 = !DILocation(line: 38, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !21, line: 37, column: 13)
!63 = !DILocation(line: 38, column: 17, scope: !62)
!64 = !DILocation(line: 38, column: 27, scope: !62)
!65 = !DILocation(line: 38, column: 34, scope: !62)
!66 = !DILocation(line: 39, column: 24, scope: !62)
!67 = !DILocation(line: 39, column: 17, scope: !62)
!68 = !DILocation(line: 39, column: 27, scope: !62)
!69 = !DILocation(line: 39, column: 34, scope: !62)
!70 = !DILocation(line: 40, column: 13, scope: !62)
!71 = !DILocation(line: 36, column: 35, scope: !58)
!72 = !DILocation(line: 36, column: 13, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 40, column: 13, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 43, column: 17, scope: !43)
!77 = !DILocation(line: 43, column: 9, scope: !43)
!78 = !DILocation(line: 44, column: 26, scope: !43)
!79 = !DILocation(line: 44, column: 9, scope: !43)
!80 = !DILocation(line: 45, column: 14, scope: !43)
!81 = !DILocation(line: 45, column: 9, scope: !43)
!82 = !DILocation(line: 47, column: 1, scope: !20)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_13_good", scope: !21, file: !21, line: 116, type: !22, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 118, column: 5, scope: !83)
!85 = !DILocation(line: 119, column: 5, scope: !83)
!86 = !DILocation(line: 120, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 132, type: !88, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!10, !10, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !21, line: 132, type: !10)
!94 = !DILocation(line: 132, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !21, line: 132, type: !90)
!96 = !DILocation(line: 132, column: 27, scope: !87)
!97 = !DILocation(line: 135, column: 22, scope: !87)
!98 = !DILocation(line: 135, column: 12, scope: !87)
!99 = !DILocation(line: 135, column: 5, scope: !87)
!100 = !DILocation(line: 137, column: 5, scope: !87)
!101 = !DILocation(line: 138, column: 5, scope: !87)
!102 = !DILocation(line: 139, column: 5, scope: !87)
!103 = !DILocation(line: 142, column: 5, scope: !87)
!104 = !DILocation(line: 143, column: 5, scope: !87)
!105 = !DILocation(line: 144, column: 5, scope: !87)
!106 = !DILocation(line: 146, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !21, line: 56, type: !4)
!109 = !DILocation(line: 56, column: 21, scope: !107)
!110 = !DILocation(line: 57, column: 10, scope: !107)
!111 = !DILocation(line: 58, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !21, line: 58, column: 8)
!113 = !DILocation(line: 58, column: 25, scope: !112)
!114 = !DILocation(line: 58, column: 8, scope: !107)
!115 = !DILocation(line: 61, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !21, line: 59, column: 5)
!117 = !DILocation(line: 62, column: 5, scope: !116)
!118 = !DILocation(line: 66, column: 33, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !21, line: 64, column: 5)
!120 = !DILocation(line: 66, column: 16, scope: !119)
!121 = !DILocation(line: 66, column: 14, scope: !119)
!122 = !DILocation(line: 67, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !21, line: 67, column: 13)
!124 = !DILocation(line: 67, column: 18, scope: !123)
!125 = !DILocation(line: 67, column: 13, scope: !119)
!126 = !DILocation(line: 67, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !21, line: 67, column: 27)
!128 = !DILocalVariable(name: "source", scope: !129, file: !21, line: 70, type: !44)
!129 = distinct !DILexicalBlock(scope: !107, file: !21, line: 69, column: 5)
!130 = !DILocation(line: 70, column: 23, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !21, line: 72, type: !50)
!132 = distinct !DILexicalBlock(scope: !129, file: !21, line: 71, column: 9)
!133 = !DILocation(line: 72, column: 20, scope: !132)
!134 = !DILocation(line: 74, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !21, line: 74, column: 13)
!136 = !DILocation(line: 74, column: 18, scope: !135)
!137 = !DILocation(line: 74, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !21, line: 74, column: 13)
!139 = !DILocation(line: 74, column: 27, scope: !138)
!140 = !DILocation(line: 74, column: 13, scope: !135)
!141 = !DILocation(line: 76, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !21, line: 75, column: 13)
!143 = !DILocation(line: 76, column: 17, scope: !142)
!144 = !DILocation(line: 76, column: 27, scope: !142)
!145 = !DILocation(line: 76, column: 34, scope: !142)
!146 = !DILocation(line: 77, column: 24, scope: !142)
!147 = !DILocation(line: 77, column: 17, scope: !142)
!148 = !DILocation(line: 77, column: 27, scope: !142)
!149 = !DILocation(line: 77, column: 34, scope: !142)
!150 = !DILocation(line: 78, column: 13, scope: !142)
!151 = !DILocation(line: 74, column: 35, scope: !138)
!152 = !DILocation(line: 74, column: 13, scope: !138)
!153 = distinct !{!153, !140, !154, !75}
!154 = !DILocation(line: 78, column: 13, scope: !135)
!155 = !DILocation(line: 81, column: 17, scope: !129)
!156 = !DILocation(line: 81, column: 9, scope: !129)
!157 = !DILocation(line: 82, column: 26, scope: !129)
!158 = !DILocation(line: 82, column: 9, scope: !129)
!159 = !DILocation(line: 83, column: 14, scope: !129)
!160 = !DILocation(line: 83, column: 9, scope: !129)
!161 = !DILocation(line: 85, column: 1, scope: !107)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 88, type: !22, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!163 = !DILocalVariable(name: "data", scope: !162, file: !21, line: 90, type: !4)
!164 = !DILocation(line: 90, column: 21, scope: !162)
!165 = !DILocation(line: 91, column: 10, scope: !162)
!166 = !DILocation(line: 92, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !21, line: 92, column: 8)
!168 = !DILocation(line: 92, column: 25, scope: !167)
!169 = !DILocation(line: 92, column: 8, scope: !162)
!170 = !DILocation(line: 95, column: 33, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !21, line: 93, column: 5)
!172 = !DILocation(line: 95, column: 16, scope: !171)
!173 = !DILocation(line: 95, column: 14, scope: !171)
!174 = !DILocation(line: 96, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !21, line: 96, column: 13)
!176 = !DILocation(line: 96, column: 18, scope: !175)
!177 = !DILocation(line: 96, column: 13, scope: !171)
!178 = !DILocation(line: 96, column: 28, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !21, line: 96, column: 27)
!180 = !DILocation(line: 97, column: 5, scope: !171)
!181 = !DILocalVariable(name: "source", scope: !182, file: !21, line: 99, type: !44)
!182 = distinct !DILexicalBlock(scope: !162, file: !21, line: 98, column: 5)
!183 = !DILocation(line: 99, column: 23, scope: !182)
!184 = !DILocalVariable(name: "i", scope: !185, file: !21, line: 101, type: !50)
!185 = distinct !DILexicalBlock(scope: !182, file: !21, line: 100, column: 9)
!186 = !DILocation(line: 101, column: 20, scope: !185)
!187 = !DILocation(line: 103, column: 20, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !21, line: 103, column: 13)
!189 = !DILocation(line: 103, column: 18, scope: !188)
!190 = !DILocation(line: 103, column: 25, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !21, line: 103, column: 13)
!192 = !DILocation(line: 103, column: 27, scope: !191)
!193 = !DILocation(line: 103, column: 13, scope: !188)
!194 = !DILocation(line: 105, column: 24, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !21, line: 104, column: 13)
!196 = !DILocation(line: 105, column: 17, scope: !195)
!197 = !DILocation(line: 105, column: 27, scope: !195)
!198 = !DILocation(line: 105, column: 34, scope: !195)
!199 = !DILocation(line: 106, column: 24, scope: !195)
!200 = !DILocation(line: 106, column: 17, scope: !195)
!201 = !DILocation(line: 106, column: 27, scope: !195)
!202 = !DILocation(line: 106, column: 34, scope: !195)
!203 = !DILocation(line: 107, column: 13, scope: !195)
!204 = !DILocation(line: 103, column: 35, scope: !191)
!205 = !DILocation(line: 103, column: 13, scope: !191)
!206 = distinct !{!206, !193, !207, !75}
!207 = !DILocation(line: 107, column: 13, scope: !188)
!208 = !DILocation(line: 110, column: 17, scope: !182)
!209 = !DILocation(line: 110, column: 9, scope: !182)
!210 = !DILocation(line: 111, column: 26, scope: !182)
!211 = !DILocation(line: 111, column: 9, scope: !182)
!212 = !DILocation(line: 112, column: 14, scope: !182)
!213 = !DILocation(line: 112, column: 9, scope: !182)
!214 = !DILocation(line: 114, column: 1, scope: !162)
