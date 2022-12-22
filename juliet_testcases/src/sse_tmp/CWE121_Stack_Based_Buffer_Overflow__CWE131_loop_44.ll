; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %data, align 8, !dbg !27
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !28
  %3 = load i32*, i32** %data, align 8, !dbg !29
  call void %2(i32* %3), !dbg !28
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !31 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !48
  %cmp = icmp ult i64 %1, 10, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !54
  %3 = load i32, i32* %arrayidx, align 4, !dbg !54
  %4 = load i32*, i32** %data.addr, align 8, !dbg !55
  %5 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !55
  store i32 %3, i32* %arrayidx1, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %6, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !64
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !64
  call void @printIntLine(i32 %8), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !93, metadata !DIExpression()), !dbg !94
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %0 = alloca i8, i64 40, align 16, !dbg !96
  %1 = bitcast i8* %0 to i32*, !dbg !97
  store i32* %1, i32** %data, align 8, !dbg !98
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !99
  %3 = load i32*, i32** %data, align 8, !dbg !100
  call void %2(i32* %3), !dbg !99
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !102 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %1, 10, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !119
  %3 = load i32, i32* %arrayidx, align 4, !dbg !119
  %4 = load i32*, i32** %data.addr, align 8, !dbg !120
  %5 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !120
  store i32 %3, i32* %arrayidx1, align 4, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %6, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !128
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !128
  call void @printIntLine(i32 %8), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44_bad", scope: !14, file: !14, line: 35, type: !15, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 37, type: !4)
!18 = !DILocation(line: 37, column: 11, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 39, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 39, column: 12, scope: !13)
!24 = !DILocation(line: 40, column: 10, scope: !13)
!25 = !DILocation(line: 42, column: 19, scope: !13)
!26 = !DILocation(line: 42, column: 12, scope: !13)
!27 = !DILocation(line: 42, column: 10, scope: !13)
!28 = !DILocation(line: 44, column: 5, scope: !13)
!29 = !DILocation(line: 44, column: 13, scope: !13)
!30 = !DILocation(line: 45, column: 1, scope: !13)
!31 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocalVariable(name: "data", arg: 1, scope: !31, file: !14, line: 21, type: !4)
!33 = !DILocation(line: 21, column: 27, scope: !31)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 24, type: !36)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 23, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 24, column: 13, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 25, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 25, column: 16, scope: !35)
!45 = !DILocation(line: 27, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !14, line: 27, column: 9)
!47 = !DILocation(line: 27, column: 14, scope: !46)
!48 = !DILocation(line: 27, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !14, line: 27, column: 9)
!50 = !DILocation(line: 27, column: 23, scope: !49)
!51 = !DILocation(line: 27, column: 9, scope: !46)
!52 = !DILocation(line: 29, column: 30, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !14, line: 28, column: 9)
!54 = !DILocation(line: 29, column: 23, scope: !53)
!55 = !DILocation(line: 29, column: 13, scope: !53)
!56 = !DILocation(line: 29, column: 18, scope: !53)
!57 = !DILocation(line: 29, column: 21, scope: !53)
!58 = !DILocation(line: 30, column: 9, scope: !53)
!59 = !DILocation(line: 27, column: 30, scope: !49)
!60 = !DILocation(line: 27, column: 9, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 30, column: 9, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 31, column: 22, scope: !35)
!65 = !DILocation(line: 31, column: 9, scope: !35)
!66 = !DILocation(line: 33, column: 1, scope: !31)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_44_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 78, column: 5, scope: !67)
!69 = !DILocation(line: 79, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 90, type: !71, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!5, !5, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !14, line: 90, type: !5)
!77 = !DILocation(line: 90, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !14, line: 90, type: !73)
!79 = !DILocation(line: 90, column: 27, scope: !70)
!80 = !DILocation(line: 93, column: 22, scope: !70)
!81 = !DILocation(line: 93, column: 12, scope: !70)
!82 = !DILocation(line: 93, column: 5, scope: !70)
!83 = !DILocation(line: 95, column: 5, scope: !70)
!84 = !DILocation(line: 96, column: 5, scope: !70)
!85 = !DILocation(line: 97, column: 5, scope: !70)
!86 = !DILocation(line: 100, column: 5, scope: !70)
!87 = !DILocation(line: 101, column: 5, scope: !70)
!88 = !DILocation(line: 102, column: 5, scope: !70)
!89 = !DILocation(line: 104, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 66, type: !15, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !14, line: 68, type: !4)
!92 = !DILocation(line: 68, column: 11, scope: !90)
!93 = !DILocalVariable(name: "funcPtr", scope: !90, file: !14, line: 69, type: !20)
!94 = !DILocation(line: 69, column: 12, scope: !90)
!95 = !DILocation(line: 70, column: 10, scope: !90)
!96 = !DILocation(line: 72, column: 19, scope: !90)
!97 = !DILocation(line: 72, column: 12, scope: !90)
!98 = !DILocation(line: 72, column: 10, scope: !90)
!99 = !DILocation(line: 73, column: 5, scope: !90)
!100 = !DILocation(line: 73, column: 13, scope: !90)
!101 = !DILocation(line: 74, column: 1, scope: !90)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 52, type: !21, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", arg: 1, scope: !102, file: !14, line: 52, type: !4)
!104 = !DILocation(line: 52, column: 31, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !14, line: 55, type: !36)
!106 = distinct !DILexicalBlock(scope: !102, file: !14, line: 54, column: 5)
!107 = !DILocation(line: 55, column: 13, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !14, line: 56, type: !41)
!109 = !DILocation(line: 56, column: 16, scope: !106)
!110 = !DILocation(line: 58, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !14, line: 58, column: 9)
!112 = !DILocation(line: 58, column: 14, scope: !111)
!113 = !DILocation(line: 58, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 58, column: 9)
!115 = !DILocation(line: 58, column: 23, scope: !114)
!116 = !DILocation(line: 58, column: 9, scope: !111)
!117 = !DILocation(line: 60, column: 30, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !14, line: 59, column: 9)
!119 = !DILocation(line: 60, column: 23, scope: !118)
!120 = !DILocation(line: 60, column: 13, scope: !118)
!121 = !DILocation(line: 60, column: 18, scope: !118)
!122 = !DILocation(line: 60, column: 21, scope: !118)
!123 = !DILocation(line: 61, column: 9, scope: !118)
!124 = !DILocation(line: 58, column: 30, scope: !114)
!125 = !DILocation(line: 58, column: 9, scope: !114)
!126 = distinct !{!126, !116, !127, !63}
!127 = !DILocation(line: 61, column: 9, scope: !111)
!128 = !DILocation(line: 62, column: 22, scope: !106)
!129 = !DILocation(line: 62, column: 9, scope: !106)
!130 = !DILocation(line: 64, column: 1, scope: !102)
