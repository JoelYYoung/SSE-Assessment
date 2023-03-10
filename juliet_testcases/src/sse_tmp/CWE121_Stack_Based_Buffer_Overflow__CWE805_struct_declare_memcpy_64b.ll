; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !19 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !28
  %1 = bitcast i8* %0 to %struct._twoIntsStruct**, !dbg !29
  store %struct._twoIntsStruct** %1, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !32
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %2, align 8, !dbg !33
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %4, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !55
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !56
  store i32 0, i32* %intOne, align 8, !dbg !57
  %6 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !59
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !60
  store i32 0, i32* %intTwo, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %7, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !69
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !69
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !69
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !70
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !73 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !78
  %1 = bitcast i8* %0 to %struct._twoIntsStruct**, !dbg !79
  store %struct._twoIntsStruct** %1, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %2 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !82
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %2, align 8, !dbg !83
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !93
  %cmp = icmp ult i64 %4, 100, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !99
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !100
  store i32 0, i32* %intOne, align 8, !dbg !101
  %6 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !103
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !104
  store i32 0, i32* %intTwo, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %7, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !111
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !112
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !112
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !112
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !113
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b_badSink", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !19, file: !20, line: 21, type: !23)
!25 = !DILocation(line: 21, column: 90, scope: !19)
!26 = !DILocalVariable(name: "dataPtr", scope: !19, file: !20, line: 24, type: !4)
!27 = !DILocation(line: 24, column: 23, scope: !19)
!28 = !DILocation(line: 24, column: 52, scope: !19)
!29 = !DILocation(line: 24, column: 33, scope: !19)
!30 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !5)
!31 = !DILocation(line: 26, column: 21, scope: !19)
!32 = !DILocation(line: 26, column: 30, scope: !19)
!33 = !DILocation(line: 26, column: 29, scope: !19)
!34 = !DILocalVariable(name: "source", scope: !35, file: !20, line: 28, type: !36)
!35 = distinct !DILexicalBlock(scope: !19, file: !20, line: 27, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 28, column: 23, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !20, line: 30, type: !42)
!41 = distinct !DILexicalBlock(scope: !35, file: !20, line: 29, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 30, column: 20, scope: !41)
!46 = !DILocation(line: 32, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !20, line: 32, column: 13)
!48 = !DILocation(line: 32, column: 18, scope: !47)
!49 = !DILocation(line: 32, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !20, line: 32, column: 13)
!51 = !DILocation(line: 32, column: 27, scope: !50)
!52 = !DILocation(line: 32, column: 13, scope: !47)
!53 = !DILocation(line: 34, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !20, line: 33, column: 13)
!55 = !DILocation(line: 34, column: 17, scope: !54)
!56 = !DILocation(line: 34, column: 27, scope: !54)
!57 = !DILocation(line: 34, column: 34, scope: !54)
!58 = !DILocation(line: 35, column: 24, scope: !54)
!59 = !DILocation(line: 35, column: 17, scope: !54)
!60 = !DILocation(line: 35, column: 27, scope: !54)
!61 = !DILocation(line: 35, column: 34, scope: !54)
!62 = !DILocation(line: 36, column: 13, scope: !54)
!63 = !DILocation(line: 32, column: 35, scope: !50)
!64 = !DILocation(line: 32, column: 13, scope: !50)
!65 = distinct !{!65, !52, !66, !67}
!66 = !DILocation(line: 36, column: 13, scope: !47)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 39, column: 16, scope: !35)
!69 = !DILocation(line: 39, column: 9, scope: !35)
!70 = !DILocation(line: 40, column: 26, scope: !35)
!71 = !DILocation(line: 40, column: 9, scope: !35)
!72 = !DILocation(line: 42, column: 1, scope: !19)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_64b_goodG2BSink", scope: !20, file: !20, line: 49, type: !21, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !73, file: !20, line: 49, type: !23)
!75 = !DILocation(line: 49, column: 94, scope: !73)
!76 = !DILocalVariable(name: "dataPtr", scope: !73, file: !20, line: 52, type: !4)
!77 = !DILocation(line: 52, column: 23, scope: !73)
!78 = !DILocation(line: 52, column: 52, scope: !73)
!79 = !DILocation(line: 52, column: 33, scope: !73)
!80 = !DILocalVariable(name: "data", scope: !73, file: !20, line: 54, type: !5)
!81 = !DILocation(line: 54, column: 21, scope: !73)
!82 = !DILocation(line: 54, column: 30, scope: !73)
!83 = !DILocation(line: 54, column: 29, scope: !73)
!84 = !DILocalVariable(name: "source", scope: !85, file: !20, line: 56, type: !36)
!85 = distinct !DILexicalBlock(scope: !73, file: !20, line: 55, column: 5)
!86 = !DILocation(line: 56, column: 23, scope: !85)
!87 = !DILocalVariable(name: "i", scope: !88, file: !20, line: 58, type: !42)
!88 = distinct !DILexicalBlock(scope: !85, file: !20, line: 57, column: 9)
!89 = !DILocation(line: 58, column: 20, scope: !88)
!90 = !DILocation(line: 60, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !20, line: 60, column: 13)
!92 = !DILocation(line: 60, column: 18, scope: !91)
!93 = !DILocation(line: 60, column: 25, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !20, line: 60, column: 13)
!95 = !DILocation(line: 60, column: 27, scope: !94)
!96 = !DILocation(line: 60, column: 13, scope: !91)
!97 = !DILocation(line: 62, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !20, line: 61, column: 13)
!99 = !DILocation(line: 62, column: 17, scope: !98)
!100 = !DILocation(line: 62, column: 27, scope: !98)
!101 = !DILocation(line: 62, column: 34, scope: !98)
!102 = !DILocation(line: 63, column: 24, scope: !98)
!103 = !DILocation(line: 63, column: 17, scope: !98)
!104 = !DILocation(line: 63, column: 27, scope: !98)
!105 = !DILocation(line: 63, column: 34, scope: !98)
!106 = !DILocation(line: 64, column: 13, scope: !98)
!107 = !DILocation(line: 60, column: 35, scope: !94)
!108 = !DILocation(line: 60, column: 13, scope: !94)
!109 = distinct !{!109, !96, !110, !67}
!110 = !DILocation(line: 64, column: 13, scope: !91)
!111 = !DILocation(line: 67, column: 16, scope: !85)
!112 = !DILocation(line: 67, column: 9, scope: !85)
!113 = !DILocation(line: 68, column: 26, scope: !85)
!114 = !DILocation(line: 68, column: 9, scope: !85)
!115 = !DILocation(line: 70, column: 1, scope: !73)
