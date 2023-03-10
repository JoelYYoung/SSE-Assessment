; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_65b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_65b_badSink(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !17, metadata !DIExpression()), !dbg !22
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !23
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %0 = load i8*, i8** %data.addr, align 8, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !27
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !27
  %1 = load i8*, i8** %data.addr, align 8, !dbg !28
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx2, align 1, !dbg !29
  %2 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @printLine(i8* %2), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_65b_goodG2BSink(i8* %data) #0 !dbg !33 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %0 = load i8*, i8** %data.addr, align 8, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !43
  %1 = load i8*, i8** %data.addr, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %2 = load i8*, i8** %data.addr, align 8, !dbg !46
  call void @printLine(i8* %2), !dbg !47
  ret void, !dbg !48
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!16 = !DILocation(line: 23, column: 72, scope: !9)
!17 = !DILocalVariable(name: "source", scope: !18, file: !10, line: 26, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 800, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !DILocation(line: 26, column: 14, scope: !18)
!23 = !DILocation(line: 27, column: 9, scope: !18)
!24 = !DILocation(line: 28, column: 9, scope: !18)
!25 = !DILocation(line: 28, column: 23, scope: !18)
!26 = !DILocation(line: 30, column: 17, scope: !18)
!27 = !DILocation(line: 30, column: 9, scope: !18)
!28 = !DILocation(line: 32, column: 9, scope: !18)
!29 = !DILocation(line: 32, column: 21, scope: !18)
!30 = !DILocation(line: 33, column: 19, scope: !18)
!31 = !DILocation(line: 33, column: 9, scope: !18)
!32 = !DILocation(line: 35, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_65b_goodG2BSink", scope: !10, file: !10, line: 42, type: !11, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "data", arg: 1, scope: !33, file: !10, line: 42, type: !13)
!35 = !DILocation(line: 42, column: 76, scope: !33)
!36 = !DILocalVariable(name: "source", scope: !37, file: !10, line: 45, type: !19)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 44, column: 5)
!38 = !DILocation(line: 45, column: 14, scope: !37)
!39 = !DILocation(line: 46, column: 9, scope: !37)
!40 = !DILocation(line: 47, column: 9, scope: !37)
!41 = !DILocation(line: 47, column: 23, scope: !37)
!42 = !DILocation(line: 49, column: 17, scope: !37)
!43 = !DILocation(line: 49, column: 9, scope: !37)
!44 = !DILocation(line: 51, column: 9, scope: !37)
!45 = !DILocation(line: 51, column: 21, scope: !37)
!46 = !DILocation(line: 52, column: 19, scope: !37)
!47 = !DILocation(line: 52, column: 9, scope: !37)
!48 = !DILocation(line: 54, column: 1, scope: !33)
