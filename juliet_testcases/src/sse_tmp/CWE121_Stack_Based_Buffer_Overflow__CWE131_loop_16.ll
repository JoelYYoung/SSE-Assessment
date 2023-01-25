; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  br label %while.body, !dbg !20

while.body:                                       ; preds = %entry
  %0 = alloca i8, i64 10, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !24
  br label %while.end, !dbg !25

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %while.end
  %3 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %3, 10, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !46
  %5 = load i32, i32* %arrayidx, align 4, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !47
  store i32 %5, i32* %arrayidx1, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %8, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !56
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !56
  call void @printIntLine(i32 %10), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  br label %while.body, !dbg !86

while.body:                                       ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %data, align 8, !dbg !90
  br label %while.end, !dbg !91

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !94
  call void @llvm.dbg.declare(metadata i64* %i, metadata !95, metadata !DIExpression()), !dbg !96
  store i64 0, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %while.end
  %3 = load i64, i64* %i, align 8, !dbg !100
  %cmp = icmp ult i64 %3, 10, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !106
  %5 = load i32, i32* %arrayidx, align 4, !dbg !106
  %6 = load i32*, i32** %data, align 8, !dbg !107
  %7 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !107
  store i32 %5, i32* %arrayidx1, align 4, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !111
  %inc = add i64 %8, 1, !dbg !111
  store i64 %inc, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !115
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !115
  call void @printIntLine(i32 %10), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 25, column: 5, scope: !13)
!21 = !DILocation(line: 28, column: 23, scope: !22)
!22 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 5)
!23 = !DILocation(line: 28, column: 16, scope: !22)
!24 = !DILocation(line: 28, column: 14, scope: !22)
!25 = !DILocation(line: 29, column: 9, scope: !22)
!26 = !DILocalVariable(name: "source", scope: !27, file: !14, line: 32, type: !28)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 10)
!31 = !DILocation(line: 32, column: 13, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !27, file: !14, line: 33, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 33, column: 16, scope: !27)
!37 = !DILocation(line: 35, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !27, file: !14, line: 35, column: 9)
!39 = !DILocation(line: 35, column: 14, scope: !38)
!40 = !DILocation(line: 35, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !14, line: 35, column: 9)
!42 = !DILocation(line: 35, column: 23, scope: !41)
!43 = !DILocation(line: 35, column: 9, scope: !38)
!44 = !DILocation(line: 37, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !14, line: 36, column: 9)
!46 = !DILocation(line: 37, column: 23, scope: !45)
!47 = !DILocation(line: 37, column: 13, scope: !45)
!48 = !DILocation(line: 37, column: 18, scope: !45)
!49 = !DILocation(line: 37, column: 21, scope: !45)
!50 = !DILocation(line: 38, column: 9, scope: !45)
!51 = !DILocation(line: 35, column: 30, scope: !41)
!52 = !DILocation(line: 35, column: 9, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 38, column: 9, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 39, column: 22, scope: !27)
!57 = !DILocation(line: 39, column: 9, scope: !27)
!58 = !DILocation(line: 41, column: 1, scope: !13)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_16_good", scope: !14, file: !14, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 72, column: 5, scope: !59)
!61 = !DILocation(line: 73, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 85, type: !63, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!5, !5, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 85, type: !5)
!69 = !DILocation(line: 85, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 85, type: !65)
!71 = !DILocation(line: 85, column: 27, scope: !62)
!72 = !DILocation(line: 88, column: 22, scope: !62)
!73 = !DILocation(line: 88, column: 12, scope: !62)
!74 = !DILocation(line: 88, column: 5, scope: !62)
!75 = !DILocation(line: 90, column: 5, scope: !62)
!76 = !DILocation(line: 91, column: 5, scope: !62)
!77 = !DILocation(line: 92, column: 5, scope: !62)
!78 = !DILocation(line: 95, column: 5, scope: !62)
!79 = !DILocation(line: 96, column: 5, scope: !62)
!80 = !DILocation(line: 97, column: 5, scope: !62)
!81 = !DILocation(line: 99, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 50, type: !4)
!84 = !DILocation(line: 50, column: 11, scope: !82)
!85 = !DILocation(line: 51, column: 10, scope: !82)
!86 = !DILocation(line: 52, column: 5, scope: !82)
!87 = !DILocation(line: 55, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !14, line: 53, column: 5)
!89 = !DILocation(line: 55, column: 16, scope: !88)
!90 = !DILocation(line: 55, column: 14, scope: !88)
!91 = !DILocation(line: 56, column: 9, scope: !88)
!92 = !DILocalVariable(name: "source", scope: !93, file: !14, line: 59, type: !28)
!93 = distinct !DILexicalBlock(scope: !82, file: !14, line: 58, column: 5)
!94 = !DILocation(line: 59, column: 13, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !93, file: !14, line: 60, type: !33)
!96 = !DILocation(line: 60, column: 16, scope: !93)
!97 = !DILocation(line: 62, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !14, line: 62, column: 9)
!99 = !DILocation(line: 62, column: 14, scope: !98)
!100 = !DILocation(line: 62, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !14, line: 62, column: 9)
!102 = !DILocation(line: 62, column: 23, scope: !101)
!103 = !DILocation(line: 62, column: 9, scope: !98)
!104 = !DILocation(line: 64, column: 30, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !14, line: 63, column: 9)
!106 = !DILocation(line: 64, column: 23, scope: !105)
!107 = !DILocation(line: 64, column: 13, scope: !105)
!108 = !DILocation(line: 64, column: 18, scope: !105)
!109 = !DILocation(line: 64, column: 21, scope: !105)
!110 = !DILocation(line: 65, column: 9, scope: !105)
!111 = !DILocation(line: 62, column: 30, scope: !101)
!112 = !DILocation(line: 62, column: 9, scope: !101)
!113 = distinct !{!113, !103, !114, !55}
!114 = !DILocation(line: 65, column: 9, scope: !98)
!115 = !DILocation(line: 66, column: 22, scope: !93)
!116 = !DILocation(line: 66, column: 9, scope: !93)
!117 = !DILocation(line: 68, column: 1, scope: !82)
