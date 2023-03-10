; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68_badData = external dso_local global i32*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i64 @wcslen(i32* %2) #6, !dbg !33
  store i64 %call, i64* %dataLen, align 8, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !38
  %4 = load i64, i64* %dataLen, align 8, !dbg !40
  %cmp = icmp ult i64 %3, %4, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %6 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !43
  %7 = load i32, i32* %arrayidx, align 4, !dbg !43
  %8 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !47
  store i32 %7, i32* %arrayidx1, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %9, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !55
  store i32 0, i32* %arrayidx2, align 4, !dbg !56
  %10 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %10), !dbg !58
  %11 = load i32*, i32** %data, align 8, !dbg !59
  %12 = bitcast i32* %11 to i8*, !dbg !59
  call void @free(i8* %12) #7, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b_goodG2BSink() #0 !dbg !62 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68_goodG2BData, align 8, !dbg !65
  store i32* %0, i32** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !66, metadata !DIExpression()), !dbg !68
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !71, metadata !DIExpression()), !dbg !72
  %2 = load i32*, i32** %data, align 8, !dbg !73
  %call = call i64 @wcslen(i32* %2) #6, !dbg !74
  store i64 %call, i64* %dataLen, align 8, !dbg !75
  store i64 0, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !79
  %4 = load i64, i64* %dataLen, align 8, !dbg !81
  %cmp = icmp ult i64 %3, %4, !dbg !82
  br i1 %cmp, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !84
  %6 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !84
  %7 = load i32, i32* %arrayidx, align 4, !dbg !84
  %8 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !88
  store i32 %7, i32* %arrayidx1, align 4, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !91
  %inc = add i64 %9, 1, !dbg !91
  store i64 %inc, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !95
  store i32 0, i32* %arrayidx2, align 4, !dbg !96
  %10 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* %10), !dbg !98
  %11 = load i32*, i32** %data, align 8, !dbg !99
  %12 = bitcast i32* %11 to i8*, !dbg !99
  call void @free(i8* %12) #7, !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 15, scope: !9)
!19 = !DILocation(line: 30, column: 22, scope: !9)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !10, line: 32, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 32, column: 17, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 33, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !28)
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 33, column: 16, scope: !21)
!30 = !DILocalVariable(name: "dataLen", scope: !21, file: !10, line: 33, type: !27)
!31 = !DILocation(line: 33, column: 19, scope: !21)
!32 = !DILocation(line: 34, column: 26, scope: !21)
!33 = !DILocation(line: 34, column: 19, scope: !21)
!34 = !DILocation(line: 34, column: 17, scope: !21)
!35 = !DILocation(line: 36, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !21, file: !10, line: 36, column: 9)
!37 = !DILocation(line: 36, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 36, column: 9)
!40 = !DILocation(line: 36, column: 25, scope: !39)
!41 = !DILocation(line: 36, column: 23, scope: !39)
!42 = !DILocation(line: 36, column: 9, scope: !36)
!43 = !DILocation(line: 38, column: 23, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !10, line: 37, column: 9)
!45 = !DILocation(line: 38, column: 28, scope: !44)
!46 = !DILocation(line: 38, column: 18, scope: !44)
!47 = !DILocation(line: 38, column: 13, scope: !44)
!48 = !DILocation(line: 38, column: 21, scope: !44)
!49 = !DILocation(line: 39, column: 9, scope: !44)
!50 = !DILocation(line: 36, column: 35, scope: !39)
!51 = !DILocation(line: 36, column: 9, scope: !39)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 39, column: 9, scope: !36)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 40, column: 9, scope: !21)
!56 = !DILocation(line: 40, column: 20, scope: !21)
!57 = !DILocation(line: 41, column: 20, scope: !21)
!58 = !DILocation(line: 41, column: 9, scope: !21)
!59 = !DILocation(line: 42, column: 14, scope: !21)
!60 = !DILocation(line: 42, column: 9, scope: !21)
!61 = !DILocation(line: 44, column: 1, scope: !9)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_68b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 53, type: !14)
!64 = !DILocation(line: 53, column: 15, scope: !62)
!65 = !DILocation(line: 53, column: 22, scope: !62)
!66 = !DILocalVariable(name: "dest", scope: !67, file: !10, line: 55, type: !22)
!67 = distinct !DILexicalBlock(scope: !62, file: !10, line: 54, column: 5)
!68 = !DILocation(line: 55, column: 17, scope: !67)
!69 = !DILocalVariable(name: "i", scope: !67, file: !10, line: 56, type: !27)
!70 = !DILocation(line: 56, column: 16, scope: !67)
!71 = !DILocalVariable(name: "dataLen", scope: !67, file: !10, line: 56, type: !27)
!72 = !DILocation(line: 56, column: 19, scope: !67)
!73 = !DILocation(line: 57, column: 26, scope: !67)
!74 = !DILocation(line: 57, column: 19, scope: !67)
!75 = !DILocation(line: 57, column: 17, scope: !67)
!76 = !DILocation(line: 59, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !67, file: !10, line: 59, column: 9)
!78 = !DILocation(line: 59, column: 14, scope: !77)
!79 = !DILocation(line: 59, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !10, line: 59, column: 9)
!81 = !DILocation(line: 59, column: 25, scope: !80)
!82 = !DILocation(line: 59, column: 23, scope: !80)
!83 = !DILocation(line: 59, column: 9, scope: !77)
!84 = !DILocation(line: 61, column: 23, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !10, line: 60, column: 9)
!86 = !DILocation(line: 61, column: 28, scope: !85)
!87 = !DILocation(line: 61, column: 18, scope: !85)
!88 = !DILocation(line: 61, column: 13, scope: !85)
!89 = !DILocation(line: 61, column: 21, scope: !85)
!90 = !DILocation(line: 62, column: 9, scope: !85)
!91 = !DILocation(line: 59, column: 35, scope: !80)
!92 = !DILocation(line: 59, column: 9, scope: !80)
!93 = distinct !{!93, !83, !94, !54}
!94 = !DILocation(line: 62, column: 9, scope: !77)
!95 = !DILocation(line: 63, column: 9, scope: !67)
!96 = !DILocation(line: 63, column: 20, scope: !67)
!97 = !DILocation(line: 64, column: 20, scope: !67)
!98 = !DILocation(line: 64, column: 9, scope: !67)
!99 = !DILocation(line: 65, column: 14, scope: !67)
!100 = !DILocation(line: 65, column: 9, scope: !67)
!101 = !DILocation(line: 67, column: 1, scope: !62)
