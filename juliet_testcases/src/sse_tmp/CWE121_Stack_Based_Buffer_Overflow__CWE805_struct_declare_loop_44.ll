; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !25, metadata !DIExpression()), !dbg !29
  store void (%struct._twoIntsStruct*)* @badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %0 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !42
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  call void %0(%struct._twoIntsStruct* %1), !dbg !42
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(%struct._twoIntsStruct* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %0, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !66
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !67
  store i32 0, i32* %intOne, align 8, !dbg !68
  %2 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !70
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !71
  store i32 0, i32* %intTwo, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %3, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !79, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i2, align 8, !dbg !82
  br label %for.cond3, !dbg !84

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !85
  %cmp4 = icmp ult i64 %4, 100, !dbg !87
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !88

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !89
  %6 = load i64, i64* %i2, align 8, !dbg !91
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !89
  %7 = load i64, i64* %i2, align 8, !dbg !92
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !93
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !93
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !93
  br label %for.inc8, !dbg !94

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !95
  %inc9 = add i64 %10, 1, !dbg !95
  store i64 %inc9, i64* %i2, align 8, !dbg !95
  br label %for.cond3, !dbg !96, !llvm.loop !97

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !99
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !99
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44_good() #0 !dbg !102 {
entry:
  call void @goodG2B(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i64 @time(i64* null) #5, !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 %conv) #5, !dbg !117
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !118
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44_good(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44_bad(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
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
define internal void @goodG2B() #0 !dbg !125 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !128, metadata !DIExpression()), !dbg !129
  store void (%struct._twoIntsStruct*)* @goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !134
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %0 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !136
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !137
  call void %0(%struct._twoIntsStruct* %1), !dbg !136
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !139 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !151
  %cmp = icmp ult i64 %0, 100, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !157
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !158
  store i32 0, i32* %intOne, align 8, !dbg !159
  %2 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !161
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !162
  store i32 0, i32* %intTwo, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %3, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !169, metadata !DIExpression()), !dbg !171
  store i64 0, i64* %i2, align 8, !dbg !172
  br label %for.cond3, !dbg !174

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !175
  %cmp4 = icmp ult i64 %4, 100, !dbg !177
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !178

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !179
  %6 = load i64, i64* %i2, align 8, !dbg !181
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !179
  %7 = load i64, i64* %i2, align 8, !dbg !182
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !183
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !183
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !183
  br label %for.inc8, !dbg !184

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !185
  %inc9 = add i64 %10, 1, !dbg !185
  store i64 %inc9, i64* %i2, align 8, !dbg !185
  br label %for.cond3, !dbg !186, !llvm.loop !187

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !189
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !189
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !190
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44_bad", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 48, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 48, column: 21, scope: !11)
!25 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 50, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !16}
!29 = !DILocation(line: 50, column: 12, scope: !11)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 51, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 51, column: 19, scope: !11)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 52, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 52, column: 19, scope: !11)
!40 = !DILocation(line: 55, column: 12, scope: !11)
!41 = !DILocation(line: 55, column: 10, scope: !11)
!42 = !DILocation(line: 57, column: 5, scope: !11)
!43 = !DILocation(line: 57, column: 13, scope: !11)
!44 = !DILocation(line: 58, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 21, type: !27, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !12, line: 21, type: !16)
!47 = !DILocation(line: 21, column: 37, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !12, line: 24, type: !36)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 23, column: 5)
!50 = !DILocation(line: 24, column: 23, scope: !49)
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 26, type: !53)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 25, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 26, column: 20, scope: !52)
!57 = !DILocation(line: 28, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !12, line: 28, column: 13)
!59 = !DILocation(line: 28, column: 18, scope: !58)
!60 = !DILocation(line: 28, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 28, column: 13)
!62 = !DILocation(line: 28, column: 27, scope: !61)
!63 = !DILocation(line: 28, column: 13, scope: !58)
!64 = !DILocation(line: 30, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !12, line: 29, column: 13)
!66 = !DILocation(line: 30, column: 17, scope: !65)
!67 = !DILocation(line: 30, column: 27, scope: !65)
!68 = !DILocation(line: 30, column: 34, scope: !65)
!69 = !DILocation(line: 31, column: 24, scope: !65)
!70 = !DILocation(line: 31, column: 17, scope: !65)
!71 = !DILocation(line: 31, column: 27, scope: !65)
!72 = !DILocation(line: 31, column: 34, scope: !65)
!73 = !DILocation(line: 32, column: 13, scope: !65)
!74 = !DILocation(line: 28, column: 35, scope: !61)
!75 = !DILocation(line: 28, column: 13, scope: !61)
!76 = distinct !{!76, !63, !77, !78}
!77 = !DILocation(line: 32, column: 13, scope: !58)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocalVariable(name: "i", scope: !80, file: !12, line: 35, type: !53)
!80 = distinct !DILexicalBlock(scope: !49, file: !12, line: 34, column: 9)
!81 = !DILocation(line: 35, column: 20, scope: !80)
!82 = !DILocation(line: 37, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 37, column: 13)
!84 = !DILocation(line: 37, column: 18, scope: !83)
!85 = !DILocation(line: 37, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !12, line: 37, column: 13)
!87 = !DILocation(line: 37, column: 27, scope: !86)
!88 = !DILocation(line: 37, column: 13, scope: !83)
!89 = !DILocation(line: 39, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !12, line: 38, column: 13)
!91 = !DILocation(line: 39, column: 22, scope: !90)
!92 = !DILocation(line: 39, column: 34, scope: !90)
!93 = !DILocation(line: 39, column: 27, scope: !90)
!94 = !DILocation(line: 40, column: 13, scope: !90)
!95 = !DILocation(line: 37, column: 35, scope: !86)
!96 = !DILocation(line: 37, column: 13, scope: !86)
!97 = distinct !{!97, !88, !98, !78}
!98 = !DILocation(line: 40, column: 13, scope: !83)
!99 = !DILocation(line: 41, column: 30, scope: !80)
!100 = !DILocation(line: 41, column: 13, scope: !80)
!101 = !DILocation(line: 44, column: 1, scope: !45)
!102 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_44_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocation(line: 103, column: 5, scope: !102)
!104 = !DILocation(line: 104, column: 1, scope: !102)
!105 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !106, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DISubroutineType(types: !107)
!107 = !{!22, !22, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !12, line: 115, type: !22)
!112 = !DILocation(line: 115, column: 14, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !12, line: 115, type: !108)
!114 = !DILocation(line: 115, column: 27, scope: !105)
!115 = !DILocation(line: 118, column: 22, scope: !105)
!116 = !DILocation(line: 118, column: 12, scope: !105)
!117 = !DILocation(line: 118, column: 5, scope: !105)
!118 = !DILocation(line: 120, column: 5, scope: !105)
!119 = !DILocation(line: 121, column: 5, scope: !105)
!120 = !DILocation(line: 122, column: 5, scope: !105)
!121 = !DILocation(line: 125, column: 5, scope: !105)
!122 = !DILocation(line: 126, column: 5, scope: !105)
!123 = !DILocation(line: 127, column: 5, scope: !105)
!124 = !DILocation(line: 129, column: 5, scope: !105)
!125 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 92, type: !16)
!127 = !DILocation(line: 92, column: 21, scope: !125)
!128 = !DILocalVariable(name: "funcPtr", scope: !125, file: !12, line: 93, type: !26)
!129 = !DILocation(line: 93, column: 12, scope: !125)
!130 = !DILocalVariable(name: "dataBadBuffer", scope: !125, file: !12, line: 94, type: !31)
!131 = !DILocation(line: 94, column: 19, scope: !125)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !125, file: !12, line: 95, type: !36)
!133 = !DILocation(line: 95, column: 19, scope: !125)
!134 = !DILocation(line: 97, column: 12, scope: !125)
!135 = !DILocation(line: 97, column: 10, scope: !125)
!136 = !DILocation(line: 98, column: 5, scope: !125)
!137 = !DILocation(line: 98, column: 13, scope: !125)
!138 = !DILocation(line: 99, column: 1, scope: !125)
!139 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 65, type: !27, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", arg: 1, scope: !139, file: !12, line: 65, type: !16)
!141 = !DILocation(line: 65, column: 41, scope: !139)
!142 = !DILocalVariable(name: "source", scope: !143, file: !12, line: 68, type: !36)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 67, column: 5)
!144 = !DILocation(line: 68, column: 23, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 70, type: !53)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 69, column: 9)
!147 = !DILocation(line: 70, column: 20, scope: !146)
!148 = !DILocation(line: 72, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 72, column: 13)
!150 = !DILocation(line: 72, column: 18, scope: !149)
!151 = !DILocation(line: 72, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !12, line: 72, column: 13)
!153 = !DILocation(line: 72, column: 27, scope: !152)
!154 = !DILocation(line: 72, column: 13, scope: !149)
!155 = !DILocation(line: 74, column: 24, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !12, line: 73, column: 13)
!157 = !DILocation(line: 74, column: 17, scope: !156)
!158 = !DILocation(line: 74, column: 27, scope: !156)
!159 = !DILocation(line: 74, column: 34, scope: !156)
!160 = !DILocation(line: 75, column: 24, scope: !156)
!161 = !DILocation(line: 75, column: 17, scope: !156)
!162 = !DILocation(line: 75, column: 27, scope: !156)
!163 = !DILocation(line: 75, column: 34, scope: !156)
!164 = !DILocation(line: 76, column: 13, scope: !156)
!165 = !DILocation(line: 72, column: 35, scope: !152)
!166 = !DILocation(line: 72, column: 13, scope: !152)
!167 = distinct !{!167, !154, !168, !78}
!168 = !DILocation(line: 76, column: 13, scope: !149)
!169 = !DILocalVariable(name: "i", scope: !170, file: !12, line: 79, type: !53)
!170 = distinct !DILexicalBlock(scope: !143, file: !12, line: 78, column: 9)
!171 = !DILocation(line: 79, column: 20, scope: !170)
!172 = !DILocation(line: 81, column: 20, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !12, line: 81, column: 13)
!174 = !DILocation(line: 81, column: 18, scope: !173)
!175 = !DILocation(line: 81, column: 25, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !12, line: 81, column: 13)
!177 = !DILocation(line: 81, column: 27, scope: !176)
!178 = !DILocation(line: 81, column: 13, scope: !173)
!179 = !DILocation(line: 83, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 82, column: 13)
!181 = !DILocation(line: 83, column: 22, scope: !180)
!182 = !DILocation(line: 83, column: 34, scope: !180)
!183 = !DILocation(line: 83, column: 27, scope: !180)
!184 = !DILocation(line: 84, column: 13, scope: !180)
!185 = !DILocation(line: 81, column: 35, scope: !176)
!186 = !DILocation(line: 81, column: 13, scope: !176)
!187 = distinct !{!187, !178, !188, !78}
!188 = !DILocation(line: 84, column: 13, scope: !173)
!189 = !DILocation(line: 85, column: 30, scope: !170)
!190 = !DILocation(line: 85, column: 13, scope: !170)
!191 = !DILocation(line: 88, column: 1, scope: !139)
