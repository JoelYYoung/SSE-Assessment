; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !17 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !26
  %1 = bitcast i8* %0 to i64**, !dbg !27
  store i64** %1, i64*** %dataPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !30
  %3 = load i64*, i64** %2, align 8, !dbg !31
  store i64* %3, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %5, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %6, !dbg !53
  %7 = load i64, i64* %arrayidx, align 8, !dbg !53
  %8 = load i64*, i64** %data, align 8, !dbg !54
  %9 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i64, i64* %8, i64 %9, !dbg !54
  store i64 %7, i64* %arrayidx1, align 8, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %10, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %11 = load i64*, i64** %data, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 0, !dbg !63
  %12 = load i64, i64* %arrayidx2, align 8, !dbg !63
  call void @printLongLongLine(i64 %12), !dbg !64
  %13 = load i64*, i64** %data, align 8, !dbg !65
  %14 = bitcast i64* %13 to i8*, !dbg !65
  call void @free(i8* %14) #5, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !68 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !73
  %1 = bitcast i8* %0 to i64**, !dbg !74
  store i64** %1, i64*** %dataPtr, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !77
  %3 = load i64*, i64** %2, align 8, !dbg !78
  store i64* %3, i64** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !DIExpression()), !dbg !84
  store i64 0, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !88
  %cmp = icmp ult i64 %5, 100, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %6, !dbg !94
  %7 = load i64, i64* %arrayidx, align 8, !dbg !94
  %8 = load i64*, i64** %data, align 8, !dbg !95
  %9 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds i64, i64* %8, i64 %9, !dbg !95
  store i64 %7, i64* %arrayidx1, align 8, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %10, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %11 = load i64*, i64** %data, align 8, !dbg !103
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 0, !dbg !103
  %12 = load i64, i64* %arrayidx2, align 8, !dbg !103
  call void @printLongLongLine(i64 %12), !dbg !104
  %13 = load i64*, i64** %data, align 8, !dbg !105
  %14 = bitcast i64* %13 to i8*, !dbg !105
  call void @free(i8* %14) #5, !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b_badSink", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !17, file: !18, line: 21, type: !21)
!23 = !DILocation(line: 21, column: 82, scope: !17)
!24 = !DILocalVariable(name: "dataPtr", scope: !17, file: !18, line: 24, type: !4)
!25 = !DILocation(line: 24, column: 17, scope: !17)
!26 = !DILocation(line: 24, column: 40, scope: !17)
!27 = !DILocation(line: 24, column: 27, scope: !17)
!28 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !5)
!29 = !DILocation(line: 26, column: 15, scope: !17)
!30 = !DILocation(line: 26, column: 24, scope: !17)
!31 = !DILocation(line: 26, column: 23, scope: !17)
!32 = !DILocalVariable(name: "source", scope: !33, file: !18, line: 28, type: !34)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 27, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 28, column: 17, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !18, line: 30, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !18, line: 29, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 30, column: 20, scope: !39)
!44 = !DILocation(line: 32, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !18, line: 32, column: 13)
!46 = !DILocation(line: 32, column: 18, scope: !45)
!47 = !DILocation(line: 32, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !18, line: 32, column: 13)
!49 = !DILocation(line: 32, column: 27, scope: !48)
!50 = !DILocation(line: 32, column: 13, scope: !45)
!51 = !DILocation(line: 34, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !18, line: 33, column: 13)
!53 = !DILocation(line: 34, column: 27, scope: !52)
!54 = !DILocation(line: 34, column: 17, scope: !52)
!55 = !DILocation(line: 34, column: 22, scope: !52)
!56 = !DILocation(line: 34, column: 25, scope: !52)
!57 = !DILocation(line: 35, column: 13, scope: !52)
!58 = !DILocation(line: 32, column: 35, scope: !48)
!59 = !DILocation(line: 32, column: 13, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 35, column: 13, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 36, column: 31, scope: !39)
!64 = !DILocation(line: 36, column: 13, scope: !39)
!65 = !DILocation(line: 37, column: 18, scope: !39)
!66 = !DILocation(line: 37, column: 13, scope: !39)
!67 = !DILocation(line: 40, column: 1, scope: !17)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_64b_goodG2BSink", scope: !18, file: !18, line: 47, type: !19, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !68, file: !18, line: 47, type: !21)
!70 = !DILocation(line: 47, column: 86, scope: !68)
!71 = !DILocalVariable(name: "dataPtr", scope: !68, file: !18, line: 50, type: !4)
!72 = !DILocation(line: 50, column: 17, scope: !68)
!73 = !DILocation(line: 50, column: 40, scope: !68)
!74 = !DILocation(line: 50, column: 27, scope: !68)
!75 = !DILocalVariable(name: "data", scope: !68, file: !18, line: 52, type: !5)
!76 = !DILocation(line: 52, column: 15, scope: !68)
!77 = !DILocation(line: 52, column: 24, scope: !68)
!78 = !DILocation(line: 52, column: 23, scope: !68)
!79 = !DILocalVariable(name: "source", scope: !80, file: !18, line: 54, type: !34)
!80 = distinct !DILexicalBlock(scope: !68, file: !18, line: 53, column: 5)
!81 = !DILocation(line: 54, column: 17, scope: !80)
!82 = !DILocalVariable(name: "i", scope: !83, file: !18, line: 56, type: !40)
!83 = distinct !DILexicalBlock(scope: !80, file: !18, line: 55, column: 9)
!84 = !DILocation(line: 56, column: 20, scope: !83)
!85 = !DILocation(line: 58, column: 20, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !18, line: 58, column: 13)
!87 = !DILocation(line: 58, column: 18, scope: !86)
!88 = !DILocation(line: 58, column: 25, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !18, line: 58, column: 13)
!90 = !DILocation(line: 58, column: 27, scope: !89)
!91 = !DILocation(line: 58, column: 13, scope: !86)
!92 = !DILocation(line: 60, column: 34, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !18, line: 59, column: 13)
!94 = !DILocation(line: 60, column: 27, scope: !93)
!95 = !DILocation(line: 60, column: 17, scope: !93)
!96 = !DILocation(line: 60, column: 22, scope: !93)
!97 = !DILocation(line: 60, column: 25, scope: !93)
!98 = !DILocation(line: 61, column: 13, scope: !93)
!99 = !DILocation(line: 58, column: 35, scope: !89)
!100 = !DILocation(line: 58, column: 13, scope: !89)
!101 = distinct !{!101, !91, !102, !62}
!102 = !DILocation(line: 61, column: 13, scope: !86)
!103 = !DILocation(line: 62, column: 31, scope: !83)
!104 = !DILocation(line: 62, column: 13, scope: !83)
!105 = !DILocation(line: 63, column: 18, scope: !83)
!106 = !DILocation(line: 63, column: 13, scope: !83)
!107 = !DILocation(line: 66, column: 1, scope: !68)
