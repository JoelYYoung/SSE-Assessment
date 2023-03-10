; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !27
  store i64 0, i64* %i, align 8, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !31
  %cmp = icmp ult i64 %1, 10, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !37
  %3 = load i32, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %data.addr, align 8, !dbg !38
  %5 = load i64, i64* %i, align 8, !dbg !39
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !38
  store i32 %3, i32* %arrayidx1, align 4, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !42
  %inc = add i64 %6, 1, !dbg !42
  store i64 %inc, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !47
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !47
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !47
  call void @printIntLine(i32 %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b_goodG2BSink(i32* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %1, 10, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !67
  %3 = load i32, i32* %arrayidx, align 4, !dbg !67
  %4 = load i32*, i32** %data.addr, align 8, !dbg !68
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !68
  store i32 %3, i32* %arrayidx1, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %6, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !76
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !76
  call void @printIntLine(i32 %8), !dbg !77
  ret void, !dbg !78
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!16 = !DILocation(line: 21, column: 72, scope: !9)
!17 = !DILocalVariable(name: "source", scope: !18, file: !10, line: 24, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 23, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 24, column: 13, scope: !18)
!23 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 25, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 25, column: 16, scope: !18)
!28 = !DILocation(line: 27, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !10, line: 27, column: 9)
!30 = !DILocation(line: 27, column: 14, scope: !29)
!31 = !DILocation(line: 27, column: 21, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !10, line: 27, column: 9)
!33 = !DILocation(line: 27, column: 23, scope: !32)
!34 = !DILocation(line: 27, column: 9, scope: !29)
!35 = !DILocation(line: 29, column: 30, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 28, column: 9)
!37 = !DILocation(line: 29, column: 23, scope: !36)
!38 = !DILocation(line: 29, column: 13, scope: !36)
!39 = !DILocation(line: 29, column: 18, scope: !36)
!40 = !DILocation(line: 29, column: 21, scope: !36)
!41 = !DILocation(line: 30, column: 9, scope: !36)
!42 = !DILocation(line: 27, column: 30, scope: !32)
!43 = !DILocation(line: 27, column: 9, scope: !32)
!44 = distinct !{!44, !34, !45, !46}
!45 = !DILocation(line: 30, column: 9, scope: !29)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocation(line: 31, column: 22, scope: !18)
!48 = !DILocation(line: 31, column: 9, scope: !18)
!49 = !DILocation(line: 33, column: 1, scope: !9)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_65b_goodG2BSink", scope: !10, file: !10, line: 40, type: !11, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !10, line: 40, type: !13)
!52 = !DILocation(line: 40, column: 76, scope: !50)
!53 = !DILocalVariable(name: "source", scope: !54, file: !10, line: 43, type: !19)
!54 = distinct !DILexicalBlock(scope: !50, file: !10, line: 42, column: 5)
!55 = !DILocation(line: 43, column: 13, scope: !54)
!56 = !DILocalVariable(name: "i", scope: !54, file: !10, line: 44, type: !24)
!57 = !DILocation(line: 44, column: 16, scope: !54)
!58 = !DILocation(line: 46, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !10, line: 46, column: 9)
!60 = !DILocation(line: 46, column: 14, scope: !59)
!61 = !DILocation(line: 46, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !10, line: 46, column: 9)
!63 = !DILocation(line: 46, column: 23, scope: !62)
!64 = !DILocation(line: 46, column: 9, scope: !59)
!65 = !DILocation(line: 48, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !10, line: 47, column: 9)
!67 = !DILocation(line: 48, column: 23, scope: !66)
!68 = !DILocation(line: 48, column: 13, scope: !66)
!69 = !DILocation(line: 48, column: 18, scope: !66)
!70 = !DILocation(line: 48, column: 21, scope: !66)
!71 = !DILocation(line: 49, column: 9, scope: !66)
!72 = !DILocation(line: 46, column: 30, scope: !62)
!73 = !DILocation(line: 46, column: 9, scope: !62)
!74 = distinct !{!74, !64, !75, !46}
!75 = !DILocation(line: 49, column: 9, scope: !59)
!76 = !DILocation(line: 50, column: 22, scope: !54)
!77 = !DILocation(line: 50, column: 9, scope: !54)
!78 = !DILocation(line: 52, column: 1, scope: !50)
