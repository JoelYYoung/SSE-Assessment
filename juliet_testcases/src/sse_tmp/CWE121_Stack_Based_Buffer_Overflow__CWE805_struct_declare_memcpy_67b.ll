; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType = type { %struct._twoIntsStruct* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b_badSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType* %myStruct, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !29
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structFirst, align 8, !dbg !29
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %1, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !51
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 0, i32* %intOne, align 8, !dbg !53
  %3 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 0, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %4, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !64
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !65
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !65
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !65
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !65
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !66
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b_goodG2BSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !69 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType* %myStruct, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !74
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structFirst, align 8, !dbg !74
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %i, metadata !78, metadata !DIExpression()), !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !84
  %cmp = icmp ult i64 %1, 100, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !90
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !91
  store i32 0, i32* %intOne, align 8, !dbg !92
  %3 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !94
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !95
  store i32 0, i32* %intTwo, align 4, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %4, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !103
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !103
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !103
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !104
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !19, line: 100, baseType: !20)
!19 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !19, line: 96, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !20, file: !19, line: 98, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !20, file: !19, line: 99, baseType: !23, size: 32, offset: 32)
!25 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!26 = !DILocation(line: 26, column: 162, scope: !9)
!27 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!28 = !DILocation(line: 28, column: 21, scope: !9)
!29 = !DILocation(line: 28, column: 37, scope: !9)
!30 = !DILocalVariable(name: "source", scope: !31, file: !10, line: 30, type: !32)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 30, column: 23, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !10, line: 32, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !10, line: 31, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 32, column: 20, scope: !37)
!42 = !DILocation(line: 34, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !10, line: 34, column: 13)
!44 = !DILocation(line: 34, column: 18, scope: !43)
!45 = !DILocation(line: 34, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !10, line: 34, column: 13)
!47 = !DILocation(line: 34, column: 27, scope: !46)
!48 = !DILocation(line: 34, column: 13, scope: !43)
!49 = !DILocation(line: 36, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !10, line: 35, column: 13)
!51 = !DILocation(line: 36, column: 17, scope: !50)
!52 = !DILocation(line: 36, column: 27, scope: !50)
!53 = !DILocation(line: 36, column: 34, scope: !50)
!54 = !DILocation(line: 37, column: 24, scope: !50)
!55 = !DILocation(line: 37, column: 17, scope: !50)
!56 = !DILocation(line: 37, column: 27, scope: !50)
!57 = !DILocation(line: 37, column: 34, scope: !50)
!58 = !DILocation(line: 38, column: 13, scope: !50)
!59 = !DILocation(line: 34, column: 35, scope: !46)
!60 = !DILocation(line: 34, column: 13, scope: !46)
!61 = distinct !{!61, !48, !62, !63}
!62 = !DILocation(line: 38, column: 13, scope: !43)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 41, column: 16, scope: !31)
!65 = !DILocation(line: 41, column: 9, scope: !31)
!66 = !DILocation(line: 42, column: 26, scope: !31)
!67 = !DILocation(line: 42, column: 9, scope: !31)
!68 = !DILocation(line: 44, column: 1, scope: !9)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_67b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "myStruct", arg: 1, scope: !69, file: !10, line: 51, type: !13)
!71 = !DILocation(line: 51, column: 166, scope: !69)
!72 = !DILocalVariable(name: "data", scope: !69, file: !10, line: 53, type: !17)
!73 = !DILocation(line: 53, column: 21, scope: !69)
!74 = !DILocation(line: 53, column: 37, scope: !69)
!75 = !DILocalVariable(name: "source", scope: !76, file: !10, line: 55, type: !32)
!76 = distinct !DILexicalBlock(scope: !69, file: !10, line: 54, column: 5)
!77 = !DILocation(line: 55, column: 23, scope: !76)
!78 = !DILocalVariable(name: "i", scope: !79, file: !10, line: 57, type: !38)
!79 = distinct !DILexicalBlock(scope: !76, file: !10, line: 56, column: 9)
!80 = !DILocation(line: 57, column: 20, scope: !79)
!81 = !DILocation(line: 59, column: 20, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !10, line: 59, column: 13)
!83 = !DILocation(line: 59, column: 18, scope: !82)
!84 = !DILocation(line: 59, column: 25, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 59, column: 13)
!86 = !DILocation(line: 59, column: 27, scope: !85)
!87 = !DILocation(line: 59, column: 13, scope: !82)
!88 = !DILocation(line: 61, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !10, line: 60, column: 13)
!90 = !DILocation(line: 61, column: 17, scope: !89)
!91 = !DILocation(line: 61, column: 27, scope: !89)
!92 = !DILocation(line: 61, column: 34, scope: !89)
!93 = !DILocation(line: 62, column: 24, scope: !89)
!94 = !DILocation(line: 62, column: 17, scope: !89)
!95 = !DILocation(line: 62, column: 27, scope: !89)
!96 = !DILocation(line: 62, column: 34, scope: !89)
!97 = !DILocation(line: 63, column: 13, scope: !89)
!98 = !DILocation(line: 59, column: 35, scope: !85)
!99 = !DILocation(line: 59, column: 13, scope: !85)
!100 = distinct !{!100, !87, !101, !63}
!101 = !DILocation(line: 63, column: 13, scope: !82)
!102 = !DILocation(line: 66, column: 16, scope: !76)
!103 = !DILocation(line: 66, column: 9, scope: !76)
!104 = !DILocation(line: 67, column: 26, scope: !76)
!105 = !DILocation(line: 67, column: 9, scope: !76)
!106 = !DILocation(line: 69, column: 1, scope: !69)
