; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_badSink.source to i8*), i64 44, i1 false), !dbg !24
  %1 = load i32*, i32** %data.addr, align 8, !dbg !25
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !26
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #5, !dbg !27
  %2 = load i32*, i32** %data.addr, align 8, !dbg !28
  call void @printWLine(i32* %2), !dbg !29
  %3 = load i32*, i32** %data.addr, align 8, !dbg !30
  %4 = bitcast i32* %3 to i8*, !dbg !30
  call void @free(i8* %4) #5, !dbg !31
  ret void, !dbg !32
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_goodG2BSink(i32* %data) #0 !dbg !33 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !38
  %1 = load i32*, i32** %data.addr, align 8, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #5, !dbg !41
  %2 = load i32*, i32** %data.addr, align 8, !dbg !42
  call void @printWLine(i32* %2), !dbg !43
  %3 = load i32*, i32** %data.addr, align 8, !dbg !44
  %4 = bitcast i32* %3 to i8*, !dbg !44
  call void @free(i8* %4) #5, !dbg !45
  ret void, !dbg !46
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!18 = !DILocation(line: 28, column: 84, scope: !9)
!19 = !DILocalVariable(name: "source", scope: !20, file: !10, line: 31, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 30, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 352, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 31, column: 17, scope: !20)
!25 = !DILocation(line: 33, column: 16, scope: !20)
!26 = !DILocation(line: 33, column: 22, scope: !20)
!27 = !DILocation(line: 33, column: 9, scope: !20)
!28 = !DILocation(line: 34, column: 20, scope: !20)
!29 = !DILocation(line: 34, column: 9, scope: !20)
!30 = !DILocation(line: 35, column: 14, scope: !20)
!31 = !DILocation(line: 35, column: 9, scope: !20)
!32 = !DILocation(line: 37, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_65b_goodG2BSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "data", arg: 1, scope: !33, file: !10, line: 44, type: !13)
!35 = !DILocation(line: 44, column: 88, scope: !33)
!36 = !DILocalVariable(name: "source", scope: !37, file: !10, line: 47, type: !21)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 46, column: 5)
!38 = !DILocation(line: 47, column: 17, scope: !37)
!39 = !DILocation(line: 49, column: 16, scope: !37)
!40 = !DILocation(line: 49, column: 22, scope: !37)
!41 = !DILocation(line: 49, column: 9, scope: !37)
!42 = !DILocation(line: 50, column: 20, scope: !37)
!43 = !DILocation(line: 50, column: 9, scope: !37)
!44 = !DILocation(line: 51, column: 14, scope: !37)
!45 = !DILocation(line: 51, column: 9, scope: !37)
!46 = !DILocation(line: 53, column: 1, scope: !33)
