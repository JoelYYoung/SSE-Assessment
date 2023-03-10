; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = load i32*, i32** %data.addr, align 8, !dbg !31
  %call = call i64 @wcslen(i32* %1) #5, !dbg !32
  store i64 %call, i64* %dataLen, align 8, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !37
  %3 = load i64, i64* %dataLen, align 8, !dbg !39
  %cmp = icmp ult i64 %2, %3, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !42
  %5 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !42
  %6 = load i32, i32* %arrayidx, align 4, !dbg !42
  %7 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !46
  store i32 %6, i32* %arrayidx1, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %8, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !54
  store i32 0, i32* %arrayidx2, align 4, !dbg !55
  %9 = load i32*, i32** %data.addr, align 8, !dbg !56
  call void @printWLine(i32* %9), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b_goodG2BSink(i32* %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !62, metadata !DIExpression()), !dbg !64
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !67, metadata !DIExpression()), !dbg !68
  %1 = load i32*, i32** %data.addr, align 8, !dbg !69
  %call = call i64 @wcslen(i32* %1) #5, !dbg !70
  store i64 %call, i64* %dataLen, align 8, !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !75
  %3 = load i64, i64* %dataLen, align 8, !dbg !77
  %cmp = icmp ult i64 %2, %3, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !80
  %5 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !80
  %6 = load i32, i32* %arrayidx, align 4, !dbg !80
  %7 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !84
  store i32 %6, i32* %arrayidx1, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %8, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !91
  store i32 0, i32* %arrayidx2, align 4, !dbg !92
  %9 = load i32*, i32** %data.addr, align 8, !dbg !93
  call void @printWLine(i32* %9), !dbg !94
  ret void, !dbg !95
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!18 = !DILocation(line: 25, column: 91, scope: !9)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !10, line: 28, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 1600, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 28, column: 17, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 29, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !27)
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 29, column: 16, scope: !20)
!29 = !DILocalVariable(name: "dataLen", scope: !20, file: !10, line: 29, type: !26)
!30 = !DILocation(line: 29, column: 19, scope: !20)
!31 = !DILocation(line: 30, column: 26, scope: !20)
!32 = !DILocation(line: 30, column: 19, scope: !20)
!33 = !DILocation(line: 30, column: 17, scope: !20)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 9)
!36 = !DILocation(line: 32, column: 14, scope: !35)
!37 = !DILocation(line: 32, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 32, column: 9)
!39 = !DILocation(line: 32, column: 25, scope: !38)
!40 = !DILocation(line: 32, column: 23, scope: !38)
!41 = !DILocation(line: 32, column: 9, scope: !35)
!42 = !DILocation(line: 34, column: 23, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !10, line: 33, column: 9)
!44 = !DILocation(line: 34, column: 28, scope: !43)
!45 = !DILocation(line: 34, column: 18, scope: !43)
!46 = !DILocation(line: 34, column: 13, scope: !43)
!47 = !DILocation(line: 34, column: 21, scope: !43)
!48 = !DILocation(line: 35, column: 9, scope: !43)
!49 = !DILocation(line: 32, column: 35, scope: !38)
!50 = !DILocation(line: 32, column: 9, scope: !38)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 35, column: 9, scope: !35)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 36, column: 9, scope: !20)
!55 = !DILocation(line: 36, column: 20, scope: !20)
!56 = !DILocation(line: 37, column: 20, scope: !20)
!57 = !DILocation(line: 37, column: 9, scope: !20)
!58 = !DILocation(line: 39, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_51b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !10, line: 46, type: !13)
!61 = !DILocation(line: 46, column: 95, scope: !59)
!62 = !DILocalVariable(name: "dest", scope: !63, file: !10, line: 49, type: !21)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 48, column: 5)
!64 = !DILocation(line: 49, column: 17, scope: !63)
!65 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 50, type: !26)
!66 = !DILocation(line: 50, column: 16, scope: !63)
!67 = !DILocalVariable(name: "dataLen", scope: !63, file: !10, line: 50, type: !26)
!68 = !DILocation(line: 50, column: 19, scope: !63)
!69 = !DILocation(line: 51, column: 26, scope: !63)
!70 = !DILocation(line: 51, column: 19, scope: !63)
!71 = !DILocation(line: 51, column: 17, scope: !63)
!72 = !DILocation(line: 53, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !63, file: !10, line: 53, column: 9)
!74 = !DILocation(line: 53, column: 14, scope: !73)
!75 = !DILocation(line: 53, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 53, column: 9)
!77 = !DILocation(line: 53, column: 25, scope: !76)
!78 = !DILocation(line: 53, column: 23, scope: !76)
!79 = !DILocation(line: 53, column: 9, scope: !73)
!80 = !DILocation(line: 55, column: 23, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !10, line: 54, column: 9)
!82 = !DILocation(line: 55, column: 28, scope: !81)
!83 = !DILocation(line: 55, column: 18, scope: !81)
!84 = !DILocation(line: 55, column: 13, scope: !81)
!85 = !DILocation(line: 55, column: 21, scope: !81)
!86 = !DILocation(line: 56, column: 9, scope: !81)
!87 = !DILocation(line: 53, column: 35, scope: !76)
!88 = !DILocation(line: 53, column: 9, scope: !76)
!89 = distinct !{!89, !79, !90, !53}
!90 = !DILocation(line: 56, column: 9, scope: !73)
!91 = !DILocation(line: 57, column: 9, scope: !63)
!92 = !DILocation(line: 57, column: 20, scope: !63)
!93 = !DILocation(line: 58, column: 20, scope: !63)
!94 = !DILocation(line: 58, column: 9, scope: !63)
!95 = !DILocation(line: 60, column: 1, scope: !59)
