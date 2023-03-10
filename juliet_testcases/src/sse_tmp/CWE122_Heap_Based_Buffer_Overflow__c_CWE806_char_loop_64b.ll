; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
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
  %call = call i64 @strlen(i8* %5) #6, !dbg !42
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
  %14 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* %14) #7, !dbg !69
  ret void, !dbg !70
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !71 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !76
  %1 = bitcast i8* %0 to i8**, !dbg !77
  store i8** %1, i8*** %dataPtr, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !80
  %3 = load i8*, i8** %2, align 8, !dbg !81
  store i8* %3, i8** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !87, metadata !DIExpression()), !dbg !88
  %5 = load i8*, i8** %data, align 8, !dbg !89
  %call = call i64 @strlen(i8* %5) #6, !dbg !90
  store i64 %call, i64* %dataLen, align 8, !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !95
  %7 = load i64, i64* %dataLen, align 8, !dbg !97
  %cmp = icmp ult i64 %6, %7, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !100
  %9 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !100
  %10 = load i8, i8* %arrayidx, align 1, !dbg !100
  %11 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !104
  store i8 %10, i8* %arrayidx1, align 1, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %12, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !111
  store i8 0, i8* %arrayidx2, align 1, !dbg !112
  %13 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %13), !dbg !114
  %14 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %14) #7, !dbg !116
  ret void, !dbg !117
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 23, type: !17)
!19 = !DILocation(line: 23, column: 79, scope: !13)
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
!68 = !DILocation(line: 40, column: 14, scope: !29)
!69 = !DILocation(line: 40, column: 9, scope: !29)
!70 = !DILocation(line: 42, column: 1, scope: !13)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_64b_goodG2BSink", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !71, file: !14, line: 49, type: !17)
!73 = !DILocation(line: 49, column: 83, scope: !71)
!74 = !DILocalVariable(name: "dataPtr", scope: !71, file: !14, line: 52, type: !4)
!75 = !DILocation(line: 52, column: 14, scope: !71)
!76 = !DILocation(line: 52, column: 34, scope: !71)
!77 = !DILocation(line: 52, column: 24, scope: !71)
!78 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 54, type: !5)
!79 = !DILocation(line: 54, column: 12, scope: !71)
!80 = !DILocation(line: 54, column: 21, scope: !71)
!81 = !DILocation(line: 54, column: 20, scope: !71)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !14, line: 56, type: !30)
!83 = distinct !DILexicalBlock(scope: !71, file: !14, line: 55, column: 5)
!84 = !DILocation(line: 56, column: 14, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !83, file: !14, line: 57, type: !35)
!86 = !DILocation(line: 57, column: 16, scope: !83)
!87 = !DILocalVariable(name: "dataLen", scope: !83, file: !14, line: 57, type: !35)
!88 = !DILocation(line: 57, column: 19, scope: !83)
!89 = !DILocation(line: 58, column: 26, scope: !83)
!90 = !DILocation(line: 58, column: 19, scope: !83)
!91 = !DILocation(line: 58, column: 17, scope: !83)
!92 = !DILocation(line: 60, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !14, line: 60, column: 9)
!94 = !DILocation(line: 60, column: 14, scope: !93)
!95 = !DILocation(line: 60, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !14, line: 60, column: 9)
!97 = !DILocation(line: 60, column: 25, scope: !96)
!98 = !DILocation(line: 60, column: 23, scope: !96)
!99 = !DILocation(line: 60, column: 9, scope: !93)
!100 = !DILocation(line: 62, column: 23, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !14, line: 61, column: 9)
!102 = !DILocation(line: 62, column: 28, scope: !101)
!103 = !DILocation(line: 62, column: 18, scope: !101)
!104 = !DILocation(line: 62, column: 13, scope: !101)
!105 = !DILocation(line: 62, column: 21, scope: !101)
!106 = !DILocation(line: 63, column: 9, scope: !101)
!107 = !DILocation(line: 60, column: 35, scope: !96)
!108 = !DILocation(line: 60, column: 9, scope: !96)
!109 = distinct !{!109, !99, !110, !63}
!110 = !DILocation(line: 63, column: 9, scope: !93)
!111 = !DILocation(line: 64, column: 9, scope: !83)
!112 = !DILocation(line: 64, column: 20, scope: !83)
!113 = !DILocation(line: 65, column: 19, scope: !83)
!114 = !DILocation(line: 65, column: 9, scope: !83)
!115 = !DILocation(line: 66, column: 14, scope: !83)
!116 = !DILocation(line: 66, column: 9, scope: !83)
!117 = !DILocation(line: 68, column: 1, scope: !71)
