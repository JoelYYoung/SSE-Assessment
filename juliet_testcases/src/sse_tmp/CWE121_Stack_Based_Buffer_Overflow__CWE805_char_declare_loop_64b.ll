; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i8**, !dbg !23
  store i8** %1, i8*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !26
  %3 = load i8*, i8** %2, align 8, !dbg !27
  store i8* %3, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %4, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !51
  %6 = load i8, i8* %arrayidx1, align 1, !dbg !51
  %7 = load i8*, i8** %data, align 8, !dbg !52
  %8 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !52
  store i8 %6, i8* %arrayidx2, align 1, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %9, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !61
  store i8 0, i8* %arrayidx3, align 1, !dbg !62
  %11 = load i8*, i8** %data, align 8, !dbg !63
  call void @printLine(i8* %11), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !66 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !71
  %1 = bitcast i8* %0 to i8**, !dbg !72
  store i8** %1, i8*** %dataPtr, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !75
  %3 = load i8*, i8** %2, align 8, !dbg !76
  store i8* %3, i8** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !82
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  store i64 0, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !88
  %cmp = icmp ult i64 %4, 100, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !94
  %6 = load i8, i8* %arrayidx1, align 1, !dbg !94
  %7 = load i8*, i8** %data, align 8, !dbg !95
  %8 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !95
  store i8 %6, i8* %arrayidx2, align 1, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %9, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !103
  store i8 0, i8* %arrayidx3, align 1, !dbg !104
  %11 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %11), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 23, type: !17)
!19 = !DILocation(line: 23, column: 86, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 14, scope: !13)
!22 = !DILocation(line: 26, column: 34, scope: !13)
!23 = !DILocation(line: 26, column: 24, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !5)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 21, scope: !13)
!27 = !DILocation(line: 28, column: 20, scope: !13)
!28 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 30, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 30, column: 16, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 31, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 31, column: 14, scope: !29)
!39 = !DILocation(line: 32, column: 9, scope: !29)
!40 = !DILocation(line: 33, column: 9, scope: !29)
!41 = !DILocation(line: 33, column: 23, scope: !29)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !29, file: !14, line: 35, column: 9)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocation(line: 35, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !14, line: 35, column: 9)
!47 = !DILocation(line: 35, column: 23, scope: !46)
!48 = !DILocation(line: 35, column: 9, scope: !43)
!49 = !DILocation(line: 37, column: 30, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !14, line: 36, column: 9)
!51 = !DILocation(line: 37, column: 23, scope: !50)
!52 = !DILocation(line: 37, column: 13, scope: !50)
!53 = !DILocation(line: 37, column: 18, scope: !50)
!54 = !DILocation(line: 37, column: 21, scope: !50)
!55 = !DILocation(line: 38, column: 9, scope: !50)
!56 = !DILocation(line: 35, column: 31, scope: !46)
!57 = !DILocation(line: 35, column: 9, scope: !46)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 38, column: 9, scope: !43)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 39, column: 9, scope: !29)
!62 = !DILocation(line: 39, column: 21, scope: !29)
!63 = !DILocation(line: 40, column: 19, scope: !29)
!64 = !DILocation(line: 40, column: 9, scope: !29)
!65 = !DILocation(line: 42, column: 1, scope: !13)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_64b_goodG2BSink", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !66, file: !14, line: 49, type: !17)
!68 = !DILocation(line: 49, column: 90, scope: !66)
!69 = !DILocalVariable(name: "dataPtr", scope: !66, file: !14, line: 52, type: !4)
!70 = !DILocation(line: 52, column: 14, scope: !66)
!71 = !DILocation(line: 52, column: 34, scope: !66)
!72 = !DILocation(line: 52, column: 24, scope: !66)
!73 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 54, type: !5)
!74 = !DILocation(line: 54, column: 12, scope: !66)
!75 = !DILocation(line: 54, column: 21, scope: !66)
!76 = !DILocation(line: 54, column: 20, scope: !66)
!77 = !DILocalVariable(name: "i", scope: !78, file: !14, line: 56, type: !30)
!78 = distinct !DILexicalBlock(scope: !66, file: !14, line: 55, column: 5)
!79 = !DILocation(line: 56, column: 16, scope: !78)
!80 = !DILocalVariable(name: "source", scope: !78, file: !14, line: 57, type: !35)
!81 = !DILocation(line: 57, column: 14, scope: !78)
!82 = !DILocation(line: 58, column: 9, scope: !78)
!83 = !DILocation(line: 59, column: 9, scope: !78)
!84 = !DILocation(line: 59, column: 23, scope: !78)
!85 = !DILocation(line: 61, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !14, line: 61, column: 9)
!87 = !DILocation(line: 61, column: 14, scope: !86)
!88 = !DILocation(line: 61, column: 21, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !14, line: 61, column: 9)
!90 = !DILocation(line: 61, column: 23, scope: !89)
!91 = !DILocation(line: 61, column: 9, scope: !86)
!92 = !DILocation(line: 63, column: 30, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !14, line: 62, column: 9)
!94 = !DILocation(line: 63, column: 23, scope: !93)
!95 = !DILocation(line: 63, column: 13, scope: !93)
!96 = !DILocation(line: 63, column: 18, scope: !93)
!97 = !DILocation(line: 63, column: 21, scope: !93)
!98 = !DILocation(line: 64, column: 9, scope: !93)
!99 = !DILocation(line: 61, column: 31, scope: !89)
!100 = !DILocation(line: 61, column: 9, scope: !89)
!101 = distinct !{!101, !91, !102, !60}
!102 = !DILocation(line: 64, column: 9, scope: !86)
!103 = !DILocation(line: 65, column: 9, scope: !78)
!104 = !DILocation(line: 65, column: 21, scope: !78)
!105 = !DILocation(line: 66, column: 19, scope: !78)
!106 = !DILocation(line: 66, column: 9, scope: !78)
!107 = !DILocation(line: 68, column: 1, scope: !66)
