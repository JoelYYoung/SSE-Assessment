; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !33, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !35
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !36
  store i64 %call, i64* %sourceLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !41
  %4 = load i64, i64* %sourceLen, align 8, !dbg !43
  %add = add i64 %4, 1, !dbg !44
  %cmp = icmp ult i64 %3, %add, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !49
  %6 = load i8, i8* %arrayidx, align 1, !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !50
  %8 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !50
  store i8 %6, i8* %arrayidx1, align 1, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %9, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %10), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !62 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !67
  %1 = load i8*, i8** %0, align 8, !dbg !68
  store i8* %1, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !69, metadata !DIExpression()), !dbg !71
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !71
  call void @llvm.dbg.declare(metadata i64* %i, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !76
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !77
  store i64 %call, i64* %sourceLen, align 8, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !82
  %4 = load i64, i64* %sourceLen, align 8, !dbg !84
  %add = add i64 %4, 1, !dbg !85
  %cmp = icmp ult i64 %3, %add, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !90
  %6 = load i8, i8* %arrayidx, align 1, !dbg !90
  %7 = load i8*, i8** %data, align 8, !dbg !91
  %8 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !91
  store i8 %6, i8* %arrayidx1, align 1, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %9, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* %10), !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!17 = !DILocation(line: 28, column: 88, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!19 = !DILocation(line: 30, column: 12, scope: !9)
!20 = !DILocation(line: 30, column: 20, scope: !9)
!21 = !DILocation(line: 30, column: 19, scope: !9)
!22 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 32, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 88, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 11)
!27 = !DILocation(line: 32, column: 14, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !23, file: !10, line: 33, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 33, column: 16, scope: !23)
!33 = !DILocalVariable(name: "sourceLen", scope: !23, file: !10, line: 33, type: !29)
!34 = !DILocation(line: 33, column: 19, scope: !23)
!35 = !DILocation(line: 34, column: 28, scope: !23)
!36 = !DILocation(line: 34, column: 21, scope: !23)
!37 = !DILocation(line: 34, column: 19, scope: !23)
!38 = !DILocation(line: 37, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !23, file: !10, line: 37, column: 9)
!40 = !DILocation(line: 37, column: 14, scope: !39)
!41 = !DILocation(line: 37, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 37, column: 9)
!43 = !DILocation(line: 37, column: 25, scope: !42)
!44 = !DILocation(line: 37, column: 35, scope: !42)
!45 = !DILocation(line: 37, column: 23, scope: !42)
!46 = !DILocation(line: 37, column: 9, scope: !39)
!47 = !DILocation(line: 39, column: 30, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !10, line: 38, column: 9)
!49 = !DILocation(line: 39, column: 23, scope: !48)
!50 = !DILocation(line: 39, column: 13, scope: !48)
!51 = !DILocation(line: 39, column: 18, scope: !48)
!52 = !DILocation(line: 39, column: 21, scope: !48)
!53 = !DILocation(line: 40, column: 9, scope: !48)
!54 = !DILocation(line: 37, column: 41, scope: !42)
!55 = !DILocation(line: 37, column: 9, scope: !42)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 40, column: 9, scope: !39)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 41, column: 19, scope: !23)
!60 = !DILocation(line: 41, column: 9, scope: !23)
!61 = !DILocation(line: 43, column: 1, scope: !9)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_63b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !62, file: !10, line: 50, type: !13)
!64 = !DILocation(line: 50, column: 92, scope: !62)
!65 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 52, type: !14)
!66 = !DILocation(line: 52, column: 12, scope: !62)
!67 = !DILocation(line: 52, column: 20, scope: !62)
!68 = !DILocation(line: 52, column: 19, scope: !62)
!69 = !DILocalVariable(name: "source", scope: !70, file: !10, line: 54, type: !24)
!70 = distinct !DILexicalBlock(scope: !62, file: !10, line: 53, column: 5)
!71 = !DILocation(line: 54, column: 14, scope: !70)
!72 = !DILocalVariable(name: "i", scope: !70, file: !10, line: 55, type: !29)
!73 = !DILocation(line: 55, column: 16, scope: !70)
!74 = !DILocalVariable(name: "sourceLen", scope: !70, file: !10, line: 55, type: !29)
!75 = !DILocation(line: 55, column: 19, scope: !70)
!76 = !DILocation(line: 56, column: 28, scope: !70)
!77 = !DILocation(line: 56, column: 21, scope: !70)
!78 = !DILocation(line: 56, column: 19, scope: !70)
!79 = !DILocation(line: 59, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !10, line: 59, column: 9)
!81 = !DILocation(line: 59, column: 14, scope: !80)
!82 = !DILocation(line: 59, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 59, column: 9)
!84 = !DILocation(line: 59, column: 25, scope: !83)
!85 = !DILocation(line: 59, column: 35, scope: !83)
!86 = !DILocation(line: 59, column: 23, scope: !83)
!87 = !DILocation(line: 59, column: 9, scope: !80)
!88 = !DILocation(line: 61, column: 30, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !10, line: 60, column: 9)
!90 = !DILocation(line: 61, column: 23, scope: !89)
!91 = !DILocation(line: 61, column: 13, scope: !89)
!92 = !DILocation(line: 61, column: 18, scope: !89)
!93 = !DILocation(line: 61, column: 21, scope: !89)
!94 = !DILocation(line: 62, column: 9, scope: !89)
!95 = !DILocation(line: 59, column: 41, scope: !83)
!96 = !DILocation(line: 59, column: 9, scope: !83)
!97 = distinct !{!97, !87, !98, !58}
!98 = !DILocation(line: 62, column: 9, scope: !80)
!99 = !DILocation(line: 63, column: 19, scope: !70)
!100 = !DILocation(line: 63, column: 9, scope: !70)
!101 = !DILocation(line: 65, column: 1, scope: !62)
