; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
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
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %call = call i64 @strlen(i8* %5) #5, !dbg !42
  store i64 %call, i64* %dataLen, align 8, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !47
  %7 = load i64, i64* %dataLen, align 8, !dbg !49
  %cmp = icmp ult i64 %6, %7, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !52
  %9 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !52
  %10 = load i8, i8* %arrayidx, align 1, !dbg !52
  %11 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !56
  store i8 %10, i8* %arrayidx1, align 1, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %12, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !64
  store i8 0, i8* %arrayidx2, align 1, !dbg !65
  %13 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %13), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !69 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !74
  %1 = bitcast i8* %0 to i8**, !dbg !75
  store i8** %1, i8*** %dataPtr, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !78
  %3 = load i8*, i8** %2, align 8, !dbg !79
  store i8* %3, i8** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !85, metadata !DIExpression()), !dbg !86
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %call = call i64 @strlen(i8* %5) #5, !dbg !88
  store i64 %call, i64* %dataLen, align 8, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !93
  %7 = load i64, i64* %dataLen, align 8, !dbg !95
  %cmp = icmp ult i64 %6, %7, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !98
  %9 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !98
  %10 = load i8, i8* %arrayidx, align 1, !dbg !98
  %11 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !102
  store i8 %10, i8* %arrayidx1, align 1, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %12, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !109
  store i8 0, i8* %arrayidx2, align 1, !dbg !110
  %13 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %13), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 30, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 30, column: 14, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 31, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 31, column: 16, scope: !29)
!39 = !DILocalVariable(name: "dataLen", scope: !29, file: !14, line: 31, type: !35)
!40 = !DILocation(line: 31, column: 19, scope: !29)
!41 = !DILocation(line: 32, column: 26, scope: !29)
!42 = !DILocation(line: 32, column: 19, scope: !29)
!43 = !DILocation(line: 32, column: 17, scope: !29)
!44 = !DILocation(line: 34, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 9)
!46 = !DILocation(line: 34, column: 14, scope: !45)
!47 = !DILocation(line: 34, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !14, line: 34, column: 9)
!49 = !DILocation(line: 34, column: 25, scope: !48)
!50 = !DILocation(line: 34, column: 23, scope: !48)
!51 = !DILocation(line: 34, column: 9, scope: !45)
!52 = !DILocation(line: 36, column: 23, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !14, line: 35, column: 9)
!54 = !DILocation(line: 36, column: 28, scope: !53)
!55 = !DILocation(line: 36, column: 18, scope: !53)
!56 = !DILocation(line: 36, column: 13, scope: !53)
!57 = !DILocation(line: 36, column: 21, scope: !53)
!58 = !DILocation(line: 37, column: 9, scope: !53)
!59 = !DILocation(line: 34, column: 35, scope: !48)
!60 = !DILocation(line: 34, column: 9, scope: !48)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 37, column: 9, scope: !45)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 38, column: 9, scope: !29)
!65 = !DILocation(line: 38, column: 20, scope: !29)
!66 = !DILocation(line: 39, column: 19, scope: !29)
!67 = !DILocation(line: 39, column: 9, scope: !29)
!68 = !DILocation(line: 41, column: 1, scope: !13)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_64b_goodG2BSink", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !69, file: !14, line: 48, type: !17)
!71 = !DILocation(line: 48, column: 90, scope: !69)
!72 = !DILocalVariable(name: "dataPtr", scope: !69, file: !14, line: 51, type: !4)
!73 = !DILocation(line: 51, column: 14, scope: !69)
!74 = !DILocation(line: 51, column: 34, scope: !69)
!75 = !DILocation(line: 51, column: 24, scope: !69)
!76 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 53, type: !5)
!77 = !DILocation(line: 53, column: 12, scope: !69)
!78 = !DILocation(line: 53, column: 21, scope: !69)
!79 = !DILocation(line: 53, column: 20, scope: !69)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !14, line: 55, type: !30)
!81 = distinct !DILexicalBlock(scope: !69, file: !14, line: 54, column: 5)
!82 = !DILocation(line: 55, column: 14, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !81, file: !14, line: 56, type: !35)
!84 = !DILocation(line: 56, column: 16, scope: !81)
!85 = !DILocalVariable(name: "dataLen", scope: !81, file: !14, line: 56, type: !35)
!86 = !DILocation(line: 56, column: 19, scope: !81)
!87 = !DILocation(line: 57, column: 26, scope: !81)
!88 = !DILocation(line: 57, column: 19, scope: !81)
!89 = !DILocation(line: 57, column: 17, scope: !81)
!90 = !DILocation(line: 59, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !14, line: 59, column: 9)
!92 = !DILocation(line: 59, column: 14, scope: !91)
!93 = !DILocation(line: 59, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !14, line: 59, column: 9)
!95 = !DILocation(line: 59, column: 25, scope: !94)
!96 = !DILocation(line: 59, column: 23, scope: !94)
!97 = !DILocation(line: 59, column: 9, scope: !91)
!98 = !DILocation(line: 61, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !14, line: 60, column: 9)
!100 = !DILocation(line: 61, column: 28, scope: !99)
!101 = !DILocation(line: 61, column: 18, scope: !99)
!102 = !DILocation(line: 61, column: 13, scope: !99)
!103 = !DILocation(line: 61, column: 21, scope: !99)
!104 = !DILocation(line: 62, column: 9, scope: !99)
!105 = !DILocation(line: 59, column: 35, scope: !94)
!106 = !DILocation(line: 59, column: 9, scope: !94)
!107 = distinct !{!107, !97, !108, !63}
!108 = !DILocation(line: 62, column: 9, scope: !91)
!109 = !DILocation(line: 63, column: 9, scope: !81)
!110 = !DILocation(line: 63, column: 20, scope: !81)
!111 = !DILocation(line: 64, column: 19, scope: !81)
!112 = !DILocation(line: 64, column: 9, scope: !81)
!113 = !DILocation(line: 66, column: 1, scope: !69)
