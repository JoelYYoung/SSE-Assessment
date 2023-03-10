; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
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
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !39
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
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !66 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !71
  %1 = load i8*, i8** %0, align 8, !dbg !72
  store i8* %1, i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !84
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
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !94
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !94
  %7 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !98
  store i8 %6, i8* %arrayidx3, align 1, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %8, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay5), !dbg !108
  ret void, !dbg !109
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = !DILocation(line: 41, column: 1, scope: !9)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_63b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !66, file: !10, line: 48, type: !13)
!68 = !DILocation(line: 48, column: 72, scope: !66)
!69 = !DILocalVariable(name: "data", scope: !66, file: !10, line: 50, type: !14)
!70 = !DILocation(line: 50, column: 12, scope: !66)
!71 = !DILocation(line: 50, column: 20, scope: !66)
!72 = !DILocation(line: 50, column: 19, scope: !66)
!73 = !DILocalVariable(name: "i", scope: !74, file: !10, line: 52, type: !24)
!74 = distinct !DILexicalBlock(scope: !66, file: !10, line: 51, column: 5)
!75 = !DILocation(line: 52, column: 16, scope: !74)
!76 = !DILocalVariable(name: "destLen", scope: !74, file: !10, line: 52, type: !24)
!77 = !DILocation(line: 52, column: 19, scope: !74)
!78 = !DILocalVariable(name: "dest", scope: !74, file: !10, line: 53, type: !31)
!79 = !DILocation(line: 53, column: 14, scope: !74)
!80 = !DILocation(line: 54, column: 9, scope: !74)
!81 = !DILocation(line: 55, column: 9, scope: !74)
!82 = !DILocation(line: 55, column: 21, scope: !74)
!83 = !DILocation(line: 56, column: 26, scope: !74)
!84 = !DILocation(line: 56, column: 19, scope: !74)
!85 = !DILocation(line: 56, column: 17, scope: !74)
!86 = !DILocation(line: 59, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !74, file: !10, line: 59, column: 9)
!88 = !DILocation(line: 59, column: 14, scope: !87)
!89 = !DILocation(line: 59, column: 21, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !10, line: 59, column: 9)
!91 = !DILocation(line: 59, column: 25, scope: !90)
!92 = !DILocation(line: 59, column: 23, scope: !90)
!93 = !DILocation(line: 59, column: 9, scope: !87)
!94 = !DILocation(line: 61, column: 23, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !10, line: 60, column: 9)
!96 = !DILocation(line: 61, column: 28, scope: !95)
!97 = !DILocation(line: 61, column: 18, scope: !95)
!98 = !DILocation(line: 61, column: 13, scope: !95)
!99 = !DILocation(line: 61, column: 21, scope: !95)
!100 = !DILocation(line: 62, column: 9, scope: !95)
!101 = !DILocation(line: 59, column: 35, scope: !90)
!102 = !DILocation(line: 59, column: 9, scope: !90)
!103 = distinct !{!103, !93, !104, !60}
!104 = !DILocation(line: 62, column: 9, scope: !87)
!105 = !DILocation(line: 63, column: 9, scope: !74)
!106 = !DILocation(line: 63, column: 21, scope: !74)
!107 = !DILocation(line: 64, column: 19, scope: !74)
!108 = !DILocation(line: 64, column: 9, scope: !74)
!109 = !DILocation(line: 66, column: 1, scope: !66)
