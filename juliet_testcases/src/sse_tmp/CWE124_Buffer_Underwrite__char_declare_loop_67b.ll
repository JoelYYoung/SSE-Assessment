; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType, %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType, %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %1, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !47
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !48
  store i8 %3, i8* %arrayidx2, align 1, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %6, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !57
  store i8 0, i8* %arrayidx3, align 1, !dbg !58
  %8 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %8), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !62 {
entry:
  %myStruct = alloca %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType, %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType* %myStruct, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %structFirst = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType, %struct._CWE124_Buffer_Underwrite__char_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !67
  %0 = load i8*, i8** %structFirst, align 8, !dbg !67
  store i8* %0, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  store i64 0, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !79
  %cmp = icmp ult i64 %1, 100, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !85
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !86
  %5 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !86
  store i8 %3, i8* %arrayidx2, align 1, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !90
  %inc = add i64 %6, 1, !dbg !90
  store i64 %inc, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !94
  store i8 0, i8* %arrayidx3, align 1, !dbg !95
  %8 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* %8), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__char_declare_loop_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE124_Buffer_Underwrite__char_declare_loop_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!20 = !DILocation(line: 28, column: 120, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!22 = !DILocation(line: 30, column: 12, scope: !9)
!23 = !DILocation(line: 30, column: 28, scope: !9)
!24 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 32, column: 16, scope: !25)
!30 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 33, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 33, column: 14, scope: !25)
!35 = !DILocation(line: 34, column: 9, scope: !25)
!36 = !DILocation(line: 35, column: 9, scope: !25)
!37 = !DILocation(line: 35, column: 23, scope: !25)
!38 = !DILocation(line: 37, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !25, file: !10, line: 37, column: 9)
!40 = !DILocation(line: 37, column: 14, scope: !39)
!41 = !DILocation(line: 37, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 37, column: 9)
!43 = !DILocation(line: 37, column: 23, scope: !42)
!44 = !DILocation(line: 37, column: 9, scope: !39)
!45 = !DILocation(line: 39, column: 30, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !10, line: 38, column: 9)
!47 = !DILocation(line: 39, column: 23, scope: !46)
!48 = !DILocation(line: 39, column: 13, scope: !46)
!49 = !DILocation(line: 39, column: 18, scope: !46)
!50 = !DILocation(line: 39, column: 21, scope: !46)
!51 = !DILocation(line: 40, column: 9, scope: !46)
!52 = !DILocation(line: 37, column: 31, scope: !42)
!53 = !DILocation(line: 37, column: 9, scope: !42)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 40, column: 9, scope: !39)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 42, column: 9, scope: !25)
!58 = !DILocation(line: 42, column: 21, scope: !25)
!59 = !DILocation(line: 43, column: 19, scope: !25)
!60 = !DILocation(line: 43, column: 9, scope: !25)
!61 = !DILocation(line: 45, column: 1, scope: !9)
!62 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_67b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "myStruct", arg: 1, scope: !62, file: !10, line: 52, type: !13)
!64 = !DILocation(line: 52, column: 124, scope: !62)
!65 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 54, type: !17)
!66 = !DILocation(line: 54, column: 12, scope: !62)
!67 = !DILocation(line: 54, column: 28, scope: !62)
!68 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 56, type: !26)
!69 = distinct !DILexicalBlock(scope: !62, file: !10, line: 55, column: 5)
!70 = !DILocation(line: 56, column: 16, scope: !69)
!71 = !DILocalVariable(name: "source", scope: !69, file: !10, line: 57, type: !31)
!72 = !DILocation(line: 57, column: 14, scope: !69)
!73 = !DILocation(line: 58, column: 9, scope: !69)
!74 = !DILocation(line: 59, column: 9, scope: !69)
!75 = !DILocation(line: 59, column: 23, scope: !69)
!76 = !DILocation(line: 61, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !69, file: !10, line: 61, column: 9)
!78 = !DILocation(line: 61, column: 14, scope: !77)
!79 = !DILocation(line: 61, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !10, line: 61, column: 9)
!81 = !DILocation(line: 61, column: 23, scope: !80)
!82 = !DILocation(line: 61, column: 9, scope: !77)
!83 = !DILocation(line: 63, column: 30, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !10, line: 62, column: 9)
!85 = !DILocation(line: 63, column: 23, scope: !84)
!86 = !DILocation(line: 63, column: 13, scope: !84)
!87 = !DILocation(line: 63, column: 18, scope: !84)
!88 = !DILocation(line: 63, column: 21, scope: !84)
!89 = !DILocation(line: 64, column: 9, scope: !84)
!90 = !DILocation(line: 61, column: 31, scope: !80)
!91 = !DILocation(line: 61, column: 9, scope: !80)
!92 = distinct !{!92, !82, !93, !56}
!93 = !DILocation(line: 64, column: 9, scope: !77)
!94 = !DILocation(line: 66, column: 9, scope: !69)
!95 = !DILocation(line: 66, column: 21, scope: !69)
!96 = !DILocation(line: 67, column: 19, scope: !69)
!97 = !DILocation(line: 67, column: 9, scope: !69)
!98 = !DILocation(line: 69, column: 1, scope: !62)
