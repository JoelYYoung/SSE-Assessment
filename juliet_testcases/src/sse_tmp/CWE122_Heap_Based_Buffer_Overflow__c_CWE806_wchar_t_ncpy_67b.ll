; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !32
  %2 = load i32*, i32** %data, align 8, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i64 @wcslen(i32* %3) #6, !dbg !35
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %2, i64 %call) #7, !dbg !36
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* %4), !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %6 = bitcast i32* %5 to i8*, !dbg !41
  call void @free(i8* %6) #7, !dbg !42
  ret void, !dbg !43
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !44 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType* %myStruct, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data, metadata !47, metadata !DIExpression()), !dbg !48
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !49
  %0 = load i32*, i32** %structFirst, align 8, !dbg !49
  store i32* %0, i32** %data, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !52
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !52
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !53
  %2 = load i32*, i32** %data, align 8, !dbg !54
  %3 = load i32*, i32** %data, align 8, !dbg !55
  %call = call i64 @wcslen(i32* %3) #6, !dbg !56
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %2, i64 %call) #7, !dbg !57
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  %4 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %4), !dbg !61
  %5 = load i32*, i32** %data, align 8, !dbg !62
  %6 = bitcast i32* %5 to i8*, !dbg !62
  call void @free(i8* %6) #7, !dbg !63
  ret void, !dbg !64
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!22 = !DILocation(line: 28, column: 146, scope: !9)
!23 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!24 = !DILocation(line: 30, column: 15, scope: !9)
!25 = !DILocation(line: 30, column: 31, scope: !9)
!26 = !DILocalVariable(name: "dest", scope: !27, file: !10, line: 32, type: !28)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 32, column: 17, scope: !27)
!32 = !DILocation(line: 34, column: 17, scope: !27)
!33 = !DILocation(line: 34, column: 23, scope: !27)
!34 = !DILocation(line: 34, column: 36, scope: !27)
!35 = !DILocation(line: 34, column: 29, scope: !27)
!36 = !DILocation(line: 34, column: 9, scope: !27)
!37 = !DILocation(line: 35, column: 9, scope: !27)
!38 = !DILocation(line: 35, column: 20, scope: !27)
!39 = !DILocation(line: 36, column: 20, scope: !27)
!40 = !DILocation(line: 36, column: 9, scope: !27)
!41 = !DILocation(line: 37, column: 14, scope: !27)
!42 = !DILocation(line: 37, column: 9, scope: !27)
!43 = !DILocation(line: 39, column: 1, scope: !9)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_67b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "myStruct", arg: 1, scope: !44, file: !10, line: 46, type: !13)
!46 = !DILocation(line: 46, column: 150, scope: !44)
!47 = !DILocalVariable(name: "data", scope: !44, file: !10, line: 48, type: !17)
!48 = !DILocation(line: 48, column: 15, scope: !44)
!49 = !DILocation(line: 48, column: 31, scope: !44)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !10, line: 50, type: !28)
!51 = distinct !DILexicalBlock(scope: !44, file: !10, line: 49, column: 5)
!52 = !DILocation(line: 50, column: 17, scope: !51)
!53 = !DILocation(line: 52, column: 17, scope: !51)
!54 = !DILocation(line: 52, column: 23, scope: !51)
!55 = !DILocation(line: 52, column: 36, scope: !51)
!56 = !DILocation(line: 52, column: 29, scope: !51)
!57 = !DILocation(line: 52, column: 9, scope: !51)
!58 = !DILocation(line: 53, column: 9, scope: !51)
!59 = !DILocation(line: 53, column: 20, scope: !51)
!60 = !DILocation(line: 54, column: 20, scope: !51)
!61 = !DILocation(line: 54, column: 9, scope: !51)
!62 = !DILocation(line: 55, column: 14, scope: !51)
!63 = !DILocation(line: 55, column: 9, scope: !51)
!64 = !DILocation(line: 57, column: 1, scope: !44)
