; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i64 @wcslen(i32* %3) #5, !dbg !37
  store i64 %call, i64* %dataLen, align 8, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !42
  %5 = load i64, i64* %dataLen, align 8, !dbg !44
  %cmp = icmp ult i64 %4, %5, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %7 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !47
  %8 = load i32, i32* %arrayidx, align 4, !dbg !47
  %9 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !51
  store i32 %8, i32* %arrayidx1, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %10, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !59
  store i32 0, i32* %arrayidx2, align 4, !dbg !60
  %11 = load i32*, i32** %data, align 8, !dbg !61
  call void @printWLine(i32* %11), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !64 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !69
  %1 = load i32*, i32** %0, align 8, !dbg !70
  store i32* %1, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !73
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %i, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !76, metadata !DIExpression()), !dbg !77
  %3 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i64 @wcslen(i32* %3) #5, !dbg !79
  store i64 %call, i64* %dataLen, align 8, !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !84
  %5 = load i64, i64* %dataLen, align 8, !dbg !86
  %cmp = icmp ult i64 %4, %5, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !89
  %7 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !89
  %8 = load i32, i32* %arrayidx, align 4, !dbg !89
  %9 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !93
  store i32 %8, i32* %arrayidx1, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %10, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !100
  store i32 0, i32* %arrayidx2, align 4, !dbg !101
  %11 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %11), !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 93, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!21 = !DILocation(line: 25, column: 15, scope: !9)
!22 = !DILocation(line: 25, column: 23, scope: !9)
!23 = !DILocation(line: 25, column: 22, scope: !9)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 27, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 27, column: 17, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 28, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !32)
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 28, column: 16, scope: !25)
!34 = !DILocalVariable(name: "dataLen", scope: !25, file: !10, line: 28, type: !31)
!35 = !DILocation(line: 28, column: 19, scope: !25)
!36 = !DILocation(line: 29, column: 26, scope: !25)
!37 = !DILocation(line: 29, column: 19, scope: !25)
!38 = !DILocation(line: 29, column: 17, scope: !25)
!39 = !DILocation(line: 31, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !25, file: !10, line: 31, column: 9)
!41 = !DILocation(line: 31, column: 14, scope: !40)
!42 = !DILocation(line: 31, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 31, column: 9)
!44 = !DILocation(line: 31, column: 25, scope: !43)
!45 = !DILocation(line: 31, column: 23, scope: !43)
!46 = !DILocation(line: 31, column: 9, scope: !40)
!47 = !DILocation(line: 33, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !10, line: 32, column: 9)
!49 = !DILocation(line: 33, column: 28, scope: !48)
!50 = !DILocation(line: 33, column: 18, scope: !48)
!51 = !DILocation(line: 33, column: 13, scope: !48)
!52 = !DILocation(line: 33, column: 21, scope: !48)
!53 = !DILocation(line: 34, column: 9, scope: !48)
!54 = !DILocation(line: 31, column: 35, scope: !43)
!55 = !DILocation(line: 31, column: 9, scope: !43)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 34, column: 9, scope: !40)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 35, column: 9, scope: !25)
!60 = !DILocation(line: 35, column: 20, scope: !25)
!61 = !DILocation(line: 36, column: 20, scope: !25)
!62 = !DILocation(line: 36, column: 9, scope: !25)
!63 = !DILocation(line: 38, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_63b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !64, file: !10, line: 45, type: !13)
!66 = !DILocation(line: 45, column: 97, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 47, type: !14)
!68 = !DILocation(line: 47, column: 15, scope: !64)
!69 = !DILocation(line: 47, column: 23, scope: !64)
!70 = !DILocation(line: 47, column: 22, scope: !64)
!71 = !DILocalVariable(name: "dest", scope: !72, file: !10, line: 49, type: !26)
!72 = distinct !DILexicalBlock(scope: !64, file: !10, line: 48, column: 5)
!73 = !DILocation(line: 49, column: 17, scope: !72)
!74 = !DILocalVariable(name: "i", scope: !72, file: !10, line: 50, type: !31)
!75 = !DILocation(line: 50, column: 16, scope: !72)
!76 = !DILocalVariable(name: "dataLen", scope: !72, file: !10, line: 50, type: !31)
!77 = !DILocation(line: 50, column: 19, scope: !72)
!78 = !DILocation(line: 51, column: 26, scope: !72)
!79 = !DILocation(line: 51, column: 19, scope: !72)
!80 = !DILocation(line: 51, column: 17, scope: !72)
!81 = !DILocation(line: 53, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !10, line: 53, column: 9)
!83 = !DILocation(line: 53, column: 14, scope: !82)
!84 = !DILocation(line: 53, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 53, column: 9)
!86 = !DILocation(line: 53, column: 25, scope: !85)
!87 = !DILocation(line: 53, column: 23, scope: !85)
!88 = !DILocation(line: 53, column: 9, scope: !82)
!89 = !DILocation(line: 55, column: 23, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !10, line: 54, column: 9)
!91 = !DILocation(line: 55, column: 28, scope: !90)
!92 = !DILocation(line: 55, column: 18, scope: !90)
!93 = !DILocation(line: 55, column: 13, scope: !90)
!94 = !DILocation(line: 55, column: 21, scope: !90)
!95 = !DILocation(line: 56, column: 9, scope: !90)
!96 = !DILocation(line: 53, column: 35, scope: !85)
!97 = !DILocation(line: 53, column: 9, scope: !85)
!98 = distinct !{!98, !88, !99, !58}
!99 = !DILocation(line: 56, column: 9, scope: !82)
!100 = !DILocation(line: 57, column: 9, scope: !72)
!101 = !DILocation(line: 57, column: 20, scope: !72)
!102 = !DILocation(line: 58, column: 20, scope: !72)
!103 = !DILocation(line: 58, column: 9, scope: !72)
!104 = !DILocation(line: 60, column: 1, scope: !64)
