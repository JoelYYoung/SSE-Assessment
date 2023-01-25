; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  br label %while.body, !dbg !33

while.body:                                       ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !34
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !36
  br label %while.end, !dbg !37

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %5, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !59
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !60
  store i32 0, i32* %intOne, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !63
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !64
  store i32 0, i32* %intTwo, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %8, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !72, metadata !DIExpression()), !dbg !74
  store i64 0, i64* %i2, align 8, !dbg !75
  br label %for.cond3, !dbg !77

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !78
  %cmp4 = icmp ult i64 %9, 100, !dbg !80
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !81

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %11 = load i64, i64* %i2, align 8, !dbg !84
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !82
  %12 = load i64, i64* %i2, align 8, !dbg !85
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !86
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !86
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !86
  br label %for.inc8, !dbg !87

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !88
  %inc9 = add i64 %15, 1, !dbg !88
  store i64 %inc9, i64* %i2, align 8, !dbg !88
  br label %for.cond3, !dbg !89, !llvm.loop !90

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !92
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !92
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16_good() #0 !dbg !95 {
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
  %call = call i64 @time(i64* null) #5, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #5, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = alloca i8, i64 400, align 16, !dbg !123
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !124
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %2 = alloca i8, i64 800, align 16, !dbg !127
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !128
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !126
  br label %while.body, !dbg !129

while.body:                                       ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !130
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !132
  br label %while.end, !dbg !133

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !143
  %cmp = icmp ult i64 %5, 100, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !149
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !150
  store i32 0, i32* %intOne, align 8, !dbg !151
  %7 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !153
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !154
  store i32 0, i32* %intTwo, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %8, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !161, metadata !DIExpression()), !dbg !163
  store i64 0, i64* %i2, align 8, !dbg !164
  br label %for.cond3, !dbg !166

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !167
  %cmp4 = icmp ult i64 %9, 100, !dbg !169
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !170

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !171
  %11 = load i64, i64* %i2, align 8, !dbg !173
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !171
  %12 = load i64, i64* %i2, align 8, !dbg !174
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !175
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !175
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !175
  br label %for.inc8, !dbg !176

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !177
  %inc9 = add i64 %15, 1, !dbg !177
  store i64 %inc9, i64* %i2, align 8, !dbg !177
  br label %for.cond3, !dbg !178, !llvm.loop !179

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !181
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !182
  ret void, !dbg !183
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 26, column: 5, scope: !19)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !19, file: !20, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 9, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !20, line: 34, type: !40)
!39 = distinct !DILexicalBlock(scope: !19, file: !20, line: 33, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 34, column: 23, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !20, line: 36, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !20, line: 35, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 36, column: 20, scope: !45)
!50 = !DILocation(line: 38, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !20, line: 38, column: 13)
!52 = !DILocation(line: 38, column: 18, scope: !51)
!53 = !DILocation(line: 38, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !20, line: 38, column: 13)
!55 = !DILocation(line: 38, column: 27, scope: !54)
!56 = !DILocation(line: 38, column: 13, scope: !51)
!57 = !DILocation(line: 40, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !20, line: 39, column: 13)
!59 = !DILocation(line: 40, column: 17, scope: !58)
!60 = !DILocation(line: 40, column: 27, scope: !58)
!61 = !DILocation(line: 40, column: 34, scope: !58)
!62 = !DILocation(line: 41, column: 24, scope: !58)
!63 = !DILocation(line: 41, column: 17, scope: !58)
!64 = !DILocation(line: 41, column: 27, scope: !58)
!65 = !DILocation(line: 41, column: 34, scope: !58)
!66 = !DILocation(line: 42, column: 13, scope: !58)
!67 = !DILocation(line: 38, column: 35, scope: !54)
!68 = !DILocation(line: 38, column: 13, scope: !54)
!69 = distinct !{!69, !56, !70, !71}
!70 = !DILocation(line: 42, column: 13, scope: !51)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocalVariable(name: "i", scope: !73, file: !20, line: 45, type: !46)
!73 = distinct !DILexicalBlock(scope: !39, file: !20, line: 44, column: 9)
!74 = !DILocation(line: 45, column: 20, scope: !73)
!75 = !DILocation(line: 47, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !20, line: 47, column: 13)
!77 = !DILocation(line: 47, column: 18, scope: !76)
!78 = !DILocation(line: 47, column: 25, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !20, line: 47, column: 13)
!80 = !DILocation(line: 47, column: 27, scope: !79)
!81 = !DILocation(line: 47, column: 13, scope: !76)
!82 = !DILocation(line: 49, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !20, line: 48, column: 13)
!84 = !DILocation(line: 49, column: 22, scope: !83)
!85 = !DILocation(line: 49, column: 34, scope: !83)
!86 = !DILocation(line: 49, column: 27, scope: !83)
!87 = !DILocation(line: 50, column: 13, scope: !83)
!88 = !DILocation(line: 47, column: 35, scope: !79)
!89 = !DILocation(line: 47, column: 13, scope: !79)
!90 = distinct !{!90, !81, !91, !71}
!91 = !DILocation(line: 50, column: 13, scope: !76)
!92 = !DILocation(line: 51, column: 30, scope: !73)
!93 = !DILocation(line: 51, column: 13, scope: !73)
!94 = !DILocation(line: 54, column: 1, scope: !19)
!95 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_16_good", scope: !20, file: !20, line: 95, type: !21, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 97, column: 5, scope: !95)
!97 = !DILocation(line: 98, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 110, type: !99, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!10, !10, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !20, line: 110, type: !10)
!105 = !DILocation(line: 110, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !20, line: 110, type: !101)
!107 = !DILocation(line: 110, column: 27, scope: !98)
!108 = !DILocation(line: 113, column: 22, scope: !98)
!109 = !DILocation(line: 113, column: 12, scope: !98)
!110 = !DILocation(line: 113, column: 5, scope: !98)
!111 = !DILocation(line: 115, column: 5, scope: !98)
!112 = !DILocation(line: 116, column: 5, scope: !98)
!113 = !DILocation(line: 117, column: 5, scope: !98)
!114 = !DILocation(line: 120, column: 5, scope: !98)
!115 = !DILocation(line: 121, column: 5, scope: !98)
!116 = !DILocation(line: 122, column: 5, scope: !98)
!117 = !DILocation(line: 124, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !20, line: 63, type: !4)
!120 = !DILocation(line: 63, column: 21, scope: !118)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !118, file: !20, line: 64, type: !4)
!122 = !DILocation(line: 64, column: 21, scope: !118)
!123 = !DILocation(line: 64, column: 54, scope: !118)
!124 = !DILocation(line: 64, column: 37, scope: !118)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !118, file: !20, line: 65, type: !4)
!126 = !DILocation(line: 65, column: 21, scope: !118)
!127 = !DILocation(line: 65, column: 55, scope: !118)
!128 = !DILocation(line: 65, column: 38, scope: !118)
!129 = !DILocation(line: 66, column: 5, scope: !118)
!130 = !DILocation(line: 69, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !118, file: !20, line: 67, column: 5)
!132 = !DILocation(line: 69, column: 14, scope: !131)
!133 = !DILocation(line: 70, column: 9, scope: !131)
!134 = !DILocalVariable(name: "source", scope: !135, file: !20, line: 73, type: !40)
!135 = distinct !DILexicalBlock(scope: !118, file: !20, line: 72, column: 5)
!136 = !DILocation(line: 73, column: 23, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !20, line: 75, type: !46)
!138 = distinct !DILexicalBlock(scope: !135, file: !20, line: 74, column: 9)
!139 = !DILocation(line: 75, column: 20, scope: !138)
!140 = !DILocation(line: 77, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !20, line: 77, column: 13)
!142 = !DILocation(line: 77, column: 18, scope: !141)
!143 = !DILocation(line: 77, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !20, line: 77, column: 13)
!145 = !DILocation(line: 77, column: 27, scope: !144)
!146 = !DILocation(line: 77, column: 13, scope: !141)
!147 = !DILocation(line: 79, column: 24, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !20, line: 78, column: 13)
!149 = !DILocation(line: 79, column: 17, scope: !148)
!150 = !DILocation(line: 79, column: 27, scope: !148)
!151 = !DILocation(line: 79, column: 34, scope: !148)
!152 = !DILocation(line: 80, column: 24, scope: !148)
!153 = !DILocation(line: 80, column: 17, scope: !148)
!154 = !DILocation(line: 80, column: 27, scope: !148)
!155 = !DILocation(line: 80, column: 34, scope: !148)
!156 = !DILocation(line: 81, column: 13, scope: !148)
!157 = !DILocation(line: 77, column: 35, scope: !144)
!158 = !DILocation(line: 77, column: 13, scope: !144)
!159 = distinct !{!159, !146, !160, !71}
!160 = !DILocation(line: 81, column: 13, scope: !141)
!161 = !DILocalVariable(name: "i", scope: !162, file: !20, line: 84, type: !46)
!162 = distinct !DILexicalBlock(scope: !135, file: !20, line: 83, column: 9)
!163 = !DILocation(line: 84, column: 20, scope: !162)
!164 = !DILocation(line: 86, column: 20, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !20, line: 86, column: 13)
!166 = !DILocation(line: 86, column: 18, scope: !165)
!167 = !DILocation(line: 86, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !20, line: 86, column: 13)
!169 = !DILocation(line: 86, column: 27, scope: !168)
!170 = !DILocation(line: 86, column: 13, scope: !165)
!171 = !DILocation(line: 88, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !20, line: 87, column: 13)
!173 = !DILocation(line: 88, column: 22, scope: !172)
!174 = !DILocation(line: 88, column: 34, scope: !172)
!175 = !DILocation(line: 88, column: 27, scope: !172)
!176 = !DILocation(line: 89, column: 13, scope: !172)
!177 = !DILocation(line: 86, column: 35, scope: !168)
!178 = !DILocation(line: 86, column: 13, scope: !168)
!179 = distinct !{!179, !170, !180, !71}
!180 = !DILocation(line: 89, column: 13, scope: !165)
!181 = !DILocation(line: 90, column: 30, scope: !162)
!182 = !DILocation(line: 90, column: 13, scope: !162)
!183 = !DILocation(line: 93, column: 1, scope: !118)
