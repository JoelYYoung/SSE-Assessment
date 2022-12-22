; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @staticFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 10, align 16, !dbg !27
  %2 = bitcast i8* %1 to i32*, !dbg !29
  store i32* %2, i32** %data, align 8, !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !46
  %cmp1 = icmp ult i64 %4, 10, !dbg !48
  br i1 %cmp1, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !52
  %6 = load i32, i32* %arrayidx, align 4, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %8 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !53
  store i32 %6, i32* %arrayidx2, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %9, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !62
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !62
  call void @printIntLine(i32 %11), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  %0 = load i32, i32* @staticFive, align 4, !dbg !93
  %cmp = icmp ne i32 %0, 5, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

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
  %cmp1 = icmp ult i64 %4, 10, !dbg !114
  br i1 %cmp1, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !118
  %6 = load i32, i32* %arrayidx, align 4, !dbg !118
  %7 = load i32*, i32** %data, align 8, !dbg !119
  %8 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !119
  store i32 %6, i32* %arrayidx2, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %9, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !127
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !127
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !134
  %cmp = icmp eq i32 %0, 5, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !138
  %2 = bitcast i8* %1 to i32*, !dbg !140
  store i32* %2, i32** %data, align 8, !dbg !141
  br label %if.end, !dbg !142

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !151
  %cmp1 = icmp ult i64 %4, 10, !dbg !153
  br i1 %cmp1, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !157
  %6 = load i32, i32* %arrayidx, align 4, !dbg !157
  %7 = load i32*, i32** %data, align 8, !dbg !158
  %8 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !158
  store i32 %6, i32* %arrayidx2, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %9, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !166
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !166
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !166
  call void @printIntLine(i32 %11), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07.c", directory: "/root/SSE-Assessment")
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07_bad", scope: !10, file: !10, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !17, file: !10, line: 29, type: !6)
!21 = !DILocation(line: 29, column: 11, scope: !17)
!22 = !DILocation(line: 30, column: 10, scope: !17)
!23 = !DILocation(line: 31, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !10, line: 31, column: 8)
!25 = !DILocation(line: 31, column: 18, scope: !24)
!26 = !DILocation(line: 31, column: 8, scope: !17)
!27 = !DILocation(line: 34, column: 23, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 32, column: 5)
!29 = !DILocation(line: 34, column: 16, scope: !28)
!30 = !DILocation(line: 34, column: 14, scope: !28)
!31 = !DILocation(line: 35, column: 5, scope: !28)
!32 = !DILocalVariable(name: "source", scope: !33, file: !10, line: 37, type: !34)
!33 = distinct !DILexicalBlock(scope: !17, file: !10, line: 36, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 37, column: 13, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 38, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 38, column: 16, scope: !33)
!43 = !DILocation(line: 40, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !10, line: 40, column: 9)
!45 = !DILocation(line: 40, column: 14, scope: !44)
!46 = !DILocation(line: 40, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !10, line: 40, column: 9)
!48 = !DILocation(line: 40, column: 23, scope: !47)
!49 = !DILocation(line: 40, column: 9, scope: !44)
!50 = !DILocation(line: 42, column: 30, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !10, line: 41, column: 9)
!52 = !DILocation(line: 42, column: 23, scope: !51)
!53 = !DILocation(line: 42, column: 13, scope: !51)
!54 = !DILocation(line: 42, column: 18, scope: !51)
!55 = !DILocation(line: 42, column: 21, scope: !51)
!56 = !DILocation(line: 43, column: 9, scope: !51)
!57 = !DILocation(line: 40, column: 30, scope: !47)
!58 = !DILocation(line: 40, column: 9, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 43, column: 9, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 44, column: 22, scope: !33)
!63 = !DILocation(line: 44, column: 9, scope: !33)
!64 = !DILocation(line: 46, column: 1, scope: !17)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_07_good", scope: !10, file: !10, line: 101, type: !18, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 103, column: 5, scope: !65)
!67 = !DILocation(line: 104, column: 5, scope: !65)
!68 = !DILocation(line: 105, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 117, type: !70, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !10, line: 117, type: !7)
!76 = !DILocation(line: 117, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !10, line: 117, type: !72)
!78 = !DILocation(line: 117, column: 27, scope: !69)
!79 = !DILocation(line: 120, column: 22, scope: !69)
!80 = !DILocation(line: 120, column: 12, scope: !69)
!81 = !DILocation(line: 120, column: 5, scope: !69)
!82 = !DILocation(line: 122, column: 5, scope: !69)
!83 = !DILocation(line: 123, column: 5, scope: !69)
!84 = !DILocation(line: 124, column: 5, scope: !69)
!85 = !DILocation(line: 127, column: 5, scope: !69)
!86 = !DILocation(line: 128, column: 5, scope: !69)
!87 = !DILocation(line: 129, column: 5, scope: !69)
!88 = !DILocation(line: 131, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocalVariable(name: "data", scope: !89, file: !10, line: 55, type: !6)
!91 = !DILocation(line: 55, column: 11, scope: !89)
!92 = !DILocation(line: 56, column: 10, scope: !89)
!93 = !DILocation(line: 57, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !10, line: 57, column: 8)
!95 = !DILocation(line: 57, column: 18, scope: !94)
!96 = !DILocation(line: 57, column: 8, scope: !89)
!97 = !DILocation(line: 60, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !10, line: 58, column: 5)
!99 = !DILocation(line: 61, column: 5, scope: !98)
!100 = !DILocation(line: 65, column: 23, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !10, line: 63, column: 5)
!102 = !DILocation(line: 65, column: 16, scope: !101)
!103 = !DILocation(line: 65, column: 14, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !10, line: 68, type: !34)
!105 = distinct !DILexicalBlock(scope: !89, file: !10, line: 67, column: 5)
!106 = !DILocation(line: 68, column: 13, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !10, line: 69, type: !39)
!108 = !DILocation(line: 69, column: 16, scope: !105)
!109 = !DILocation(line: 71, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !10, line: 71, column: 9)
!111 = !DILocation(line: 71, column: 14, scope: !110)
!112 = !DILocation(line: 71, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !10, line: 71, column: 9)
!114 = !DILocation(line: 71, column: 23, scope: !113)
!115 = !DILocation(line: 71, column: 9, scope: !110)
!116 = !DILocation(line: 73, column: 30, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !10, line: 72, column: 9)
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
!129 = !DILocation(line: 77, column: 1, scope: !89)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!131 = !DILocalVariable(name: "data", scope: !130, file: !10, line: 82, type: !6)
!132 = !DILocation(line: 82, column: 11, scope: !130)
!133 = !DILocation(line: 83, column: 10, scope: !130)
!134 = !DILocation(line: 84, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !10, line: 84, column: 8)
!136 = !DILocation(line: 84, column: 18, scope: !135)
!137 = !DILocation(line: 84, column: 8, scope: !130)
!138 = !DILocation(line: 87, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !10, line: 85, column: 5)
!140 = !DILocation(line: 87, column: 16, scope: !139)
!141 = !DILocation(line: 87, column: 14, scope: !139)
!142 = !DILocation(line: 88, column: 5, scope: !139)
!143 = !DILocalVariable(name: "source", scope: !144, file: !10, line: 90, type: !34)
!144 = distinct !DILexicalBlock(scope: !130, file: !10, line: 89, column: 5)
!145 = !DILocation(line: 90, column: 13, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !144, file: !10, line: 91, type: !39)
!147 = !DILocation(line: 91, column: 16, scope: !144)
!148 = !DILocation(line: 93, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !10, line: 93, column: 9)
!150 = !DILocation(line: 93, column: 14, scope: !149)
!151 = !DILocation(line: 93, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !10, line: 93, column: 9)
!153 = !DILocation(line: 93, column: 23, scope: !152)
!154 = !DILocation(line: 93, column: 9, scope: !149)
!155 = !DILocation(line: 95, column: 30, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !10, line: 94, column: 9)
!157 = !DILocation(line: 95, column: 23, scope: !156)
!158 = !DILocation(line: 95, column: 13, scope: !156)
!159 = !DILocation(line: 95, column: 18, scope: !156)
!160 = !DILocation(line: 95, column: 21, scope: !156)
!161 = !DILocation(line: 96, column: 9, scope: !156)
!162 = !DILocation(line: 93, column: 30, scope: !152)
!163 = !DILocation(line: 93, column: 9, scope: !152)
!164 = distinct !{!164, !154, !165, !61}
!165 = !DILocation(line: 96, column: 9, scope: !149)
!166 = !DILocation(line: 97, column: 22, scope: !144)
!167 = !DILocation(line: 97, column: 9, scope: !144)
!168 = !DILocation(line: 99, column: 1, scope: !130)
