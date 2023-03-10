; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !36, metadata !DIExpression()), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i64 @wcslen(i32* %2) #5, !dbg !39
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
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !66 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType* %myStruct, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !71
  %0 = load i32*, i32** %structFirst, align 8, !dbg !71
  store i32* %0, i32** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i64 @wcslen(i32* %2) #5, !dbg !80
  store i64 %call, i64* %dataLen, align 8, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !85
  %4 = load i64, i64* %dataLen, align 8, !dbg !87
  %cmp = icmp ult i64 %3, %4, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !90
  %6 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !90
  %7 = load i32, i32* %arrayidx, align 4, !dbg !90
  %8 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !94
  store i32 %7, i32* %arrayidx1, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %9, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !101
  store i32 0, i32* %arrayidx2, align 4, !dbg !102
  %10 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %10), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!22 = !DILocation(line: 28, column: 158, scope: !9)
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
!65 = !DILocation(line: 43, column: 1, scope: !9)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_67b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "myStruct", arg: 1, scope: !66, file: !10, line: 50, type: !13)
!68 = !DILocation(line: 50, column: 162, scope: !66)
!69 = !DILocalVariable(name: "data", scope: !66, file: !10, line: 52, type: !17)
!70 = !DILocation(line: 52, column: 15, scope: !66)
!71 = !DILocation(line: 52, column: 31, scope: !66)
!72 = !DILocalVariable(name: "dest", scope: !73, file: !10, line: 54, type: !28)
!73 = distinct !DILexicalBlock(scope: !66, file: !10, line: 53, column: 5)
!74 = !DILocation(line: 54, column: 17, scope: !73)
!75 = !DILocalVariable(name: "i", scope: !73, file: !10, line: 55, type: !33)
!76 = !DILocation(line: 55, column: 16, scope: !73)
!77 = !DILocalVariable(name: "dataLen", scope: !73, file: !10, line: 55, type: !33)
!78 = !DILocation(line: 55, column: 19, scope: !73)
!79 = !DILocation(line: 56, column: 26, scope: !73)
!80 = !DILocation(line: 56, column: 19, scope: !73)
!81 = !DILocation(line: 56, column: 17, scope: !73)
!82 = !DILocation(line: 58, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !10, line: 58, column: 9)
!84 = !DILocation(line: 58, column: 14, scope: !83)
!85 = !DILocation(line: 58, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 58, column: 9)
!87 = !DILocation(line: 58, column: 25, scope: !86)
!88 = !DILocation(line: 58, column: 23, scope: !86)
!89 = !DILocation(line: 58, column: 9, scope: !83)
!90 = !DILocation(line: 60, column: 23, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !10, line: 59, column: 9)
!92 = !DILocation(line: 60, column: 28, scope: !91)
!93 = !DILocation(line: 60, column: 18, scope: !91)
!94 = !DILocation(line: 60, column: 13, scope: !91)
!95 = !DILocation(line: 60, column: 21, scope: !91)
!96 = !DILocation(line: 61, column: 9, scope: !91)
!97 = !DILocation(line: 58, column: 35, scope: !86)
!98 = !DILocation(line: 58, column: 9, scope: !86)
!99 = distinct !{!99, !89, !100, !60}
!100 = !DILocation(line: 61, column: 9, scope: !83)
!101 = !DILocation(line: 62, column: 9, scope: !73)
!102 = !DILocation(line: 62, column: 20, scope: !73)
!103 = !DILocation(line: 63, column: 20, scope: !73)
!104 = !DILocation(line: 63, column: 9, scope: !73)
!105 = !DILocation(line: 65, column: 1, scope: !66)
