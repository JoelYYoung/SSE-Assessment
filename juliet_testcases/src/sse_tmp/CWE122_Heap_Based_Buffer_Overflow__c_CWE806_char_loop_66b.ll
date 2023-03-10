; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !32, metadata !DIExpression()), !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %call = call i64 @strlen(i8* %3) #6, !dbg !35
  store i64 %call, i64* %dataLen, align 8, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !40
  %5 = load i64, i64* %dataLen, align 8, !dbg !42
  %cmp = icmp ult i64 %4, %5, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !45
  %7 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !45
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !45
  %9 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !49
  store i8 %8, i8* %arrayidx2, align 1, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %10, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !57
  store i8 0, i8* %arrayidx3, align 1, !dbg !58
  %11 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %11), !dbg !60
  %12 = load i8*, i8** %data, align 8, !dbg !61
  call void @free(i8* %12) #7, !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b_goodG2BSink(i8** %dataArray) #0 !dbg !64 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !69
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !69
  store i8* %1, i8** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !70, metadata !DIExpression()), !dbg !72
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !75, metadata !DIExpression()), !dbg !76
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %call = call i64 @strlen(i8* %3) #6, !dbg !78
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
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !88
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !88
  %9 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !92
  store i8 %8, i8* %arrayidx2, align 1, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %10, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !99
  store i8 0, i8* %arrayidx3, align 1, !dbg !100
  %11 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %11), !dbg !102
  %12 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* %12) #7, !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 79, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!19 = !DILocation(line: 26, column: 12, scope: !9)
!20 = !DILocation(line: 26, column: 19, scope: !9)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !10, line: 28, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 28, column: 14, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 29, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 29, column: 16, scope: !22)
!32 = !DILocalVariable(name: "dataLen", scope: !22, file: !10, line: 29, type: !28)
!33 = !DILocation(line: 29, column: 19, scope: !22)
!34 = !DILocation(line: 30, column: 26, scope: !22)
!35 = !DILocation(line: 30, column: 19, scope: !22)
!36 = !DILocation(line: 30, column: 17, scope: !22)
!37 = !DILocation(line: 32, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !22, file: !10, line: 32, column: 9)
!39 = !DILocation(line: 32, column: 14, scope: !38)
!40 = !DILocation(line: 32, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 32, column: 9)
!42 = !DILocation(line: 32, column: 25, scope: !41)
!43 = !DILocation(line: 32, column: 23, scope: !41)
!44 = !DILocation(line: 32, column: 9, scope: !38)
!45 = !DILocation(line: 34, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !41, file: !10, line: 33, column: 9)
!47 = !DILocation(line: 34, column: 28, scope: !46)
!48 = !DILocation(line: 34, column: 18, scope: !46)
!49 = !DILocation(line: 34, column: 13, scope: !46)
!50 = !DILocation(line: 34, column: 21, scope: !46)
!51 = !DILocation(line: 35, column: 9, scope: !46)
!52 = !DILocation(line: 32, column: 35, scope: !41)
!53 = !DILocation(line: 32, column: 9, scope: !41)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 35, column: 9, scope: !38)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 36, column: 9, scope: !22)
!58 = !DILocation(line: 36, column: 20, scope: !22)
!59 = !DILocation(line: 37, column: 19, scope: !22)
!60 = !DILocation(line: 37, column: 9, scope: !22)
!61 = !DILocation(line: 38, column: 14, scope: !22)
!62 = !DILocation(line: 38, column: 9, scope: !22)
!63 = !DILocation(line: 40, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_66b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "dataArray", arg: 1, scope: !64, file: !10, line: 47, type: !13)
!66 = !DILocation(line: 47, column: 83, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 49, type: !14)
!68 = !DILocation(line: 49, column: 12, scope: !64)
!69 = !DILocation(line: 49, column: 19, scope: !64)
!70 = !DILocalVariable(name: "dest", scope: !71, file: !10, line: 51, type: !23)
!71 = distinct !DILexicalBlock(scope: !64, file: !10, line: 50, column: 5)
!72 = !DILocation(line: 51, column: 14, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 52, type: !28)
!74 = !DILocation(line: 52, column: 16, scope: !71)
!75 = !DILocalVariable(name: "dataLen", scope: !71, file: !10, line: 52, type: !28)
!76 = !DILocation(line: 52, column: 19, scope: !71)
!77 = !DILocation(line: 53, column: 26, scope: !71)
!78 = !DILocation(line: 53, column: 19, scope: !71)
!79 = !DILocation(line: 53, column: 17, scope: !71)
!80 = !DILocation(line: 55, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !10, line: 55, column: 9)
!82 = !DILocation(line: 55, column: 14, scope: !81)
!83 = !DILocation(line: 55, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 55, column: 9)
!85 = !DILocation(line: 55, column: 25, scope: !84)
!86 = !DILocation(line: 55, column: 23, scope: !84)
!87 = !DILocation(line: 55, column: 9, scope: !81)
!88 = !DILocation(line: 57, column: 23, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !10, line: 56, column: 9)
!90 = !DILocation(line: 57, column: 28, scope: !89)
!91 = !DILocation(line: 57, column: 18, scope: !89)
!92 = !DILocation(line: 57, column: 13, scope: !89)
!93 = !DILocation(line: 57, column: 21, scope: !89)
!94 = !DILocation(line: 58, column: 9, scope: !89)
!95 = !DILocation(line: 55, column: 35, scope: !84)
!96 = !DILocation(line: 55, column: 9, scope: !84)
!97 = distinct !{!97, !87, !98, !56}
!98 = !DILocation(line: 58, column: 9, scope: !81)
!99 = !DILocation(line: 59, column: 9, scope: !71)
!100 = !DILocation(line: 59, column: 20, scope: !71)
!101 = !DILocation(line: 60, column: 19, scope: !71)
!102 = !DILocation(line: 60, column: 9, scope: !71)
!103 = !DILocation(line: 61, column: 14, scope: !71)
!104 = !DILocation(line: 61, column: 9, scope: !71)
!105 = !DILocation(line: 63, column: 1, scope: !64)
