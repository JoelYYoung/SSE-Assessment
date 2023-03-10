; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !23, metadata !DIExpression()), !dbg !28
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !33, metadata !DIExpression()), !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i64 @wcslen(i32* %3) #5, !dbg !36
  store i64 %call, i64* %dataLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !41
  %5 = load i64, i64* %dataLen, align 8, !dbg !43
  %cmp = icmp ult i64 %4, %5, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !46
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !46
  %8 = load i32, i32* %arrayidx1, align 4, !dbg !46
  %9 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !50
  store i32 %8, i32* %arrayidx2, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %10, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  %11 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %11), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b_goodG2BSink(i32** %dataArray) #0 !dbg !63 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !68
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !68
  store i32* %1, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !69, metadata !DIExpression()), !dbg !71
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !71
  call void @llvm.dbg.declare(metadata i64* %i, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !74, metadata !DIExpression()), !dbg !75
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %call = call i64 @wcslen(i32* %3) #5, !dbg !77
  store i64 %call, i64* %dataLen, align 8, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !82
  %5 = load i64, i64* %dataLen, align 8, !dbg !84
  %cmp = icmp ult i64 %4, %5, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !87
  %7 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !87
  %8 = load i32, i32* %arrayidx1, align 4, !dbg !87
  %9 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !91
  store i32 %8, i32* %arrayidx2, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %10, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !98
  store i32 0, i32* %arrayidx3, align 4, !dbg !99
  %11 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %11), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 92, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!21 = !DILocation(line: 26, column: 15, scope: !9)
!22 = !DILocation(line: 26, column: 22, scope: !9)
!23 = !DILocalVariable(name: "dest", scope: !24, file: !10, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 28, column: 17, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !24, file: !10, line: 29, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 29, column: 16, scope: !24)
!33 = !DILocalVariable(name: "dataLen", scope: !24, file: !10, line: 29, type: !30)
!34 = !DILocation(line: 29, column: 19, scope: !24)
!35 = !DILocation(line: 30, column: 26, scope: !24)
!36 = !DILocation(line: 30, column: 19, scope: !24)
!37 = !DILocation(line: 30, column: 17, scope: !24)
!38 = !DILocation(line: 32, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !24, file: !10, line: 32, column: 9)
!40 = !DILocation(line: 32, column: 14, scope: !39)
!41 = !DILocation(line: 32, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 32, column: 9)
!43 = !DILocation(line: 32, column: 25, scope: !42)
!44 = !DILocation(line: 32, column: 23, scope: !42)
!45 = !DILocation(line: 32, column: 9, scope: !39)
!46 = !DILocation(line: 34, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !10, line: 33, column: 9)
!48 = !DILocation(line: 34, column: 28, scope: !47)
!49 = !DILocation(line: 34, column: 18, scope: !47)
!50 = !DILocation(line: 34, column: 13, scope: !47)
!51 = !DILocation(line: 34, column: 21, scope: !47)
!52 = !DILocation(line: 35, column: 9, scope: !47)
!53 = !DILocation(line: 32, column: 35, scope: !42)
!54 = !DILocation(line: 32, column: 9, scope: !42)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 35, column: 9, scope: !39)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 36, column: 9, scope: !24)
!59 = !DILocation(line: 36, column: 20, scope: !24)
!60 = !DILocation(line: 37, column: 20, scope: !24)
!61 = !DILocation(line: 37, column: 9, scope: !24)
!62 = !DILocation(line: 39, column: 1, scope: !9)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_66b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "dataArray", arg: 1, scope: !63, file: !10, line: 46, type: !13)
!65 = !DILocation(line: 46, column: 96, scope: !63)
!66 = !DILocalVariable(name: "data", scope: !63, file: !10, line: 48, type: !14)
!67 = !DILocation(line: 48, column: 15, scope: !63)
!68 = !DILocation(line: 48, column: 22, scope: !63)
!69 = !DILocalVariable(name: "dest", scope: !70, file: !10, line: 50, type: !25)
!70 = distinct !DILexicalBlock(scope: !63, file: !10, line: 49, column: 5)
!71 = !DILocation(line: 50, column: 17, scope: !70)
!72 = !DILocalVariable(name: "i", scope: !70, file: !10, line: 51, type: !30)
!73 = !DILocation(line: 51, column: 16, scope: !70)
!74 = !DILocalVariable(name: "dataLen", scope: !70, file: !10, line: 51, type: !30)
!75 = !DILocation(line: 51, column: 19, scope: !70)
!76 = !DILocation(line: 52, column: 26, scope: !70)
!77 = !DILocation(line: 52, column: 19, scope: !70)
!78 = !DILocation(line: 52, column: 17, scope: !70)
!79 = !DILocation(line: 54, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !10, line: 54, column: 9)
!81 = !DILocation(line: 54, column: 14, scope: !80)
!82 = !DILocation(line: 54, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 54, column: 9)
!84 = !DILocation(line: 54, column: 25, scope: !83)
!85 = !DILocation(line: 54, column: 23, scope: !83)
!86 = !DILocation(line: 54, column: 9, scope: !80)
!87 = !DILocation(line: 56, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !10, line: 55, column: 9)
!89 = !DILocation(line: 56, column: 28, scope: !88)
!90 = !DILocation(line: 56, column: 18, scope: !88)
!91 = !DILocation(line: 56, column: 13, scope: !88)
!92 = !DILocation(line: 56, column: 21, scope: !88)
!93 = !DILocation(line: 57, column: 9, scope: !88)
!94 = !DILocation(line: 54, column: 35, scope: !83)
!95 = !DILocation(line: 54, column: 9, scope: !83)
!96 = distinct !{!96, !86, !97, !57}
!97 = !DILocation(line: 57, column: 9, scope: !80)
!98 = !DILocation(line: 58, column: 9, scope: !70)
!99 = !DILocation(line: 58, column: 20, scope: !70)
!100 = !DILocation(line: 59, column: 20, scope: !70)
!101 = !DILocation(line: 59, column: 9, scope: !70)
!102 = !DILocation(line: 61, column: 1, scope: !63)
