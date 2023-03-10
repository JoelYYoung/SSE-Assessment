; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_wchar_t_cpy_68_badData = external dso_local global i32*, align 8
@CWE127_Buffer_Underread__malloc_wchar_t_cpy_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE127_Buffer_Underread__malloc_wchar_t_cpy_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !27
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %1) #4, !dbg !32
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !33
  call void @printWLine(i32* %arraydecay3), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b_goodG2BSink() #0 !dbg !36 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32*, i32** @CWE127_Buffer_Underread__malloc_wchar_t_cpy_68_goodG2BData, align 8, !dbg !39
  store i32* %0, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !43
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !44
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %arraydecay1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !47
  %1 = load i32*, i32** %data, align 8, !dbg !48
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %1) #4, !dbg !49
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !50
  call void @printWLine(i32* %arraydecay3), !dbg !51
  ret void, !dbg !52
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 15, scope: !9)
!19 = !DILocation(line: 30, column: 22, scope: !9)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !10, line: 32, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 200)
!25 = !DILocation(line: 32, column: 17, scope: !21)
!26 = !DILocation(line: 33, column: 17, scope: !21)
!27 = !DILocation(line: 33, column: 9, scope: !21)
!28 = !DILocation(line: 34, column: 9, scope: !21)
!29 = !DILocation(line: 34, column: 23, scope: !21)
!30 = !DILocation(line: 36, column: 16, scope: !21)
!31 = !DILocation(line: 36, column: 22, scope: !21)
!32 = !DILocation(line: 36, column: 9, scope: !21)
!33 = !DILocation(line: 37, column: 20, scope: !21)
!34 = !DILocation(line: 37, column: 9, scope: !21)
!35 = !DILocation(line: 41, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_68b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "data", scope: !36, file: !10, line: 50, type: !14)
!38 = !DILocation(line: 50, column: 15, scope: !36)
!39 = !DILocation(line: 50, column: 22, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !10, line: 52, type: !22)
!41 = distinct !DILexicalBlock(scope: !36, file: !10, line: 51, column: 5)
!42 = !DILocation(line: 52, column: 17, scope: !41)
!43 = !DILocation(line: 53, column: 17, scope: !41)
!44 = !DILocation(line: 53, column: 9, scope: !41)
!45 = !DILocation(line: 54, column: 9, scope: !41)
!46 = !DILocation(line: 54, column: 23, scope: !41)
!47 = !DILocation(line: 56, column: 16, scope: !41)
!48 = !DILocation(line: 56, column: 22, scope: !41)
!49 = !DILocation(line: 56, column: 9, scope: !41)
!50 = !DILocation(line: 57, column: 20, scope: !41)
!51 = !DILocation(line: 57, column: 9, scope: !41)
!52 = !DILocation(line: 61, column: 1, scope: !36)
