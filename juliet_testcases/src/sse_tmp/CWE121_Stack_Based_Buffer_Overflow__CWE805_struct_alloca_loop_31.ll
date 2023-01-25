; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !33
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !41
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %7, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %10, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i3, align 8, !dbg !79
  br label %for.cond4, !dbg !81

for.cond4:                                        ; preds = %for.inc9, %for.end
  %11 = load i64, i64* %i3, align 8, !dbg !82
  %cmp5 = icmp ult i64 %11, 100, !dbg !84
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !85

for.body6:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !86
  %13 = load i64, i64* %i3, align 8, !dbg !88
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !86
  %14 = load i64, i64* %i3, align 8, !dbg !89
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !90
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !90
  %16 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !90
  br label %for.inc9, !dbg !91

for.inc9:                                         ; preds = %for.body6
  %17 = load i64, i64* %i3, align 8, !dbg !92
  %inc10 = add i64 %17, 1, !dbg !92
  store i64 %inc10, i64* %i3, align 8, !dbg !92
  br label %for.cond4, !dbg !93, !llvm.loop !94

for.end11:                                        ; preds = %for.cond4
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !96
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !96
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31_good() #0 !dbg !99 {
entry:
  call void @goodG2B(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i64 @time(i64* null) #5, !dbg !112
  %conv = trunc i64 %call to i32, !dbg !113
  call void @srand(i32 %conv) #5, !dbg !114
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31_good(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31_bad(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  ret i32 0, !dbg !121
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !122 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = alloca i8, i64 400, align 16, !dbg !127
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !128
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = alloca i8, i64 800, align 16, !dbg !131
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !132
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !130
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !133
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !135, metadata !DIExpression()), !dbg !137
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !138
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !139, metadata !DIExpression()), !dbg !140
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !141
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !151
  %cmp = icmp ult i64 %7, 100, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !157
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !158
  store i32 0, i32* %intOne, align 8, !dbg !159
  %9 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !161
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !162
  store i32 0, i32* %intTwo, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %10, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !169, metadata !DIExpression()), !dbg !171
  store i64 0, i64* %i3, align 8, !dbg !172
  br label %for.cond4, !dbg !174

for.cond4:                                        ; preds = %for.inc9, %for.end
  %11 = load i64, i64* %i3, align 8, !dbg !175
  %cmp5 = icmp ult i64 %11, 100, !dbg !177
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !178

for.body6:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !179
  %13 = load i64, i64* %i3, align 8, !dbg !181
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !179
  %14 = load i64, i64* %i3, align 8, !dbg !182
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !183
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !183
  %16 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !183
  br label %for.inc9, !dbg !184

for.inc9:                                         ; preds = %for.body6
  %17 = load i64, i64* %i3, align 8, !dbg !185
  %inc10 = add i64 %17, 1, !dbg !185
  store i64 %inc10, i64* %i3, align 8, !dbg !185
  br label %for.cond4, !dbg !186, !llvm.loop !187

for.end11:                                        ; preds = %for.cond4
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !189
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !189
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !190
  ret void, !dbg !191
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocation(line: 24, column: 54, scope: !19)
!28 = !DILocation(line: 24, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 21, scope: !19)
!31 = !DILocation(line: 25, column: 55, scope: !19)
!32 = !DILocation(line: 25, column: 38, scope: !19)
!33 = !DILocation(line: 28, column: 12, scope: !19)
!34 = !DILocation(line: 28, column: 10, scope: !19)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !20, line: 30, type: !4)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 29, column: 5)
!37 = !DILocation(line: 30, column: 25, scope: !36)
!38 = !DILocation(line: 30, column: 36, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !20, line: 31, type: !4)
!40 = !DILocation(line: 31, column: 25, scope: !36)
!41 = !DILocation(line: 31, column: 32, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !20, line: 33, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !20, line: 32, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 33, column: 27, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !49, file: !20, line: 35, type: !50)
!49 = distinct !DILexicalBlock(scope: !43, file: !20, line: 34, column: 13)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 35, column: 24, scope: !49)
!54 = !DILocation(line: 37, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !20, line: 37, column: 17)
!56 = !DILocation(line: 37, column: 22, scope: !55)
!57 = !DILocation(line: 37, column: 29, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !20, line: 37, column: 17)
!59 = !DILocation(line: 37, column: 31, scope: !58)
!60 = !DILocation(line: 37, column: 17, scope: !55)
!61 = !DILocation(line: 39, column: 28, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !20, line: 38, column: 17)
!63 = !DILocation(line: 39, column: 21, scope: !62)
!64 = !DILocation(line: 39, column: 31, scope: !62)
!65 = !DILocation(line: 39, column: 38, scope: !62)
!66 = !DILocation(line: 40, column: 28, scope: !62)
!67 = !DILocation(line: 40, column: 21, scope: !62)
!68 = !DILocation(line: 40, column: 31, scope: !62)
!69 = !DILocation(line: 40, column: 38, scope: !62)
!70 = !DILocation(line: 41, column: 17, scope: !62)
!71 = !DILocation(line: 37, column: 39, scope: !58)
!72 = !DILocation(line: 37, column: 17, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 41, column: 17, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocalVariable(name: "i", scope: !77, file: !20, line: 44, type: !50)
!77 = distinct !DILexicalBlock(scope: !43, file: !20, line: 43, column: 13)
!78 = !DILocation(line: 44, column: 24, scope: !77)
!79 = !DILocation(line: 46, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !20, line: 46, column: 17)
!81 = !DILocation(line: 46, column: 22, scope: !80)
!82 = !DILocation(line: 46, column: 29, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !20, line: 46, column: 17)
!84 = !DILocation(line: 46, column: 31, scope: !83)
!85 = !DILocation(line: 46, column: 17, scope: !80)
!86 = !DILocation(line: 48, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !20, line: 47, column: 17)
!88 = !DILocation(line: 48, column: 26, scope: !87)
!89 = !DILocation(line: 48, column: 38, scope: !87)
!90 = !DILocation(line: 48, column: 31, scope: !87)
!91 = !DILocation(line: 49, column: 17, scope: !87)
!92 = !DILocation(line: 46, column: 39, scope: !83)
!93 = !DILocation(line: 46, column: 17, scope: !83)
!94 = distinct !{!94, !85, !95, !75}
!95 = !DILocation(line: 49, column: 17, scope: !80)
!96 = !DILocation(line: 50, column: 34, scope: !77)
!97 = !DILocation(line: 50, column: 17, scope: !77)
!98 = !DILocation(line: 54, column: 1, scope: !19)
!99 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_31_good", scope: !20, file: !20, line: 95, type: !21, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocation(line: 97, column: 5, scope: !99)
!101 = !DILocation(line: 98, column: 1, scope: !99)
!102 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 109, type: !103, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!10, !10, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!108 = !DILocalVariable(name: "argc", arg: 1, scope: !102, file: !20, line: 109, type: !10)
!109 = !DILocation(line: 109, column: 14, scope: !102)
!110 = !DILocalVariable(name: "argv", arg: 2, scope: !102, file: !20, line: 109, type: !105)
!111 = !DILocation(line: 109, column: 27, scope: !102)
!112 = !DILocation(line: 112, column: 22, scope: !102)
!113 = !DILocation(line: 112, column: 12, scope: !102)
!114 = !DILocation(line: 112, column: 5, scope: !102)
!115 = !DILocation(line: 114, column: 5, scope: !102)
!116 = !DILocation(line: 115, column: 5, scope: !102)
!117 = !DILocation(line: 116, column: 5, scope: !102)
!118 = !DILocation(line: 119, column: 5, scope: !102)
!119 = !DILocation(line: 120, column: 5, scope: !102)
!120 = !DILocation(line: 121, column: 5, scope: !102)
!121 = !DILocation(line: 123, column: 5, scope: !102)
!122 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !20, line: 63, type: !4)
!124 = !DILocation(line: 63, column: 21, scope: !122)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !122, file: !20, line: 64, type: !4)
!126 = !DILocation(line: 64, column: 21, scope: !122)
!127 = !DILocation(line: 64, column: 54, scope: !122)
!128 = !DILocation(line: 64, column: 37, scope: !122)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !122, file: !20, line: 65, type: !4)
!130 = !DILocation(line: 65, column: 21, scope: !122)
!131 = !DILocation(line: 65, column: 55, scope: !122)
!132 = !DILocation(line: 65, column: 38, scope: !122)
!133 = !DILocation(line: 67, column: 12, scope: !122)
!134 = !DILocation(line: 67, column: 10, scope: !122)
!135 = !DILocalVariable(name: "dataCopy", scope: !136, file: !20, line: 69, type: !4)
!136 = distinct !DILexicalBlock(scope: !122, file: !20, line: 68, column: 5)
!137 = !DILocation(line: 69, column: 25, scope: !136)
!138 = !DILocation(line: 69, column: 36, scope: !136)
!139 = !DILocalVariable(name: "data", scope: !136, file: !20, line: 70, type: !4)
!140 = !DILocation(line: 70, column: 25, scope: !136)
!141 = !DILocation(line: 70, column: 32, scope: !136)
!142 = !DILocalVariable(name: "source", scope: !143, file: !20, line: 72, type: !44)
!143 = distinct !DILexicalBlock(scope: !136, file: !20, line: 71, column: 9)
!144 = !DILocation(line: 72, column: 27, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !20, line: 74, type: !50)
!146 = distinct !DILexicalBlock(scope: !143, file: !20, line: 73, column: 13)
!147 = !DILocation(line: 74, column: 24, scope: !146)
!148 = !DILocation(line: 76, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !20, line: 76, column: 17)
!150 = !DILocation(line: 76, column: 22, scope: !149)
!151 = !DILocation(line: 76, column: 29, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !20, line: 76, column: 17)
!153 = !DILocation(line: 76, column: 31, scope: !152)
!154 = !DILocation(line: 76, column: 17, scope: !149)
!155 = !DILocation(line: 78, column: 28, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !20, line: 77, column: 17)
!157 = !DILocation(line: 78, column: 21, scope: !156)
!158 = !DILocation(line: 78, column: 31, scope: !156)
!159 = !DILocation(line: 78, column: 38, scope: !156)
!160 = !DILocation(line: 79, column: 28, scope: !156)
!161 = !DILocation(line: 79, column: 21, scope: !156)
!162 = !DILocation(line: 79, column: 31, scope: !156)
!163 = !DILocation(line: 79, column: 38, scope: !156)
!164 = !DILocation(line: 80, column: 17, scope: !156)
!165 = !DILocation(line: 76, column: 39, scope: !152)
!166 = !DILocation(line: 76, column: 17, scope: !152)
!167 = distinct !{!167, !154, !168, !75}
!168 = !DILocation(line: 80, column: 17, scope: !149)
!169 = !DILocalVariable(name: "i", scope: !170, file: !20, line: 83, type: !50)
!170 = distinct !DILexicalBlock(scope: !143, file: !20, line: 82, column: 13)
!171 = !DILocation(line: 83, column: 24, scope: !170)
!172 = !DILocation(line: 85, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !20, line: 85, column: 17)
!174 = !DILocation(line: 85, column: 22, scope: !173)
!175 = !DILocation(line: 85, column: 29, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !20, line: 85, column: 17)
!177 = !DILocation(line: 85, column: 31, scope: !176)
!178 = !DILocation(line: 85, column: 17, scope: !173)
!179 = !DILocation(line: 87, column: 21, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !20, line: 86, column: 17)
!181 = !DILocation(line: 87, column: 26, scope: !180)
!182 = !DILocation(line: 87, column: 38, scope: !180)
!183 = !DILocation(line: 87, column: 31, scope: !180)
!184 = !DILocation(line: 88, column: 17, scope: !180)
!185 = !DILocation(line: 85, column: 39, scope: !176)
!186 = !DILocation(line: 85, column: 17, scope: !176)
!187 = distinct !{!187, !178, !188, !75}
!188 = !DILocation(line: 88, column: 17, scope: !173)
!189 = !DILocation(line: 89, column: 34, scope: !170)
!190 = !DILocation(line: 89, column: 17, scope: !170)
!191 = !DILocation(line: 93, column: 1, scope: !122)
