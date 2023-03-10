; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b_badSink(i8* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i64* %i, metadata !17, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !28
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  store i64 0, i64* %i, align 8, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !34
  %cmp = icmp ult i64 %0, 100, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !38
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !40
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !40
  %3 = load i8*, i8** %data.addr, align 8, !dbg !41
  %4 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !41
  store i8 %2, i8* %arrayidx2, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %5, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !50
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !50
  store i8 0, i8* %arrayidx3, align 1, !dbg !51
  %7 = load i8*, i8** %data.addr, align 8, !dbg !52
  call void @printLine(i8* %7), !dbg !53
  %8 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @free(i8* %8) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b_goodG2BSink(i8* %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %i, metadata !60, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !65
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !66
  store i8 0, i8* %arrayidx, align 1, !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !71
  %cmp = icmp ult i64 %0, 100, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !77
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !77
  %3 = load i8*, i8** %data.addr, align 8, !dbg !78
  %4 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !78
  store i8 %2, i8* %arrayidx2, align 1, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %5, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !86
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !86
  store i8 0, i8* %arrayidx3, align 1, !dbg !87
  %7 = load i8*, i8** %data.addr, align 8, !dbg !88
  call void @printLine(i8* %7), !dbg !89
  %8 = load i8*, i8** %data.addr, align 8, !dbg !90
  call void @free(i8* %8) #5, !dbg !91
  ret void, !dbg !92
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!16 = !DILocation(line: 25, column: 79, scope: !9)
!17 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 28, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 46, baseType: !21)
!20 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 28, column: 16, scope: !18)
!23 = !DILocalVariable(name: "source", scope: !18, file: !10, line: 29, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 29, column: 14, scope: !18)
!28 = !DILocation(line: 30, column: 9, scope: !18)
!29 = !DILocation(line: 31, column: 9, scope: !18)
!30 = !DILocation(line: 31, column: 23, scope: !18)
!31 = !DILocation(line: 33, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 9)
!33 = !DILocation(line: 33, column: 14, scope: !32)
!34 = !DILocation(line: 33, column: 21, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !10, line: 33, column: 9)
!36 = !DILocation(line: 33, column: 23, scope: !35)
!37 = !DILocation(line: 33, column: 9, scope: !32)
!38 = !DILocation(line: 35, column: 30, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !10, line: 34, column: 9)
!40 = !DILocation(line: 35, column: 23, scope: !39)
!41 = !DILocation(line: 35, column: 13, scope: !39)
!42 = !DILocation(line: 35, column: 18, scope: !39)
!43 = !DILocation(line: 35, column: 21, scope: !39)
!44 = !DILocation(line: 36, column: 9, scope: !39)
!45 = !DILocation(line: 33, column: 31, scope: !35)
!46 = !DILocation(line: 33, column: 9, scope: !35)
!47 = distinct !{!47, !37, !48, !49}
!48 = !DILocation(line: 36, column: 9, scope: !32)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 37, column: 9, scope: !18)
!51 = !DILocation(line: 37, column: 21, scope: !18)
!52 = !DILocation(line: 38, column: 19, scope: !18)
!53 = !DILocation(line: 38, column: 9, scope: !18)
!54 = !DILocation(line: 39, column: 14, scope: !18)
!55 = !DILocation(line: 39, column: 9, scope: !18)
!56 = !DILocation(line: 41, column: 1, scope: !9)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_51b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !10, line: 48, type: !13)
!59 = !DILocation(line: 48, column: 83, scope: !57)
!60 = !DILocalVariable(name: "i", scope: !61, file: !10, line: 51, type: !19)
!61 = distinct !DILexicalBlock(scope: !57, file: !10, line: 50, column: 5)
!62 = !DILocation(line: 51, column: 16, scope: !61)
!63 = !DILocalVariable(name: "source", scope: !61, file: !10, line: 52, type: !24)
!64 = !DILocation(line: 52, column: 14, scope: !61)
!65 = !DILocation(line: 53, column: 9, scope: !61)
!66 = !DILocation(line: 54, column: 9, scope: !61)
!67 = !DILocation(line: 54, column: 23, scope: !61)
!68 = !DILocation(line: 56, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !61, file: !10, line: 56, column: 9)
!70 = !DILocation(line: 56, column: 14, scope: !69)
!71 = !DILocation(line: 56, column: 21, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !10, line: 56, column: 9)
!73 = !DILocation(line: 56, column: 23, scope: !72)
!74 = !DILocation(line: 56, column: 9, scope: !69)
!75 = !DILocation(line: 58, column: 30, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 57, column: 9)
!77 = !DILocation(line: 58, column: 23, scope: !76)
!78 = !DILocation(line: 58, column: 13, scope: !76)
!79 = !DILocation(line: 58, column: 18, scope: !76)
!80 = !DILocation(line: 58, column: 21, scope: !76)
!81 = !DILocation(line: 59, column: 9, scope: !76)
!82 = !DILocation(line: 56, column: 31, scope: !72)
!83 = !DILocation(line: 56, column: 9, scope: !72)
!84 = distinct !{!84, !74, !85, !49}
!85 = !DILocation(line: 59, column: 9, scope: !69)
!86 = !DILocation(line: 60, column: 9, scope: !61)
!87 = !DILocation(line: 60, column: 21, scope: !61)
!88 = !DILocation(line: 61, column: 19, scope: !61)
!89 = !DILocation(line: 61, column: 9, scope: !61)
!90 = !DILocation(line: 62, column: 14, scope: !61)
!91 = !DILocation(line: 62, column: 9, scope: !61)
!92 = !DILocation(line: 64, column: 1, scope: !57)
