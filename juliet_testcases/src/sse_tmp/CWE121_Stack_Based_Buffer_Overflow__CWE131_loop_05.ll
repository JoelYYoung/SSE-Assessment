; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 10, align 16, !dbg !28
  %2 = bitcast i8* %1 to i32*, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %4, 10, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !53
  %6 = load i32, i32* %arrayidx, align 4, !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  %8 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !54
  store i32 %6, i32* %arrayidx1, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %9, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !63
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !63
  call void @printIntLine(i32 %11), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %0 = load i32, i32* @staticFalse, align 4, !dbg !94
  %tobool = icmp ne i32 %0, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !100
  %2 = bitcast i8* %1 to i32*, !dbg !102
  store i32* %2, i32** %data, align 8, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !112
  %cmp = icmp ult i64 %4, 10, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !118
  %6 = load i32, i32* %arrayidx, align 4, !dbg !118
  %7 = load i32*, i32** %data, align 8, !dbg !119
  %8 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !119
  store i32 %6, i32* %arrayidx1, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %9, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !127
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !127
  call void @printIntLine(i32 %11), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32* null, i32** %data, align 8, !dbg !133
  %0 = load i32, i32* @staticTrue, align 4, !dbg !134
  %tobool = icmp ne i32 %0, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !137
  %2 = bitcast i8* %1 to i32*, !dbg !139
  store i32* %2, i32** %data, align 8, !dbg !140
  br label %if.end, !dbg !141

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !150
  %cmp = icmp ult i64 %4, 10, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !156
  %6 = load i32, i32* %arrayidx, align 4, !dbg !156
  %7 = load i32*, i32** %data, align 8, !dbg !157
  %8 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !157
  store i32 %6, i32* %arrayidx1, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %9, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !165
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !165
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !165
  call void @printIntLine(i32 %11), !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 24, type: !7, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05_bad", scope: !12, file: !12, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 30, type: !6)
!23 = !DILocation(line: 30, column: 11, scope: !19)
!24 = !DILocation(line: 31, column: 10, scope: !19)
!25 = !DILocation(line: 32, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 8)
!27 = !DILocation(line: 32, column: 8, scope: !19)
!28 = !DILocation(line: 35, column: 23, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !12, line: 33, column: 5)
!30 = !DILocation(line: 35, column: 16, scope: !29)
!31 = !DILocation(line: 35, column: 14, scope: !29)
!32 = !DILocation(line: 36, column: 5, scope: !29)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !19, file: !12, line: 37, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 38, column: 13, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 39, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 39, column: 16, scope: !34)
!44 = !DILocation(line: 41, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !12, line: 41, column: 9)
!46 = !DILocation(line: 41, column: 14, scope: !45)
!47 = !DILocation(line: 41, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 41, column: 9)
!49 = !DILocation(line: 41, column: 23, scope: !48)
!50 = !DILocation(line: 41, column: 9, scope: !45)
!51 = !DILocation(line: 43, column: 30, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 42, column: 9)
!53 = !DILocation(line: 43, column: 23, scope: !52)
!54 = !DILocation(line: 43, column: 13, scope: !52)
!55 = !DILocation(line: 43, column: 18, scope: !52)
!56 = !DILocation(line: 43, column: 21, scope: !52)
!57 = !DILocation(line: 44, column: 9, scope: !52)
!58 = !DILocation(line: 41, column: 30, scope: !48)
!59 = !DILocation(line: 41, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 44, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 45, column: 22, scope: !34)
!64 = !DILocation(line: 45, column: 9, scope: !34)
!65 = !DILocation(line: 47, column: 1, scope: !19)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_05_good", scope: !12, file: !12, line: 102, type: !20, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 104, column: 5, scope: !66)
!68 = !DILocation(line: 105, column: 5, scope: !66)
!69 = !DILocation(line: 106, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 118, type: !71, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 118, type: !7)
!77 = !DILocation(line: 118, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 118, type: !73)
!79 = !DILocation(line: 118, column: 27, scope: !70)
!80 = !DILocation(line: 121, column: 22, scope: !70)
!81 = !DILocation(line: 121, column: 12, scope: !70)
!82 = !DILocation(line: 121, column: 5, scope: !70)
!83 = !DILocation(line: 123, column: 5, scope: !70)
!84 = !DILocation(line: 124, column: 5, scope: !70)
!85 = !DILocation(line: 125, column: 5, scope: !70)
!86 = !DILocation(line: 128, column: 5, scope: !70)
!87 = !DILocation(line: 129, column: 5, scope: !70)
!88 = !DILocation(line: 130, column: 5, scope: !70)
!89 = !DILocation(line: 132, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 56, type: !6)
!92 = !DILocation(line: 56, column: 11, scope: !90)
!93 = !DILocation(line: 57, column: 10, scope: !90)
!94 = !DILocation(line: 58, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !12, line: 58, column: 8)
!96 = !DILocation(line: 58, column: 8, scope: !90)
!97 = !DILocation(line: 61, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 59, column: 5)
!99 = !DILocation(line: 62, column: 5, scope: !98)
!100 = !DILocation(line: 66, column: 23, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !12, line: 64, column: 5)
!102 = !DILocation(line: 66, column: 16, scope: !101)
!103 = !DILocation(line: 66, column: 14, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 69, type: !35)
!105 = distinct !DILexicalBlock(scope: !90, file: !12, line: 68, column: 5)
!106 = !DILocation(line: 69, column: 13, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !12, line: 70, type: !40)
!108 = !DILocation(line: 70, column: 16, scope: !105)
!109 = !DILocation(line: 72, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !12, line: 72, column: 9)
!111 = !DILocation(line: 72, column: 14, scope: !110)
!112 = !DILocation(line: 72, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 72, column: 9)
!114 = !DILocation(line: 72, column: 23, scope: !113)
!115 = !DILocation(line: 72, column: 9, scope: !110)
!116 = !DILocation(line: 74, column: 30, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 73, column: 9)
!118 = !DILocation(line: 74, column: 23, scope: !117)
!119 = !DILocation(line: 74, column: 13, scope: !117)
!120 = !DILocation(line: 74, column: 18, scope: !117)
!121 = !DILocation(line: 74, column: 21, scope: !117)
!122 = !DILocation(line: 75, column: 9, scope: !117)
!123 = !DILocation(line: 72, column: 30, scope: !113)
!124 = !DILocation(line: 72, column: 9, scope: !113)
!125 = distinct !{!125, !115, !126, !62}
!126 = !DILocation(line: 75, column: 9, scope: !110)
!127 = !DILocation(line: 76, column: 22, scope: !105)
!128 = !DILocation(line: 76, column: 9, scope: !105)
!129 = !DILocation(line: 78, column: 1, scope: !90)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!131 = !DILocalVariable(name: "data", scope: !130, file: !12, line: 83, type: !6)
!132 = !DILocation(line: 83, column: 11, scope: !130)
!133 = !DILocation(line: 84, column: 10, scope: !130)
!134 = !DILocation(line: 85, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !12, line: 85, column: 8)
!136 = !DILocation(line: 85, column: 8, scope: !130)
!137 = !DILocation(line: 88, column: 23, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 86, column: 5)
!139 = !DILocation(line: 88, column: 16, scope: !138)
!140 = !DILocation(line: 88, column: 14, scope: !138)
!141 = !DILocation(line: 89, column: 5, scope: !138)
!142 = !DILocalVariable(name: "source", scope: !143, file: !12, line: 91, type: !35)
!143 = distinct !DILexicalBlock(scope: !130, file: !12, line: 90, column: 5)
!144 = !DILocation(line: 91, column: 13, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !143, file: !12, line: 92, type: !40)
!146 = !DILocation(line: 92, column: 16, scope: !143)
!147 = !DILocation(line: 94, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !12, line: 94, column: 9)
!149 = !DILocation(line: 94, column: 14, scope: !148)
!150 = !DILocation(line: 94, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 94, column: 9)
!152 = !DILocation(line: 94, column: 23, scope: !151)
!153 = !DILocation(line: 94, column: 9, scope: !148)
!154 = !DILocation(line: 96, column: 30, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !12, line: 95, column: 9)
!156 = !DILocation(line: 96, column: 23, scope: !155)
!157 = !DILocation(line: 96, column: 13, scope: !155)
!158 = !DILocation(line: 96, column: 18, scope: !155)
!159 = !DILocation(line: 96, column: 21, scope: !155)
!160 = !DILocation(line: 97, column: 9, scope: !155)
!161 = !DILocation(line: 94, column: 30, scope: !151)
!162 = !DILocation(line: 94, column: 9, scope: !151)
!163 = distinct !{!163, !153, !164, !62}
!164 = !DILocation(line: 97, column: 9, scope: !148)
!165 = !DILocation(line: 98, column: 22, scope: !143)
!166 = !DILocation(line: 98, column: 9, scope: !143)
!167 = !DILocation(line: 100, column: 1, scope: !130)
