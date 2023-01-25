; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion, metadata !25, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !45
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !47, metadata !DIExpression()), !dbg !49
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !50
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !50
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %2, 100, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !69
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !70
  store i32 0, i32* %intOne, align 8, !dbg !71
  %4 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !73
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !74
  store i32 0, i32* %intTwo, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %5, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !82, metadata !DIExpression()), !dbg !84
  store i64 0, i64* %i3, align 8, !dbg !85
  br label %for.cond4, !dbg !87

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !88
  %cmp5 = icmp ult i64 %6, 100, !dbg !90
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !91

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !92
  %8 = load i64, i64* %i3, align 8, !dbg !94
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !92
  %9 = load i64, i64* %i3, align 8, !dbg !95
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !96
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !96
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !96
  br label %for.inc9, !dbg !97

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !98
  %inc10 = add i64 %12, 1, !dbg !98
  store i64 %inc10, i64* %i3, align 8, !dbg !98
  br label %for.cond4, !dbg !99, !llvm.loop !100

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !102
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !102
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_good() #0 !dbg !105 {
entry:
  call void @goodG2B(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !108 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i64 @time(i64* null) #5, !dbg !118
  %conv = trunc i64 %call to i32, !dbg !119
  call void @srand(i32 %conv) #5, !dbg !120
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !121
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_good(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !124
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_bad(), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  ret i32 0, !dbg !127
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !128 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !137
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !138
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !140
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !142, metadata !DIExpression()), !dbg !144
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !145
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !145
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !155
  %cmp = icmp ult i64 %2, 100, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !161
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !162
  store i32 0, i32* %intOne, align 8, !dbg !163
  %4 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !165
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !166
  store i32 0, i32* %intTwo, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %5, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !173, metadata !DIExpression()), !dbg !175
  store i64 0, i64* %i3, align 8, !dbg !176
  br label %for.cond4, !dbg !178

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !179
  %cmp5 = icmp ult i64 %6, 100, !dbg !181
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !182

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !183
  %8 = load i64, i64* %i3, align 8, !dbg !185
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !183
  %9 = load i64, i64* %i3, align 8, !dbg !186
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !187
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !187
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !187
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !187
  br label %for.inc9, !dbg !188

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !189
  %inc10 = add i64 %12, 1, !dbg !189
  store i64 %inc10, i64* %i3, align 8, !dbg !189
  br label %for.cond4, !dbg !190, !llvm.loop !191

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !193
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !193
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !194
  ret void, !dbg !195
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 29, column: 21, scope: !11)
!25 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 30, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType", file: !12, line: 23, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 19, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !27, file: !12, line: 21, baseType: !16, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !27, file: !12, line: 22, baseType: !16, size: 64)
!31 = !DILocation(line: 30, column: 81, scope: !11)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 31, column: 19, scope: !11)
!37 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 32, column: 19, scope: !11)
!42 = !DILocation(line: 35, column: 12, scope: !11)
!43 = !DILocation(line: 35, column: 10, scope: !11)
!44 = !DILocation(line: 36, column: 26, scope: !11)
!45 = !DILocation(line: 36, column: 13, scope: !11)
!46 = !DILocation(line: 36, column: 24, scope: !11)
!47 = !DILocalVariable(name: "data", scope: !48, file: !12, line: 38, type: !16)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 25, scope: !48)
!50 = !DILocation(line: 38, column: 40, scope: !48)
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 40, type: !38)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 39, column: 9)
!53 = !DILocation(line: 40, column: 27, scope: !52)
!54 = !DILocalVariable(name: "i", scope: !55, file: !12, line: 42, type: !56)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 41, column: 13)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 46, baseType: !58)
!57 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 42, column: 24, scope: !55)
!60 = !DILocation(line: 44, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !12, line: 44, column: 17)
!62 = !DILocation(line: 44, column: 22, scope: !61)
!63 = !DILocation(line: 44, column: 29, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 44, column: 17)
!65 = !DILocation(line: 44, column: 31, scope: !64)
!66 = !DILocation(line: 44, column: 17, scope: !61)
!67 = !DILocation(line: 46, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !12, line: 45, column: 17)
!69 = !DILocation(line: 46, column: 21, scope: !68)
!70 = !DILocation(line: 46, column: 31, scope: !68)
!71 = !DILocation(line: 46, column: 38, scope: !68)
!72 = !DILocation(line: 47, column: 28, scope: !68)
!73 = !DILocation(line: 47, column: 21, scope: !68)
!74 = !DILocation(line: 47, column: 31, scope: !68)
!75 = !DILocation(line: 47, column: 38, scope: !68)
!76 = !DILocation(line: 48, column: 17, scope: !68)
!77 = !DILocation(line: 44, column: 39, scope: !64)
!78 = !DILocation(line: 44, column: 17, scope: !64)
!79 = distinct !{!79, !66, !80, !81}
!80 = !DILocation(line: 48, column: 17, scope: !61)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocalVariable(name: "i", scope: !83, file: !12, line: 51, type: !56)
!83 = distinct !DILexicalBlock(scope: !52, file: !12, line: 50, column: 13)
!84 = !DILocation(line: 51, column: 24, scope: !83)
!85 = !DILocation(line: 53, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !12, line: 53, column: 17)
!87 = !DILocation(line: 53, column: 22, scope: !86)
!88 = !DILocation(line: 53, column: 29, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 53, column: 17)
!90 = !DILocation(line: 53, column: 31, scope: !89)
!91 = !DILocation(line: 53, column: 17, scope: !86)
!92 = !DILocation(line: 55, column: 21, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !12, line: 54, column: 17)
!94 = !DILocation(line: 55, column: 26, scope: !93)
!95 = !DILocation(line: 55, column: 38, scope: !93)
!96 = !DILocation(line: 55, column: 31, scope: !93)
!97 = !DILocation(line: 56, column: 17, scope: !93)
!98 = !DILocation(line: 53, column: 39, scope: !89)
!99 = !DILocation(line: 53, column: 17, scope: !89)
!100 = distinct !{!100, !91, !101, !81}
!101 = !DILocation(line: 56, column: 17, scope: !86)
!102 = !DILocation(line: 57, column: 34, scope: !83)
!103 = !DILocation(line: 57, column: 17, scope: !83)
!104 = !DILocation(line: 61, column: 1, scope: !11)
!105 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 105, column: 5, scope: !105)
!107 = !DILocation(line: 106, column: 1, scope: !105)
!108 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !109, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DISubroutineType(types: !110)
!110 = !{!22, !22, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!114 = !DILocalVariable(name: "argc", arg: 1, scope: !108, file: !12, line: 117, type: !22)
!115 = !DILocation(line: 117, column: 14, scope: !108)
!116 = !DILocalVariable(name: "argv", arg: 2, scope: !108, file: !12, line: 117, type: !111)
!117 = !DILocation(line: 117, column: 27, scope: !108)
!118 = !DILocation(line: 120, column: 22, scope: !108)
!119 = !DILocation(line: 120, column: 12, scope: !108)
!120 = !DILocation(line: 120, column: 5, scope: !108)
!121 = !DILocation(line: 122, column: 5, scope: !108)
!122 = !DILocation(line: 123, column: 5, scope: !108)
!123 = !DILocation(line: 124, column: 5, scope: !108)
!124 = !DILocation(line: 127, column: 5, scope: !108)
!125 = !DILocation(line: 128, column: 5, scope: !108)
!126 = !DILocation(line: 129, column: 5, scope: !108)
!127 = !DILocation(line: 131, column: 5, scope: !108)
!128 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", scope: !128, file: !12, line: 70, type: !16)
!130 = !DILocation(line: 70, column: 21, scope: !128)
!131 = !DILocalVariable(name: "myUnion", scope: !128, file: !12, line: 71, type: !26)
!132 = !DILocation(line: 71, column: 81, scope: !128)
!133 = !DILocalVariable(name: "dataBadBuffer", scope: !128, file: !12, line: 72, type: !33)
!134 = !DILocation(line: 72, column: 19, scope: !128)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !128, file: !12, line: 73, type: !38)
!136 = !DILocation(line: 73, column: 19, scope: !128)
!137 = !DILocation(line: 75, column: 12, scope: !128)
!138 = !DILocation(line: 75, column: 10, scope: !128)
!139 = !DILocation(line: 76, column: 26, scope: !128)
!140 = !DILocation(line: 76, column: 13, scope: !128)
!141 = !DILocation(line: 76, column: 24, scope: !128)
!142 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 78, type: !16)
!143 = distinct !DILexicalBlock(scope: !128, file: !12, line: 77, column: 5)
!144 = !DILocation(line: 78, column: 25, scope: !143)
!145 = !DILocation(line: 78, column: 40, scope: !143)
!146 = !DILocalVariable(name: "source", scope: !147, file: !12, line: 80, type: !38)
!147 = distinct !DILexicalBlock(scope: !143, file: !12, line: 79, column: 9)
!148 = !DILocation(line: 80, column: 27, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !12, line: 82, type: !56)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 81, column: 13)
!151 = !DILocation(line: 82, column: 24, scope: !150)
!152 = !DILocation(line: 84, column: 24, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 84, column: 17)
!154 = !DILocation(line: 84, column: 22, scope: !153)
!155 = !DILocation(line: 84, column: 29, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !12, line: 84, column: 17)
!157 = !DILocation(line: 84, column: 31, scope: !156)
!158 = !DILocation(line: 84, column: 17, scope: !153)
!159 = !DILocation(line: 86, column: 28, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !12, line: 85, column: 17)
!161 = !DILocation(line: 86, column: 21, scope: !160)
!162 = !DILocation(line: 86, column: 31, scope: !160)
!163 = !DILocation(line: 86, column: 38, scope: !160)
!164 = !DILocation(line: 87, column: 28, scope: !160)
!165 = !DILocation(line: 87, column: 21, scope: !160)
!166 = !DILocation(line: 87, column: 31, scope: !160)
!167 = !DILocation(line: 87, column: 38, scope: !160)
!168 = !DILocation(line: 88, column: 17, scope: !160)
!169 = !DILocation(line: 84, column: 39, scope: !156)
!170 = !DILocation(line: 84, column: 17, scope: !156)
!171 = distinct !{!171, !158, !172, !81}
!172 = !DILocation(line: 88, column: 17, scope: !153)
!173 = !DILocalVariable(name: "i", scope: !174, file: !12, line: 91, type: !56)
!174 = distinct !DILexicalBlock(scope: !147, file: !12, line: 90, column: 13)
!175 = !DILocation(line: 91, column: 24, scope: !174)
!176 = !DILocation(line: 93, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !12, line: 93, column: 17)
!178 = !DILocation(line: 93, column: 22, scope: !177)
!179 = !DILocation(line: 93, column: 29, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !12, line: 93, column: 17)
!181 = !DILocation(line: 93, column: 31, scope: !180)
!182 = !DILocation(line: 93, column: 17, scope: !177)
!183 = !DILocation(line: 95, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !12, line: 94, column: 17)
!185 = !DILocation(line: 95, column: 26, scope: !184)
!186 = !DILocation(line: 95, column: 38, scope: !184)
!187 = !DILocation(line: 95, column: 31, scope: !184)
!188 = !DILocation(line: 96, column: 17, scope: !184)
!189 = !DILocation(line: 93, column: 39, scope: !180)
!190 = !DILocation(line: 93, column: 17, scope: !180)
!191 = distinct !{!191, !182, !192, !81}
!192 = !DILocation(line: 96, column: 17, scope: !177)
!193 = !DILocation(line: 97, column: 34, scope: !174)
!194 = !DILocation(line: 97, column: 17, scope: !174)
!195 = !DILocation(line: 101, column: 1, scope: !128)
