; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType = type { i32* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_67b_badSink(i32* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !25
  %0 = load i32*, i32** %structFirst, align 8, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !39
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !43
  store i64 %call2, i64* %destLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !48
  %2 = load i64, i64* %destLen, align 8, !dbg !50
  %cmp = icmp ult i64 %1, %2, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !53
  %4 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !53
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !53
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !57
  store i32 %5, i32* %arrayidx4, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %7, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx5, align 4, !dbg !66
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* %arraydecay6), !dbg !68
  %8 = load i32*, i32** %data, align 8, !dbg !69
  %9 = bitcast i32* %8 to i8*, !dbg !69
  call void @free(i8* %9) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_67b_goodG2BSink(i32* %myStruct.coerce) #0 !dbg !72 {
entry:
  %myStruct = alloca %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0
  store i32* %myStruct.coerce, i32** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType* %myStruct, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !77
  %0 = load i32*, i32** %structFirst, align 8, !dbg !77
  store i32* %0, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !78, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !90
  store i64 %call2, i64* %destLen, align 8, !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !95
  %2 = load i64, i64* %destLen, align 8, !dbg !97
  %cmp = icmp ult i64 %1, %2, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !100
  %4 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !100
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !100
  %6 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !104
  store i32 %5, i32* %arrayidx4, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %7, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  call void @printWLine(i32* %arraydecay6), !dbg !114
  %8 = load i32*, i32** %data, align 8, !dbg !115
  %9 = bitcast i32* %8 to i8*, !dbg !115
  call void @free(i8* %9) #5, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE126_Buffer_Overread__malloc_wchar_t_loop_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!22 = !DILocation(line: 28, column: 120, scope: !9)
!23 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!24 = !DILocation(line: 30, column: 15, scope: !9)
!25 = !DILocation(line: 30, column: 31, scope: !9)
!26 = !DILocalVariable(name: "i", scope: !27, file: !10, line: 32, type: !28)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !19, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 32, column: 16, scope: !27)
!31 = !DILocalVariable(name: "destLen", scope: !27, file: !10, line: 32, type: !28)
!32 = !DILocation(line: 32, column: 19, scope: !27)
!33 = !DILocalVariable(name: "dest", scope: !27, file: !10, line: 33, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 33, column: 17, scope: !27)
!38 = !DILocation(line: 34, column: 17, scope: !27)
!39 = !DILocation(line: 34, column: 9, scope: !27)
!40 = !DILocation(line: 35, column: 9, scope: !27)
!41 = !DILocation(line: 35, column: 21, scope: !27)
!42 = !DILocation(line: 36, column: 26, scope: !27)
!43 = !DILocation(line: 36, column: 19, scope: !27)
!44 = !DILocation(line: 36, column: 17, scope: !27)
!45 = !DILocation(line: 39, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !27, file: !10, line: 39, column: 9)
!47 = !DILocation(line: 39, column: 14, scope: !46)
!48 = !DILocation(line: 39, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !10, line: 39, column: 9)
!50 = !DILocation(line: 39, column: 25, scope: !49)
!51 = !DILocation(line: 39, column: 23, scope: !49)
!52 = !DILocation(line: 39, column: 9, scope: !46)
!53 = !DILocation(line: 41, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !10, line: 40, column: 9)
!55 = !DILocation(line: 41, column: 28, scope: !54)
!56 = !DILocation(line: 41, column: 18, scope: !54)
!57 = !DILocation(line: 41, column: 13, scope: !54)
!58 = !DILocation(line: 41, column: 21, scope: !54)
!59 = !DILocation(line: 42, column: 9, scope: !54)
!60 = !DILocation(line: 39, column: 35, scope: !49)
!61 = !DILocation(line: 39, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 42, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 43, column: 9, scope: !27)
!66 = !DILocation(line: 43, column: 21, scope: !27)
!67 = !DILocation(line: 44, column: 20, scope: !27)
!68 = !DILocation(line: 44, column: 9, scope: !27)
!69 = !DILocation(line: 45, column: 14, scope: !27)
!70 = !DILocation(line: 45, column: 9, scope: !27)
!71 = !DILocation(line: 47, column: 1, scope: !9)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_67b_goodG2BSink", scope: !10, file: !10, line: 54, type: !11, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "myStruct", arg: 1, scope: !72, file: !10, line: 54, type: !13)
!74 = !DILocation(line: 54, column: 124, scope: !72)
!75 = !DILocalVariable(name: "data", scope: !72, file: !10, line: 56, type: !17)
!76 = !DILocation(line: 56, column: 15, scope: !72)
!77 = !DILocation(line: 56, column: 31, scope: !72)
!78 = !DILocalVariable(name: "i", scope: !79, file: !10, line: 58, type: !28)
!79 = distinct !DILexicalBlock(scope: !72, file: !10, line: 57, column: 5)
!80 = !DILocation(line: 58, column: 16, scope: !79)
!81 = !DILocalVariable(name: "destLen", scope: !79, file: !10, line: 58, type: !28)
!82 = !DILocation(line: 58, column: 19, scope: !79)
!83 = !DILocalVariable(name: "dest", scope: !79, file: !10, line: 59, type: !34)
!84 = !DILocation(line: 59, column: 17, scope: !79)
!85 = !DILocation(line: 60, column: 17, scope: !79)
!86 = !DILocation(line: 60, column: 9, scope: !79)
!87 = !DILocation(line: 61, column: 9, scope: !79)
!88 = !DILocation(line: 61, column: 21, scope: !79)
!89 = !DILocation(line: 62, column: 26, scope: !79)
!90 = !DILocation(line: 62, column: 19, scope: !79)
!91 = !DILocation(line: 62, column: 17, scope: !79)
!92 = !DILocation(line: 65, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !79, file: !10, line: 65, column: 9)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocation(line: 65, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !10, line: 65, column: 9)
!97 = !DILocation(line: 65, column: 25, scope: !96)
!98 = !DILocation(line: 65, column: 23, scope: !96)
!99 = !DILocation(line: 65, column: 9, scope: !93)
!100 = !DILocation(line: 67, column: 23, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !10, line: 66, column: 9)
!102 = !DILocation(line: 67, column: 28, scope: !101)
!103 = !DILocation(line: 67, column: 18, scope: !101)
!104 = !DILocation(line: 67, column: 13, scope: !101)
!105 = !DILocation(line: 67, column: 21, scope: !101)
!106 = !DILocation(line: 68, column: 9, scope: !101)
!107 = !DILocation(line: 65, column: 35, scope: !96)
!108 = !DILocation(line: 65, column: 9, scope: !96)
!109 = distinct !{!109, !99, !110, !64}
!110 = !DILocation(line: 68, column: 9, scope: !93)
!111 = !DILocation(line: 69, column: 9, scope: !79)
!112 = !DILocation(line: 69, column: 21, scope: !79)
!113 = !DILocation(line: 70, column: 20, scope: !79)
!114 = !DILocation(line: 70, column: 9, scope: !79)
!115 = !DILocation(line: 71, column: 14, scope: !79)
!116 = !DILocation(line: 71, column: 9, scope: !79)
!117 = !DILocation(line: 73, column: 1, scope: !72)
