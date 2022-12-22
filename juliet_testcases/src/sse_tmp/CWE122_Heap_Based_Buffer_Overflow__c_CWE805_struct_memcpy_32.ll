; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
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
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !88
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !89
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !89
  %14 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 16 %14, i64 800, i1 false), !dbg !89
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !90
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !90
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !91
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !92
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !92
  call void @free(i8* %17) #6, !dbg !93
  ret void, !dbg !94
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #6, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #6, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !121, metadata !DIExpression()), !dbg !122
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !123, metadata !DIExpression()), !dbg !124
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !124
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !129
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !130
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !128
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !131
  %2 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !132
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data1, align 8, !dbg !133
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !134
  %cmp = icmp eq %struct._twoIntsStruct* %3, null, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !140
  %5 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !141
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %5, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !143, metadata !DIExpression()), !dbg !145
  %6 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !146
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %6, align 8, !dbg !147
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %data2, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !157
  %cmp3 = icmp ult i64 %8, 100, !dbg !159
  br i1 %cmp3, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !163
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !164
  store i32 0, i32* %intOne, align 8, !dbg !165
  %10 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %10, !dbg !167
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !168
  store i32 0, i32* %intTwo, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %11, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !175
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !176
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !176
  %14 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 16 %14, i64 800, i1 false), !dbg !176
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !177
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !177
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !178
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !179
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !179
  call void @free(i8* %17) #6, !dbg !180
  ret void, !dbg !181
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32.c", directory: "/root/SSE-Assessment")
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
!88 = !DILocation(line: 48, column: 20, scope: !55)
!89 = !DILocation(line: 48, column: 13, scope: !55)
!90 = !DILocation(line: 49, column: 30, scope: !55)
!91 = !DILocation(line: 49, column: 13, scope: !55)
!92 = !DILocation(line: 50, column: 18, scope: !55)
!93 = !DILocation(line: 50, column: 13, scope: !55)
!94 = !DILocation(line: 53, column: 1, scope: !20)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_32_good", scope: !21, file: !21, line: 94, type: !22, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 96, column: 5, scope: !95)
!97 = !DILocation(line: 97, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 108, type: !99, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!10, !10, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !21, line: 108, type: !10)
!105 = !DILocation(line: 108, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !21, line: 108, type: !101)
!107 = !DILocation(line: 108, column: 27, scope: !98)
!108 = !DILocation(line: 111, column: 22, scope: !98)
!109 = !DILocation(line: 111, column: 12, scope: !98)
!110 = !DILocation(line: 111, column: 5, scope: !98)
!111 = !DILocation(line: 113, column: 5, scope: !98)
!112 = !DILocation(line: 114, column: 5, scope: !98)
!113 = !DILocation(line: 115, column: 5, scope: !98)
!114 = !DILocation(line: 118, column: 5, scope: !98)
!115 = !DILocation(line: 119, column: 5, scope: !98)
!116 = !DILocation(line: 120, column: 5, scope: !98)
!117 = !DILocation(line: 122, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !21, line: 62, type: !4)
!120 = !DILocation(line: 62, column: 21, scope: !118)
!121 = !DILocalVariable(name: "dataPtr1", scope: !118, file: !21, line: 63, type: !27)
!122 = !DILocation(line: 63, column: 22, scope: !118)
!123 = !DILocalVariable(name: "dataPtr2", scope: !118, file: !21, line: 64, type: !27)
!124 = !DILocation(line: 64, column: 22, scope: !118)
!125 = !DILocation(line: 65, column: 10, scope: !118)
!126 = !DILocalVariable(name: "data", scope: !127, file: !21, line: 67, type: !4)
!127 = distinct !DILexicalBlock(scope: !118, file: !21, line: 66, column: 5)
!128 = !DILocation(line: 67, column: 25, scope: !127)
!129 = !DILocation(line: 67, column: 33, scope: !127)
!130 = !DILocation(line: 67, column: 32, scope: !127)
!131 = !DILocation(line: 69, column: 33, scope: !127)
!132 = !DILocation(line: 69, column: 16, scope: !127)
!133 = !DILocation(line: 69, column: 14, scope: !127)
!134 = !DILocation(line: 70, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !127, file: !21, line: 70, column: 13)
!136 = !DILocation(line: 70, column: 18, scope: !135)
!137 = !DILocation(line: 70, column: 13, scope: !127)
!138 = !DILocation(line: 70, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !21, line: 70, column: 27)
!140 = !DILocation(line: 71, column: 21, scope: !127)
!141 = !DILocation(line: 71, column: 10, scope: !127)
!142 = !DILocation(line: 71, column: 19, scope: !127)
!143 = !DILocalVariable(name: "data", scope: !144, file: !21, line: 74, type: !4)
!144 = distinct !DILexicalBlock(scope: !118, file: !21, line: 73, column: 5)
!145 = !DILocation(line: 74, column: 25, scope: !144)
!146 = !DILocation(line: 74, column: 33, scope: !144)
!147 = !DILocation(line: 74, column: 32, scope: !144)
!148 = !DILocalVariable(name: "source", scope: !149, file: !21, line: 76, type: !56)
!149 = distinct !DILexicalBlock(scope: !144, file: !21, line: 75, column: 9)
!150 = !DILocation(line: 76, column: 27, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !152, file: !21, line: 78, type: !62)
!152 = distinct !DILexicalBlock(scope: !149, file: !21, line: 77, column: 13)
!153 = !DILocation(line: 78, column: 24, scope: !152)
!154 = !DILocation(line: 80, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !21, line: 80, column: 17)
!156 = !DILocation(line: 80, column: 22, scope: !155)
!157 = !DILocation(line: 80, column: 29, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !21, line: 80, column: 17)
!159 = !DILocation(line: 80, column: 31, scope: !158)
!160 = !DILocation(line: 80, column: 17, scope: !155)
!161 = !DILocation(line: 82, column: 28, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !21, line: 81, column: 17)
!163 = !DILocation(line: 82, column: 21, scope: !162)
!164 = !DILocation(line: 82, column: 31, scope: !162)
!165 = !DILocation(line: 82, column: 38, scope: !162)
!166 = !DILocation(line: 83, column: 28, scope: !162)
!167 = !DILocation(line: 83, column: 21, scope: !162)
!168 = !DILocation(line: 83, column: 31, scope: !162)
!169 = !DILocation(line: 83, column: 38, scope: !162)
!170 = !DILocation(line: 84, column: 17, scope: !162)
!171 = !DILocation(line: 80, column: 39, scope: !158)
!172 = !DILocation(line: 80, column: 17, scope: !158)
!173 = distinct !{!173, !160, !174, !87}
!174 = !DILocation(line: 84, column: 17, scope: !155)
!175 = !DILocation(line: 87, column: 20, scope: !149)
!176 = !DILocation(line: 87, column: 13, scope: !149)
!177 = !DILocation(line: 88, column: 30, scope: !149)
!178 = !DILocation(line: 88, column: 13, scope: !149)
!179 = !DILocation(line: 89, column: 18, scope: !149)
!180 = !DILocation(line: 89, column: 13, scope: !149)
!181 = !DILocation(line: 92, column: 1, scope: !118)
