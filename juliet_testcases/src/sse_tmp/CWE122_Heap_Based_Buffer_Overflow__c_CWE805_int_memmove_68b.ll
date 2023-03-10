; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68_badData = external dso_local global i32*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68_badData, align 8, !dbg !17
  store i32* %0, i32** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !23
  %2 = load i32*, i32** %data, align 8, !dbg !24
  %3 = bitcast i32* %2 to i8*, !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !25
  %4 = bitcast i32* %arraydecay to i8*, !dbg !25
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !25
  %5 = load i32*, i32** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !26
  %6 = load i32, i32* %arrayidx, align 4, !dbg !26
  call void @printIntLine(i32 %6), !dbg !27
  %7 = load i32*, i32** %data, align 8, !dbg !28
  %8 = bitcast i32* %7 to i8*, !dbg !28
  call void @free(i8* %8) #6, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b_goodG2BSink() #0 !dbg !31 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68_goodG2BData, align 8, !dbg !34
  store i32* %0, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %3 = bitcast i32* %2 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !39
  %4 = bitcast i32* %arraydecay to i8*, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !39
  %5 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !40
  %6 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %6), !dbg !41
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %8 = bitcast i32* %7 to i8*, !dbg !42
  call void @free(i8* %8) #6, !dbg !43
  ret void, !dbg !44
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocation(line: 28, column: 11, scope: !9)
!17 = !DILocation(line: 28, column: 18, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 30, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 30, column: 13, scope: !19)
!24 = !DILocation(line: 32, column: 17, scope: !19)
!25 = !DILocation(line: 32, column: 9, scope: !19)
!26 = !DILocation(line: 33, column: 22, scope: !19)
!27 = !DILocation(line: 33, column: 9, scope: !19)
!28 = !DILocation(line: 34, column: 14, scope: !19)
!29 = !DILocation(line: 34, column: 9, scope: !19)
!30 = !DILocation(line: 36, column: 1, scope: !9)
!31 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_68b_goodG2BSink", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocalVariable(name: "data", scope: !31, file: !10, line: 45, type: !14)
!33 = !DILocation(line: 45, column: 11, scope: !31)
!34 = !DILocation(line: 45, column: 18, scope: !31)
!35 = !DILocalVariable(name: "source", scope: !36, file: !10, line: 47, type: !20)
!36 = distinct !DILexicalBlock(scope: !31, file: !10, line: 46, column: 5)
!37 = !DILocation(line: 47, column: 13, scope: !36)
!38 = !DILocation(line: 49, column: 17, scope: !36)
!39 = !DILocation(line: 49, column: 9, scope: !36)
!40 = !DILocation(line: 50, column: 22, scope: !36)
!41 = !DILocation(line: 50, column: 9, scope: !36)
!42 = !DILocation(line: 51, column: 14, scope: !36)
!43 = !DILocation(line: 51, column: 9, scope: !36)
!44 = !DILocation(line: 53, column: 1, scope: !31)
