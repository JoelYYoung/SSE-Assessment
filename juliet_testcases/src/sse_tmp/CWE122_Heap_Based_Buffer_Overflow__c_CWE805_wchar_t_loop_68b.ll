; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68_badData = external dso_local global i32*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !30
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !31
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %1, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !43
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %5 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !44
  store i32 %3, i32* %arrayidx2, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %6, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !53
  store i32 0, i32* %arrayidx3, align 4, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %8), !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  %10 = bitcast i32* %9 to i8*, !dbg !57
  call void @free(i8* %10) #4, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b_goodG2BSink() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68_goodG2BData, align 8, !dbg !63
  store i32* %0, i32** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i64* %i, metadata !64, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !69
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !70
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !71
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  store i64 0, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !76
  %cmp = icmp ult i64 %1, 100, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !82
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !82
  %4 = load i32*, i32** %data, align 8, !dbg !83
  %5 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !83
  store i32 %3, i32* %arrayidx2, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %6, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !91
  store i32 0, i32* %arrayidx3, align 4, !dbg !92
  %8 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %8), !dbg !94
  %9 = load i32*, i32** %data, align 8, !dbg !95
  %10 = bitcast i32* %9 to i8*, !dbg !95
  call void @free(i8* %10) #4, !dbg !96
  ret void, !dbg !97
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 15, scope: !9)
!19 = !DILocation(line: 30, column: 22, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 32, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !23)
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 32, column: 16, scope: !21)
!25 = !DILocalVariable(name: "source", scope: !21, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 33, column: 17, scope: !21)
!30 = !DILocation(line: 34, column: 17, scope: !21)
!31 = !DILocation(line: 34, column: 9, scope: !21)
!32 = !DILocation(line: 35, column: 9, scope: !21)
!33 = !DILocation(line: 35, column: 23, scope: !21)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !10, line: 37, column: 9)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocation(line: 37, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 37, column: 9)
!39 = !DILocation(line: 37, column: 23, scope: !38)
!40 = !DILocation(line: 37, column: 9, scope: !35)
!41 = !DILocation(line: 39, column: 30, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !10, line: 38, column: 9)
!43 = !DILocation(line: 39, column: 23, scope: !42)
!44 = !DILocation(line: 39, column: 13, scope: !42)
!45 = !DILocation(line: 39, column: 18, scope: !42)
!46 = !DILocation(line: 39, column: 21, scope: !42)
!47 = !DILocation(line: 40, column: 9, scope: !42)
!48 = !DILocation(line: 37, column: 31, scope: !38)
!49 = !DILocation(line: 37, column: 9, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 40, column: 9, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 41, column: 9, scope: !21)
!54 = !DILocation(line: 41, column: 21, scope: !21)
!55 = !DILocation(line: 42, column: 20, scope: !21)
!56 = !DILocation(line: 42, column: 9, scope: !21)
!57 = !DILocation(line: 43, column: 14, scope: !21)
!58 = !DILocation(line: 43, column: 9, scope: !21)
!59 = !DILocation(line: 45, column: 1, scope: !9)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_68b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !10, line: 54, type: !14)
!62 = !DILocation(line: 54, column: 15, scope: !60)
!63 = !DILocation(line: 54, column: 22, scope: !60)
!64 = !DILocalVariable(name: "i", scope: !65, file: !10, line: 56, type: !22)
!65 = distinct !DILexicalBlock(scope: !60, file: !10, line: 55, column: 5)
!66 = !DILocation(line: 56, column: 16, scope: !65)
!67 = !DILocalVariable(name: "source", scope: !65, file: !10, line: 57, type: !26)
!68 = !DILocation(line: 57, column: 17, scope: !65)
!69 = !DILocation(line: 58, column: 17, scope: !65)
!70 = !DILocation(line: 58, column: 9, scope: !65)
!71 = !DILocation(line: 59, column: 9, scope: !65)
!72 = !DILocation(line: 59, column: 23, scope: !65)
!73 = !DILocation(line: 61, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !65, file: !10, line: 61, column: 9)
!75 = !DILocation(line: 61, column: 14, scope: !74)
!76 = !DILocation(line: 61, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !10, line: 61, column: 9)
!78 = !DILocation(line: 61, column: 23, scope: !77)
!79 = !DILocation(line: 61, column: 9, scope: !74)
!80 = !DILocation(line: 63, column: 30, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !10, line: 62, column: 9)
!82 = !DILocation(line: 63, column: 23, scope: !81)
!83 = !DILocation(line: 63, column: 13, scope: !81)
!84 = !DILocation(line: 63, column: 18, scope: !81)
!85 = !DILocation(line: 63, column: 21, scope: !81)
!86 = !DILocation(line: 64, column: 9, scope: !81)
!87 = !DILocation(line: 61, column: 31, scope: !77)
!88 = !DILocation(line: 61, column: 9, scope: !77)
!89 = distinct !{!89, !79, !90, !52}
!90 = !DILocation(line: 64, column: 9, scope: !74)
!91 = !DILocation(line: 65, column: 9, scope: !65)
!92 = !DILocation(line: 65, column: 21, scope: !65)
!93 = !DILocation(line: 66, column: 20, scope: !65)
!94 = !DILocation(line: 66, column: 9, scope: !65)
!95 = !DILocation(line: 67, column: 14, scope: !65)
!96 = !DILocation(line: 67, column: 9, scope: !65)
!97 = !DILocation(line: 69, column: 1, scope: !60)
