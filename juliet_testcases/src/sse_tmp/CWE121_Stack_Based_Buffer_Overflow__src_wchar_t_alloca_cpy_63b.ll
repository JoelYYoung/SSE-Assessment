; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !30
  %3 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %3) #5, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  call void @printWLine(i32* %4), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !36 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !41
  %1 = load i32*, i32** %0, align 8, !dbg !42
  store i32* %1, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !45
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %3) #5, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %4), !dbg !50
  ret void, !dbg !51
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 89, scope: !9)
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
!30 = !DILocation(line: 29, column: 16, scope: !25)
!31 = !DILocation(line: 29, column: 22, scope: !25)
!32 = !DILocation(line: 29, column: 9, scope: !25)
!33 = !DILocation(line: 30, column: 20, scope: !25)
!34 = !DILocation(line: 30, column: 9, scope: !25)
!35 = !DILocation(line: 32, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_63b_goodG2BSink", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !36, file: !10, line: 39, type: !13)
!38 = !DILocation(line: 39, column: 93, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !10, line: 41, type: !14)
!40 = !DILocation(line: 41, column: 15, scope: !36)
!41 = !DILocation(line: 41, column: 23, scope: !36)
!42 = !DILocation(line: 41, column: 22, scope: !36)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !10, line: 43, type: !26)
!44 = distinct !DILexicalBlock(scope: !36, file: !10, line: 42, column: 5)
!45 = !DILocation(line: 43, column: 17, scope: !44)
!46 = !DILocation(line: 45, column: 16, scope: !44)
!47 = !DILocation(line: 45, column: 22, scope: !44)
!48 = !DILocation(line: 45, column: 9, scope: !44)
!49 = !DILocation(line: 46, column: 20, scope: !44)
!50 = !DILocation(line: 46, column: 9, scope: !44)
!51 = !DILocation(line: 48, column: 1, scope: !36)
