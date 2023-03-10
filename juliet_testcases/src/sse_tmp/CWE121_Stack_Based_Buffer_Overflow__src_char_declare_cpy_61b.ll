; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b_badSource(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** %data.addr, align 8, !dbg !17
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !18
  %1 = load i8*, i8** %data.addr, align 8, !dbg !19
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !19
  store i8 0, i8* %arrayidx, align 1, !dbg !20
  %2 = load i8*, i8** %data.addr, align 8, !dbg !21
  ret i8* %2, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b_goodG2BSource(i8* %data) #0 !dbg !23 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %data.addr, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !27
  %1 = load i8*, i8** %data.addr, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %2 = load i8*, i8** %data.addr, align 8, !dbg !30
  ret i8* %2, !dbg !31
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b_badSource", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!16 = !DILocation(line: 23, column: 86, scope: !9)
!17 = !DILocation(line: 26, column: 12, scope: !9)
!18 = !DILocation(line: 26, column: 5, scope: !9)
!19 = !DILocation(line: 27, column: 5, scope: !9)
!20 = !DILocation(line: 27, column: 17, scope: !9)
!21 = !DILocation(line: 28, column: 12, scope: !9)
!22 = !DILocation(line: 28, column: 5, scope: !9)
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_61b_goodG2BSource", scope: !10, file: !10, line: 36, type: !11, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DILocalVariable(name: "data", arg: 1, scope: !23, file: !10, line: 36, type: !13)
!25 = !DILocation(line: 36, column: 90, scope: !23)
!26 = !DILocation(line: 39, column: 12, scope: !23)
!27 = !DILocation(line: 39, column: 5, scope: !23)
!28 = !DILocation(line: 40, column: 5, scope: !23)
!29 = !DILocation(line: 40, column: 16, scope: !23)
!30 = !DILocation(line: 41, column: 12, scope: !23)
!31 = !DILocation(line: 41, column: 5, scope: !23)
