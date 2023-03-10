; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badGlobal, align 4, !dbg !33
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badSource(%struct._twoIntsStruct* %0), !dbg !35
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %1, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 0, i32* %intOne, align 8, !dbg !60
  %3 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !63
  store i32 0, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %4, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !72
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !72
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !72
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !72
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !73
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !74
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !75
  call void @free(i8* %10) #5, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badSource(%struct._twoIntsStruct*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #5, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #5, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !105
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Global, align 4, !dbg !106
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Source(%struct._twoIntsStruct* %0), !dbg !108
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !119
  %cmp = icmp ult i64 %1, 100, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !125
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !126
  store i32 0, i32* %intOne, align 8, !dbg !127
  %3 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !129
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !130
  store i32 0, i32* %intTwo, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %4, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !138
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !138
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !138
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !139
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !140
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !141
  call void @free(i8* %10) #5, !dbg !142
  ret void, !dbg !143
}

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Source(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !145, metadata !DIExpression()), !dbg !146
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !147
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Global, align 4, !dbg !148
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Source(%struct._twoIntsStruct* %0), !dbg !150
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !161
  %cmp = icmp ult i64 %1, 100, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !167
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !168
  store i32 0, i32* %intOne, align 8, !dbg !169
  %3 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !171
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !172
  store i32 0, i32* %intTwo, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %4, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !179
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !180
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !180
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !180
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !180
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !181
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !182
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !183
  call void @free(i8* %10) #5, !dbg !184
  ret void, !dbg !185
}

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Source(%struct._twoIntsStruct*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B1Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_goodG2B2Global", scope: !2, file: !10, line: 56, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !26, line: 100, baseType: !27)
!26 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !26, line: 96, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !27, file: !26, line: 98, baseType: !11, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !27, file: !26, line: 99, baseType: !11, size: 32, offset: 32)
!31 = !DILocation(line: 28, column: 21, scope: !20)
!32 = !DILocation(line: 29, column: 10, scope: !20)
!33 = !DILocation(line: 30, column: 77, scope: !20)
!34 = !DILocation(line: 31, column: 84, scope: !20)
!35 = !DILocation(line: 31, column: 12, scope: !20)
!36 = !DILocation(line: 31, column: 10, scope: !20)
!37 = !DILocalVariable(name: "source", scope: !38, file: !10, line: 33, type: !39)
!38 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 33, column: 23, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !10, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 34, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 35, column: 20, scope: !44)
!49 = !DILocation(line: 37, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !10, line: 37, column: 13)
!51 = !DILocation(line: 37, column: 18, scope: !50)
!52 = !DILocation(line: 37, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !10, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 27, scope: !53)
!55 = !DILocation(line: 37, column: 13, scope: !50)
!56 = !DILocation(line: 39, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !10, line: 38, column: 13)
!58 = !DILocation(line: 39, column: 17, scope: !57)
!59 = !DILocation(line: 39, column: 27, scope: !57)
!60 = !DILocation(line: 39, column: 34, scope: !57)
!61 = !DILocation(line: 40, column: 24, scope: !57)
!62 = !DILocation(line: 40, column: 17, scope: !57)
!63 = !DILocation(line: 40, column: 27, scope: !57)
!64 = !DILocation(line: 40, column: 34, scope: !57)
!65 = !DILocation(line: 41, column: 13, scope: !57)
!66 = !DILocation(line: 37, column: 35, scope: !53)
!67 = !DILocation(line: 37, column: 13, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 41, column: 13, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 44, column: 17, scope: !38)
!72 = !DILocation(line: 44, column: 9, scope: !38)
!73 = !DILocation(line: 45, column: 26, scope: !38)
!74 = !DILocation(line: 45, column: 9, scope: !38)
!75 = !DILocation(line: 46, column: 14, scope: !38)
!76 = !DILocation(line: 46, column: 9, scope: !38)
!77 = !DILocation(line: 48, column: 1, scope: !20)
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_22_good", scope: !10, file: !10, line: 112, type: !21, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 114, column: 5, scope: !78)
!80 = !DILocation(line: 115, column: 5, scope: !78)
!81 = !DILocation(line: 116, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 128, type: !83, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!11, !11, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !10, line: 128, type: !11)
!89 = !DILocation(line: 128, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !10, line: 128, type: !85)
!91 = !DILocation(line: 128, column: 27, scope: !82)
!92 = !DILocation(line: 131, column: 22, scope: !82)
!93 = !DILocation(line: 131, column: 12, scope: !82)
!94 = !DILocation(line: 131, column: 5, scope: !82)
!95 = !DILocation(line: 133, column: 5, scope: !82)
!96 = !DILocation(line: 134, column: 5, scope: !82)
!97 = !DILocation(line: 135, column: 5, scope: !82)
!98 = !DILocation(line: 138, column: 5, scope: !82)
!99 = !DILocation(line: 139, column: 5, scope: !82)
!100 = !DILocation(line: 140, column: 5, scope: !82)
!101 = !DILocation(line: 142, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !10, line: 63, type: !24)
!104 = !DILocation(line: 63, column: 21, scope: !102)
!105 = !DILocation(line: 64, column: 10, scope: !102)
!106 = !DILocation(line: 65, column: 82, scope: !102)
!107 = !DILocation(line: 66, column: 89, scope: !102)
!108 = !DILocation(line: 66, column: 12, scope: !102)
!109 = !DILocation(line: 66, column: 10, scope: !102)
!110 = !DILocalVariable(name: "source", scope: !111, file: !10, line: 68, type: !39)
!111 = distinct !DILexicalBlock(scope: !102, file: !10, line: 67, column: 5)
!112 = !DILocation(line: 68, column: 23, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !10, line: 70, type: !45)
!114 = distinct !DILexicalBlock(scope: !111, file: !10, line: 69, column: 9)
!115 = !DILocation(line: 70, column: 20, scope: !114)
!116 = !DILocation(line: 72, column: 20, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !10, line: 72, column: 13)
!118 = !DILocation(line: 72, column: 18, scope: !117)
!119 = !DILocation(line: 72, column: 25, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !10, line: 72, column: 13)
!121 = !DILocation(line: 72, column: 27, scope: !120)
!122 = !DILocation(line: 72, column: 13, scope: !117)
!123 = !DILocation(line: 74, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !10, line: 73, column: 13)
!125 = !DILocation(line: 74, column: 17, scope: !124)
!126 = !DILocation(line: 74, column: 27, scope: !124)
!127 = !DILocation(line: 74, column: 34, scope: !124)
!128 = !DILocation(line: 75, column: 24, scope: !124)
!129 = !DILocation(line: 75, column: 17, scope: !124)
!130 = !DILocation(line: 75, column: 27, scope: !124)
!131 = !DILocation(line: 75, column: 34, scope: !124)
!132 = !DILocation(line: 76, column: 13, scope: !124)
!133 = !DILocation(line: 72, column: 35, scope: !120)
!134 = !DILocation(line: 72, column: 13, scope: !120)
!135 = distinct !{!135, !122, !136, !70}
!136 = !DILocation(line: 76, column: 13, scope: !117)
!137 = !DILocation(line: 79, column: 17, scope: !111)
!138 = !DILocation(line: 79, column: 9, scope: !111)
!139 = !DILocation(line: 80, column: 26, scope: !111)
!140 = !DILocation(line: 80, column: 9, scope: !111)
!141 = !DILocation(line: 81, column: 14, scope: !111)
!142 = !DILocation(line: 81, column: 9, scope: !111)
!143 = !DILocation(line: 83, column: 1, scope: !102)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 88, type: !21, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", scope: !144, file: !10, line: 90, type: !24)
!146 = !DILocation(line: 90, column: 21, scope: !144)
!147 = !DILocation(line: 91, column: 10, scope: !144)
!148 = !DILocation(line: 92, column: 82, scope: !144)
!149 = !DILocation(line: 93, column: 89, scope: !144)
!150 = !DILocation(line: 93, column: 12, scope: !144)
!151 = !DILocation(line: 93, column: 10, scope: !144)
!152 = !DILocalVariable(name: "source", scope: !153, file: !10, line: 95, type: !39)
!153 = distinct !DILexicalBlock(scope: !144, file: !10, line: 94, column: 5)
!154 = !DILocation(line: 95, column: 23, scope: !153)
!155 = !DILocalVariable(name: "i", scope: !156, file: !10, line: 97, type: !45)
!156 = distinct !DILexicalBlock(scope: !153, file: !10, line: 96, column: 9)
!157 = !DILocation(line: 97, column: 20, scope: !156)
!158 = !DILocation(line: 99, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !10, line: 99, column: 13)
!160 = !DILocation(line: 99, column: 18, scope: !159)
!161 = !DILocation(line: 99, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !10, line: 99, column: 13)
!163 = !DILocation(line: 99, column: 27, scope: !162)
!164 = !DILocation(line: 99, column: 13, scope: !159)
!165 = !DILocation(line: 101, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !10, line: 100, column: 13)
!167 = !DILocation(line: 101, column: 17, scope: !166)
!168 = !DILocation(line: 101, column: 27, scope: !166)
!169 = !DILocation(line: 101, column: 34, scope: !166)
!170 = !DILocation(line: 102, column: 24, scope: !166)
!171 = !DILocation(line: 102, column: 17, scope: !166)
!172 = !DILocation(line: 102, column: 27, scope: !166)
!173 = !DILocation(line: 102, column: 34, scope: !166)
!174 = !DILocation(line: 103, column: 13, scope: !166)
!175 = !DILocation(line: 99, column: 35, scope: !162)
!176 = !DILocation(line: 99, column: 13, scope: !162)
!177 = distinct !{!177, !164, !178, !70}
!178 = !DILocation(line: 103, column: 13, scope: !159)
!179 = !DILocation(line: 106, column: 17, scope: !153)
!180 = !DILocation(line: 106, column: 9, scope: !153)
!181 = !DILocation(line: 107, column: 26, scope: !153)
!182 = !DILocation(line: 107, column: 9, scope: !153)
!183 = !DILocation(line: 108, column: 14, scope: !153)
!184 = !DILocation(line: 108, column: 9, scope: !153)
!185 = !DILocation(line: 110, column: 1, scope: !144)
