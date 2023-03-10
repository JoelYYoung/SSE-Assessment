; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType = type { i8* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !35, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !38
  store i64 %call, i64* %sourceLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %3 = load i64, i64* %sourceLen, align 8, !dbg !45
  %add = add i64 %3, 1, !dbg !46
  %cmp = icmp ult i64 %2, %add, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !51
  %5 = load i8, i8* %arrayidx, align 1, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !52
  store i8 %5, i8* %arrayidx1, align 1, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %8, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* %9), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !64 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType* %myStruct, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !69
  %0 = load i8*, i8** %structFirst, align 8, !dbg !69
  store i8* %0, i8** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !78
  store i64 %call, i64* %sourceLen, align 8, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !83
  %3 = load i64, i64* %sourceLen, align 8, !dbg !85
  %add = add i64 %3, 1, !dbg !86
  %cmp = icmp ult i64 %2, %add, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !91
  %5 = load i8, i8* %arrayidx, align 1, !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !92
  %7 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !92
  store i8 %5, i8* %arrayidx1, align 1, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %8, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %9), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType", file: !10, line: 29, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67_structType", file: !10, line: 26, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 28, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 33, type: !13)
!20 = !DILocation(line: 33, column: 154, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !17)
!22 = !DILocation(line: 35, column: 12, scope: !9)
!23 = !DILocation(line: 35, column: 28, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 37, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 37, column: 14, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 38, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 38, column: 16, scope: !25)
!35 = !DILocalVariable(name: "sourceLen", scope: !25, file: !10, line: 38, type: !31)
!36 = !DILocation(line: 38, column: 19, scope: !25)
!37 = !DILocation(line: 39, column: 28, scope: !25)
!38 = !DILocation(line: 39, column: 21, scope: !25)
!39 = !DILocation(line: 39, column: 19, scope: !25)
!40 = !DILocation(line: 42, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !25, file: !10, line: 42, column: 9)
!42 = !DILocation(line: 42, column: 14, scope: !41)
!43 = !DILocation(line: 42, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 42, column: 9)
!45 = !DILocation(line: 42, column: 25, scope: !44)
!46 = !DILocation(line: 42, column: 35, scope: !44)
!47 = !DILocation(line: 42, column: 23, scope: !44)
!48 = !DILocation(line: 42, column: 9, scope: !41)
!49 = !DILocation(line: 44, column: 30, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !10, line: 43, column: 9)
!51 = !DILocation(line: 44, column: 23, scope: !50)
!52 = !DILocation(line: 44, column: 13, scope: !50)
!53 = !DILocation(line: 44, column: 18, scope: !50)
!54 = !DILocation(line: 44, column: 21, scope: !50)
!55 = !DILocation(line: 45, column: 9, scope: !50)
!56 = !DILocation(line: 42, column: 41, scope: !44)
!57 = !DILocation(line: 42, column: 9, scope: !44)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 45, column: 9, scope: !41)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 46, column: 19, scope: !25)
!62 = !DILocation(line: 46, column: 9, scope: !25)
!63 = !DILocation(line: 48, column: 1, scope: !9)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_67b_goodG2BSink", scope: !10, file: !10, line: 55, type: !11, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "myStruct", arg: 1, scope: !64, file: !10, line: 55, type: !13)
!66 = !DILocation(line: 55, column: 158, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 57, type: !17)
!68 = !DILocation(line: 57, column: 12, scope: !64)
!69 = !DILocation(line: 57, column: 28, scope: !64)
!70 = !DILocalVariable(name: "source", scope: !71, file: !10, line: 59, type: !26)
!71 = distinct !DILexicalBlock(scope: !64, file: !10, line: 58, column: 5)
!72 = !DILocation(line: 59, column: 14, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 60, type: !31)
!74 = !DILocation(line: 60, column: 16, scope: !71)
!75 = !DILocalVariable(name: "sourceLen", scope: !71, file: !10, line: 60, type: !31)
!76 = !DILocation(line: 60, column: 19, scope: !71)
!77 = !DILocation(line: 61, column: 28, scope: !71)
!78 = !DILocation(line: 61, column: 21, scope: !71)
!79 = !DILocation(line: 61, column: 19, scope: !71)
!80 = !DILocation(line: 64, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !10, line: 64, column: 9)
!82 = !DILocation(line: 64, column: 14, scope: !81)
!83 = !DILocation(line: 64, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !10, line: 64, column: 9)
!85 = !DILocation(line: 64, column: 25, scope: !84)
!86 = !DILocation(line: 64, column: 35, scope: !84)
!87 = !DILocation(line: 64, column: 23, scope: !84)
!88 = !DILocation(line: 64, column: 9, scope: !81)
!89 = !DILocation(line: 66, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !10, line: 65, column: 9)
!91 = !DILocation(line: 66, column: 23, scope: !90)
!92 = !DILocation(line: 66, column: 13, scope: !90)
!93 = !DILocation(line: 66, column: 18, scope: !90)
!94 = !DILocation(line: 66, column: 21, scope: !90)
!95 = !DILocation(line: 67, column: 9, scope: !90)
!96 = !DILocation(line: 64, column: 41, scope: !84)
!97 = !DILocation(line: 64, column: 9, scope: !84)
!98 = distinct !{!98, !88, !99, !60}
!99 = !DILocation(line: 67, column: 9, scope: !81)
!100 = !DILocation(line: 68, column: 19, scope: !71)
!101 = !DILocation(line: 68, column: 9, scope: !71)
!102 = !DILocation(line: 70, column: 1, scope: !64)
