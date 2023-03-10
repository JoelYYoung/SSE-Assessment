; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !35
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %2, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !47
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %6 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !48
  store i32 %4, i32* %arrayidx2, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %7, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !57
  store i32 0, i32* %arrayidx3, align 4, !dbg !58
  %9 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %9), !dbg !60
  %10 = load i32*, i32** %data, align 8, !dbg !61
  %11 = bitcast i32* %10 to i8*, !dbg !61
  call void @free(i8* %11) #4, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !64 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !69
  %1 = load i32*, i32** %0, align 8, !dbg !70
  store i32* %1, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !76
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !77
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !83
  %cmp = icmp ult i64 %2, 100, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !89
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !89
  %5 = load i32*, i32** %data, align 8, !dbg !90
  %6 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !90
  store i32 %4, i32* %arrayidx2, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %7, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !98
  store i32 0, i32* %arrayidx3, align 4, !dbg !99
  %9 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %9), !dbg !101
  %10 = load i32*, i32** %data, align 8, !dbg !102
  %11 = bitcast i32* %10 to i8*, !dbg !102
  call void @free(i8* %11) #4, !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 87, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!21 = !DILocation(line: 25, column: 15, scope: !9)
!22 = !DILocation(line: 25, column: 23, scope: !9)
!23 = !DILocation(line: 25, column: 22, scope: !9)
!24 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 27, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !27)
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 27, column: 16, scope: !25)
!29 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 28, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 28, column: 17, scope: !25)
!34 = !DILocation(line: 29, column: 17, scope: !25)
!35 = !DILocation(line: 29, column: 9, scope: !25)
!36 = !DILocation(line: 30, column: 9, scope: !25)
!37 = !DILocation(line: 30, column: 23, scope: !25)
!38 = !DILocation(line: 32, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !25, file: !10, line: 32, column: 9)
!40 = !DILocation(line: 32, column: 14, scope: !39)
!41 = !DILocation(line: 32, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 32, column: 9)
!43 = !DILocation(line: 32, column: 23, scope: !42)
!44 = !DILocation(line: 32, column: 9, scope: !39)
!45 = !DILocation(line: 34, column: 30, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !10, line: 33, column: 9)
!47 = !DILocation(line: 34, column: 23, scope: !46)
!48 = !DILocation(line: 34, column: 13, scope: !46)
!49 = !DILocation(line: 34, column: 18, scope: !46)
!50 = !DILocation(line: 34, column: 21, scope: !46)
!51 = !DILocation(line: 35, column: 9, scope: !46)
!52 = !DILocation(line: 32, column: 31, scope: !42)
!53 = !DILocation(line: 32, column: 9, scope: !42)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 35, column: 9, scope: !39)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 36, column: 9, scope: !25)
!58 = !DILocation(line: 36, column: 21, scope: !25)
!59 = !DILocation(line: 37, column: 20, scope: !25)
!60 = !DILocation(line: 37, column: 9, scope: !25)
!61 = !DILocation(line: 38, column: 14, scope: !25)
!62 = !DILocation(line: 38, column: 9, scope: !25)
!63 = !DILocation(line: 40, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_63b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !64, file: !10, line: 47, type: !13)
!66 = !DILocation(line: 47, column: 91, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 49, type: !14)
!68 = !DILocation(line: 49, column: 15, scope: !64)
!69 = !DILocation(line: 49, column: 23, scope: !64)
!70 = !DILocation(line: 49, column: 22, scope: !64)
!71 = !DILocalVariable(name: "i", scope: !72, file: !10, line: 51, type: !26)
!72 = distinct !DILexicalBlock(scope: !64, file: !10, line: 50, column: 5)
!73 = !DILocation(line: 51, column: 16, scope: !72)
!74 = !DILocalVariable(name: "source", scope: !72, file: !10, line: 52, type: !30)
!75 = !DILocation(line: 52, column: 17, scope: !72)
!76 = !DILocation(line: 53, column: 17, scope: !72)
!77 = !DILocation(line: 53, column: 9, scope: !72)
!78 = !DILocation(line: 54, column: 9, scope: !72)
!79 = !DILocation(line: 54, column: 23, scope: !72)
!80 = !DILocation(line: 56, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !10, line: 56, column: 9)
!82 = !DILocation(line: 56, column: 14, scope: !81)
!83 = !DILocation(line: 56, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 56, column: 9)
!85 = !DILocation(line: 56, column: 23, scope: !84)
!86 = !DILocation(line: 56, column: 9, scope: !81)
!87 = !DILocation(line: 58, column: 30, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !10, line: 57, column: 9)
!89 = !DILocation(line: 58, column: 23, scope: !88)
!90 = !DILocation(line: 58, column: 13, scope: !88)
!91 = !DILocation(line: 58, column: 18, scope: !88)
!92 = !DILocation(line: 58, column: 21, scope: !88)
!93 = !DILocation(line: 59, column: 9, scope: !88)
!94 = !DILocation(line: 56, column: 31, scope: !84)
!95 = !DILocation(line: 56, column: 9, scope: !84)
!96 = distinct !{!96, !86, !97, !56}
!97 = !DILocation(line: 59, column: 9, scope: !81)
!98 = !DILocation(line: 60, column: 9, scope: !72)
!99 = !DILocation(line: 60, column: 21, scope: !72)
!100 = !DILocation(line: 61, column: 20, scope: !72)
!101 = !DILocation(line: 61, column: 9, scope: !72)
!102 = !DILocation(line: 62, column: 14, scope: !72)
!103 = !DILocation(line: 62, column: 9, scope: !72)
!104 = !DILocation(line: 64, column: 1, scope: !64)
