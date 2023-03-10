; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b_badSink(i64* %data) #0 !dbg !9 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !28
  %4 = load i64*, i64** %data.addr, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !29
  %5 = load i64, i64* %arrayidx, align 8, !dbg !29
  call void @printLongLongLine(i64 %5), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b_goodG2BSink(i64* %data) #0 !dbg !32 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !37
  %1 = load i64*, i64** %data.addr, align 8, !dbg !38
  %2 = bitcast i64* %1 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !39
  %3 = bitcast i64* %arraydecay to i8*, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !39
  %4 = load i64*, i64** %data.addr, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !40
  %5 = load i64, i64* %arrayidx, align 8, !dbg !40
  call void @printLongLongLine(i64 %5), !dbg !41
  ret void, !dbg !42
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !15, line: 27, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !17, line: 44, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!18 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!20 = !DILocation(line: 21, column: 95, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 24, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 23, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 24, column: 17, scope: !22)
!27 = !DILocation(line: 26, column: 17, scope: !22)
!28 = !DILocation(line: 26, column: 9, scope: !22)
!29 = !DILocation(line: 27, column: 27, scope: !22)
!30 = !DILocation(line: 27, column: 9, scope: !22)
!31 = !DILocation(line: 29, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_65b_goodG2BSink", scope: !10, file: !10, line: 36, type: !11, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocalVariable(name: "data", arg: 1, scope: !32, file: !10, line: 36, type: !13)
!34 = !DILocation(line: 36, column: 99, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !10, line: 39, type: !23)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 38, column: 5)
!37 = !DILocation(line: 39, column: 17, scope: !36)
!38 = !DILocation(line: 41, column: 17, scope: !36)
!39 = !DILocation(line: 41, column: 9, scope: !36)
!40 = !DILocation(line: 42, column: 27, scope: !36)
!41 = !DILocation(line: 42, column: 9, scope: !36)
!42 = !DILocation(line: 44, column: 1, scope: !32)
