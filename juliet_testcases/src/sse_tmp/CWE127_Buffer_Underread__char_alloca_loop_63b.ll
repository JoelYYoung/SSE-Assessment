; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !43
  %5 = load i8, i8* %arrayidx1, align 1, !dbg !43
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !47
  store i8 %5, i8* %arrayidx2, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %7, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx3, align 1, !dbg !56
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @printLine(i8* %arraydecay4), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !60 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !65
  %1 = load i8*, i8** %0, align 8, !dbg !66
  store i8* %1, i8** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !67, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !72
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  store i64 0, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !78
  %cmp = icmp ult i64 %2, 100, !dbg !80
  br i1 %cmp, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !82
  %4 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !82
  %5 = load i8, i8* %arrayidx1, align 1, !dbg !82
  %6 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !86
  store i8 %5, i8* %arrayidx2, align 1, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !89
  %inc = add i64 %7, 1, !dbg !89
  store i64 %inc, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx3, align 1, !dbg !94
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @printLine(i8* %arraydecay4), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 69, scope: !9)
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
!28 = !DILocalVariable(name: "dest", scope: !23, file: !10, line: 28, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 28, column: 14, scope: !23)
!33 = !DILocation(line: 29, column: 9, scope: !23)
!34 = !DILocation(line: 30, column: 9, scope: !23)
!35 = !DILocation(line: 30, column: 21, scope: !23)
!36 = !DILocation(line: 32, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !10, line: 32, column: 9)
!38 = !DILocation(line: 32, column: 14, scope: !37)
!39 = !DILocation(line: 32, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 32, column: 9)
!41 = !DILocation(line: 32, column: 23, scope: !40)
!42 = !DILocation(line: 32, column: 9, scope: !37)
!43 = !DILocation(line: 34, column: 23, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 33, column: 9)
!45 = !DILocation(line: 34, column: 28, scope: !44)
!46 = !DILocation(line: 34, column: 18, scope: !44)
!47 = !DILocation(line: 34, column: 13, scope: !44)
!48 = !DILocation(line: 34, column: 21, scope: !44)
!49 = !DILocation(line: 35, column: 9, scope: !44)
!50 = !DILocation(line: 32, column: 31, scope: !40)
!51 = !DILocation(line: 32, column: 9, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 35, column: 9, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 37, column: 9, scope: !23)
!56 = !DILocation(line: 37, column: 21, scope: !23)
!57 = !DILocation(line: 38, column: 19, scope: !23)
!58 = !DILocation(line: 38, column: 9, scope: !23)
!59 = !DILocation(line: 40, column: 1, scope: !9)
!60 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_63b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !60, file: !10, line: 47, type: !13)
!62 = !DILocation(line: 47, column: 73, scope: !60)
!63 = !DILocalVariable(name: "data", scope: !60, file: !10, line: 49, type: !14)
!64 = !DILocation(line: 49, column: 12, scope: !60)
!65 = !DILocation(line: 49, column: 20, scope: !60)
!66 = !DILocation(line: 49, column: 19, scope: !60)
!67 = !DILocalVariable(name: "i", scope: !68, file: !10, line: 51, type: !24)
!68 = distinct !DILexicalBlock(scope: !60, file: !10, line: 50, column: 5)
!69 = !DILocation(line: 51, column: 16, scope: !68)
!70 = !DILocalVariable(name: "dest", scope: !68, file: !10, line: 52, type: !29)
!71 = !DILocation(line: 52, column: 14, scope: !68)
!72 = !DILocation(line: 53, column: 9, scope: !68)
!73 = !DILocation(line: 54, column: 9, scope: !68)
!74 = !DILocation(line: 54, column: 21, scope: !68)
!75 = !DILocation(line: 56, column: 16, scope: !76)
!76 = distinct !DILexicalBlock(scope: !68, file: !10, line: 56, column: 9)
!77 = !DILocation(line: 56, column: 14, scope: !76)
!78 = !DILocation(line: 56, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !10, line: 56, column: 9)
!80 = !DILocation(line: 56, column: 23, scope: !79)
!81 = !DILocation(line: 56, column: 9, scope: !76)
!82 = !DILocation(line: 58, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !10, line: 57, column: 9)
!84 = !DILocation(line: 58, column: 28, scope: !83)
!85 = !DILocation(line: 58, column: 18, scope: !83)
!86 = !DILocation(line: 58, column: 13, scope: !83)
!87 = !DILocation(line: 58, column: 21, scope: !83)
!88 = !DILocation(line: 59, column: 9, scope: !83)
!89 = !DILocation(line: 56, column: 31, scope: !79)
!90 = !DILocation(line: 56, column: 9, scope: !79)
!91 = distinct !{!91, !81, !92, !54}
!92 = !DILocation(line: 59, column: 9, scope: !76)
!93 = !DILocation(line: 61, column: 9, scope: !68)
!94 = !DILocation(line: 61, column: 21, scope: !68)
!95 = !DILocation(line: 62, column: 19, scope: !68)
!96 = !DILocation(line: 62, column: 9, scope: !68)
!97 = !DILocation(line: 64, column: 1, scope: !60)
