; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b_badSink(%struct._twoIntsStruct** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  store %struct._twoIntsStruct** %dataArray, %struct._twoIntsStruct*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataArray.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataArray.addr, align 8, !dbg !26
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, i64 2, !dbg !26
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %arrayidx, align 8, !dbg !26
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %2, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !48
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 0, !dbg !49
  store i32 0, i32* %intOne, align 8, !dbg !50
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !52
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !53
  store i32 0, i32* %intTwo, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %5, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !61, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i3, align 8, !dbg !64
  br label %for.cond4, !dbg !66

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !67
  %cmp5 = icmp ult i64 %6, 100, !dbg !69
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !70

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %8 = load i64, i64* %i3, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !71
  %9 = load i64, i64* %i3, align 8, !dbg !74
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !75
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !75
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !75
  br label %for.inc9, !dbg !76

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !77
  %inc10 = add i64 %12, 1, !dbg !77
  store i64 %inc10, i64* %i3, align 8, !dbg !77
  br label %for.cond4, !dbg !78, !llvm.loop !79

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !81
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b_goodG2BSink(%struct._twoIntsStruct** %dataArray) #0 !dbg !84 {
entry:
  %dataArray.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  store %struct._twoIntsStruct** %dataArray, %struct._twoIntsStruct*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataArray.addr, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataArray.addr, align 8, !dbg !89
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, i64 2, !dbg !89
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %arrayidx, align 8, !dbg !89
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !99
  %cmp = icmp ult i64 %2, 100, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !105
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 0, !dbg !106
  store i32 0, i32* %intOne, align 8, !dbg !107
  %4 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !109
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !110
  store i32 0, i32* %intTwo, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %5, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !117, metadata !DIExpression()), !dbg !119
  store i64 0, i64* %i3, align 8, !dbg !120
  br label %for.cond4, !dbg !122

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !123
  %cmp5 = icmp ult i64 %6, 100, !dbg !125
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !126

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %8 = load i64, i64* %i3, align 8, !dbg !129
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !127
  %9 = load i64, i64* %i3, align 8, !dbg !130
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !131
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !131
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !131
  br label %for.inc9, !dbg !132

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !133
  %inc10 = add i64 %12, 1, !dbg !133
  store i64 %inc10, i64* %i3, align 8, !dbg !133
  br label %for.cond4, !dbg !134, !llvm.loop !135

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !137
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
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
!22 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!23 = !DILocation(line: 21, column: 96, scope: !9)
!24 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!25 = !DILocation(line: 24, column: 21, scope: !9)
!26 = !DILocation(line: 24, column: 28, scope: !9)
!27 = !DILocalVariable(name: "source", scope: !28, file: !10, line: 26, type: !29)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 26, column: 23, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 28, type: !35)
!34 = distinct !DILexicalBlock(scope: !28, file: !10, line: 27, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 28, column: 20, scope: !34)
!39 = !DILocation(line: 30, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !10, line: 30, column: 13)
!41 = !DILocation(line: 30, column: 18, scope: !40)
!42 = !DILocation(line: 30, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 30, column: 13)
!44 = !DILocation(line: 30, column: 27, scope: !43)
!45 = !DILocation(line: 30, column: 13, scope: !40)
!46 = !DILocation(line: 32, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !10, line: 31, column: 13)
!48 = !DILocation(line: 32, column: 17, scope: !47)
!49 = !DILocation(line: 32, column: 27, scope: !47)
!50 = !DILocation(line: 32, column: 34, scope: !47)
!51 = !DILocation(line: 33, column: 24, scope: !47)
!52 = !DILocation(line: 33, column: 17, scope: !47)
!53 = !DILocation(line: 33, column: 27, scope: !47)
!54 = !DILocation(line: 33, column: 34, scope: !47)
!55 = !DILocation(line: 34, column: 13, scope: !47)
!56 = !DILocation(line: 30, column: 35, scope: !43)
!57 = !DILocation(line: 30, column: 13, scope: !43)
!58 = distinct !{!58, !45, !59, !60}
!59 = !DILocation(line: 34, column: 13, scope: !40)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocalVariable(name: "i", scope: !62, file: !10, line: 37, type: !35)
!62 = distinct !DILexicalBlock(scope: !28, file: !10, line: 36, column: 9)
!63 = !DILocation(line: 37, column: 20, scope: !62)
!64 = !DILocation(line: 39, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !10, line: 39, column: 13)
!66 = !DILocation(line: 39, column: 18, scope: !65)
!67 = !DILocation(line: 39, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !10, line: 39, column: 13)
!69 = !DILocation(line: 39, column: 27, scope: !68)
!70 = !DILocation(line: 39, column: 13, scope: !65)
!71 = !DILocation(line: 41, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 40, column: 13)
!73 = !DILocation(line: 41, column: 22, scope: !72)
!74 = !DILocation(line: 41, column: 34, scope: !72)
!75 = !DILocation(line: 41, column: 27, scope: !72)
!76 = !DILocation(line: 42, column: 13, scope: !72)
!77 = !DILocation(line: 39, column: 35, scope: !68)
!78 = !DILocation(line: 39, column: 13, scope: !68)
!79 = distinct !{!79, !70, !80, !60}
!80 = !DILocation(line: 42, column: 13, scope: !65)
!81 = !DILocation(line: 43, column: 30, scope: !62)
!82 = !DILocation(line: 43, column: 13, scope: !62)
!83 = !DILocation(line: 46, column: 1, scope: !9)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_66b_goodG2BSink", scope: !10, file: !10, line: 53, type: !11, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "dataArray", arg: 1, scope: !84, file: !10, line: 53, type: !13)
!86 = !DILocation(line: 53, column: 100, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !10, line: 55, type: !14)
!88 = !DILocation(line: 55, column: 21, scope: !84)
!89 = !DILocation(line: 55, column: 28, scope: !84)
!90 = !DILocalVariable(name: "source", scope: !91, file: !10, line: 57, type: !29)
!91 = distinct !DILexicalBlock(scope: !84, file: !10, line: 56, column: 5)
!92 = !DILocation(line: 57, column: 23, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !10, line: 59, type: !35)
!94 = distinct !DILexicalBlock(scope: !91, file: !10, line: 58, column: 9)
!95 = !DILocation(line: 59, column: 20, scope: !94)
!96 = !DILocation(line: 61, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !10, line: 61, column: 13)
!98 = !DILocation(line: 61, column: 18, scope: !97)
!99 = !DILocation(line: 61, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !10, line: 61, column: 13)
!101 = !DILocation(line: 61, column: 27, scope: !100)
!102 = !DILocation(line: 61, column: 13, scope: !97)
!103 = !DILocation(line: 63, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !10, line: 62, column: 13)
!105 = !DILocation(line: 63, column: 17, scope: !104)
!106 = !DILocation(line: 63, column: 27, scope: !104)
!107 = !DILocation(line: 63, column: 34, scope: !104)
!108 = !DILocation(line: 64, column: 24, scope: !104)
!109 = !DILocation(line: 64, column: 17, scope: !104)
!110 = !DILocation(line: 64, column: 27, scope: !104)
!111 = !DILocation(line: 64, column: 34, scope: !104)
!112 = !DILocation(line: 65, column: 13, scope: !104)
!113 = !DILocation(line: 61, column: 35, scope: !100)
!114 = !DILocation(line: 61, column: 13, scope: !100)
!115 = distinct !{!115, !102, !116, !60}
!116 = !DILocation(line: 65, column: 13, scope: !97)
!117 = !DILocalVariable(name: "i", scope: !118, file: !10, line: 68, type: !35)
!118 = distinct !DILexicalBlock(scope: !91, file: !10, line: 67, column: 9)
!119 = !DILocation(line: 68, column: 20, scope: !118)
!120 = !DILocation(line: 70, column: 20, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !10, line: 70, column: 13)
!122 = !DILocation(line: 70, column: 18, scope: !121)
!123 = !DILocation(line: 70, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 70, column: 13)
!125 = !DILocation(line: 70, column: 27, scope: !124)
!126 = !DILocation(line: 70, column: 13, scope: !121)
!127 = !DILocation(line: 72, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !10, line: 71, column: 13)
!129 = !DILocation(line: 72, column: 22, scope: !128)
!130 = !DILocation(line: 72, column: 34, scope: !128)
!131 = !DILocation(line: 72, column: 27, scope: !128)
!132 = !DILocation(line: 73, column: 13, scope: !128)
!133 = !DILocation(line: 70, column: 35, scope: !124)
!134 = !DILocation(line: 70, column: 13, scope: !124)
!135 = distinct !{!135, !126, !136, !60}
!136 = !DILocation(line: 73, column: 13, scope: !121)
!137 = !DILocation(line: 74, column: 30, scope: !118)
!138 = !DILocation(line: 74, column: 13, scope: !118)
!139 = !DILocation(line: 77, column: 1, scope: !84)
