; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !24
  %0 = bitcast i8* %call1 to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !49
  %cmp4 = icmp ult i64 %3, 10, !dbg !51
  br i1 %cmp4, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !55
  %5 = load i32, i32* %arrayidx, align 4, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !56
  store i32 %5, i32* %arrayidx5, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %8, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !65
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !65
  call void @printIntLine(i32 %10), !dbg !66
  %11 = load i32*, i32** %data, align 8, !dbg !67
  %12 = bitcast i32* %11 to i8*, !dbg !67
  call void @free(i8* %12) #6, !dbg !68
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08_good() #0 !dbg !70 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !94 {
entry:
  ret i32 1, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  %call = call i32 @staticReturnsFalse(), !dbg !102
  %tobool = icmp ne i32 %call, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !105
  br label %if.end3, !dbg !107

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !108
  %0 = bitcast i8* %call1 to i32*, !dbg !110
  store i32* %0, i32** %data, align 8, !dbg !111
  %1 = load i32*, i32** %data, align 8, !dbg !112
  %cmp = icmp eq i32* %1, null, !dbg !114
  br i1 %cmp, label %if.then2, label %if.end, !dbg !115

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !126
  %cmp4 = icmp ult i64 %3, 10, !dbg !128
  br i1 %cmp4, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !132
  %5 = load i32, i32* %arrayidx, align 4, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !133
  store i32 %5, i32* %arrayidx5, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %8, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !141
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !141
  call void @printIntLine(i32 %10), !dbg !142
  %11 = load i32*, i32** %data, align 8, !dbg !143
  %12 = bitcast i32* %11 to i8*, !dbg !143
  call void @free(i8* %12) #6, !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !146 {
entry:
  ret i32 0, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32* null, i32** %data, align 8, !dbg !151
  %call = call i32 @staticReturnsTrue(), !dbg !152
  %tobool = icmp ne i32 %call, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.end3, !dbg !154

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !155
  %0 = bitcast i8* %call1 to i32*, !dbg !157
  store i32* %0, i32** %data, align 8, !dbg !158
  %1 = load i32*, i32** %data, align 8, !dbg !159
  %cmp = icmp eq i32* %1, null, !dbg !161
  br i1 %cmp, label %if.then2, label %if.end, !dbg !162

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !165

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !166, metadata !DIExpression()), !dbg !168
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !168
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !174
  %cmp4 = icmp ult i64 %3, 10, !dbg !176
  br i1 %cmp4, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !180
  %5 = load i32, i32* %arrayidx, align 4, !dbg !180
  %6 = load i32*, i32** %data, align 8, !dbg !181
  %7 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !181
  store i32 %5, i32* %arrayidx5, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %8, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !189
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !189
  call void @printIntLine(i32 %10), !dbg !190
  %11 = load i32*, i32** %data, align 8, !dbg !191
  %12 = bitcast i32* %11 to i8*, !dbg !191
  call void @free(i8* %12) #6, !dbg !192
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 11, scope: !14)
!20 = !DILocation(line: 38, column: 10, scope: !14)
!21 = !DILocation(line: 39, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 8)
!23 = !DILocation(line: 39, column: 8, scope: !14)
!24 = !DILocation(line: 42, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 40, column: 5)
!26 = !DILocation(line: 42, column: 16, scope: !25)
!27 = !DILocation(line: 42, column: 14, scope: !25)
!28 = !DILocation(line: 43, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 43, column: 13)
!30 = !DILocation(line: 43, column: 18, scope: !29)
!31 = !DILocation(line: 43, column: 13, scope: !25)
!32 = !DILocation(line: 43, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 43, column: 27)
!34 = !DILocation(line: 44, column: 5, scope: !25)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 46, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 46, column: 13, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !15, line: 47, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 47, column: 16, scope: !36)
!46 = !DILocation(line: 49, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !15, line: 49, column: 9)
!48 = !DILocation(line: 49, column: 14, scope: !47)
!49 = !DILocation(line: 49, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !15, line: 49, column: 9)
!51 = !DILocation(line: 49, column: 23, scope: !50)
!52 = !DILocation(line: 49, column: 9, scope: !47)
!53 = !DILocation(line: 51, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 50, column: 9)
!55 = !DILocation(line: 51, column: 23, scope: !54)
!56 = !DILocation(line: 51, column: 13, scope: !54)
!57 = !DILocation(line: 51, column: 18, scope: !54)
!58 = !DILocation(line: 51, column: 21, scope: !54)
!59 = !DILocation(line: 52, column: 9, scope: !54)
!60 = !DILocation(line: 49, column: 30, scope: !50)
!61 = !DILocation(line: 49, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 52, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 53, column: 22, scope: !36)
!66 = !DILocation(line: 53, column: 9, scope: !36)
!67 = !DILocation(line: 54, column: 14, scope: !36)
!68 = !DILocation(line: 54, column: 9, scope: !36)
!69 = !DILocation(line: 56, column: 1, scope: !14)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_08_good", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 117, column: 5, scope: !70)
!72 = !DILocation(line: 118, column: 5, scope: !70)
!73 = !DILocation(line: 119, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 131, type: !75, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!5, !5, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !15, line: 131, type: !5)
!81 = !DILocation(line: 131, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !15, line: 131, type: !77)
!83 = !DILocation(line: 131, column: 27, scope: !74)
!84 = !DILocation(line: 134, column: 22, scope: !74)
!85 = !DILocation(line: 134, column: 12, scope: !74)
!86 = !DILocation(line: 134, column: 5, scope: !74)
!87 = !DILocation(line: 136, column: 5, scope: !74)
!88 = !DILocation(line: 137, column: 5, scope: !74)
!89 = !DILocation(line: 138, column: 5, scope: !74)
!90 = !DILocation(line: 141, column: 5, scope: !74)
!91 = !DILocation(line: 142, column: 5, scope: !74)
!92 = !DILocation(line: 143, column: 5, scope: !74)
!93 = !DILocation(line: 145, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !95, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!5}
!97 = !DILocation(line: 25, column: 5, scope: !94)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 65, type: !4)
!100 = !DILocation(line: 65, column: 11, scope: !98)
!101 = !DILocation(line: 66, column: 10, scope: !98)
!102 = !DILocation(line: 67, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 67, column: 8)
!104 = !DILocation(line: 67, column: 8, scope: !98)
!105 = !DILocation(line: 70, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !15, line: 68, column: 5)
!107 = !DILocation(line: 71, column: 5, scope: !106)
!108 = !DILocation(line: 75, column: 23, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !15, line: 73, column: 5)
!110 = !DILocation(line: 75, column: 16, scope: !109)
!111 = !DILocation(line: 75, column: 14, scope: !109)
!112 = !DILocation(line: 76, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 76, column: 13)
!114 = !DILocation(line: 76, column: 18, scope: !113)
!115 = !DILocation(line: 76, column: 13, scope: !109)
!116 = !DILocation(line: 76, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 76, column: 27)
!118 = !DILocalVariable(name: "source", scope: !119, file: !15, line: 79, type: !37)
!119 = distinct !DILexicalBlock(scope: !98, file: !15, line: 78, column: 5)
!120 = !DILocation(line: 79, column: 13, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !119, file: !15, line: 80, type: !42)
!122 = !DILocation(line: 80, column: 16, scope: !119)
!123 = !DILocation(line: 82, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !15, line: 82, column: 9)
!125 = !DILocation(line: 82, column: 14, scope: !124)
!126 = !DILocation(line: 82, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 82, column: 9)
!128 = !DILocation(line: 82, column: 23, scope: !127)
!129 = !DILocation(line: 82, column: 9, scope: !124)
!130 = !DILocation(line: 84, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 83, column: 9)
!132 = !DILocation(line: 84, column: 23, scope: !131)
!133 = !DILocation(line: 84, column: 13, scope: !131)
!134 = !DILocation(line: 84, column: 18, scope: !131)
!135 = !DILocation(line: 84, column: 21, scope: !131)
!136 = !DILocation(line: 85, column: 9, scope: !131)
!137 = !DILocation(line: 82, column: 30, scope: !127)
!138 = !DILocation(line: 82, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !64}
!140 = !DILocation(line: 85, column: 9, scope: !124)
!141 = !DILocation(line: 86, column: 22, scope: !119)
!142 = !DILocation(line: 86, column: 9, scope: !119)
!143 = !DILocation(line: 87, column: 14, scope: !119)
!144 = !DILocation(line: 87, column: 9, scope: !119)
!145 = !DILocation(line: 89, column: 1, scope: !98)
!146 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !95, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocation(line: 30, column: 5, scope: !146)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !15, line: 94, type: !4)
!150 = !DILocation(line: 94, column: 11, scope: !148)
!151 = !DILocation(line: 95, column: 10, scope: !148)
!152 = !DILocation(line: 96, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !15, line: 96, column: 8)
!154 = !DILocation(line: 96, column: 8, scope: !148)
!155 = !DILocation(line: 99, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !15, line: 97, column: 5)
!157 = !DILocation(line: 99, column: 16, scope: !156)
!158 = !DILocation(line: 99, column: 14, scope: !156)
!159 = !DILocation(line: 100, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 100, column: 13)
!161 = !DILocation(line: 100, column: 18, scope: !160)
!162 = !DILocation(line: 100, column: 13, scope: !156)
!163 = !DILocation(line: 100, column: 28, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 100, column: 27)
!165 = !DILocation(line: 101, column: 5, scope: !156)
!166 = !DILocalVariable(name: "source", scope: !167, file: !15, line: 103, type: !37)
!167 = distinct !DILexicalBlock(scope: !148, file: !15, line: 102, column: 5)
!168 = !DILocation(line: 103, column: 13, scope: !167)
!169 = !DILocalVariable(name: "i", scope: !167, file: !15, line: 104, type: !42)
!170 = !DILocation(line: 104, column: 16, scope: !167)
!171 = !DILocation(line: 106, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !15, line: 106, column: 9)
!173 = !DILocation(line: 106, column: 14, scope: !172)
!174 = !DILocation(line: 106, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !15, line: 106, column: 9)
!176 = !DILocation(line: 106, column: 23, scope: !175)
!177 = !DILocation(line: 106, column: 9, scope: !172)
!178 = !DILocation(line: 108, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 107, column: 9)
!180 = !DILocation(line: 108, column: 23, scope: !179)
!181 = !DILocation(line: 108, column: 13, scope: !179)
!182 = !DILocation(line: 108, column: 18, scope: !179)
!183 = !DILocation(line: 108, column: 21, scope: !179)
!184 = !DILocation(line: 109, column: 9, scope: !179)
!185 = !DILocation(line: 106, column: 30, scope: !175)
!186 = !DILocation(line: 106, column: 9, scope: !175)
!187 = distinct !{!187, !177, !188, !64}
!188 = !DILocation(line: 109, column: 9, scope: !172)
!189 = !DILocation(line: 110, column: 22, scope: !167)
!190 = !DILocation(line: 110, column: 9, scope: !167)
!191 = !DILocation(line: 111, column: 14, scope: !167)
!192 = !DILocation(line: 111, column: 9, scope: !167)
!193 = !DILocation(line: 113, column: 1, scope: !148)
