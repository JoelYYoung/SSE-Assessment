; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_badSink.source to i8*), i64 44, i1 false), !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %4 = bitcast i32* %3 to i8*, !dbg !31
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !31
  %5 = bitcast i32* %arraydecay to i8*, !dbg !31
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !32
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !33
  %add = add i64 %call, 1, !dbg !34
  %mul = mul i64 %add, 4, !dbg !35
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !31
  %6 = load i32*, i32** %data, align 8, !dbg !36
  call void @printWLine(i32* %6), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !39 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !44
  %1 = load i32*, i32** %0, align 8, !dbg !45
  store i32* %1, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  %4 = bitcast i32* %3 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %5 = bitcast i32* %arraydecay to i8*, !dbg !50
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !52
  %add = add i64 %call, 1, !dbg !53
  %mul = mul i64 %add, 4, !dbg !54
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %6), !dbg !56
  ret void, !dbg !57
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!19 = !DILocation(line: 28, column: 96, scope: !9)
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
!30 = !DILocation(line: 35, column: 17, scope: !25)
!31 = !DILocation(line: 35, column: 9, scope: !25)
!32 = !DILocation(line: 35, column: 39, scope: !25)
!33 = !DILocation(line: 35, column: 32, scope: !25)
!34 = !DILocation(line: 35, column: 47, scope: !25)
!35 = !DILocation(line: 35, column: 52, scope: !25)
!36 = !DILocation(line: 36, column: 20, scope: !25)
!37 = !DILocation(line: 36, column: 9, scope: !25)
!38 = !DILocation(line: 38, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_63b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !39, file: !10, line: 45, type: !13)
!41 = !DILocation(line: 45, column: 100, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !10, line: 47, type: !14)
!43 = !DILocation(line: 47, column: 15, scope: !39)
!44 = !DILocation(line: 47, column: 23, scope: !39)
!45 = !DILocation(line: 47, column: 22, scope: !39)
!46 = !DILocalVariable(name: "source", scope: !47, file: !10, line: 49, type: !26)
!47 = distinct !DILexicalBlock(scope: !39, file: !10, line: 48, column: 5)
!48 = !DILocation(line: 49, column: 17, scope: !47)
!49 = !DILocation(line: 52, column: 17, scope: !47)
!50 = !DILocation(line: 52, column: 9, scope: !47)
!51 = !DILocation(line: 52, column: 39, scope: !47)
!52 = !DILocation(line: 52, column: 32, scope: !47)
!53 = !DILocation(line: 52, column: 47, scope: !47)
!54 = !DILocation(line: 52, column: 52, scope: !47)
!55 = !DILocation(line: 53, column: 20, scope: !47)
!56 = !DILocation(line: 53, column: 9, scope: !47)
!57 = !DILocation(line: 55, column: 1, scope: !39)
