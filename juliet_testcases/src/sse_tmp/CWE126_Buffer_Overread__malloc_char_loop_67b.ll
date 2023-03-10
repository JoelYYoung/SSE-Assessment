; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !41
  store i64 %call, i64* %destLen, align 8, !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !46
  %2 = load i64, i64* %destLen, align 8, !dbg !48
  %cmp = icmp ult i64 %1, %2, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %4 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !51
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !51
  %6 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !55
  store i8 %5, i8* %arrayidx3, align 1, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %7, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx4, align 1, !dbg !64
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @printLine(i8* %arraydecay5), !dbg !66
  %8 = load i8*, i8** %data, align 8, !dbg !67
  call void @free(i8* %8) #7, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !70 {
entry:
  %myStruct = alloca %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType* %myStruct, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType, %struct._CWE126_Buffer_Overread__malloc_char_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !75
  %0 = load i8*, i8** %structFirst, align 8, !dbg !75
  store i8* %0, i8** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !83
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !87
  store i64 %call, i64* %destLen, align 8, !dbg !88
  store i64 0, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !92
  %2 = load i64, i64* %destLen, align 8, !dbg !94
  %cmp = icmp ult i64 %1, %2, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !97
  %4 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !97
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !97
  %6 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !101
  store i8 %5, i8* %arrayidx3, align 1, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %7, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx4, align 1, !dbg !109
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* %arraydecay5), !dbg !111
  %8 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %8) #7, !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__malloc_char_loop_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE126_Buffer_Overread__malloc_char_loop_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!20 = !DILocation(line: 28, column: 114, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!22 = !DILocation(line: 30, column: 12, scope: !9)
!23 = !DILocation(line: 30, column: 28, scope: !9)
!24 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 32, column: 16, scope: !25)
!30 = !DILocalVariable(name: "destLen", scope: !25, file: !10, line: 32, type: !26)
!31 = !DILocation(line: 32, column: 19, scope: !25)
!32 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 14, scope: !25)
!37 = !DILocation(line: 34, column: 9, scope: !25)
!38 = !DILocation(line: 35, column: 9, scope: !25)
!39 = !DILocation(line: 35, column: 21, scope: !25)
!40 = !DILocation(line: 36, column: 26, scope: !25)
!41 = !DILocation(line: 36, column: 19, scope: !25)
!42 = !DILocation(line: 36, column: 17, scope: !25)
!43 = !DILocation(line: 39, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !25, file: !10, line: 39, column: 9)
!45 = !DILocation(line: 39, column: 14, scope: !44)
!46 = !DILocation(line: 39, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !10, line: 39, column: 9)
!48 = !DILocation(line: 39, column: 25, scope: !47)
!49 = !DILocation(line: 39, column: 23, scope: !47)
!50 = !DILocation(line: 39, column: 9, scope: !44)
!51 = !DILocation(line: 41, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !10, line: 40, column: 9)
!53 = !DILocation(line: 41, column: 28, scope: !52)
!54 = !DILocation(line: 41, column: 18, scope: !52)
!55 = !DILocation(line: 41, column: 13, scope: !52)
!56 = !DILocation(line: 41, column: 21, scope: !52)
!57 = !DILocation(line: 42, column: 9, scope: !52)
!58 = !DILocation(line: 39, column: 35, scope: !47)
!59 = !DILocation(line: 39, column: 9, scope: !47)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 42, column: 9, scope: !44)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 43, column: 9, scope: !25)
!64 = !DILocation(line: 43, column: 21, scope: !25)
!65 = !DILocation(line: 44, column: 19, scope: !25)
!66 = !DILocation(line: 44, column: 9, scope: !25)
!67 = !DILocation(line: 45, column: 14, scope: !25)
!68 = !DILocation(line: 45, column: 9, scope: !25)
!69 = !DILocation(line: 47, column: 1, scope: !9)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_67b_goodG2BSink", scope: !10, file: !10, line: 54, type: !11, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "myStruct", arg: 1, scope: !70, file: !10, line: 54, type: !13)
!72 = !DILocation(line: 54, column: 118, scope: !70)
!73 = !DILocalVariable(name: "data", scope: !70, file: !10, line: 56, type: !17)
!74 = !DILocation(line: 56, column: 12, scope: !70)
!75 = !DILocation(line: 56, column: 28, scope: !70)
!76 = !DILocalVariable(name: "i", scope: !77, file: !10, line: 58, type: !26)
!77 = distinct !DILexicalBlock(scope: !70, file: !10, line: 57, column: 5)
!78 = !DILocation(line: 58, column: 16, scope: !77)
!79 = !DILocalVariable(name: "destLen", scope: !77, file: !10, line: 58, type: !26)
!80 = !DILocation(line: 58, column: 19, scope: !77)
!81 = !DILocalVariable(name: "dest", scope: !77, file: !10, line: 59, type: !33)
!82 = !DILocation(line: 59, column: 14, scope: !77)
!83 = !DILocation(line: 60, column: 9, scope: !77)
!84 = !DILocation(line: 61, column: 9, scope: !77)
!85 = !DILocation(line: 61, column: 21, scope: !77)
!86 = !DILocation(line: 62, column: 26, scope: !77)
!87 = !DILocation(line: 62, column: 19, scope: !77)
!88 = !DILocation(line: 62, column: 17, scope: !77)
!89 = !DILocation(line: 65, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !77, file: !10, line: 65, column: 9)
!91 = !DILocation(line: 65, column: 14, scope: !90)
!92 = !DILocation(line: 65, column: 21, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !10, line: 65, column: 9)
!94 = !DILocation(line: 65, column: 25, scope: !93)
!95 = !DILocation(line: 65, column: 23, scope: !93)
!96 = !DILocation(line: 65, column: 9, scope: !90)
!97 = !DILocation(line: 67, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !10, line: 66, column: 9)
!99 = !DILocation(line: 67, column: 28, scope: !98)
!100 = !DILocation(line: 67, column: 18, scope: !98)
!101 = !DILocation(line: 67, column: 13, scope: !98)
!102 = !DILocation(line: 67, column: 21, scope: !98)
!103 = !DILocation(line: 68, column: 9, scope: !98)
!104 = !DILocation(line: 65, column: 35, scope: !93)
!105 = !DILocation(line: 65, column: 9, scope: !93)
!106 = distinct !{!106, !96, !107, !62}
!107 = !DILocation(line: 68, column: 9, scope: !90)
!108 = !DILocation(line: 69, column: 9, scope: !77)
!109 = !DILocation(line: 69, column: 21, scope: !77)
!110 = !DILocation(line: 70, column: 19, scope: !77)
!111 = !DILocation(line: 70, column: 9, scope: !77)
!112 = !DILocation(line: 71, column: 14, scope: !77)
!113 = !DILocation(line: 71, column: 9, scope: !77)
!114 = !DILocation(line: 73, column: 1, scope: !70)
