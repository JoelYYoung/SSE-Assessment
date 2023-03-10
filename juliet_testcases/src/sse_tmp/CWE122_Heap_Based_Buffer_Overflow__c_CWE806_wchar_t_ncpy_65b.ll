; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !25
  %1 = load i32*, i32** %data.addr, align 8, !dbg !26
  %2 = load i32*, i32** %data.addr, align 8, !dbg !27
  %call = call i64 @wcslen(i32* %2) #6, !dbg !28
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %1, i64 %call) #7, !dbg !29
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %3 = load i32*, i32** %data.addr, align 8, !dbg !32
  call void @printWLine(i32* %3), !dbg !33
  %4 = load i32*, i32** %data.addr, align 8, !dbg !34
  %5 = bitcast i32* %4 to i8*, !dbg !34
  call void @free(i8* %5) #7, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b_goodG2BSink(i32* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %1 = load i32*, i32** %data.addr, align 8, !dbg !44
  %2 = load i32*, i32** %data.addr, align 8, !dbg !45
  %call = call i64 @wcslen(i32* %2) #6, !dbg !46
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %1, i64 %call) #7, !dbg !47
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  %3 = load i32*, i32** %data.addr, align 8, !dbg !50
  call void @printWLine(i32* %3), !dbg !51
  %4 = load i32*, i32** %data.addr, align 8, !dbg !52
  %5 = bitcast i32* %4 to i8*, !dbg !52
  call void @free(i8* %5) #7, !dbg !53
  ret void, !dbg !54
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!18 = !DILocation(line: 23, column: 85, scope: !9)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !10, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 1600, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 17, scope: !20)
!25 = !DILocation(line: 28, column: 17, scope: !20)
!26 = !DILocation(line: 28, column: 23, scope: !20)
!27 = !DILocation(line: 28, column: 36, scope: !20)
!28 = !DILocation(line: 28, column: 29, scope: !20)
!29 = !DILocation(line: 28, column: 9, scope: !20)
!30 = !DILocation(line: 29, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 20, scope: !20)
!32 = !DILocation(line: 30, column: 20, scope: !20)
!33 = !DILocation(line: 30, column: 9, scope: !20)
!34 = !DILocation(line: 31, column: 14, scope: !20)
!35 = !DILocation(line: 31, column: 9, scope: !20)
!36 = !DILocation(line: 33, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_65b_goodG2BSink", scope: !10, file: !10, line: 40, type: !11, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !10, line: 40, type: !13)
!39 = !DILocation(line: 40, column: 89, scope: !37)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !10, line: 43, type: !21)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 42, column: 5)
!42 = !DILocation(line: 43, column: 17, scope: !41)
!43 = !DILocation(line: 45, column: 17, scope: !41)
!44 = !DILocation(line: 45, column: 23, scope: !41)
!45 = !DILocation(line: 45, column: 36, scope: !41)
!46 = !DILocation(line: 45, column: 29, scope: !41)
!47 = !DILocation(line: 45, column: 9, scope: !41)
!48 = !DILocation(line: 46, column: 9, scope: !41)
!49 = !DILocation(line: 46, column: 20, scope: !41)
!50 = !DILocation(line: 47, column: 20, scope: !41)
!51 = !DILocation(line: 47, column: 9, scope: !41)
!52 = !DILocation(line: 48, column: 14, scope: !41)
!53 = !DILocation(line: 48, column: 9, scope: !41)
!54 = !DILocation(line: 50, column: 1, scope: !37)
