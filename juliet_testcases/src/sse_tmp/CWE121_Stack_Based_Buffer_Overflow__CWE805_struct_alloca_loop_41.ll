; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_badSink(%struct._twoIntsStruct* %data) #0 !dbg !19 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %0, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !46
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !47
  store i32 0, i32* %intOne, align 8, !dbg !48
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !50
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !51
  store i32 0, i32* %intTwo, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %3, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !59, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i2, align 8, !dbg !62
  br label %for.cond3, !dbg !64

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !65
  %cmp4 = icmp ult i64 %4, 100, !dbg !67
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !68

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !69
  %6 = load i64, i64* %i2, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !69
  %7 = load i64, i64* %i2, align 8, !dbg !72
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !73
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !73
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !73
  br label %for.inc8, !dbg !74

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !75
  %inc9 = add i64 %10, 1, !dbg !75
  store i64 %inc9, i64* %i2, align 8, !dbg !75
  br label %for.cond3, !dbg !76, !llvm.loop !77

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !79
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_bad() #0 !dbg !82 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 400, align 16, !dbg !89
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !90
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 800, align 16, !dbg !93
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !94
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !92
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !95
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_badSink(%struct._twoIntsStruct* %5), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !100 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !112
  %cmp = icmp ult i64 %0, 100, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !118
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !119
  store i32 0, i32* %intOne, align 8, !dbg !120
  %2 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !122
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !123
  store i32 0, i32* %intTwo, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %3, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !130, metadata !DIExpression()), !dbg !132
  store i64 0, i64* %i2, align 8, !dbg !133
  br label %for.cond3, !dbg !135

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !136
  %cmp4 = icmp ult i64 %4, 100, !dbg !138
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !139

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !140
  %6 = load i64, i64* %i2, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !140
  %7 = load i64, i64* %i2, align 8, !dbg !143
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !144
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !144
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !144
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !144
  br label %for.inc8, !dbg !145

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !146
  %inc9 = add i64 %10, 1, !dbg !146
  store i64 %inc9, i64* %i2, align 8, !dbg !146
  br label %for.cond3, !dbg !147, !llvm.loop !148

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !150
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !150
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_good() #0 !dbg !153 {
entry:
  call void @goodG2B(), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !156 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !162, metadata !DIExpression()), !dbg !163
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !164, metadata !DIExpression()), !dbg !165
  %call = call i64 @time(i64* null) #5, !dbg !166
  %conv = trunc i64 %call to i32, !dbg !167
  call void @srand(i32 %conv) #5, !dbg !168
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !169
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_good(), !dbg !170
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !171
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !172
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_bad(), !dbg !173
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !174
  ret i32 0, !dbg !175
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !176 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !179, metadata !DIExpression()), !dbg !180
  %0 = alloca i8, i64 400, align 16, !dbg !181
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !182
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !180
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !183, metadata !DIExpression()), !dbg !184
  %2 = alloca i8, i64 800, align 16, !dbg !185
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !186
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !184
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !187
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !188
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !189
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_goodG2BSink(%struct._twoIntsStruct* %5), !dbg !190
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_badSink", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !20, line: 21, type: !4)
!24 = !DILocation(line: 21, column: 95, scope: !19)
!25 = !DILocalVariable(name: "source", scope: !26, file: !20, line: 24, type: !27)
!26 = distinct !DILexicalBlock(scope: !19, file: !20, line: 23, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 24, column: 23, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !20, line: 26, type: !33)
!32 = distinct !DILexicalBlock(scope: !26, file: !20, line: 25, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 26, column: 20, scope: !32)
!37 = !DILocation(line: 28, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !20, line: 28, column: 13)
!39 = !DILocation(line: 28, column: 18, scope: !38)
!40 = !DILocation(line: 28, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !20, line: 28, column: 13)
!42 = !DILocation(line: 28, column: 27, scope: !41)
!43 = !DILocation(line: 28, column: 13, scope: !38)
!44 = !DILocation(line: 30, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !20, line: 29, column: 13)
!46 = !DILocation(line: 30, column: 17, scope: !45)
!47 = !DILocation(line: 30, column: 27, scope: !45)
!48 = !DILocation(line: 30, column: 34, scope: !45)
!49 = !DILocation(line: 31, column: 24, scope: !45)
!50 = !DILocation(line: 31, column: 17, scope: !45)
!51 = !DILocation(line: 31, column: 27, scope: !45)
!52 = !DILocation(line: 31, column: 34, scope: !45)
!53 = !DILocation(line: 32, column: 13, scope: !45)
!54 = !DILocation(line: 28, column: 35, scope: !41)
!55 = !DILocation(line: 28, column: 13, scope: !41)
!56 = distinct !{!56, !43, !57, !58}
!57 = !DILocation(line: 32, column: 13, scope: !38)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocalVariable(name: "i", scope: !60, file: !20, line: 35, type: !33)
!60 = distinct !DILexicalBlock(scope: !26, file: !20, line: 34, column: 9)
!61 = !DILocation(line: 35, column: 20, scope: !60)
!62 = !DILocation(line: 37, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !20, line: 37, column: 13)
!64 = !DILocation(line: 37, column: 18, scope: !63)
!65 = !DILocation(line: 37, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !20, line: 37, column: 13)
!67 = !DILocation(line: 37, column: 27, scope: !66)
!68 = !DILocation(line: 37, column: 13, scope: !63)
!69 = !DILocation(line: 39, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !20, line: 38, column: 13)
!71 = !DILocation(line: 39, column: 22, scope: !70)
!72 = !DILocation(line: 39, column: 34, scope: !70)
!73 = !DILocation(line: 39, column: 27, scope: !70)
!74 = !DILocation(line: 40, column: 13, scope: !70)
!75 = !DILocation(line: 37, column: 35, scope: !66)
!76 = !DILocation(line: 37, column: 13, scope: !66)
!77 = distinct !{!77, !68, !78, !58}
!78 = !DILocation(line: 40, column: 13, scope: !63)
!79 = !DILocation(line: 41, column: 30, scope: !60)
!80 = !DILocation(line: 41, column: 13, scope: !60)
!81 = !DILocation(line: 44, column: 1, scope: !19)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_bad", scope: !20, file: !20, line: 46, type: !83, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{null}
!85 = !DILocalVariable(name: "data", scope: !82, file: !20, line: 48, type: !4)
!86 = !DILocation(line: 48, column: 21, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !20, line: 49, type: !4)
!88 = !DILocation(line: 49, column: 21, scope: !82)
!89 = !DILocation(line: 49, column: 54, scope: !82)
!90 = !DILocation(line: 49, column: 37, scope: !82)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !20, line: 50, type: !4)
!92 = !DILocation(line: 50, column: 21, scope: !82)
!93 = !DILocation(line: 50, column: 55, scope: !82)
!94 = !DILocation(line: 50, column: 38, scope: !82)
!95 = !DILocation(line: 53, column: 12, scope: !82)
!96 = !DILocation(line: 53, column: 10, scope: !82)
!97 = !DILocation(line: 54, column: 78, scope: !82)
!98 = !DILocation(line: 54, column: 5, scope: !82)
!99 = !DILocation(line: 55, column: 1, scope: !82)
!100 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_goodG2BSink", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", arg: 1, scope: !100, file: !20, line: 61, type: !4)
!102 = !DILocation(line: 61, column: 99, scope: !100)
!103 = !DILocalVariable(name: "source", scope: !104, file: !20, line: 64, type: !27)
!104 = distinct !DILexicalBlock(scope: !100, file: !20, line: 63, column: 5)
!105 = !DILocation(line: 64, column: 23, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !107, file: !20, line: 66, type: !33)
!107 = distinct !DILexicalBlock(scope: !104, file: !20, line: 65, column: 9)
!108 = !DILocation(line: 66, column: 20, scope: !107)
!109 = !DILocation(line: 68, column: 20, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !20, line: 68, column: 13)
!111 = !DILocation(line: 68, column: 18, scope: !110)
!112 = !DILocation(line: 68, column: 25, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !20, line: 68, column: 13)
!114 = !DILocation(line: 68, column: 27, scope: !113)
!115 = !DILocation(line: 68, column: 13, scope: !110)
!116 = !DILocation(line: 70, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !20, line: 69, column: 13)
!118 = !DILocation(line: 70, column: 17, scope: !117)
!119 = !DILocation(line: 70, column: 27, scope: !117)
!120 = !DILocation(line: 70, column: 34, scope: !117)
!121 = !DILocation(line: 71, column: 24, scope: !117)
!122 = !DILocation(line: 71, column: 17, scope: !117)
!123 = !DILocation(line: 71, column: 27, scope: !117)
!124 = !DILocation(line: 71, column: 34, scope: !117)
!125 = !DILocation(line: 72, column: 13, scope: !117)
!126 = !DILocation(line: 68, column: 35, scope: !113)
!127 = !DILocation(line: 68, column: 13, scope: !113)
!128 = distinct !{!128, !115, !129, !58}
!129 = !DILocation(line: 72, column: 13, scope: !110)
!130 = !DILocalVariable(name: "i", scope: !131, file: !20, line: 75, type: !33)
!131 = distinct !DILexicalBlock(scope: !104, file: !20, line: 74, column: 9)
!132 = !DILocation(line: 75, column: 20, scope: !131)
!133 = !DILocation(line: 77, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !20, line: 77, column: 13)
!135 = !DILocation(line: 77, column: 18, scope: !134)
!136 = !DILocation(line: 77, column: 25, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !20, line: 77, column: 13)
!138 = !DILocation(line: 77, column: 27, scope: !137)
!139 = !DILocation(line: 77, column: 13, scope: !134)
!140 = !DILocation(line: 79, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !20, line: 78, column: 13)
!142 = !DILocation(line: 79, column: 22, scope: !141)
!143 = !DILocation(line: 79, column: 34, scope: !141)
!144 = !DILocation(line: 79, column: 27, scope: !141)
!145 = !DILocation(line: 80, column: 13, scope: !141)
!146 = !DILocation(line: 77, column: 35, scope: !137)
!147 = !DILocation(line: 77, column: 13, scope: !137)
!148 = distinct !{!148, !139, !149, !58}
!149 = !DILocation(line: 80, column: 13, scope: !134)
!150 = !DILocation(line: 81, column: 30, scope: !131)
!151 = !DILocation(line: 81, column: 13, scope: !131)
!152 = !DILocation(line: 84, column: 1, scope: !100)
!153 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_good", scope: !20, file: !20, line: 97, type: !83, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocation(line: 99, column: 5, scope: !153)
!155 = !DILocation(line: 100, column: 1, scope: !153)
!156 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 112, type: !157, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DISubroutineType(types: !158)
!158 = !{!10, !10, !159}
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!162 = !DILocalVariable(name: "argc", arg: 1, scope: !156, file: !20, line: 112, type: !10)
!163 = !DILocation(line: 112, column: 14, scope: !156)
!164 = !DILocalVariable(name: "argv", arg: 2, scope: !156, file: !20, line: 112, type: !159)
!165 = !DILocation(line: 112, column: 27, scope: !156)
!166 = !DILocation(line: 115, column: 22, scope: !156)
!167 = !DILocation(line: 115, column: 12, scope: !156)
!168 = !DILocation(line: 115, column: 5, scope: !156)
!169 = !DILocation(line: 117, column: 5, scope: !156)
!170 = !DILocation(line: 118, column: 5, scope: !156)
!171 = !DILocation(line: 119, column: 5, scope: !156)
!172 = !DILocation(line: 122, column: 5, scope: !156)
!173 = !DILocation(line: 123, column: 5, scope: !156)
!174 = !DILocation(line: 124, column: 5, scope: !156)
!175 = !DILocation(line: 126, column: 5, scope: !156)
!176 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 87, type: !83, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!177 = !DILocalVariable(name: "data", scope: !176, file: !20, line: 89, type: !4)
!178 = !DILocation(line: 89, column: 21, scope: !176)
!179 = !DILocalVariable(name: "dataBadBuffer", scope: !176, file: !20, line: 90, type: !4)
!180 = !DILocation(line: 90, column: 21, scope: !176)
!181 = !DILocation(line: 90, column: 54, scope: !176)
!182 = !DILocation(line: 90, column: 37, scope: !176)
!183 = !DILocalVariable(name: "dataGoodBuffer", scope: !176, file: !20, line: 91, type: !4)
!184 = !DILocation(line: 91, column: 21, scope: !176)
!185 = !DILocation(line: 91, column: 55, scope: !176)
!186 = !DILocation(line: 91, column: 38, scope: !176)
!187 = !DILocation(line: 93, column: 12, scope: !176)
!188 = !DILocation(line: 93, column: 10, scope: !176)
!189 = !DILocation(line: 94, column: 82, scope: !176)
!190 = !DILocation(line: 94, column: 5, scope: !176)
!191 = !DILocation(line: 95, column: 1, scope: !176)
