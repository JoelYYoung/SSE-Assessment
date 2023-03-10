; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !34
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !35
  store i8 0, i8* %arrayidx1, align 1, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !38
  store i64 %call, i64* %destLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %3 = load i64, i64* %destLen, align 8, !dbg !45
  %cmp = icmp ult i64 %2, %3, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %5 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !48
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !48
  %7 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !52
  store i8 %6, i8* %arrayidx4, align 1, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %8, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx5, align 1, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay6), !dbg !63
  %9 = load i8*, i8** %data, align 8, !dbg !64
  call void @free(i8* %9) #7, !dbg !65
  ret void, !dbg !66
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_66b_goodG2BSink(i8** %dataArray) #0 !dbg !67 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !72
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !72
  store i8* %1, i8** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !80
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx1, align 1, !dbg !82
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !84
  store i64 %call, i64* %destLen, align 8, !dbg !85
  store i64 0, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !89
  %3 = load i64, i64* %destLen, align 8, !dbg !91
  %cmp = icmp ult i64 %2, %3, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %5 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !94
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !94
  %7 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !98
  store i8 %6, i8* %arrayidx4, align 1, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %8, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx5, align 1, !dbg !106
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay6), !dbg !108
  %9 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* %9) #7, !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 66, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!19 = !DILocation(line: 26, column: 12, scope: !9)
!20 = !DILocation(line: 26, column: 19, scope: !9)
!21 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 28, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !25)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 28, column: 16, scope: !22)
!27 = !DILocalVariable(name: "destLen", scope: !22, file: !10, line: 28, type: !23)
!28 = !DILocation(line: 28, column: 19, scope: !22)
!29 = !DILocalVariable(name: "dest", scope: !22, file: !10, line: 29, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 29, column: 14, scope: !22)
!34 = !DILocation(line: 30, column: 9, scope: !22)
!35 = !DILocation(line: 31, column: 9, scope: !22)
!36 = !DILocation(line: 31, column: 21, scope: !22)
!37 = !DILocation(line: 32, column: 26, scope: !22)
!38 = !DILocation(line: 32, column: 19, scope: !22)
!39 = !DILocation(line: 32, column: 17, scope: !22)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !22, file: !10, line: 35, column: 9)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocation(line: 35, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 35, column: 9)
!45 = !DILocation(line: 35, column: 25, scope: !44)
!46 = !DILocation(line: 35, column: 23, scope: !44)
!47 = !DILocation(line: 35, column: 9, scope: !41)
!48 = !DILocation(line: 37, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !10, line: 36, column: 9)
!50 = !DILocation(line: 37, column: 28, scope: !49)
!51 = !DILocation(line: 37, column: 18, scope: !49)
!52 = !DILocation(line: 37, column: 13, scope: !49)
!53 = !DILocation(line: 37, column: 21, scope: !49)
!54 = !DILocation(line: 38, column: 9, scope: !49)
!55 = !DILocation(line: 35, column: 35, scope: !44)
!56 = !DILocation(line: 35, column: 9, scope: !44)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 38, column: 9, scope: !41)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 39, column: 9, scope: !22)
!61 = !DILocation(line: 39, column: 21, scope: !22)
!62 = !DILocation(line: 40, column: 19, scope: !22)
!63 = !DILocation(line: 40, column: 9, scope: !22)
!64 = !DILocation(line: 41, column: 14, scope: !22)
!65 = !DILocation(line: 41, column: 9, scope: !22)
!66 = !DILocation(line: 43, column: 1, scope: !9)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_66b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "dataArray", arg: 1, scope: !67, file: !10, line: 50, type: !13)
!69 = !DILocation(line: 50, column: 70, scope: !67)
!70 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 52, type: !14)
!71 = !DILocation(line: 52, column: 12, scope: !67)
!72 = !DILocation(line: 52, column: 19, scope: !67)
!73 = !DILocalVariable(name: "i", scope: !74, file: !10, line: 54, type: !23)
!74 = distinct !DILexicalBlock(scope: !67, file: !10, line: 53, column: 5)
!75 = !DILocation(line: 54, column: 16, scope: !74)
!76 = !DILocalVariable(name: "destLen", scope: !74, file: !10, line: 54, type: !23)
!77 = !DILocation(line: 54, column: 19, scope: !74)
!78 = !DILocalVariable(name: "dest", scope: !74, file: !10, line: 55, type: !30)
!79 = !DILocation(line: 55, column: 14, scope: !74)
!80 = !DILocation(line: 56, column: 9, scope: !74)
!81 = !DILocation(line: 57, column: 9, scope: !74)
!82 = !DILocation(line: 57, column: 21, scope: !74)
!83 = !DILocation(line: 58, column: 26, scope: !74)
!84 = !DILocation(line: 58, column: 19, scope: !74)
!85 = !DILocation(line: 58, column: 17, scope: !74)
!86 = !DILocation(line: 61, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !74, file: !10, line: 61, column: 9)
!88 = !DILocation(line: 61, column: 14, scope: !87)
!89 = !DILocation(line: 61, column: 21, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !10, line: 61, column: 9)
!91 = !DILocation(line: 61, column: 25, scope: !90)
!92 = !DILocation(line: 61, column: 23, scope: !90)
!93 = !DILocation(line: 61, column: 9, scope: !87)
!94 = !DILocation(line: 63, column: 23, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !10, line: 62, column: 9)
!96 = !DILocation(line: 63, column: 28, scope: !95)
!97 = !DILocation(line: 63, column: 18, scope: !95)
!98 = !DILocation(line: 63, column: 13, scope: !95)
!99 = !DILocation(line: 63, column: 21, scope: !95)
!100 = !DILocation(line: 64, column: 9, scope: !95)
!101 = !DILocation(line: 61, column: 35, scope: !90)
!102 = !DILocation(line: 61, column: 9, scope: !90)
!103 = distinct !{!103, !93, !104, !59}
!104 = !DILocation(line: 64, column: 9, scope: !87)
!105 = !DILocation(line: 65, column: 9, scope: !74)
!106 = !DILocation(line: 65, column: 21, scope: !74)
!107 = !DILocation(line: 66, column: 19, scope: !74)
!108 = !DILocation(line: 66, column: 9, scope: !74)
!109 = !DILocation(line: 67, column: 14, scope: !74)
!110 = !DILocation(line: 67, column: 9, scope: !74)
!111 = !DILocation(line: 69, column: 1, scope: !67)
