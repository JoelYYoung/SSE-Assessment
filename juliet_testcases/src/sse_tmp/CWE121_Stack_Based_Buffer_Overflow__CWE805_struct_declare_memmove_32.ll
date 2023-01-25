; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !43
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !44
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !42
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data1, align 8, !dbg !46
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !47
  %3 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !48
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %3, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !50, metadata !DIExpression()), !dbg !52
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !53
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !54
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i, metadata !58, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %6, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !73
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !74
  store i32 0, i32* %intOne, align 8, !dbg !75
  %8 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !77
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !78
  store i32 0, i32* %intTwo, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %9, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !86
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !87
  %arraydecay4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !87
  %12 = bitcast %struct._twoIntsStruct* %arraydecay4 to i8*, !dbg !87
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !87
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !88
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !88
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #5, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #5, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !117, metadata !DIExpression()), !dbg !118
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !119, metadata !DIExpression()), !dbg !120
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !125, metadata !DIExpression()), !dbg !127
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !128
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !129
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !127
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !130
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data1, align 8, !dbg !131
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !132
  %3 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !133
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %3, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !135, metadata !DIExpression()), !dbg !137
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !138
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !139
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !149
  %cmp = icmp ult i64 %6, 100, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !155
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !156
  store i32 0, i32* %intOne, align 8, !dbg !157
  %8 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !159
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !160
  store i32 0, i32* %intTwo, align 4, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %9, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !167
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !168
  %arraydecay4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !168
  %12 = bitcast %struct._twoIntsStruct* %arraydecay4 to i8*, !dbg !168
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !168
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !169
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !169
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx5), !dbg !170
  ret void, !dbg !171
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 24, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!27 = !DILocation(line: 24, column: 22, scope: !11)
!28 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 25, type: !26)
!29 = !DILocation(line: 25, column: 22, scope: !11)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 26, column: 19, scope: !11)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 27, column: 19, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 29, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!42 = !DILocation(line: 29, column: 25, scope: !41)
!43 = !DILocation(line: 29, column: 33, scope: !41)
!44 = !DILocation(line: 29, column: 32, scope: !41)
!45 = !DILocation(line: 32, column: 16, scope: !41)
!46 = !DILocation(line: 32, column: 14, scope: !41)
!47 = !DILocation(line: 33, column: 21, scope: !41)
!48 = !DILocation(line: 33, column: 10, scope: !41)
!49 = !DILocation(line: 33, column: 19, scope: !41)
!50 = !DILocalVariable(name: "data", scope: !51, file: !12, line: 36, type: !16)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!52 = !DILocation(line: 36, column: 25, scope: !51)
!53 = !DILocation(line: 36, column: 33, scope: !51)
!54 = !DILocation(line: 36, column: 32, scope: !51)
!55 = !DILocalVariable(name: "source", scope: !56, file: !12, line: 38, type: !36)
!56 = distinct !DILexicalBlock(scope: !51, file: !12, line: 37, column: 9)
!57 = !DILocation(line: 38, column: 27, scope: !56)
!58 = !DILocalVariable(name: "i", scope: !59, file: !12, line: 40, type: !60)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 39, column: 13)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 46, baseType: !62)
!61 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!62 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 40, column: 24, scope: !59)
!64 = !DILocation(line: 42, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !12, line: 42, column: 17)
!66 = !DILocation(line: 42, column: 22, scope: !65)
!67 = !DILocation(line: 42, column: 29, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 42, column: 17)
!69 = !DILocation(line: 42, column: 31, scope: !68)
!70 = !DILocation(line: 42, column: 17, scope: !65)
!71 = !DILocation(line: 44, column: 28, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !12, line: 43, column: 17)
!73 = !DILocation(line: 44, column: 21, scope: !72)
!74 = !DILocation(line: 44, column: 31, scope: !72)
!75 = !DILocation(line: 44, column: 38, scope: !72)
!76 = !DILocation(line: 45, column: 28, scope: !72)
!77 = !DILocation(line: 45, column: 21, scope: !72)
!78 = !DILocation(line: 45, column: 31, scope: !72)
!79 = !DILocation(line: 45, column: 38, scope: !72)
!80 = !DILocation(line: 46, column: 17, scope: !72)
!81 = !DILocation(line: 42, column: 39, scope: !68)
!82 = !DILocation(line: 42, column: 17, scope: !68)
!83 = distinct !{!83, !70, !84, !85}
!84 = !DILocation(line: 46, column: 17, scope: !65)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 49, column: 21, scope: !56)
!87 = !DILocation(line: 49, column: 13, scope: !56)
!88 = !DILocation(line: 50, column: 30, scope: !56)
!89 = !DILocation(line: 50, column: 13, scope: !56)
!90 = !DILocation(line: 53, column: 1, scope: !11)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 95, column: 5, scope: !91)
!93 = !DILocation(line: 96, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !95, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!22, !22, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !12, line: 107, type: !22)
!101 = !DILocation(line: 107, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !12, line: 107, type: !97)
!103 = !DILocation(line: 107, column: 27, scope: !94)
!104 = !DILocation(line: 110, column: 22, scope: !94)
!105 = !DILocation(line: 110, column: 12, scope: !94)
!106 = !DILocation(line: 110, column: 5, scope: !94)
!107 = !DILocation(line: 112, column: 5, scope: !94)
!108 = !DILocation(line: 113, column: 5, scope: !94)
!109 = !DILocation(line: 114, column: 5, scope: !94)
!110 = !DILocation(line: 117, column: 5, scope: !94)
!111 = !DILocation(line: 118, column: 5, scope: !94)
!112 = !DILocation(line: 119, column: 5, scope: !94)
!113 = !DILocation(line: 121, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 62, type: !16)
!116 = !DILocation(line: 62, column: 21, scope: !114)
!117 = !DILocalVariable(name: "dataPtr1", scope: !114, file: !12, line: 63, type: !26)
!118 = !DILocation(line: 63, column: 22, scope: !114)
!119 = !DILocalVariable(name: "dataPtr2", scope: !114, file: !12, line: 64, type: !26)
!120 = !DILocation(line: 64, column: 22, scope: !114)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !12, line: 65, type: !31)
!122 = !DILocation(line: 65, column: 19, scope: !114)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !12, line: 66, type: !36)
!124 = !DILocation(line: 66, column: 19, scope: !114)
!125 = !DILocalVariable(name: "data", scope: !126, file: !12, line: 68, type: !16)
!126 = distinct !DILexicalBlock(scope: !114, file: !12, line: 67, column: 5)
!127 = !DILocation(line: 68, column: 25, scope: !126)
!128 = !DILocation(line: 68, column: 33, scope: !126)
!129 = !DILocation(line: 68, column: 32, scope: !126)
!130 = !DILocation(line: 70, column: 16, scope: !126)
!131 = !DILocation(line: 70, column: 14, scope: !126)
!132 = !DILocation(line: 71, column: 21, scope: !126)
!133 = !DILocation(line: 71, column: 10, scope: !126)
!134 = !DILocation(line: 71, column: 19, scope: !126)
!135 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 74, type: !16)
!136 = distinct !DILexicalBlock(scope: !114, file: !12, line: 73, column: 5)
!137 = !DILocation(line: 74, column: 25, scope: !136)
!138 = !DILocation(line: 74, column: 33, scope: !136)
!139 = !DILocation(line: 74, column: 32, scope: !136)
!140 = !DILocalVariable(name: "source", scope: !141, file: !12, line: 76, type: !36)
!141 = distinct !DILexicalBlock(scope: !136, file: !12, line: 75, column: 9)
!142 = !DILocation(line: 76, column: 27, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !12, line: 78, type: !60)
!144 = distinct !DILexicalBlock(scope: !141, file: !12, line: 77, column: 13)
!145 = !DILocation(line: 78, column: 24, scope: !144)
!146 = !DILocation(line: 80, column: 24, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 80, column: 17)
!148 = !DILocation(line: 80, column: 22, scope: !147)
!149 = !DILocation(line: 80, column: 29, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 80, column: 17)
!151 = !DILocation(line: 80, column: 31, scope: !150)
!152 = !DILocation(line: 80, column: 17, scope: !147)
!153 = !DILocation(line: 82, column: 28, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 81, column: 17)
!155 = !DILocation(line: 82, column: 21, scope: !154)
!156 = !DILocation(line: 82, column: 31, scope: !154)
!157 = !DILocation(line: 82, column: 38, scope: !154)
!158 = !DILocation(line: 83, column: 28, scope: !154)
!159 = !DILocation(line: 83, column: 21, scope: !154)
!160 = !DILocation(line: 83, column: 31, scope: !154)
!161 = !DILocation(line: 83, column: 38, scope: !154)
!162 = !DILocation(line: 84, column: 17, scope: !154)
!163 = !DILocation(line: 80, column: 39, scope: !150)
!164 = !DILocation(line: 80, column: 17, scope: !150)
!165 = distinct !{!165, !152, !166, !85}
!166 = !DILocation(line: 84, column: 17, scope: !147)
!167 = !DILocation(line: 87, column: 21, scope: !141)
!168 = !DILocation(line: 87, column: 13, scope: !141)
!169 = !DILocation(line: 88, column: 30, scope: !141)
!170 = !DILocation(line: 88, column: 13, scope: !141)
!171 = !DILocation(line: 91, column: 1, scope: !114)
