; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !32, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !34
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !35
  store i64 %call, i64* %sourceLen, align 8, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !40
  %4 = load i64, i64* %sourceLen, align 8, !dbg !42
  %add = add i64 %4, 1, !dbg !43
  %cmp = icmp ult i64 %3, %add, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !48
  %6 = load i8, i8* %arrayidx1, align 1, !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  %8 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !49
  store i8 %6, i8* %arrayidx2, align 1, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %9, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* %10), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_goodG2BSink(i8** %dataArray) #0 !dbg !61 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !66
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !66
  store i8* %1, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !67, metadata !DIExpression()), !dbg !69
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !69
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !74
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !75
  store i64 %call, i64* %sourceLen, align 8, !dbg !76
  store i64 0, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !80
  %4 = load i64, i64* %sourceLen, align 8, !dbg !82
  %add = add i64 %4, 1, !dbg !83
  %cmp = icmp ult i64 %3, %add, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !88
  %6 = load i8, i8* %arrayidx1, align 1, !dbg !88
  %7 = load i8*, i8** %data, align 8, !dbg !89
  %8 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !89
  store i8 %6, i8* %arrayidx2, align 1, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !93
  %inc = add i64 %9, 1, !dbg !93
  store i64 %inc, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %10), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!17 = !DILocation(line: 28, column: 86, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 31, type: !14)
!19 = !DILocation(line: 31, column: 12, scope: !9)
!20 = !DILocation(line: 31, column: 19, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 33, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 33, column: 14, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 34, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 34, column: 16, scope: !22)
!32 = !DILocalVariable(name: "sourceLen", scope: !22, file: !10, line: 34, type: !28)
!33 = !DILocation(line: 34, column: 19, scope: !22)
!34 = !DILocation(line: 35, column: 28, scope: !22)
!35 = !DILocation(line: 35, column: 21, scope: !22)
!36 = !DILocation(line: 35, column: 19, scope: !22)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !22, file: !10, line: 38, column: 9)
!39 = !DILocation(line: 38, column: 14, scope: !38)
!40 = !DILocation(line: 38, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 38, column: 9)
!42 = !DILocation(line: 38, column: 25, scope: !41)
!43 = !DILocation(line: 38, column: 35, scope: !41)
!44 = !DILocation(line: 38, column: 23, scope: !41)
!45 = !DILocation(line: 38, column: 9, scope: !38)
!46 = !DILocation(line: 40, column: 30, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !10, line: 39, column: 9)
!48 = !DILocation(line: 40, column: 23, scope: !47)
!49 = !DILocation(line: 40, column: 13, scope: !47)
!50 = !DILocation(line: 40, column: 18, scope: !47)
!51 = !DILocation(line: 40, column: 21, scope: !47)
!52 = !DILocation(line: 41, column: 9, scope: !47)
!53 = !DILocation(line: 38, column: 41, scope: !41)
!54 = !DILocation(line: 38, column: 9, scope: !41)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 41, column: 9, scope: !38)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 42, column: 19, scope: !22)
!59 = !DILocation(line: 42, column: 9, scope: !22)
!60 = !DILocation(line: 44, column: 1, scope: !9)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_66b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "dataArray", arg: 1, scope: !61, file: !10, line: 51, type: !13)
!63 = !DILocation(line: 51, column: 90, scope: !61)
!64 = !DILocalVariable(name: "data", scope: !61, file: !10, line: 53, type: !14)
!65 = !DILocation(line: 53, column: 12, scope: !61)
!66 = !DILocation(line: 53, column: 19, scope: !61)
!67 = !DILocalVariable(name: "source", scope: !68, file: !10, line: 55, type: !23)
!68 = distinct !DILexicalBlock(scope: !61, file: !10, line: 54, column: 5)
!69 = !DILocation(line: 55, column: 14, scope: !68)
!70 = !DILocalVariable(name: "i", scope: !68, file: !10, line: 56, type: !28)
!71 = !DILocation(line: 56, column: 16, scope: !68)
!72 = !DILocalVariable(name: "sourceLen", scope: !68, file: !10, line: 56, type: !28)
!73 = !DILocation(line: 56, column: 19, scope: !68)
!74 = !DILocation(line: 57, column: 28, scope: !68)
!75 = !DILocation(line: 57, column: 21, scope: !68)
!76 = !DILocation(line: 57, column: 19, scope: !68)
!77 = !DILocation(line: 60, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !68, file: !10, line: 60, column: 9)
!79 = !DILocation(line: 60, column: 14, scope: !78)
!80 = !DILocation(line: 60, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !10, line: 60, column: 9)
!82 = !DILocation(line: 60, column: 25, scope: !81)
!83 = !DILocation(line: 60, column: 35, scope: !81)
!84 = !DILocation(line: 60, column: 23, scope: !81)
!85 = !DILocation(line: 60, column: 9, scope: !78)
!86 = !DILocation(line: 62, column: 30, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !10, line: 61, column: 9)
!88 = !DILocation(line: 62, column: 23, scope: !87)
!89 = !DILocation(line: 62, column: 13, scope: !87)
!90 = !DILocation(line: 62, column: 18, scope: !87)
!91 = !DILocation(line: 62, column: 21, scope: !87)
!92 = !DILocation(line: 63, column: 9, scope: !87)
!93 = !DILocation(line: 60, column: 41, scope: !81)
!94 = !DILocation(line: 60, column: 9, scope: !81)
!95 = distinct !{!95, !85, !96, !57}
!96 = !DILocation(line: 63, column: 9, scope: !78)
!97 = !DILocation(line: 64, column: 19, scope: !68)
!98 = !DILocation(line: 64, column: 9, scope: !68)
!99 = !DILocation(line: 66, column: 1, scope: !61)
