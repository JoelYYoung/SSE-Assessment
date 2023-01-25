; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !41
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !42
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !40
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !43
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !44
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !45
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !46
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %8, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %9 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !51
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %9, align 8, !dbg !52
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !53, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %i, metadata !59, metadata !DIExpression()), !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !68
  %cmp = icmp ult i64 %11, 100, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %12 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !74
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !75
  store i32 0, i32* %intOne, align 8, !dbg !76
  %13 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !78
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !79
  store i32 0, i32* %intTwo, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %14, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !87
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !88
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !88
  %17 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %16, i8* align 16 %17, i64 800, i1 false), !dbg !88
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !89
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !89
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #5, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #5, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !118, metadata !DIExpression()), !dbg !119
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !120, metadata !DIExpression()), !dbg !121
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = alloca i8, i64 400, align 16, !dbg !124
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !125
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %2 = alloca i8, i64 800, align 16, !dbg !128
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !129
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !130, metadata !DIExpression()), !dbg !132
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !133
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !134
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !132
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !135
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !136
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !137
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !138
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %8, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !140, metadata !DIExpression()), !dbg !142
  %9 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !143
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %9, align 8, !dbg !144
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data2, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !154
  %cmp = icmp ult i64 %11, 100, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %12 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !160
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !161
  store i32 0, i32* %intOne, align 8, !dbg !162
  %13 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !164
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !165
  store i32 0, i32* %intTwo, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %14, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !172
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !173
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !173
  %17 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !173
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %16, i8* align 16 %17, i64 800, i1 false), !dbg !173
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !174
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !174
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !175
  ret void, !dbg !176
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataPtr1", scope: !19, file: !20, line: 24, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!27 = !DILocation(line: 24, column: 22, scope: !19)
!28 = !DILocalVariable(name: "dataPtr2", scope: !19, file: !20, line: 25, type: !26)
!29 = !DILocation(line: 25, column: 22, scope: !19)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 26, type: !4)
!31 = !DILocation(line: 26, column: 21, scope: !19)
!32 = !DILocation(line: 26, column: 54, scope: !19)
!33 = !DILocation(line: 26, column: 37, scope: !19)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 27, type: !4)
!35 = !DILocation(line: 27, column: 21, scope: !19)
!36 = !DILocation(line: 27, column: 55, scope: !19)
!37 = !DILocation(line: 27, column: 38, scope: !19)
!38 = !DILocalVariable(name: "data", scope: !39, file: !20, line: 29, type: !4)
!39 = distinct !DILexicalBlock(scope: !19, file: !20, line: 28, column: 5)
!40 = !DILocation(line: 29, column: 25, scope: !39)
!41 = !DILocation(line: 29, column: 33, scope: !39)
!42 = !DILocation(line: 29, column: 32, scope: !39)
!43 = !DILocation(line: 32, column: 16, scope: !39)
!44 = !DILocation(line: 32, column: 14, scope: !39)
!45 = !DILocation(line: 33, column: 21, scope: !39)
!46 = !DILocation(line: 33, column: 10, scope: !39)
!47 = !DILocation(line: 33, column: 19, scope: !39)
!48 = !DILocalVariable(name: "data", scope: !49, file: !20, line: 36, type: !4)
!49 = distinct !DILexicalBlock(scope: !19, file: !20, line: 35, column: 5)
!50 = !DILocation(line: 36, column: 25, scope: !49)
!51 = !DILocation(line: 36, column: 33, scope: !49)
!52 = !DILocation(line: 36, column: 32, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !20, line: 38, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !20, line: 37, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 38, column: 27, scope: !54)
!59 = !DILocalVariable(name: "i", scope: !60, file: !20, line: 40, type: !61)
!60 = distinct !DILexicalBlock(scope: !54, file: !20, line: 39, column: 13)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !62, line: 46, baseType: !63)
!62 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!63 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!64 = !DILocation(line: 40, column: 24, scope: !60)
!65 = !DILocation(line: 42, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !20, line: 42, column: 17)
!67 = !DILocation(line: 42, column: 22, scope: !66)
!68 = !DILocation(line: 42, column: 29, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !20, line: 42, column: 17)
!70 = !DILocation(line: 42, column: 31, scope: !69)
!71 = !DILocation(line: 42, column: 17, scope: !66)
!72 = !DILocation(line: 44, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !20, line: 43, column: 17)
!74 = !DILocation(line: 44, column: 21, scope: !73)
!75 = !DILocation(line: 44, column: 31, scope: !73)
!76 = !DILocation(line: 44, column: 38, scope: !73)
!77 = !DILocation(line: 45, column: 28, scope: !73)
!78 = !DILocation(line: 45, column: 21, scope: !73)
!79 = !DILocation(line: 45, column: 31, scope: !73)
!80 = !DILocation(line: 45, column: 38, scope: !73)
!81 = !DILocation(line: 46, column: 17, scope: !73)
!82 = !DILocation(line: 42, column: 39, scope: !69)
!83 = !DILocation(line: 42, column: 17, scope: !69)
!84 = distinct !{!84, !71, !85, !86}
!85 = !DILocation(line: 46, column: 17, scope: !66)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 49, column: 20, scope: !54)
!88 = !DILocation(line: 49, column: 13, scope: !54)
!89 = !DILocation(line: 50, column: 30, scope: !54)
!90 = !DILocation(line: 50, column: 13, scope: !54)
!91 = !DILocation(line: 53, column: 1, scope: !19)
!92 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_32_good", scope: !20, file: !20, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 95, column: 5, scope: !92)
!94 = !DILocation(line: 96, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 107, type: !96, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!10, !10, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !20, line: 107, type: !10)
!102 = !DILocation(line: 107, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !20, line: 107, type: !98)
!104 = !DILocation(line: 107, column: 27, scope: !95)
!105 = !DILocation(line: 110, column: 22, scope: !95)
!106 = !DILocation(line: 110, column: 12, scope: !95)
!107 = !DILocation(line: 110, column: 5, scope: !95)
!108 = !DILocation(line: 112, column: 5, scope: !95)
!109 = !DILocation(line: 113, column: 5, scope: !95)
!110 = !DILocation(line: 114, column: 5, scope: !95)
!111 = !DILocation(line: 117, column: 5, scope: !95)
!112 = !DILocation(line: 118, column: 5, scope: !95)
!113 = !DILocation(line: 119, column: 5, scope: !95)
!114 = !DILocation(line: 121, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !20, line: 62, type: !4)
!117 = !DILocation(line: 62, column: 21, scope: !115)
!118 = !DILocalVariable(name: "dataPtr1", scope: !115, file: !20, line: 63, type: !26)
!119 = !DILocation(line: 63, column: 22, scope: !115)
!120 = !DILocalVariable(name: "dataPtr2", scope: !115, file: !20, line: 64, type: !26)
!121 = !DILocation(line: 64, column: 22, scope: !115)
!122 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !20, line: 65, type: !4)
!123 = !DILocation(line: 65, column: 21, scope: !115)
!124 = !DILocation(line: 65, column: 54, scope: !115)
!125 = !DILocation(line: 65, column: 37, scope: !115)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !20, line: 66, type: !4)
!127 = !DILocation(line: 66, column: 21, scope: !115)
!128 = !DILocation(line: 66, column: 55, scope: !115)
!129 = !DILocation(line: 66, column: 38, scope: !115)
!130 = !DILocalVariable(name: "data", scope: !131, file: !20, line: 68, type: !4)
!131 = distinct !DILexicalBlock(scope: !115, file: !20, line: 67, column: 5)
!132 = !DILocation(line: 68, column: 25, scope: !131)
!133 = !DILocation(line: 68, column: 33, scope: !131)
!134 = !DILocation(line: 68, column: 32, scope: !131)
!135 = !DILocation(line: 70, column: 16, scope: !131)
!136 = !DILocation(line: 70, column: 14, scope: !131)
!137 = !DILocation(line: 71, column: 21, scope: !131)
!138 = !DILocation(line: 71, column: 10, scope: !131)
!139 = !DILocation(line: 71, column: 19, scope: !131)
!140 = !DILocalVariable(name: "data", scope: !141, file: !20, line: 74, type: !4)
!141 = distinct !DILexicalBlock(scope: !115, file: !20, line: 73, column: 5)
!142 = !DILocation(line: 74, column: 25, scope: !141)
!143 = !DILocation(line: 74, column: 33, scope: !141)
!144 = !DILocation(line: 74, column: 32, scope: !141)
!145 = !DILocalVariable(name: "source", scope: !146, file: !20, line: 76, type: !55)
!146 = distinct !DILexicalBlock(scope: !141, file: !20, line: 75, column: 9)
!147 = !DILocation(line: 76, column: 27, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !20, line: 78, type: !61)
!149 = distinct !DILexicalBlock(scope: !146, file: !20, line: 77, column: 13)
!150 = !DILocation(line: 78, column: 24, scope: !149)
!151 = !DILocation(line: 80, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !20, line: 80, column: 17)
!153 = !DILocation(line: 80, column: 22, scope: !152)
!154 = !DILocation(line: 80, column: 29, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !20, line: 80, column: 17)
!156 = !DILocation(line: 80, column: 31, scope: !155)
!157 = !DILocation(line: 80, column: 17, scope: !152)
!158 = !DILocation(line: 82, column: 28, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !20, line: 81, column: 17)
!160 = !DILocation(line: 82, column: 21, scope: !159)
!161 = !DILocation(line: 82, column: 31, scope: !159)
!162 = !DILocation(line: 82, column: 38, scope: !159)
!163 = !DILocation(line: 83, column: 28, scope: !159)
!164 = !DILocation(line: 83, column: 21, scope: !159)
!165 = !DILocation(line: 83, column: 31, scope: !159)
!166 = !DILocation(line: 83, column: 38, scope: !159)
!167 = !DILocation(line: 84, column: 17, scope: !159)
!168 = !DILocation(line: 80, column: 39, scope: !155)
!169 = !DILocation(line: 80, column: 17, scope: !155)
!170 = distinct !{!170, !157, !171, !86}
!171 = !DILocation(line: 84, column: 17, scope: !152)
!172 = !DILocation(line: 87, column: 20, scope: !146)
!173 = !DILocation(line: 87, column: 13, scope: !146)
!174 = !DILocation(line: 88, column: 30, scope: !146)
!175 = !DILocation(line: 88, column: 13, scope: !146)
!176 = !DILocation(line: 91, column: 1, scope: !115)
