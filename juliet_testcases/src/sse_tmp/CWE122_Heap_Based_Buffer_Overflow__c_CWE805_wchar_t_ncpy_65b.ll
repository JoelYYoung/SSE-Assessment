; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !25
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !26
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %0 = load i32*, i32** %data.addr, align 8, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !30
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !31
  %1 = load i32*, i32** %data.addr, align 8, !dbg !32
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !32
  store i32 0, i32* %arrayidx3, align 4, !dbg !33
  %2 = load i32*, i32** %data.addr, align 8, !dbg !34
  call void @printWLine(i32* %2), !dbg !35
  %3 = load i32*, i32** %data.addr, align 8, !dbg !36
  %4 = bitcast i32* %3 to i8*, !dbg !36
  call void @free(i8* %4) #4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b_goodG2BSink(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %0 = load i32*, i32** %data.addr, align 8, !dbg !49
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !51
  %1 = load i32*, i32** %data.addr, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %2 = load i32*, i32** %data.addr, align 8, !dbg !54
  call void @printWLine(i32* %2), !dbg !55
  %3 = load i32*, i32** %data.addr, align 8, !dbg !56
  %4 = bitcast i32* %3 to i8*, !dbg !56
  call void @free(i8* %4) #4, !dbg !57
  ret void, !dbg !58
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!18 = !DILocation(line: 23, column: 85, scope: !9)
!19 = !DILocalVariable(name: "source", scope: !20, file: !10, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3200, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 17, scope: !20)
!25 = !DILocation(line: 27, column: 17, scope: !20)
!26 = !DILocation(line: 27, column: 9, scope: !20)
!27 = !DILocation(line: 28, column: 9, scope: !20)
!28 = !DILocation(line: 28, column: 23, scope: !20)
!29 = !DILocation(line: 30, column: 17, scope: !20)
!30 = !DILocation(line: 30, column: 23, scope: !20)
!31 = !DILocation(line: 30, column: 9, scope: !20)
!32 = !DILocation(line: 31, column: 9, scope: !20)
!33 = !DILocation(line: 31, column: 21, scope: !20)
!34 = !DILocation(line: 32, column: 20, scope: !20)
!35 = !DILocation(line: 32, column: 9, scope: !20)
!36 = !DILocation(line: 33, column: 14, scope: !20)
!37 = !DILocation(line: 33, column: 9, scope: !20)
!38 = !DILocation(line: 35, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_65b_goodG2BSink", scope: !10, file: !10, line: 42, type: !11, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !10, line: 42, type: !13)
!41 = !DILocation(line: 42, column: 89, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !10, line: 45, type: !21)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 44, column: 5)
!44 = !DILocation(line: 45, column: 17, scope: !43)
!45 = !DILocation(line: 46, column: 17, scope: !43)
!46 = !DILocation(line: 46, column: 9, scope: !43)
!47 = !DILocation(line: 47, column: 9, scope: !43)
!48 = !DILocation(line: 47, column: 23, scope: !43)
!49 = !DILocation(line: 49, column: 17, scope: !43)
!50 = !DILocation(line: 49, column: 23, scope: !43)
!51 = !DILocation(line: 49, column: 9, scope: !43)
!52 = !DILocation(line: 50, column: 9, scope: !43)
!53 = !DILocation(line: 50, column: 21, scope: !43)
!54 = !DILocation(line: 51, column: 20, scope: !43)
!55 = !DILocation(line: 51, column: 9, scope: !43)
!56 = !DILocation(line: 52, column: 14, scope: !43)
!57 = !DILocation(line: 52, column: 9, scope: !43)
!58 = !DILocation(line: 54, column: 1, scope: !39)
