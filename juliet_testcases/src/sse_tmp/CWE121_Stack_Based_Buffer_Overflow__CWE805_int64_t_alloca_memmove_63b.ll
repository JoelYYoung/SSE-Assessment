; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b_badSink(i64** %dataPtr) #0 !dbg !9 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !33
  %6 = load i64*, i64** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !34
  %7 = load i64, i64* %arrayidx, align 8, !dbg !34
  call void @printLongLongLine(i64 %7), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b_goodG2BSink(i64** %dataPtr) #0 !dbg !37 {
entry:
  %dataPtr.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64** %dataPtr, i64*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataPtr.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64** %data, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i64**, i64*** %dataPtr.addr, align 8, !dbg !42
  %1 = load i64*, i64** %0, align 8, !dbg !43
  store i64* %1, i64** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !46
  %3 = load i64*, i64** %data, align 8, !dbg !47
  %4 = bitcast i64* %3 to i8*, !dbg !48
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !48
  %5 = bitcast i64* %arraydecay to i8*, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !48
  %6 = load i64*, i64** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !49
  %7 = load i64, i64* %arrayidx, align 8, !dbg !49
  call void @printLongLongLine(i64 %7), !dbg !50
  ret void, !dbg !51
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
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
!21 = !DILocation(line: 21, column: 96, scope: !9)
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
!32 = !DILocation(line: 27, column: 17, scope: !27)
!33 = !DILocation(line: 27, column: 9, scope: !27)
!34 = !DILocation(line: 28, column: 27, scope: !27)
!35 = !DILocation(line: 28, column: 9, scope: !27)
!36 = !DILocation(line: 30, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_63b_goodG2BSink", scope: !10, file: !10, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !37, file: !10, line: 37, type: !13)
!39 = !DILocation(line: 37, column: 100, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !10, line: 39, type: !14)
!41 = !DILocation(line: 39, column: 15, scope: !37)
!42 = !DILocation(line: 39, column: 23, scope: !37)
!43 = !DILocation(line: 39, column: 22, scope: !37)
!44 = !DILocalVariable(name: "source", scope: !45, file: !10, line: 41, type: !28)
!45 = distinct !DILexicalBlock(scope: !37, file: !10, line: 40, column: 5)
!46 = !DILocation(line: 41, column: 17, scope: !45)
!47 = !DILocation(line: 43, column: 17, scope: !45)
!48 = !DILocation(line: 43, column: 9, scope: !45)
!49 = !DILocation(line: 44, column: 27, scope: !45)
!50 = !DILocation(line: 44, column: 9, scope: !45)
!51 = !DILocation(line: 46, column: 1, scope: !37)
