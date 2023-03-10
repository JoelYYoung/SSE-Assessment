; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i32**, !dbg !23
  store i32** %1, i32*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !26
  %3 = load i32*, i32** %2, align 8, !dbg !27
  store i32* %3, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %6 = bitcast i32* %5 to i8*, !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !35
  %7 = bitcast i32* %arraydecay to i8*, !dbg !35
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !35
  %8 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !36
  %9 = load i32, i32* %arrayidx, align 4, !dbg !36
  call void @printIntLine(i32 %9), !dbg !37
  %10 = load i32*, i32** %data, align 8, !dbg !38
  %11 = bitcast i32* %10 to i8*, !dbg !38
  call void @free(i8* %11) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !41 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !46
  %1 = bitcast i8* %0 to i32**, !dbg !47
  store i32** %1, i32*** %dataPtr, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data, metadata !48, metadata !DIExpression()), !dbg !49
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !50
  %3 = load i32*, i32** %2, align 8, !dbg !51
  store i32* %3, i32** %data, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  %6 = bitcast i32* %5 to i8*, !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %7 = bitcast i32* %arraydecay to i8*, !dbg !56
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !56
  %8 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !57
  %9 = load i32, i32* %arrayidx, align 4, !dbg !57
  call void @printIntLine(i32 %9), !dbg !58
  %10 = load i32*, i32** %data, align 8, !dbg !59
  %11 = bitcast i32* %10 to i8*, !dbg !59
  call void @free(i8* %11) #6, !dbg !60
  ret void, !dbg !61
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 21, type: !17)
!19 = !DILocation(line: 21, column: 81, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 24, type: !4)
!21 = !DILocation(line: 24, column: 13, scope: !13)
!22 = !DILocation(line: 24, column: 32, scope: !13)
!23 = !DILocation(line: 24, column: 23, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !5)
!25 = !DILocation(line: 26, column: 11, scope: !13)
!26 = !DILocation(line: 26, column: 20, scope: !13)
!27 = !DILocation(line: 26, column: 19, scope: !13)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 28, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 28, column: 13, scope: !29)
!34 = !DILocation(line: 30, column: 17, scope: !29)
!35 = !DILocation(line: 30, column: 9, scope: !29)
!36 = !DILocation(line: 31, column: 22, scope: !29)
!37 = !DILocation(line: 31, column: 9, scope: !29)
!38 = !DILocation(line: 32, column: 14, scope: !29)
!39 = !DILocation(line: 32, column: 9, scope: !29)
!40 = !DILocation(line: 34, column: 1, scope: !13)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_64b_goodG2BSink", scope: !14, file: !14, line: 41, type: !15, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !41, file: !14, line: 41, type: !17)
!43 = !DILocation(line: 41, column: 85, scope: !41)
!44 = !DILocalVariable(name: "dataPtr", scope: !41, file: !14, line: 44, type: !4)
!45 = !DILocation(line: 44, column: 13, scope: !41)
!46 = !DILocation(line: 44, column: 32, scope: !41)
!47 = !DILocation(line: 44, column: 23, scope: !41)
!48 = !DILocalVariable(name: "data", scope: !41, file: !14, line: 46, type: !5)
!49 = !DILocation(line: 46, column: 11, scope: !41)
!50 = !DILocation(line: 46, column: 20, scope: !41)
!51 = !DILocation(line: 46, column: 19, scope: !41)
!52 = !DILocalVariable(name: "source", scope: !53, file: !14, line: 48, type: !30)
!53 = distinct !DILexicalBlock(scope: !41, file: !14, line: 47, column: 5)
!54 = !DILocation(line: 48, column: 13, scope: !53)
!55 = !DILocation(line: 50, column: 17, scope: !53)
!56 = !DILocation(line: 50, column: 9, scope: !53)
!57 = !DILocation(line: 51, column: 22, scope: !53)
!58 = !DILocation(line: 51, column: 9, scope: !53)
!59 = !DILocation(line: 52, column: 14, scope: !53)
!60 = !DILocation(line: 52, column: 9, scope: !53)
!61 = !DILocation(line: 54, column: 1, scope: !41)
