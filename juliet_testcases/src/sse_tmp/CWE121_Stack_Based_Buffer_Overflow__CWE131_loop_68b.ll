; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68_badData = external dso_local global i32*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68_badData, align 8, !dbg !17
  store i32* %0, i32** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !28
  store i64 0, i64* %i, align 8, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !32
  %cmp = icmp ult i64 %2, 10, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !36
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !38
  %4 = load i32, i32* %arrayidx, align 4, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %6 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !39
  store i32 %4, i32* %arrayidx1, align 4, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !43
  %inc = add i64 %7, 1, !dbg !43
  store i64 %inc, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !48
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !48
  call void @printIntLine(i32 %9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b_goodG2BSink() #0 !dbg !51 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68_goodG2BData, align 8, !dbg !54
  store i32* %0, i32** %data, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i, metadata !58, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %2, 10, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !69
  %4 = load i32, i32* %arrayidx, align 4, !dbg !69
  %5 = load i32*, i32** %data, align 8, !dbg !70
  %6 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !70
  store i32 %4, i32* %arrayidx1, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %7, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !78
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !78
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !78
  call void @printIntLine(i32 %9), !dbg !79
  ret void, !dbg !80
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocation(line: 28, column: 11, scope: !9)
!17 = !DILocation(line: 28, column: 18, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 30, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 320, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 30, column: 13, scope: !19)
!24 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 31, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 31, column: 16, scope: !19)
!29 = !DILocation(line: 33, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !19, file: !10, line: 33, column: 9)
!31 = !DILocation(line: 33, column: 14, scope: !30)
!32 = !DILocation(line: 33, column: 21, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !10, line: 33, column: 9)
!34 = !DILocation(line: 33, column: 23, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !30)
!36 = !DILocation(line: 35, column: 30, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 34, column: 9)
!38 = !DILocation(line: 35, column: 23, scope: !37)
!39 = !DILocation(line: 35, column: 13, scope: !37)
!40 = !DILocation(line: 35, column: 18, scope: !37)
!41 = !DILocation(line: 35, column: 21, scope: !37)
!42 = !DILocation(line: 36, column: 9, scope: !37)
!43 = !DILocation(line: 33, column: 30, scope: !33)
!44 = !DILocation(line: 33, column: 9, scope: !33)
!45 = distinct !{!45, !35, !46, !47}
!46 = !DILocation(line: 36, column: 9, scope: !30)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocation(line: 37, column: 22, scope: !19)
!49 = !DILocation(line: 37, column: 9, scope: !19)
!50 = !DILocation(line: 39, column: 1, scope: !9)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_68b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", scope: !51, file: !10, line: 48, type: !14)
!53 = !DILocation(line: 48, column: 11, scope: !51)
!54 = !DILocation(line: 48, column: 18, scope: !51)
!55 = !DILocalVariable(name: "source", scope: !56, file: !10, line: 50, type: !20)
!56 = distinct !DILexicalBlock(scope: !51, file: !10, line: 49, column: 5)
!57 = !DILocation(line: 50, column: 13, scope: !56)
!58 = !DILocalVariable(name: "i", scope: !56, file: !10, line: 51, type: !25)
!59 = !DILocation(line: 51, column: 16, scope: !56)
!60 = !DILocation(line: 53, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !10, line: 53, column: 9)
!62 = !DILocation(line: 53, column: 14, scope: !61)
!63 = !DILocation(line: 53, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !10, line: 53, column: 9)
!65 = !DILocation(line: 53, column: 23, scope: !64)
!66 = !DILocation(line: 53, column: 9, scope: !61)
!67 = !DILocation(line: 55, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !10, line: 54, column: 9)
!69 = !DILocation(line: 55, column: 23, scope: !68)
!70 = !DILocation(line: 55, column: 13, scope: !68)
!71 = !DILocation(line: 55, column: 18, scope: !68)
!72 = !DILocation(line: 55, column: 21, scope: !68)
!73 = !DILocation(line: 56, column: 9, scope: !68)
!74 = !DILocation(line: 53, column: 30, scope: !64)
!75 = !DILocation(line: 53, column: 9, scope: !64)
!76 = distinct !{!76, !66, !77, !47}
!77 = !DILocation(line: 56, column: 9, scope: !61)
!78 = !DILocation(line: 57, column: 22, scope: !56)
!79 = !DILocation(line: 57, column: 9, scope: !56)
!80 = !DILocation(line: 59, column: 1, scope: !51)
