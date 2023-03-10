; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !33, metadata !DIExpression()), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i64 @strlen(i8* %3) #5, !dbg !36
  store i64 %call, i64* %dataLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !41
  %5 = load i64, i64* %dataLen, align 8, !dbg !43
  %cmp = icmp ult i64 %4, %5, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !46
  %8 = load i8, i8* %arrayidx, align 1, !dbg !46
  %9 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !50
  store i8 %8, i8* %arrayidx1, align 1, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %10, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !58
  store i8 0, i8* %arrayidx2, align 1, !dbg !59
  %11 = load i8*, i8** %data, align 8, !dbg !60
  call void @printLine(i8* %11), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !63 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !68
  %1 = load i8*, i8** %0, align 8, !dbg !69
  store i8* %1, i8** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !70, metadata !DIExpression()), !dbg !72
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !75, metadata !DIExpression()), !dbg !76
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %call = call i64 @strlen(i8* %3) #5, !dbg !78
  store i64 %call, i64* %dataLen, align 8, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !83
  %5 = load i64, i64* %dataLen, align 8, !dbg !85
  %cmp = icmp ult i64 %4, %5, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !88
  %7 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !88
  %8 = load i8, i8* %arrayidx, align 1, !dbg !88
  %9 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !92
  store i8 %8, i8* %arrayidx1, align 1, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %10, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %11 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %11), !dbg !102
  ret void, !dbg !103
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 87, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!19 = !DILocation(line: 25, column: 12, scope: !9)
!20 = !DILocation(line: 25, column: 20, scope: !9)
!21 = !DILocation(line: 25, column: 19, scope: !9)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !10, line: 27, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 27, column: 14, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !23, file: !10, line: 28, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 28, column: 16, scope: !23)
!33 = !DILocalVariable(name: "dataLen", scope: !23, file: !10, line: 28, type: !29)
!34 = !DILocation(line: 28, column: 19, scope: !23)
!35 = !DILocation(line: 29, column: 26, scope: !23)
!36 = !DILocation(line: 29, column: 19, scope: !23)
!37 = !DILocation(line: 29, column: 17, scope: !23)
!38 = !DILocation(line: 31, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !23, file: !10, line: 31, column: 9)
!40 = !DILocation(line: 31, column: 14, scope: !39)
!41 = !DILocation(line: 31, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 31, column: 9)
!43 = !DILocation(line: 31, column: 25, scope: !42)
!44 = !DILocation(line: 31, column: 23, scope: !42)
!45 = !DILocation(line: 31, column: 9, scope: !39)
!46 = !DILocation(line: 33, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !10, line: 32, column: 9)
!48 = !DILocation(line: 33, column: 28, scope: !47)
!49 = !DILocation(line: 33, column: 18, scope: !47)
!50 = !DILocation(line: 33, column: 13, scope: !47)
!51 = !DILocation(line: 33, column: 21, scope: !47)
!52 = !DILocation(line: 34, column: 9, scope: !47)
!53 = !DILocation(line: 31, column: 35, scope: !42)
!54 = !DILocation(line: 31, column: 9, scope: !42)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 34, column: 9, scope: !39)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 35, column: 9, scope: !23)
!59 = !DILocation(line: 35, column: 20, scope: !23)
!60 = !DILocation(line: 36, column: 19, scope: !23)
!61 = !DILocation(line: 36, column: 9, scope: !23)
!62 = !DILocation(line: 38, column: 1, scope: !9)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_63b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !63, file: !10, line: 45, type: !13)
!65 = !DILocation(line: 45, column: 91, scope: !63)
!66 = !DILocalVariable(name: "data", scope: !63, file: !10, line: 47, type: !14)
!67 = !DILocation(line: 47, column: 12, scope: !63)
!68 = !DILocation(line: 47, column: 20, scope: !63)
!69 = !DILocation(line: 47, column: 19, scope: !63)
!70 = !DILocalVariable(name: "dest", scope: !71, file: !10, line: 49, type: !24)
!71 = distinct !DILexicalBlock(scope: !63, file: !10, line: 48, column: 5)
!72 = !DILocation(line: 49, column: 14, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 50, type: !29)
!74 = !DILocation(line: 50, column: 16, scope: !71)
!75 = !DILocalVariable(name: "dataLen", scope: !71, file: !10, line: 50, type: !29)
!76 = !DILocation(line: 50, column: 19, scope: !71)
!77 = !DILocation(line: 51, column: 26, scope: !71)
!78 = !DILocation(line: 51, column: 19, scope: !71)
!79 = !DILocation(line: 51, column: 17, scope: !71)
!80 = !DILocation(line: 53, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !10, line: 53, column: 9)
!82 = !DILocation(line: 53, column: 14, scope: !81)
!83 = !DILocation(line: 53, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 53, column: 9)
!85 = !DILocation(line: 53, column: 25, scope: !84)
!86 = !DILocation(line: 53, column: 23, scope: !84)
!87 = !DILocation(line: 53, column: 9, scope: !81)
!88 = !DILocation(line: 55, column: 23, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !10, line: 54, column: 9)
!90 = !DILocation(line: 55, column: 28, scope: !89)
!91 = !DILocation(line: 55, column: 18, scope: !89)
!92 = !DILocation(line: 55, column: 13, scope: !89)
!93 = !DILocation(line: 55, column: 21, scope: !89)
!94 = !DILocation(line: 56, column: 9, scope: !89)
!95 = !DILocation(line: 53, column: 35, scope: !84)
!96 = !DILocation(line: 53, column: 9, scope: !84)
!97 = distinct !{!97, !87, !98, !57}
!98 = !DILocation(line: 56, column: 9, scope: !81)
!99 = !DILocation(line: 57, column: 9, scope: !71)
!100 = !DILocation(line: 57, column: 20, scope: !71)
!101 = !DILocation(line: 58, column: 19, scope: !71)
!102 = !DILocation(line: 58, column: 9, scope: !71)
!103 = !DILocation(line: 60, column: 1, scope: !63)
