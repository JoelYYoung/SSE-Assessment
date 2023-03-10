; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_badSink.source to i8*), i64 44, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !34, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !36
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !37
  store i64 %call, i64* %sourceLen, align 8, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !42
  %4 = load i64, i64* %sourceLen, align 8, !dbg !44
  %add = add i64 %4, 1, !dbg !45
  %cmp = icmp ult i64 %3, %add, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !50
  %6 = load i32, i32* %arrayidx, align 4, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %8 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !51
  store i32 %6, i32* %arrayidx1, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %9, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %10), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !63 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !68
  %1 = load i32*, i32** %0, align 8, !dbg !69
  store i32* %1, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !78
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
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !91
  %6 = load i32, i32* %arrayidx, align 4, !dbg !91
  %7 = load i32*, i32** %data, align 8, !dbg !92
  %8 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !92
  store i32 %6, i32* %arrayidx1, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %9, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %10), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!19 = !DILocation(line: 28, column: 94, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!21 = !DILocation(line: 30, column: 15, scope: !9)
!22 = !DILocation(line: 30, column: 23, scope: !9)
!23 = !DILocation(line: 30, column: 22, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 352, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 32, column: 17, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 33, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !32)
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 33, column: 16, scope: !25)
!34 = !DILocalVariable(name: "sourceLen", scope: !25, file: !10, line: 33, type: !31)
!35 = !DILocation(line: 33, column: 19, scope: !25)
!36 = !DILocation(line: 34, column: 28, scope: !25)
!37 = !DILocation(line: 34, column: 21, scope: !25)
!38 = !DILocation(line: 34, column: 19, scope: !25)
!39 = !DILocation(line: 37, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !25, file: !10, line: 37, column: 9)
!41 = !DILocation(line: 37, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 37, column: 9)
!44 = !DILocation(line: 37, column: 25, scope: !43)
!45 = !DILocation(line: 37, column: 35, scope: !43)
!46 = !DILocation(line: 37, column: 23, scope: !43)
!47 = !DILocation(line: 37, column: 9, scope: !40)
!48 = !DILocation(line: 39, column: 30, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !10, line: 38, column: 9)
!50 = !DILocation(line: 39, column: 23, scope: !49)
!51 = !DILocation(line: 39, column: 13, scope: !49)
!52 = !DILocation(line: 39, column: 18, scope: !49)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocation(line: 40, column: 9, scope: !49)
!55 = !DILocation(line: 37, column: 41, scope: !43)
!56 = !DILocation(line: 37, column: 9, scope: !43)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 40, column: 9, scope: !40)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 41, column: 20, scope: !25)
!61 = !DILocation(line: 41, column: 9, scope: !25)
!62 = !DILocation(line: 43, column: 1, scope: !9)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_63b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !63, file: !10, line: 50, type: !13)
!65 = !DILocation(line: 50, column: 98, scope: !63)
!66 = !DILocalVariable(name: "data", scope: !63, file: !10, line: 52, type: !14)
!67 = !DILocation(line: 52, column: 15, scope: !63)
!68 = !DILocation(line: 52, column: 23, scope: !63)
!69 = !DILocation(line: 52, column: 22, scope: !63)
!70 = !DILocalVariable(name: "source", scope: !71, file: !10, line: 54, type: !26)
!71 = distinct !DILexicalBlock(scope: !63, file: !10, line: 53, column: 5)
!72 = !DILocation(line: 54, column: 17, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 55, type: !31)
!74 = !DILocation(line: 55, column: 16, scope: !71)
!75 = !DILocalVariable(name: "sourceLen", scope: !71, file: !10, line: 55, type: !31)
!76 = !DILocation(line: 55, column: 19, scope: !71)
!77 = !DILocation(line: 56, column: 28, scope: !71)
!78 = !DILocation(line: 56, column: 21, scope: !71)
!79 = !DILocation(line: 56, column: 19, scope: !71)
!80 = !DILocation(line: 59, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !10, line: 59, column: 9)
!82 = !DILocation(line: 59, column: 14, scope: !81)
!83 = !DILocation(line: 59, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 59, column: 9)
!85 = !DILocation(line: 59, column: 25, scope: !84)
!86 = !DILocation(line: 59, column: 35, scope: !84)
!87 = !DILocation(line: 59, column: 23, scope: !84)
!88 = !DILocation(line: 59, column: 9, scope: !81)
!89 = !DILocation(line: 61, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !10, line: 60, column: 9)
!91 = !DILocation(line: 61, column: 23, scope: !90)
!92 = !DILocation(line: 61, column: 13, scope: !90)
!93 = !DILocation(line: 61, column: 18, scope: !90)
!94 = !DILocation(line: 61, column: 21, scope: !90)
!95 = !DILocation(line: 62, column: 9, scope: !90)
!96 = !DILocation(line: 59, column: 41, scope: !84)
!97 = !DILocation(line: 59, column: 9, scope: !84)
!98 = distinct !{!98, !88, !99, !59}
!99 = !DILocation(line: 62, column: 9, scope: !81)
!100 = !DILocation(line: 63, column: 20, scope: !71)
!101 = !DILocation(line: 63, column: 9, scope: !71)
!102 = !DILocation(line: 65, column: 1, scope: !63)
