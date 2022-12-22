; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !25, metadata !DIExpression()), !dbg !29
  store void (%struct._twoIntsStruct*)* @badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !38
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %5 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !40
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  call void %5(%struct._twoIntsStruct* %6), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(%struct._twoIntsStruct* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %0, 100, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !67
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !68
  store i32 0, i32* %intOne, align 8, !dbg !69
  %2 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !71
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !72
  store i32 0, i32* %intTwo, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %3, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i2, align 8, !dbg !83
  br label %for.cond3, !dbg !85

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !86
  %cmp4 = icmp ult i64 %4, 100, !dbg !88
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !89

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !90
  %6 = load i64, i64* %i2, align 8, !dbg !92
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !90
  %7 = load i64, i64* %i2, align 8, !dbg !93
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !94
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !94
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !94
  br label %for.inc8, !dbg !95

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !96
  %inc9 = add i64 %10, 1, !dbg !96
  store i64 %inc9, i64* %i2, align 8, !dbg !96
  br label %for.cond3, !dbg !97, !llvm.loop !98

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !100
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !100
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44_good() #0 !dbg !103 {
entry:
  call void @goodG2B(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !106 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call i64 @time(i64* null) #5, !dbg !116
  %conv = trunc i64 %call to i32, !dbg !117
  call void @srand(i32 %conv) #5, !dbg !118
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !119
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44_good(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !122
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44_bad(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !124
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !126 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !129, metadata !DIExpression()), !dbg !130
  store void (%struct._twoIntsStruct*)* @goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = alloca i8, i64 400, align 16, !dbg !133
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !134
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = alloca i8, i64 800, align 16, !dbg !137
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !138
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !136
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !139
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %5 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !141
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  call void %5(%struct._twoIntsStruct* %6), !dbg !141
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !144 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %0, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !162
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !163
  store i32 0, i32* %intOne, align 8, !dbg !164
  %2 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !166
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !167
  store i32 0, i32* %intTwo, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %3, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !174, metadata !DIExpression()), !dbg !176
  store i64 0, i64* %i2, align 8, !dbg !177
  br label %for.cond3, !dbg !179

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !180
  %cmp4 = icmp ult i64 %4, 100, !dbg !182
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !183

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !184
  %6 = load i64, i64* %i2, align 8, !dbg !186
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !184
  %7 = load i64, i64* %i2, align 8, !dbg !187
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !188
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !188
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !188
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !188
  br label %for.inc8, !dbg !189

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !190
  %inc9 = add i64 %10, 1, !dbg !190
  store i64 %inc9, i64* %i2, align 8, !dbg !190
  br label %for.cond3, !dbg !191, !llvm.loop !192

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !194
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !194
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !195
  ret void, !dbg !196
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44_bad", scope: !20, file: !20, line: 46, type: !21, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 48, type: !4)
!24 = !DILocation(line: 48, column: 21, scope: !19)
!25 = !DILocalVariable(name: "funcPtr", scope: !19, file: !20, line: 50, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !4}
!29 = !DILocation(line: 50, column: 12, scope: !19)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 51, type: !4)
!31 = !DILocation(line: 51, column: 21, scope: !19)
!32 = !DILocation(line: 51, column: 54, scope: !19)
!33 = !DILocation(line: 51, column: 37, scope: !19)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 52, type: !4)
!35 = !DILocation(line: 52, column: 21, scope: !19)
!36 = !DILocation(line: 52, column: 55, scope: !19)
!37 = !DILocation(line: 52, column: 38, scope: !19)
!38 = !DILocation(line: 55, column: 12, scope: !19)
!39 = !DILocation(line: 55, column: 10, scope: !19)
!40 = !DILocation(line: 57, column: 5, scope: !19)
!41 = !DILocation(line: 57, column: 13, scope: !19)
!42 = !DILocation(line: 58, column: 1, scope: !19)
!43 = distinct !DISubprogram(name: "badSink", scope: !20, file: !20, line: 21, type: !27, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !20, line: 21, type: !4)
!45 = !DILocation(line: 21, column: 37, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !20, line: 24, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !20, line: 23, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 24, column: 23, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !53, file: !20, line: 26, type: !54)
!53 = distinct !DILexicalBlock(scope: !47, file: !20, line: 25, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 26, column: 20, scope: !53)
!58 = !DILocation(line: 28, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !20, line: 28, column: 13)
!60 = !DILocation(line: 28, column: 18, scope: !59)
!61 = !DILocation(line: 28, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !20, line: 28, column: 13)
!63 = !DILocation(line: 28, column: 27, scope: !62)
!64 = !DILocation(line: 28, column: 13, scope: !59)
!65 = !DILocation(line: 30, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !20, line: 29, column: 13)
!67 = !DILocation(line: 30, column: 17, scope: !66)
!68 = !DILocation(line: 30, column: 27, scope: !66)
!69 = !DILocation(line: 30, column: 34, scope: !66)
!70 = !DILocation(line: 31, column: 24, scope: !66)
!71 = !DILocation(line: 31, column: 17, scope: !66)
!72 = !DILocation(line: 31, column: 27, scope: !66)
!73 = !DILocation(line: 31, column: 34, scope: !66)
!74 = !DILocation(line: 32, column: 13, scope: !66)
!75 = !DILocation(line: 28, column: 35, scope: !62)
!76 = !DILocation(line: 28, column: 13, scope: !62)
!77 = distinct !{!77, !64, !78, !79}
!78 = !DILocation(line: 32, column: 13, scope: !59)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocalVariable(name: "i", scope: !81, file: !20, line: 35, type: !54)
!81 = distinct !DILexicalBlock(scope: !47, file: !20, line: 34, column: 9)
!82 = !DILocation(line: 35, column: 20, scope: !81)
!83 = !DILocation(line: 37, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !20, line: 37, column: 13)
!85 = !DILocation(line: 37, column: 18, scope: !84)
!86 = !DILocation(line: 37, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !20, line: 37, column: 13)
!88 = !DILocation(line: 37, column: 27, scope: !87)
!89 = !DILocation(line: 37, column: 13, scope: !84)
!90 = !DILocation(line: 39, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !20, line: 38, column: 13)
!92 = !DILocation(line: 39, column: 22, scope: !91)
!93 = !DILocation(line: 39, column: 34, scope: !91)
!94 = !DILocation(line: 39, column: 27, scope: !91)
!95 = !DILocation(line: 40, column: 13, scope: !91)
!96 = !DILocation(line: 37, column: 35, scope: !87)
!97 = !DILocation(line: 37, column: 13, scope: !87)
!98 = distinct !{!98, !89, !99, !79}
!99 = !DILocation(line: 40, column: 13, scope: !84)
!100 = !DILocation(line: 41, column: 30, scope: !81)
!101 = !DILocation(line: 41, column: 13, scope: !81)
!102 = !DILocation(line: 44, column: 1, scope: !43)
!103 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_44_good", scope: !20, file: !20, line: 101, type: !21, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocation(line: 103, column: 5, scope: !103)
!105 = !DILocation(line: 104, column: 1, scope: !103)
!106 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 115, type: !107, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DISubroutineType(types: !108)
!108 = !{!10, !10, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!112 = !DILocalVariable(name: "argc", arg: 1, scope: !106, file: !20, line: 115, type: !10)
!113 = !DILocation(line: 115, column: 14, scope: !106)
!114 = !DILocalVariable(name: "argv", arg: 2, scope: !106, file: !20, line: 115, type: !109)
!115 = !DILocation(line: 115, column: 27, scope: !106)
!116 = !DILocation(line: 118, column: 22, scope: !106)
!117 = !DILocation(line: 118, column: 12, scope: !106)
!118 = !DILocation(line: 118, column: 5, scope: !106)
!119 = !DILocation(line: 120, column: 5, scope: !106)
!120 = !DILocation(line: 121, column: 5, scope: !106)
!121 = !DILocation(line: 122, column: 5, scope: !106)
!122 = !DILocation(line: 125, column: 5, scope: !106)
!123 = !DILocation(line: 126, column: 5, scope: !106)
!124 = !DILocation(line: 127, column: 5, scope: !106)
!125 = !DILocation(line: 129, column: 5, scope: !106)
!126 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !20, line: 92, type: !4)
!128 = !DILocation(line: 92, column: 21, scope: !126)
!129 = !DILocalVariable(name: "funcPtr", scope: !126, file: !20, line: 93, type: !26)
!130 = !DILocation(line: 93, column: 12, scope: !126)
!131 = !DILocalVariable(name: "dataBadBuffer", scope: !126, file: !20, line: 94, type: !4)
!132 = !DILocation(line: 94, column: 21, scope: !126)
!133 = !DILocation(line: 94, column: 54, scope: !126)
!134 = !DILocation(line: 94, column: 37, scope: !126)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !126, file: !20, line: 95, type: !4)
!136 = !DILocation(line: 95, column: 21, scope: !126)
!137 = !DILocation(line: 95, column: 55, scope: !126)
!138 = !DILocation(line: 95, column: 38, scope: !126)
!139 = !DILocation(line: 97, column: 12, scope: !126)
!140 = !DILocation(line: 97, column: 10, scope: !126)
!141 = !DILocation(line: 98, column: 5, scope: !126)
!142 = !DILocation(line: 98, column: 13, scope: !126)
!143 = !DILocation(line: 99, column: 1, scope: !126)
!144 = distinct !DISubprogram(name: "goodG2BSink", scope: !20, file: !20, line: 65, type: !27, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DILocalVariable(name: "data", arg: 1, scope: !144, file: !20, line: 65, type: !4)
!146 = !DILocation(line: 65, column: 41, scope: !144)
!147 = !DILocalVariable(name: "source", scope: !148, file: !20, line: 68, type: !48)
!148 = distinct !DILexicalBlock(scope: !144, file: !20, line: 67, column: 5)
!149 = !DILocation(line: 68, column: 23, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !20, line: 70, type: !54)
!151 = distinct !DILexicalBlock(scope: !148, file: !20, line: 69, column: 9)
!152 = !DILocation(line: 70, column: 20, scope: !151)
!153 = !DILocation(line: 72, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !20, line: 72, column: 13)
!155 = !DILocation(line: 72, column: 18, scope: !154)
!156 = !DILocation(line: 72, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !20, line: 72, column: 13)
!158 = !DILocation(line: 72, column: 27, scope: !157)
!159 = !DILocation(line: 72, column: 13, scope: !154)
!160 = !DILocation(line: 74, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !20, line: 73, column: 13)
!162 = !DILocation(line: 74, column: 17, scope: !161)
!163 = !DILocation(line: 74, column: 27, scope: !161)
!164 = !DILocation(line: 74, column: 34, scope: !161)
!165 = !DILocation(line: 75, column: 24, scope: !161)
!166 = !DILocation(line: 75, column: 17, scope: !161)
!167 = !DILocation(line: 75, column: 27, scope: !161)
!168 = !DILocation(line: 75, column: 34, scope: !161)
!169 = !DILocation(line: 76, column: 13, scope: !161)
!170 = !DILocation(line: 72, column: 35, scope: !157)
!171 = !DILocation(line: 72, column: 13, scope: !157)
!172 = distinct !{!172, !159, !173, !79}
!173 = !DILocation(line: 76, column: 13, scope: !154)
!174 = !DILocalVariable(name: "i", scope: !175, file: !20, line: 79, type: !54)
!175 = distinct !DILexicalBlock(scope: !148, file: !20, line: 78, column: 9)
!176 = !DILocation(line: 79, column: 20, scope: !175)
!177 = !DILocation(line: 81, column: 20, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !20, line: 81, column: 13)
!179 = !DILocation(line: 81, column: 18, scope: !178)
!180 = !DILocation(line: 81, column: 25, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !20, line: 81, column: 13)
!182 = !DILocation(line: 81, column: 27, scope: !181)
!183 = !DILocation(line: 81, column: 13, scope: !178)
!184 = !DILocation(line: 83, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !20, line: 82, column: 13)
!186 = !DILocation(line: 83, column: 22, scope: !185)
!187 = !DILocation(line: 83, column: 34, scope: !185)
!188 = !DILocation(line: 83, column: 27, scope: !185)
!189 = !DILocation(line: 84, column: 13, scope: !185)
!190 = !DILocation(line: 81, column: 35, scope: !181)
!191 = !DILocation(line: 81, column: 13, scope: !181)
!192 = distinct !{!192, !183, !193, !79}
!193 = !DILocation(line: 84, column: 13, scope: !178)
!194 = !DILocation(line: 85, column: 30, scope: !175)
!195 = !DILocation(line: 85, column: 13, scope: !175)
!196 = !DILocation(line: 88, column: 1, scope: !144)
