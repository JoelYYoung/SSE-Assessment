; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_badData = external dso_local global %struct._twoIntsStruct*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_goodG2BData = external dso_local global %struct._twoIntsStruct*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !13, metadata !DIExpression()), !dbg !22
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_badData, align 8, !dbg !23
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
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !80
  call void @free(i8* %14) #5, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_goodG2BSink() #0 !dbg !83 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_goodG2BData, align 8, !dbg !86
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  store i64 0, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !96
  %cmp = icmp ult i64 %1, 100, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !102
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !103
  store i32 0, i32* %intOne, align 8, !dbg !104
  %3 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !106
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !107
  store i32 0, i32* %intTwo, align 4, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %4, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !114, metadata !DIExpression()), !dbg !116
  store i64 0, i64* %i2, align 8, !dbg !117
  br label %for.cond3, !dbg !119

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !120
  %cmp4 = icmp ult i64 %5, 100, !dbg !122
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !123

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %7 = load i64, i64* %i2, align 8, !dbg !126
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !124
  %8 = load i64, i64* %i2, align 8, !dbg !127
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !128
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !128
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !128
  br label %for.inc8, !dbg !129

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !130
  %inc9 = add i64 %11, 1, !dbg !130
  store i64 %inc9, i64* %i2, align 8, !dbg !130
  br label %for.cond3, !dbg !131, !llvm.loop !132

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !134
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !134
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !135
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !136
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !136
  call void @free(i8* %14) #5, !dbg !137
  ret void, !dbg !138
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
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
!80 = !DILocation(line: 48, column: 18, scope: !59)
!81 = !DILocation(line: 48, column: 13, scope: !59)
!82 = !DILocation(line: 51, column: 1, scope: !9)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_goodG2BSink", scope: !10, file: !10, line: 58, type: !11, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !10, line: 60, type: !14)
!85 = !DILocation(line: 60, column: 21, scope: !83)
!86 = !DILocation(line: 60, column: 28, scope: !83)
!87 = !DILocalVariable(name: "source", scope: !88, file: !10, line: 62, type: !26)
!88 = distinct !DILexicalBlock(scope: !83, file: !10, line: 61, column: 5)
!89 = !DILocation(line: 62, column: 23, scope: !88)
!90 = !DILocalVariable(name: "i", scope: !91, file: !10, line: 64, type: !32)
!91 = distinct !DILexicalBlock(scope: !88, file: !10, line: 63, column: 9)
!92 = !DILocation(line: 64, column: 20, scope: !91)
!93 = !DILocation(line: 66, column: 20, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !10, line: 66, column: 13)
!95 = !DILocation(line: 66, column: 18, scope: !94)
!96 = !DILocation(line: 66, column: 25, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !10, line: 66, column: 13)
!98 = !DILocation(line: 66, column: 27, scope: !97)
!99 = !DILocation(line: 66, column: 13, scope: !94)
!100 = !DILocation(line: 68, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !10, line: 67, column: 13)
!102 = !DILocation(line: 68, column: 17, scope: !101)
!103 = !DILocation(line: 68, column: 27, scope: !101)
!104 = !DILocation(line: 68, column: 34, scope: !101)
!105 = !DILocation(line: 69, column: 24, scope: !101)
!106 = !DILocation(line: 69, column: 17, scope: !101)
!107 = !DILocation(line: 69, column: 27, scope: !101)
!108 = !DILocation(line: 69, column: 34, scope: !101)
!109 = !DILocation(line: 70, column: 13, scope: !101)
!110 = !DILocation(line: 66, column: 35, scope: !97)
!111 = !DILocation(line: 66, column: 13, scope: !97)
!112 = distinct !{!112, !99, !113, !57}
!113 = !DILocation(line: 70, column: 13, scope: !94)
!114 = !DILocalVariable(name: "i", scope: !115, file: !10, line: 73, type: !32)
!115 = distinct !DILexicalBlock(scope: !88, file: !10, line: 72, column: 9)
!116 = !DILocation(line: 73, column: 20, scope: !115)
!117 = !DILocation(line: 75, column: 20, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !10, line: 75, column: 13)
!119 = !DILocation(line: 75, column: 18, scope: !118)
!120 = !DILocation(line: 75, column: 25, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !10, line: 75, column: 13)
!122 = !DILocation(line: 75, column: 27, scope: !121)
!123 = !DILocation(line: 75, column: 13, scope: !118)
!124 = !DILocation(line: 77, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !10, line: 76, column: 13)
!126 = !DILocation(line: 77, column: 22, scope: !125)
!127 = !DILocation(line: 77, column: 34, scope: !125)
!128 = !DILocation(line: 77, column: 27, scope: !125)
!129 = !DILocation(line: 78, column: 13, scope: !125)
!130 = !DILocation(line: 75, column: 35, scope: !121)
!131 = !DILocation(line: 75, column: 13, scope: !121)
!132 = distinct !{!132, !123, !133, !57}
!133 = !DILocation(line: 78, column: 13, scope: !118)
!134 = !DILocation(line: 79, column: 30, scope: !115)
!135 = !DILocation(line: 79, column: 13, scope: !115)
!136 = !DILocation(line: 80, column: 18, scope: !115)
!137 = !DILocation(line: 80, column: 13, scope: !115)
!138 = !DILocation(line: 83, column: 1, scope: !83)
