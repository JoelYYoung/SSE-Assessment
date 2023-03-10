; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b_badSink(%struct._twoIntsStruct** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
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
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !62
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !63
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !63
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !63
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !63
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !64
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !65
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !66
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !66
  call void @free(i8* %11) #5, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b_goodG2BSink(%struct._twoIntsStruct** %dataPtr) #0 !dbg !69 {
entry:
  %dataPtr.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct** %dataPtr, %struct._twoIntsStruct*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr.addr, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr.addr, align 8, !dbg !74
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !75
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !76, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %i, metadata !79, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !85
  %cmp = icmp ult i64 %2, 100, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !91
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !92
  store i32 0, i32* %intOne, align 8, !dbg !93
  %4 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !95
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !96
  store i32 0, i32* %intTwo, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %5, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !103
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !104
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !104
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !104
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !104
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !105
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !106
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !107
  call void @free(i8* %11) #5, !dbg !108
  ret void, !dbg !109
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
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
!23 = !DILocation(line: 21, column: 95, scope: !9)
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
!62 = !DILocation(line: 36, column: 17, scope: !29)
!63 = !DILocation(line: 36, column: 9, scope: !29)
!64 = !DILocation(line: 37, column: 26, scope: !29)
!65 = !DILocation(line: 37, column: 9, scope: !29)
!66 = !DILocation(line: 38, column: 14, scope: !29)
!67 = !DILocation(line: 38, column: 9, scope: !29)
!68 = !DILocation(line: 40, column: 1, scope: !9)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_63b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !69, file: !10, line: 47, type: !13)
!71 = !DILocation(line: 47, column: 99, scope: !69)
!72 = !DILocalVariable(name: "data", scope: !69, file: !10, line: 49, type: !14)
!73 = !DILocation(line: 49, column: 21, scope: !69)
!74 = !DILocation(line: 49, column: 29, scope: !69)
!75 = !DILocation(line: 49, column: 28, scope: !69)
!76 = !DILocalVariable(name: "source", scope: !77, file: !10, line: 51, type: !30)
!77 = distinct !DILexicalBlock(scope: !69, file: !10, line: 50, column: 5)
!78 = !DILocation(line: 51, column: 23, scope: !77)
!79 = !DILocalVariable(name: "i", scope: !80, file: !10, line: 53, type: !36)
!80 = distinct !DILexicalBlock(scope: !77, file: !10, line: 52, column: 9)
!81 = !DILocation(line: 53, column: 20, scope: !80)
!82 = !DILocation(line: 55, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 55, column: 13)
!84 = !DILocation(line: 55, column: 18, scope: !83)
!85 = !DILocation(line: 55, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 55, column: 13)
!87 = !DILocation(line: 55, column: 27, scope: !86)
!88 = !DILocation(line: 55, column: 13, scope: !83)
!89 = !DILocation(line: 57, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !10, line: 56, column: 13)
!91 = !DILocation(line: 57, column: 17, scope: !90)
!92 = !DILocation(line: 57, column: 27, scope: !90)
!93 = !DILocation(line: 57, column: 34, scope: !90)
!94 = !DILocation(line: 58, column: 24, scope: !90)
!95 = !DILocation(line: 58, column: 17, scope: !90)
!96 = !DILocation(line: 58, column: 27, scope: !90)
!97 = !DILocation(line: 58, column: 34, scope: !90)
!98 = !DILocation(line: 59, column: 13, scope: !90)
!99 = !DILocation(line: 55, column: 35, scope: !86)
!100 = !DILocation(line: 55, column: 13, scope: !86)
!101 = distinct !{!101, !88, !102, !61}
!102 = !DILocation(line: 59, column: 13, scope: !83)
!103 = !DILocation(line: 62, column: 17, scope: !77)
!104 = !DILocation(line: 62, column: 9, scope: !77)
!105 = !DILocation(line: 63, column: 26, scope: !77)
!106 = !DILocation(line: 63, column: 9, scope: !77)
!107 = !DILocation(line: 64, column: 14, scope: !77)
!108 = !DILocation(line: 64, column: 9, scope: !77)
!109 = !DILocation(line: 66, column: 1, scope: !69)
