; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i32*, i32** %structFirst, align 8, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !45
  %4 = load i32, i32* %arrayidx, align 4, !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  %6 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !46
  store i32 %4, i32* %arrayidx1, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %7, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !55
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !55
  call void @printIntLine(i32 %9), !dbg !56
  %10 = load i32*, i32** %data, align 8, !dbg !57
  %11 = bitcast i32* %10 to i8*, !dbg !57
  call void @free(i8* %11) #5, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !60 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType* %myStruct, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !65
  %0 = load i32*, i32** %structFirst, align 8, !dbg !65
  store i32* %0, i32** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !66, metadata !DIExpression()), !dbg !68
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !75
  %cmp = icmp ult i64 %2, 100, !dbg !77
  br i1 %cmp, label %for.body, label %for.end, !dbg !78

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !81
  %4 = load i32, i32* %arrayidx, align 4, !dbg !81
  %5 = load i32*, i32** %data, align 8, !dbg !82
  %6 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !82
  store i32 %4, i32* %arrayidx1, align 4, !dbg !84
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !86
  %inc = add i64 %7, 1, !dbg !86
  store i64 %inc, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !90
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !90
  call void @printIntLine(i32 %9), !dbg !91
  %10 = load i32*, i32** %data, align 8, !dbg !92
  %11 = bitcast i32* %10 to i8*, !dbg !92
  call void @free(i8* %11) #5, !dbg !93
  ret void, !dbg !94
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType", file: !10, line: 22, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67_structType", file: !10, line: 19, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 21, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 26, type: !13)
!20 = !DILocation(line: 26, column: 138, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !17)
!22 = !DILocation(line: 28, column: 11, scope: !9)
!23 = !DILocation(line: 28, column: 27, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 30, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 30, column: 13, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !10, line: 32, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !10, line: 31, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 32, column: 20, scope: !31)
!36 = !DILocation(line: 34, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !10, line: 34, column: 13)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 34, column: 13)
!41 = !DILocation(line: 34, column: 27, scope: !40)
!42 = !DILocation(line: 34, column: 13, scope: !37)
!43 = !DILocation(line: 36, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 35, column: 13)
!45 = !DILocation(line: 36, column: 27, scope: !44)
!46 = !DILocation(line: 36, column: 17, scope: !44)
!47 = !DILocation(line: 36, column: 22, scope: !44)
!48 = !DILocation(line: 36, column: 25, scope: !44)
!49 = !DILocation(line: 37, column: 13, scope: !44)
!50 = !DILocation(line: 34, column: 35, scope: !40)
!51 = !DILocation(line: 34, column: 13, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 37, column: 13, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 38, column: 26, scope: !31)
!56 = !DILocation(line: 38, column: 13, scope: !31)
!57 = !DILocation(line: 39, column: 18, scope: !31)
!58 = !DILocation(line: 39, column: 13, scope: !31)
!59 = !DILocation(line: 42, column: 1, scope: !9)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_67b_goodG2BSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "myStruct", arg: 1, scope: !60, file: !10, line: 49, type: !13)
!62 = !DILocation(line: 49, column: 142, scope: !60)
!63 = !DILocalVariable(name: "data", scope: !60, file: !10, line: 51, type: !17)
!64 = !DILocation(line: 51, column: 11, scope: !60)
!65 = !DILocation(line: 51, column: 27, scope: !60)
!66 = !DILocalVariable(name: "source", scope: !67, file: !10, line: 53, type: !26)
!67 = distinct !DILexicalBlock(scope: !60, file: !10, line: 52, column: 5)
!68 = !DILocation(line: 53, column: 13, scope: !67)
!69 = !DILocalVariable(name: "i", scope: !70, file: !10, line: 55, type: !32)
!70 = distinct !DILexicalBlock(scope: !67, file: !10, line: 54, column: 9)
!71 = !DILocation(line: 55, column: 20, scope: !70)
!72 = !DILocation(line: 57, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !10, line: 57, column: 13)
!74 = !DILocation(line: 57, column: 18, scope: !73)
!75 = !DILocation(line: 57, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 57, column: 13)
!77 = !DILocation(line: 57, column: 27, scope: !76)
!78 = !DILocation(line: 57, column: 13, scope: !73)
!79 = !DILocation(line: 59, column: 34, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !10, line: 58, column: 13)
!81 = !DILocation(line: 59, column: 27, scope: !80)
!82 = !DILocation(line: 59, column: 17, scope: !80)
!83 = !DILocation(line: 59, column: 22, scope: !80)
!84 = !DILocation(line: 59, column: 25, scope: !80)
!85 = !DILocation(line: 60, column: 13, scope: !80)
!86 = !DILocation(line: 57, column: 35, scope: !76)
!87 = !DILocation(line: 57, column: 13, scope: !76)
!88 = distinct !{!88, !78, !89, !54}
!89 = !DILocation(line: 60, column: 13, scope: !73)
!90 = !DILocation(line: 61, column: 26, scope: !70)
!91 = !DILocation(line: 61, column: 13, scope: !70)
!92 = !DILocation(line: 62, column: 18, scope: !70)
!93 = !DILocation(line: 62, column: 13, scope: !70)
!94 = !DILocation(line: 65, column: 1, scope: !60)
