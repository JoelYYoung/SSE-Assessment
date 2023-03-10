; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !45
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %6 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !46
  store i8 %4, i8* %arrayidx2, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %7, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !55
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !55
  store i8 0, i8* %arrayidx3, align 1, !dbg !56
  %9 = load i8*, i8** %data, align 8, !dbg !57
  call void @printLine(i8* %9), !dbg !58
  %10 = load i8*, i8** %data, align 8, !dbg !59
  call void @free(i8* %10) #5, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !62 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !67
  %1 = load i8*, i8** %0, align 8, !dbg !68
  store i8* %1, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !74
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !75
  store i8 0, i8* %arrayidx, align 1, !dbg !76
  store i64 0, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !80
  %cmp = icmp ult i64 %2, 100, !dbg !82
  br i1 %cmp, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !86
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !86
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %6 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !87
  store i8 %4, i8* %arrayidx2, align 1, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !91
  %inc = add i64 %7, 1, !dbg !91
  store i64 %inc, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !95
  store i8 0, i8* %arrayidx3, align 1, !dbg !96
  %9 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %9), !dbg !98
  %10 = load i8*, i8** %data, align 8, !dbg !99
  call void @free(i8* %10) #5, !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 81, scope: !9)
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
!28 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 28, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 28, column: 14, scope: !23)
!33 = !DILocation(line: 29, column: 9, scope: !23)
!34 = !DILocation(line: 30, column: 9, scope: !23)
!35 = !DILocation(line: 30, column: 23, scope: !23)
!36 = !DILocation(line: 32, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !10, line: 32, column: 9)
!38 = !DILocation(line: 32, column: 14, scope: !37)
!39 = !DILocation(line: 32, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 32, column: 9)
!41 = !DILocation(line: 32, column: 23, scope: !40)
!42 = !DILocation(line: 32, column: 9, scope: !37)
!43 = !DILocation(line: 34, column: 30, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 33, column: 9)
!45 = !DILocation(line: 34, column: 23, scope: !44)
!46 = !DILocation(line: 34, column: 13, scope: !44)
!47 = !DILocation(line: 34, column: 18, scope: !44)
!48 = !DILocation(line: 34, column: 21, scope: !44)
!49 = !DILocation(line: 35, column: 9, scope: !44)
!50 = !DILocation(line: 32, column: 31, scope: !40)
!51 = !DILocation(line: 32, column: 9, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 35, column: 9, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 36, column: 9, scope: !23)
!56 = !DILocation(line: 36, column: 21, scope: !23)
!57 = !DILocation(line: 37, column: 19, scope: !23)
!58 = !DILocation(line: 37, column: 9, scope: !23)
!59 = !DILocation(line: 38, column: 14, scope: !23)
!60 = !DILocation(line: 38, column: 9, scope: !23)
!61 = !DILocation(line: 40, column: 1, scope: !9)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_63b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !62, file: !10, line: 47, type: !13)
!64 = !DILocation(line: 47, column: 85, scope: !62)
!65 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 49, type: !14)
!66 = !DILocation(line: 49, column: 12, scope: !62)
!67 = !DILocation(line: 49, column: 20, scope: !62)
!68 = !DILocation(line: 49, column: 19, scope: !62)
!69 = !DILocalVariable(name: "i", scope: !70, file: !10, line: 51, type: !24)
!70 = distinct !DILexicalBlock(scope: !62, file: !10, line: 50, column: 5)
!71 = !DILocation(line: 51, column: 16, scope: !70)
!72 = !DILocalVariable(name: "source", scope: !70, file: !10, line: 52, type: !29)
!73 = !DILocation(line: 52, column: 14, scope: !70)
!74 = !DILocation(line: 53, column: 9, scope: !70)
!75 = !DILocation(line: 54, column: 9, scope: !70)
!76 = !DILocation(line: 54, column: 23, scope: !70)
!77 = !DILocation(line: 56, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !10, line: 56, column: 9)
!79 = !DILocation(line: 56, column: 14, scope: !78)
!80 = !DILocation(line: 56, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !10, line: 56, column: 9)
!82 = !DILocation(line: 56, column: 23, scope: !81)
!83 = !DILocation(line: 56, column: 9, scope: !78)
!84 = !DILocation(line: 58, column: 30, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !10, line: 57, column: 9)
!86 = !DILocation(line: 58, column: 23, scope: !85)
!87 = !DILocation(line: 58, column: 13, scope: !85)
!88 = !DILocation(line: 58, column: 18, scope: !85)
!89 = !DILocation(line: 58, column: 21, scope: !85)
!90 = !DILocation(line: 59, column: 9, scope: !85)
!91 = !DILocation(line: 56, column: 31, scope: !81)
!92 = !DILocation(line: 56, column: 9, scope: !81)
!93 = distinct !{!93, !83, !94, !54}
!94 = !DILocation(line: 59, column: 9, scope: !78)
!95 = !DILocation(line: 60, column: 9, scope: !70)
!96 = !DILocation(line: 60, column: 21, scope: !70)
!97 = !DILocation(line: 61, column: 19, scope: !70)
!98 = !DILocation(line: 61, column: 9, scope: !70)
!99 = !DILocation(line: 62, column: 14, scope: !70)
!100 = !DILocation(line: 62, column: 9, scope: !70)
!101 = !DILocation(line: 64, column: 1, scope: !62)
