; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !24
  %1 = bitcast i8* %0 to i32**, !dbg !25
  store i32** %1, i32*** %dataPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !28
  %3 = load i32*, i32** %2, align 8, !dbg !29
  store i32* %3, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %4, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !53
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  %8 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !54
  store i32 %6, i32* %arrayidx2, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %9, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !63
  store i32 0, i32* %arrayidx3, align 4, !dbg !64
  %11 = load i32*, i32** %data, align 8, !dbg !65
  call void @printWLine(i32* %11), !dbg !66
  %12 = load i32*, i32** %data, align 8, !dbg !67
  %13 = bitcast i32* %12 to i8*, !dbg !67
  call void @free(i8* %13) #4, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !70 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !75
  %1 = bitcast i8* %0 to i32**, !dbg !76
  store i32** %1, i32*** %dataPtr, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !79
  %3 = load i32*, i32** %2, align 8, !dbg !80
  store i32* %3, i32** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !86
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !87
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !93
  %cmp = icmp ult i64 %4, 100, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !99
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !99
  %7 = load i32*, i32** %data, align 8, !dbg !100
  %8 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !100
  store i32 %6, i32* %arrayidx2, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %9, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %11 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %11), !dbg !111
  %12 = load i32*, i32** %data, align 8, !dbg !112
  %13 = bitcast i32* %12 to i8*, !dbg !112
  call void @free(i8* %13) #4, !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 23, type: !19)
!21 = !DILocation(line: 23, column: 82, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 17, scope: !15)
!24 = !DILocation(line: 26, column: 40, scope: !15)
!25 = !DILocation(line: 26, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !5)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 24, scope: !15)
!29 = !DILocation(line: 28, column: 23, scope: !15)
!30 = !DILocalVariable(name: "i", scope: !31, file: !16, line: 30, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !33)
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 30, column: 16, scope: !31)
!35 = !DILocalVariable(name: "source", scope: !31, file: !16, line: 31, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 31, column: 17, scope: !31)
!40 = !DILocation(line: 32, column: 17, scope: !31)
!41 = !DILocation(line: 32, column: 9, scope: !31)
!42 = !DILocation(line: 33, column: 9, scope: !31)
!43 = !DILocation(line: 33, column: 23, scope: !31)
!44 = !DILocation(line: 35, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !31, file: !16, line: 35, column: 9)
!46 = !DILocation(line: 35, column: 14, scope: !45)
!47 = !DILocation(line: 35, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !16, line: 35, column: 9)
!49 = !DILocation(line: 35, column: 23, scope: !48)
!50 = !DILocation(line: 35, column: 9, scope: !45)
!51 = !DILocation(line: 37, column: 30, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !16, line: 36, column: 9)
!53 = !DILocation(line: 37, column: 23, scope: !52)
!54 = !DILocation(line: 37, column: 13, scope: !52)
!55 = !DILocation(line: 37, column: 18, scope: !52)
!56 = !DILocation(line: 37, column: 21, scope: !52)
!57 = !DILocation(line: 38, column: 9, scope: !52)
!58 = !DILocation(line: 35, column: 31, scope: !48)
!59 = !DILocation(line: 35, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 38, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 39, column: 9, scope: !31)
!64 = !DILocation(line: 39, column: 21, scope: !31)
!65 = !DILocation(line: 40, column: 20, scope: !31)
!66 = !DILocation(line: 40, column: 9, scope: !31)
!67 = !DILocation(line: 41, column: 14, scope: !31)
!68 = !DILocation(line: 41, column: 9, scope: !31)
!69 = !DILocation(line: 43, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_64b_goodG2BSink", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !70, file: !16, line: 50, type: !19)
!72 = !DILocation(line: 50, column: 86, scope: !70)
!73 = !DILocalVariable(name: "dataPtr", scope: !70, file: !16, line: 53, type: !4)
!74 = !DILocation(line: 53, column: 17, scope: !70)
!75 = !DILocation(line: 53, column: 40, scope: !70)
!76 = !DILocation(line: 53, column: 27, scope: !70)
!77 = !DILocalVariable(name: "data", scope: !70, file: !16, line: 55, type: !5)
!78 = !DILocation(line: 55, column: 15, scope: !70)
!79 = !DILocation(line: 55, column: 24, scope: !70)
!80 = !DILocation(line: 55, column: 23, scope: !70)
!81 = !DILocalVariable(name: "i", scope: !82, file: !16, line: 57, type: !32)
!82 = distinct !DILexicalBlock(scope: !70, file: !16, line: 56, column: 5)
!83 = !DILocation(line: 57, column: 16, scope: !82)
!84 = !DILocalVariable(name: "source", scope: !82, file: !16, line: 58, type: !36)
!85 = !DILocation(line: 58, column: 17, scope: !82)
!86 = !DILocation(line: 59, column: 17, scope: !82)
!87 = !DILocation(line: 59, column: 9, scope: !82)
!88 = !DILocation(line: 60, column: 9, scope: !82)
!89 = !DILocation(line: 60, column: 23, scope: !82)
!90 = !DILocation(line: 62, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !82, file: !16, line: 62, column: 9)
!92 = !DILocation(line: 62, column: 14, scope: !91)
!93 = !DILocation(line: 62, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !16, line: 62, column: 9)
!95 = !DILocation(line: 62, column: 23, scope: !94)
!96 = !DILocation(line: 62, column: 9, scope: !91)
!97 = !DILocation(line: 64, column: 30, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !16, line: 63, column: 9)
!99 = !DILocation(line: 64, column: 23, scope: !98)
!100 = !DILocation(line: 64, column: 13, scope: !98)
!101 = !DILocation(line: 64, column: 18, scope: !98)
!102 = !DILocation(line: 64, column: 21, scope: !98)
!103 = !DILocation(line: 65, column: 9, scope: !98)
!104 = !DILocation(line: 62, column: 31, scope: !94)
!105 = !DILocation(line: 62, column: 9, scope: !94)
!106 = distinct !{!106, !96, !107, !62}
!107 = !DILocation(line: 65, column: 9, scope: !91)
!108 = !DILocation(line: 66, column: 9, scope: !82)
!109 = !DILocation(line: 66, column: 21, scope: !82)
!110 = !DILocation(line: 67, column: 20, scope: !82)
!111 = !DILocation(line: 67, column: 9, scope: !82)
!112 = !DILocation(line: 68, column: 14, scope: !82)
!113 = !DILocation(line: 68, column: 9, scope: !82)
!114 = !DILocation(line: 70, column: 1, scope: !70)
