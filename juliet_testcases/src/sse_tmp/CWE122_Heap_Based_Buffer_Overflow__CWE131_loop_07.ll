; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32* null, i32** %data, align 8, !dbg !23
  %0 = load i32, i32* @staticFive, align 4, !dbg !24
  %cmp = icmp eq i32 %0, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end3, !dbg !27

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !28
  %1 = bitcast i8* %call to i32*, !dbg !30
  store i32* %1, i32** %data, align 8, !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %cmp1 = icmp eq i32* %2, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !53
  %cmp4 = icmp ult i64 %4, 10, !dbg !55
  br i1 %cmp4, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !59
  %6 = load i32, i32* %arrayidx, align 4, !dbg !59
  %7 = load i32*, i32** %data, align 8, !dbg !60
  %8 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !60
  store i32 %6, i32* %arrayidx5, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %9, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !69
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !69
  call void @printIntLine(i32 %11), !dbg !70
  %12 = load i32*, i32** %data, align 8, !dbg !71
  %13 = bitcast i32* %12 to i8*, !dbg !71
  call void @free(i8* %13) #6, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  %0 = load i32, i32* @staticFive, align 4, !dbg !102
  %cmp = icmp ne i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end3, !dbg !108

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !109
  %1 = bitcast i8* %call to i32*, !dbg !111
  store i32* %1, i32** %data, align 8, !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %cmp1 = icmp eq i32* %2, null, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !116

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !127
  %cmp4 = icmp ult i64 %4, 10, !dbg !129
  br i1 %cmp4, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !133
  %6 = load i32, i32* %arrayidx, align 4, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  %8 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !134
  store i32 %6, i32* %arrayidx5, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %9, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !142
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !142
  call void @printIntLine(i32 %11), !dbg !143
  %12 = load i32*, i32** %data, align 8, !dbg !144
  %13 = bitcast i32* %12 to i8*, !dbg !144
  call void @free(i8* %13) #6, !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i32* null, i32** %data, align 8, !dbg !150
  %0 = load i32, i32* @staticFive, align 4, !dbg !151
  %cmp = icmp eq i32 %0, 5, !dbg !153
  br i1 %cmp, label %if.then, label %if.end3, !dbg !154

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !155
  %1 = bitcast i8* %call to i32*, !dbg !157
  store i32* %1, i32** %data, align 8, !dbg !158
  %2 = load i32*, i32** %data, align 8, !dbg !159
  %cmp1 = icmp eq i32* %2, null, !dbg !161
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !162

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !165

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !166, metadata !DIExpression()), !dbg !168
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !168
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !174
  %cmp4 = icmp ult i64 %4, 10, !dbg !176
  br i1 %cmp4, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !180
  %6 = load i32, i32* %arrayidx, align 4, !dbg !180
  %7 = load i32*, i32** %data, align 8, !dbg !181
  %8 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !181
  store i32 %6, i32* %arrayidx5, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %9, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !189
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !189
  call void @printIntLine(i32 %11), !dbg !190
  %12 = load i32*, i32** %data, align 8, !dbg !191
  %13 = bitcast i32* %12 to i8*, !dbg !191
  call void @free(i8* %13) #6, !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07_bad", scope: !11, file: !11, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !11, line: 29, type: !6)
!22 = !DILocation(line: 29, column: 11, scope: !18)
!23 = !DILocation(line: 30, column: 10, scope: !18)
!24 = !DILocation(line: 31, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !11, line: 31, column: 8)
!26 = !DILocation(line: 31, column: 18, scope: !25)
!27 = !DILocation(line: 31, column: 8, scope: !18)
!28 = !DILocation(line: 34, column: 23, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !11, line: 32, column: 5)
!30 = !DILocation(line: 34, column: 16, scope: !29)
!31 = !DILocation(line: 34, column: 14, scope: !29)
!32 = !DILocation(line: 35, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !11, line: 35, column: 13)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 13, scope: !29)
!36 = !DILocation(line: 35, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 35, column: 27)
!38 = !DILocation(line: 36, column: 5, scope: !29)
!39 = !DILocalVariable(name: "source", scope: !40, file: !11, line: 38, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !11, line: 37, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 10)
!44 = !DILocation(line: 38, column: 13, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !11, line: 39, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 39, column: 16, scope: !40)
!50 = !DILocation(line: 41, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !40, file: !11, line: 41, column: 9)
!52 = !DILocation(line: 41, column: 14, scope: !51)
!53 = !DILocation(line: 41, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !11, line: 41, column: 9)
!55 = !DILocation(line: 41, column: 23, scope: !54)
!56 = !DILocation(line: 41, column: 9, scope: !51)
!57 = !DILocation(line: 43, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !11, line: 42, column: 9)
!59 = !DILocation(line: 43, column: 23, scope: !58)
!60 = !DILocation(line: 43, column: 13, scope: !58)
!61 = !DILocation(line: 43, column: 18, scope: !58)
!62 = !DILocation(line: 43, column: 21, scope: !58)
!63 = !DILocation(line: 44, column: 9, scope: !58)
!64 = !DILocation(line: 41, column: 30, scope: !54)
!65 = !DILocation(line: 41, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 44, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 45, column: 22, scope: !40)
!70 = !DILocation(line: 45, column: 9, scope: !40)
!71 = !DILocation(line: 46, column: 14, scope: !40)
!72 = !DILocation(line: 46, column: 9, scope: !40)
!73 = !DILocation(line: 48, column: 1, scope: !18)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_07_good", scope: !11, file: !11, line: 107, type: !19, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 109, column: 5, scope: !74)
!76 = !DILocation(line: 110, column: 5, scope: !74)
!77 = !DILocation(line: 111, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 123, type: !79, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !11, line: 123, type: !7)
!85 = !DILocation(line: 123, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !11, line: 123, type: !81)
!87 = !DILocation(line: 123, column: 27, scope: !78)
!88 = !DILocation(line: 126, column: 22, scope: !78)
!89 = !DILocation(line: 126, column: 12, scope: !78)
!90 = !DILocation(line: 126, column: 5, scope: !78)
!91 = !DILocation(line: 128, column: 5, scope: !78)
!92 = !DILocation(line: 129, column: 5, scope: !78)
!93 = !DILocation(line: 130, column: 5, scope: !78)
!94 = !DILocation(line: 133, column: 5, scope: !78)
!95 = !DILocation(line: 134, column: 5, scope: !78)
!96 = !DILocation(line: 135, column: 5, scope: !78)
!97 = !DILocation(line: 137, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !11, line: 57, type: !6)
!100 = !DILocation(line: 57, column: 11, scope: !98)
!101 = !DILocation(line: 58, column: 10, scope: !98)
!102 = !DILocation(line: 59, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !11, line: 59, column: 8)
!104 = !DILocation(line: 59, column: 18, scope: !103)
!105 = !DILocation(line: 59, column: 8, scope: !98)
!106 = !DILocation(line: 62, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !11, line: 60, column: 5)
!108 = !DILocation(line: 63, column: 5, scope: !107)
!109 = !DILocation(line: 67, column: 23, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !11, line: 65, column: 5)
!111 = !DILocation(line: 67, column: 16, scope: !110)
!112 = !DILocation(line: 67, column: 14, scope: !110)
!113 = !DILocation(line: 68, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !11, line: 68, column: 13)
!115 = !DILocation(line: 68, column: 18, scope: !114)
!116 = !DILocation(line: 68, column: 13, scope: !110)
!117 = !DILocation(line: 68, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !11, line: 68, column: 27)
!119 = !DILocalVariable(name: "source", scope: !120, file: !11, line: 71, type: !41)
!120 = distinct !DILexicalBlock(scope: !98, file: !11, line: 70, column: 5)
!121 = !DILocation(line: 71, column: 13, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !120, file: !11, line: 72, type: !46)
!123 = !DILocation(line: 72, column: 16, scope: !120)
!124 = !DILocation(line: 74, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !11, line: 74, column: 9)
!126 = !DILocation(line: 74, column: 14, scope: !125)
!127 = !DILocation(line: 74, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !11, line: 74, column: 9)
!129 = !DILocation(line: 74, column: 23, scope: !128)
!130 = !DILocation(line: 74, column: 9, scope: !125)
!131 = !DILocation(line: 76, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !11, line: 75, column: 9)
!133 = !DILocation(line: 76, column: 23, scope: !132)
!134 = !DILocation(line: 76, column: 13, scope: !132)
!135 = !DILocation(line: 76, column: 18, scope: !132)
!136 = !DILocation(line: 76, column: 21, scope: !132)
!137 = !DILocation(line: 77, column: 9, scope: !132)
!138 = !DILocation(line: 74, column: 30, scope: !128)
!139 = !DILocation(line: 74, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !68}
!141 = !DILocation(line: 77, column: 9, scope: !125)
!142 = !DILocation(line: 78, column: 22, scope: !120)
!143 = !DILocation(line: 78, column: 9, scope: !120)
!144 = !DILocation(line: 79, column: 14, scope: !120)
!145 = !DILocation(line: 79, column: 9, scope: !120)
!146 = !DILocation(line: 81, column: 1, scope: !98)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 84, type: !19, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !11, line: 86, type: !6)
!149 = !DILocation(line: 86, column: 11, scope: !147)
!150 = !DILocation(line: 87, column: 10, scope: !147)
!151 = !DILocation(line: 88, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !11, line: 88, column: 8)
!153 = !DILocation(line: 88, column: 18, scope: !152)
!154 = !DILocation(line: 88, column: 8, scope: !147)
!155 = !DILocation(line: 91, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !11, line: 89, column: 5)
!157 = !DILocation(line: 91, column: 16, scope: !156)
!158 = !DILocation(line: 91, column: 14, scope: !156)
!159 = !DILocation(line: 92, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !11, line: 92, column: 13)
!161 = !DILocation(line: 92, column: 18, scope: !160)
!162 = !DILocation(line: 92, column: 13, scope: !156)
!163 = !DILocation(line: 92, column: 28, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !11, line: 92, column: 27)
!165 = !DILocation(line: 93, column: 5, scope: !156)
!166 = !DILocalVariable(name: "source", scope: !167, file: !11, line: 95, type: !41)
!167 = distinct !DILexicalBlock(scope: !147, file: !11, line: 94, column: 5)
!168 = !DILocation(line: 95, column: 13, scope: !167)
!169 = !DILocalVariable(name: "i", scope: !167, file: !11, line: 96, type: !46)
!170 = !DILocation(line: 96, column: 16, scope: !167)
!171 = !DILocation(line: 98, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !11, line: 98, column: 9)
!173 = !DILocation(line: 98, column: 14, scope: !172)
!174 = !DILocation(line: 98, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !11, line: 98, column: 9)
!176 = !DILocation(line: 98, column: 23, scope: !175)
!177 = !DILocation(line: 98, column: 9, scope: !172)
!178 = !DILocation(line: 100, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !11, line: 99, column: 9)
!180 = !DILocation(line: 100, column: 23, scope: !179)
!181 = !DILocation(line: 100, column: 13, scope: !179)
!182 = !DILocation(line: 100, column: 18, scope: !179)
!183 = !DILocation(line: 100, column: 21, scope: !179)
!184 = !DILocation(line: 101, column: 9, scope: !179)
!185 = !DILocation(line: 98, column: 30, scope: !175)
!186 = !DILocation(line: 98, column: 9, scope: !175)
!187 = distinct !{!187, !177, !188, !68}
!188 = !DILocation(line: 101, column: 9, scope: !172)
!189 = !DILocation(line: 102, column: 22, scope: !167)
!190 = !DILocation(line: 102, column: 9, scope: !167)
!191 = !DILocation(line: 103, column: 14, scope: !167)
!192 = !DILocation(line: 103, column: 9, scope: !167)
!193 = !DILocation(line: 105, column: 1, scope: !147)
