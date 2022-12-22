; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !24
  %1 = bitcast i8* %call to i32*, !dbg !26
  store i32* %1, i32** %data, align 8, !dbg !27
  %2 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %2, null, !dbg !30
  br i1 %cmp, label %if.then1, label %if.end, !dbg !31

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !34

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !49
  %cmp3 = icmp ult i64 %4, 10, !dbg !51
  br i1 %cmp3, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !55
  %6 = load i32, i32* %arrayidx, align 4, !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  %8 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !56
  store i32 %6, i32* %arrayidx4, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %9, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !65
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !65
  call void @printIntLine(i32 %11), !dbg !66
  %12 = load i32*, i32** %data, align 8, !dbg !67
  %13 = bitcast i32* %12 to i8*, !dbg !67
  call void @free(i8* %13) #6, !dbg !68
  ret void, !dbg !69
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #6, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #6, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %0 = load i32, i32* @globalFalse, align 4, !dbg !98
  %tobool = icmp ne i32 %0, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end2, !dbg !103

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !104
  %1 = bitcast i8* %call to i32*, !dbg !106
  store i32* %1, i32** %data, align 8, !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %cmp = icmp eq i32* %2, null, !dbg !110
  br i1 %cmp, label %if.then1, label %if.end, !dbg !111

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !122
  %cmp3 = icmp ult i64 %4, 10, !dbg !124
  br i1 %cmp3, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !128
  %6 = load i32, i32* %arrayidx, align 4, !dbg !128
  %7 = load i32*, i32** %data, align 8, !dbg !129
  %8 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !129
  store i32 %6, i32* %arrayidx4, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %9, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !137
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !137
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !137
  call void @printIntLine(i32 %11), !dbg !138
  %12 = load i32*, i32** %data, align 8, !dbg !139
  %13 = bitcast i32* %12 to i8*, !dbg !139
  call void @free(i8* %13) #6, !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i32* null, i32** %data, align 8, !dbg !145
  %0 = load i32, i32* @globalTrue, align 4, !dbg !146
  %tobool = icmp ne i32 %0, 0, !dbg !146
  br i1 %tobool, label %if.then, label %if.end2, !dbg !148

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !149
  %1 = bitcast i8* %call to i32*, !dbg !151
  store i32* %1, i32** %data, align 8, !dbg !152
  %2 = load i32*, i32** %data, align 8, !dbg !153
  %cmp = icmp eq i32* %2, null, !dbg !155
  br i1 %cmp, label %if.then1, label %if.end, !dbg !156

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !159

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !160, metadata !DIExpression()), !dbg !162
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %i, metadata !163, metadata !DIExpression()), !dbg !164
  store i64 0, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !168
  %cmp3 = icmp ult i64 %4, 10, !dbg !170
  br i1 %cmp3, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !174
  %6 = load i32, i32* %arrayidx, align 4, !dbg !174
  %7 = load i32*, i32** %data, align 8, !dbg !175
  %8 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !175
  store i32 %6, i32* %arrayidx4, align 4, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %9, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !183
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !183
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !183
  call void @printIntLine(i32 %11), !dbg !184
  %12 = load i32*, i32** %data, align 8, !dbg !185
  %13 = bitcast i32* %12 to i8*, !dbg !185
  call void @free(i8* %13) #6, !dbg !186
  ret void, !dbg !187
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!23 = !DILocation(line: 25, column: 8, scope: !14)
!24 = !DILocation(line: 28, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 26, column: 5)
!26 = !DILocation(line: 28, column: 16, scope: !25)
!27 = !DILocation(line: 28, column: 14, scope: !25)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 18, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !25)
!32 = !DILocation(line: 29, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 27)
!34 = !DILocation(line: 30, column: 5, scope: !25)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 32, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 32, column: 13, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !15, line: 33, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 33, column: 16, scope: !36)
!46 = !DILocation(line: 35, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !15, line: 35, column: 9)
!48 = !DILocation(line: 35, column: 14, scope: !47)
!49 = !DILocation(line: 35, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !15, line: 35, column: 9)
!51 = !DILocation(line: 35, column: 23, scope: !50)
!52 = !DILocation(line: 35, column: 9, scope: !47)
!53 = !DILocation(line: 37, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 36, column: 9)
!55 = !DILocation(line: 37, column: 23, scope: !54)
!56 = !DILocation(line: 37, column: 13, scope: !54)
!57 = !DILocation(line: 37, column: 18, scope: !54)
!58 = !DILocation(line: 37, column: 21, scope: !54)
!59 = !DILocation(line: 38, column: 9, scope: !54)
!60 = !DILocation(line: 35, column: 30, scope: !50)
!61 = !DILocation(line: 35, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 38, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 39, column: 22, scope: !36)
!66 = !DILocation(line: 39, column: 9, scope: !36)
!67 = !DILocation(line: 40, column: 14, scope: !36)
!68 = !DILocation(line: 40, column: 9, scope: !36)
!69 = !DILocation(line: 42, column: 1, scope: !14)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_10_good", scope: !15, file: !15, line: 101, type: !16, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 103, column: 5, scope: !70)
!72 = !DILocation(line: 104, column: 5, scope: !70)
!73 = !DILocation(line: 105, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 117, type: !75, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!5, !5, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !15, line: 117, type: !5)
!81 = !DILocation(line: 117, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !15, line: 117, type: !77)
!83 = !DILocation(line: 117, column: 27, scope: !74)
!84 = !DILocation(line: 120, column: 22, scope: !74)
!85 = !DILocation(line: 120, column: 12, scope: !74)
!86 = !DILocation(line: 120, column: 5, scope: !74)
!87 = !DILocation(line: 122, column: 5, scope: !74)
!88 = !DILocation(line: 123, column: 5, scope: !74)
!89 = !DILocation(line: 124, column: 5, scope: !74)
!90 = !DILocation(line: 127, column: 5, scope: !74)
!91 = !DILocation(line: 128, column: 5, scope: !74)
!92 = !DILocation(line: 129, column: 5, scope: !74)
!93 = !DILocation(line: 131, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 51, type: !4)
!96 = !DILocation(line: 51, column: 11, scope: !94)
!97 = !DILocation(line: 52, column: 10, scope: !94)
!98 = !DILocation(line: 53, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !15, line: 53, column: 8)
!100 = !DILocation(line: 53, column: 8, scope: !94)
!101 = !DILocation(line: 56, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !15, line: 54, column: 5)
!103 = !DILocation(line: 57, column: 5, scope: !102)
!104 = !DILocation(line: 61, column: 23, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !15, line: 59, column: 5)
!106 = !DILocation(line: 61, column: 16, scope: !105)
!107 = !DILocation(line: 61, column: 14, scope: !105)
!108 = !DILocation(line: 62, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 62, column: 13)
!110 = !DILocation(line: 62, column: 18, scope: !109)
!111 = !DILocation(line: 62, column: 13, scope: !105)
!112 = !DILocation(line: 62, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 62, column: 27)
!114 = !DILocalVariable(name: "source", scope: !115, file: !15, line: 65, type: !37)
!115 = distinct !DILexicalBlock(scope: !94, file: !15, line: 64, column: 5)
!116 = !DILocation(line: 65, column: 13, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !115, file: !15, line: 66, type: !42)
!118 = !DILocation(line: 66, column: 16, scope: !115)
!119 = !DILocation(line: 68, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !15, line: 68, column: 9)
!121 = !DILocation(line: 68, column: 14, scope: !120)
!122 = !DILocation(line: 68, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !15, line: 68, column: 9)
!124 = !DILocation(line: 68, column: 23, scope: !123)
!125 = !DILocation(line: 68, column: 9, scope: !120)
!126 = !DILocation(line: 70, column: 30, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 69, column: 9)
!128 = !DILocation(line: 70, column: 23, scope: !127)
!129 = !DILocation(line: 70, column: 13, scope: !127)
!130 = !DILocation(line: 70, column: 18, scope: !127)
!131 = !DILocation(line: 70, column: 21, scope: !127)
!132 = !DILocation(line: 71, column: 9, scope: !127)
!133 = !DILocation(line: 68, column: 30, scope: !123)
!134 = !DILocation(line: 68, column: 9, scope: !123)
!135 = distinct !{!135, !125, !136, !64}
!136 = !DILocation(line: 71, column: 9, scope: !120)
!137 = !DILocation(line: 72, column: 22, scope: !115)
!138 = !DILocation(line: 72, column: 9, scope: !115)
!139 = !DILocation(line: 73, column: 14, scope: !115)
!140 = !DILocation(line: 73, column: 9, scope: !115)
!141 = !DILocation(line: 75, column: 1, scope: !94)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !15, line: 80, type: !4)
!144 = !DILocation(line: 80, column: 11, scope: !142)
!145 = !DILocation(line: 81, column: 10, scope: !142)
!146 = !DILocation(line: 82, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !15, line: 82, column: 8)
!148 = !DILocation(line: 82, column: 8, scope: !142)
!149 = !DILocation(line: 85, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !15, line: 83, column: 5)
!151 = !DILocation(line: 85, column: 16, scope: !150)
!152 = !DILocation(line: 85, column: 14, scope: !150)
!153 = !DILocation(line: 86, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 86, column: 13)
!155 = !DILocation(line: 86, column: 18, scope: !154)
!156 = !DILocation(line: 86, column: 13, scope: !150)
!157 = !DILocation(line: 86, column: 28, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 86, column: 27)
!159 = !DILocation(line: 87, column: 5, scope: !150)
!160 = !DILocalVariable(name: "source", scope: !161, file: !15, line: 89, type: !37)
!161 = distinct !DILexicalBlock(scope: !142, file: !15, line: 88, column: 5)
!162 = !DILocation(line: 89, column: 13, scope: !161)
!163 = !DILocalVariable(name: "i", scope: !161, file: !15, line: 90, type: !42)
!164 = !DILocation(line: 90, column: 16, scope: !161)
!165 = !DILocation(line: 92, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !15, line: 92, column: 9)
!167 = !DILocation(line: 92, column: 14, scope: !166)
!168 = !DILocation(line: 92, column: 21, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 92, column: 9)
!170 = !DILocation(line: 92, column: 23, scope: !169)
!171 = !DILocation(line: 92, column: 9, scope: !166)
!172 = !DILocation(line: 94, column: 30, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 93, column: 9)
!174 = !DILocation(line: 94, column: 23, scope: !173)
!175 = !DILocation(line: 94, column: 13, scope: !173)
!176 = !DILocation(line: 94, column: 18, scope: !173)
!177 = !DILocation(line: 94, column: 21, scope: !173)
!178 = !DILocation(line: 95, column: 9, scope: !173)
!179 = !DILocation(line: 92, column: 30, scope: !169)
!180 = !DILocation(line: 92, column: 9, scope: !169)
!181 = distinct !{!181, !171, !182, !64}
!182 = !DILocation(line: 95, column: 9, scope: !166)
!183 = !DILocation(line: 96, column: 22, scope: !161)
!184 = !DILocation(line: 96, column: 9, scope: !161)
!185 = !DILocation(line: 97, column: 14, scope: !161)
!186 = !DILocation(line: 97, column: 9, scope: !161)
!187 = !DILocation(line: 99, column: 1, scope: !142)
