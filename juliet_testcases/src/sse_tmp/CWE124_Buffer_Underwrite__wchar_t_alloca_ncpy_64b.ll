; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !37
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call2 = call i32* @wcsncpy(i32* %4, i32* %arraydecay1, i64 99) #4, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %6), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !48 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !53
  %1 = bitcast i8* %0 to i32**, !dbg !54
  store i32** %1, i32*** %dataPtr, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i32** %data, metadata !55, metadata !DIExpression()), !dbg !56
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !57
  %3 = load i32*, i32** %2, align 8, !dbg !58
  store i32* %3, i32** %data, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !59, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !62
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !63
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  %4 = load i32*, i32** %data, align 8, !dbg !66
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !67
  %call2 = call i32* @wcsncpy(i32* %4, i32* %arraydecay1, i64 99) #4, !dbg !68
  %5 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !69
  store i32 0, i32* %arrayidx3, align 4, !dbg !70
  %6 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %6), !dbg !72
  ret void, !dbg !73
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 23, type: !19)
!21 = !DILocation(line: 23, column: 71, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 17, scope: !15)
!24 = !DILocation(line: 26, column: 40, scope: !15)
!25 = !DILocation(line: 26, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !5)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 24, scope: !15)
!29 = !DILocation(line: 28, column: 23, scope: !15)
!30 = !DILocalVariable(name: "source", scope: !31, file: !16, line: 30, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 30, column: 17, scope: !31)
!36 = !DILocation(line: 31, column: 17, scope: !31)
!37 = !DILocation(line: 31, column: 9, scope: !31)
!38 = !DILocation(line: 32, column: 9, scope: !31)
!39 = !DILocation(line: 32, column: 23, scope: !31)
!40 = !DILocation(line: 34, column: 17, scope: !31)
!41 = !DILocation(line: 34, column: 23, scope: !31)
!42 = !DILocation(line: 34, column: 9, scope: !31)
!43 = !DILocation(line: 36, column: 9, scope: !31)
!44 = !DILocation(line: 36, column: 21, scope: !31)
!45 = !DILocation(line: 37, column: 20, scope: !31)
!46 = !DILocation(line: 37, column: 9, scope: !31)
!47 = !DILocation(line: 39, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_64b_goodG2BSink", scope: !16, file: !16, line: 46, type: !17, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !48, file: !16, line: 46, type: !19)
!50 = !DILocation(line: 46, column: 75, scope: !48)
!51 = !DILocalVariable(name: "dataPtr", scope: !48, file: !16, line: 49, type: !4)
!52 = !DILocation(line: 49, column: 17, scope: !48)
!53 = !DILocation(line: 49, column: 40, scope: !48)
!54 = !DILocation(line: 49, column: 27, scope: !48)
!55 = !DILocalVariable(name: "data", scope: !48, file: !16, line: 51, type: !5)
!56 = !DILocation(line: 51, column: 15, scope: !48)
!57 = !DILocation(line: 51, column: 24, scope: !48)
!58 = !DILocation(line: 51, column: 23, scope: !48)
!59 = !DILocalVariable(name: "source", scope: !60, file: !16, line: 53, type: !32)
!60 = distinct !DILexicalBlock(scope: !48, file: !16, line: 52, column: 5)
!61 = !DILocation(line: 53, column: 17, scope: !60)
!62 = !DILocation(line: 54, column: 17, scope: !60)
!63 = !DILocation(line: 54, column: 9, scope: !60)
!64 = !DILocation(line: 55, column: 9, scope: !60)
!65 = !DILocation(line: 55, column: 23, scope: !60)
!66 = !DILocation(line: 57, column: 17, scope: !60)
!67 = !DILocation(line: 57, column: 23, scope: !60)
!68 = !DILocation(line: 57, column: 9, scope: !60)
!69 = !DILocation(line: 59, column: 9, scope: !60)
!70 = !DILocation(line: 59, column: 21, scope: !60)
!71 = !DILocation(line: 60, column: 20, scope: !60)
!72 = !DILocation(line: 60, column: 9, scope: !60)
!73 = !DILocation(line: 62, column: 1, scope: !48)
