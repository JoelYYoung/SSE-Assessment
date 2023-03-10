; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType = type { %struct._twoIntsStruct* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b_badSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType* %myStruct, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !29
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
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !68
  call void @free(i8* %10) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b_goodG2BSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !71 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType* %myStruct, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !76
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structFirst, align 8, !dbg !76
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %1, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !92
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !93
  store i32 0, i32* %intOne, align 8, !dbg !94
  %3 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !96
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !97
  store i32 0, i32* %intTwo, align 4, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %4, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !105
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !105
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !106
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !107
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !108
  call void @free(i8* %10) #5, !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67_structType", file: !10, line: 19, size: 64, elements: !15)
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
!26 = !DILocation(line: 26, column: 148, scope: !9)
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
!68 = !DILocation(line: 43, column: 14, scope: !31)
!69 = !DILocation(line: 43, column: 9, scope: !31)
!70 = !DILocation(line: 45, column: 1, scope: !9)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_67b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "myStruct", arg: 1, scope: !71, file: !10, line: 52, type: !13)
!73 = !DILocation(line: 52, column: 152, scope: !71)
!74 = !DILocalVariable(name: "data", scope: !71, file: !10, line: 54, type: !17)
!75 = !DILocation(line: 54, column: 21, scope: !71)
!76 = !DILocation(line: 54, column: 37, scope: !71)
!77 = !DILocalVariable(name: "source", scope: !78, file: !10, line: 56, type: !32)
!78 = distinct !DILexicalBlock(scope: !71, file: !10, line: 55, column: 5)
!79 = !DILocation(line: 56, column: 23, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !10, line: 58, type: !38)
!81 = distinct !DILexicalBlock(scope: !78, file: !10, line: 57, column: 9)
!82 = !DILocation(line: 58, column: 20, scope: !81)
!83 = !DILocation(line: 60, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 60, column: 13)
!85 = !DILocation(line: 60, column: 18, scope: !84)
!86 = !DILocation(line: 60, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 60, column: 13)
!88 = !DILocation(line: 60, column: 27, scope: !87)
!89 = !DILocation(line: 60, column: 13, scope: !84)
!90 = !DILocation(line: 62, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !10, line: 61, column: 13)
!92 = !DILocation(line: 62, column: 17, scope: !91)
!93 = !DILocation(line: 62, column: 27, scope: !91)
!94 = !DILocation(line: 62, column: 34, scope: !91)
!95 = !DILocation(line: 63, column: 24, scope: !91)
!96 = !DILocation(line: 63, column: 17, scope: !91)
!97 = !DILocation(line: 63, column: 27, scope: !91)
!98 = !DILocation(line: 63, column: 34, scope: !91)
!99 = !DILocation(line: 64, column: 13, scope: !91)
!100 = !DILocation(line: 60, column: 35, scope: !87)
!101 = !DILocation(line: 60, column: 13, scope: !87)
!102 = distinct !{!102, !89, !103, !63}
!103 = !DILocation(line: 64, column: 13, scope: !84)
!104 = !DILocation(line: 67, column: 16, scope: !78)
!105 = !DILocation(line: 67, column: 9, scope: !78)
!106 = !DILocation(line: 68, column: 26, scope: !78)
!107 = !DILocation(line: 68, column: 9, scope: !78)
!108 = !DILocation(line: 69, column: 14, scope: !78)
!109 = !DILocation(line: 69, column: 9, scope: !78)
!110 = !DILocation(line: 71, column: 1, scope: !71)
