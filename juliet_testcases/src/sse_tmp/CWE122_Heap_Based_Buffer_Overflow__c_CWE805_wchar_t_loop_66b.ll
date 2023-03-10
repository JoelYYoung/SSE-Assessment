; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !34
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx1, align 4, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %2, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !46
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %6 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !47
  store i32 %4, i32* %arrayidx3, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %7, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %9 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %9), !dbg !59
  %10 = load i32*, i32** %data, align 8, !dbg !60
  %11 = bitcast i32* %10 to i8*, !dbg !60
  call void @free(i8* %11) #4, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b_goodG2BSink(i32** %dataArray) #0 !dbg !63 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !68
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !68
  store i32* %1, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !74
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !75
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx1, align 4, !dbg !77
  store i64 0, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !81
  %cmp = icmp ult i64 %2, 100, !dbg !83
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !87
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !87
  %5 = load i32*, i32** %data, align 8, !dbg !88
  %6 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !88
  store i32 %4, i32* %arrayidx3, align 4, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %7, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !96
  store i32 0, i32* %arrayidx4, align 4, !dbg !97
  %9 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %9), !dbg !99
  %10 = load i32*, i32** %data, align 8, !dbg !100
  %11 = bitcast i32* %10 to i8*, !dbg !100
  call void @free(i8* %11) #4, !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 85, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!21 = !DILocation(line: 26, column: 15, scope: !9)
!22 = !DILocation(line: 26, column: 22, scope: !9)
!23 = !DILocalVariable(name: "i", scope: !24, file: !10, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !26)
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 28, column: 16, scope: !24)
!28 = !DILocalVariable(name: "source", scope: !24, file: !10, line: 29, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 29, column: 17, scope: !24)
!33 = !DILocation(line: 30, column: 17, scope: !24)
!34 = !DILocation(line: 30, column: 9, scope: !24)
!35 = !DILocation(line: 31, column: 9, scope: !24)
!36 = !DILocation(line: 31, column: 23, scope: !24)
!37 = !DILocation(line: 33, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !10, line: 33, column: 9)
!39 = !DILocation(line: 33, column: 14, scope: !38)
!40 = !DILocation(line: 33, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 33, column: 9)
!42 = !DILocation(line: 33, column: 23, scope: !41)
!43 = !DILocation(line: 33, column: 9, scope: !38)
!44 = !DILocation(line: 35, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !10, line: 34, column: 9)
!46 = !DILocation(line: 35, column: 23, scope: !45)
!47 = !DILocation(line: 35, column: 13, scope: !45)
!48 = !DILocation(line: 35, column: 18, scope: !45)
!49 = !DILocation(line: 35, column: 21, scope: !45)
!50 = !DILocation(line: 36, column: 9, scope: !45)
!51 = !DILocation(line: 33, column: 31, scope: !41)
!52 = !DILocation(line: 33, column: 9, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 36, column: 9, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 37, column: 9, scope: !24)
!57 = !DILocation(line: 37, column: 21, scope: !24)
!58 = !DILocation(line: 38, column: 20, scope: !24)
!59 = !DILocation(line: 38, column: 9, scope: !24)
!60 = !DILocation(line: 39, column: 14, scope: !24)
!61 = !DILocation(line: 39, column: 9, scope: !24)
!62 = !DILocation(line: 41, column: 1, scope: !9)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_66b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "dataArray", arg: 1, scope: !63, file: !10, line: 48, type: !13)
!65 = !DILocation(line: 48, column: 89, scope: !63)
!66 = !DILocalVariable(name: "data", scope: !63, file: !10, line: 50, type: !14)
!67 = !DILocation(line: 50, column: 15, scope: !63)
!68 = !DILocation(line: 50, column: 22, scope: !63)
!69 = !DILocalVariable(name: "i", scope: !70, file: !10, line: 52, type: !25)
!70 = distinct !DILexicalBlock(scope: !63, file: !10, line: 51, column: 5)
!71 = !DILocation(line: 52, column: 16, scope: !70)
!72 = !DILocalVariable(name: "source", scope: !70, file: !10, line: 53, type: !29)
!73 = !DILocation(line: 53, column: 17, scope: !70)
!74 = !DILocation(line: 54, column: 17, scope: !70)
!75 = !DILocation(line: 54, column: 9, scope: !70)
!76 = !DILocation(line: 55, column: 9, scope: !70)
!77 = !DILocation(line: 55, column: 23, scope: !70)
!78 = !DILocation(line: 57, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !70, file: !10, line: 57, column: 9)
!80 = !DILocation(line: 57, column: 14, scope: !79)
!81 = !DILocation(line: 57, column: 21, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !10, line: 57, column: 9)
!83 = !DILocation(line: 57, column: 23, scope: !82)
!84 = !DILocation(line: 57, column: 9, scope: !79)
!85 = !DILocation(line: 59, column: 30, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !10, line: 58, column: 9)
!87 = !DILocation(line: 59, column: 23, scope: !86)
!88 = !DILocation(line: 59, column: 13, scope: !86)
!89 = !DILocation(line: 59, column: 18, scope: !86)
!90 = !DILocation(line: 59, column: 21, scope: !86)
!91 = !DILocation(line: 60, column: 9, scope: !86)
!92 = !DILocation(line: 57, column: 31, scope: !82)
!93 = !DILocation(line: 57, column: 9, scope: !82)
!94 = distinct !{!94, !84, !95, !55}
!95 = !DILocation(line: 60, column: 9, scope: !79)
!96 = !DILocation(line: 61, column: 9, scope: !70)
!97 = !DILocation(line: 61, column: 21, scope: !70)
!98 = !DILocation(line: 62, column: 20, scope: !70)
!99 = !DILocation(line: 62, column: 9, scope: !70)
!100 = !DILocation(line: 63, column: 14, scope: !70)
!101 = !DILocation(line: 63, column: 9, scope: !70)
!102 = !DILocation(line: 65, column: 1, scope: !63)
