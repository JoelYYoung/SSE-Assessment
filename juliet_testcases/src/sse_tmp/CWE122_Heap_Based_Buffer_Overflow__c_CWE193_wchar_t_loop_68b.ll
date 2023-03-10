; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68_badData = external dso_local global i32*, align 8
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68_goodG2BData = external dso_local global i32*, align 8
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_badSink.source to i8*), i64 44, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !30, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !32
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !33
  store i64 %call, i64* %sourceLen, align 8, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !38
  %3 = load i64, i64* %sourceLen, align 8, !dbg !40
  %add = add i64 %3, 1, !dbg !41
  %cmp = icmp ult i64 %2, %add, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !46
  %5 = load i32, i32* %arrayidx, align 4, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !47
  store i32 %5, i32* %arrayidx1, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %8, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %9), !dbg !57
  %10 = load i32*, i32** %data, align 8, !dbg !58
  %11 = bitcast i32* %10 to i8*, !dbg !58
  call void @free(i8* %11) #7, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_goodG2BSink() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68_goodG2BData, align 8, !dbg !64
  store i32* %0, i32** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !65, metadata !DIExpression()), !dbg !67
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !67
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !72
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !73
  store i64 %call, i64* %sourceLen, align 8, !dbg !74
  store i64 0, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !78
  %3 = load i64, i64* %sourceLen, align 8, !dbg !80
  %add = add i64 %3, 1, !dbg !81
  %cmp = icmp ult i64 %2, %add, !dbg !82
  br i1 %cmp, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !86
  %5 = load i32, i32* %arrayidx, align 4, !dbg !86
  %6 = load i32*, i32** %data, align 8, !dbg !87
  %7 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !87
  store i32 %5, i32* %arrayidx1, align 4, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !91
  %inc = add i64 %8, 1, !dbg !91
  store i64 %inc, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %9), !dbg !96
  %10 = load i32*, i32** %data, align 8, !dbg !97
  %11 = bitcast i32* %10 to i8*, !dbg !97
  call void @free(i8* %11) #7, !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 35, column: 15, scope: !9)
!19 = !DILocation(line: 35, column: 22, scope: !9)
!20 = !DILocalVariable(name: "source", scope: !21, file: !10, line: 37, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 352, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 37, column: 17, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 38, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !28)
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 38, column: 16, scope: !21)
!30 = !DILocalVariable(name: "sourceLen", scope: !21, file: !10, line: 38, type: !27)
!31 = !DILocation(line: 38, column: 19, scope: !21)
!32 = !DILocation(line: 39, column: 28, scope: !21)
!33 = !DILocation(line: 39, column: 21, scope: !21)
!34 = !DILocation(line: 39, column: 19, scope: !21)
!35 = !DILocation(line: 42, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !21, file: !10, line: 42, column: 9)
!37 = !DILocation(line: 42, column: 14, scope: !36)
!38 = !DILocation(line: 42, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 42, column: 9)
!40 = !DILocation(line: 42, column: 25, scope: !39)
!41 = !DILocation(line: 42, column: 35, scope: !39)
!42 = !DILocation(line: 42, column: 23, scope: !39)
!43 = !DILocation(line: 42, column: 9, scope: !36)
!44 = !DILocation(line: 44, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !10, line: 43, column: 9)
!46 = !DILocation(line: 44, column: 23, scope: !45)
!47 = !DILocation(line: 44, column: 13, scope: !45)
!48 = !DILocation(line: 44, column: 18, scope: !45)
!49 = !DILocation(line: 44, column: 21, scope: !45)
!50 = !DILocation(line: 45, column: 9, scope: !45)
!51 = !DILocation(line: 42, column: 41, scope: !39)
!52 = !DILocation(line: 42, column: 9, scope: !39)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 45, column: 9, scope: !36)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 46, column: 20, scope: !21)
!57 = !DILocation(line: 46, column: 9, scope: !21)
!58 = !DILocation(line: 47, column: 14, scope: !21)
!59 = !DILocation(line: 47, column: 9, scope: !21)
!60 = !DILocation(line: 49, column: 1, scope: !9)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_68b_goodG2BSink", scope: !10, file: !10, line: 56, type: !11, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", scope: !61, file: !10, line: 58, type: !14)
!63 = !DILocation(line: 58, column: 15, scope: !61)
!64 = !DILocation(line: 58, column: 22, scope: !61)
!65 = !DILocalVariable(name: "source", scope: !66, file: !10, line: 60, type: !22)
!66 = distinct !DILexicalBlock(scope: !61, file: !10, line: 59, column: 5)
!67 = !DILocation(line: 60, column: 17, scope: !66)
!68 = !DILocalVariable(name: "i", scope: !66, file: !10, line: 61, type: !27)
!69 = !DILocation(line: 61, column: 16, scope: !66)
!70 = !DILocalVariable(name: "sourceLen", scope: !66, file: !10, line: 61, type: !27)
!71 = !DILocation(line: 61, column: 19, scope: !66)
!72 = !DILocation(line: 62, column: 28, scope: !66)
!73 = !DILocation(line: 62, column: 21, scope: !66)
!74 = !DILocation(line: 62, column: 19, scope: !66)
!75 = !DILocation(line: 65, column: 16, scope: !76)
!76 = distinct !DILexicalBlock(scope: !66, file: !10, line: 65, column: 9)
!77 = !DILocation(line: 65, column: 14, scope: !76)
!78 = !DILocation(line: 65, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !10, line: 65, column: 9)
!80 = !DILocation(line: 65, column: 25, scope: !79)
!81 = !DILocation(line: 65, column: 35, scope: !79)
!82 = !DILocation(line: 65, column: 23, scope: !79)
!83 = !DILocation(line: 65, column: 9, scope: !76)
!84 = !DILocation(line: 67, column: 30, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !10, line: 66, column: 9)
!86 = !DILocation(line: 67, column: 23, scope: !85)
!87 = !DILocation(line: 67, column: 13, scope: !85)
!88 = !DILocation(line: 67, column: 18, scope: !85)
!89 = !DILocation(line: 67, column: 21, scope: !85)
!90 = !DILocation(line: 68, column: 9, scope: !85)
!91 = !DILocation(line: 65, column: 41, scope: !79)
!92 = !DILocation(line: 65, column: 9, scope: !79)
!93 = distinct !{!93, !83, !94, !55}
!94 = !DILocation(line: 68, column: 9, scope: !76)
!95 = !DILocation(line: 69, column: 20, scope: !66)
!96 = !DILocation(line: 69, column: 9, scope: !66)
!97 = !DILocation(line: 70, column: 14, scope: !66)
!98 = !DILocation(line: 70, column: 9, scope: !66)
!99 = !DILocation(line: 72, column: 1, scope: !61)
