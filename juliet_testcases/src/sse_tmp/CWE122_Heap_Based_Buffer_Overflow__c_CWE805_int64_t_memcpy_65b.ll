; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b_badSink(i64* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !26
  %1 = load i64*, i64** %data.addr, align 8, !dbg !27
  %2 = bitcast i64* %1 to i8*, !dbg !28
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !28
  %3 = bitcast i64* %arraydecay to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !28
  %4 = load i64*, i64** %data.addr, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !29
  %5 = load i64, i64* %arrayidx, align 8, !dbg !29
  call void @printLongLongLine(i64 %5), !dbg !30
  %6 = load i64*, i64** %data.addr, align 8, !dbg !31
  %7 = bitcast i64* %6 to i8*, !dbg !31
  call void @free(i8* %7) #6, !dbg !32
  ret void, !dbg !33
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b_goodG2BSink(i64* %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !39
  %1 = load i64*, i64** %data.addr, align 8, !dbg !40
  %2 = bitcast i64* %1 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !41
  %3 = bitcast i64* %arraydecay to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !41
  %4 = load i64*, i64** %data.addr, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !42
  %5 = load i64, i64* %arrayidx, align 8, !dbg !42
  call void @printLongLongLine(i64 %5), !dbg !43
  %6 = load i64*, i64** %data.addr, align 8, !dbg !44
  %7 = bitcast i64* %6 to i8*, !dbg !44
  call void @free(i8* %7) #6, !dbg !45
  ret void, !dbg !46
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !15, line: 27, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !17, line: 44, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!18 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!20 = !DILocation(line: 21, column: 87, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 24, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 23, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 24, column: 17, scope: !22)
!27 = !DILocation(line: 26, column: 16, scope: !22)
!28 = !DILocation(line: 26, column: 9, scope: !22)
!29 = !DILocation(line: 27, column: 27, scope: !22)
!30 = !DILocation(line: 27, column: 9, scope: !22)
!31 = !DILocation(line: 28, column: 14, scope: !22)
!32 = !DILocation(line: 28, column: 9, scope: !22)
!33 = !DILocation(line: 30, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_65b_goodG2BSink", scope: !10, file: !10, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !10, line: 37, type: !13)
!36 = !DILocation(line: 37, column: 91, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !10, line: 40, type: !23)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 39, column: 5)
!39 = !DILocation(line: 40, column: 17, scope: !38)
!40 = !DILocation(line: 42, column: 16, scope: !38)
!41 = !DILocation(line: 42, column: 9, scope: !38)
!42 = !DILocation(line: 43, column: 27, scope: !38)
!43 = !DILocation(line: 43, column: 9, scope: !38)
!44 = !DILocation(line: 44, column: 14, scope: !38)
!45 = !DILocation(line: 44, column: 9, scope: !38)
!46 = !DILocation(line: 46, column: 1, scope: !34)
