; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68_badData = external dso_local global i64*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68_goodG2BData = external dso_local global i64*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !13, metadata !DIExpression()), !dbg !20
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68_badData, align 8, !dbg !21
  store i64* %0, i64** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !27
  %2 = load i64*, i64** %data, align 8, !dbg !28
  %3 = bitcast i64* %2 to i8*, !dbg !29
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !29
  %4 = bitcast i64* %arraydecay to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !29
  %5 = load i64*, i64** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !30
  %6 = load i64, i64* %arrayidx, align 8, !dbg !30
  call void @printLongLongLine(i64 %6), !dbg !31
  %7 = load i64*, i64** %data, align 8, !dbg !32
  %8 = bitcast i64* %7 to i8*, !dbg !32
  call void @free(i8* %8) #6, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b_goodG2BSink() #0 !dbg !35 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68_goodG2BData, align 8, !dbg !38
  store i64* %0, i64** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !41
  %2 = load i64*, i64** %data, align 8, !dbg !42
  %3 = bitcast i64* %2 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !43
  %4 = bitcast i64* %arraydecay to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !43
  %5 = load i64*, i64** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !44
  %6 = load i64, i64* %arrayidx, align 8, !dbg !44
  call void @printLongLongLine(i64 %6), !dbg !45
  %7 = load i64*, i64** %data, align 8, !dbg !46
  %8 = bitcast i64* %7 to i8*, !dbg !46
  call void @free(i8* %8) #6, !dbg !47
  ret void, !dbg !48
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !9)
!21 = !DILocation(line: 28, column: 22, scope: !9)
!22 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 30, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 30, column: 17, scope: !23)
!28 = !DILocation(line: 32, column: 16, scope: !23)
!29 = !DILocation(line: 32, column: 9, scope: !23)
!30 = !DILocation(line: 33, column: 27, scope: !23)
!31 = !DILocation(line: 33, column: 9, scope: !23)
!32 = !DILocation(line: 34, column: 14, scope: !23)
!33 = !DILocation(line: 34, column: 9, scope: !23)
!34 = !DILocation(line: 36, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_68b_goodG2BSink", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 45, type: !14)
!37 = !DILocation(line: 45, column: 15, scope: !35)
!38 = !DILocation(line: 45, column: 22, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 47, type: !24)
!40 = distinct !DILexicalBlock(scope: !35, file: !10, line: 46, column: 5)
!41 = !DILocation(line: 47, column: 17, scope: !40)
!42 = !DILocation(line: 49, column: 16, scope: !40)
!43 = !DILocation(line: 49, column: 9, scope: !40)
!44 = !DILocation(line: 50, column: 27, scope: !40)
!45 = !DILocation(line: 50, column: 9, scope: !40)
!46 = !DILocation(line: 51, column: 14, scope: !40)
!47 = !DILocation(line: 51, column: 9, scope: !40)
!48 = !DILocation(line: 53, column: 1, scope: !35)
