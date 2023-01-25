; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_bad() #0 !dbg !19 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i1 = alloca i64, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 800, align 16, !dbg !33
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !34
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !32
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp slt i32 %4, 1, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !42
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %6, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !57, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i1, align 8, !dbg !63
  br label %for.cond2, !dbg !65

for.cond2:                                        ; preds = %for.inc6, %for.end
  %7 = load i64, i64* %i1, align 8, !dbg !66
  %cmp3 = icmp ult i64 %7, 100, !dbg !68
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !69

for.body4:                                        ; preds = %for.cond2
  %8 = load i64, i64* %i1, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !72
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !73
  store i32 0, i32* %intOne, align 8, !dbg !74
  %9 = load i64, i64* %i1, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !76
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !77
  store i32 0, i32* %intTwo, align 4, !dbg !78
  br label %for.inc6, !dbg !79

for.inc6:                                         ; preds = %for.body4
  %10 = load i64, i64* %i1, align 8, !dbg !80
  %inc7 = add i64 %10, 1, !dbg !80
  store i64 %inc7, i64* %i1, align 8, !dbg !80
  br label %for.cond2, !dbg !81, !llvm.loop !82

for.end8:                                         ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !84, metadata !DIExpression()), !dbg !86
  store i64 0, i64* %i9, align 8, !dbg !87
  br label %for.cond10, !dbg !89

for.cond10:                                       ; preds = %for.inc15, %for.end8
  %11 = load i64, i64* %i9, align 8, !dbg !90
  %cmp11 = icmp ult i64 %11, 100, !dbg !92
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !93

for.body12:                                       ; preds = %for.cond10
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %13 = load i64, i64* %i9, align 8, !dbg !96
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !94
  %14 = load i64, i64* %i9, align 8, !dbg !97
  %arrayidx14 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !98
  %15 = bitcast %struct._twoIntsStruct* %arrayidx13 to i8*, !dbg !98
  %16 = bitcast %struct._twoIntsStruct* %arrayidx14 to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !98
  br label %for.inc15, !dbg !99

for.inc15:                                        ; preds = %for.body12
  %17 = load i64, i64* %i9, align 8, !dbg !100
  %inc16 = add i64 %17, 1, !dbg !100
  store i64 %inc16, i64* %i9, align 8, !dbg !100
  br label %for.cond10, !dbg !101, !llvm.loop !102

for.end17:                                        ; preds = %for.cond10
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %arrayidx18 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !104
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx18), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_good() #0 !dbg !107 {
entry:
  call void @goodG2B(), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !110 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call i64 @time(i64* null) #5, !dbg !120
  %conv = trunc i64 %call to i32, !dbg !121
  call void @srand(i32 %conv) #5, !dbg !122
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !123
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_good(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !126
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_bad(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !130 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i8 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %0 = alloca i8, i64 400, align 16, !dbg !137
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !138
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  %2 = alloca i8, i64 800, align 16, !dbg !141
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !142
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !140
  store i32 0, i32* %h, align 4, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !146
  %cmp = icmp slt i32 %4, 1, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !150
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !154
  %inc = add nsw i32 %6, 1, !dbg !154
  store i32 %inc, i32* %h, align 4, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond1, !dbg !166

for.cond1:                                        ; preds = %for.inc5, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !167
  %cmp2 = icmp ult i64 %7, 100, !dbg !169
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !170

for.body3:                                        ; preds = %for.cond1
  %8 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !173
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !174
  store i32 0, i32* %intOne, align 8, !dbg !175
  %9 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !177
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !178
  store i32 0, i32* %intTwo, align 4, !dbg !179
  br label %for.inc5, !dbg !180

for.inc5:                                         ; preds = %for.body3
  %10 = load i64, i64* %i, align 8, !dbg !181
  %inc6 = add i64 %10, 1, !dbg !181
  store i64 %inc6, i64* %i, align 8, !dbg !181
  br label %for.cond1, !dbg !182, !llvm.loop !183

for.end7:                                         ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i64* %i8, metadata !185, metadata !DIExpression()), !dbg !187
  store i64 0, i64* %i8, align 8, !dbg !188
  br label %for.cond9, !dbg !190

for.cond9:                                        ; preds = %for.inc14, %for.end7
  %11 = load i64, i64* %i8, align 8, !dbg !191
  %cmp10 = icmp ult i64 %11, 100, !dbg !193
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !194

for.body11:                                       ; preds = %for.cond9
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !195
  %13 = load i64, i64* %i8, align 8, !dbg !197
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !195
  %14 = load i64, i64* %i8, align 8, !dbg !198
  %arrayidx13 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !199
  %15 = bitcast %struct._twoIntsStruct* %arrayidx12 to i8*, !dbg !199
  %16 = bitcast %struct._twoIntsStruct* %arrayidx13 to i8*, !dbg !199
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !199
  br label %for.inc14, !dbg !200

for.inc14:                                        ; preds = %for.body11
  %17 = load i64, i64* %i8, align 8, !dbg !201
  %inc15 = add i64 %17, 1, !dbg !201
  store i64 %inc15, i64* %i8, align 8, !dbg !201
  br label %for.cond9, !dbg !202, !llvm.loop !203

for.end16:                                        ; preds = %for.cond9
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !205
  %arrayidx17 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !205
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx17), !dbg !206
  ret void, !dbg !207
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "i", scope: !19, file: !20, line: 23, type: !10)
!24 = !DILocation(line: 23, column: 9, scope: !19)
!25 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 21, scope: !19)
!29 = !DILocation(line: 25, column: 54, scope: !19)
!30 = !DILocation(line: 25, column: 37, scope: !19)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 26, type: !4)
!32 = !DILocation(line: 26, column: 21, scope: !19)
!33 = !DILocation(line: 26, column: 55, scope: !19)
!34 = !DILocation(line: 26, column: 38, scope: !19)
!35 = !DILocation(line: 27, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 27, column: 5)
!37 = !DILocation(line: 27, column: 9, scope: !36)
!38 = !DILocation(line: 27, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !20, line: 27, column: 5)
!40 = !DILocation(line: 27, column: 18, scope: !39)
!41 = !DILocation(line: 27, column: 5, scope: !36)
!42 = !DILocation(line: 31, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !20, line: 28, column: 5)
!44 = !DILocation(line: 31, column: 14, scope: !43)
!45 = !DILocation(line: 32, column: 5, scope: !43)
!46 = !DILocation(line: 27, column: 24, scope: !39)
!47 = !DILocation(line: 27, column: 5, scope: !39)
!48 = distinct !{!48, !41, !49, !50}
!49 = !DILocation(line: 32, column: 5, scope: !36)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !20, line: 34, type: !53)
!52 = distinct !DILexicalBlock(scope: !19, file: !20, line: 33, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 34, column: 23, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !58, file: !20, line: 36, type: !59)
!58 = distinct !DILexicalBlock(scope: !52, file: !20, line: 35, column: 9)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 46, baseType: !61)
!60 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!61 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 36, column: 20, scope: !58)
!63 = !DILocation(line: 38, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !20, line: 38, column: 13)
!65 = !DILocation(line: 38, column: 18, scope: !64)
!66 = !DILocation(line: 38, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !20, line: 38, column: 13)
!68 = !DILocation(line: 38, column: 27, scope: !67)
!69 = !DILocation(line: 38, column: 13, scope: !64)
!70 = !DILocation(line: 40, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !20, line: 39, column: 13)
!72 = !DILocation(line: 40, column: 17, scope: !71)
!73 = !DILocation(line: 40, column: 27, scope: !71)
!74 = !DILocation(line: 40, column: 34, scope: !71)
!75 = !DILocation(line: 41, column: 24, scope: !71)
!76 = !DILocation(line: 41, column: 17, scope: !71)
!77 = !DILocation(line: 41, column: 27, scope: !71)
!78 = !DILocation(line: 41, column: 34, scope: !71)
!79 = !DILocation(line: 42, column: 13, scope: !71)
!80 = !DILocation(line: 38, column: 35, scope: !67)
!81 = !DILocation(line: 38, column: 13, scope: !67)
!82 = distinct !{!82, !69, !83, !50}
!83 = !DILocation(line: 42, column: 13, scope: !64)
!84 = !DILocalVariable(name: "i", scope: !85, file: !20, line: 45, type: !59)
!85 = distinct !DILexicalBlock(scope: !52, file: !20, line: 44, column: 9)
!86 = !DILocation(line: 45, column: 20, scope: !85)
!87 = !DILocation(line: 47, column: 20, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !20, line: 47, column: 13)
!89 = !DILocation(line: 47, column: 18, scope: !88)
!90 = !DILocation(line: 47, column: 25, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !20, line: 47, column: 13)
!92 = !DILocation(line: 47, column: 27, scope: !91)
!93 = !DILocation(line: 47, column: 13, scope: !88)
!94 = !DILocation(line: 49, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !20, line: 48, column: 13)
!96 = !DILocation(line: 49, column: 22, scope: !95)
!97 = !DILocation(line: 49, column: 34, scope: !95)
!98 = !DILocation(line: 49, column: 27, scope: !95)
!99 = !DILocation(line: 50, column: 13, scope: !95)
!100 = !DILocation(line: 47, column: 35, scope: !91)
!101 = !DILocation(line: 47, column: 13, scope: !91)
!102 = distinct !{!102, !93, !103, !50}
!103 = !DILocation(line: 50, column: 13, scope: !88)
!104 = !DILocation(line: 51, column: 30, scope: !85)
!105 = !DILocation(line: 51, column: 13, scope: !85)
!106 = !DILocation(line: 54, column: 1, scope: !19)
!107 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_good", scope: !20, file: !20, line: 95, type: !21, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 97, column: 5, scope: !107)
!109 = !DILocation(line: 98, column: 1, scope: !107)
!110 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 110, type: !111, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DISubroutineType(types: !112)
!112 = !{!10, !10, !113}
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!116 = !DILocalVariable(name: "argc", arg: 1, scope: !110, file: !20, line: 110, type: !10)
!117 = !DILocation(line: 110, column: 14, scope: !110)
!118 = !DILocalVariable(name: "argv", arg: 2, scope: !110, file: !20, line: 110, type: !113)
!119 = !DILocation(line: 110, column: 27, scope: !110)
!120 = !DILocation(line: 113, column: 22, scope: !110)
!121 = !DILocation(line: 113, column: 12, scope: !110)
!122 = !DILocation(line: 113, column: 5, scope: !110)
!123 = !DILocation(line: 115, column: 5, scope: !110)
!124 = !DILocation(line: 116, column: 5, scope: !110)
!125 = !DILocation(line: 117, column: 5, scope: !110)
!126 = !DILocation(line: 120, column: 5, scope: !110)
!127 = !DILocation(line: 121, column: 5, scope: !110)
!128 = !DILocation(line: 122, column: 5, scope: !110)
!129 = !DILocation(line: 124, column: 5, scope: !110)
!130 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "h", scope: !130, file: !20, line: 63, type: !10)
!132 = !DILocation(line: 63, column: 9, scope: !130)
!133 = !DILocalVariable(name: "data", scope: !130, file: !20, line: 64, type: !4)
!134 = !DILocation(line: 64, column: 21, scope: !130)
!135 = !DILocalVariable(name: "dataBadBuffer", scope: !130, file: !20, line: 65, type: !4)
!136 = !DILocation(line: 65, column: 21, scope: !130)
!137 = !DILocation(line: 65, column: 54, scope: !130)
!138 = !DILocation(line: 65, column: 37, scope: !130)
!139 = !DILocalVariable(name: "dataGoodBuffer", scope: !130, file: !20, line: 66, type: !4)
!140 = !DILocation(line: 66, column: 21, scope: !130)
!141 = !DILocation(line: 66, column: 55, scope: !130)
!142 = !DILocation(line: 66, column: 38, scope: !130)
!143 = !DILocation(line: 67, column: 11, scope: !144)
!144 = distinct !DILexicalBlock(scope: !130, file: !20, line: 67, column: 5)
!145 = !DILocation(line: 67, column: 9, scope: !144)
!146 = !DILocation(line: 67, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !20, line: 67, column: 5)
!148 = !DILocation(line: 67, column: 18, scope: !147)
!149 = !DILocation(line: 67, column: 5, scope: !144)
!150 = !DILocation(line: 70, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !20, line: 68, column: 5)
!152 = !DILocation(line: 70, column: 14, scope: !151)
!153 = !DILocation(line: 71, column: 5, scope: !151)
!154 = !DILocation(line: 67, column: 24, scope: !147)
!155 = !DILocation(line: 67, column: 5, scope: !147)
!156 = distinct !{!156, !149, !157, !50}
!157 = !DILocation(line: 71, column: 5, scope: !144)
!158 = !DILocalVariable(name: "source", scope: !159, file: !20, line: 73, type: !53)
!159 = distinct !DILexicalBlock(scope: !130, file: !20, line: 72, column: 5)
!160 = !DILocation(line: 73, column: 23, scope: !159)
!161 = !DILocalVariable(name: "i", scope: !162, file: !20, line: 75, type: !59)
!162 = distinct !DILexicalBlock(scope: !159, file: !20, line: 74, column: 9)
!163 = !DILocation(line: 75, column: 20, scope: !162)
!164 = !DILocation(line: 77, column: 20, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !20, line: 77, column: 13)
!166 = !DILocation(line: 77, column: 18, scope: !165)
!167 = !DILocation(line: 77, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !20, line: 77, column: 13)
!169 = !DILocation(line: 77, column: 27, scope: !168)
!170 = !DILocation(line: 77, column: 13, scope: !165)
!171 = !DILocation(line: 79, column: 24, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !20, line: 78, column: 13)
!173 = !DILocation(line: 79, column: 17, scope: !172)
!174 = !DILocation(line: 79, column: 27, scope: !172)
!175 = !DILocation(line: 79, column: 34, scope: !172)
!176 = !DILocation(line: 80, column: 24, scope: !172)
!177 = !DILocation(line: 80, column: 17, scope: !172)
!178 = !DILocation(line: 80, column: 27, scope: !172)
!179 = !DILocation(line: 80, column: 34, scope: !172)
!180 = !DILocation(line: 81, column: 13, scope: !172)
!181 = !DILocation(line: 77, column: 35, scope: !168)
!182 = !DILocation(line: 77, column: 13, scope: !168)
!183 = distinct !{!183, !170, !184, !50}
!184 = !DILocation(line: 81, column: 13, scope: !165)
!185 = !DILocalVariable(name: "i", scope: !186, file: !20, line: 84, type: !59)
!186 = distinct !DILexicalBlock(scope: !159, file: !20, line: 83, column: 9)
!187 = !DILocation(line: 84, column: 20, scope: !186)
!188 = !DILocation(line: 86, column: 20, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !20, line: 86, column: 13)
!190 = !DILocation(line: 86, column: 18, scope: !189)
!191 = !DILocation(line: 86, column: 25, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !20, line: 86, column: 13)
!193 = !DILocation(line: 86, column: 27, scope: !192)
!194 = !DILocation(line: 86, column: 13, scope: !189)
!195 = !DILocation(line: 88, column: 17, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !20, line: 87, column: 13)
!197 = !DILocation(line: 88, column: 22, scope: !196)
!198 = !DILocation(line: 88, column: 34, scope: !196)
!199 = !DILocation(line: 88, column: 27, scope: !196)
!200 = !DILocation(line: 89, column: 13, scope: !196)
!201 = !DILocation(line: 86, column: 35, scope: !192)
!202 = !DILocation(line: 86, column: 13, scope: !192)
!203 = distinct !{!203, !194, !204, !50}
!204 = !DILocation(line: 89, column: 13, scope: !189)
!205 = !DILocation(line: 90, column: 30, scope: !186)
!206 = !DILocation(line: 90, column: 13, scope: !186)
!207 = !DILocation(line: 93, column: 1, scope: !130)
