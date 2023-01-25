; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15_bad() #0 !dbg !19 {
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
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %5, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !56
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !57
  store i32 0, i32* %intOne, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !60
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !61
  store i32 0, i32* %intTwo, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !69
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !70
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !70
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !70
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !70
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !71
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 400, align 16, !dbg !103
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !104
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = alloca i8, i64 800, align 16, !dbg !107
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !108
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !106
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !109
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !120
  %cmp = icmp ult i64 %5, 100, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !126
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !127
  store i32 0, i32* %intOne, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !130
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !131
  store i32 0, i32* %intTwo, align 4, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %8, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !138
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !139
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !139
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !139
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !139
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !140
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %0 = alloca i8, i64 400, align 16, !dbg !148
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !149
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %2 = alloca i8, i64 800, align 16, !dbg !152
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !153
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !151
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !154
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !156, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !165
  %cmp = icmp ult i64 %5, 100, !dbg !167
  br i1 %cmp, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !171
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !172
  store i32 0, i32* %intOne, align 8, !dbg !173
  %7 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !175
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !176
  store i32 0, i32* %intTwo, align 4, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %8, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !184
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !184
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !184
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !184
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !185
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !186
  ret void, !dbg !187
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 31, column: 16, scope: !19)
!34 = !DILocation(line: 31, column: 14, scope: !19)
!35 = !DILocalVariable(name: "source", scope: !36, file: !20, line: 39, type: !37)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 38, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 39, column: 23, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !20, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !20, line: 40, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 41, column: 20, scope: !42)
!47 = !DILocation(line: 43, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !20, line: 43, column: 13)
!49 = !DILocation(line: 43, column: 18, scope: !48)
!50 = !DILocation(line: 43, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !20, line: 43, column: 13)
!52 = !DILocation(line: 43, column: 27, scope: !51)
!53 = !DILocation(line: 43, column: 13, scope: !48)
!54 = !DILocation(line: 45, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !20, line: 44, column: 13)
!56 = !DILocation(line: 45, column: 17, scope: !55)
!57 = !DILocation(line: 45, column: 27, scope: !55)
!58 = !DILocation(line: 45, column: 34, scope: !55)
!59 = !DILocation(line: 46, column: 24, scope: !55)
!60 = !DILocation(line: 46, column: 17, scope: !55)
!61 = !DILocation(line: 46, column: 27, scope: !55)
!62 = !DILocation(line: 46, column: 34, scope: !55)
!63 = !DILocation(line: 47, column: 13, scope: !55)
!64 = !DILocation(line: 43, column: 35, scope: !51)
!65 = !DILocation(line: 43, column: 13, scope: !51)
!66 = distinct !{!66, !53, !67, !68}
!67 = !DILocation(line: 47, column: 13, scope: !48)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 50, column: 17, scope: !36)
!70 = !DILocation(line: 50, column: 9, scope: !36)
!71 = !DILocation(line: 51, column: 26, scope: !36)
!72 = !DILocation(line: 51, column: 9, scope: !36)
!73 = !DILocation(line: 53, column: 1, scope: !19)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_15_good", scope: !20, file: !20, line: 127, type: !21, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 129, column: 5, scope: !74)
!76 = !DILocation(line: 130, column: 5, scope: !74)
!77 = !DILocation(line: 131, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 143, type: !79, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!10, !10, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !20, line: 143, type: !10)
!85 = !DILocation(line: 143, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !20, line: 143, type: !81)
!87 = !DILocation(line: 143, column: 27, scope: !78)
!88 = !DILocation(line: 146, column: 22, scope: !78)
!89 = !DILocation(line: 146, column: 12, scope: !78)
!90 = !DILocation(line: 146, column: 5, scope: !78)
!91 = !DILocation(line: 148, column: 5, scope: !78)
!92 = !DILocation(line: 149, column: 5, scope: !78)
!93 = !DILocation(line: 150, column: 5, scope: !78)
!94 = !DILocation(line: 153, column: 5, scope: !78)
!95 = !DILocation(line: 154, column: 5, scope: !78)
!96 = !DILocation(line: 155, column: 5, scope: !78)
!97 = !DILocation(line: 157, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !20, line: 62, type: !4)
!100 = !DILocation(line: 62, column: 21, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !20, line: 63, type: !4)
!102 = !DILocation(line: 63, column: 21, scope: !98)
!103 = !DILocation(line: 63, column: 54, scope: !98)
!104 = !DILocation(line: 63, column: 37, scope: !98)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !20, line: 64, type: !4)
!106 = !DILocation(line: 64, column: 21, scope: !98)
!107 = !DILocation(line: 64, column: 55, scope: !98)
!108 = !DILocation(line: 64, column: 38, scope: !98)
!109 = !DILocation(line: 73, column: 16, scope: !98)
!110 = !DILocation(line: 73, column: 14, scope: !98)
!111 = !DILocalVariable(name: "source", scope: !112, file: !20, line: 77, type: !37)
!112 = distinct !DILexicalBlock(scope: !98, file: !20, line: 76, column: 5)
!113 = !DILocation(line: 77, column: 23, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !20, line: 79, type: !43)
!115 = distinct !DILexicalBlock(scope: !112, file: !20, line: 78, column: 9)
!116 = !DILocation(line: 79, column: 20, scope: !115)
!117 = !DILocation(line: 81, column: 20, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !20, line: 81, column: 13)
!119 = !DILocation(line: 81, column: 18, scope: !118)
!120 = !DILocation(line: 81, column: 25, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !20, line: 81, column: 13)
!122 = !DILocation(line: 81, column: 27, scope: !121)
!123 = !DILocation(line: 81, column: 13, scope: !118)
!124 = !DILocation(line: 83, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !20, line: 82, column: 13)
!126 = !DILocation(line: 83, column: 17, scope: !125)
!127 = !DILocation(line: 83, column: 27, scope: !125)
!128 = !DILocation(line: 83, column: 34, scope: !125)
!129 = !DILocation(line: 84, column: 24, scope: !125)
!130 = !DILocation(line: 84, column: 17, scope: !125)
!131 = !DILocation(line: 84, column: 27, scope: !125)
!132 = !DILocation(line: 84, column: 34, scope: !125)
!133 = !DILocation(line: 85, column: 13, scope: !125)
!134 = !DILocation(line: 81, column: 35, scope: !121)
!135 = !DILocation(line: 81, column: 13, scope: !121)
!136 = distinct !{!136, !123, !137, !68}
!137 = !DILocation(line: 85, column: 13, scope: !118)
!138 = !DILocation(line: 88, column: 17, scope: !112)
!139 = !DILocation(line: 88, column: 9, scope: !112)
!140 = !DILocation(line: 89, column: 26, scope: !112)
!141 = !DILocation(line: 89, column: 9, scope: !112)
!142 = !DILocation(line: 91, column: 1, scope: !98)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 94, type: !21, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !20, line: 96, type: !4)
!145 = !DILocation(line: 96, column: 21, scope: !143)
!146 = !DILocalVariable(name: "dataBadBuffer", scope: !143, file: !20, line: 97, type: !4)
!147 = !DILocation(line: 97, column: 21, scope: !143)
!148 = !DILocation(line: 97, column: 54, scope: !143)
!149 = !DILocation(line: 97, column: 37, scope: !143)
!150 = !DILocalVariable(name: "dataGoodBuffer", scope: !143, file: !20, line: 98, type: !4)
!151 = !DILocation(line: 98, column: 21, scope: !143)
!152 = !DILocation(line: 98, column: 55, scope: !143)
!153 = !DILocation(line: 98, column: 38, scope: !143)
!154 = !DILocation(line: 103, column: 16, scope: !143)
!155 = !DILocation(line: 103, column: 14, scope: !143)
!156 = !DILocalVariable(name: "source", scope: !157, file: !20, line: 111, type: !37)
!157 = distinct !DILexicalBlock(scope: !143, file: !20, line: 110, column: 5)
!158 = !DILocation(line: 111, column: 23, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !160, file: !20, line: 113, type: !43)
!160 = distinct !DILexicalBlock(scope: !157, file: !20, line: 112, column: 9)
!161 = !DILocation(line: 113, column: 20, scope: !160)
!162 = !DILocation(line: 115, column: 20, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !20, line: 115, column: 13)
!164 = !DILocation(line: 115, column: 18, scope: !163)
!165 = !DILocation(line: 115, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !20, line: 115, column: 13)
!167 = !DILocation(line: 115, column: 27, scope: !166)
!168 = !DILocation(line: 115, column: 13, scope: !163)
!169 = !DILocation(line: 117, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !20, line: 116, column: 13)
!171 = !DILocation(line: 117, column: 17, scope: !170)
!172 = !DILocation(line: 117, column: 27, scope: !170)
!173 = !DILocation(line: 117, column: 34, scope: !170)
!174 = !DILocation(line: 118, column: 24, scope: !170)
!175 = !DILocation(line: 118, column: 17, scope: !170)
!176 = !DILocation(line: 118, column: 27, scope: !170)
!177 = !DILocation(line: 118, column: 34, scope: !170)
!178 = !DILocation(line: 119, column: 13, scope: !170)
!179 = !DILocation(line: 115, column: 35, scope: !166)
!180 = !DILocation(line: 115, column: 13, scope: !166)
!181 = distinct !{!181, !168, !182, !68}
!182 = !DILocation(line: 119, column: 13, scope: !163)
!183 = !DILocation(line: 122, column: 17, scope: !157)
!184 = !DILocation(line: 122, column: 9, scope: !157)
!185 = !DILocation(line: 123, column: 26, scope: !157)
!186 = !DILocation(line: 123, column: 9, scope: !157)
!187 = !DILocation(line: 125, column: 1, scope: !143)
