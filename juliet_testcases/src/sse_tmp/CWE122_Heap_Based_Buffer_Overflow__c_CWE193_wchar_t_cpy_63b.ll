; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_badSink.source to i8*), i64 44, i1 false), !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !31
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay) #5, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  call void @printWLine(i32* %4), !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %6 = bitcast i32* %5 to i8*, !dbg !35
  call void @free(i8* %6) #5, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !38 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !43
  %1 = load i32*, i32** %0, align 8, !dbg !44
  store i32* %1, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !47
  %3 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i32* @wcscpy(i32* %3, i32* %arraydecay) #5, !dbg !50
  %4 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %4), !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %6 = bitcast i32* %5 to i8*, !dbg !53
  call void @free(i8* %6) #5, !dbg !54
  ret void, !dbg !55
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!19 = !DILocation(line: 28, column: 86, scope: !9)
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
!30 = !DILocation(line: 34, column: 16, scope: !25)
!31 = !DILocation(line: 34, column: 22, scope: !25)
!32 = !DILocation(line: 34, column: 9, scope: !25)
!33 = !DILocation(line: 35, column: 20, scope: !25)
!34 = !DILocation(line: 35, column: 9, scope: !25)
!35 = !DILocation(line: 36, column: 14, scope: !25)
!36 = !DILocation(line: 36, column: 9, scope: !25)
!37 = !DILocation(line: 38, column: 1, scope: !9)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_63b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !38, file: !10, line: 45, type: !13)
!40 = !DILocation(line: 45, column: 90, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !10, line: 47, type: !14)
!42 = !DILocation(line: 47, column: 15, scope: !38)
!43 = !DILocation(line: 47, column: 23, scope: !38)
!44 = !DILocation(line: 47, column: 22, scope: !38)
!45 = !DILocalVariable(name: "source", scope: !46, file: !10, line: 49, type: !26)
!46 = distinct !DILexicalBlock(scope: !38, file: !10, line: 48, column: 5)
!47 = !DILocation(line: 49, column: 17, scope: !46)
!48 = !DILocation(line: 51, column: 16, scope: !46)
!49 = !DILocation(line: 51, column: 22, scope: !46)
!50 = !DILocation(line: 51, column: 9, scope: !46)
!51 = !DILocation(line: 52, column: 20, scope: !46)
!52 = !DILocation(line: 52, column: 9, scope: !46)
!53 = !DILocation(line: 53, column: 14, scope: !46)
!54 = !DILocation(line: 53, column: 9, scope: !46)
!55 = !DILocation(line: 55, column: 1, scope: !38)
