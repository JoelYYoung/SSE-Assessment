; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b_badSink(%struct._twoIntsStruct* %data) #0 !dbg !9 {
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
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !79
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !79
  call void @free(i8* %13) #5, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !82 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !94
  %cmp = icmp ult i64 %0, 100, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !100
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !101
  store i32 0, i32* %intOne, align 8, !dbg !102
  %2 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !104
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !105
  store i32 0, i32* %intTwo, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %3, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !112, metadata !DIExpression()), !dbg !114
  store i64 0, i64* %i2, align 8, !dbg !115
  br label %for.cond3, !dbg !117

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !118
  %cmp4 = icmp ult i64 %4, 100, !dbg !120
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !121

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !122
  %6 = load i64, i64* %i2, align 8, !dbg !124
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !122
  %7 = load i64, i64* %i2, align 8, !dbg !125
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !126
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !126
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !126
  br label %for.inc8, !dbg !127

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !128
  %inc9 = add i64 %10, 1, !dbg !128
  store i64 %inc9, i64* %i2, align 8, !dbg !128
  br label %for.cond3, !dbg !129, !llvm.loop !130

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !132
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !132
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !133
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !134
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !134
  call void @free(i8* %13) #5, !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
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
!22 = !DILocation(line: 23, column: 90, scope: !9)
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
!79 = !DILocation(line: 44, column: 18, scope: !58)
!80 = !DILocation(line: 44, column: 13, scope: !58)
!81 = !DILocation(line: 47, column: 1, scope: !9)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_51b_goodG2BSink", scope: !10, file: !10, line: 54, type: !11, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", arg: 1, scope: !82, file: !10, line: 54, type: !13)
!84 = !DILocation(line: 54, column: 94, scope: !82)
!85 = !DILocalVariable(name: "source", scope: !86, file: !10, line: 57, type: !25)
!86 = distinct !DILexicalBlock(scope: !82, file: !10, line: 56, column: 5)
!87 = !DILocation(line: 57, column: 23, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !10, line: 59, type: !31)
!89 = distinct !DILexicalBlock(scope: !86, file: !10, line: 58, column: 9)
!90 = !DILocation(line: 59, column: 20, scope: !89)
!91 = !DILocation(line: 61, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !10, line: 61, column: 13)
!93 = !DILocation(line: 61, column: 18, scope: !92)
!94 = !DILocation(line: 61, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !10, line: 61, column: 13)
!96 = !DILocation(line: 61, column: 27, scope: !95)
!97 = !DILocation(line: 61, column: 13, scope: !92)
!98 = !DILocation(line: 63, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !10, line: 62, column: 13)
!100 = !DILocation(line: 63, column: 17, scope: !99)
!101 = !DILocation(line: 63, column: 27, scope: !99)
!102 = !DILocation(line: 63, column: 34, scope: !99)
!103 = !DILocation(line: 64, column: 24, scope: !99)
!104 = !DILocation(line: 64, column: 17, scope: !99)
!105 = !DILocation(line: 64, column: 27, scope: !99)
!106 = !DILocation(line: 64, column: 34, scope: !99)
!107 = !DILocation(line: 65, column: 13, scope: !99)
!108 = !DILocation(line: 61, column: 35, scope: !95)
!109 = !DILocation(line: 61, column: 13, scope: !95)
!110 = distinct !{!110, !97, !111, !56}
!111 = !DILocation(line: 65, column: 13, scope: !92)
!112 = !DILocalVariable(name: "i", scope: !113, file: !10, line: 68, type: !31)
!113 = distinct !DILexicalBlock(scope: !86, file: !10, line: 67, column: 9)
!114 = !DILocation(line: 68, column: 20, scope: !113)
!115 = !DILocation(line: 70, column: 20, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !10, line: 70, column: 13)
!117 = !DILocation(line: 70, column: 18, scope: !116)
!118 = !DILocation(line: 70, column: 25, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !10, line: 70, column: 13)
!120 = !DILocation(line: 70, column: 27, scope: !119)
!121 = !DILocation(line: 70, column: 13, scope: !116)
!122 = !DILocation(line: 72, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !10, line: 71, column: 13)
!124 = !DILocation(line: 72, column: 22, scope: !123)
!125 = !DILocation(line: 72, column: 34, scope: !123)
!126 = !DILocation(line: 72, column: 27, scope: !123)
!127 = !DILocation(line: 73, column: 13, scope: !123)
!128 = !DILocation(line: 70, column: 35, scope: !119)
!129 = !DILocation(line: 70, column: 13, scope: !119)
!130 = distinct !{!130, !121, !131, !56}
!131 = !DILocation(line: 73, column: 13, scope: !116)
!132 = !DILocation(line: 74, column: 30, scope: !113)
!133 = !DILocation(line: 74, column: 13, scope: !113)
!134 = !DILocation(line: 75, column: 18, scope: !113)
!135 = !DILocation(line: 75, column: 13, scope: !113)
!136 = !DILocation(line: 78, column: 1, scope: !82)
