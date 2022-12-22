; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData, align 8, !dbg !43
  call void @badSink(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !69 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData, align 8, !dbg !72
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !85
  %cmp = icmp ult i64 %1, 100, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !91
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !92
  store i32 0, i32* %intOne, align 8, !dbg !93
  %3 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !95
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !96
  store i32 0, i32* %intTwo, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %4, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !104, metadata !DIExpression()), !dbg !106
  store i64 0, i64* %i2, align 8, !dbg !107
  br label %for.cond3, !dbg !109

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !110
  %cmp4 = icmp ult i64 %5, 100, !dbg !112
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !113

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %7 = load i64, i64* %i2, align 8, !dbg !116
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !114
  %8 = load i64, i64* %i2, align 8, !dbg !117
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !118
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !118
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !118
  br label %for.inc8, !dbg !119

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !120
  %inc9 = add i64 %11, 1, !dbg !120
  store i64 %inc9, i64* %i2, align 8, !dbg !120
  br label %for.cond3, !dbg !121, !llvm.loop !122

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !124
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !127 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !134
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !136
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData, align 8, !dbg !137
  call void @goodG2BSink(), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !140 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData, align 8, !dbg !143
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !153
  %cmp = icmp ult i64 %1, 100, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !159
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !160
  store i32 0, i32* %intOne, align 8, !dbg !161
  %3 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !163
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !164
  store i32 0, i32* %intTwo, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %4, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i2, align 8, !dbg !174
  br label %for.cond3, !dbg !176

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !177
  %cmp4 = icmp ult i64 %5, 100, !dbg !179
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !180

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %7 = load i64, i64* %i2, align 8, !dbg !183
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !181
  %8 = load i64, i64* %i2, align 8, !dbg !184
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !185
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !185
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !185
  br label %for.inc8, !dbg !186

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !187
  %inc9 = add i64 %11, 1, !dbg !187
  store i64 %inc9, i64* %i2, align 8, !dbg !187
  br label %for.cond3, !dbg !188, !llvm.loop !189

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !191
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData", scope: !2, file: !10, line: 19, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !13, line: 100, baseType: !14)
!13 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !13, line: 96, size: 64, elements: !15)
!15 = !{!16, !18}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !14, file: !13, line: 98, baseType: !17, size: 32)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !14, file: !13, line: 99, baseType: !17, size: 32, offset: 32)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_bad", scope: !10, file: !10, line: 50, type: !26, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !10, line: 52, type: !11)
!29 = !DILocation(line: 52, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !10, line: 53, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 53, column: 19, scope: !25)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !10, line: 54, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 54, column: 19, scope: !25)
!40 = !DILocation(line: 57, column: 12, scope: !25)
!41 = !DILocation(line: 57, column: 10, scope: !25)
!42 = !DILocation(line: 58, column: 81, scope: !25)
!43 = !DILocation(line: 58, column: 79, scope: !25)
!44 = !DILocation(line: 59, column: 5, scope: !25)
!45 = !DILocation(line: 60, column: 1, scope: !25)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_good", scope: !10, file: !10, line: 104, type: !26, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 106, column: 5, scope: !46)
!48 = !DILocation(line: 107, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 118, type: !50, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!17, !17, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !10, line: 118, type: !17)
!56 = !DILocation(line: 118, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !10, line: 118, type: !52)
!58 = !DILocation(line: 118, column: 27, scope: !49)
!59 = !DILocation(line: 121, column: 22, scope: !49)
!60 = !DILocation(line: 121, column: 12, scope: !49)
!61 = !DILocation(line: 121, column: 5, scope: !49)
!62 = !DILocation(line: 123, column: 5, scope: !49)
!63 = !DILocation(line: 124, column: 5, scope: !49)
!64 = !DILocation(line: 125, column: 5, scope: !49)
!65 = !DILocation(line: 128, column: 5, scope: !49)
!66 = !DILocation(line: 129, column: 5, scope: !49)
!67 = !DILocation(line: 130, column: 5, scope: !49)
!68 = !DILocation(line: 132, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 24, type: !26, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocalVariable(name: "data", scope: !69, file: !10, line: 26, type: !11)
!71 = !DILocation(line: 26, column: 21, scope: !69)
!72 = !DILocation(line: 26, column: 28, scope: !69)
!73 = !DILocalVariable(name: "source", scope: !74, file: !10, line: 28, type: !36)
!74 = distinct !DILexicalBlock(scope: !69, file: !10, line: 27, column: 5)
!75 = !DILocation(line: 28, column: 23, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !77, file: !10, line: 30, type: !78)
!77 = distinct !DILexicalBlock(scope: !74, file: !10, line: 29, column: 9)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !79, line: 46, baseType: !80)
!79 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!80 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!81 = !DILocation(line: 30, column: 20, scope: !77)
!82 = !DILocation(line: 32, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !10, line: 32, column: 13)
!84 = !DILocation(line: 32, column: 18, scope: !83)
!85 = !DILocation(line: 32, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 32, column: 13)
!87 = !DILocation(line: 32, column: 27, scope: !86)
!88 = !DILocation(line: 32, column: 13, scope: !83)
!89 = !DILocation(line: 34, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !10, line: 33, column: 13)
!91 = !DILocation(line: 34, column: 17, scope: !90)
!92 = !DILocation(line: 34, column: 27, scope: !90)
!93 = !DILocation(line: 34, column: 34, scope: !90)
!94 = !DILocation(line: 35, column: 24, scope: !90)
!95 = !DILocation(line: 35, column: 17, scope: !90)
!96 = !DILocation(line: 35, column: 27, scope: !90)
!97 = !DILocation(line: 35, column: 34, scope: !90)
!98 = !DILocation(line: 36, column: 13, scope: !90)
!99 = !DILocation(line: 32, column: 35, scope: !86)
!100 = !DILocation(line: 32, column: 13, scope: !86)
!101 = distinct !{!101, !88, !102, !103}
!102 = !DILocation(line: 36, column: 13, scope: !83)
!103 = !{!"llvm.loop.mustprogress"}
!104 = !DILocalVariable(name: "i", scope: !105, file: !10, line: 39, type: !78)
!105 = distinct !DILexicalBlock(scope: !74, file: !10, line: 38, column: 9)
!106 = !DILocation(line: 39, column: 20, scope: !105)
!107 = !DILocation(line: 41, column: 20, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !10, line: 41, column: 13)
!109 = !DILocation(line: 41, column: 18, scope: !108)
!110 = !DILocation(line: 41, column: 25, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !10, line: 41, column: 13)
!112 = !DILocation(line: 41, column: 27, scope: !111)
!113 = !DILocation(line: 41, column: 13, scope: !108)
!114 = !DILocation(line: 43, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !10, line: 42, column: 13)
!116 = !DILocation(line: 43, column: 22, scope: !115)
!117 = !DILocation(line: 43, column: 34, scope: !115)
!118 = !DILocation(line: 43, column: 27, scope: !115)
!119 = !DILocation(line: 44, column: 13, scope: !115)
!120 = !DILocation(line: 41, column: 35, scope: !111)
!121 = !DILocation(line: 41, column: 13, scope: !111)
!122 = distinct !{!122, !113, !123, !103}
!123 = !DILocation(line: 44, column: 13, scope: !108)
!124 = !DILocation(line: 45, column: 30, scope: !105)
!125 = !DILocation(line: 45, column: 13, scope: !105)
!126 = !DILocation(line: 48, column: 1, scope: !69)
!127 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 93, type: !26, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !10, line: 95, type: !11)
!129 = !DILocation(line: 95, column: 21, scope: !127)
!130 = !DILocalVariable(name: "dataBadBuffer", scope: !127, file: !10, line: 96, type: !31)
!131 = !DILocation(line: 96, column: 19, scope: !127)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !127, file: !10, line: 97, type: !36)
!133 = !DILocation(line: 97, column: 19, scope: !127)
!134 = !DILocation(line: 99, column: 12, scope: !127)
!135 = !DILocation(line: 99, column: 10, scope: !127)
!136 = !DILocation(line: 100, column: 85, scope: !127)
!137 = !DILocation(line: 100, column: 83, scope: !127)
!138 = !DILocation(line: 101, column: 5, scope: !127)
!139 = !DILocation(line: 102, column: 1, scope: !127)
!140 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 67, type: !26, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocalVariable(name: "data", scope: !140, file: !10, line: 69, type: !11)
!142 = !DILocation(line: 69, column: 21, scope: !140)
!143 = !DILocation(line: 69, column: 28, scope: !140)
!144 = !DILocalVariable(name: "source", scope: !145, file: !10, line: 71, type: !36)
!145 = distinct !DILexicalBlock(scope: !140, file: !10, line: 70, column: 5)
!146 = !DILocation(line: 71, column: 23, scope: !145)
!147 = !DILocalVariable(name: "i", scope: !148, file: !10, line: 73, type: !78)
!148 = distinct !DILexicalBlock(scope: !145, file: !10, line: 72, column: 9)
!149 = !DILocation(line: 73, column: 20, scope: !148)
!150 = !DILocation(line: 75, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !10, line: 75, column: 13)
!152 = !DILocation(line: 75, column: 18, scope: !151)
!153 = !DILocation(line: 75, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !10, line: 75, column: 13)
!155 = !DILocation(line: 75, column: 27, scope: !154)
!156 = !DILocation(line: 75, column: 13, scope: !151)
!157 = !DILocation(line: 77, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !10, line: 76, column: 13)
!159 = !DILocation(line: 77, column: 17, scope: !158)
!160 = !DILocation(line: 77, column: 27, scope: !158)
!161 = !DILocation(line: 77, column: 34, scope: !158)
!162 = !DILocation(line: 78, column: 24, scope: !158)
!163 = !DILocation(line: 78, column: 17, scope: !158)
!164 = !DILocation(line: 78, column: 27, scope: !158)
!165 = !DILocation(line: 78, column: 34, scope: !158)
!166 = !DILocation(line: 79, column: 13, scope: !158)
!167 = !DILocation(line: 75, column: 35, scope: !154)
!168 = !DILocation(line: 75, column: 13, scope: !154)
!169 = distinct !{!169, !156, !170, !103}
!170 = !DILocation(line: 79, column: 13, scope: !151)
!171 = !DILocalVariable(name: "i", scope: !172, file: !10, line: 82, type: !78)
!172 = distinct !DILexicalBlock(scope: !145, file: !10, line: 81, column: 9)
!173 = !DILocation(line: 82, column: 20, scope: !172)
!174 = !DILocation(line: 84, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !10, line: 84, column: 13)
!176 = !DILocation(line: 84, column: 18, scope: !175)
!177 = !DILocation(line: 84, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !10, line: 84, column: 13)
!179 = !DILocation(line: 84, column: 27, scope: !178)
!180 = !DILocation(line: 84, column: 13, scope: !175)
!181 = !DILocation(line: 86, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !10, line: 85, column: 13)
!183 = !DILocation(line: 86, column: 22, scope: !182)
!184 = !DILocation(line: 86, column: 34, scope: !182)
!185 = !DILocation(line: 86, column: 27, scope: !182)
!186 = !DILocation(line: 87, column: 13, scope: !182)
!187 = !DILocation(line: 84, column: 35, scope: !178)
!188 = !DILocation(line: 84, column: 13, scope: !178)
!189 = distinct !{!189, !180, !190, !103}
!190 = !DILocation(line: 87, column: 13, scope: !175)
!191 = !DILocation(line: 88, column: 30, scope: !172)
!192 = !DILocation(line: 88, column: 13, scope: !172)
!193 = !DILocation(line: 91, column: 1, scope: !140)
