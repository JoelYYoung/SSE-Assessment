; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !26, metadata !DIExpression()), !dbg !28
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !35
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !36
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !37
  %2 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data1, align 8, !dbg !39
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !40
  %cmp = icmp eq %struct._twoIntsStruct* %3, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !46
  %5 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !47
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %5, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !49, metadata !DIExpression()), !dbg !51
  %6 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !52
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %6, align 8, !dbg !53
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %data2, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !54, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %i, metadata !60, metadata !DIExpression()), !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !69
  %cmp3 = icmp ult i64 %8, 100, !dbg !71
  br i1 %cmp3, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !75
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !76
  store i32 0, i32* %intOne, align 8, !dbg !77
  %10 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !79
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !80
  store i32 0, i32* %intTwo, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %11, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i5, align 8, !dbg !91
  br label %for.cond6, !dbg !93

for.cond6:                                        ; preds = %for.inc11, %for.end
  %12 = load i64, i64* %i5, align 8, !dbg !94
  %cmp7 = icmp ult i64 %12, 100, !dbg !96
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !97

for.body8:                                        ; preds = %for.cond6
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !98
  %14 = load i64, i64* %i5, align 8, !dbg !100
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 %14, !dbg !98
  %15 = load i64, i64* %i5, align 8, !dbg !101
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %15, !dbg !102
  %16 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !102
  %17 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %16, i8* align 8 %17, i64 8, i1 false), !dbg !102
  br label %for.inc11, !dbg !103

for.inc11:                                        ; preds = %for.body8
  %18 = load i64, i64* %i5, align 8, !dbg !104
  %inc12 = add i64 %18, 1, !dbg !104
  store i64 %inc12, i64* %i5, align 8, !dbg !104
  br label %for.cond6, !dbg !105, !llvm.loop !106

for.end13:                                        ; preds = %for.cond6
  %19 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !108
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %19, i64 0, !dbg !108
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !109
  %20 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !110
  %21 = bitcast %struct._twoIntsStruct* %20 to i8*, !dbg !110
  call void @free(i8* %21) #6, !dbg !111
  ret void, !dbg !112
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32_good() #0 !dbg !113 {
entry:
  call void @goodG2B(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !122, metadata !DIExpression()), !dbg !123
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !124, metadata !DIExpression()), !dbg !125
  %call = call i64 @time(i64* null) #6, !dbg !126
  %conv = trunc i64 %call to i32, !dbg !127
  call void @srand(i32 %conv) #6, !dbg !128
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !129
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32_good(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32_bad(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !134
  ret i32 0, !dbg !135
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !136 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !139, metadata !DIExpression()), !dbg !140
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !141, metadata !DIExpression()), !dbg !142
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !142
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !144, metadata !DIExpression()), !dbg !146
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !147
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !148
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !146
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !149
  %2 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !150
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data1, align 8, !dbg !151
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !152
  %cmp = icmp eq %struct._twoIntsStruct* %3, null, !dbg !154
  br i1 %cmp, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !156
  unreachable, !dbg !156

if.end:                                           ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !158
  %5 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !159
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %5, align 8, !dbg !160
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !161, metadata !DIExpression()), !dbg !163
  %6 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !164
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %6, align 8, !dbg !165
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %data2, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !166, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !175
  %cmp3 = icmp ult i64 %8, 100, !dbg !177
  br i1 %cmp3, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !181
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !182
  store i32 0, i32* %intOne, align 8, !dbg !183
  %10 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !185
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !186
  store i32 0, i32* %intTwo, align 4, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %11, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !193, metadata !DIExpression()), !dbg !195
  store i64 0, i64* %i5, align 8, !dbg !196
  br label %for.cond6, !dbg !198

for.cond6:                                        ; preds = %for.inc11, %for.end
  %12 = load i64, i64* %i5, align 8, !dbg !199
  %cmp7 = icmp ult i64 %12, 100, !dbg !201
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !202

for.body8:                                        ; preds = %for.cond6
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !203
  %14 = load i64, i64* %i5, align 8, !dbg !205
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 %14, !dbg !203
  %15 = load i64, i64* %i5, align 8, !dbg !206
  %arrayidx10 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %15, !dbg !207
  %16 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !207
  %17 = bitcast %struct._twoIntsStruct* %arrayidx10 to i8*, !dbg !207
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %16, i8* align 8 %17, i64 8, i1 false), !dbg !207
  br label %for.inc11, !dbg !208

for.inc11:                                        ; preds = %for.body8
  %18 = load i64, i64* %i5, align 8, !dbg !209
  %inc12 = add i64 %18, 1, !dbg !209
  store i64 %inc12, i64* %i5, align 8, !dbg !209
  br label %for.cond6, !dbg !210, !llvm.loop !211

for.end13:                                        ; preds = %for.cond6
  %19 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !213
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %19, i64 0, !dbg !213
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx14), !dbg !214
  %20 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !215
  %21 = bitcast %struct._twoIntsStruct* %20 to i8*, !dbg !215
  call void @free(i8* %21) #6, !dbg !216
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocalVariable(name: "dataPtr1", scope: !20, file: !21, line: 24, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!28 = !DILocation(line: 24, column: 22, scope: !20)
!29 = !DILocalVariable(name: "dataPtr2", scope: !20, file: !21, line: 25, type: !27)
!30 = !DILocation(line: 25, column: 22, scope: !20)
!31 = !DILocation(line: 26, column: 10, scope: !20)
!32 = !DILocalVariable(name: "data", scope: !33, file: !21, line: 28, type: !4)
!33 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 5)
!34 = !DILocation(line: 28, column: 25, scope: !33)
!35 = !DILocation(line: 28, column: 33, scope: !33)
!36 = !DILocation(line: 28, column: 32, scope: !33)
!37 = !DILocation(line: 30, column: 33, scope: !33)
!38 = !DILocation(line: 30, column: 16, scope: !33)
!39 = !DILocation(line: 30, column: 14, scope: !33)
!40 = !DILocation(line: 31, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !21, line: 31, column: 13)
!42 = !DILocation(line: 31, column: 18, scope: !41)
!43 = !DILocation(line: 31, column: 13, scope: !33)
!44 = !DILocation(line: 31, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !21, line: 31, column: 27)
!46 = !DILocation(line: 32, column: 21, scope: !33)
!47 = !DILocation(line: 32, column: 10, scope: !33)
!48 = !DILocation(line: 32, column: 19, scope: !33)
!49 = !DILocalVariable(name: "data", scope: !50, file: !21, line: 35, type: !4)
!50 = distinct !DILexicalBlock(scope: !20, file: !21, line: 34, column: 5)
!51 = !DILocation(line: 35, column: 25, scope: !50)
!52 = !DILocation(line: 35, column: 33, scope: !50)
!53 = !DILocation(line: 35, column: 32, scope: !50)
!54 = !DILocalVariable(name: "source", scope: !55, file: !21, line: 37, type: !56)
!55 = distinct !DILexicalBlock(scope: !50, file: !21, line: 36, column: 9)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 37, column: 27, scope: !55)
!60 = !DILocalVariable(name: "i", scope: !61, file: !21, line: 39, type: !62)
!61 = distinct !DILexicalBlock(scope: !55, file: !21, line: 38, column: 13)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !63, line: 46, baseType: !64)
!63 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!64 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 39, column: 24, scope: !61)
!66 = !DILocation(line: 41, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !21, line: 41, column: 17)
!68 = !DILocation(line: 41, column: 22, scope: !67)
!69 = !DILocation(line: 41, column: 29, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !21, line: 41, column: 17)
!71 = !DILocation(line: 41, column: 31, scope: !70)
!72 = !DILocation(line: 41, column: 17, scope: !67)
!73 = !DILocation(line: 43, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !21, line: 42, column: 17)
!75 = !DILocation(line: 43, column: 21, scope: !74)
!76 = !DILocation(line: 43, column: 31, scope: !74)
!77 = !DILocation(line: 43, column: 38, scope: !74)
!78 = !DILocation(line: 44, column: 28, scope: !74)
!79 = !DILocation(line: 44, column: 21, scope: !74)
!80 = !DILocation(line: 44, column: 31, scope: !74)
!81 = !DILocation(line: 44, column: 38, scope: !74)
!82 = !DILocation(line: 45, column: 17, scope: !74)
!83 = !DILocation(line: 41, column: 39, scope: !70)
!84 = !DILocation(line: 41, column: 17, scope: !70)
!85 = distinct !{!85, !72, !86, !87}
!86 = !DILocation(line: 45, column: 17, scope: !67)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocalVariable(name: "i", scope: !89, file: !21, line: 48, type: !62)
!89 = distinct !DILexicalBlock(scope: !55, file: !21, line: 47, column: 13)
!90 = !DILocation(line: 48, column: 24, scope: !89)
!91 = !DILocation(line: 50, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !21, line: 50, column: 17)
!93 = !DILocation(line: 50, column: 22, scope: !92)
!94 = !DILocation(line: 50, column: 29, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !21, line: 50, column: 17)
!96 = !DILocation(line: 50, column: 31, scope: !95)
!97 = !DILocation(line: 50, column: 17, scope: !92)
!98 = !DILocation(line: 52, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !21, line: 51, column: 17)
!100 = !DILocation(line: 52, column: 26, scope: !99)
!101 = !DILocation(line: 52, column: 38, scope: !99)
!102 = !DILocation(line: 52, column: 31, scope: !99)
!103 = !DILocation(line: 53, column: 17, scope: !99)
!104 = !DILocation(line: 50, column: 39, scope: !95)
!105 = !DILocation(line: 50, column: 17, scope: !95)
!106 = distinct !{!106, !97, !107, !87}
!107 = !DILocation(line: 53, column: 17, scope: !92)
!108 = !DILocation(line: 54, column: 34, scope: !89)
!109 = !DILocation(line: 54, column: 17, scope: !89)
!110 = !DILocation(line: 55, column: 22, scope: !89)
!111 = !DILocation(line: 55, column: 17, scope: !89)
!112 = !DILocation(line: 59, column: 1, scope: !20)
!113 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_32_good", scope: !21, file: !21, line: 106, type: !22, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 108, column: 5, scope: !113)
!115 = !DILocation(line: 109, column: 1, scope: !113)
!116 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 120, type: !117, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!10, !10, !119}
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!122 = !DILocalVariable(name: "argc", arg: 1, scope: !116, file: !21, line: 120, type: !10)
!123 = !DILocation(line: 120, column: 14, scope: !116)
!124 = !DILocalVariable(name: "argv", arg: 2, scope: !116, file: !21, line: 120, type: !119)
!125 = !DILocation(line: 120, column: 27, scope: !116)
!126 = !DILocation(line: 123, column: 22, scope: !116)
!127 = !DILocation(line: 123, column: 12, scope: !116)
!128 = !DILocation(line: 123, column: 5, scope: !116)
!129 = !DILocation(line: 125, column: 5, scope: !116)
!130 = !DILocation(line: 126, column: 5, scope: !116)
!131 = !DILocation(line: 127, column: 5, scope: !116)
!132 = !DILocation(line: 130, column: 5, scope: !116)
!133 = !DILocation(line: 131, column: 5, scope: !116)
!134 = !DILocation(line: 132, column: 5, scope: !116)
!135 = !DILocation(line: 134, column: 5, scope: !116)
!136 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !21, line: 68, type: !4)
!138 = !DILocation(line: 68, column: 21, scope: !136)
!139 = !DILocalVariable(name: "dataPtr1", scope: !136, file: !21, line: 69, type: !27)
!140 = !DILocation(line: 69, column: 22, scope: !136)
!141 = !DILocalVariable(name: "dataPtr2", scope: !136, file: !21, line: 70, type: !27)
!142 = !DILocation(line: 70, column: 22, scope: !136)
!143 = !DILocation(line: 71, column: 10, scope: !136)
!144 = !DILocalVariable(name: "data", scope: !145, file: !21, line: 73, type: !4)
!145 = distinct !DILexicalBlock(scope: !136, file: !21, line: 72, column: 5)
!146 = !DILocation(line: 73, column: 25, scope: !145)
!147 = !DILocation(line: 73, column: 33, scope: !145)
!148 = !DILocation(line: 73, column: 32, scope: !145)
!149 = !DILocation(line: 75, column: 33, scope: !145)
!150 = !DILocation(line: 75, column: 16, scope: !145)
!151 = !DILocation(line: 75, column: 14, scope: !145)
!152 = !DILocation(line: 76, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !21, line: 76, column: 13)
!154 = !DILocation(line: 76, column: 18, scope: !153)
!155 = !DILocation(line: 76, column: 13, scope: !145)
!156 = !DILocation(line: 76, column: 28, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !21, line: 76, column: 27)
!158 = !DILocation(line: 77, column: 21, scope: !145)
!159 = !DILocation(line: 77, column: 10, scope: !145)
!160 = !DILocation(line: 77, column: 19, scope: !145)
!161 = !DILocalVariable(name: "data", scope: !162, file: !21, line: 80, type: !4)
!162 = distinct !DILexicalBlock(scope: !136, file: !21, line: 79, column: 5)
!163 = !DILocation(line: 80, column: 25, scope: !162)
!164 = !DILocation(line: 80, column: 33, scope: !162)
!165 = !DILocation(line: 80, column: 32, scope: !162)
!166 = !DILocalVariable(name: "source", scope: !167, file: !21, line: 82, type: !56)
!167 = distinct !DILexicalBlock(scope: !162, file: !21, line: 81, column: 9)
!168 = !DILocation(line: 82, column: 27, scope: !167)
!169 = !DILocalVariable(name: "i", scope: !170, file: !21, line: 84, type: !62)
!170 = distinct !DILexicalBlock(scope: !167, file: !21, line: 83, column: 13)
!171 = !DILocation(line: 84, column: 24, scope: !170)
!172 = !DILocation(line: 86, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !21, line: 86, column: 17)
!174 = !DILocation(line: 86, column: 22, scope: !173)
!175 = !DILocation(line: 86, column: 29, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !21, line: 86, column: 17)
!177 = !DILocation(line: 86, column: 31, scope: !176)
!178 = !DILocation(line: 86, column: 17, scope: !173)
!179 = !DILocation(line: 88, column: 28, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !21, line: 87, column: 17)
!181 = !DILocation(line: 88, column: 21, scope: !180)
!182 = !DILocation(line: 88, column: 31, scope: !180)
!183 = !DILocation(line: 88, column: 38, scope: !180)
!184 = !DILocation(line: 89, column: 28, scope: !180)
!185 = !DILocation(line: 89, column: 21, scope: !180)
!186 = !DILocation(line: 89, column: 31, scope: !180)
!187 = !DILocation(line: 89, column: 38, scope: !180)
!188 = !DILocation(line: 90, column: 17, scope: !180)
!189 = !DILocation(line: 86, column: 39, scope: !176)
!190 = !DILocation(line: 86, column: 17, scope: !176)
!191 = distinct !{!191, !178, !192, !87}
!192 = !DILocation(line: 90, column: 17, scope: !173)
!193 = !DILocalVariable(name: "i", scope: !194, file: !21, line: 93, type: !62)
!194 = distinct !DILexicalBlock(scope: !167, file: !21, line: 92, column: 13)
!195 = !DILocation(line: 93, column: 24, scope: !194)
!196 = !DILocation(line: 95, column: 24, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !21, line: 95, column: 17)
!198 = !DILocation(line: 95, column: 22, scope: !197)
!199 = !DILocation(line: 95, column: 29, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !21, line: 95, column: 17)
!201 = !DILocation(line: 95, column: 31, scope: !200)
!202 = !DILocation(line: 95, column: 17, scope: !197)
!203 = !DILocation(line: 97, column: 21, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !21, line: 96, column: 17)
!205 = !DILocation(line: 97, column: 26, scope: !204)
!206 = !DILocation(line: 97, column: 38, scope: !204)
!207 = !DILocation(line: 97, column: 31, scope: !204)
!208 = !DILocation(line: 98, column: 17, scope: !204)
!209 = !DILocation(line: 95, column: 39, scope: !200)
!210 = !DILocation(line: 95, column: 17, scope: !200)
!211 = distinct !{!211, !202, !212, !87}
!212 = !DILocation(line: 98, column: 17, scope: !197)
!213 = !DILocation(line: 99, column: 34, scope: !194)
!214 = !DILocation(line: 99, column: 17, scope: !194)
!215 = !DILocation(line: 100, column: 22, scope: !194)
!216 = !DILocation(line: 100, column: 17, scope: !194)
!217 = !DILocation(line: 104, column: 1, scope: !136)
