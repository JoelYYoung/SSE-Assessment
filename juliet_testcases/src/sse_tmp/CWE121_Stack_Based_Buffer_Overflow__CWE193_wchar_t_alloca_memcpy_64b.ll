; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
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
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_badSink.source to i8*), i64 44, i1 false), !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %6 = bitcast i32* %5 to i8*, !dbg !37
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !37
  %7 = bitcast i32* %arraydecay to i8*, !dbg !37
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !38
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !39
  %add = add i64 %call, 1, !dbg !40
  %mul = mul i64 %add, 4, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 %mul, i1 false), !dbg !37
  %8 = load i32*, i32** %data, align 8, !dbg !42
  call void @printWLine(i32* %8), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !45 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !50
  %1 = bitcast i8* %0 to i32**, !dbg !51
  store i32** %1, i32*** %dataPtr, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32** %data, metadata !52, metadata !DIExpression()), !dbg !53
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !54
  %3 = load i32*, i32** %2, align 8, !dbg !55
  store i32* %3, i32** %data, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !58
  %5 = load i32*, i32** %data, align 8, !dbg !59
  %6 = bitcast i32* %5 to i8*, !dbg !60
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %7 = bitcast i32* %arraydecay to i8*, !dbg !60
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !61
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !62
  %add = add i64 %call, 1, !dbg !63
  %mul = mul i64 %add, 4, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 %mul, i1 false), !dbg !60
  %8 = load i32*, i32** %data, align 8, !dbg !65
  call void @printWLine(i32* %8), !dbg !66
  ret void, !dbg !67
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_badSink", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 28, type: !19)
!21 = !DILocation(line: 28, column: 90, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 31, type: !4)
!23 = !DILocation(line: 31, column: 17, scope: !15)
!24 = !DILocation(line: 31, column: 40, scope: !15)
!25 = !DILocation(line: 31, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !5)
!27 = !DILocation(line: 33, column: 15, scope: !15)
!28 = !DILocation(line: 33, column: 24, scope: !15)
!29 = !DILocation(line: 33, column: 23, scope: !15)
!30 = !DILocalVariable(name: "source", scope: !31, file: !16, line: 35, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 35, column: 17, scope: !31)
!36 = !DILocation(line: 38, column: 16, scope: !31)
!37 = !DILocation(line: 38, column: 9, scope: !31)
!38 = !DILocation(line: 38, column: 38, scope: !31)
!39 = !DILocation(line: 38, column: 31, scope: !31)
!40 = !DILocation(line: 38, column: 46, scope: !31)
!41 = !DILocation(line: 38, column: 51, scope: !31)
!42 = !DILocation(line: 39, column: 20, scope: !31)
!43 = !DILocation(line: 39, column: 9, scope: !31)
!44 = !DILocation(line: 41, column: 1, scope: !15)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_64b_goodG2BSink", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !45, file: !16, line: 48, type: !19)
!47 = !DILocation(line: 48, column: 94, scope: !45)
!48 = !DILocalVariable(name: "dataPtr", scope: !45, file: !16, line: 51, type: !4)
!49 = !DILocation(line: 51, column: 17, scope: !45)
!50 = !DILocation(line: 51, column: 40, scope: !45)
!51 = !DILocation(line: 51, column: 27, scope: !45)
!52 = !DILocalVariable(name: "data", scope: !45, file: !16, line: 53, type: !5)
!53 = !DILocation(line: 53, column: 15, scope: !45)
!54 = !DILocation(line: 53, column: 24, scope: !45)
!55 = !DILocation(line: 53, column: 23, scope: !45)
!56 = !DILocalVariable(name: "source", scope: !57, file: !16, line: 55, type: !32)
!57 = distinct !DILexicalBlock(scope: !45, file: !16, line: 54, column: 5)
!58 = !DILocation(line: 55, column: 17, scope: !57)
!59 = !DILocation(line: 58, column: 16, scope: !57)
!60 = !DILocation(line: 58, column: 9, scope: !57)
!61 = !DILocation(line: 58, column: 38, scope: !57)
!62 = !DILocation(line: 58, column: 31, scope: !57)
!63 = !DILocation(line: 58, column: 46, scope: !57)
!64 = !DILocation(line: 58, column: 51, scope: !57)
!65 = !DILocation(line: 59, column: 20, scope: !57)
!66 = !DILocation(line: 59, column: 9, scope: !57)
!67 = !DILocation(line: 61, column: 1, scope: !45)
