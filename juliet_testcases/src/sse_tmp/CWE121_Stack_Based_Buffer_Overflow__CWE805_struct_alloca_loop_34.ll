; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion, metadata !25, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = alloca i8, i64 400, align 16, !dbg !34
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !36, metadata !DIExpression()), !dbg !37
  %2 = alloca i8, i64 800, align 16, !dbg !38
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !39
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !37
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !40
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !43
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !48
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !48
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !64
  %cmp = icmp ult i64 %7, 100, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !70
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !71
  store i32 0, i32* %intOne, align 8, !dbg !72
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !74
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !75
  store i32 0, i32* %intTwo, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %10, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !83, metadata !DIExpression()), !dbg !85
  store i64 0, i64* %i3, align 8, !dbg !86
  br label %for.cond4, !dbg !88

for.cond4:                                        ; preds = %for.inc9, %for.end
  %11 = load i64, i64* %i3, align 8, !dbg !89
  %cmp5 = icmp ult i64 %11, 100, !dbg !91
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !92

for.body6:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !93
  %13 = load i64, i64* %i3, align 8, !dbg !95
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !93
  %14 = load i64, i64* %i3, align 8, !dbg !96
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !97
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !97
  %16 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !97
  br label %for.inc9, !dbg !98

for.inc9:                                         ; preds = %for.body6
  %17 = load i64, i64* %i3, align 8, !dbg !99
  %inc10 = add i64 %17, 1, !dbg !99
  store i64 %inc10, i64* %i3, align 8, !dbg !99
  br label %for.cond4, !dbg !100, !llvm.loop !101

for.end11:                                        ; preds = %for.cond4
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !103
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !103
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_good() #0 !dbg !106 {
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
  %call = call i64 @time(i64* null) #5, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #5, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %0 = alloca i8, i64 400, align 16, !dbg !136
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !137
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %2 = alloca i8, i64 800, align 16, !dbg !140
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !141
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !139
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !142
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !145
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !147, metadata !DIExpression()), !dbg !149
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !150
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !150
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !151, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !160
  %cmp = icmp ult i64 %7, 100, !dbg !162
  br i1 %cmp, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !166
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !167
  store i32 0, i32* %intOne, align 8, !dbg !168
  %9 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !170
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !171
  store i32 0, i32* %intTwo, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %10, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !178, metadata !DIExpression()), !dbg !180
  store i64 0, i64* %i3, align 8, !dbg !181
  br label %for.cond4, !dbg !183

for.cond4:                                        ; preds = %for.inc9, %for.end
  %11 = load i64, i64* %i3, align 8, !dbg !184
  %cmp5 = icmp ult i64 %11, 100, !dbg !186
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !187

for.body6:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !188
  %13 = load i64, i64* %i3, align 8, !dbg !190
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !188
  %14 = load i64, i64* %i3, align 8, !dbg !191
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !192
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !192
  %16 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !192
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !192
  br label %for.inc9, !dbg !193

for.inc9:                                         ; preds = %for.body6
  %17 = load i64, i64* %i3, align 8, !dbg !194
  %inc10 = add i64 %17, 1, !dbg !194
  store i64 %inc10, i64* %i3, align 8, !dbg !194
  br label %for.cond4, !dbg !195, !llvm.loop !196

for.end11:                                        ; preds = %for.cond4
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !198
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !198
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_bad", scope: !20, file: !20, line: 27, type: !21, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 29, type: !4)
!24 = !DILocation(line: 29, column: 21, scope: !19)
!25 = !DILocalVariable(name: "myUnion", scope: !19, file: !20, line: 30, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType", file: !20, line: 23, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !20, line: 19, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !27, file: !20, line: 21, baseType: !4, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !27, file: !20, line: 22, baseType: !4, size: 64)
!31 = !DILocation(line: 30, column: 80, scope: !19)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 31, type: !4)
!33 = !DILocation(line: 31, column: 21, scope: !19)
!34 = !DILocation(line: 31, column: 54, scope: !19)
!35 = !DILocation(line: 31, column: 37, scope: !19)
!36 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 32, type: !4)
!37 = !DILocation(line: 32, column: 21, scope: !19)
!38 = !DILocation(line: 32, column: 55, scope: !19)
!39 = !DILocation(line: 32, column: 38, scope: !19)
!40 = !DILocation(line: 35, column: 12, scope: !19)
!41 = !DILocation(line: 35, column: 10, scope: !19)
!42 = !DILocation(line: 36, column: 26, scope: !19)
!43 = !DILocation(line: 36, column: 13, scope: !19)
!44 = !DILocation(line: 36, column: 24, scope: !19)
!45 = !DILocalVariable(name: "data", scope: !46, file: !20, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !19, file: !20, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 25, scope: !46)
!48 = !DILocation(line: 38, column: 40, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !20, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !20, line: 39, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 40, column: 27, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !56, file: !20, line: 42, type: !57)
!56 = distinct !DILexicalBlock(scope: !50, file: !20, line: 41, column: 13)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 46, baseType: !59)
!58 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!59 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 42, column: 24, scope: !56)
!61 = !DILocation(line: 44, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !20, line: 44, column: 17)
!63 = !DILocation(line: 44, column: 22, scope: !62)
!64 = !DILocation(line: 44, column: 29, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !20, line: 44, column: 17)
!66 = !DILocation(line: 44, column: 31, scope: !65)
!67 = !DILocation(line: 44, column: 17, scope: !62)
!68 = !DILocation(line: 46, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !20, line: 45, column: 17)
!70 = !DILocation(line: 46, column: 21, scope: !69)
!71 = !DILocation(line: 46, column: 31, scope: !69)
!72 = !DILocation(line: 46, column: 38, scope: !69)
!73 = !DILocation(line: 47, column: 28, scope: !69)
!74 = !DILocation(line: 47, column: 21, scope: !69)
!75 = !DILocation(line: 47, column: 31, scope: !69)
!76 = !DILocation(line: 47, column: 38, scope: !69)
!77 = !DILocation(line: 48, column: 17, scope: !69)
!78 = !DILocation(line: 44, column: 39, scope: !65)
!79 = !DILocation(line: 44, column: 17, scope: !65)
!80 = distinct !{!80, !67, !81, !82}
!81 = !DILocation(line: 48, column: 17, scope: !62)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocalVariable(name: "i", scope: !84, file: !20, line: 51, type: !57)
!84 = distinct !DILexicalBlock(scope: !50, file: !20, line: 50, column: 13)
!85 = !DILocation(line: 51, column: 24, scope: !84)
!86 = !DILocation(line: 53, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !20, line: 53, column: 17)
!88 = !DILocation(line: 53, column: 22, scope: !87)
!89 = !DILocation(line: 53, column: 29, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !20, line: 53, column: 17)
!91 = !DILocation(line: 53, column: 31, scope: !90)
!92 = !DILocation(line: 53, column: 17, scope: !87)
!93 = !DILocation(line: 55, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !20, line: 54, column: 17)
!95 = !DILocation(line: 55, column: 26, scope: !94)
!96 = !DILocation(line: 55, column: 38, scope: !94)
!97 = !DILocation(line: 55, column: 31, scope: !94)
!98 = !DILocation(line: 56, column: 17, scope: !94)
!99 = !DILocation(line: 53, column: 39, scope: !90)
!100 = !DILocation(line: 53, column: 17, scope: !90)
!101 = distinct !{!101, !92, !102, !82}
!102 = !DILocation(line: 56, column: 17, scope: !87)
!103 = !DILocation(line: 57, column: 34, scope: !84)
!104 = !DILocation(line: 57, column: 17, scope: !84)
!105 = !DILocation(line: 61, column: 1, scope: !19)
!106 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_good", scope: !20, file: !20, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 105, column: 5, scope: !106)
!108 = !DILocation(line: 106, column: 1, scope: !106)
!109 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 117, type: !110, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!10, !10, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !20, line: 117, type: !10)
!116 = !DILocation(line: 117, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !20, line: 117, type: !112)
!118 = !DILocation(line: 117, column: 27, scope: !109)
!119 = !DILocation(line: 120, column: 22, scope: !109)
!120 = !DILocation(line: 120, column: 12, scope: !109)
!121 = !DILocation(line: 120, column: 5, scope: !109)
!122 = !DILocation(line: 122, column: 5, scope: !109)
!123 = !DILocation(line: 123, column: 5, scope: !109)
!124 = !DILocation(line: 124, column: 5, scope: !109)
!125 = !DILocation(line: 127, column: 5, scope: !109)
!126 = !DILocation(line: 128, column: 5, scope: !109)
!127 = !DILocation(line: 129, column: 5, scope: !109)
!128 = !DILocation(line: 131, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 68, type: !21, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !20, line: 70, type: !4)
!131 = !DILocation(line: 70, column: 21, scope: !129)
!132 = !DILocalVariable(name: "myUnion", scope: !129, file: !20, line: 71, type: !26)
!133 = !DILocation(line: 71, column: 80, scope: !129)
!134 = !DILocalVariable(name: "dataBadBuffer", scope: !129, file: !20, line: 72, type: !4)
!135 = !DILocation(line: 72, column: 21, scope: !129)
!136 = !DILocation(line: 72, column: 54, scope: !129)
!137 = !DILocation(line: 72, column: 37, scope: !129)
!138 = !DILocalVariable(name: "dataGoodBuffer", scope: !129, file: !20, line: 73, type: !4)
!139 = !DILocation(line: 73, column: 21, scope: !129)
!140 = !DILocation(line: 73, column: 55, scope: !129)
!141 = !DILocation(line: 73, column: 38, scope: !129)
!142 = !DILocation(line: 75, column: 12, scope: !129)
!143 = !DILocation(line: 75, column: 10, scope: !129)
!144 = !DILocation(line: 76, column: 26, scope: !129)
!145 = !DILocation(line: 76, column: 13, scope: !129)
!146 = !DILocation(line: 76, column: 24, scope: !129)
!147 = !DILocalVariable(name: "data", scope: !148, file: !20, line: 78, type: !4)
!148 = distinct !DILexicalBlock(scope: !129, file: !20, line: 77, column: 5)
!149 = !DILocation(line: 78, column: 25, scope: !148)
!150 = !DILocation(line: 78, column: 40, scope: !148)
!151 = !DILocalVariable(name: "source", scope: !152, file: !20, line: 80, type: !51)
!152 = distinct !DILexicalBlock(scope: !148, file: !20, line: 79, column: 9)
!153 = !DILocation(line: 80, column: 27, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !155, file: !20, line: 82, type: !57)
!155 = distinct !DILexicalBlock(scope: !152, file: !20, line: 81, column: 13)
!156 = !DILocation(line: 82, column: 24, scope: !155)
!157 = !DILocation(line: 84, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !20, line: 84, column: 17)
!159 = !DILocation(line: 84, column: 22, scope: !158)
!160 = !DILocation(line: 84, column: 29, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !20, line: 84, column: 17)
!162 = !DILocation(line: 84, column: 31, scope: !161)
!163 = !DILocation(line: 84, column: 17, scope: !158)
!164 = !DILocation(line: 86, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !20, line: 85, column: 17)
!166 = !DILocation(line: 86, column: 21, scope: !165)
!167 = !DILocation(line: 86, column: 31, scope: !165)
!168 = !DILocation(line: 86, column: 38, scope: !165)
!169 = !DILocation(line: 87, column: 28, scope: !165)
!170 = !DILocation(line: 87, column: 21, scope: !165)
!171 = !DILocation(line: 87, column: 31, scope: !165)
!172 = !DILocation(line: 87, column: 38, scope: !165)
!173 = !DILocation(line: 88, column: 17, scope: !165)
!174 = !DILocation(line: 84, column: 39, scope: !161)
!175 = !DILocation(line: 84, column: 17, scope: !161)
!176 = distinct !{!176, !163, !177, !82}
!177 = !DILocation(line: 88, column: 17, scope: !158)
!178 = !DILocalVariable(name: "i", scope: !179, file: !20, line: 91, type: !57)
!179 = distinct !DILexicalBlock(scope: !152, file: !20, line: 90, column: 13)
!180 = !DILocation(line: 91, column: 24, scope: !179)
!181 = !DILocation(line: 93, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !20, line: 93, column: 17)
!183 = !DILocation(line: 93, column: 22, scope: !182)
!184 = !DILocation(line: 93, column: 29, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !20, line: 93, column: 17)
!186 = !DILocation(line: 93, column: 31, scope: !185)
!187 = !DILocation(line: 93, column: 17, scope: !182)
!188 = !DILocation(line: 95, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !20, line: 94, column: 17)
!190 = !DILocation(line: 95, column: 26, scope: !189)
!191 = !DILocation(line: 95, column: 38, scope: !189)
!192 = !DILocation(line: 95, column: 31, scope: !189)
!193 = !DILocation(line: 96, column: 17, scope: !189)
!194 = !DILocation(line: 93, column: 39, scope: !185)
!195 = !DILocation(line: 93, column: 17, scope: !185)
!196 = distinct !{!196, !187, !197, !82}
!197 = !DILocation(line: 96, column: 17, scope: !182)
!198 = !DILocation(line: 97, column: 34, scope: !179)
!199 = !DILocation(line: 97, column: 17, scope: !179)
!200 = !DILocation(line: 101, column: 1, scope: !129)
