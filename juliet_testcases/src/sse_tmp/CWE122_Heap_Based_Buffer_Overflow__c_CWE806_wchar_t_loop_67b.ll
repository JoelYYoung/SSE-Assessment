; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !36, metadata !DIExpression()), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i64 @wcslen(i32* %2) #6, !dbg !39
  store i64 %call, i64* %dataLen, align 8, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !44
  %4 = load i64, i64* %dataLen, align 8, !dbg !46
  %cmp = icmp ult i64 %3, %4, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !49
  %7 = load i32, i32* %arrayidx, align 4, !dbg !49
  %8 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !53
  store i32 %7, i32* %arrayidx1, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %9, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !61
  store i32 0, i32* %arrayidx2, align 4, !dbg !62
  %10 = load i32*, i32** %data, align 8, !dbg !63
  call void @printWLine(i32* %10), !dbg !64
  %11 = load i32*, i32** %data, align 8, !dbg !65
  %12 = bitcast i32* %11 to i8*, !dbg !65
  call void @free(i8* %12) #7, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !68 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType* %myStruct, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !73
  %0 = load i32*, i32** %structFirst, align 8, !dbg !73
  store i32* %0, i32** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !74, metadata !DIExpression()), !dbg !76
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !79, metadata !DIExpression()), !dbg !80
  %2 = load i32*, i32** %data, align 8, !dbg !81
  %call = call i64 @wcslen(i32* %2) #6, !dbg !82
  store i64 %call, i64* %dataLen, align 8, !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !87
  %4 = load i64, i64* %dataLen, align 8, !dbg !89
  %cmp = icmp ult i64 %3, %4, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %6 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !92
  %7 = load i32, i32* %arrayidx, align 4, !dbg !92
  %8 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !96
  store i32 %7, i32* %arrayidx1, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %9, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !103
  store i32 0, i32* %arrayidx2, align 4, !dbg !104
  %10 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %10), !dbg !106
  %11 = load i32*, i32** %data, align 8, !dbg !107
  %12 = bitcast i32* %11 to i8*, !dbg !107
  call void @free(i8* %12) #7, !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67_structType", file: !10, line: 21, size: 64, elements: !15)
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
!32 = !DILocalVariable(name: "i", scope: !27, file: !10, line: 33, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !19, line: 46, baseType: !34)
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 33, column: 16, scope: !27)
!36 = !DILocalVariable(name: "dataLen", scope: !27, file: !10, line: 33, type: !33)
!37 = !DILocation(line: 33, column: 19, scope: !27)
!38 = !DILocation(line: 34, column: 26, scope: !27)
!39 = !DILocation(line: 34, column: 19, scope: !27)
!40 = !DILocation(line: 34, column: 17, scope: !27)
!41 = !DILocation(line: 36, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !27, file: !10, line: 36, column: 9)
!43 = !DILocation(line: 36, column: 14, scope: !42)
!44 = !DILocation(line: 36, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !10, line: 36, column: 9)
!46 = !DILocation(line: 36, column: 25, scope: !45)
!47 = !DILocation(line: 36, column: 23, scope: !45)
!48 = !DILocation(line: 36, column: 9, scope: !42)
!49 = !DILocation(line: 38, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !10, line: 37, column: 9)
!51 = !DILocation(line: 38, column: 28, scope: !50)
!52 = !DILocation(line: 38, column: 18, scope: !50)
!53 = !DILocation(line: 38, column: 13, scope: !50)
!54 = !DILocation(line: 38, column: 21, scope: !50)
!55 = !DILocation(line: 39, column: 9, scope: !50)
!56 = !DILocation(line: 36, column: 35, scope: !45)
!57 = !DILocation(line: 36, column: 9, scope: !45)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 39, column: 9, scope: !42)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 40, column: 9, scope: !27)
!62 = !DILocation(line: 40, column: 20, scope: !27)
!63 = !DILocation(line: 41, column: 20, scope: !27)
!64 = !DILocation(line: 41, column: 9, scope: !27)
!65 = !DILocation(line: 42, column: 14, scope: !27)
!66 = !DILocation(line: 42, column: 9, scope: !27)
!67 = !DILocation(line: 44, column: 1, scope: !9)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_67b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "myStruct", arg: 1, scope: !68, file: !10, line: 51, type: !13)
!70 = !DILocation(line: 51, column: 150, scope: !68)
!71 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 53, type: !17)
!72 = !DILocation(line: 53, column: 15, scope: !68)
!73 = !DILocation(line: 53, column: 31, scope: !68)
!74 = !DILocalVariable(name: "dest", scope: !75, file: !10, line: 55, type: !28)
!75 = distinct !DILexicalBlock(scope: !68, file: !10, line: 54, column: 5)
!76 = !DILocation(line: 55, column: 17, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !75, file: !10, line: 56, type: !33)
!78 = !DILocation(line: 56, column: 16, scope: !75)
!79 = !DILocalVariable(name: "dataLen", scope: !75, file: !10, line: 56, type: !33)
!80 = !DILocation(line: 56, column: 19, scope: !75)
!81 = !DILocation(line: 57, column: 26, scope: !75)
!82 = !DILocation(line: 57, column: 19, scope: !75)
!83 = !DILocation(line: 57, column: 17, scope: !75)
!84 = !DILocation(line: 59, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !10, line: 59, column: 9)
!86 = !DILocation(line: 59, column: 14, scope: !85)
!87 = !DILocation(line: 59, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 59, column: 9)
!89 = !DILocation(line: 59, column: 25, scope: !88)
!90 = !DILocation(line: 59, column: 23, scope: !88)
!91 = !DILocation(line: 59, column: 9, scope: !85)
!92 = !DILocation(line: 61, column: 23, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !10, line: 60, column: 9)
!94 = !DILocation(line: 61, column: 28, scope: !93)
!95 = !DILocation(line: 61, column: 18, scope: !93)
!96 = !DILocation(line: 61, column: 13, scope: !93)
!97 = !DILocation(line: 61, column: 21, scope: !93)
!98 = !DILocation(line: 62, column: 9, scope: !93)
!99 = !DILocation(line: 59, column: 35, scope: !88)
!100 = !DILocation(line: 59, column: 9, scope: !88)
!101 = distinct !{!101, !91, !102, !60}
!102 = !DILocation(line: 62, column: 9, scope: !85)
!103 = !DILocation(line: 63, column: 9, scope: !75)
!104 = !DILocation(line: 63, column: 20, scope: !75)
!105 = !DILocation(line: 64, column: 20, scope: !75)
!106 = !DILocation(line: 64, column: 9, scope: !75)
!107 = !DILocation(line: 65, column: 14, scope: !75)
!108 = !DILocation(line: 65, column: 9, scope: !75)
!109 = !DILocation(line: 67, column: 1, scope: !68)
