; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b_badSink(%struct._twoIntsStruct* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %0, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !44
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !45
  store i32 0, i32* %intOne, align 8, !dbg !46
  %2 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !48
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !49
  store i32 0, i32* %intTwo, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %3, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !57, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %i2, align 8, !dbg !60
  br label %for.cond3, !dbg !62

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !63
  %cmp4 = icmp ult i64 %4, 100, !dbg !65
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !66

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !67
  %6 = load i64, i64* %i2, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !67
  %7 = load i64, i64* %i2, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !71
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !71
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !71
  br label %for.inc8, !dbg !72

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !73
  %inc9 = add i64 %10, 1, !dbg !73
  store i64 %inc9, i64* %i2, align 8, !dbg !73
  br label %for.cond3, !dbg !74, !llvm.loop !75

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !77
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !77
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !80 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %i, metadata !86, metadata !DIExpression()), !dbg !88
  store i64 0, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !92
  %cmp = icmp ult i64 %0, 100, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !98
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !99
  store i32 0, i32* %intOne, align 8, !dbg !100
  %2 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !102
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !103
  store i32 0, i32* %intTwo, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %3, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !110, metadata !DIExpression()), !dbg !112
  store i64 0, i64* %i2, align 8, !dbg !113
  br label %for.cond3, !dbg !115

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !116
  %cmp4 = icmp ult i64 %4, 100, !dbg !118
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !119

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !120
  %6 = load i64, i64* %i2, align 8, !dbg !122
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !120
  %7 = load i64, i64* %i2, align 8, !dbg !123
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !124
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !124
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !124
  br label %for.inc8, !dbg !125

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !126
  %inc9 = add i64 %10, 1, !dbg !126
  store i64 %inc9, i64* %i2, align 8, !dbg !126
  br label %for.cond3, !dbg !127, !llvm.loop !128

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !130
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !130
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !15, line: 100, baseType: !16)
!15 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !15, line: 96, size: 64, elements: !17)
!17 = !{!18, !20}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !16, file: !15, line: 98, baseType: !19, size: 32)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !16, file: !15, line: 99, baseType: !19, size: 32, offset: 32)
!21 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!22 = !DILocation(line: 23, column: 96, scope: !9)
!23 = !DILocalVariable(name: "source", scope: !24, file: !10, line: 26, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 26, column: 23, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !30, file: !10, line: 28, type: !31)
!30 = distinct !DILexicalBlock(scope: !24, file: !10, line: 27, column: 9)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 28, column: 20, scope: !30)
!35 = !DILocation(line: 30, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !10, line: 30, column: 13)
!37 = !DILocation(line: 30, column: 18, scope: !36)
!38 = !DILocation(line: 30, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 30, column: 13)
!40 = !DILocation(line: 30, column: 27, scope: !39)
!41 = !DILocation(line: 30, column: 13, scope: !36)
!42 = !DILocation(line: 32, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 31, column: 13)
!44 = !DILocation(line: 32, column: 17, scope: !43)
!45 = !DILocation(line: 32, column: 27, scope: !43)
!46 = !DILocation(line: 32, column: 34, scope: !43)
!47 = !DILocation(line: 33, column: 24, scope: !43)
!48 = !DILocation(line: 33, column: 17, scope: !43)
!49 = !DILocation(line: 33, column: 27, scope: !43)
!50 = !DILocation(line: 33, column: 34, scope: !43)
!51 = !DILocation(line: 34, column: 13, scope: !43)
!52 = !DILocation(line: 30, column: 35, scope: !39)
!53 = !DILocation(line: 30, column: 13, scope: !39)
!54 = distinct !{!54, !41, !55, !56}
!55 = !DILocation(line: 34, column: 13, scope: !36)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocalVariable(name: "i", scope: !58, file: !10, line: 37, type: !31)
!58 = distinct !DILexicalBlock(scope: !24, file: !10, line: 36, column: 9)
!59 = !DILocation(line: 37, column: 20, scope: !58)
!60 = !DILocation(line: 39, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !10, line: 39, column: 13)
!62 = !DILocation(line: 39, column: 18, scope: !61)
!63 = !DILocation(line: 39, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !10, line: 39, column: 13)
!65 = !DILocation(line: 39, column: 27, scope: !64)
!66 = !DILocation(line: 39, column: 13, scope: !61)
!67 = !DILocation(line: 41, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !10, line: 40, column: 13)
!69 = !DILocation(line: 41, column: 22, scope: !68)
!70 = !DILocation(line: 41, column: 34, scope: !68)
!71 = !DILocation(line: 41, column: 27, scope: !68)
!72 = !DILocation(line: 42, column: 13, scope: !68)
!73 = !DILocation(line: 39, column: 35, scope: !64)
!74 = !DILocation(line: 39, column: 13, scope: !64)
!75 = distinct !{!75, !66, !76, !56}
!76 = !DILocation(line: 42, column: 13, scope: !61)
!77 = !DILocation(line: 43, column: 30, scope: !58)
!78 = !DILocation(line: 43, column: 13, scope: !58)
!79 = !DILocation(line: 46, column: 1, scope: !9)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_51b_goodG2BSink", scope: !10, file: !10, line: 53, type: !11, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !10, line: 53, type: !13)
!82 = !DILocation(line: 53, column: 100, scope: !80)
!83 = !DILocalVariable(name: "source", scope: !84, file: !10, line: 56, type: !25)
!84 = distinct !DILexicalBlock(scope: !80, file: !10, line: 55, column: 5)
!85 = !DILocation(line: 56, column: 23, scope: !84)
!86 = !DILocalVariable(name: "i", scope: !87, file: !10, line: 58, type: !31)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 57, column: 9)
!88 = !DILocation(line: 58, column: 20, scope: !87)
!89 = !DILocation(line: 60, column: 20, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !10, line: 60, column: 13)
!91 = !DILocation(line: 60, column: 18, scope: !90)
!92 = !DILocation(line: 60, column: 25, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !10, line: 60, column: 13)
!94 = !DILocation(line: 60, column: 27, scope: !93)
!95 = !DILocation(line: 60, column: 13, scope: !90)
!96 = !DILocation(line: 62, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !10, line: 61, column: 13)
!98 = !DILocation(line: 62, column: 17, scope: !97)
!99 = !DILocation(line: 62, column: 27, scope: !97)
!100 = !DILocation(line: 62, column: 34, scope: !97)
!101 = !DILocation(line: 63, column: 24, scope: !97)
!102 = !DILocation(line: 63, column: 17, scope: !97)
!103 = !DILocation(line: 63, column: 27, scope: !97)
!104 = !DILocation(line: 63, column: 34, scope: !97)
!105 = !DILocation(line: 64, column: 13, scope: !97)
!106 = !DILocation(line: 60, column: 35, scope: !93)
!107 = !DILocation(line: 60, column: 13, scope: !93)
!108 = distinct !{!108, !95, !109, !56}
!109 = !DILocation(line: 64, column: 13, scope: !90)
!110 = !DILocalVariable(name: "i", scope: !111, file: !10, line: 67, type: !31)
!111 = distinct !DILexicalBlock(scope: !84, file: !10, line: 66, column: 9)
!112 = !DILocation(line: 67, column: 20, scope: !111)
!113 = !DILocation(line: 69, column: 20, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !10, line: 69, column: 13)
!115 = !DILocation(line: 69, column: 18, scope: !114)
!116 = !DILocation(line: 69, column: 25, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !10, line: 69, column: 13)
!118 = !DILocation(line: 69, column: 27, scope: !117)
!119 = !DILocation(line: 69, column: 13, scope: !114)
!120 = !DILocation(line: 71, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !10, line: 70, column: 13)
!122 = !DILocation(line: 71, column: 22, scope: !121)
!123 = !DILocation(line: 71, column: 34, scope: !121)
!124 = !DILocation(line: 71, column: 27, scope: !121)
!125 = !DILocation(line: 72, column: 13, scope: !121)
!126 = !DILocation(line: 69, column: 35, scope: !117)
!127 = !DILocation(line: 69, column: 13, scope: !117)
!128 = distinct !{!128, !119, !129, !56}
!129 = !DILocation(line: 72, column: 13, scope: !114)
!130 = !DILocation(line: 73, column: 30, scope: !111)
!131 = !DILocation(line: 73, column: 13, scope: !111)
!132 = !DILocation(line: 76, column: 1, scope: !80)
