; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b_badSink(i32* %data) #0 !dbg !9 {
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
  %9 = load i32*, i32** %data.addr, align 8, !dbg !49
  %10 = bitcast i32* %9 to i8*, !dbg !49
  call void @free(i8* %10) #5, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b_goodG2BSink(i32* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i, metadata !58, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %1, 10, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !69
  %3 = load i32, i32* %arrayidx, align 4, !dbg !69
  %4 = load i32*, i32** %data.addr, align 8, !dbg !70
  %5 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !70
  store i32 %3, i32* %arrayidx1, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %6, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !78
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !78
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !78
  call void @printIntLine(i32 %8), !dbg !79
  %9 = load i32*, i32** %data.addr, align 8, !dbg !80
  %10 = bitcast i32* %9 to i8*, !dbg !80
  call void @free(i8* %10) #5, !dbg !81
  ret void, !dbg !82
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!16 = !DILocation(line: 23, column: 71, scope: !9)
!17 = !DILocalVariable(name: "source", scope: !18, file: !10, line: 26, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 26, column: 13, scope: !18)
!23 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 27, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 27, column: 16, scope: !18)
!28 = !DILocation(line: 29, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !10, line: 29, column: 9)
!30 = !DILocation(line: 29, column: 14, scope: !29)
!31 = !DILocation(line: 29, column: 21, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !10, line: 29, column: 9)
!33 = !DILocation(line: 29, column: 23, scope: !32)
!34 = !DILocation(line: 29, column: 9, scope: !29)
!35 = !DILocation(line: 31, column: 30, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 30, column: 9)
!37 = !DILocation(line: 31, column: 23, scope: !36)
!38 = !DILocation(line: 31, column: 13, scope: !36)
!39 = !DILocation(line: 31, column: 18, scope: !36)
!40 = !DILocation(line: 31, column: 21, scope: !36)
!41 = !DILocation(line: 32, column: 9, scope: !36)
!42 = !DILocation(line: 29, column: 30, scope: !32)
!43 = !DILocation(line: 29, column: 9, scope: !32)
!44 = distinct !{!44, !34, !45, !46}
!45 = !DILocation(line: 32, column: 9, scope: !29)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocation(line: 33, column: 22, scope: !18)
!48 = !DILocation(line: 33, column: 9, scope: !18)
!49 = !DILocation(line: 34, column: 14, scope: !18)
!50 = !DILocation(line: 34, column: 9, scope: !18)
!51 = !DILocation(line: 36, column: 1, scope: !9)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_51b_goodG2BSink", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !10, line: 43, type: !13)
!54 = !DILocation(line: 43, column: 75, scope: !52)
!55 = !DILocalVariable(name: "source", scope: !56, file: !10, line: 46, type: !19)
!56 = distinct !DILexicalBlock(scope: !52, file: !10, line: 45, column: 5)
!57 = !DILocation(line: 46, column: 13, scope: !56)
!58 = !DILocalVariable(name: "i", scope: !56, file: !10, line: 47, type: !24)
!59 = !DILocation(line: 47, column: 16, scope: !56)
!60 = !DILocation(line: 49, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !10, line: 49, column: 9)
!62 = !DILocation(line: 49, column: 14, scope: !61)
!63 = !DILocation(line: 49, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !10, line: 49, column: 9)
!65 = !DILocation(line: 49, column: 23, scope: !64)
!66 = !DILocation(line: 49, column: 9, scope: !61)
!67 = !DILocation(line: 51, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !10, line: 50, column: 9)
!69 = !DILocation(line: 51, column: 23, scope: !68)
!70 = !DILocation(line: 51, column: 13, scope: !68)
!71 = !DILocation(line: 51, column: 18, scope: !68)
!72 = !DILocation(line: 51, column: 21, scope: !68)
!73 = !DILocation(line: 52, column: 9, scope: !68)
!74 = !DILocation(line: 49, column: 30, scope: !64)
!75 = !DILocation(line: 49, column: 9, scope: !64)
!76 = distinct !{!76, !66, !77, !46}
!77 = !DILocation(line: 52, column: 9, scope: !61)
!78 = !DILocation(line: 53, column: 22, scope: !56)
!79 = !DILocation(line: 53, column: 9, scope: !56)
!80 = !DILocation(line: 54, column: 14, scope: !56)
!81 = !DILocation(line: 54, column: 9, scope: !56)
!82 = !DILocation(line: 56, column: 1, scope: !52)
