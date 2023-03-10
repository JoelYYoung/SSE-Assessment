; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i32*, i32** %structFirst, align 8, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %2, 10, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !44
  %4 = load i32, i32* %arrayidx, align 4, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !45
  store i32 %4, i32* %arrayidx1, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %7, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !54
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !54
  call void @printIntLine(i32 %9), !dbg !55
  %10 = load i32*, i32** %data, align 8, !dbg !56
  %11 = bitcast i32* %10 to i8*, !dbg !56
  call void @free(i8* %11) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !59 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !64
  %0 = load i32*, i32** %structFirst, align 8, !dbg !64
  store i32* %0, i32** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !65, metadata !DIExpression()), !dbg !67
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !73
  %cmp = icmp ult i64 %2, 10, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !79
  %4 = load i32, i32* %arrayidx, align 4, !dbg !79
  %5 = load i32*, i32** %data, align 8, !dbg !80
  %6 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !80
  store i32 %4, i32* %arrayidx1, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %7, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !88
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !88
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !88
  call void @printIntLine(i32 %9), !dbg !89
  %10 = load i32*, i32** %data, align 8, !dbg !90
  %11 = bitcast i32* %10 to i8*, !dbg !90
  call void @free(i8* %11) #5, !dbg !91
  ret void, !dbg !92
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!20 = !DILocation(line: 26, column: 126, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!22 = !DILocation(line: 28, column: 11, scope: !9)
!23 = !DILocation(line: 28, column: 27, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 30, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 30, column: 13, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 31, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 31, column: 16, scope: !25)
!35 = !DILocation(line: 33, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !25, file: !10, line: 33, column: 9)
!37 = !DILocation(line: 33, column: 14, scope: !36)
!38 = !DILocation(line: 33, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 33, column: 9)
!40 = !DILocation(line: 33, column: 23, scope: !39)
!41 = !DILocation(line: 33, column: 9, scope: !36)
!42 = !DILocation(line: 35, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 34, column: 9)
!44 = !DILocation(line: 35, column: 23, scope: !43)
!45 = !DILocation(line: 35, column: 13, scope: !43)
!46 = !DILocation(line: 35, column: 18, scope: !43)
!47 = !DILocation(line: 35, column: 21, scope: !43)
!48 = !DILocation(line: 36, column: 9, scope: !43)
!49 = !DILocation(line: 33, column: 30, scope: !39)
!50 = !DILocation(line: 33, column: 9, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 36, column: 9, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 37, column: 22, scope: !25)
!55 = !DILocation(line: 37, column: 9, scope: !25)
!56 = !DILocation(line: 38, column: 14, scope: !25)
!57 = !DILocation(line: 38, column: 9, scope: !25)
!58 = !DILocation(line: 40, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_67b_goodG2BSink", scope: !10, file: !10, line: 47, type: !11, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "myStruct", arg: 1, scope: !59, file: !10, line: 47, type: !13)
!61 = !DILocation(line: 47, column: 130, scope: !59)
!62 = !DILocalVariable(name: "data", scope: !59, file: !10, line: 49, type: !17)
!63 = !DILocation(line: 49, column: 11, scope: !59)
!64 = !DILocation(line: 49, column: 27, scope: !59)
!65 = !DILocalVariable(name: "source", scope: !66, file: !10, line: 51, type: !26)
!66 = distinct !DILexicalBlock(scope: !59, file: !10, line: 50, column: 5)
!67 = !DILocation(line: 51, column: 13, scope: !66)
!68 = !DILocalVariable(name: "i", scope: !66, file: !10, line: 52, type: !31)
!69 = !DILocation(line: 52, column: 16, scope: !66)
!70 = !DILocation(line: 54, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !10, line: 54, column: 9)
!72 = !DILocation(line: 54, column: 14, scope: !71)
!73 = !DILocation(line: 54, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !10, line: 54, column: 9)
!75 = !DILocation(line: 54, column: 23, scope: !74)
!76 = !DILocation(line: 54, column: 9, scope: !71)
!77 = !DILocation(line: 56, column: 30, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !10, line: 55, column: 9)
!79 = !DILocation(line: 56, column: 23, scope: !78)
!80 = !DILocation(line: 56, column: 13, scope: !78)
!81 = !DILocation(line: 56, column: 18, scope: !78)
!82 = !DILocation(line: 56, column: 21, scope: !78)
!83 = !DILocation(line: 57, column: 9, scope: !78)
!84 = !DILocation(line: 54, column: 30, scope: !74)
!85 = !DILocation(line: 54, column: 9, scope: !74)
!86 = distinct !{!86, !76, !87, !53}
!87 = !DILocation(line: 57, column: 9, scope: !71)
!88 = !DILocation(line: 58, column: 22, scope: !66)
!89 = !DILocation(line: 58, column: 9, scope: !66)
!90 = !DILocation(line: 59, column: 14, scope: !66)
!91 = !DILocation(line: 59, column: 9, scope: !66)
!92 = !DILocation(line: 61, column: 1, scope: !59)
