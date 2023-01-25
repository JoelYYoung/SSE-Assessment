; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !36
  br i1 %cmp, label %if.then1, label %if.end, !dbg !37

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !40

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !56
  %cmp3 = icmp ult i64 %3, 100, !dbg !58
  br i1 %cmp3, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %6, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !76
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !76
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !76
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !76
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !77
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !78
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !79
  call void @free(i8* %12) #6, !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #6, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #6, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %0 = load i32, i32* @globalFalse, align 4, !dbg !110
  %tobool = icmp ne i32 %0, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end2, !dbg !115

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !116
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !118
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !119
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !122
  br i1 %cmp, label %if.then1, label %if.end, !dbg !123

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !135
  %cmp3 = icmp ult i64 %3, 100, !dbg !137
  br i1 %cmp3, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !141
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !142
  store i32 0, i32* %intOne, align 8, !dbg !143
  %5 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !145
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !146
  store i32 0, i32* %intTwo, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %6, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !153
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !154
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !154
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !154
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !154
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !155
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !156
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !157
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !157
  call void @free(i8* %12) #6, !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !160 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !161, metadata !DIExpression()), !dbg !162
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !163
  %0 = load i32, i32* @globalTrue, align 4, !dbg !164
  %tobool = icmp ne i32 %0, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.end2, !dbg !166

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !167
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !169
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !170
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !171
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !173
  br i1 %cmp, label %if.then1, label %if.end, !dbg !174

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !175
  unreachable, !dbg !175

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !177

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %i, metadata !181, metadata !DIExpression()), !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !187
  %cmp3 = icmp ult i64 %3, 100, !dbg !189
  br i1 %cmp3, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !193
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !194
  store i32 0, i32* %intOne, align 8, !dbg !195
  %5 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !197
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !198
  store i32 0, i32* %intTwo, align 4, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !201
  %inc = add i64 %6, 1, !dbg !201
  store i64 %inc, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !205
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !206
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !206
  %9 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !206
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 800, i1 false), !dbg !206
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !207
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !207
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !208
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !209
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !209
  call void @free(i8* %12) #6, !dbg !210
  ret void, !dbg !211
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 25, column: 8)
!29 = !DILocation(line: 25, column: 8, scope: !20)
!30 = !DILocation(line: 28, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !21, line: 26, column: 5)
!32 = !DILocation(line: 28, column: 16, scope: !31)
!33 = !DILocation(line: 28, column: 14, scope: !31)
!34 = !DILocation(line: 29, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 29, column: 13)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 13, scope: !31)
!38 = !DILocation(line: 29, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !21, line: 29, column: 27)
!40 = !DILocation(line: 30, column: 5, scope: !31)
!41 = !DILocalVariable(name: "source", scope: !42, file: !21, line: 32, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !21, line: 31, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 32, column: 23, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !21, line: 34, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !21, line: 33, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 34, column: 20, scope: !48)
!53 = !DILocation(line: 36, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !21, line: 36, column: 13)
!55 = !DILocation(line: 36, column: 18, scope: !54)
!56 = !DILocation(line: 36, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !21, line: 36, column: 13)
!58 = !DILocation(line: 36, column: 27, scope: !57)
!59 = !DILocation(line: 36, column: 13, scope: !54)
!60 = !DILocation(line: 38, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !21, line: 37, column: 13)
!62 = !DILocation(line: 38, column: 17, scope: !61)
!63 = !DILocation(line: 38, column: 27, scope: !61)
!64 = !DILocation(line: 38, column: 34, scope: !61)
!65 = !DILocation(line: 39, column: 24, scope: !61)
!66 = !DILocation(line: 39, column: 17, scope: !61)
!67 = !DILocation(line: 39, column: 27, scope: !61)
!68 = !DILocation(line: 39, column: 34, scope: !61)
!69 = !DILocation(line: 40, column: 13, scope: !61)
!70 = !DILocation(line: 36, column: 35, scope: !57)
!71 = !DILocation(line: 36, column: 13, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 40, column: 13, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 43, column: 17, scope: !42)
!76 = !DILocation(line: 43, column: 9, scope: !42)
!77 = !DILocation(line: 44, column: 26, scope: !42)
!78 = !DILocation(line: 44, column: 9, scope: !42)
!79 = !DILocation(line: 45, column: 14, scope: !42)
!80 = !DILocation(line: 45, column: 9, scope: !42)
!81 = !DILocation(line: 47, column: 1, scope: !20)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_10_good", scope: !21, file: !21, line: 116, type: !22, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 118, column: 5, scope: !82)
!84 = !DILocation(line: 119, column: 5, scope: !82)
!85 = !DILocation(line: 120, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 132, type: !87, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!10, !10, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !21, line: 132, type: !10)
!93 = !DILocation(line: 132, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !21, line: 132, type: !89)
!95 = !DILocation(line: 132, column: 27, scope: !86)
!96 = !DILocation(line: 135, column: 22, scope: !86)
!97 = !DILocation(line: 135, column: 12, scope: !86)
!98 = !DILocation(line: 135, column: 5, scope: !86)
!99 = !DILocation(line: 137, column: 5, scope: !86)
!100 = !DILocation(line: 138, column: 5, scope: !86)
!101 = !DILocation(line: 139, column: 5, scope: !86)
!102 = !DILocation(line: 142, column: 5, scope: !86)
!103 = !DILocation(line: 143, column: 5, scope: !86)
!104 = !DILocation(line: 144, column: 5, scope: !86)
!105 = !DILocation(line: 146, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !21, line: 56, type: !4)
!108 = !DILocation(line: 56, column: 21, scope: !106)
!109 = !DILocation(line: 57, column: 10, scope: !106)
!110 = !DILocation(line: 58, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !21, line: 58, column: 8)
!112 = !DILocation(line: 58, column: 8, scope: !106)
!113 = !DILocation(line: 61, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !21, line: 59, column: 5)
!115 = !DILocation(line: 62, column: 5, scope: !114)
!116 = !DILocation(line: 66, column: 33, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !21, line: 64, column: 5)
!118 = !DILocation(line: 66, column: 16, scope: !117)
!119 = !DILocation(line: 66, column: 14, scope: !117)
!120 = !DILocation(line: 67, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !21, line: 67, column: 13)
!122 = !DILocation(line: 67, column: 18, scope: !121)
!123 = !DILocation(line: 67, column: 13, scope: !117)
!124 = !DILocation(line: 67, column: 28, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !21, line: 67, column: 27)
!126 = !DILocalVariable(name: "source", scope: !127, file: !21, line: 70, type: !43)
!127 = distinct !DILexicalBlock(scope: !106, file: !21, line: 69, column: 5)
!128 = !DILocation(line: 70, column: 23, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !130, file: !21, line: 72, type: !49)
!130 = distinct !DILexicalBlock(scope: !127, file: !21, line: 71, column: 9)
!131 = !DILocation(line: 72, column: 20, scope: !130)
!132 = !DILocation(line: 74, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !21, line: 74, column: 13)
!134 = !DILocation(line: 74, column: 18, scope: !133)
!135 = !DILocation(line: 74, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !21, line: 74, column: 13)
!137 = !DILocation(line: 74, column: 27, scope: !136)
!138 = !DILocation(line: 74, column: 13, scope: !133)
!139 = !DILocation(line: 76, column: 24, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !21, line: 75, column: 13)
!141 = !DILocation(line: 76, column: 17, scope: !140)
!142 = !DILocation(line: 76, column: 27, scope: !140)
!143 = !DILocation(line: 76, column: 34, scope: !140)
!144 = !DILocation(line: 77, column: 24, scope: !140)
!145 = !DILocation(line: 77, column: 17, scope: !140)
!146 = !DILocation(line: 77, column: 27, scope: !140)
!147 = !DILocation(line: 77, column: 34, scope: !140)
!148 = !DILocation(line: 78, column: 13, scope: !140)
!149 = !DILocation(line: 74, column: 35, scope: !136)
!150 = !DILocation(line: 74, column: 13, scope: !136)
!151 = distinct !{!151, !138, !152, !74}
!152 = !DILocation(line: 78, column: 13, scope: !133)
!153 = !DILocation(line: 81, column: 17, scope: !127)
!154 = !DILocation(line: 81, column: 9, scope: !127)
!155 = !DILocation(line: 82, column: 26, scope: !127)
!156 = !DILocation(line: 82, column: 9, scope: !127)
!157 = !DILocation(line: 83, column: 14, scope: !127)
!158 = !DILocation(line: 83, column: 9, scope: !127)
!159 = !DILocation(line: 85, column: 1, scope: !106)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 88, type: !22, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DILocalVariable(name: "data", scope: !160, file: !21, line: 90, type: !4)
!162 = !DILocation(line: 90, column: 21, scope: !160)
!163 = !DILocation(line: 91, column: 10, scope: !160)
!164 = !DILocation(line: 92, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !21, line: 92, column: 8)
!166 = !DILocation(line: 92, column: 8, scope: !160)
!167 = !DILocation(line: 95, column: 33, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !21, line: 93, column: 5)
!169 = !DILocation(line: 95, column: 16, scope: !168)
!170 = !DILocation(line: 95, column: 14, scope: !168)
!171 = !DILocation(line: 96, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !21, line: 96, column: 13)
!173 = !DILocation(line: 96, column: 18, scope: !172)
!174 = !DILocation(line: 96, column: 13, scope: !168)
!175 = !DILocation(line: 96, column: 28, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !21, line: 96, column: 27)
!177 = !DILocation(line: 97, column: 5, scope: !168)
!178 = !DILocalVariable(name: "source", scope: !179, file: !21, line: 99, type: !43)
!179 = distinct !DILexicalBlock(scope: !160, file: !21, line: 98, column: 5)
!180 = !DILocation(line: 99, column: 23, scope: !179)
!181 = !DILocalVariable(name: "i", scope: !182, file: !21, line: 101, type: !49)
!182 = distinct !DILexicalBlock(scope: !179, file: !21, line: 100, column: 9)
!183 = !DILocation(line: 101, column: 20, scope: !182)
!184 = !DILocation(line: 103, column: 20, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !21, line: 103, column: 13)
!186 = !DILocation(line: 103, column: 18, scope: !185)
!187 = !DILocation(line: 103, column: 25, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !21, line: 103, column: 13)
!189 = !DILocation(line: 103, column: 27, scope: !188)
!190 = !DILocation(line: 103, column: 13, scope: !185)
!191 = !DILocation(line: 105, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !21, line: 104, column: 13)
!193 = !DILocation(line: 105, column: 17, scope: !192)
!194 = !DILocation(line: 105, column: 27, scope: !192)
!195 = !DILocation(line: 105, column: 34, scope: !192)
!196 = !DILocation(line: 106, column: 24, scope: !192)
!197 = !DILocation(line: 106, column: 17, scope: !192)
!198 = !DILocation(line: 106, column: 27, scope: !192)
!199 = !DILocation(line: 106, column: 34, scope: !192)
!200 = !DILocation(line: 107, column: 13, scope: !192)
!201 = !DILocation(line: 103, column: 35, scope: !188)
!202 = !DILocation(line: 103, column: 13, scope: !188)
!203 = distinct !{!203, !190, !204, !74}
!204 = !DILocation(line: 107, column: 13, scope: !185)
!205 = !DILocation(line: 110, column: 17, scope: !179)
!206 = !DILocation(line: 110, column: 9, scope: !179)
!207 = !DILocation(line: 111, column: 26, scope: !179)
!208 = !DILocation(line: 111, column: 9, scope: !179)
!209 = !DILocation(line: 112, column: 14, scope: !179)
!210 = !DILocation(line: 112, column: 9, scope: !179)
!211 = !DILocation(line: 114, column: 1, scope: !160)
