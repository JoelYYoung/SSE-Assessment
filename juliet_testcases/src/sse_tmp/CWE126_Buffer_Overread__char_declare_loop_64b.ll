; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
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
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !45
  store i64 %call, i64* %destLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !50
  %5 = load i64, i64* %destLen, align 8, !dbg !52
  %cmp = icmp ult i64 %4, %5, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !55
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !55
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !55
  %9 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !59
  store i8 %8, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !67
  store i8 0, i8* %arrayidx4, align 1, !dbg !68
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !69
  call void @printLine(i8* %arraydecay5), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !72 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !77
  %1 = bitcast i8* %0 to i8**, !dbg !78
  store i8** %1, i8*** %dataPtr, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !81
  %3 = load i8*, i8** %2, align 8, !dbg !82
  store i8* %3, i8** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !90
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !93
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !94
  store i64 %call, i64* %destLen, align 8, !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !99
  %5 = load i64, i64* %destLen, align 8, !dbg !101
  %cmp = icmp ult i64 %4, %5, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !104
  %7 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !104
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !104
  %9 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !108
  store i8 %8, i8* %arrayidx3, align 1, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !111
  %inc = add i64 %10, 1, !dbg !111
  store i64 %inc, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx4, align 1, !dbg !116
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  call void @printLine(i8* %arraydecay5), !dbg !118
  ret void, !dbg !119
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_64b_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 23, type: !17)
!19 = !DILocation(line: 23, column: 67, scope: !13)
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
!34 = !DILocalVariable(name: "destLen", scope: !29, file: !14, line: 30, type: !30)
!35 = !DILocation(line: 30, column: 19, scope: !29)
!36 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 31, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 31, column: 14, scope: !29)
!41 = !DILocation(line: 32, column: 9, scope: !29)
!42 = !DILocation(line: 33, column: 9, scope: !29)
!43 = !DILocation(line: 33, column: 21, scope: !29)
!44 = !DILocation(line: 34, column: 26, scope: !29)
!45 = !DILocation(line: 34, column: 19, scope: !29)
!46 = !DILocation(line: 34, column: 17, scope: !29)
!47 = !DILocation(line: 37, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !29, file: !14, line: 37, column: 9)
!49 = !DILocation(line: 37, column: 14, scope: !48)
!50 = !DILocation(line: 37, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !14, line: 37, column: 9)
!52 = !DILocation(line: 37, column: 25, scope: !51)
!53 = !DILocation(line: 37, column: 23, scope: !51)
!54 = !DILocation(line: 37, column: 9, scope: !48)
!55 = !DILocation(line: 39, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !14, line: 38, column: 9)
!57 = !DILocation(line: 39, column: 28, scope: !56)
!58 = !DILocation(line: 39, column: 18, scope: !56)
!59 = !DILocation(line: 39, column: 13, scope: !56)
!60 = !DILocation(line: 39, column: 21, scope: !56)
!61 = !DILocation(line: 40, column: 9, scope: !56)
!62 = !DILocation(line: 37, column: 35, scope: !51)
!63 = !DILocation(line: 37, column: 9, scope: !51)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 40, column: 9, scope: !48)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 41, column: 9, scope: !29)
!68 = !DILocation(line: 41, column: 21, scope: !29)
!69 = !DILocation(line: 42, column: 19, scope: !29)
!70 = !DILocation(line: 42, column: 9, scope: !29)
!71 = !DILocation(line: 44, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_64b_goodG2BSink", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !72, file: !14, line: 51, type: !17)
!74 = !DILocation(line: 51, column: 71, scope: !72)
!75 = !DILocalVariable(name: "dataPtr", scope: !72, file: !14, line: 54, type: !4)
!76 = !DILocation(line: 54, column: 14, scope: !72)
!77 = !DILocation(line: 54, column: 34, scope: !72)
!78 = !DILocation(line: 54, column: 24, scope: !72)
!79 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 56, type: !5)
!80 = !DILocation(line: 56, column: 12, scope: !72)
!81 = !DILocation(line: 56, column: 21, scope: !72)
!82 = !DILocation(line: 56, column: 20, scope: !72)
!83 = !DILocalVariable(name: "i", scope: !84, file: !14, line: 58, type: !30)
!84 = distinct !DILexicalBlock(scope: !72, file: !14, line: 57, column: 5)
!85 = !DILocation(line: 58, column: 16, scope: !84)
!86 = !DILocalVariable(name: "destLen", scope: !84, file: !14, line: 58, type: !30)
!87 = !DILocation(line: 58, column: 19, scope: !84)
!88 = !DILocalVariable(name: "dest", scope: !84, file: !14, line: 59, type: !37)
!89 = !DILocation(line: 59, column: 14, scope: !84)
!90 = !DILocation(line: 60, column: 9, scope: !84)
!91 = !DILocation(line: 61, column: 9, scope: !84)
!92 = !DILocation(line: 61, column: 21, scope: !84)
!93 = !DILocation(line: 62, column: 26, scope: !84)
!94 = !DILocation(line: 62, column: 19, scope: !84)
!95 = !DILocation(line: 62, column: 17, scope: !84)
!96 = !DILocation(line: 65, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !84, file: !14, line: 65, column: 9)
!98 = !DILocation(line: 65, column: 14, scope: !97)
!99 = !DILocation(line: 65, column: 21, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !14, line: 65, column: 9)
!101 = !DILocation(line: 65, column: 25, scope: !100)
!102 = !DILocation(line: 65, column: 23, scope: !100)
!103 = !DILocation(line: 65, column: 9, scope: !97)
!104 = !DILocation(line: 67, column: 23, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !14, line: 66, column: 9)
!106 = !DILocation(line: 67, column: 28, scope: !105)
!107 = !DILocation(line: 67, column: 18, scope: !105)
!108 = !DILocation(line: 67, column: 13, scope: !105)
!109 = !DILocation(line: 67, column: 21, scope: !105)
!110 = !DILocation(line: 68, column: 9, scope: !105)
!111 = !DILocation(line: 65, column: 35, scope: !100)
!112 = !DILocation(line: 65, column: 9, scope: !100)
!113 = distinct !{!113, !103, !114, !66}
!114 = !DILocation(line: 68, column: 9, scope: !97)
!115 = !DILocation(line: 69, column: 9, scope: !84)
!116 = !DILocation(line: 69, column: 21, scope: !84)
!117 = !DILocation(line: 70, column: 19, scope: !84)
!118 = !DILocation(line: 70, column: 9, scope: !84)
!119 = !DILocation(line: 72, column: 1, scope: !72)
