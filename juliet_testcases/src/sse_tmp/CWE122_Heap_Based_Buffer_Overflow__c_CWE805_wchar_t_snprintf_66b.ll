; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !30
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx1, align 4, !dbg !32
  %2 = load i32*, i32** %data, align 8, !dbg !33
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !34
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %2, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #4, !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  call void @printWLine(i32* %3), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %5 = bitcast i32* %4 to i8*, !dbg !38
  call void @free(i8* %5) #4, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_goodG2BSink(i32** %dataArray) #0 !dbg !41 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !46
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !46
  store i32* %1, i32** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx1, align 4, !dbg !53
  %2 = load i32*, i32** %data, align 8, !dbg !54
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %2, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #4, !dbg !56
  %3 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %3), !dbg !58
  %4 = load i32*, i32** %data, align 8, !dbg !59
  %5 = bitcast i32* %4 to i8*, !dbg !59
  call void @free(i8* %5) #4, !dbg !60
  ret void, !dbg !61
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_badSink", scope: !10, file: !10, line: 29, type: !11, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 29, type: !13)
!19 = !DILocation(line: 29, column: 89, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 32, type: !14)
!21 = !DILocation(line: 32, column: 15, scope: !9)
!22 = !DILocation(line: 32, column: 22, scope: !9)
!23 = !DILocalVariable(name: "source", scope: !24, file: !10, line: 34, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 33, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 34, column: 17, scope: !24)
!29 = !DILocation(line: 35, column: 17, scope: !24)
!30 = !DILocation(line: 35, column: 9, scope: !24)
!31 = !DILocation(line: 36, column: 9, scope: !24)
!32 = !DILocation(line: 36, column: 23, scope: !24)
!33 = !DILocation(line: 38, column: 18, scope: !24)
!34 = !DILocation(line: 38, column: 36, scope: !24)
!35 = !DILocation(line: 38, column: 9, scope: !24)
!36 = !DILocation(line: 39, column: 20, scope: !24)
!37 = !DILocation(line: 39, column: 9, scope: !24)
!38 = !DILocation(line: 40, column: 14, scope: !24)
!39 = !DILocation(line: 40, column: 9, scope: !24)
!40 = !DILocation(line: 42, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "dataArray", arg: 1, scope: !41, file: !10, line: 49, type: !13)
!43 = !DILocation(line: 49, column: 93, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !10, line: 51, type: !14)
!45 = !DILocation(line: 51, column: 15, scope: !41)
!46 = !DILocation(line: 51, column: 22, scope: !41)
!47 = !DILocalVariable(name: "source", scope: !48, file: !10, line: 53, type: !25)
!48 = distinct !DILexicalBlock(scope: !41, file: !10, line: 52, column: 5)
!49 = !DILocation(line: 53, column: 17, scope: !48)
!50 = !DILocation(line: 54, column: 17, scope: !48)
!51 = !DILocation(line: 54, column: 9, scope: !48)
!52 = !DILocation(line: 55, column: 9, scope: !48)
!53 = !DILocation(line: 55, column: 23, scope: !48)
!54 = !DILocation(line: 57, column: 18, scope: !48)
!55 = !DILocation(line: 57, column: 36, scope: !48)
!56 = !DILocation(line: 57, column: 9, scope: !48)
!57 = !DILocation(line: 58, column: 20, scope: !48)
!58 = !DILocation(line: 58, column: 9, scope: !48)
!59 = !DILocation(line: 59, column: 14, scope: !48)
!60 = !DILocation(line: 59, column: 9, scope: !48)
!61 = !DILocation(line: 61, column: 1, scope: !41)
