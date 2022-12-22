; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !26, metadata !DIExpression()), !dbg !30
  store void (%struct._twoIntsStruct*)* @badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !32
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !41
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  call void %2(%struct._twoIntsStruct* %3), !dbg !41
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(%struct._twoIntsStruct* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !62
  %cmp = icmp ult i64 %0, 100, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !68
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !69
  store i32 0, i32* %intOne, align 8, !dbg !70
  %2 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !72
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !73
  store i32 0, i32* %intTwo, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %3, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i2, align 8, !dbg !84
  br label %for.cond3, !dbg !86

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !87
  %cmp4 = icmp ult i64 %4, 100, !dbg !89
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !90

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !91
  %6 = load i64, i64* %i2, align 8, !dbg !93
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !91
  %7 = load i64, i64* %i2, align 8, !dbg !94
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !95
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !95
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !95
  br label %for.inc8, !dbg !96

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !97
  %inc9 = add i64 %10, 1, !dbg !97
  store i64 %inc9, i64* %i2, align 8, !dbg !97
  br label %for.cond3, !dbg !98, !llvm.loop !99

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !101
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !101
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !102
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !103
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !103
  call void @free(i8* %13) #6, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44_good() #0 !dbg !106 {
entry:
  call void @goodG2B(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* null) #6, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #6, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !132, metadata !DIExpression()), !dbg !133
  store void (%struct._twoIntsStruct*)* @goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !133
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !134
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !135
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !136
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !138
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  %2 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !144
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  call void %2(%struct._twoIntsStruct* %3), !dbg !144
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !147 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !159
  %cmp = icmp ult i64 %0, 100, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !165
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !166
  store i32 0, i32* %intOne, align 8, !dbg !167
  %2 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !169
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !170
  store i32 0, i32* %intTwo, align 4, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %3, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !177, metadata !DIExpression()), !dbg !179
  store i64 0, i64* %i2, align 8, !dbg !180
  br label %for.cond3, !dbg !182

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !183
  %cmp4 = icmp ult i64 %4, 100, !dbg !185
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !186

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !187
  %6 = load i64, i64* %i2, align 8, !dbg !189
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !187
  %7 = load i64, i64* %i2, align 8, !dbg !190
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !191
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !191
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !191
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !191
  br label %for.inc8, !dbg !192

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !193
  %inc9 = add i64 %10, 1, !dbg !193
  store i64 %inc9, i64* %i2, align 8, !dbg !193
  br label %for.cond3, !dbg !194, !llvm.loop !195

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !197
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !197
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !198
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !199
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !199
  call void @free(i8* %13) #6, !dbg !200
  ret void, !dbg !201
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44_bad", scope: !21, file: !21, line: 47, type: !22, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 49, type: !4)
!25 = !DILocation(line: 49, column: 21, scope: !20)
!26 = !DILocalVariable(name: "funcPtr", scope: !20, file: !21, line: 51, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !4}
!30 = !DILocation(line: 51, column: 12, scope: !20)
!31 = !DILocation(line: 52, column: 10, scope: !20)
!32 = !DILocation(line: 54, column: 29, scope: !20)
!33 = !DILocation(line: 54, column: 12, scope: !20)
!34 = !DILocation(line: 54, column: 10, scope: !20)
!35 = !DILocation(line: 55, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !20, file: !21, line: 55, column: 9)
!37 = !DILocation(line: 55, column: 14, scope: !36)
!38 = !DILocation(line: 55, column: 9, scope: !20)
!39 = !DILocation(line: 55, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !21, line: 55, column: 23)
!41 = !DILocation(line: 57, column: 5, scope: !20)
!42 = !DILocation(line: 57, column: 13, scope: !20)
!43 = !DILocation(line: 58, column: 1, scope: !20)
!44 = distinct !DISubprogram(name: "badSink", scope: !21, file: !21, line: 21, type: !28, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !21, line: 21, type: !4)
!46 = !DILocation(line: 21, column: 37, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !21, line: 24, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !21, line: 23, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 24, column: 23, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !54, file: !21, line: 26, type: !55)
!54 = distinct !DILexicalBlock(scope: !48, file: !21, line: 25, column: 9)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 46, baseType: !57)
!56 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 26, column: 20, scope: !54)
!59 = !DILocation(line: 28, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !21, line: 28, column: 13)
!61 = !DILocation(line: 28, column: 18, scope: !60)
!62 = !DILocation(line: 28, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !21, line: 28, column: 13)
!64 = !DILocation(line: 28, column: 27, scope: !63)
!65 = !DILocation(line: 28, column: 13, scope: !60)
!66 = !DILocation(line: 30, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !21, line: 29, column: 13)
!68 = !DILocation(line: 30, column: 17, scope: !67)
!69 = !DILocation(line: 30, column: 27, scope: !67)
!70 = !DILocation(line: 30, column: 34, scope: !67)
!71 = !DILocation(line: 31, column: 24, scope: !67)
!72 = !DILocation(line: 31, column: 17, scope: !67)
!73 = !DILocation(line: 31, column: 27, scope: !67)
!74 = !DILocation(line: 31, column: 34, scope: !67)
!75 = !DILocation(line: 32, column: 13, scope: !67)
!76 = !DILocation(line: 28, column: 35, scope: !63)
!77 = !DILocation(line: 28, column: 13, scope: !63)
!78 = distinct !{!78, !65, !79, !80}
!79 = !DILocation(line: 32, column: 13, scope: !60)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocalVariable(name: "i", scope: !82, file: !21, line: 35, type: !55)
!82 = distinct !DILexicalBlock(scope: !48, file: !21, line: 34, column: 9)
!83 = !DILocation(line: 35, column: 20, scope: !82)
!84 = !DILocation(line: 37, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !21, line: 37, column: 13)
!86 = !DILocation(line: 37, column: 18, scope: !85)
!87 = !DILocation(line: 37, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !21, line: 37, column: 13)
!89 = !DILocation(line: 37, column: 27, scope: !88)
!90 = !DILocation(line: 37, column: 13, scope: !85)
!91 = !DILocation(line: 39, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !21, line: 38, column: 13)
!93 = !DILocation(line: 39, column: 22, scope: !92)
!94 = !DILocation(line: 39, column: 34, scope: !92)
!95 = !DILocation(line: 39, column: 27, scope: !92)
!96 = !DILocation(line: 40, column: 13, scope: !92)
!97 = !DILocation(line: 37, column: 35, scope: !88)
!98 = !DILocation(line: 37, column: 13, scope: !88)
!99 = distinct !{!99, !90, !100, !80}
!100 = !DILocation(line: 40, column: 13, scope: !85)
!101 = !DILocation(line: 41, column: 30, scope: !82)
!102 = !DILocation(line: 41, column: 13, scope: !82)
!103 = !DILocation(line: 42, column: 18, scope: !82)
!104 = !DILocation(line: 42, column: 13, scope: !82)
!105 = !DILocation(line: 45, column: 1, scope: !44)
!106 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_44_good", scope: !21, file: !21, line: 102, type: !22, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 104, column: 5, scope: !106)
!108 = !DILocation(line: 105, column: 1, scope: !106)
!109 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 116, type: !110, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!10, !10, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !21, line: 116, type: !10)
!116 = !DILocation(line: 116, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !21, line: 116, type: !112)
!118 = !DILocation(line: 116, column: 27, scope: !109)
!119 = !DILocation(line: 119, column: 22, scope: !109)
!120 = !DILocation(line: 119, column: 12, scope: !109)
!121 = !DILocation(line: 119, column: 5, scope: !109)
!122 = !DILocation(line: 121, column: 5, scope: !109)
!123 = !DILocation(line: 122, column: 5, scope: !109)
!124 = !DILocation(line: 123, column: 5, scope: !109)
!125 = !DILocation(line: 126, column: 5, scope: !109)
!126 = !DILocation(line: 127, column: 5, scope: !109)
!127 = !DILocation(line: 128, column: 5, scope: !109)
!128 = !DILocation(line: 130, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 91, type: !22, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !21, line: 93, type: !4)
!131 = !DILocation(line: 93, column: 21, scope: !129)
!132 = !DILocalVariable(name: "funcPtr", scope: !129, file: !21, line: 94, type: !27)
!133 = !DILocation(line: 94, column: 12, scope: !129)
!134 = !DILocation(line: 95, column: 10, scope: !129)
!135 = !DILocation(line: 97, column: 29, scope: !129)
!136 = !DILocation(line: 97, column: 12, scope: !129)
!137 = !DILocation(line: 97, column: 10, scope: !129)
!138 = !DILocation(line: 98, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !21, line: 98, column: 9)
!140 = !DILocation(line: 98, column: 14, scope: !139)
!141 = !DILocation(line: 98, column: 9, scope: !129)
!142 = !DILocation(line: 98, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !21, line: 98, column: 23)
!144 = !DILocation(line: 99, column: 5, scope: !129)
!145 = !DILocation(line: 99, column: 13, scope: !129)
!146 = !DILocation(line: 100, column: 1, scope: !129)
!147 = distinct !DISubprogram(name: "goodG2BSink", scope: !21, file: !21, line: 65, type: !28, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", arg: 1, scope: !147, file: !21, line: 65, type: !4)
!149 = !DILocation(line: 65, column: 41, scope: !147)
!150 = !DILocalVariable(name: "source", scope: !151, file: !21, line: 68, type: !49)
!151 = distinct !DILexicalBlock(scope: !147, file: !21, line: 67, column: 5)
!152 = !DILocation(line: 68, column: 23, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !154, file: !21, line: 70, type: !55)
!154 = distinct !DILexicalBlock(scope: !151, file: !21, line: 69, column: 9)
!155 = !DILocation(line: 70, column: 20, scope: !154)
!156 = !DILocation(line: 72, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !21, line: 72, column: 13)
!158 = !DILocation(line: 72, column: 18, scope: !157)
!159 = !DILocation(line: 72, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !21, line: 72, column: 13)
!161 = !DILocation(line: 72, column: 27, scope: !160)
!162 = !DILocation(line: 72, column: 13, scope: !157)
!163 = !DILocation(line: 74, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !21, line: 73, column: 13)
!165 = !DILocation(line: 74, column: 17, scope: !164)
!166 = !DILocation(line: 74, column: 27, scope: !164)
!167 = !DILocation(line: 74, column: 34, scope: !164)
!168 = !DILocation(line: 75, column: 24, scope: !164)
!169 = !DILocation(line: 75, column: 17, scope: !164)
!170 = !DILocation(line: 75, column: 27, scope: !164)
!171 = !DILocation(line: 75, column: 34, scope: !164)
!172 = !DILocation(line: 76, column: 13, scope: !164)
!173 = !DILocation(line: 72, column: 35, scope: !160)
!174 = !DILocation(line: 72, column: 13, scope: !160)
!175 = distinct !{!175, !162, !176, !80}
!176 = !DILocation(line: 76, column: 13, scope: !157)
!177 = !DILocalVariable(name: "i", scope: !178, file: !21, line: 79, type: !55)
!178 = distinct !DILexicalBlock(scope: !151, file: !21, line: 78, column: 9)
!179 = !DILocation(line: 79, column: 20, scope: !178)
!180 = !DILocation(line: 81, column: 20, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !21, line: 81, column: 13)
!182 = !DILocation(line: 81, column: 18, scope: !181)
!183 = !DILocation(line: 81, column: 25, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !21, line: 81, column: 13)
!185 = !DILocation(line: 81, column: 27, scope: !184)
!186 = !DILocation(line: 81, column: 13, scope: !181)
!187 = !DILocation(line: 83, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !21, line: 82, column: 13)
!189 = !DILocation(line: 83, column: 22, scope: !188)
!190 = !DILocation(line: 83, column: 34, scope: !188)
!191 = !DILocation(line: 83, column: 27, scope: !188)
!192 = !DILocation(line: 84, column: 13, scope: !188)
!193 = !DILocation(line: 81, column: 35, scope: !184)
!194 = !DILocation(line: 81, column: 13, scope: !184)
!195 = distinct !{!195, !186, !196, !80}
!196 = !DILocation(line: 84, column: 13, scope: !181)
!197 = !DILocation(line: 85, column: 30, scope: !178)
!198 = !DILocation(line: 85, column: 13, scope: !178)
!199 = !DILocation(line: 86, column: 18, scope: !178)
!200 = !DILocation(line: 86, column: 13, scope: !178)
!201 = !DILocation(line: 89, column: 1, scope: !147)
