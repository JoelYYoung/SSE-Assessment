; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68_badData = external dso_local global i32*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %2 = bitcast i32* %1 to i8*, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !31
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !31
  %4 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !32
  store i32 0, i32* %arrayidx2, align 4, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  call void @printWLine(i32* %5), !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %7 = bitcast i32* %6 to i8*, !dbg !36
  call void @free(i8* %7) #5, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b_goodG2BSink() #0 !dbg !39 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68_goodG2BData, align 8, !dbg !42
  store i32* %0, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  %2 = bitcast i32* %1 to i8*, !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !52
  store i32 0, i32* %arrayidx2, align 4, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %5), !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %7 = bitcast i32* %6 to i8*, !dbg !56
  call void @free(i8* %7) #5, !dbg !57
  ret void, !dbg !58
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 15, scope: !9)
!19 = !DILocation(line: 30, column: 22, scope: !9)
!20 = !DILocalVariable(name: "source", scope: !21, file: !10, line: 32, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 32, column: 17, scope: !21)
!26 = !DILocation(line: 33, column: 17, scope: !21)
!27 = !DILocation(line: 33, column: 9, scope: !21)
!28 = !DILocation(line: 34, column: 9, scope: !21)
!29 = !DILocation(line: 34, column: 23, scope: !21)
!30 = !DILocation(line: 36, column: 16, scope: !21)
!31 = !DILocation(line: 36, column: 9, scope: !21)
!32 = !DILocation(line: 37, column: 9, scope: !21)
!33 = !DILocation(line: 37, column: 21, scope: !21)
!34 = !DILocation(line: 38, column: 20, scope: !21)
!35 = !DILocation(line: 38, column: 9, scope: !21)
!36 = !DILocation(line: 39, column: 14, scope: !21)
!37 = !DILocation(line: 39, column: 9, scope: !21)
!38 = !DILocation(line: 41, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_68b_goodG2BSink", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", scope: !39, file: !10, line: 50, type: !14)
!41 = !DILocation(line: 50, column: 15, scope: !39)
!42 = !DILocation(line: 50, column: 22, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !10, line: 52, type: !22)
!44 = distinct !DILexicalBlock(scope: !39, file: !10, line: 51, column: 5)
!45 = !DILocation(line: 52, column: 17, scope: !44)
!46 = !DILocation(line: 53, column: 17, scope: !44)
!47 = !DILocation(line: 53, column: 9, scope: !44)
!48 = !DILocation(line: 54, column: 9, scope: !44)
!49 = !DILocation(line: 54, column: 23, scope: !44)
!50 = !DILocation(line: 56, column: 16, scope: !44)
!51 = !DILocation(line: 56, column: 9, scope: !44)
!52 = !DILocation(line: 57, column: 9, scope: !44)
!53 = !DILocation(line: 57, column: 21, scope: !44)
!54 = !DILocation(line: 58, column: 20, scope: !44)
!55 = !DILocation(line: 58, column: 9, scope: !44)
!56 = !DILocation(line: 59, column: 14, scope: !44)
!57 = !DILocation(line: 59, column: 9, scope: !44)
!58 = !DILocation(line: 61, column: 1, scope: !39)
