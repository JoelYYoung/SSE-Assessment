; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b_badSink(i64** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64** %dataPtr, i64*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataPtr.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64**, i64*** %dataPtr.addr, align 8, !dbg !24
  %1 = load i64*, i64** %0, align 8, !dbg !25
  store i64* %1, i64** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !31
  %3 = load i64*, i64** %data, align 8, !dbg !32
  %4 = bitcast i64* %3 to i8*, !dbg !33
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !33
  %5 = bitcast i64* %arraydecay to i8*, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !33
  %6 = load i64*, i64** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !34
  %7 = load i64, i64* %arrayidx, align 8, !dbg !34
  call void @printLongLongLine(i64 %7), !dbg !35
  %8 = load i64*, i64** %data, align 8, !dbg !36
  %9 = bitcast i64* %8 to i8*, !dbg !36
  call void @free(i8* %9) #6, !dbg !37
  ret void, !dbg !38
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b_goodG2BSink(i64** %dataPtr) #0 !dbg !39 {
entry:
  %dataPtr.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64** %dataPtr, i64*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataPtr.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64** %data, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i64**, i64*** %dataPtr.addr, align 8, !dbg !44
  %1 = load i64*, i64** %0, align 8, !dbg !45
  store i64* %1, i64** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !48
  %3 = load i64*, i64** %data, align 8, !dbg !49
  %4 = bitcast i64* %3 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !50
  %5 = bitcast i64* %arraydecay to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !50
  %6 = load i64*, i64** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !51
  %7 = load i64, i64* %arrayidx, align 8, !dbg !51
  call void @printLongLongLine(i64 %7), !dbg !52
  %8 = load i64*, i64** %data, align 8, !dbg !53
  %9 = bitcast i64* %8 to i8*, !dbg !53
  call void @free(i8* %9) #6, !dbg !54
  ret void, !dbg !55
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!21 = !DILocation(line: 21, column: 89, scope: !9)
!22 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 23, type: !14)
!23 = !DILocation(line: 23, column: 15, scope: !9)
!24 = !DILocation(line: 23, column: 23, scope: !9)
!25 = !DILocation(line: 23, column: 22, scope: !9)
!26 = !DILocalVariable(name: "source", scope: !27, file: !10, line: 25, type: !28)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 24, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 25, column: 17, scope: !27)
!32 = !DILocation(line: 27, column: 16, scope: !27)
!33 = !DILocation(line: 27, column: 9, scope: !27)
!34 = !DILocation(line: 28, column: 27, scope: !27)
!35 = !DILocation(line: 28, column: 9, scope: !27)
!36 = !DILocation(line: 29, column: 14, scope: !27)
!37 = !DILocation(line: 29, column: 9, scope: !27)
!38 = !DILocation(line: 31, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_63b_goodG2BSink", scope: !10, file: !10, line: 38, type: !11, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !39, file: !10, line: 38, type: !13)
!41 = !DILocation(line: 38, column: 93, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !10, line: 40, type: !14)
!43 = !DILocation(line: 40, column: 15, scope: !39)
!44 = !DILocation(line: 40, column: 23, scope: !39)
!45 = !DILocation(line: 40, column: 22, scope: !39)
!46 = !DILocalVariable(name: "source", scope: !47, file: !10, line: 42, type: !28)
!47 = distinct !DILexicalBlock(scope: !39, file: !10, line: 41, column: 5)
!48 = !DILocation(line: 42, column: 17, scope: !47)
!49 = !DILocation(line: 44, column: 16, scope: !47)
!50 = !DILocation(line: 44, column: 9, scope: !47)
!51 = !DILocation(line: 45, column: 27, scope: !47)
!52 = !DILocation(line: 45, column: 9, scope: !47)
!53 = !DILocation(line: 46, column: 14, scope: !47)
!54 = !DILocation(line: 46, column: 9, scope: !47)
!55 = !DILocation(line: 48, column: 1, scope: !39)
