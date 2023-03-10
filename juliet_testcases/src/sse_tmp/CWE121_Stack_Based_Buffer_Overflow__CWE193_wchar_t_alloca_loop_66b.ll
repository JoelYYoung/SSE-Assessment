; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_badSink(i32** %dataArray) #0 !dbg !9 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_badSink.source to i8*), i64 44, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !33, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !35
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !36
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
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_goodG2BSink(i32** %dataArray) #0 !dbg !62 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !67
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !67
  store i32* %1, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !68, metadata !DIExpression()), !dbg !70
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !75
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !76
  store i64 %call, i64* %sourceLen, align 8, !dbg !77
  store i64 0, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !81
  %4 = load i64, i64* %sourceLen, align 8, !dbg !83
  %add = add i64 %4, 1, !dbg !84
  %cmp = icmp ult i64 %3, %add, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !89
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !89
  %7 = load i32*, i32** %data, align 8, !dbg !90
  %8 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !90
  store i32 %6, i32* %arrayidx2, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %9, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %10), !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!19 = !DILocation(line: 28, column: 91, scope: !9)
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
!61 = !DILocation(line: 44, column: 1, scope: !9)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_66b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "dataArray", arg: 1, scope: !62, file: !10, line: 51, type: !13)
!64 = !DILocation(line: 51, column: 95, scope: !62)
!65 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 53, type: !14)
!66 = !DILocation(line: 53, column: 15, scope: !62)
!67 = !DILocation(line: 53, column: 22, scope: !62)
!68 = !DILocalVariable(name: "source", scope: !69, file: !10, line: 55, type: !25)
!69 = distinct !DILexicalBlock(scope: !62, file: !10, line: 54, column: 5)
!70 = !DILocation(line: 55, column: 17, scope: !69)
!71 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 56, type: !30)
!72 = !DILocation(line: 56, column: 16, scope: !69)
!73 = !DILocalVariable(name: "sourceLen", scope: !69, file: !10, line: 56, type: !30)
!74 = !DILocation(line: 56, column: 19, scope: !69)
!75 = !DILocation(line: 57, column: 28, scope: !69)
!76 = !DILocation(line: 57, column: 21, scope: !69)
!77 = !DILocation(line: 57, column: 19, scope: !69)
!78 = !DILocation(line: 60, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !69, file: !10, line: 60, column: 9)
!80 = !DILocation(line: 60, column: 14, scope: !79)
!81 = !DILocation(line: 60, column: 21, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !10, line: 60, column: 9)
!83 = !DILocation(line: 60, column: 25, scope: !82)
!84 = !DILocation(line: 60, column: 35, scope: !82)
!85 = !DILocation(line: 60, column: 23, scope: !82)
!86 = !DILocation(line: 60, column: 9, scope: !79)
!87 = !DILocation(line: 62, column: 30, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !10, line: 61, column: 9)
!89 = !DILocation(line: 62, column: 23, scope: !88)
!90 = !DILocation(line: 62, column: 13, scope: !88)
!91 = !DILocation(line: 62, column: 18, scope: !88)
!92 = !DILocation(line: 62, column: 21, scope: !88)
!93 = !DILocation(line: 63, column: 9, scope: !88)
!94 = !DILocation(line: 60, column: 41, scope: !82)
!95 = !DILocation(line: 60, column: 9, scope: !82)
!96 = distinct !{!96, !86, !97, !58}
!97 = !DILocation(line: 63, column: 9, scope: !79)
!98 = !DILocation(line: 64, column: 20, scope: !69)
!99 = !DILocation(line: 64, column: 9, scope: !69)
!100 = !DILocation(line: 66, column: 1, scope: !62)
