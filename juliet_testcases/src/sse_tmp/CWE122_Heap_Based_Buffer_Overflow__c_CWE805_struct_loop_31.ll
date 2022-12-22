; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !36, metadata !DIExpression()), !dbg !38
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !40, metadata !DIExpression()), !dbg !41
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !42
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !58
  %cmp2 = icmp ult i64 %4, 100, !dbg !60
  br i1 %cmp2, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %7, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !77, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i4, align 8, !dbg !80
  br label %for.cond5, !dbg !82

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i64, i64* %i4, align 8, !dbg !83
  %cmp6 = icmp ult i64 %8, 100, !dbg !85
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !86

for.body7:                                        ; preds = %for.cond5
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !87
  %10 = load i64, i64* %i4, align 8, !dbg !89
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !87
  %11 = load i64, i64* %i4, align 8, !dbg !90
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !91
  %12 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !91
  %13 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !91
  br label %for.inc10, !dbg !92

for.inc10:                                        ; preds = %for.body7
  %14 = load i64, i64* %i4, align 8, !dbg !93
  %inc11 = add i64 %14, 1, !dbg !93
  store i64 %inc11, i64* %i4, align 8, !dbg !93
  br label %for.cond5, !dbg !94, !llvm.loop !95

for.end12:                                        ; preds = %for.cond5
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !97
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !97
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !98
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !99
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !99
  call void @free(i8* %17) #6, !dbg !100
  ret void, !dbg !101
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31_good() #0 !dbg !102 {
entry:
  call void @goodG2B(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i64 @time(i64* null) #6, !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 %conv) #6, !dbg !117
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !118
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31_good(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31_bad(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !125 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !129
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !130
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !138, metadata !DIExpression()), !dbg !140
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !141
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !142, metadata !DIExpression()), !dbg !143
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !144
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !154
  %cmp2 = icmp ult i64 %4, 100, !dbg !156
  br i1 %cmp2, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !160
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !161
  store i32 0, i32* %intOne, align 8, !dbg !162
  %6 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !164
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !165
  store i32 0, i32* %intTwo, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %7, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !172, metadata !DIExpression()), !dbg !174
  store i64 0, i64* %i4, align 8, !dbg !175
  br label %for.cond5, !dbg !177

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i64, i64* %i4, align 8, !dbg !178
  %cmp6 = icmp ult i64 %8, 100, !dbg !180
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !181

for.body7:                                        ; preds = %for.cond5
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !182
  %10 = load i64, i64* %i4, align 8, !dbg !184
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !182
  %11 = load i64, i64* %i4, align 8, !dbg !185
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !186
  %12 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !186
  %13 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !186
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !186
  br label %for.inc10, !dbg !187

for.inc10:                                        ; preds = %for.body7
  %14 = load i64, i64* %i4, align 8, !dbg !188
  %inc11 = add i64 %14, 1, !dbg !188
  store i64 %inc11, i64* %i4, align 8, !dbg !188
  br label %for.cond5, !dbg !189, !llvm.loop !190

for.end12:                                        ; preds = %for.cond5
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !192
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !192
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !193
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !194
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !194
  call void @free(i8* %17) #6, !dbg !195
  ret void, !dbg !196
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 26, column: 29, scope: !20)
!28 = !DILocation(line: 26, column: 12, scope: !20)
!29 = !DILocation(line: 26, column: 10, scope: !20)
!30 = !DILocation(line: 27, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 9)
!32 = !DILocation(line: 27, column: 14, scope: !31)
!33 = !DILocation(line: 27, column: 9, scope: !20)
!34 = !DILocation(line: 27, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 27, column: 23)
!36 = !DILocalVariable(name: "dataCopy", scope: !37, file: !21, line: 29, type: !4)
!37 = distinct !DILexicalBlock(scope: !20, file: !21, line: 28, column: 5)
!38 = !DILocation(line: 29, column: 25, scope: !37)
!39 = !DILocation(line: 29, column: 36, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !21, line: 30, type: !4)
!41 = !DILocation(line: 30, column: 25, scope: !37)
!42 = !DILocation(line: 30, column: 32, scope: !37)
!43 = !DILocalVariable(name: "source", scope: !44, file: !21, line: 32, type: !45)
!44 = distinct !DILexicalBlock(scope: !37, file: !21, line: 31, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 32, column: 27, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !50, file: !21, line: 34, type: !51)
!50 = distinct !DILexicalBlock(scope: !44, file: !21, line: 33, column: 13)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 34, column: 24, scope: !50)
!55 = !DILocation(line: 36, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !21, line: 36, column: 17)
!57 = !DILocation(line: 36, column: 22, scope: !56)
!58 = !DILocation(line: 36, column: 29, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !21, line: 36, column: 17)
!60 = !DILocation(line: 36, column: 31, scope: !59)
!61 = !DILocation(line: 36, column: 17, scope: !56)
!62 = !DILocation(line: 38, column: 28, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !21, line: 37, column: 17)
!64 = !DILocation(line: 38, column: 21, scope: !63)
!65 = !DILocation(line: 38, column: 31, scope: !63)
!66 = !DILocation(line: 38, column: 38, scope: !63)
!67 = !DILocation(line: 39, column: 28, scope: !63)
!68 = !DILocation(line: 39, column: 21, scope: !63)
!69 = !DILocation(line: 39, column: 31, scope: !63)
!70 = !DILocation(line: 39, column: 38, scope: !63)
!71 = !DILocation(line: 40, column: 17, scope: !63)
!72 = !DILocation(line: 36, column: 39, scope: !59)
!73 = !DILocation(line: 36, column: 17, scope: !59)
!74 = distinct !{!74, !61, !75, !76}
!75 = !DILocation(line: 40, column: 17, scope: !56)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocalVariable(name: "i", scope: !78, file: !21, line: 43, type: !51)
!78 = distinct !DILexicalBlock(scope: !44, file: !21, line: 42, column: 13)
!79 = !DILocation(line: 43, column: 24, scope: !78)
!80 = !DILocation(line: 45, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !21, line: 45, column: 17)
!82 = !DILocation(line: 45, column: 22, scope: !81)
!83 = !DILocation(line: 45, column: 29, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !21, line: 45, column: 17)
!85 = !DILocation(line: 45, column: 31, scope: !84)
!86 = !DILocation(line: 45, column: 17, scope: !81)
!87 = !DILocation(line: 47, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !21, line: 46, column: 17)
!89 = !DILocation(line: 47, column: 26, scope: !88)
!90 = !DILocation(line: 47, column: 38, scope: !88)
!91 = !DILocation(line: 47, column: 31, scope: !88)
!92 = !DILocation(line: 48, column: 17, scope: !88)
!93 = !DILocation(line: 45, column: 39, scope: !84)
!94 = !DILocation(line: 45, column: 17, scope: !84)
!95 = distinct !{!95, !86, !96, !76}
!96 = !DILocation(line: 48, column: 17, scope: !81)
!97 = !DILocation(line: 49, column: 34, scope: !78)
!98 = !DILocation(line: 49, column: 17, scope: !78)
!99 = !DILocation(line: 50, column: 22, scope: !78)
!100 = !DILocation(line: 50, column: 17, scope: !78)
!101 = !DILocation(line: 54, column: 1, scope: !20)
!102 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_31_good", scope: !21, file: !21, line: 96, type: !22, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocation(line: 98, column: 5, scope: !102)
!104 = !DILocation(line: 99, column: 1, scope: !102)
!105 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 110, type: !106, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DISubroutineType(types: !107)
!107 = !{!10, !10, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !21, line: 110, type: !10)
!112 = !DILocation(line: 110, column: 14, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !21, line: 110, type: !108)
!114 = !DILocation(line: 110, column: 27, scope: !105)
!115 = !DILocation(line: 113, column: 22, scope: !105)
!116 = !DILocation(line: 113, column: 12, scope: !105)
!117 = !DILocation(line: 113, column: 5, scope: !105)
!118 = !DILocation(line: 115, column: 5, scope: !105)
!119 = !DILocation(line: 116, column: 5, scope: !105)
!120 = !DILocation(line: 117, column: 5, scope: !105)
!121 = !DILocation(line: 120, column: 5, scope: !105)
!122 = !DILocation(line: 121, column: 5, scope: !105)
!123 = !DILocation(line: 122, column: 5, scope: !105)
!124 = !DILocation(line: 124, column: 5, scope: !105)
!125 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !21, line: 63, type: !4)
!127 = !DILocation(line: 63, column: 21, scope: !125)
!128 = !DILocation(line: 64, column: 10, scope: !125)
!129 = !DILocation(line: 66, column: 29, scope: !125)
!130 = !DILocation(line: 66, column: 12, scope: !125)
!131 = !DILocation(line: 66, column: 10, scope: !125)
!132 = !DILocation(line: 67, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !125, file: !21, line: 67, column: 9)
!134 = !DILocation(line: 67, column: 14, scope: !133)
!135 = !DILocation(line: 67, column: 9, scope: !125)
!136 = !DILocation(line: 67, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !21, line: 67, column: 23)
!138 = !DILocalVariable(name: "dataCopy", scope: !139, file: !21, line: 69, type: !4)
!139 = distinct !DILexicalBlock(scope: !125, file: !21, line: 68, column: 5)
!140 = !DILocation(line: 69, column: 25, scope: !139)
!141 = !DILocation(line: 69, column: 36, scope: !139)
!142 = !DILocalVariable(name: "data", scope: !139, file: !21, line: 70, type: !4)
!143 = !DILocation(line: 70, column: 25, scope: !139)
!144 = !DILocation(line: 70, column: 32, scope: !139)
!145 = !DILocalVariable(name: "source", scope: !146, file: !21, line: 72, type: !45)
!146 = distinct !DILexicalBlock(scope: !139, file: !21, line: 71, column: 9)
!147 = !DILocation(line: 72, column: 27, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !21, line: 74, type: !51)
!149 = distinct !DILexicalBlock(scope: !146, file: !21, line: 73, column: 13)
!150 = !DILocation(line: 74, column: 24, scope: !149)
!151 = !DILocation(line: 76, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !21, line: 76, column: 17)
!153 = !DILocation(line: 76, column: 22, scope: !152)
!154 = !DILocation(line: 76, column: 29, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !21, line: 76, column: 17)
!156 = !DILocation(line: 76, column: 31, scope: !155)
!157 = !DILocation(line: 76, column: 17, scope: !152)
!158 = !DILocation(line: 78, column: 28, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !21, line: 77, column: 17)
!160 = !DILocation(line: 78, column: 21, scope: !159)
!161 = !DILocation(line: 78, column: 31, scope: !159)
!162 = !DILocation(line: 78, column: 38, scope: !159)
!163 = !DILocation(line: 79, column: 28, scope: !159)
!164 = !DILocation(line: 79, column: 21, scope: !159)
!165 = !DILocation(line: 79, column: 31, scope: !159)
!166 = !DILocation(line: 79, column: 38, scope: !159)
!167 = !DILocation(line: 80, column: 17, scope: !159)
!168 = !DILocation(line: 76, column: 39, scope: !155)
!169 = !DILocation(line: 76, column: 17, scope: !155)
!170 = distinct !{!170, !157, !171, !76}
!171 = !DILocation(line: 80, column: 17, scope: !152)
!172 = !DILocalVariable(name: "i", scope: !173, file: !21, line: 83, type: !51)
!173 = distinct !DILexicalBlock(scope: !146, file: !21, line: 82, column: 13)
!174 = !DILocation(line: 83, column: 24, scope: !173)
!175 = !DILocation(line: 85, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !21, line: 85, column: 17)
!177 = !DILocation(line: 85, column: 22, scope: !176)
!178 = !DILocation(line: 85, column: 29, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !21, line: 85, column: 17)
!180 = !DILocation(line: 85, column: 31, scope: !179)
!181 = !DILocation(line: 85, column: 17, scope: !176)
!182 = !DILocation(line: 87, column: 21, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !21, line: 86, column: 17)
!184 = !DILocation(line: 87, column: 26, scope: !183)
!185 = !DILocation(line: 87, column: 38, scope: !183)
!186 = !DILocation(line: 87, column: 31, scope: !183)
!187 = !DILocation(line: 88, column: 17, scope: !183)
!188 = !DILocation(line: 85, column: 39, scope: !179)
!189 = !DILocation(line: 85, column: 17, scope: !179)
!190 = distinct !{!190, !181, !191, !76}
!191 = !DILocation(line: 88, column: 17, scope: !176)
!192 = !DILocation(line: 89, column: 34, scope: !173)
!193 = !DILocation(line: 89, column: 17, scope: !173)
!194 = !DILocation(line: 90, column: 22, scope: !173)
!195 = !DILocation(line: 90, column: 17, scope: !173)
!196 = !DILocation(line: 94, column: 1, scope: !125)
