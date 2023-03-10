; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !30
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !31
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 99) #4, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* %4), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !42 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !47
  %1 = load i32*, i32** %0, align 8, !dbg !48
  store i32* %1, i32** %data, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %2 = load i32*, i32** %data, align 8, !dbg !56
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call2 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 99) #4, !dbg !58
  %3 = load i32*, i32** %data, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !59
  store i32 0, i32* %arrayidx3, align 4, !dbg !60
  %4 = load i32*, i32** %data, align 8, !dbg !61
  call void @printWLine(i32* %4), !dbg !62
  ret void, !dbg !63
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
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
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 27, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 17, scope: !25)
!30 = !DILocation(line: 28, column: 17, scope: !25)
!31 = !DILocation(line: 28, column: 9, scope: !25)
!32 = !DILocation(line: 29, column: 9, scope: !25)
!33 = !DILocation(line: 29, column: 23, scope: !25)
!34 = !DILocation(line: 31, column: 17, scope: !25)
!35 = !DILocation(line: 31, column: 23, scope: !25)
!36 = !DILocation(line: 31, column: 9, scope: !25)
!37 = !DILocation(line: 32, column: 9, scope: !25)
!38 = !DILocation(line: 32, column: 21, scope: !25)
!39 = !DILocation(line: 33, column: 20, scope: !25)
!40 = !DILocation(line: 33, column: 9, scope: !25)
!41 = !DILocation(line: 35, column: 1, scope: !9)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_63b_goodG2BSink", scope: !10, file: !10, line: 42, type: !11, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !42, file: !10, line: 42, type: !13)
!44 = !DILocation(line: 42, column: 97, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !10, line: 44, type: !14)
!46 = !DILocation(line: 44, column: 15, scope: !42)
!47 = !DILocation(line: 44, column: 23, scope: !42)
!48 = !DILocation(line: 44, column: 22, scope: !42)
!49 = !DILocalVariable(name: "source", scope: !50, file: !10, line: 46, type: !26)
!50 = distinct !DILexicalBlock(scope: !42, file: !10, line: 45, column: 5)
!51 = !DILocation(line: 46, column: 17, scope: !50)
!52 = !DILocation(line: 47, column: 17, scope: !50)
!53 = !DILocation(line: 47, column: 9, scope: !50)
!54 = !DILocation(line: 48, column: 9, scope: !50)
!55 = !DILocation(line: 48, column: 23, scope: !50)
!56 = !DILocation(line: 50, column: 17, scope: !50)
!57 = !DILocation(line: 50, column: 23, scope: !50)
!58 = !DILocation(line: 50, column: 9, scope: !50)
!59 = !DILocation(line: 51, column: 9, scope: !50)
!60 = !DILocation(line: 51, column: 21, scope: !50)
!61 = !DILocation(line: 52, column: 20, scope: !50)
!62 = !DILocation(line: 52, column: 9, scope: !50)
!63 = !DILocation(line: 54, column: 1, scope: !42)
