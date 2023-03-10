; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i8**, !dbg !23
  store i8** %1, i8*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !26
  %3 = load i8*, i8** %2, align 8, !dbg !27
  store i8* %3, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !39, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !42
  store i64 %call, i64* %sourceLen, align 8, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !47
  %6 = load i64, i64* %sourceLen, align 8, !dbg !49
  %add = add i64 %6, 1, !dbg !50
  %cmp = icmp ult i64 %5, %add, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !55
  %8 = load i8, i8* %arrayidx, align 1, !dbg !55
  %9 = load i8*, i8** %data, align 8, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !56
  store i8 %8, i8* %arrayidx1, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %11, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* %12), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !68 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !73
  %1 = bitcast i8* %0 to i8**, !dbg !74
  store i8** %1, i8*** %dataPtr, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !77
  %3 = load i8*, i8** %2, align 8, !dbg !78
  store i8* %3, i8** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !86
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !87
  store i64 %call, i64* %sourceLen, align 8, !dbg !88
  store i64 0, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !92
  %6 = load i64, i64* %sourceLen, align 8, !dbg !94
  %add = add i64 %6, 1, !dbg !95
  %cmp = icmp ult i64 %5, %add, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !100
  %8 = load i8, i8* %arrayidx, align 1, !dbg !100
  %9 = load i8*, i8** %data, align 8, !dbg !101
  %10 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !101
  store i8 %8, i8* %arrayidx1, align 1, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %11, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %12), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_badSink", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 28, type: !17)
!19 = !DILocation(line: 28, column: 85, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 14, scope: !13)
!22 = !DILocation(line: 31, column: 34, scope: !13)
!23 = !DILocation(line: 31, column: 24, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !5)
!25 = !DILocation(line: 33, column: 12, scope: !13)
!26 = !DILocation(line: 33, column: 21, scope: !13)
!27 = !DILocation(line: 33, column: 20, scope: !13)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 35, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 35, column: 14, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 36, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 36, column: 16, scope: !29)
!39 = !DILocalVariable(name: "sourceLen", scope: !29, file: !14, line: 36, type: !35)
!40 = !DILocation(line: 36, column: 19, scope: !29)
!41 = !DILocation(line: 37, column: 28, scope: !29)
!42 = !DILocation(line: 37, column: 21, scope: !29)
!43 = !DILocation(line: 37, column: 19, scope: !29)
!44 = !DILocation(line: 40, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !29, file: !14, line: 40, column: 9)
!46 = !DILocation(line: 40, column: 14, scope: !45)
!47 = !DILocation(line: 40, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !14, line: 40, column: 9)
!49 = !DILocation(line: 40, column: 25, scope: !48)
!50 = !DILocation(line: 40, column: 35, scope: !48)
!51 = !DILocation(line: 40, column: 23, scope: !48)
!52 = !DILocation(line: 40, column: 9, scope: !45)
!53 = !DILocation(line: 42, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !14, line: 41, column: 9)
!55 = !DILocation(line: 42, column: 23, scope: !54)
!56 = !DILocation(line: 42, column: 13, scope: !54)
!57 = !DILocation(line: 42, column: 18, scope: !54)
!58 = !DILocation(line: 42, column: 21, scope: !54)
!59 = !DILocation(line: 43, column: 9, scope: !54)
!60 = !DILocation(line: 40, column: 41, scope: !48)
!61 = !DILocation(line: 40, column: 9, scope: !48)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 43, column: 9, scope: !45)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 44, column: 19, scope: !29)
!66 = !DILocation(line: 44, column: 9, scope: !29)
!67 = !DILocation(line: 46, column: 1, scope: !13)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_64b_goodG2BSink", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !68, file: !14, line: 53, type: !17)
!70 = !DILocation(line: 53, column: 89, scope: !68)
!71 = !DILocalVariable(name: "dataPtr", scope: !68, file: !14, line: 56, type: !4)
!72 = !DILocation(line: 56, column: 14, scope: !68)
!73 = !DILocation(line: 56, column: 34, scope: !68)
!74 = !DILocation(line: 56, column: 24, scope: !68)
!75 = !DILocalVariable(name: "data", scope: !68, file: !14, line: 58, type: !5)
!76 = !DILocation(line: 58, column: 12, scope: !68)
!77 = !DILocation(line: 58, column: 21, scope: !68)
!78 = !DILocation(line: 58, column: 20, scope: !68)
!79 = !DILocalVariable(name: "source", scope: !80, file: !14, line: 60, type: !30)
!80 = distinct !DILexicalBlock(scope: !68, file: !14, line: 59, column: 5)
!81 = !DILocation(line: 60, column: 14, scope: !80)
!82 = !DILocalVariable(name: "i", scope: !80, file: !14, line: 61, type: !35)
!83 = !DILocation(line: 61, column: 16, scope: !80)
!84 = !DILocalVariable(name: "sourceLen", scope: !80, file: !14, line: 61, type: !35)
!85 = !DILocation(line: 61, column: 19, scope: !80)
!86 = !DILocation(line: 62, column: 28, scope: !80)
!87 = !DILocation(line: 62, column: 21, scope: !80)
!88 = !DILocation(line: 62, column: 19, scope: !80)
!89 = !DILocation(line: 65, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !14, line: 65, column: 9)
!91 = !DILocation(line: 65, column: 14, scope: !90)
!92 = !DILocation(line: 65, column: 21, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !14, line: 65, column: 9)
!94 = !DILocation(line: 65, column: 25, scope: !93)
!95 = !DILocation(line: 65, column: 35, scope: !93)
!96 = !DILocation(line: 65, column: 23, scope: !93)
!97 = !DILocation(line: 65, column: 9, scope: !90)
!98 = !DILocation(line: 67, column: 30, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !14, line: 66, column: 9)
!100 = !DILocation(line: 67, column: 23, scope: !99)
!101 = !DILocation(line: 67, column: 13, scope: !99)
!102 = !DILocation(line: 67, column: 18, scope: !99)
!103 = !DILocation(line: 67, column: 21, scope: !99)
!104 = !DILocation(line: 68, column: 9, scope: !99)
!105 = !DILocation(line: 65, column: 41, scope: !93)
!106 = !DILocation(line: 65, column: 9, scope: !93)
!107 = distinct !{!107, !97, !108, !64}
!108 = !DILocation(line: 68, column: 9, scope: !90)
!109 = !DILocation(line: 69, column: 19, scope: !80)
!110 = !DILocation(line: 69, column: 9, scope: !80)
!111 = !DILocation(line: 71, column: 1, scope: !68)
