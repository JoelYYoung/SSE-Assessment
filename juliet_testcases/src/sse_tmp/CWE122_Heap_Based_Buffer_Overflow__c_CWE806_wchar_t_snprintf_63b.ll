; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !22
  %1 = load i32*, i32** %0, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !30
  %3 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i64 @wcslen(i32* %3) #6, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #7, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  call void @printWLine(i32* %5), !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  %7 = bitcast i32* %6 to i8*, !dbg !37
  call void @free(i8* %7) #7, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !40 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !45
  %1 = load i32*, i32** %0, align 8, !dbg !46
  store i32* %1, i32** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !49
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !49
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !50
  %3 = load i32*, i32** %data, align 8, !dbg !51
  %call = call i64 @wcslen(i32* %3) #6, !dbg !52
  %4 = load i32*, i32** %data, align 8, !dbg !53
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #7, !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %5), !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %7 = bitcast i32* %6 to i8*, !dbg !57
  call void @free(i8* %7) #7, !dbg !58
  ret void, !dbg !59
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b_badSink", scope: !10, file: !10, line: 29, type: !11, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 29, type: !13)
!19 = !DILocation(line: 29, column: 91, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 31, type: !14)
!21 = !DILocation(line: 31, column: 15, scope: !9)
!22 = !DILocation(line: 31, column: 23, scope: !9)
!23 = !DILocation(line: 31, column: 22, scope: !9)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 33, column: 17, scope: !25)
!30 = !DILocation(line: 35, column: 18, scope: !25)
!31 = !DILocation(line: 35, column: 31, scope: !25)
!32 = !DILocation(line: 35, column: 24, scope: !25)
!33 = !DILocation(line: 35, column: 45, scope: !25)
!34 = !DILocation(line: 35, column: 9, scope: !25)
!35 = !DILocation(line: 36, column: 20, scope: !25)
!36 = !DILocation(line: 36, column: 9, scope: !25)
!37 = !DILocation(line: 37, column: 14, scope: !25)
!38 = !DILocation(line: 37, column: 9, scope: !25)
!39 = !DILocation(line: 39, column: 1, scope: !9)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_63b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !40, file: !10, line: 46, type: !13)
!42 = !DILocation(line: 46, column: 95, scope: !40)
!43 = !DILocalVariable(name: "data", scope: !40, file: !10, line: 48, type: !14)
!44 = !DILocation(line: 48, column: 15, scope: !40)
!45 = !DILocation(line: 48, column: 23, scope: !40)
!46 = !DILocation(line: 48, column: 22, scope: !40)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !10, line: 50, type: !26)
!48 = distinct !DILexicalBlock(scope: !40, file: !10, line: 49, column: 5)
!49 = !DILocation(line: 50, column: 17, scope: !48)
!50 = !DILocation(line: 52, column: 18, scope: !48)
!51 = !DILocation(line: 52, column: 31, scope: !48)
!52 = !DILocation(line: 52, column: 24, scope: !48)
!53 = !DILocation(line: 52, column: 45, scope: !48)
!54 = !DILocation(line: 52, column: 9, scope: !48)
!55 = !DILocation(line: 53, column: 20, scope: !48)
!56 = !DILocation(line: 53, column: 9, scope: !48)
!57 = !DILocation(line: 54, column: 14, scope: !48)
!58 = !DILocation(line: 54, column: 9, scope: !48)
!59 = !DILocation(line: 56, column: 1, scope: !40)
