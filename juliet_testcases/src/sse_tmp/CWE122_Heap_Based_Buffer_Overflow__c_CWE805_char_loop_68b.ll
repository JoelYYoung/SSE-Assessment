; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68_badData = external dso_local global i8*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata i64* %i, metadata !18, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  store i64 0, i64* %i, align 8, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !35
  %cmp = icmp ult i64 %1, 100, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !39
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !41
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  %5 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !42
  store i8 %3, i8* %arrayidx2, align 1, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %6, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %8 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %8), !dbg !54
  %9 = load i8*, i8** %data, align 8, !dbg !55
  call void @free(i8* %9) #5, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b_goodG2BSink() #0 !dbg !58 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68_goodG2BData, align 8, !dbg !61
  store i8* %0, i8** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i64* %i, metadata !62, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !65, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !67
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !68
  store i8 0, i8* %arrayidx, align 1, !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !73
  %cmp = icmp ult i64 %1, 100, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !79
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !79
  %4 = load i8*, i8** %data, align 8, !dbg !80
  %5 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !80
  store i8 %3, i8* %arrayidx2, align 1, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %6, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !88
  store i8 0, i8* %arrayidx3, align 1, !dbg !89
  %8 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* %8), !dbg !91
  %9 = load i8*, i8** %data, align 8, !dbg !92
  call void @free(i8* %9) #5, !dbg !93
  ret void, !dbg !94
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 30, column: 12, scope: !9)
!17 = !DILocation(line: 30, column: 19, scope: !9)
!18 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 32, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !21, line: 46, baseType: !22)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 32, column: 16, scope: !19)
!24 = !DILocalVariable(name: "source", scope: !19, file: !10, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 33, column: 14, scope: !19)
!29 = !DILocation(line: 34, column: 9, scope: !19)
!30 = !DILocation(line: 35, column: 9, scope: !19)
!31 = !DILocation(line: 35, column: 23, scope: !19)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !10, line: 37, column: 9)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 37, column: 21, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !10, line: 37, column: 9)
!37 = !DILocation(line: 37, column: 23, scope: !36)
!38 = !DILocation(line: 37, column: 9, scope: !33)
!39 = !DILocation(line: 39, column: 30, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 38, column: 9)
!41 = !DILocation(line: 39, column: 23, scope: !40)
!42 = !DILocation(line: 39, column: 13, scope: !40)
!43 = !DILocation(line: 39, column: 18, scope: !40)
!44 = !DILocation(line: 39, column: 21, scope: !40)
!45 = !DILocation(line: 40, column: 9, scope: !40)
!46 = !DILocation(line: 37, column: 31, scope: !36)
!47 = !DILocation(line: 37, column: 9, scope: !36)
!48 = distinct !{!48, !38, !49, !50}
!49 = !DILocation(line: 40, column: 9, scope: !33)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 41, column: 9, scope: !19)
!52 = !DILocation(line: 41, column: 21, scope: !19)
!53 = !DILocation(line: 42, column: 19, scope: !19)
!54 = !DILocation(line: 42, column: 9, scope: !19)
!55 = !DILocation(line: 43, column: 14, scope: !19)
!56 = !DILocation(line: 43, column: 9, scope: !19)
!57 = !DILocation(line: 45, column: 1, scope: !9)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_68b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !10, line: 54, type: !14)
!60 = !DILocation(line: 54, column: 12, scope: !58)
!61 = !DILocation(line: 54, column: 19, scope: !58)
!62 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 56, type: !20)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 55, column: 5)
!64 = !DILocation(line: 56, column: 16, scope: !63)
!65 = !DILocalVariable(name: "source", scope: !63, file: !10, line: 57, type: !25)
!66 = !DILocation(line: 57, column: 14, scope: !63)
!67 = !DILocation(line: 58, column: 9, scope: !63)
!68 = !DILocation(line: 59, column: 9, scope: !63)
!69 = !DILocation(line: 59, column: 23, scope: !63)
!70 = !DILocation(line: 61, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !63, file: !10, line: 61, column: 9)
!72 = !DILocation(line: 61, column: 14, scope: !71)
!73 = !DILocation(line: 61, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !10, line: 61, column: 9)
!75 = !DILocation(line: 61, column: 23, scope: !74)
!76 = !DILocation(line: 61, column: 9, scope: !71)
!77 = !DILocation(line: 63, column: 30, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !10, line: 62, column: 9)
!79 = !DILocation(line: 63, column: 23, scope: !78)
!80 = !DILocation(line: 63, column: 13, scope: !78)
!81 = !DILocation(line: 63, column: 18, scope: !78)
!82 = !DILocation(line: 63, column: 21, scope: !78)
!83 = !DILocation(line: 64, column: 9, scope: !78)
!84 = !DILocation(line: 61, column: 31, scope: !74)
!85 = !DILocation(line: 61, column: 9, scope: !74)
!86 = distinct !{!86, !76, !87, !50}
!87 = !DILocation(line: 64, column: 9, scope: !71)
!88 = !DILocation(line: 65, column: 9, scope: !63)
!89 = !DILocation(line: 65, column: 21, scope: !63)
!90 = !DILocation(line: 66, column: 19, scope: !63)
!91 = !DILocation(line: 66, column: 9, scope: !63)
!92 = !DILocation(line: 67, column: 14, scope: !63)
!93 = !DILocation(line: 67, column: 9, scope: !63)
!94 = !DILocation(line: 69, column: 1, scope: !58)
