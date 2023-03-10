; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68_badData = external dso_local global %struct._twoIntsStruct*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68_goodG2BData = external dso_local global %struct._twoIntsStruct*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !13, metadata !DIExpression()), !dbg !22
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68_badData, align 8, !dbg !23
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %1, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !45
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !46
  store i32 0, i32* %intOne, align 8, !dbg !47
  %3 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !49
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !50
  store i32 0, i32* %intTwo, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %4, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !58, metadata !DIExpression()), !dbg !60
  store i64 0, i64* %i2, align 8, !dbg !61
  br label %for.cond3, !dbg !63

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !64
  %cmp4 = icmp ult i64 %5, 100, !dbg !66
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !67

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %7 = load i64, i64* %i2, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !68
  %8 = load i64, i64* %i2, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !72
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !72
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !72
  br label %for.inc8, !dbg !73

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !74
  %inc9 = add i64 %11, 1, !dbg !74
  store i64 %inc9, i64* %i2, align 8, !dbg !74
  br label %for.cond3, !dbg !75, !llvm.loop !76

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b_goodG2BSink() #0 !dbg !81 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68_goodG2BData, align 8, !dbg !84
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !94
  %cmp = icmp ult i64 %1, 100, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !100
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !101
  store i32 0, i32* %intOne, align 8, !dbg !102
  %3 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !104
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !105
  store i32 0, i32* %intTwo, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %4, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !112, metadata !DIExpression()), !dbg !114
  store i64 0, i64* %i2, align 8, !dbg !115
  br label %for.cond3, !dbg !117

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !118
  %cmp4 = icmp ult i64 %5, 100, !dbg !120
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !121

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %7 = load i64, i64* %i2, align 8, !dbg !124
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !122
  %8 = load i64, i64* %i2, align 8, !dbg !125
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !126
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !126
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !126
  br label %for.inc8, !dbg !127

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !128
  %inc9 = add i64 %11, 1, !dbg !128
  store i64 %inc9, i64* %i2, align 8, !dbg !128
  br label %for.cond3, !dbg !129, !llvm.loop !130

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !132
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !16, line: 100, baseType: !17)
!16 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !16, line: 96, size: 64, elements: !18)
!18 = !{!19, !21}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !17, file: !16, line: 98, baseType: !20, size: 32)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !17, file: !16, line: 99, baseType: !20, size: 32, offset: 32)
!22 = !DILocation(line: 28, column: 21, scope: !9)
!23 = !DILocation(line: 28, column: 28, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 30, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 30, column: 23, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !10, line: 32, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !10, line: 31, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 32, column: 20, scope: !31)
!36 = !DILocation(line: 34, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !10, line: 34, column: 13)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 34, column: 13)
!41 = !DILocation(line: 34, column: 27, scope: !40)
!42 = !DILocation(line: 34, column: 13, scope: !37)
!43 = !DILocation(line: 36, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 35, column: 13)
!45 = !DILocation(line: 36, column: 17, scope: !44)
!46 = !DILocation(line: 36, column: 27, scope: !44)
!47 = !DILocation(line: 36, column: 34, scope: !44)
!48 = !DILocation(line: 37, column: 24, scope: !44)
!49 = !DILocation(line: 37, column: 17, scope: !44)
!50 = !DILocation(line: 37, column: 27, scope: !44)
!51 = !DILocation(line: 37, column: 34, scope: !44)
!52 = !DILocation(line: 38, column: 13, scope: !44)
!53 = !DILocation(line: 34, column: 35, scope: !40)
!54 = !DILocation(line: 34, column: 13, scope: !40)
!55 = distinct !{!55, !42, !56, !57}
!56 = !DILocation(line: 38, column: 13, scope: !37)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocalVariable(name: "i", scope: !59, file: !10, line: 41, type: !32)
!59 = distinct !DILexicalBlock(scope: !25, file: !10, line: 40, column: 9)
!60 = !DILocation(line: 41, column: 20, scope: !59)
!61 = !DILocation(line: 43, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !10, line: 43, column: 13)
!63 = !DILocation(line: 43, column: 18, scope: !62)
!64 = !DILocation(line: 43, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !10, line: 43, column: 13)
!66 = !DILocation(line: 43, column: 27, scope: !65)
!67 = !DILocation(line: 43, column: 13, scope: !62)
!68 = !DILocation(line: 45, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !10, line: 44, column: 13)
!70 = !DILocation(line: 45, column: 22, scope: !69)
!71 = !DILocation(line: 45, column: 34, scope: !69)
!72 = !DILocation(line: 45, column: 27, scope: !69)
!73 = !DILocation(line: 46, column: 13, scope: !69)
!74 = !DILocation(line: 43, column: 35, scope: !65)
!75 = !DILocation(line: 43, column: 13, scope: !65)
!76 = distinct !{!76, !67, !77, !57}
!77 = !DILocation(line: 46, column: 13, scope: !62)
!78 = !DILocation(line: 47, column: 30, scope: !59)
!79 = !DILocation(line: 47, column: 13, scope: !59)
!80 = !DILocation(line: 50, column: 1, scope: !9)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_68b_goodG2BSink", scope: !10, file: !10, line: 57, type: !11, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !10, line: 59, type: !14)
!83 = !DILocation(line: 59, column: 21, scope: !81)
!84 = !DILocation(line: 59, column: 28, scope: !81)
!85 = !DILocalVariable(name: "source", scope: !86, file: !10, line: 61, type: !26)
!86 = distinct !DILexicalBlock(scope: !81, file: !10, line: 60, column: 5)
!87 = !DILocation(line: 61, column: 23, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !10, line: 63, type: !32)
!89 = distinct !DILexicalBlock(scope: !86, file: !10, line: 62, column: 9)
!90 = !DILocation(line: 63, column: 20, scope: !89)
!91 = !DILocation(line: 65, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !10, line: 65, column: 13)
!93 = !DILocation(line: 65, column: 18, scope: !92)
!94 = !DILocation(line: 65, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !10, line: 65, column: 13)
!96 = !DILocation(line: 65, column: 27, scope: !95)
!97 = !DILocation(line: 65, column: 13, scope: !92)
!98 = !DILocation(line: 67, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !10, line: 66, column: 13)
!100 = !DILocation(line: 67, column: 17, scope: !99)
!101 = !DILocation(line: 67, column: 27, scope: !99)
!102 = !DILocation(line: 67, column: 34, scope: !99)
!103 = !DILocation(line: 68, column: 24, scope: !99)
!104 = !DILocation(line: 68, column: 17, scope: !99)
!105 = !DILocation(line: 68, column: 27, scope: !99)
!106 = !DILocation(line: 68, column: 34, scope: !99)
!107 = !DILocation(line: 69, column: 13, scope: !99)
!108 = !DILocation(line: 65, column: 35, scope: !95)
!109 = !DILocation(line: 65, column: 13, scope: !95)
!110 = distinct !{!110, !97, !111, !57}
!111 = !DILocation(line: 69, column: 13, scope: !92)
!112 = !DILocalVariable(name: "i", scope: !113, file: !10, line: 72, type: !32)
!113 = distinct !DILexicalBlock(scope: !86, file: !10, line: 71, column: 9)
!114 = !DILocation(line: 72, column: 20, scope: !113)
!115 = !DILocation(line: 74, column: 20, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !10, line: 74, column: 13)
!117 = !DILocation(line: 74, column: 18, scope: !116)
!118 = !DILocation(line: 74, column: 25, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !10, line: 74, column: 13)
!120 = !DILocation(line: 74, column: 27, scope: !119)
!121 = !DILocation(line: 74, column: 13, scope: !116)
!122 = !DILocation(line: 76, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !10, line: 75, column: 13)
!124 = !DILocation(line: 76, column: 22, scope: !123)
!125 = !DILocation(line: 76, column: 34, scope: !123)
!126 = !DILocation(line: 76, column: 27, scope: !123)
!127 = !DILocation(line: 77, column: 13, scope: !123)
!128 = !DILocation(line: 74, column: 35, scope: !119)
!129 = !DILocation(line: 74, column: 13, scope: !119)
!130 = distinct !{!130, !121, !131, !57}
!131 = !DILocation(line: 77, column: 13, scope: !116)
!132 = !DILocation(line: 78, column: 30, scope: !113)
!133 = !DILocation(line: 78, column: 13, scope: !113)
!134 = !DILocation(line: 81, column: 1, scope: !81)
