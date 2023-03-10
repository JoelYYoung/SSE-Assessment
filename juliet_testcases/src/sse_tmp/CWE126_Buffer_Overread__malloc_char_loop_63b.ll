; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !39
  store i64 %call, i64* %destLen, align 8, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !44
  %3 = load i64, i64* %destLen, align 8, !dbg !46
  %cmp = icmp ult i64 %2, %3, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !49
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !49
  %7 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !53
  store i8 %6, i8* %arrayidx3, align 1, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %8, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx4, align 1, !dbg !62
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !63
  call void @printLine(i8* %arraydecay5), !dbg !64
  %9 = load i8*, i8** %data, align 8, !dbg !65
  call void @free(i8* %9) #7, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !68 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !73
  %1 = load i8*, i8** %0, align 8, !dbg !74
  store i8* %1, i8** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !82
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !86
  store i64 %call, i64* %destLen, align 8, !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !91
  %3 = load i64, i64* %destLen, align 8, !dbg !93
  %cmp = icmp ult i64 %2, %3, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data, align 8, !dbg !96
  %5 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !96
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !96
  %7 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !100
  store i8 %6, i8* %arrayidx3, align 1, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %8, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay5), !dbg !110
  %9 = load i8*, i8** %data, align 8, !dbg !111
  call void @free(i8* %9) #7, !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 68, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!19 = !DILocation(line: 25, column: 12, scope: !9)
!20 = !DILocation(line: 25, column: 20, scope: !9)
!21 = !DILocation(line: 25, column: 19, scope: !9)
!22 = !DILocalVariable(name: "i", scope: !23, file: !10, line: 27, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !25, line: 46, baseType: !26)
!25 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 27, column: 16, scope: !23)
!28 = !DILocalVariable(name: "destLen", scope: !23, file: !10, line: 27, type: !24)
!29 = !DILocation(line: 27, column: 19, scope: !23)
!30 = !DILocalVariable(name: "dest", scope: !23, file: !10, line: 28, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 28, column: 14, scope: !23)
!35 = !DILocation(line: 29, column: 9, scope: !23)
!36 = !DILocation(line: 30, column: 9, scope: !23)
!37 = !DILocation(line: 30, column: 21, scope: !23)
!38 = !DILocation(line: 31, column: 26, scope: !23)
!39 = !DILocation(line: 31, column: 19, scope: !23)
!40 = !DILocation(line: 31, column: 17, scope: !23)
!41 = !DILocation(line: 34, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !23, file: !10, line: 34, column: 9)
!43 = !DILocation(line: 34, column: 14, scope: !42)
!44 = !DILocation(line: 34, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !10, line: 34, column: 9)
!46 = !DILocation(line: 34, column: 25, scope: !45)
!47 = !DILocation(line: 34, column: 23, scope: !45)
!48 = !DILocation(line: 34, column: 9, scope: !42)
!49 = !DILocation(line: 36, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !10, line: 35, column: 9)
!51 = !DILocation(line: 36, column: 28, scope: !50)
!52 = !DILocation(line: 36, column: 18, scope: !50)
!53 = !DILocation(line: 36, column: 13, scope: !50)
!54 = !DILocation(line: 36, column: 21, scope: !50)
!55 = !DILocation(line: 37, column: 9, scope: !50)
!56 = !DILocation(line: 34, column: 35, scope: !45)
!57 = !DILocation(line: 34, column: 9, scope: !45)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 37, column: 9, scope: !42)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 38, column: 9, scope: !23)
!62 = !DILocation(line: 38, column: 21, scope: !23)
!63 = !DILocation(line: 39, column: 19, scope: !23)
!64 = !DILocation(line: 39, column: 9, scope: !23)
!65 = !DILocation(line: 40, column: 14, scope: !23)
!66 = !DILocation(line: 40, column: 9, scope: !23)
!67 = !DILocation(line: 42, column: 1, scope: !9)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_63b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !68, file: !10, line: 49, type: !13)
!70 = !DILocation(line: 49, column: 72, scope: !68)
!71 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 51, type: !14)
!72 = !DILocation(line: 51, column: 12, scope: !68)
!73 = !DILocation(line: 51, column: 20, scope: !68)
!74 = !DILocation(line: 51, column: 19, scope: !68)
!75 = !DILocalVariable(name: "i", scope: !76, file: !10, line: 53, type: !24)
!76 = distinct !DILexicalBlock(scope: !68, file: !10, line: 52, column: 5)
!77 = !DILocation(line: 53, column: 16, scope: !76)
!78 = !DILocalVariable(name: "destLen", scope: !76, file: !10, line: 53, type: !24)
!79 = !DILocation(line: 53, column: 19, scope: !76)
!80 = !DILocalVariable(name: "dest", scope: !76, file: !10, line: 54, type: !31)
!81 = !DILocation(line: 54, column: 14, scope: !76)
!82 = !DILocation(line: 55, column: 9, scope: !76)
!83 = !DILocation(line: 56, column: 9, scope: !76)
!84 = !DILocation(line: 56, column: 21, scope: !76)
!85 = !DILocation(line: 57, column: 26, scope: !76)
!86 = !DILocation(line: 57, column: 19, scope: !76)
!87 = !DILocation(line: 57, column: 17, scope: !76)
!88 = !DILocation(line: 60, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !76, file: !10, line: 60, column: 9)
!90 = !DILocation(line: 60, column: 14, scope: !89)
!91 = !DILocation(line: 60, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !10, line: 60, column: 9)
!93 = !DILocation(line: 60, column: 25, scope: !92)
!94 = !DILocation(line: 60, column: 23, scope: !92)
!95 = !DILocation(line: 60, column: 9, scope: !89)
!96 = !DILocation(line: 62, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !10, line: 61, column: 9)
!98 = !DILocation(line: 62, column: 28, scope: !97)
!99 = !DILocation(line: 62, column: 18, scope: !97)
!100 = !DILocation(line: 62, column: 13, scope: !97)
!101 = !DILocation(line: 62, column: 21, scope: !97)
!102 = !DILocation(line: 63, column: 9, scope: !97)
!103 = !DILocation(line: 60, column: 35, scope: !92)
!104 = !DILocation(line: 60, column: 9, scope: !92)
!105 = distinct !{!105, !95, !106, !60}
!106 = !DILocation(line: 63, column: 9, scope: !89)
!107 = !DILocation(line: 64, column: 9, scope: !76)
!108 = !DILocation(line: 64, column: 21, scope: !76)
!109 = !DILocation(line: 65, column: 19, scope: !76)
!110 = !DILocation(line: 65, column: 9, scope: !76)
!111 = !DILocation(line: 66, column: 14, scope: !76)
!112 = !DILocation(line: 66, column: 9, scope: !76)
!113 = !DILocation(line: 68, column: 1, scope: !68)
