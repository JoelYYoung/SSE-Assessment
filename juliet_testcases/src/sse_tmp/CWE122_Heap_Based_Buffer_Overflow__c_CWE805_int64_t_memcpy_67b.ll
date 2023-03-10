; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType = type { i64* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b_badSink(i64* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType* %myStruct, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !27
  %0 = load i64*, i64** %structFirst, align 8, !dbg !27
  store i64* %0, i64** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !33
  %2 = load i64*, i64** %data, align 8, !dbg !34
  %3 = bitcast i64* %2 to i8*, !dbg !35
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !35
  %4 = bitcast i64* %arraydecay to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !35
  %5 = load i64*, i64** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !36
  %6 = load i64, i64* %arrayidx, align 8, !dbg !36
  call void @printLongLongLine(i64 %6), !dbg !37
  %7 = load i64*, i64** %data, align 8, !dbg !38
  %8 = bitcast i64* %7 to i8*, !dbg !38
  call void @free(i8* %8) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b_goodG2BSink(i64* %myStruct.coerce) #0 !dbg !41 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType* %myStruct, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64** %data, metadata !44, metadata !DIExpression()), !dbg !45
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !46
  %0 = load i64*, i64** %structFirst, align 8, !dbg !46
  store i64* %0, i64** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !49
  %2 = load i64*, i64** %data, align 8, !dbg !50
  %3 = bitcast i64* %2 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !51
  %4 = bitcast i64* %arraydecay to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !51
  %5 = load i64*, i64** %data, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !52
  %6 = load i64, i64* %arrayidx, align 8, !dbg !52
  call void @printLongLongLine(i64 %6), !dbg !53
  %7 = load i64*, i64** %data, align 8, !dbg !54
  %8 = bitcast i64* %7 to i8*, !dbg !54
  call void @free(i8* %8) #6, !dbg !55
  ret void, !dbg !56
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 27, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !21, line: 44, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!22 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!23 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!24 = !DILocation(line: 26, column: 150, scope: !9)
!25 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!26 = !DILocation(line: 28, column: 15, scope: !9)
!27 = !DILocation(line: 28, column: 31, scope: !9)
!28 = !DILocalVariable(name: "source", scope: !29, file: !10, line: 30, type: !30)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 30, column: 17, scope: !29)
!34 = !DILocation(line: 32, column: 16, scope: !29)
!35 = !DILocation(line: 32, column: 9, scope: !29)
!36 = !DILocation(line: 33, column: 27, scope: !29)
!37 = !DILocation(line: 33, column: 9, scope: !29)
!38 = !DILocation(line: 34, column: 14, scope: !29)
!39 = !DILocation(line: 34, column: 9, scope: !29)
!40 = !DILocation(line: 36, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_67b_goodG2BSink", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "myStruct", arg: 1, scope: !41, file: !10, line: 43, type: !13)
!43 = !DILocation(line: 43, column: 154, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !10, line: 45, type: !17)
!45 = !DILocation(line: 45, column: 15, scope: !41)
!46 = !DILocation(line: 45, column: 31, scope: !41)
!47 = !DILocalVariable(name: "source", scope: !48, file: !10, line: 47, type: !30)
!48 = distinct !DILexicalBlock(scope: !41, file: !10, line: 46, column: 5)
!49 = !DILocation(line: 47, column: 17, scope: !48)
!50 = !DILocation(line: 49, column: 16, scope: !48)
!51 = !DILocation(line: 49, column: 9, scope: !48)
!52 = !DILocation(line: 50, column: 27, scope: !48)
!53 = !DILocation(line: 50, column: 9, scope: !48)
!54 = !DILocation(line: 51, column: 14, scope: !48)
!55 = !DILocation(line: 51, column: 9, scope: !48)
!56 = !DILocation(line: 53, column: 1, scope: !41)
