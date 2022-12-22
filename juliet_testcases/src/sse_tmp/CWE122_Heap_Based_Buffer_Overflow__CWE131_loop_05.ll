; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end2, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !29
  %1 = bitcast i8* %call to i32*, !dbg !31
  store i32* %1, i32** %data, align 8, !dbg !32
  %2 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %2, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !39

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !54
  %cmp3 = icmp ult i64 %4, 10, !dbg !56
  br i1 %cmp3, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !60
  %6 = load i32, i32* %arrayidx, align 4, !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !61
  store i32 %6, i32* %arrayidx4, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %9, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !70
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !70
  call void @printIntLine(i32 %11), !dbg !71
  %12 = load i32*, i32** %data, align 8, !dbg !72
  %13 = bitcast i32* %12 to i8*, !dbg !72
  call void @free(i8* %13) #6, !dbg !73
  ret void, !dbg !74
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  %0 = load i32, i32* @staticFalse, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end2, !dbg !108

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !109
  %1 = bitcast i8* %call to i32*, !dbg !111
  store i32* %1, i32** %data, align 8, !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %2, null, !dbg !115
  br i1 %cmp, label %if.then1, label %if.end, !dbg !116

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !127
  %cmp3 = icmp ult i64 %4, 10, !dbg !129
  br i1 %cmp3, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !133
  %6 = load i32, i32* %arrayidx, align 4, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  %8 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !134
  store i32 %6, i32* %arrayidx4, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %9, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !142
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !142
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !151
  %tobool = icmp ne i32 %0, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.end2, !dbg !153

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !154
  %1 = bitcast i8* %call to i32*, !dbg !156
  store i32* %1, i32** %data, align 8, !dbg !157
  %2 = load i32*, i32** %data, align 8, !dbg !158
  %cmp = icmp eq i32* %2, null, !dbg !160
  br i1 %cmp, label %if.then1, label %if.end, !dbg !161

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !164

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !165, metadata !DIExpression()), !dbg !167
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !169
  store i64 0, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !173
  %cmp3 = icmp ult i64 %4, 10, !dbg !175
  br i1 %cmp3, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %5, !dbg !179
  %6 = load i32, i32* %arrayidx, align 4, !dbg !179
  %7 = load i32*, i32** %data, align 8, !dbg !180
  %8 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !180
  store i32 %6, i32* %arrayidx4, align 4, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %9, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !188
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !188
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !188
  call void @printIntLine(i32 %11), !dbg !189
  %12 = load i32*, i32** %data, align 8, !dbg !190
  %13 = bitcast i32* %12 to i8*, !dbg !190
  call void @free(i8* %13) #6, !dbg !191
  ret void, !dbg !192
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 24, type: !7, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05_bad", scope: !13, file: !13, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 30, type: !6)
!24 = !DILocation(line: 30, column: 11, scope: !20)
!25 = !DILocation(line: 31, column: 10, scope: !20)
!26 = !DILocation(line: 32, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 32, column: 8)
!28 = !DILocation(line: 32, column: 8, scope: !20)
!29 = !DILocation(line: 35, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !13, line: 33, column: 5)
!31 = !DILocation(line: 35, column: 16, scope: !30)
!32 = !DILocation(line: 35, column: 14, scope: !30)
!33 = !DILocation(line: 36, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !13, line: 36, column: 13)
!35 = !DILocation(line: 36, column: 18, scope: !34)
!36 = !DILocation(line: 36, column: 13, scope: !30)
!37 = !DILocation(line: 36, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 36, column: 27)
!39 = !DILocation(line: 37, column: 5, scope: !30)
!40 = !DILocalVariable(name: "source", scope: !41, file: !13, line: 39, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !13, line: 38, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 10)
!45 = !DILocation(line: 39, column: 13, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !13, line: 40, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 40, column: 16, scope: !41)
!51 = !DILocation(line: 42, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !13, line: 42, column: 9)
!53 = !DILocation(line: 42, column: 14, scope: !52)
!54 = !DILocation(line: 42, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !13, line: 42, column: 9)
!56 = !DILocation(line: 42, column: 23, scope: !55)
!57 = !DILocation(line: 42, column: 9, scope: !52)
!58 = !DILocation(line: 44, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !13, line: 43, column: 9)
!60 = !DILocation(line: 44, column: 23, scope: !59)
!61 = !DILocation(line: 44, column: 13, scope: !59)
!62 = !DILocation(line: 44, column: 18, scope: !59)
!63 = !DILocation(line: 44, column: 21, scope: !59)
!64 = !DILocation(line: 45, column: 9, scope: !59)
!65 = !DILocation(line: 42, column: 30, scope: !55)
!66 = !DILocation(line: 42, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 45, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 46, column: 22, scope: !41)
!71 = !DILocation(line: 46, column: 9, scope: !41)
!72 = !DILocation(line: 47, column: 14, scope: !41)
!73 = !DILocation(line: 47, column: 9, scope: !41)
!74 = !DILocation(line: 49, column: 1, scope: !20)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_05_good", scope: !13, file: !13, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocation(line: 110, column: 5, scope: !75)
!77 = !DILocation(line: 111, column: 5, scope: !75)
!78 = !DILocation(line: 112, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 124, type: !80, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !13, line: 124, type: !7)
!86 = !DILocation(line: 124, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !13, line: 124, type: !82)
!88 = !DILocation(line: 124, column: 27, scope: !79)
!89 = !DILocation(line: 127, column: 22, scope: !79)
!90 = !DILocation(line: 127, column: 12, scope: !79)
!91 = !DILocation(line: 127, column: 5, scope: !79)
!92 = !DILocation(line: 129, column: 5, scope: !79)
!93 = !DILocation(line: 130, column: 5, scope: !79)
!94 = !DILocation(line: 131, column: 5, scope: !79)
!95 = !DILocation(line: 134, column: 5, scope: !79)
!96 = !DILocation(line: 135, column: 5, scope: !79)
!97 = !DILocation(line: 136, column: 5, scope: !79)
!98 = !DILocation(line: 138, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !13, line: 58, type: !6)
!101 = !DILocation(line: 58, column: 11, scope: !99)
!102 = !DILocation(line: 59, column: 10, scope: !99)
!103 = !DILocation(line: 60, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !13, line: 60, column: 8)
!105 = !DILocation(line: 60, column: 8, scope: !99)
!106 = !DILocation(line: 63, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !13, line: 61, column: 5)
!108 = !DILocation(line: 64, column: 5, scope: !107)
!109 = !DILocation(line: 68, column: 23, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !13, line: 66, column: 5)
!111 = !DILocation(line: 68, column: 16, scope: !110)
!112 = !DILocation(line: 68, column: 14, scope: !110)
!113 = !DILocation(line: 69, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !13, line: 69, column: 13)
!115 = !DILocation(line: 69, column: 18, scope: !114)
!116 = !DILocation(line: 69, column: 13, scope: !110)
!117 = !DILocation(line: 69, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !13, line: 69, column: 27)
!119 = !DILocalVariable(name: "source", scope: !120, file: !13, line: 72, type: !42)
!120 = distinct !DILexicalBlock(scope: !99, file: !13, line: 71, column: 5)
!121 = !DILocation(line: 72, column: 13, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !120, file: !13, line: 73, type: !47)
!123 = !DILocation(line: 73, column: 16, scope: !120)
!124 = !DILocation(line: 75, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !13, line: 75, column: 9)
!126 = !DILocation(line: 75, column: 14, scope: !125)
!127 = !DILocation(line: 75, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !13, line: 75, column: 9)
!129 = !DILocation(line: 75, column: 23, scope: !128)
!130 = !DILocation(line: 75, column: 9, scope: !125)
!131 = !DILocation(line: 77, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !13, line: 76, column: 9)
!133 = !DILocation(line: 77, column: 23, scope: !132)
!134 = !DILocation(line: 77, column: 13, scope: !132)
!135 = !DILocation(line: 77, column: 18, scope: !132)
!136 = !DILocation(line: 77, column: 21, scope: !132)
!137 = !DILocation(line: 78, column: 9, scope: !132)
!138 = !DILocation(line: 75, column: 30, scope: !128)
!139 = !DILocation(line: 75, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !69}
!141 = !DILocation(line: 78, column: 9, scope: !125)
!142 = !DILocation(line: 79, column: 22, scope: !120)
!143 = !DILocation(line: 79, column: 9, scope: !120)
!144 = !DILocation(line: 80, column: 14, scope: !120)
!145 = !DILocation(line: 80, column: 9, scope: !120)
!146 = !DILocation(line: 82, column: 1, scope: !99)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !13, line: 87, type: !6)
!149 = !DILocation(line: 87, column: 11, scope: !147)
!150 = !DILocation(line: 88, column: 10, scope: !147)
!151 = !DILocation(line: 89, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !13, line: 89, column: 8)
!153 = !DILocation(line: 89, column: 8, scope: !147)
!154 = !DILocation(line: 92, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !13, line: 90, column: 5)
!156 = !DILocation(line: 92, column: 16, scope: !155)
!157 = !DILocation(line: 92, column: 14, scope: !155)
!158 = !DILocation(line: 93, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !13, line: 93, column: 13)
!160 = !DILocation(line: 93, column: 18, scope: !159)
!161 = !DILocation(line: 93, column: 13, scope: !155)
!162 = !DILocation(line: 93, column: 28, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !13, line: 93, column: 27)
!164 = !DILocation(line: 94, column: 5, scope: !155)
!165 = !DILocalVariable(name: "source", scope: !166, file: !13, line: 96, type: !42)
!166 = distinct !DILexicalBlock(scope: !147, file: !13, line: 95, column: 5)
!167 = !DILocation(line: 96, column: 13, scope: !166)
!168 = !DILocalVariable(name: "i", scope: !166, file: !13, line: 97, type: !47)
!169 = !DILocation(line: 97, column: 16, scope: !166)
!170 = !DILocation(line: 99, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !13, line: 99, column: 9)
!172 = !DILocation(line: 99, column: 14, scope: !171)
!173 = !DILocation(line: 99, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !13, line: 99, column: 9)
!175 = !DILocation(line: 99, column: 23, scope: !174)
!176 = !DILocation(line: 99, column: 9, scope: !171)
!177 = !DILocation(line: 101, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !13, line: 100, column: 9)
!179 = !DILocation(line: 101, column: 23, scope: !178)
!180 = !DILocation(line: 101, column: 13, scope: !178)
!181 = !DILocation(line: 101, column: 18, scope: !178)
!182 = !DILocation(line: 101, column: 21, scope: !178)
!183 = !DILocation(line: 102, column: 9, scope: !178)
!184 = !DILocation(line: 99, column: 30, scope: !174)
!185 = !DILocation(line: 99, column: 9, scope: !174)
!186 = distinct !{!186, !176, !187, !69}
!187 = !DILocation(line: 102, column: 9, scope: !171)
!188 = !DILocation(line: 103, column: 22, scope: !166)
!189 = !DILocation(line: 103, column: 9, scope: !166)
!190 = !DILocation(line: 104, column: 14, scope: !166)
!191 = !DILocation(line: 104, column: 9, scope: !166)
!192 = !DILocation(line: 106, column: 1, scope: !147)
