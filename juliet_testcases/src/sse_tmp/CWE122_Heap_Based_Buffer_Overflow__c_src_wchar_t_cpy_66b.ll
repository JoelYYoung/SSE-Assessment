; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !23, metadata !DIExpression()), !dbg !28
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %3) #5, !dbg !31
  %4 = load i32*, i32** %data, align 8, !dbg !32
  call void @printWLine(i32* %4), !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %6 = bitcast i32* %5 to i8*, !dbg !34
  call void @free(i8* %6) #5, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b_goodG2BSink(i32** %dataArray) #0 !dbg !37 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32** %data, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !42
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !42
  store i32* %1, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !45
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %3) #5, !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %4), !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !51
  call void @free(i8* %6) #5, !dbg !52
  ret void, !dbg !53
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 81, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!21 = !DILocation(line: 26, column: 15, scope: !9)
!22 = !DILocation(line: 26, column: 22, scope: !9)
!23 = !DILocalVariable(name: "dest", scope: !24, file: !10, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 28, column: 17, scope: !24)
!29 = !DILocation(line: 30, column: 16, scope: !24)
!30 = !DILocation(line: 30, column: 22, scope: !24)
!31 = !DILocation(line: 30, column: 9, scope: !24)
!32 = !DILocation(line: 31, column: 20, scope: !24)
!33 = !DILocation(line: 31, column: 9, scope: !24)
!34 = !DILocation(line: 32, column: 14, scope: !24)
!35 = !DILocation(line: 32, column: 9, scope: !24)
!36 = !DILocation(line: 34, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_66b_goodG2BSink", scope: !10, file: !10, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "dataArray", arg: 1, scope: !37, file: !10, line: 41, type: !13)
!39 = !DILocation(line: 41, column: 85, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !10, line: 43, type: !14)
!41 = !DILocation(line: 43, column: 15, scope: !37)
!42 = !DILocation(line: 43, column: 22, scope: !37)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !10, line: 45, type: !25)
!44 = distinct !DILexicalBlock(scope: !37, file: !10, line: 44, column: 5)
!45 = !DILocation(line: 45, column: 17, scope: !44)
!46 = !DILocation(line: 47, column: 16, scope: !44)
!47 = !DILocation(line: 47, column: 22, scope: !44)
!48 = !DILocation(line: 47, column: 9, scope: !44)
!49 = !DILocation(line: 48, column: 20, scope: !44)
!50 = !DILocation(line: 48, column: 9, scope: !44)
!51 = !DILocation(line: 49, column: 14, scope: !44)
!52 = !DILocation(line: 49, column: 9, scope: !44)
!53 = !DILocation(line: 51, column: 1, scope: !37)
