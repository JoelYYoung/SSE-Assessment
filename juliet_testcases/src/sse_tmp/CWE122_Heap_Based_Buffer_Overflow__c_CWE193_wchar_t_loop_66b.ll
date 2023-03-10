; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_badSink.source to i8*), i64 44, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !33, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !35
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !36
  store i64 %call, i64* %sourceLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !41
  %4 = load i64, i64* %sourceLen, align 8, !dbg !43
  %add = add i64 %4, 1, !dbg !44
  %cmp = icmp ult i64 %3, %add, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !49
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !49
  %7 = load i32*, i32** %data, align 8, !dbg !50
  %8 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !50
  store i32 %6, i32* %arrayidx2, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %9, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %10), !dbg !60
  %11 = load i32*, i32** %data, align 8, !dbg !61
  %12 = bitcast i32* %11 to i8*, !dbg !61
  call void @free(i8* %12) #7, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_goodG2BSink(i32** %dataArray) #0 !dbg !64 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !69
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !69
  store i32* %1, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !78
  store i64 %call, i64* %sourceLen, align 8, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !83
  %4 = load i64, i64* %sourceLen, align 8, !dbg !85
  %add = add i64 %4, 1, !dbg !86
  %cmp = icmp ult i64 %3, %add, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !91
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !91
  %7 = load i32*, i32** %data, align 8, !dbg !92
  %8 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !92
  store i32 %6, i32* %arrayidx2, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %9, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %10), !dbg !101
  %11 = load i32*, i32** %data, align 8, !dbg !102
  %12 = bitcast i32* %11 to i8*, !dbg !102
  call void @free(i8* %12) #7, !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!19 = !DILocation(line: 28, column: 85, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 31, type: !14)
!21 = !DILocation(line: 31, column: 15, scope: !9)
!22 = !DILocation(line: 31, column: 22, scope: !9)
!23 = !DILocalVariable(name: "source", scope: !24, file: !10, line: 33, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 352, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 33, column: 17, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !24, file: !10, line: 34, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 34, column: 16, scope: !24)
!33 = !DILocalVariable(name: "sourceLen", scope: !24, file: !10, line: 34, type: !30)
!34 = !DILocation(line: 34, column: 19, scope: !24)
!35 = !DILocation(line: 35, column: 28, scope: !24)
!36 = !DILocation(line: 35, column: 21, scope: !24)
!37 = !DILocation(line: 35, column: 19, scope: !24)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !24, file: !10, line: 38, column: 9)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 38, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 38, column: 9)
!43 = !DILocation(line: 38, column: 25, scope: !42)
!44 = !DILocation(line: 38, column: 35, scope: !42)
!45 = !DILocation(line: 38, column: 23, scope: !42)
!46 = !DILocation(line: 38, column: 9, scope: !39)
!47 = !DILocation(line: 40, column: 30, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !10, line: 39, column: 9)
!49 = !DILocation(line: 40, column: 23, scope: !48)
!50 = !DILocation(line: 40, column: 13, scope: !48)
!51 = !DILocation(line: 40, column: 18, scope: !48)
!52 = !DILocation(line: 40, column: 21, scope: !48)
!53 = !DILocation(line: 41, column: 9, scope: !48)
!54 = !DILocation(line: 38, column: 41, scope: !42)
!55 = !DILocation(line: 38, column: 9, scope: !42)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 41, column: 9, scope: !39)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 42, column: 20, scope: !24)
!60 = !DILocation(line: 42, column: 9, scope: !24)
!61 = !DILocation(line: 43, column: 14, scope: !24)
!62 = !DILocation(line: 43, column: 9, scope: !24)
!63 = !DILocation(line: 45, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_66b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "dataArray", arg: 1, scope: !64, file: !10, line: 52, type: !13)
!66 = !DILocation(line: 52, column: 89, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 54, type: !14)
!68 = !DILocation(line: 54, column: 15, scope: !64)
!69 = !DILocation(line: 54, column: 22, scope: !64)
!70 = !DILocalVariable(name: "source", scope: !71, file: !10, line: 56, type: !25)
!71 = distinct !DILexicalBlock(scope: !64, file: !10, line: 55, column: 5)
!72 = !DILocation(line: 56, column: 17, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 57, type: !30)
!74 = !DILocation(line: 57, column: 16, scope: !71)
!75 = !DILocalVariable(name: "sourceLen", scope: !71, file: !10, line: 57, type: !30)
!76 = !DILocation(line: 57, column: 19, scope: !71)
!77 = !DILocation(line: 58, column: 28, scope: !71)
!78 = !DILocation(line: 58, column: 21, scope: !71)
!79 = !DILocation(line: 58, column: 19, scope: !71)
!80 = !DILocation(line: 61, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !10, line: 61, column: 9)
!82 = !DILocation(line: 61, column: 14, scope: !81)
!83 = !DILocation(line: 61, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 61, column: 9)
!85 = !DILocation(line: 61, column: 25, scope: !84)
!86 = !DILocation(line: 61, column: 35, scope: !84)
!87 = !DILocation(line: 61, column: 23, scope: !84)
!88 = !DILocation(line: 61, column: 9, scope: !81)
!89 = !DILocation(line: 63, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !10, line: 62, column: 9)
!91 = !DILocation(line: 63, column: 23, scope: !90)
!92 = !DILocation(line: 63, column: 13, scope: !90)
!93 = !DILocation(line: 63, column: 18, scope: !90)
!94 = !DILocation(line: 63, column: 21, scope: !90)
!95 = !DILocation(line: 64, column: 9, scope: !90)
!96 = !DILocation(line: 61, column: 41, scope: !84)
!97 = !DILocation(line: 61, column: 9, scope: !84)
!98 = distinct !{!98, !88, !99, !58}
!99 = !DILocation(line: 64, column: 9, scope: !81)
!100 = !DILocation(line: 65, column: 20, scope: !71)
!101 = !DILocation(line: 65, column: 9, scope: !71)
!102 = !DILocation(line: 66, column: 14, scope: !71)
!103 = !DILocation(line: 66, column: 9, scope: !71)
!104 = !DILocation(line: 68, column: 1, scope: !64)
