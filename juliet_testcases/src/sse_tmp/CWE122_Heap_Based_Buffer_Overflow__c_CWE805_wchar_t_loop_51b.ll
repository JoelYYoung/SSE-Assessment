; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %0, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !42
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !42
  %3 = load i32*, i32** %data.addr, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !43
  store i32 %2, i32* %arrayidx2, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %5, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %7 = load i32*, i32** %data.addr, align 8, !dbg !54
  call void @printWLine(i32* %7), !dbg !55
  %8 = load i32*, i32** %data.addr, align 8, !dbg !56
  %9 = bitcast i32* %8 to i8*, !dbg !56
  call void @free(i8* %9) #4, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b_goodG2BSink(i32* %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %i, metadata !62, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !65, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !67
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !68
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !70
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !74
  %cmp = icmp ult i64 %0, 100, !dbg !76
  br i1 %cmp, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !80
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !80
  %3 = load i32*, i32** %data.addr, align 8, !dbg !81
  %4 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !81
  store i32 %2, i32* %arrayidx2, align 4, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !85
  %inc = add i64 %5, 1, !dbg !85
  store i64 %inc, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !89
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !89
  store i32 0, i32* %arrayidx3, align 4, !dbg !90
  %7 = load i32*, i32** %data.addr, align 8, !dbg !91
  call void @printWLine(i32* %7), !dbg !92
  %8 = load i32*, i32** %data.addr, align 8, !dbg !93
  %9 = bitcast i32* %8 to i8*, !dbg !93
  call void @free(i8* %9) #4, !dbg !94
  ret void, !dbg !95
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!18 = !DILocation(line: 25, column: 85, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 28, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !22)
!22 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 28, column: 16, scope: !20)
!24 = !DILocalVariable(name: "source", scope: !20, file: !10, line: 29, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 29, column: 17, scope: !20)
!29 = !DILocation(line: 30, column: 17, scope: !20)
!30 = !DILocation(line: 30, column: 9, scope: !20)
!31 = !DILocation(line: 31, column: 9, scope: !20)
!32 = !DILocation(line: 31, column: 23, scope: !20)
!33 = !DILocation(line: 33, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 33, column: 9)
!35 = !DILocation(line: 33, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 33, column: 9)
!38 = !DILocation(line: 33, column: 23, scope: !37)
!39 = !DILocation(line: 33, column: 9, scope: !34)
!40 = !DILocation(line: 35, column: 30, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 34, column: 9)
!42 = !DILocation(line: 35, column: 23, scope: !41)
!43 = !DILocation(line: 35, column: 13, scope: !41)
!44 = !DILocation(line: 35, column: 18, scope: !41)
!45 = !DILocation(line: 35, column: 21, scope: !41)
!46 = !DILocation(line: 36, column: 9, scope: !41)
!47 = !DILocation(line: 33, column: 31, scope: !37)
!48 = !DILocation(line: 33, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 36, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 37, column: 9, scope: !20)
!53 = !DILocation(line: 37, column: 21, scope: !20)
!54 = !DILocation(line: 38, column: 20, scope: !20)
!55 = !DILocation(line: 38, column: 9, scope: !20)
!56 = !DILocation(line: 39, column: 14, scope: !20)
!57 = !DILocation(line: 39, column: 9, scope: !20)
!58 = !DILocation(line: 41, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_51b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !10, line: 48, type: !13)
!61 = !DILocation(line: 48, column: 89, scope: !59)
!62 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 51, type: !21)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 50, column: 5)
!64 = !DILocation(line: 51, column: 16, scope: !63)
!65 = !DILocalVariable(name: "source", scope: !63, file: !10, line: 52, type: !25)
!66 = !DILocation(line: 52, column: 17, scope: !63)
!67 = !DILocation(line: 53, column: 17, scope: !63)
!68 = !DILocation(line: 53, column: 9, scope: !63)
!69 = !DILocation(line: 54, column: 9, scope: !63)
!70 = !DILocation(line: 54, column: 23, scope: !63)
!71 = !DILocation(line: 56, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !63, file: !10, line: 56, column: 9)
!73 = !DILocation(line: 56, column: 14, scope: !72)
!74 = !DILocation(line: 56, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 56, column: 9)
!76 = !DILocation(line: 56, column: 23, scope: !75)
!77 = !DILocation(line: 56, column: 9, scope: !72)
!78 = !DILocation(line: 58, column: 30, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 57, column: 9)
!80 = !DILocation(line: 58, column: 23, scope: !79)
!81 = !DILocation(line: 58, column: 13, scope: !79)
!82 = !DILocation(line: 58, column: 18, scope: !79)
!83 = !DILocation(line: 58, column: 21, scope: !79)
!84 = !DILocation(line: 59, column: 9, scope: !79)
!85 = !DILocation(line: 56, column: 31, scope: !75)
!86 = !DILocation(line: 56, column: 9, scope: !75)
!87 = distinct !{!87, !77, !88, !51}
!88 = !DILocation(line: 59, column: 9, scope: !72)
!89 = !DILocation(line: 60, column: 9, scope: !63)
!90 = !DILocation(line: 60, column: 21, scope: !63)
!91 = !DILocation(line: 61, column: 20, scope: !63)
!92 = !DILocation(line: 61, column: 9, scope: !63)
!93 = !DILocation(line: 62, column: 14, scope: !63)
!94 = !DILocation(line: 62, column: 9, scope: !63)
!95 = !DILocation(line: 64, column: 1, scope: !59)
