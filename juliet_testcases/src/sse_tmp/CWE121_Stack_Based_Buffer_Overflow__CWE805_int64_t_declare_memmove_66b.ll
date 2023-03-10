; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b_badSink(i64** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !24
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !24
  store i64* %1, i64** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !30
  %3 = load i64*, i64** %data, align 8, !dbg !31
  %4 = bitcast i64* %3 to i8*, !dbg !32
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !32
  %5 = bitcast i64* %arraydecay to i8*, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !32
  %6 = load i64*, i64** %data, align 8, !dbg !33
  %arrayidx1 = getelementptr inbounds i64, i64* %6, i64 0, !dbg !33
  %7 = load i64, i64* %arrayidx1, align 8, !dbg !33
  call void @printLongLongLine(i64 %7), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b_goodG2BSink(i64** %dataArray) #0 !dbg !36 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64** %data, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !41
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !41
  store i64* %1, i64** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !44
  %3 = load i64*, i64** %data, align 8, !dbg !45
  %4 = bitcast i64* %3 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !46
  %5 = bitcast i64* %arraydecay to i8*, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !46
  %6 = load i64*, i64** %data, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i64, i64* %6, i64 0, !dbg !47
  %7 = load i64, i64* %arrayidx1, align 8, !dbg !47
  call void @printLongLongLine(i64 %7), !dbg !48
  ret void, !dbg !49
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!21 = !DILocation(line: 21, column: 95, scope: !9)
!22 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!23 = !DILocation(line: 24, column: 15, scope: !9)
!24 = !DILocation(line: 24, column: 22, scope: !9)
!25 = !DILocalVariable(name: "source", scope: !26, file: !10, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 26, column: 17, scope: !26)
!31 = !DILocation(line: 28, column: 17, scope: !26)
!32 = !DILocation(line: 28, column: 9, scope: !26)
!33 = !DILocation(line: 29, column: 27, scope: !26)
!34 = !DILocation(line: 29, column: 9, scope: !26)
!35 = !DILocation(line: 31, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_66b_goodG2BSink", scope: !10, file: !10, line: 38, type: !11, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "dataArray", arg: 1, scope: !36, file: !10, line: 38, type: !13)
!38 = !DILocation(line: 38, column: 99, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !10, line: 40, type: !14)
!40 = !DILocation(line: 40, column: 15, scope: !36)
!41 = !DILocation(line: 40, column: 22, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !10, line: 42, type: !27)
!43 = distinct !DILexicalBlock(scope: !36, file: !10, line: 41, column: 5)
!44 = !DILocation(line: 42, column: 17, scope: !43)
!45 = !DILocation(line: 44, column: 17, scope: !43)
!46 = !DILocation(line: 44, column: 9, scope: !43)
!47 = !DILocation(line: 45, column: 27, scope: !43)
!48 = !DILocation(line: 45, column: 9, scope: !43)
!49 = !DILocation(line: 47, column: 1, scope: !36)
