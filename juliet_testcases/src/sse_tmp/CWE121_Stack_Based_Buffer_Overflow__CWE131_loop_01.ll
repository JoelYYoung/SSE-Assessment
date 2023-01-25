; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = alloca i8, i64 10, align 16, !dbg !20
  %1 = bitcast i8* %0 to i32*, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %3, 10, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !43
  %5 = load i32, i32* %arrayidx, align 4, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %7 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !44
  store i32 %5, i32* %arrayidx1, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %8, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !53
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !53
  call void @printIntLine(i32 %10), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %0 = alloca i8, i64 40, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %i, metadata !89, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !94
  %cmp = icmp ult i64 %3, 10, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !100
  %5 = load i32, i32* %arrayidx, align 4, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %7 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !101
  store i32 %5, i32* %arrayidx1, align 4, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %8, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !109
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !109
  call void @printIntLine(i32 %10), !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 26, column: 19, scope: !13)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 10, scope: !13)
!23 = !DILocalVariable(name: "source", scope: !24, file: !14, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 28, column: 13, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !24, file: !14, line: 29, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 29, column: 16, scope: !24)
!34 = !DILocation(line: 31, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !24, file: !14, line: 31, column: 9)
!36 = !DILocation(line: 31, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 31, column: 9)
!39 = !DILocation(line: 31, column: 23, scope: !38)
!40 = !DILocation(line: 31, column: 9, scope: !35)
!41 = !DILocation(line: 33, column: 30, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !14, line: 32, column: 9)
!43 = !DILocation(line: 33, column: 23, scope: !42)
!44 = !DILocation(line: 33, column: 13, scope: !42)
!45 = !DILocation(line: 33, column: 18, scope: !42)
!46 = !DILocation(line: 33, column: 21, scope: !42)
!47 = !DILocation(line: 34, column: 9, scope: !42)
!48 = !DILocation(line: 31, column: 30, scope: !38)
!49 = !DILocation(line: 31, column: 9, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 34, column: 9, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 35, column: 22, scope: !24)
!54 = !DILocation(line: 35, column: 9, scope: !24)
!55 = !DILocation(line: 37, column: 1, scope: !13)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_01_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 64, column: 5, scope: !56)
!58 = !DILocation(line: 65, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !60, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!5, !5, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !14, line: 77, type: !5)
!66 = !DILocation(line: 77, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !14, line: 77, type: !62)
!68 = !DILocation(line: 77, column: 27, scope: !59)
!69 = !DILocation(line: 80, column: 22, scope: !59)
!70 = !DILocation(line: 80, column: 12, scope: !59)
!71 = !DILocation(line: 80, column: 5, scope: !59)
!72 = !DILocation(line: 82, column: 5, scope: !59)
!73 = !DILocation(line: 83, column: 5, scope: !59)
!74 = !DILocation(line: 84, column: 5, scope: !59)
!75 = !DILocation(line: 87, column: 5, scope: !59)
!76 = !DILocation(line: 88, column: 5, scope: !59)
!77 = !DILocation(line: 89, column: 5, scope: !59)
!78 = !DILocation(line: 91, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 46, type: !4)
!81 = !DILocation(line: 46, column: 11, scope: !79)
!82 = !DILocation(line: 47, column: 10, scope: !79)
!83 = !DILocation(line: 49, column: 19, scope: !79)
!84 = !DILocation(line: 49, column: 12, scope: !79)
!85 = !DILocation(line: 49, column: 10, scope: !79)
!86 = !DILocalVariable(name: "source", scope: !87, file: !14, line: 51, type: !25)
!87 = distinct !DILexicalBlock(scope: !79, file: !14, line: 50, column: 5)
!88 = !DILocation(line: 51, column: 13, scope: !87)
!89 = !DILocalVariable(name: "i", scope: !87, file: !14, line: 52, type: !30)
!90 = !DILocation(line: 52, column: 16, scope: !87)
!91 = !DILocation(line: 54, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !14, line: 54, column: 9)
!93 = !DILocation(line: 54, column: 14, scope: !92)
!94 = !DILocation(line: 54, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !14, line: 54, column: 9)
!96 = !DILocation(line: 54, column: 23, scope: !95)
!97 = !DILocation(line: 54, column: 9, scope: !92)
!98 = !DILocation(line: 56, column: 30, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !14, line: 55, column: 9)
!100 = !DILocation(line: 56, column: 23, scope: !99)
!101 = !DILocation(line: 56, column: 13, scope: !99)
!102 = !DILocation(line: 56, column: 18, scope: !99)
!103 = !DILocation(line: 56, column: 21, scope: !99)
!104 = !DILocation(line: 57, column: 9, scope: !99)
!105 = !DILocation(line: 54, column: 30, scope: !95)
!106 = !DILocation(line: 54, column: 9, scope: !95)
!107 = distinct !{!107, !97, !108, !52}
!108 = !DILocation(line: 57, column: 9, scope: !92)
!109 = !DILocation(line: 58, column: 22, scope: !87)
!110 = !DILocation(line: 58, column: 9, scope: !87)
!111 = !DILocation(line: 60, column: 1, scope: !79)
