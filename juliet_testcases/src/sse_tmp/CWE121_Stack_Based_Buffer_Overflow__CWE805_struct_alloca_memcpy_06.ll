; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
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
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %5, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 0, i32* %intOne, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !63
  store i32 0, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %8, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !72
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !72
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !72
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !73
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 400, align 16, !dbg !105
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !106
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 800, align 16, !dbg !109
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !110
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !108
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !111
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %5, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !130
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !131
  store i32 0, i32* %intOne, align 8, !dbg !132
  %7 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !134
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !135
  store i32 0, i32* %intTwo, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %8, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !143
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !143
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !143
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !144
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = alloca i8, i64 400, align 16, !dbg !152
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !153
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %2 = alloca i8, i64 800, align 16, !dbg !156
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !157
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !155
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !158
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !171
  %cmp = icmp ult i64 %5, 100, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !177
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !178
  store i32 0, i32* %intOne, align 8, !dbg !179
  %7 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !181
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !182
  store i32 0, i32* %intTwo, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %8, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !189
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !190
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !190
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !190
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !190
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !191
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !192
  ret void, !dbg !193
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06_bad", scope: !20, file: !20, line: 25, type: !21, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 27, type: !4)
!24 = !DILocation(line: 27, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 28, type: !4)
!26 = !DILocation(line: 28, column: 21, scope: !19)
!27 = !DILocation(line: 28, column: 54, scope: !19)
!28 = !DILocation(line: 28, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 29, type: !4)
!30 = !DILocation(line: 29, column: 21, scope: !19)
!31 = !DILocation(line: 29, column: 55, scope: !19)
!32 = !DILocation(line: 29, column: 38, scope: !19)
!33 = !DILocation(line: 34, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !20, line: 31, column: 5)
!35 = distinct !DILexicalBlock(scope: !19, file: !20, line: 30, column: 8)
!36 = !DILocation(line: 34, column: 14, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !20, line: 37, type: !39)
!38 = distinct !DILexicalBlock(scope: !19, file: !20, line: 36, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 37, column: 23, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !20, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !20, line: 38, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 39, column: 20, scope: !44)
!49 = !DILocation(line: 41, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !20, line: 41, column: 13)
!51 = !DILocation(line: 41, column: 18, scope: !50)
!52 = !DILocation(line: 41, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !20, line: 41, column: 13)
!54 = !DILocation(line: 41, column: 27, scope: !53)
!55 = !DILocation(line: 41, column: 13, scope: !50)
!56 = !DILocation(line: 43, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !20, line: 42, column: 13)
!58 = !DILocation(line: 43, column: 17, scope: !57)
!59 = !DILocation(line: 43, column: 27, scope: !57)
!60 = !DILocation(line: 43, column: 34, scope: !57)
!61 = !DILocation(line: 44, column: 24, scope: !57)
!62 = !DILocation(line: 44, column: 17, scope: !57)
!63 = !DILocation(line: 44, column: 27, scope: !57)
!64 = !DILocation(line: 44, column: 34, scope: !57)
!65 = !DILocation(line: 45, column: 13, scope: !57)
!66 = !DILocation(line: 41, column: 35, scope: !53)
!67 = !DILocation(line: 41, column: 13, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 45, column: 13, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 48, column: 16, scope: !38)
!72 = !DILocation(line: 48, column: 9, scope: !38)
!73 = !DILocation(line: 49, column: 26, scope: !38)
!74 = !DILocation(line: 49, column: 9, scope: !38)
!75 = !DILocation(line: 51, column: 1, scope: !19)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_06_good", scope: !20, file: !20, line: 118, type: !21, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 120, column: 5, scope: !76)
!78 = !DILocation(line: 121, column: 5, scope: !76)
!79 = !DILocation(line: 122, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 134, type: !81, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!10, !10, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !20, line: 134, type: !10)
!87 = !DILocation(line: 134, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !20, line: 134, type: !83)
!89 = !DILocation(line: 134, column: 27, scope: !80)
!90 = !DILocation(line: 137, column: 22, scope: !80)
!91 = !DILocation(line: 137, column: 12, scope: !80)
!92 = !DILocation(line: 137, column: 5, scope: !80)
!93 = !DILocation(line: 139, column: 5, scope: !80)
!94 = !DILocation(line: 140, column: 5, scope: !80)
!95 = !DILocation(line: 141, column: 5, scope: !80)
!96 = !DILocation(line: 144, column: 5, scope: !80)
!97 = !DILocation(line: 145, column: 5, scope: !80)
!98 = !DILocation(line: 146, column: 5, scope: !80)
!99 = !DILocation(line: 148, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !20, line: 60, type: !4)
!102 = !DILocation(line: 60, column: 21, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !20, line: 61, type: !4)
!104 = !DILocation(line: 61, column: 21, scope: !100)
!105 = !DILocation(line: 61, column: 54, scope: !100)
!106 = !DILocation(line: 61, column: 37, scope: !100)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !20, line: 62, type: !4)
!108 = !DILocation(line: 62, column: 21, scope: !100)
!109 = !DILocation(line: 62, column: 55, scope: !100)
!110 = !DILocation(line: 62, column: 38, scope: !100)
!111 = !DILocation(line: 71, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !20, line: 69, column: 5)
!113 = distinct !DILexicalBlock(scope: !100, file: !20, line: 63, column: 8)
!114 = !DILocation(line: 71, column: 14, scope: !112)
!115 = !DILocalVariable(name: "source", scope: !116, file: !20, line: 74, type: !39)
!116 = distinct !DILexicalBlock(scope: !100, file: !20, line: 73, column: 5)
!117 = !DILocation(line: 74, column: 23, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !20, line: 76, type: !45)
!119 = distinct !DILexicalBlock(scope: !116, file: !20, line: 75, column: 9)
!120 = !DILocation(line: 76, column: 20, scope: !119)
!121 = !DILocation(line: 78, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !20, line: 78, column: 13)
!123 = !DILocation(line: 78, column: 18, scope: !122)
!124 = !DILocation(line: 78, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !20, line: 78, column: 13)
!126 = !DILocation(line: 78, column: 27, scope: !125)
!127 = !DILocation(line: 78, column: 13, scope: !122)
!128 = !DILocation(line: 80, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !20, line: 79, column: 13)
!130 = !DILocation(line: 80, column: 17, scope: !129)
!131 = !DILocation(line: 80, column: 27, scope: !129)
!132 = !DILocation(line: 80, column: 34, scope: !129)
!133 = !DILocation(line: 81, column: 24, scope: !129)
!134 = !DILocation(line: 81, column: 17, scope: !129)
!135 = !DILocation(line: 81, column: 27, scope: !129)
!136 = !DILocation(line: 81, column: 34, scope: !129)
!137 = !DILocation(line: 82, column: 13, scope: !129)
!138 = !DILocation(line: 78, column: 35, scope: !125)
!139 = !DILocation(line: 78, column: 13, scope: !125)
!140 = distinct !{!140, !127, !141, !70}
!141 = !DILocation(line: 82, column: 13, scope: !122)
!142 = !DILocation(line: 85, column: 16, scope: !116)
!143 = !DILocation(line: 85, column: 9, scope: !116)
!144 = !DILocation(line: 86, column: 26, scope: !116)
!145 = !DILocation(line: 86, column: 9, scope: !116)
!146 = !DILocation(line: 88, column: 1, scope: !100)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !20, line: 93, type: !4)
!149 = !DILocation(line: 93, column: 21, scope: !147)
!150 = !DILocalVariable(name: "dataBadBuffer", scope: !147, file: !20, line: 94, type: !4)
!151 = !DILocation(line: 94, column: 21, scope: !147)
!152 = !DILocation(line: 94, column: 54, scope: !147)
!153 = !DILocation(line: 94, column: 37, scope: !147)
!154 = !DILocalVariable(name: "dataGoodBuffer", scope: !147, file: !20, line: 95, type: !4)
!155 = !DILocation(line: 95, column: 21, scope: !147)
!156 = !DILocation(line: 95, column: 55, scope: !147)
!157 = !DILocation(line: 95, column: 38, scope: !147)
!158 = !DILocation(line: 99, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !20, line: 97, column: 5)
!160 = distinct !DILexicalBlock(scope: !147, file: !20, line: 96, column: 8)
!161 = !DILocation(line: 99, column: 14, scope: !159)
!162 = !DILocalVariable(name: "source", scope: !163, file: !20, line: 102, type: !39)
!163 = distinct !DILexicalBlock(scope: !147, file: !20, line: 101, column: 5)
!164 = !DILocation(line: 102, column: 23, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !166, file: !20, line: 104, type: !45)
!166 = distinct !DILexicalBlock(scope: !163, file: !20, line: 103, column: 9)
!167 = !DILocation(line: 104, column: 20, scope: !166)
!168 = !DILocation(line: 106, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !20, line: 106, column: 13)
!170 = !DILocation(line: 106, column: 18, scope: !169)
!171 = !DILocation(line: 106, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !20, line: 106, column: 13)
!173 = !DILocation(line: 106, column: 27, scope: !172)
!174 = !DILocation(line: 106, column: 13, scope: !169)
!175 = !DILocation(line: 108, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !20, line: 107, column: 13)
!177 = !DILocation(line: 108, column: 17, scope: !176)
!178 = !DILocation(line: 108, column: 27, scope: !176)
!179 = !DILocation(line: 108, column: 34, scope: !176)
!180 = !DILocation(line: 109, column: 24, scope: !176)
!181 = !DILocation(line: 109, column: 17, scope: !176)
!182 = !DILocation(line: 109, column: 27, scope: !176)
!183 = !DILocation(line: 109, column: 34, scope: !176)
!184 = !DILocation(line: 110, column: 13, scope: !176)
!185 = !DILocation(line: 106, column: 35, scope: !172)
!186 = !DILocation(line: 106, column: 13, scope: !172)
!187 = distinct !{!187, !174, !188, !70}
!188 = !DILocation(line: 110, column: 13, scope: !169)
!189 = !DILocation(line: 113, column: 16, scope: !163)
!190 = !DILocation(line: 113, column: 9, scope: !163)
!191 = !DILocation(line: 114, column: 26, scope: !163)
!192 = !DILocation(line: 114, column: 9, scope: !163)
!193 = !DILocation(line: 116, column: 1, scope: !147)
