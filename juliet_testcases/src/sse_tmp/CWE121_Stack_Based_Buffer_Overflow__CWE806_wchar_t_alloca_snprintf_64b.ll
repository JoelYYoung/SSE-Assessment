; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
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
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %call = call i64 @wcslen(i32* %5) #6, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* %7), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !44 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !49
  %1 = bitcast i8* %0 to i32**, !dbg !50
  store i32** %1, i32*** %dataPtr, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data, metadata !51, metadata !DIExpression()), !dbg !52
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !53
  %3 = load i32*, i32** %2, align 8, !dbg !54
  store i32* %3, i32** %data, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !57
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !58
  %5 = load i32*, i32** %data, align 8, !dbg !59
  %call = call i64 @wcslen(i32* %5) #6, !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !62
  %7 = load i32*, i32** %data, align 8, !dbg !63
  call void @printWLine(i32* %7), !dbg !64
  ret void, !dbg !65
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b_badSink", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 29, type: !19)
!21 = !DILocation(line: 29, column: 92, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 17, scope: !15)
!24 = !DILocation(line: 32, column: 40, scope: !15)
!25 = !DILocation(line: 32, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 34, type: !5)
!27 = !DILocation(line: 34, column: 15, scope: !15)
!28 = !DILocation(line: 34, column: 24, scope: !15)
!29 = !DILocation(line: 34, column: 23, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 36, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 36, column: 17, scope: !31)
!36 = !DILocation(line: 38, column: 18, scope: !31)
!37 = !DILocation(line: 38, column: 31, scope: !31)
!38 = !DILocation(line: 38, column: 24, scope: !31)
!39 = !DILocation(line: 38, column: 45, scope: !31)
!40 = !DILocation(line: 38, column: 9, scope: !31)
!41 = !DILocation(line: 39, column: 20, scope: !31)
!42 = !DILocation(line: 39, column: 9, scope: !31)
!43 = !DILocation(line: 41, column: 1, scope: !15)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_64b_goodG2BSink", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !44, file: !16, line: 48, type: !19)
!46 = !DILocation(line: 48, column: 96, scope: !44)
!47 = !DILocalVariable(name: "dataPtr", scope: !44, file: !16, line: 51, type: !4)
!48 = !DILocation(line: 51, column: 17, scope: !44)
!49 = !DILocation(line: 51, column: 40, scope: !44)
!50 = !DILocation(line: 51, column: 27, scope: !44)
!51 = !DILocalVariable(name: "data", scope: !44, file: !16, line: 53, type: !5)
!52 = !DILocation(line: 53, column: 15, scope: !44)
!53 = !DILocation(line: 53, column: 24, scope: !44)
!54 = !DILocation(line: 53, column: 23, scope: !44)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !16, line: 55, type: !32)
!56 = distinct !DILexicalBlock(scope: !44, file: !16, line: 54, column: 5)
!57 = !DILocation(line: 55, column: 17, scope: !56)
!58 = !DILocation(line: 57, column: 18, scope: !56)
!59 = !DILocation(line: 57, column: 31, scope: !56)
!60 = !DILocation(line: 57, column: 24, scope: !56)
!61 = !DILocation(line: 57, column: 45, scope: !56)
!62 = !DILocation(line: 57, column: 9, scope: !56)
!63 = !DILocation(line: 58, column: 20, scope: !56)
!64 = !DILocation(line: 58, column: 9, scope: !56)
!65 = !DILocation(line: 60, column: 1, scope: !44)
