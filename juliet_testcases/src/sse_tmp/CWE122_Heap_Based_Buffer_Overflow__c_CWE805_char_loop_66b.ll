; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !32
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx1, align 1, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %2, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !44
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !45
  store i8 %4, i8* %arrayidx3, align 1, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %7, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !54
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !54
  store i8 0, i8* %arrayidx4, align 1, !dbg !55
  %9 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %9), !dbg !57
  %10 = load i8*, i8** %data, align 8, !dbg !58
  call void @free(i8* %10) #5, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b_goodG2BSink(i8** %dataArray) #0 !dbg !61 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !66
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !66
  store i8* %1, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i64* %i, metadata !67, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !72
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx1, align 1, !dbg !74
  store i64 0, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !78
  %cmp = icmp ult i64 %2, 100, !dbg !80
  br i1 %cmp, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !84
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !84
  %5 = load i8*, i8** %data, align 8, !dbg !85
  %6 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !85
  store i8 %4, i8* %arrayidx3, align 1, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !89
  %inc = add i64 %7, 1, !dbg !89
  store i64 %inc, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !93
  store i8 0, i8* %arrayidx4, align 1, !dbg !94
  %9 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* %9), !dbg !96
  %10 = load i8*, i8** %data, align 8, !dbg !97
  call void @free(i8* %10) #5, !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
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
!21 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 28, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !25)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 28, column: 16, scope: !22)
!27 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 29, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 29, column: 14, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 23, scope: !22)
!35 = !DILocation(line: 33, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !10, line: 33, column: 9)
!37 = !DILocation(line: 33, column: 14, scope: !36)
!38 = !DILocation(line: 33, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 33, column: 9)
!40 = !DILocation(line: 33, column: 23, scope: !39)
!41 = !DILocation(line: 33, column: 9, scope: !36)
!42 = !DILocation(line: 35, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 34, column: 9)
!44 = !DILocation(line: 35, column: 23, scope: !43)
!45 = !DILocation(line: 35, column: 13, scope: !43)
!46 = !DILocation(line: 35, column: 18, scope: !43)
!47 = !DILocation(line: 35, column: 21, scope: !43)
!48 = !DILocation(line: 36, column: 9, scope: !43)
!49 = !DILocation(line: 33, column: 31, scope: !39)
!50 = !DILocation(line: 33, column: 9, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 36, column: 9, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 37, column: 9, scope: !22)
!55 = !DILocation(line: 37, column: 21, scope: !22)
!56 = !DILocation(line: 38, column: 19, scope: !22)
!57 = !DILocation(line: 38, column: 9, scope: !22)
!58 = !DILocation(line: 39, column: 14, scope: !22)
!59 = !DILocation(line: 39, column: 9, scope: !22)
!60 = !DILocation(line: 41, column: 1, scope: !9)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_66b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "dataArray", arg: 1, scope: !61, file: !10, line: 48, type: !13)
!63 = !DILocation(line: 48, column: 83, scope: !61)
!64 = !DILocalVariable(name: "data", scope: !61, file: !10, line: 50, type: !14)
!65 = !DILocation(line: 50, column: 12, scope: !61)
!66 = !DILocation(line: 50, column: 19, scope: !61)
!67 = !DILocalVariable(name: "i", scope: !68, file: !10, line: 52, type: !23)
!68 = distinct !DILexicalBlock(scope: !61, file: !10, line: 51, column: 5)
!69 = !DILocation(line: 52, column: 16, scope: !68)
!70 = !DILocalVariable(name: "source", scope: !68, file: !10, line: 53, type: !28)
!71 = !DILocation(line: 53, column: 14, scope: !68)
!72 = !DILocation(line: 54, column: 9, scope: !68)
!73 = !DILocation(line: 55, column: 9, scope: !68)
!74 = !DILocation(line: 55, column: 23, scope: !68)
!75 = !DILocation(line: 57, column: 16, scope: !76)
!76 = distinct !DILexicalBlock(scope: !68, file: !10, line: 57, column: 9)
!77 = !DILocation(line: 57, column: 14, scope: !76)
!78 = !DILocation(line: 57, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !10, line: 57, column: 9)
!80 = !DILocation(line: 57, column: 23, scope: !79)
!81 = !DILocation(line: 57, column: 9, scope: !76)
!82 = !DILocation(line: 59, column: 30, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !10, line: 58, column: 9)
!84 = !DILocation(line: 59, column: 23, scope: !83)
!85 = !DILocation(line: 59, column: 13, scope: !83)
!86 = !DILocation(line: 59, column: 18, scope: !83)
!87 = !DILocation(line: 59, column: 21, scope: !83)
!88 = !DILocation(line: 60, column: 9, scope: !83)
!89 = !DILocation(line: 57, column: 31, scope: !79)
!90 = !DILocation(line: 57, column: 9, scope: !79)
!91 = distinct !{!91, !81, !92, !53}
!92 = !DILocation(line: 60, column: 9, scope: !76)
!93 = !DILocation(line: 61, column: 9, scope: !68)
!94 = !DILocation(line: 61, column: 21, scope: !68)
!95 = !DILocation(line: 62, column: 19, scope: !68)
!96 = !DILocation(line: 62, column: 9, scope: !68)
!97 = !DILocation(line: 63, column: 14, scope: !68)
!98 = !DILocation(line: 63, column: 9, scope: !68)
!99 = !DILocation(line: 65, column: 1, scope: !61)
