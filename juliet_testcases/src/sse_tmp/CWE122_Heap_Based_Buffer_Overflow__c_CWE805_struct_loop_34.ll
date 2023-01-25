; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !34
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !44
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !49
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !49
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !65
  %cmp2 = icmp ult i64 %4, 100, !dbg !67
  br i1 %cmp2, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !71
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !72
  store i32 0, i32* %intOne, align 8, !dbg !73
  %6 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !75
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !76
  store i32 0, i32* %intTwo, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %7, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !84, metadata !DIExpression()), !dbg !86
  store i64 0, i64* %i4, align 8, !dbg !87
  br label %for.cond5, !dbg !89

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i64, i64* %i4, align 8, !dbg !90
  %cmp6 = icmp ult i64 %8, 100, !dbg !92
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !93

for.body7:                                        ; preds = %for.cond5
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !94
  %10 = load i64, i64* %i4, align 8, !dbg !96
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !94
  %11 = load i64, i64* %i4, align 8, !dbg !97
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !98
  %12 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !98
  %13 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !98
  br label %for.inc10, !dbg !99

for.inc10:                                        ; preds = %for.body7
  %14 = load i64, i64* %i4, align 8, !dbg !100
  %inc11 = add i64 %14, 1, !dbg !100
  store i64 %inc11, i64* %i4, align 8, !dbg !100
  br label %for.cond5, !dbg !101, !llvm.loop !102

for.end12:                                        ; preds = %for.cond5
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !104
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !104
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !105
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !106
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !106
  call void @free(i8* %17) #6, !dbg !107
  ret void, !dbg !108
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_good() #0 !dbg !109 {
entry:
  call void @goodG2B(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %call = call i64 @time(i64* null) #6, !dbg !122
  %conv = trunc i64 %call to i32, !dbg !123
  call void @srand(i32 %conv) #6, !dbg !124
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !125
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_good(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_bad(), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !130
  ret i32 0, !dbg !131
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !132 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion, metadata !135, metadata !DIExpression()), !dbg !136
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !138
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !139
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.end, !dbg !144

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !148
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !150, metadata !DIExpression()), !dbg !152
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !153
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !153
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !163
  %cmp2 = icmp ult i64 %4, 100, !dbg !165
  br i1 %cmp2, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !169
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !170
  store i32 0, i32* %intOne, align 8, !dbg !171
  %6 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !173
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !174
  store i32 0, i32* %intTwo, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %7, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !181, metadata !DIExpression()), !dbg !183
  store i64 0, i64* %i4, align 8, !dbg !184
  br label %for.cond5, !dbg !186

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i64, i64* %i4, align 8, !dbg !187
  %cmp6 = icmp ult i64 %8, 100, !dbg !189
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !190

for.body7:                                        ; preds = %for.cond5
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !191
  %10 = load i64, i64* %i4, align 8, !dbg !193
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !191
  %11 = load i64, i64* %i4, align 8, !dbg !194
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !195
  %12 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !195
  %13 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !195
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !195
  br label %for.inc10, !dbg !196

for.inc10:                                        ; preds = %for.body7
  %14 = load i64, i64* %i4, align 8, !dbg !197
  %inc11 = add i64 %14, 1, !dbg !197
  store i64 %inc11, i64* %i4, align 8, !dbg !197
  br label %for.cond5, !dbg !198, !llvm.loop !199

for.end12:                                        ; preds = %for.cond5
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !201
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !201
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !202
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !203
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !203
  call void @free(i8* %17) #6, !dbg !204
  ret void, !dbg !205
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_bad", scope: !21, file: !21, line: 27, type: !22, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 29, type: !4)
!25 = !DILocation(line: 29, column: 21, scope: !20)
!26 = !DILocalVariable(name: "myUnion", scope: !20, file: !21, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType", file: !21, line: 23, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !21, line: 19, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !21, line: 21, baseType: !4, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !21, line: 22, baseType: !4, size: 64)
!32 = !DILocation(line: 30, column: 74, scope: !20)
!33 = !DILocation(line: 31, column: 10, scope: !20)
!34 = !DILocation(line: 33, column: 29, scope: !20)
!35 = !DILocation(line: 33, column: 12, scope: !20)
!36 = !DILocation(line: 33, column: 10, scope: !20)
!37 = !DILocation(line: 34, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !20, file: !21, line: 34, column: 9)
!39 = !DILocation(line: 34, column: 14, scope: !38)
!40 = !DILocation(line: 34, column: 9, scope: !20)
!41 = !DILocation(line: 34, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !21, line: 34, column: 23)
!43 = !DILocation(line: 35, column: 26, scope: !20)
!44 = !DILocation(line: 35, column: 13, scope: !20)
!45 = !DILocation(line: 35, column: 24, scope: !20)
!46 = !DILocalVariable(name: "data", scope: !47, file: !21, line: 37, type: !4)
!47 = distinct !DILexicalBlock(scope: !20, file: !21, line: 36, column: 5)
!48 = !DILocation(line: 37, column: 25, scope: !47)
!49 = !DILocation(line: 37, column: 40, scope: !47)
!50 = !DILocalVariable(name: "source", scope: !51, file: !21, line: 39, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !21, line: 38, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 39, column: 27, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !57, file: !21, line: 41, type: !58)
!57 = distinct !DILexicalBlock(scope: !51, file: !21, line: 40, column: 13)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 46, baseType: !60)
!59 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 41, column: 24, scope: !57)
!62 = !DILocation(line: 43, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !21, line: 43, column: 17)
!64 = !DILocation(line: 43, column: 22, scope: !63)
!65 = !DILocation(line: 43, column: 29, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !21, line: 43, column: 17)
!67 = !DILocation(line: 43, column: 31, scope: !66)
!68 = !DILocation(line: 43, column: 17, scope: !63)
!69 = !DILocation(line: 45, column: 28, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !21, line: 44, column: 17)
!71 = !DILocation(line: 45, column: 21, scope: !70)
!72 = !DILocation(line: 45, column: 31, scope: !70)
!73 = !DILocation(line: 45, column: 38, scope: !70)
!74 = !DILocation(line: 46, column: 28, scope: !70)
!75 = !DILocation(line: 46, column: 21, scope: !70)
!76 = !DILocation(line: 46, column: 31, scope: !70)
!77 = !DILocation(line: 46, column: 38, scope: !70)
!78 = !DILocation(line: 47, column: 17, scope: !70)
!79 = !DILocation(line: 43, column: 39, scope: !66)
!80 = !DILocation(line: 43, column: 17, scope: !66)
!81 = distinct !{!81, !68, !82, !83}
!82 = !DILocation(line: 47, column: 17, scope: !63)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocalVariable(name: "i", scope: !85, file: !21, line: 50, type: !58)
!85 = distinct !DILexicalBlock(scope: !51, file: !21, line: 49, column: 13)
!86 = !DILocation(line: 50, column: 24, scope: !85)
!87 = !DILocation(line: 52, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !21, line: 52, column: 17)
!89 = !DILocation(line: 52, column: 22, scope: !88)
!90 = !DILocation(line: 52, column: 29, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !21, line: 52, column: 17)
!92 = !DILocation(line: 52, column: 31, scope: !91)
!93 = !DILocation(line: 52, column: 17, scope: !88)
!94 = !DILocation(line: 54, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !21, line: 53, column: 17)
!96 = !DILocation(line: 54, column: 26, scope: !95)
!97 = !DILocation(line: 54, column: 38, scope: !95)
!98 = !DILocation(line: 54, column: 31, scope: !95)
!99 = !DILocation(line: 55, column: 17, scope: !95)
!100 = !DILocation(line: 52, column: 39, scope: !91)
!101 = !DILocation(line: 52, column: 17, scope: !91)
!102 = distinct !{!102, !93, !103, !83}
!103 = !DILocation(line: 55, column: 17, scope: !88)
!104 = !DILocation(line: 56, column: 34, scope: !85)
!105 = !DILocation(line: 56, column: 17, scope: !85)
!106 = !DILocation(line: 57, column: 22, scope: !85)
!107 = !DILocation(line: 57, column: 17, scope: !85)
!108 = !DILocation(line: 61, column: 1, scope: !20)
!109 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_good", scope: !21, file: !21, line: 104, type: !22, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 106, column: 5, scope: !109)
!111 = !DILocation(line: 107, column: 1, scope: !109)
!112 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 118, type: !113, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!10, !10, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!118 = !DILocalVariable(name: "argc", arg: 1, scope: !112, file: !21, line: 118, type: !10)
!119 = !DILocation(line: 118, column: 14, scope: !112)
!120 = !DILocalVariable(name: "argv", arg: 2, scope: !112, file: !21, line: 118, type: !115)
!121 = !DILocation(line: 118, column: 27, scope: !112)
!122 = !DILocation(line: 121, column: 22, scope: !112)
!123 = !DILocation(line: 121, column: 12, scope: !112)
!124 = !DILocation(line: 121, column: 5, scope: !112)
!125 = !DILocation(line: 123, column: 5, scope: !112)
!126 = !DILocation(line: 124, column: 5, scope: !112)
!127 = !DILocation(line: 125, column: 5, scope: !112)
!128 = !DILocation(line: 128, column: 5, scope: !112)
!129 = !DILocation(line: 129, column: 5, scope: !112)
!130 = !DILocation(line: 130, column: 5, scope: !112)
!131 = !DILocation(line: 132, column: 5, scope: !112)
!132 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 68, type: !22, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !21, line: 70, type: !4)
!134 = !DILocation(line: 70, column: 21, scope: !132)
!135 = !DILocalVariable(name: "myUnion", scope: !132, file: !21, line: 71, type: !27)
!136 = !DILocation(line: 71, column: 74, scope: !132)
!137 = !DILocation(line: 72, column: 10, scope: !132)
!138 = !DILocation(line: 74, column: 29, scope: !132)
!139 = !DILocation(line: 74, column: 12, scope: !132)
!140 = !DILocation(line: 74, column: 10, scope: !132)
!141 = !DILocation(line: 75, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !132, file: !21, line: 75, column: 9)
!143 = !DILocation(line: 75, column: 14, scope: !142)
!144 = !DILocation(line: 75, column: 9, scope: !132)
!145 = !DILocation(line: 75, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !21, line: 75, column: 23)
!147 = !DILocation(line: 76, column: 26, scope: !132)
!148 = !DILocation(line: 76, column: 13, scope: !132)
!149 = !DILocation(line: 76, column: 24, scope: !132)
!150 = !DILocalVariable(name: "data", scope: !151, file: !21, line: 78, type: !4)
!151 = distinct !DILexicalBlock(scope: !132, file: !21, line: 77, column: 5)
!152 = !DILocation(line: 78, column: 25, scope: !151)
!153 = !DILocation(line: 78, column: 40, scope: !151)
!154 = !DILocalVariable(name: "source", scope: !155, file: !21, line: 80, type: !52)
!155 = distinct !DILexicalBlock(scope: !151, file: !21, line: 79, column: 9)
!156 = !DILocation(line: 80, column: 27, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !21, line: 82, type: !58)
!158 = distinct !DILexicalBlock(scope: !155, file: !21, line: 81, column: 13)
!159 = !DILocation(line: 82, column: 24, scope: !158)
!160 = !DILocation(line: 84, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !21, line: 84, column: 17)
!162 = !DILocation(line: 84, column: 22, scope: !161)
!163 = !DILocation(line: 84, column: 29, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !21, line: 84, column: 17)
!165 = !DILocation(line: 84, column: 31, scope: !164)
!166 = !DILocation(line: 84, column: 17, scope: !161)
!167 = !DILocation(line: 86, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !21, line: 85, column: 17)
!169 = !DILocation(line: 86, column: 21, scope: !168)
!170 = !DILocation(line: 86, column: 31, scope: !168)
!171 = !DILocation(line: 86, column: 38, scope: !168)
!172 = !DILocation(line: 87, column: 28, scope: !168)
!173 = !DILocation(line: 87, column: 21, scope: !168)
!174 = !DILocation(line: 87, column: 31, scope: !168)
!175 = !DILocation(line: 87, column: 38, scope: !168)
!176 = !DILocation(line: 88, column: 17, scope: !168)
!177 = !DILocation(line: 84, column: 39, scope: !164)
!178 = !DILocation(line: 84, column: 17, scope: !164)
!179 = distinct !{!179, !166, !180, !83}
!180 = !DILocation(line: 88, column: 17, scope: !161)
!181 = !DILocalVariable(name: "i", scope: !182, file: !21, line: 91, type: !58)
!182 = distinct !DILexicalBlock(scope: !155, file: !21, line: 90, column: 13)
!183 = !DILocation(line: 91, column: 24, scope: !182)
!184 = !DILocation(line: 93, column: 24, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !21, line: 93, column: 17)
!186 = !DILocation(line: 93, column: 22, scope: !185)
!187 = !DILocation(line: 93, column: 29, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !21, line: 93, column: 17)
!189 = !DILocation(line: 93, column: 31, scope: !188)
!190 = !DILocation(line: 93, column: 17, scope: !185)
!191 = !DILocation(line: 95, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !21, line: 94, column: 17)
!193 = !DILocation(line: 95, column: 26, scope: !192)
!194 = !DILocation(line: 95, column: 38, scope: !192)
!195 = !DILocation(line: 95, column: 31, scope: !192)
!196 = !DILocation(line: 96, column: 17, scope: !192)
!197 = !DILocation(line: 93, column: 39, scope: !188)
!198 = !DILocation(line: 93, column: 17, scope: !188)
!199 = distinct !{!199, !190, !200, !83}
!200 = !DILocation(line: 96, column: 17, scope: !185)
!201 = !DILocation(line: 97, column: 34, scope: !182)
!202 = !DILocation(line: 97, column: 17, scope: !182)
!203 = !DILocation(line: 98, column: 22, scope: !182)
!204 = !DILocation(line: 98, column: 17, scope: !182)
!205 = !DILocation(line: 102, column: 1, scope: !132)
