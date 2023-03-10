; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_badSink.source to i8*), i64 44, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !34, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !36
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !37
  store i64 %call, i64* %sourceLen, align 8, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !42
  %4 = load i64, i64* %sourceLen, align 8, !dbg !44
  %add = add i64 %4, 1, !dbg !45
  %cmp = icmp ult i64 %3, %add, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !50
  %6 = load i32, i32* %arrayidx, align 4, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %8 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !51
  store i32 %6, i32* %arrayidx1, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %9, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %10), !dbg !61
  %11 = load i32*, i32** %data, align 8, !dbg !62
  %12 = bitcast i32* %11 to i8*, !dbg !62
  call void @free(i8* %12) #7, !dbg !63
  ret void, !dbg !64
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !65 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !70
  %1 = load i32*, i32** %0, align 8, !dbg !71
  store i32* %1, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !72, metadata !DIExpression()), !dbg !74
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !79
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !80
  store i64 %call, i64* %sourceLen, align 8, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !85
  %4 = load i64, i64* %sourceLen, align 8, !dbg !87
  %add = add i64 %4, 1, !dbg !88
  %cmp = icmp ult i64 %3, %add, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !93
  %6 = load i32, i32* %arrayidx, align 4, !dbg !93
  %7 = load i32*, i32** %data, align 8, !dbg !94
  %8 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !94
  store i32 %6, i32* %arrayidx1, align 4, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %9, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %10), !dbg !103
  %11 = load i32*, i32** %data, align 8, !dbg !104
  %12 = bitcast i32* %11 to i8*, !dbg !104
  call void @free(i8* %12) #7, !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!19 = !DILocation(line: 28, column: 87, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!21 = !DILocation(line: 30, column: 15, scope: !9)
!22 = !DILocation(line: 30, column: 23, scope: !9)
!23 = !DILocation(line: 30, column: 22, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 352, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 32, column: 17, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 33, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !32)
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 33, column: 16, scope: !25)
!34 = !DILocalVariable(name: "sourceLen", scope: !25, file: !10, line: 33, type: !31)
!35 = !DILocation(line: 33, column: 19, scope: !25)
!36 = !DILocation(line: 34, column: 28, scope: !25)
!37 = !DILocation(line: 34, column: 21, scope: !25)
!38 = !DILocation(line: 34, column: 19, scope: !25)
!39 = !DILocation(line: 37, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !25, file: !10, line: 37, column: 9)
!41 = !DILocation(line: 37, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 37, column: 9)
!44 = !DILocation(line: 37, column: 25, scope: !43)
!45 = !DILocation(line: 37, column: 35, scope: !43)
!46 = !DILocation(line: 37, column: 23, scope: !43)
!47 = !DILocation(line: 37, column: 9, scope: !40)
!48 = !DILocation(line: 39, column: 30, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !10, line: 38, column: 9)
!50 = !DILocation(line: 39, column: 23, scope: !49)
!51 = !DILocation(line: 39, column: 13, scope: !49)
!52 = !DILocation(line: 39, column: 18, scope: !49)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocation(line: 40, column: 9, scope: !49)
!55 = !DILocation(line: 37, column: 41, scope: !43)
!56 = !DILocation(line: 37, column: 9, scope: !43)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 40, column: 9, scope: !40)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 41, column: 20, scope: !25)
!61 = !DILocation(line: 41, column: 9, scope: !25)
!62 = !DILocation(line: 42, column: 14, scope: !25)
!63 = !DILocation(line: 42, column: 9, scope: !25)
!64 = !DILocation(line: 44, column: 1, scope: !9)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_63b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !65, file: !10, line: 51, type: !13)
!67 = !DILocation(line: 51, column: 91, scope: !65)
!68 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 53, type: !14)
!69 = !DILocation(line: 53, column: 15, scope: !65)
!70 = !DILocation(line: 53, column: 23, scope: !65)
!71 = !DILocation(line: 53, column: 22, scope: !65)
!72 = !DILocalVariable(name: "source", scope: !73, file: !10, line: 55, type: !26)
!73 = distinct !DILexicalBlock(scope: !65, file: !10, line: 54, column: 5)
!74 = !DILocation(line: 55, column: 17, scope: !73)
!75 = !DILocalVariable(name: "i", scope: !73, file: !10, line: 56, type: !31)
!76 = !DILocation(line: 56, column: 16, scope: !73)
!77 = !DILocalVariable(name: "sourceLen", scope: !73, file: !10, line: 56, type: !31)
!78 = !DILocation(line: 56, column: 19, scope: !73)
!79 = !DILocation(line: 57, column: 28, scope: !73)
!80 = !DILocation(line: 57, column: 21, scope: !73)
!81 = !DILocation(line: 57, column: 19, scope: !73)
!82 = !DILocation(line: 60, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !10, line: 60, column: 9)
!84 = !DILocation(line: 60, column: 14, scope: !83)
!85 = !DILocation(line: 60, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 60, column: 9)
!87 = !DILocation(line: 60, column: 25, scope: !86)
!88 = !DILocation(line: 60, column: 35, scope: !86)
!89 = !DILocation(line: 60, column: 23, scope: !86)
!90 = !DILocation(line: 60, column: 9, scope: !83)
!91 = !DILocation(line: 62, column: 30, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !10, line: 61, column: 9)
!93 = !DILocation(line: 62, column: 23, scope: !92)
!94 = !DILocation(line: 62, column: 13, scope: !92)
!95 = !DILocation(line: 62, column: 18, scope: !92)
!96 = !DILocation(line: 62, column: 21, scope: !92)
!97 = !DILocation(line: 63, column: 9, scope: !92)
!98 = !DILocation(line: 60, column: 41, scope: !86)
!99 = !DILocation(line: 60, column: 9, scope: !86)
!100 = distinct !{!100, !90, !101, !59}
!101 = !DILocation(line: 63, column: 9, scope: !83)
!102 = !DILocation(line: 64, column: 20, scope: !73)
!103 = !DILocation(line: 64, column: 9, scope: !73)
!104 = !DILocation(line: 65, column: 14, scope: !73)
!105 = !DILocation(line: 65, column: 9, scope: !73)
!106 = !DILocation(line: 67, column: 1, scope: !65)
