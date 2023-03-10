; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_badSink.source to i8*), i64 44, i1 false), !dbg !28
  %3 = load i32*, i32** %data, align 8, !dbg !29
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !30
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay) #5, !dbg !31
  %4 = load i32*, i32** %data, align 8, !dbg !32
  call void @printWLine(i32* %4), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_goodG2BSink(i32** %dataArray) #0 !dbg !35 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !40
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !40
  store i32* %1, i32** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay) #5, !dbg !46
  %4 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %4), !dbg !48
  ret void, !dbg !49
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 35, column: 16, scope: !24)
!30 = !DILocation(line: 35, column: 22, scope: !24)
!31 = !DILocation(line: 35, column: 9, scope: !24)
!32 = !DILocation(line: 36, column: 20, scope: !24)
!33 = !DILocation(line: 36, column: 9, scope: !24)
!34 = !DILocation(line: 38, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_66b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "dataArray", arg: 1, scope: !35, file: !10, line: 45, type: !13)
!37 = !DILocation(line: 45, column: 95, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 47, type: !14)
!39 = !DILocation(line: 47, column: 15, scope: !35)
!40 = !DILocation(line: 47, column: 22, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !10, line: 49, type: !25)
!42 = distinct !DILexicalBlock(scope: !35, file: !10, line: 48, column: 5)
!43 = !DILocation(line: 49, column: 17, scope: !42)
!44 = !DILocation(line: 51, column: 16, scope: !42)
!45 = !DILocation(line: 51, column: 22, scope: !42)
!46 = !DILocation(line: 51, column: 9, scope: !42)
!47 = !DILocation(line: 52, column: 20, scope: !42)
!48 = !DILocation(line: 52, column: 9, scope: !42)
!49 = !DILocation(line: 54, column: 1, scope: !35)
