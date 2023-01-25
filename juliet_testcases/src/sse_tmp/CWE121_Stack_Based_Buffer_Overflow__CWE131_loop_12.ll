; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 10, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !25
  store i32* %1, i32** %data, align 8, !dbg !26
  br label %if.end, !dbg !27

if.else:                                          ; preds = %entry
  %2 = alloca i8, i64 40, align 16, !dbg !28
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %data, align 8, !dbg !31
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %5, 10, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !52
  %7 = load i32, i32* %arrayidx, align 4, !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %9 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !53
  store i32 %7, i32* %arrayidx1, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %10, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !62
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !62
  call void @printIntLine(i32 %12), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !92
  %tobool = icmp ne i32 %call, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !97
  store i32* %1, i32** %data, align 8, !dbg !98
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %2 = alloca i8, i64 40, align 16, !dbg !100
  %3 = bitcast i8* %2 to i32*, !dbg !102
  store i32* %3, i32** %data, align 8, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !112
  %cmp = icmp ult i64 %5, 10, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !118
  %7 = load i32, i32* %arrayidx, align 4, !dbg !118
  %8 = load i32*, i32** %data, align 8, !dbg !119
  %9 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx1 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !119
  store i32 %7, i32* %arrayidx1, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %10, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !127
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !127
  call void @printIntLine(i32 %12), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 25, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 8)
!22 = !DILocation(line: 25, column: 8, scope: !13)
!23 = !DILocation(line: 28, column: 23, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !14, line: 26, column: 5)
!25 = !DILocation(line: 28, column: 16, scope: !24)
!26 = !DILocation(line: 28, column: 14, scope: !24)
!27 = !DILocation(line: 29, column: 5, scope: !24)
!28 = !DILocation(line: 33, column: 23, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !14, line: 31, column: 5)
!30 = !DILocation(line: 33, column: 16, scope: !29)
!31 = !DILocation(line: 33, column: 14, scope: !29)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 36, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 36, column: 13, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !14, line: 37, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 37, column: 16, scope: !33)
!43 = !DILocation(line: 39, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !14, line: 39, column: 9)
!45 = !DILocation(line: 39, column: 14, scope: !44)
!46 = !DILocation(line: 39, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !14, line: 39, column: 9)
!48 = !DILocation(line: 39, column: 23, scope: !47)
!49 = !DILocation(line: 39, column: 9, scope: !44)
!50 = !DILocation(line: 41, column: 30, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !14, line: 40, column: 9)
!52 = !DILocation(line: 41, column: 23, scope: !51)
!53 = !DILocation(line: 41, column: 13, scope: !51)
!54 = !DILocation(line: 41, column: 18, scope: !51)
!55 = !DILocation(line: 41, column: 21, scope: !51)
!56 = !DILocation(line: 42, column: 9, scope: !51)
!57 = !DILocation(line: 39, column: 30, scope: !47)
!58 = !DILocation(line: 39, column: 9, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 42, column: 9, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 43, column: 22, scope: !33)
!63 = !DILocation(line: 43, column: 9, scope: !33)
!64 = !DILocation(line: 45, column: 1, scope: !13)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_12_good", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 81, column: 5, scope: !65)
!67 = !DILocation(line: 82, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !69, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!5, !5, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !14, line: 94, type: !5)
!75 = !DILocation(line: 94, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !14, line: 94, type: !71)
!77 = !DILocation(line: 94, column: 27, scope: !68)
!78 = !DILocation(line: 97, column: 22, scope: !68)
!79 = !DILocation(line: 97, column: 12, scope: !68)
!80 = !DILocation(line: 97, column: 5, scope: !68)
!81 = !DILocation(line: 99, column: 5, scope: !68)
!82 = !DILocation(line: 100, column: 5, scope: !68)
!83 = !DILocation(line: 101, column: 5, scope: !68)
!84 = !DILocation(line: 104, column: 5, scope: !68)
!85 = !DILocation(line: 105, column: 5, scope: !68)
!86 = !DILocation(line: 106, column: 5, scope: !68)
!87 = !DILocation(line: 108, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !14, line: 55, type: !4)
!90 = !DILocation(line: 55, column: 11, scope: !88)
!91 = !DILocation(line: 56, column: 10, scope: !88)
!92 = !DILocation(line: 57, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !14, line: 57, column: 8)
!94 = !DILocation(line: 57, column: 8, scope: !88)
!95 = !DILocation(line: 60, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !14, line: 58, column: 5)
!97 = !DILocation(line: 60, column: 16, scope: !96)
!98 = !DILocation(line: 60, column: 14, scope: !96)
!99 = !DILocation(line: 61, column: 5, scope: !96)
!100 = !DILocation(line: 65, column: 23, scope: !101)
!101 = distinct !DILexicalBlock(scope: !93, file: !14, line: 63, column: 5)
!102 = !DILocation(line: 65, column: 16, scope: !101)
!103 = !DILocation(line: 65, column: 14, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !14, line: 68, type: !34)
!105 = distinct !DILexicalBlock(scope: !88, file: !14, line: 67, column: 5)
!106 = !DILocation(line: 68, column: 13, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !14, line: 69, type: !39)
!108 = !DILocation(line: 69, column: 16, scope: !105)
!109 = !DILocation(line: 71, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !14, line: 71, column: 9)
!111 = !DILocation(line: 71, column: 14, scope: !110)
!112 = !DILocation(line: 71, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !14, line: 71, column: 9)
!114 = !DILocation(line: 71, column: 23, scope: !113)
!115 = !DILocation(line: 71, column: 9, scope: !110)
!116 = !DILocation(line: 73, column: 30, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !14, line: 72, column: 9)
!118 = !DILocation(line: 73, column: 23, scope: !117)
!119 = !DILocation(line: 73, column: 13, scope: !117)
!120 = !DILocation(line: 73, column: 18, scope: !117)
!121 = !DILocation(line: 73, column: 21, scope: !117)
!122 = !DILocation(line: 74, column: 9, scope: !117)
!123 = !DILocation(line: 71, column: 30, scope: !113)
!124 = !DILocation(line: 71, column: 9, scope: !113)
!125 = distinct !{!125, !115, !126, !61}
!126 = !DILocation(line: 74, column: 9, scope: !110)
!127 = !DILocation(line: 75, column: 22, scope: !105)
!128 = !DILocation(line: 75, column: 9, scope: !105)
!129 = !DILocation(line: 77, column: 1, scope: !88)
