; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16_bad() #0 !dbg !19 {
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
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !73
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !73
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !73
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !73
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !74
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 400, align 16, !dbg !105
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !106
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 800, align 16, !dbg !109
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !110
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !108
  br label %while.body, !dbg !111

while.body:                                       ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !112
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !114
  br label %while.end, !dbg !115

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !125
  %cmp = icmp ult i64 %5, 100, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !131
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !132
  store i32 0, i32* %intOne, align 8, !dbg !133
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !135
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !136
  store i32 0, i32* %intTwo, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %8, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !144
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !144
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !144
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 800, i1 false), !dbg !144
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !145
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !146
  ret void, !dbg !147
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16.c", directory: "/root/SSE-Assessment")
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
!47 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!72 = !DILocation(line: 45, column: 17, scope: !39)
!73 = !DILocation(line: 45, column: 9, scope: !39)
!74 = !DILocation(line: 46, column: 26, scope: !39)
!75 = !DILocation(line: 46, column: 9, scope: !39)
!76 = !DILocation(line: 48, column: 1, scope: !19)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_16_good", scope: !20, file: !20, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 85, column: 5, scope: !77)
!79 = !DILocation(line: 86, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 98, type: !81, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!10, !10, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !20, line: 98, type: !10)
!87 = !DILocation(line: 98, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !20, line: 98, type: !83)
!89 = !DILocation(line: 98, column: 27, scope: !80)
!90 = !DILocation(line: 101, column: 22, scope: !80)
!91 = !DILocation(line: 101, column: 12, scope: !80)
!92 = !DILocation(line: 101, column: 5, scope: !80)
!93 = !DILocation(line: 103, column: 5, scope: !80)
!94 = !DILocation(line: 104, column: 5, scope: !80)
!95 = !DILocation(line: 105, column: 5, scope: !80)
!96 = !DILocation(line: 108, column: 5, scope: !80)
!97 = !DILocation(line: 109, column: 5, scope: !80)
!98 = !DILocation(line: 110, column: 5, scope: !80)
!99 = !DILocation(line: 112, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !20, line: 57, type: !4)
!102 = !DILocation(line: 57, column: 21, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !20, line: 58, type: !4)
!104 = !DILocation(line: 58, column: 21, scope: !100)
!105 = !DILocation(line: 58, column: 54, scope: !100)
!106 = !DILocation(line: 58, column: 37, scope: !100)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !20, line: 59, type: !4)
!108 = !DILocation(line: 59, column: 21, scope: !100)
!109 = !DILocation(line: 59, column: 55, scope: !100)
!110 = !DILocation(line: 59, column: 38, scope: !100)
!111 = !DILocation(line: 60, column: 5, scope: !100)
!112 = !DILocation(line: 63, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !100, file: !20, line: 61, column: 5)
!114 = !DILocation(line: 63, column: 14, scope: !113)
!115 = !DILocation(line: 64, column: 9, scope: !113)
!116 = !DILocalVariable(name: "source", scope: !117, file: !20, line: 67, type: !40)
!117 = distinct !DILexicalBlock(scope: !100, file: !20, line: 66, column: 5)
!118 = !DILocation(line: 67, column: 23, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !20, line: 69, type: !46)
!120 = distinct !DILexicalBlock(scope: !117, file: !20, line: 68, column: 9)
!121 = !DILocation(line: 69, column: 20, scope: !120)
!122 = !DILocation(line: 71, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !20, line: 71, column: 13)
!124 = !DILocation(line: 71, column: 18, scope: !123)
!125 = !DILocation(line: 71, column: 25, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !20, line: 71, column: 13)
!127 = !DILocation(line: 71, column: 27, scope: !126)
!128 = !DILocation(line: 71, column: 13, scope: !123)
!129 = !DILocation(line: 73, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !20, line: 72, column: 13)
!131 = !DILocation(line: 73, column: 17, scope: !130)
!132 = !DILocation(line: 73, column: 27, scope: !130)
!133 = !DILocation(line: 73, column: 34, scope: !130)
!134 = !DILocation(line: 74, column: 24, scope: !130)
!135 = !DILocation(line: 74, column: 17, scope: !130)
!136 = !DILocation(line: 74, column: 27, scope: !130)
!137 = !DILocation(line: 74, column: 34, scope: !130)
!138 = !DILocation(line: 75, column: 13, scope: !130)
!139 = !DILocation(line: 71, column: 35, scope: !126)
!140 = !DILocation(line: 71, column: 13, scope: !126)
!141 = distinct !{!141, !128, !142, !71}
!142 = !DILocation(line: 75, column: 13, scope: !123)
!143 = !DILocation(line: 78, column: 17, scope: !117)
!144 = !DILocation(line: 78, column: 9, scope: !117)
!145 = !DILocation(line: 79, column: 26, scope: !117)
!146 = !DILocation(line: 79, column: 9, scope: !117)
!147 = !DILocation(line: 81, column: 1, scope: !100)
