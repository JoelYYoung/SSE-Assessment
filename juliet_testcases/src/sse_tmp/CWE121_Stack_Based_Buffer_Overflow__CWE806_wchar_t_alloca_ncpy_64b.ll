; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
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
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i64 @wcslen(i32* %6) #6, !dbg !39
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %5, i64 %call) #7, !dbg !40
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !46 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !51
  %1 = bitcast i8* %0 to i32**, !dbg !52
  store i32** %1, i32*** %dataPtr, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data, metadata !53, metadata !DIExpression()), !dbg !54
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !55
  %3 = load i32*, i32** %2, align 8, !dbg !56
  store i32* %3, i32** %data, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !59
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !59
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !60
  %5 = load i32*, i32** %data, align 8, !dbg !61
  %6 = load i32*, i32** %data, align 8, !dbg !62
  %call = call i64 @wcslen(i32* %6) #6, !dbg !63
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %5, i64 %call) #7, !dbg !64
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  %7 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %7), !dbg !68
  ret void, !dbg !69
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 23, type: !19)
!21 = !DILocation(line: 23, column: 88, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 17, scope: !15)
!24 = !DILocation(line: 26, column: 40, scope: !15)
!25 = !DILocation(line: 26, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !5)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 24, scope: !15)
!29 = !DILocation(line: 28, column: 23, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 30, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 30, column: 17, scope: !31)
!36 = !DILocation(line: 32, column: 17, scope: !31)
!37 = !DILocation(line: 32, column: 23, scope: !31)
!38 = !DILocation(line: 32, column: 36, scope: !31)
!39 = !DILocation(line: 32, column: 29, scope: !31)
!40 = !DILocation(line: 32, column: 9, scope: !31)
!41 = !DILocation(line: 33, column: 9, scope: !31)
!42 = !DILocation(line: 33, column: 20, scope: !31)
!43 = !DILocation(line: 34, column: 20, scope: !31)
!44 = !DILocation(line: 34, column: 9, scope: !31)
!45 = !DILocation(line: 36, column: 1, scope: !15)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_64b_goodG2BSink", scope: !16, file: !16, line: 43, type: !17, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !46, file: !16, line: 43, type: !19)
!48 = !DILocation(line: 43, column: 92, scope: !46)
!49 = !DILocalVariable(name: "dataPtr", scope: !46, file: !16, line: 46, type: !4)
!50 = !DILocation(line: 46, column: 17, scope: !46)
!51 = !DILocation(line: 46, column: 40, scope: !46)
!52 = !DILocation(line: 46, column: 27, scope: !46)
!53 = !DILocalVariable(name: "data", scope: !46, file: !16, line: 48, type: !5)
!54 = !DILocation(line: 48, column: 15, scope: !46)
!55 = !DILocation(line: 48, column: 24, scope: !46)
!56 = !DILocation(line: 48, column: 23, scope: !46)
!57 = !DILocalVariable(name: "dest", scope: !58, file: !16, line: 50, type: !32)
!58 = distinct !DILexicalBlock(scope: !46, file: !16, line: 49, column: 5)
!59 = !DILocation(line: 50, column: 17, scope: !58)
!60 = !DILocation(line: 52, column: 17, scope: !58)
!61 = !DILocation(line: 52, column: 23, scope: !58)
!62 = !DILocation(line: 52, column: 36, scope: !58)
!63 = !DILocation(line: 52, column: 29, scope: !58)
!64 = !DILocation(line: 52, column: 9, scope: !58)
!65 = !DILocation(line: 53, column: 9, scope: !58)
!66 = !DILocation(line: 53, column: 20, scope: !58)
!67 = !DILocation(line: 54, column: 20, scope: !58)
!68 = !DILocation(line: 54, column: 9, scope: !58)
!69 = !DILocation(line: 56, column: 1, scope: !46)
