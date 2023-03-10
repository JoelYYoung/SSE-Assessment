; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b_badSink(i32** %dataArray) #0 !dbg !9 {
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
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !30
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx1, align 4, !dbg !32
  %2 = load i32*, i32** %data, align 8, !dbg !33
  %3 = bitcast i32* %2 to i8*, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !34
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !35
  store i32 0, i32* %arrayidx3, align 4, !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  call void @printWLine(i32* %6), !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  %8 = bitcast i32* %7 to i8*, !dbg !39
  call void @free(i8* %8) #5, !dbg !40
  ret void, !dbg !41
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b_goodG2BSink(i32** %dataArray) #0 !dbg !42 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !47
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !47
  store i32* %1, i32** %data, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !52
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx1, align 4, !dbg !54
  %2 = load i32*, i32** %data, align 8, !dbg !55
  %3 = bitcast i32* %2 to i8*, !dbg !56
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !56
  %5 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !57
  store i32 0, i32* %arrayidx3, align 4, !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %6), !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %8 = bitcast i32* %7 to i8*, !dbg !61
  call void @free(i8* %8) #5, !dbg !62
  ret void, !dbg !63
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 87, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!21 = !DILocation(line: 26, column: 15, scope: !9)
!22 = !DILocation(line: 26, column: 22, scope: !9)
!23 = !DILocalVariable(name: "source", scope: !24, file: !10, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 28, column: 17, scope: !24)
!29 = !DILocation(line: 29, column: 17, scope: !24)
!30 = !DILocation(line: 29, column: 9, scope: !24)
!31 = !DILocation(line: 30, column: 9, scope: !24)
!32 = !DILocation(line: 30, column: 23, scope: !24)
!33 = !DILocation(line: 32, column: 16, scope: !24)
!34 = !DILocation(line: 32, column: 9, scope: !24)
!35 = !DILocation(line: 33, column: 9, scope: !24)
!36 = !DILocation(line: 33, column: 21, scope: !24)
!37 = !DILocation(line: 34, column: 20, scope: !24)
!38 = !DILocation(line: 34, column: 9, scope: !24)
!39 = !DILocation(line: 35, column: 14, scope: !24)
!40 = !DILocation(line: 35, column: 9, scope: !24)
!41 = !DILocation(line: 37, column: 1, scope: !9)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_66b_goodG2BSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "dataArray", arg: 1, scope: !42, file: !10, line: 44, type: !13)
!44 = !DILocation(line: 44, column: 91, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !10, line: 46, type: !14)
!46 = !DILocation(line: 46, column: 15, scope: !42)
!47 = !DILocation(line: 46, column: 22, scope: !42)
!48 = !DILocalVariable(name: "source", scope: !49, file: !10, line: 48, type: !25)
!49 = distinct !DILexicalBlock(scope: !42, file: !10, line: 47, column: 5)
!50 = !DILocation(line: 48, column: 17, scope: !49)
!51 = !DILocation(line: 49, column: 17, scope: !49)
!52 = !DILocation(line: 49, column: 9, scope: !49)
!53 = !DILocation(line: 50, column: 9, scope: !49)
!54 = !DILocation(line: 50, column: 23, scope: !49)
!55 = !DILocation(line: 52, column: 16, scope: !49)
!56 = !DILocation(line: 52, column: 9, scope: !49)
!57 = !DILocation(line: 53, column: 9, scope: !49)
!58 = !DILocation(line: 53, column: 21, scope: !49)
!59 = !DILocation(line: 54, column: 20, scope: !49)
!60 = !DILocation(line: 54, column: 9, scope: !49)
!61 = !DILocation(line: 55, column: 14, scope: !49)
!62 = !DILocation(line: 55, column: 9, scope: !49)
!63 = !DILocation(line: 57, column: 1, scope: !42)
