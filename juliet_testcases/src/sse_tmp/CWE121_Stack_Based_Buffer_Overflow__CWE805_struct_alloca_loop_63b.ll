; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b_badSink(%struct._twoIntsStruct** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct** %dataPtr, %struct._twoIntsStruct*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr.addr, align 8, !dbg !26
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !27
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %2, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !49
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !50
  store i32 0, i32* %intOne, align 8, !dbg !51
  %4 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !53
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !54
  store i32 0, i32* %intTwo, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %5, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !62, metadata !DIExpression()), !dbg !64
  store i64 0, i64* %i2, align 8, !dbg !65
  br label %for.cond3, !dbg !67

for.cond3:                                        ; preds = %for.inc8, %for.end
  %6 = load i64, i64* %i2, align 8, !dbg !68
  %cmp4 = icmp ult i64 %6, 100, !dbg !70
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !71

for.body5:                                        ; preds = %for.cond3
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %8 = load i64, i64* %i2, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !72
  %9 = load i64, i64* %i2, align 8, !dbg !75
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !76
  %10 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !76
  %11 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !76
  br label %for.inc8, !dbg !77

for.inc8:                                         ; preds = %for.body5
  %12 = load i64, i64* %i2, align 8, !dbg !78
  %inc9 = add i64 %12, 1, !dbg !78
  store i64 %inc9, i64* %i2, align 8, !dbg !78
  br label %for.cond3, !dbg !79, !llvm.loop !80

for.end10:                                        ; preds = %for.cond3
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !82
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b_goodG2BSink(%struct._twoIntsStruct** %dataPtr) #0 !dbg !85 {
entry:
  %dataPtr.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct** %dataPtr, %struct._twoIntsStruct*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr.addr, align 8, !dbg !90
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !91
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i64* %i, metadata !95, metadata !DIExpression()), !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !101
  %cmp = icmp ult i64 %2, 100, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !107
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !108
  store i32 0, i32* %intOne, align 8, !dbg !109
  %4 = load i64, i64* %i, align 8, !dbg !110
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !111
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !112
  store i32 0, i32* %intTwo, align 4, !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !115
  %inc = add i64 %5, 1, !dbg !115
  store i64 %inc, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i2, align 8, !dbg !122
  br label %for.cond3, !dbg !124

for.cond3:                                        ; preds = %for.inc8, %for.end
  %6 = load i64, i64* %i2, align 8, !dbg !125
  %cmp4 = icmp ult i64 %6, 100, !dbg !127
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !128

for.body5:                                        ; preds = %for.cond3
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %8 = load i64, i64* %i2, align 8, !dbg !131
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !129
  %9 = load i64, i64* %i2, align 8, !dbg !132
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !133
  %10 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !133
  %11 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !133
  br label %for.inc8, !dbg !134

for.inc8:                                         ; preds = %for.body5
  %12 = load i64, i64* %i2, align 8, !dbg !135
  %inc9 = add i64 %12, 1, !dbg !135
  store i64 %inc9, i64* %i2, align 8, !dbg !135
  br label %for.cond3, !dbg !136, !llvm.loop !137

for.end10:                                        ; preds = %for.cond3
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !139
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !140
  ret void, !dbg !141
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !16, line: 100, baseType: !17)
!16 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !16, line: 96, size: 64, elements: !18)
!18 = !{!19, !21}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !17, file: !16, line: 98, baseType: !20, size: 32)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !17, file: !16, line: 99, baseType: !20, size: 32, offset: 32)
!22 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!23 = !DILocation(line: 21, column: 98, scope: !9)
!24 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 23, type: !14)
!25 = !DILocation(line: 23, column: 21, scope: !9)
!26 = !DILocation(line: 23, column: 29, scope: !9)
!27 = !DILocation(line: 23, column: 28, scope: !9)
!28 = !DILocalVariable(name: "source", scope: !29, file: !10, line: 25, type: !30)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 24, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 25, column: 23, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !10, line: 27, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !10, line: 26, column: 9)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 27, column: 20, scope: !35)
!40 = !DILocation(line: 29, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !10, line: 29, column: 13)
!42 = !DILocation(line: 29, column: 18, scope: !41)
!43 = !DILocation(line: 29, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 29, column: 13)
!45 = !DILocation(line: 29, column: 27, scope: !44)
!46 = !DILocation(line: 29, column: 13, scope: !41)
!47 = !DILocation(line: 31, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !10, line: 30, column: 13)
!49 = !DILocation(line: 31, column: 17, scope: !48)
!50 = !DILocation(line: 31, column: 27, scope: !48)
!51 = !DILocation(line: 31, column: 34, scope: !48)
!52 = !DILocation(line: 32, column: 24, scope: !48)
!53 = !DILocation(line: 32, column: 17, scope: !48)
!54 = !DILocation(line: 32, column: 27, scope: !48)
!55 = !DILocation(line: 32, column: 34, scope: !48)
!56 = !DILocation(line: 33, column: 13, scope: !48)
!57 = !DILocation(line: 29, column: 35, scope: !44)
!58 = !DILocation(line: 29, column: 13, scope: !44)
!59 = distinct !{!59, !46, !60, !61}
!60 = !DILocation(line: 33, column: 13, scope: !41)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 36, type: !36)
!63 = distinct !DILexicalBlock(scope: !29, file: !10, line: 35, column: 9)
!64 = !DILocation(line: 36, column: 20, scope: !63)
!65 = !DILocation(line: 38, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !10, line: 38, column: 13)
!67 = !DILocation(line: 38, column: 18, scope: !66)
!68 = !DILocation(line: 38, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !10, line: 38, column: 13)
!70 = !DILocation(line: 38, column: 27, scope: !69)
!71 = !DILocation(line: 38, column: 13, scope: !66)
!72 = !DILocation(line: 40, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !10, line: 39, column: 13)
!74 = !DILocation(line: 40, column: 22, scope: !73)
!75 = !DILocation(line: 40, column: 34, scope: !73)
!76 = !DILocation(line: 40, column: 27, scope: !73)
!77 = !DILocation(line: 41, column: 13, scope: !73)
!78 = !DILocation(line: 38, column: 35, scope: !69)
!79 = !DILocation(line: 38, column: 13, scope: !69)
!80 = distinct !{!80, !71, !81, !61}
!81 = !DILocation(line: 41, column: 13, scope: !66)
!82 = !DILocation(line: 42, column: 30, scope: !63)
!83 = !DILocation(line: 42, column: 13, scope: !63)
!84 = !DILocation(line: 45, column: 1, scope: !9)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_63b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !85, file: !10, line: 52, type: !13)
!87 = !DILocation(line: 52, column: 102, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !10, line: 54, type: !14)
!89 = !DILocation(line: 54, column: 21, scope: !85)
!90 = !DILocation(line: 54, column: 29, scope: !85)
!91 = !DILocation(line: 54, column: 28, scope: !85)
!92 = !DILocalVariable(name: "source", scope: !93, file: !10, line: 56, type: !30)
!93 = distinct !DILexicalBlock(scope: !85, file: !10, line: 55, column: 5)
!94 = !DILocation(line: 56, column: 23, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !10, line: 58, type: !36)
!96 = distinct !DILexicalBlock(scope: !93, file: !10, line: 57, column: 9)
!97 = !DILocation(line: 58, column: 20, scope: !96)
!98 = !DILocation(line: 60, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !10, line: 60, column: 13)
!100 = !DILocation(line: 60, column: 18, scope: !99)
!101 = !DILocation(line: 60, column: 25, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !10, line: 60, column: 13)
!103 = !DILocation(line: 60, column: 27, scope: !102)
!104 = !DILocation(line: 60, column: 13, scope: !99)
!105 = !DILocation(line: 62, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !10, line: 61, column: 13)
!107 = !DILocation(line: 62, column: 17, scope: !106)
!108 = !DILocation(line: 62, column: 27, scope: !106)
!109 = !DILocation(line: 62, column: 34, scope: !106)
!110 = !DILocation(line: 63, column: 24, scope: !106)
!111 = !DILocation(line: 63, column: 17, scope: !106)
!112 = !DILocation(line: 63, column: 27, scope: !106)
!113 = !DILocation(line: 63, column: 34, scope: !106)
!114 = !DILocation(line: 64, column: 13, scope: !106)
!115 = !DILocation(line: 60, column: 35, scope: !102)
!116 = !DILocation(line: 60, column: 13, scope: !102)
!117 = distinct !{!117, !104, !118, !61}
!118 = !DILocation(line: 64, column: 13, scope: !99)
!119 = !DILocalVariable(name: "i", scope: !120, file: !10, line: 67, type: !36)
!120 = distinct !DILexicalBlock(scope: !93, file: !10, line: 66, column: 9)
!121 = !DILocation(line: 67, column: 20, scope: !120)
!122 = !DILocation(line: 69, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !10, line: 69, column: 13)
!124 = !DILocation(line: 69, column: 18, scope: !123)
!125 = !DILocation(line: 69, column: 25, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !10, line: 69, column: 13)
!127 = !DILocation(line: 69, column: 27, scope: !126)
!128 = !DILocation(line: 69, column: 13, scope: !123)
!129 = !DILocation(line: 71, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !10, line: 70, column: 13)
!131 = !DILocation(line: 71, column: 22, scope: !130)
!132 = !DILocation(line: 71, column: 34, scope: !130)
!133 = !DILocation(line: 71, column: 27, scope: !130)
!134 = !DILocation(line: 72, column: 13, scope: !130)
!135 = !DILocation(line: 69, column: 35, scope: !126)
!136 = !DILocation(line: 69, column: 13, scope: !126)
!137 = distinct !{!137, !128, !138, !61}
!138 = !DILocation(line: 72, column: 13, scope: !123)
!139 = !DILocation(line: 73, column: 30, scope: !120)
!140 = !DILocation(line: 73, column: 13, scope: !120)
!141 = !DILocation(line: 76, column: 1, scope: !85)
