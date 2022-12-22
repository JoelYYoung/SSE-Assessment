; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  store i32 1, i32* @badStatic, align 4, !dbg !28
  %0 = load i32*, i32** %data, align 8, !dbg !29
  %call = call i32* @badSource(i32* %0), !dbg !30
  store i32* %call, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %2, 10, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !52
  %4 = load i32, i32* %arrayidx, align 4, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %6 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !53
  store i32 %4, i32* %arrayidx1, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %7, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !62
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !62
  call void @printIntLine(i32 %9), !dbg !63
  %10 = load i32*, i32** %data, align 8, !dbg !64
  %11 = bitcast i32* %10 to i8*, !dbg !64
  call void @free(i8* %11) #6, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !67 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i32, i32* @badStatic, align 4, !dbg !72
  %tobool = icmp ne i32 %0, 0, !dbg !72
  br i1 %tobool, label %if.then, label %if.end2, !dbg !74

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !75
  %1 = bitcast i8* %call to i32*, !dbg !77
  store i32* %1, i32** %data.addr, align 8, !dbg !78
  %2 = load i32*, i32** %data.addr, align 8, !dbg !79
  %cmp = icmp eq i32* %2, null, !dbg !81
  br i1 %cmp, label %if.then1, label %if.end, !dbg !82

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !85

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !86
  ret i32* %3, !dbg !87
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21_good() #0 !dbg !88 {
entry:
  call void @goodG2B1(), !dbg !89
  call void @goodG2B2(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #6, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #6, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !116
  %0 = load i32*, i32** %data, align 8, !dbg !117
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !118
  store i32* %call, i32** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !128
  %cmp = icmp ult i64 %2, 10, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !134
  %4 = load i32, i32* %arrayidx, align 4, !dbg !134
  %5 = load i32*, i32** %data, align 8, !dbg !135
  %6 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !135
  store i32 %4, i32* %arrayidx1, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %7, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !143
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !143
  call void @printIntLine(i32 %9), !dbg !144
  %10 = load i32*, i32** %data, align 8, !dbg !145
  %11 = bitcast i32* %10 to i8*, !dbg !145
  call void @free(i8* %11) #6, !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !148 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !151
  %tobool = icmp ne i32 %0, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !154
  br label %if.end2, !dbg !156

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !157
  %1 = bitcast i8* %call to i32*, !dbg !159
  store i32* %1, i32** %data.addr, align 8, !dbg !160
  %2 = load i32*, i32** %data.addr, align 8, !dbg !161
  %cmp = icmp eq i32* %2, null, !dbg !163
  br i1 %cmp, label %if.then1, label %if.end, !dbg !164

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !165
  unreachable, !dbg !165

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !167
  ret i32* %3, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !169 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !170, metadata !DIExpression()), !dbg !171
  store i32* null, i32** %data, align 8, !dbg !172
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !173
  %0 = load i32*, i32** %data, align 8, !dbg !174
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !175
  store i32* %call, i32** %data, align 8, !dbg !176
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !177, metadata !DIExpression()), !dbg !179
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !185
  %cmp = icmp ult i64 %2, 10, !dbg !187
  br i1 %cmp, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !191
  %4 = load i32, i32* %arrayidx, align 4, !dbg !191
  %5 = load i32*, i32** %data, align 8, !dbg !192
  %6 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !192
  store i32 %4, i32* %arrayidx1, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %7, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !200
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !200
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !200
  call void @printIntLine(i32 %9), !dbg !201
  %10 = load i32*, i32** %data, align 8, !dbg !202
  %11 = bitcast i32* %10 to i8*, !dbg !202
  call void @free(i8* %11) #6, !dbg !203
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !205 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !206, metadata !DIExpression()), !dbg !207
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !208
  %tobool = icmp ne i32 %0, 0, !dbg !208
  br i1 %tobool, label %if.then, label %if.end2, !dbg !210

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !211
  %1 = bitcast i8* %call to i32*, !dbg !213
  store i32* %1, i32** %data.addr, align 8, !dbg !214
  %2 = load i32*, i32** %data.addr, align 8, !dbg !215
  %cmp = icmp eq i32* %2, null, !dbg !217
  br i1 %cmp, label %if.then1, label %if.end, !dbg !218

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !219
  unreachable, !dbg !219

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !221

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !222
  ret i32* %3, !dbg !223
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 22, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !14}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 59, type: !8, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21.c", directory: "/root/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 60, type: !8, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21_bad", scope: !13, file: !13, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 37, type: !7)
!26 = !DILocation(line: 37, column: 11, scope: !22)
!27 = !DILocation(line: 38, column: 10, scope: !22)
!28 = !DILocation(line: 39, column: 15, scope: !22)
!29 = !DILocation(line: 40, column: 22, scope: !22)
!30 = !DILocation(line: 40, column: 12, scope: !22)
!31 = !DILocation(line: 40, column: 10, scope: !22)
!32 = !DILocalVariable(name: "source", scope: !33, file: !13, line: 42, type: !34)
!33 = distinct !DILexicalBlock(scope: !22, file: !13, line: 41, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 42, column: 13, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !13, line: 43, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 43, column: 16, scope: !33)
!43 = !DILocation(line: 45, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 45, column: 9)
!45 = !DILocation(line: 45, column: 14, scope: !44)
!46 = !DILocation(line: 45, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !13, line: 45, column: 9)
!48 = !DILocation(line: 45, column: 23, scope: !47)
!49 = !DILocation(line: 45, column: 9, scope: !44)
!50 = !DILocation(line: 47, column: 30, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !13, line: 46, column: 9)
!52 = !DILocation(line: 47, column: 23, scope: !51)
!53 = !DILocation(line: 47, column: 13, scope: !51)
!54 = !DILocation(line: 47, column: 18, scope: !51)
!55 = !DILocation(line: 47, column: 21, scope: !51)
!56 = !DILocation(line: 48, column: 9, scope: !51)
!57 = !DILocation(line: 45, column: 30, scope: !47)
!58 = !DILocation(line: 45, column: 9, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 48, column: 9, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 49, column: 22, scope: !33)
!63 = !DILocation(line: 49, column: 9, scope: !33)
!64 = !DILocation(line: 50, column: 14, scope: !33)
!65 = !DILocation(line: 50, column: 9, scope: !33)
!66 = !DILocation(line: 52, column: 1, scope: !22)
!67 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 24, type: !68, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7}
!70 = !DILocalVariable(name: "data", arg: 1, scope: !67, file: !13, line: 24, type: !7)
!71 = !DILocation(line: 24, column: 30, scope: !67)
!72 = !DILocation(line: 26, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !13, line: 26, column: 8)
!74 = !DILocation(line: 26, column: 8, scope: !67)
!75 = !DILocation(line: 29, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !13, line: 27, column: 5)
!77 = !DILocation(line: 29, column: 16, scope: !76)
!78 = !DILocation(line: 29, column: 14, scope: !76)
!79 = !DILocation(line: 30, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !13, line: 30, column: 13)
!81 = !DILocation(line: 30, column: 18, scope: !80)
!82 = !DILocation(line: 30, column: 13, scope: !76)
!83 = !DILocation(line: 30, column: 28, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !13, line: 30, column: 27)
!85 = !DILocation(line: 31, column: 5, scope: !76)
!86 = !DILocation(line: 32, column: 12, scope: !67)
!87 = !DILocation(line: 32, column: 5, scope: !67)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_21_good", scope: !13, file: !13, line: 129, type: !23, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocation(line: 131, column: 5, scope: !88)
!90 = !DILocation(line: 132, column: 5, scope: !88)
!91 = !DILocation(line: 133, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 145, type: !93, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DISubroutineType(types: !94)
!94 = !{!8, !8, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !13, line: 145, type: !8)
!99 = !DILocation(line: 145, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !13, line: 145, type: !95)
!101 = !DILocation(line: 145, column: 27, scope: !92)
!102 = !DILocation(line: 148, column: 22, scope: !92)
!103 = !DILocation(line: 148, column: 12, scope: !92)
!104 = !DILocation(line: 148, column: 5, scope: !92)
!105 = !DILocation(line: 150, column: 5, scope: !92)
!106 = !DILocation(line: 151, column: 5, scope: !92)
!107 = !DILocation(line: 152, column: 5, scope: !92)
!108 = !DILocation(line: 155, column: 5, scope: !92)
!109 = !DILocation(line: 156, column: 5, scope: !92)
!110 = !DILocation(line: 157, column: 5, scope: !92)
!111 = !DILocation(line: 159, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 79, type: !23, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 81, type: !7)
!114 = !DILocation(line: 81, column: 11, scope: !112)
!115 = !DILocation(line: 82, column: 10, scope: !112)
!116 = !DILocation(line: 83, column: 20, scope: !112)
!117 = !DILocation(line: 84, column: 27, scope: !112)
!118 = !DILocation(line: 84, column: 12, scope: !112)
!119 = !DILocation(line: 84, column: 10, scope: !112)
!120 = !DILocalVariable(name: "source", scope: !121, file: !13, line: 86, type: !34)
!121 = distinct !DILexicalBlock(scope: !112, file: !13, line: 85, column: 5)
!122 = !DILocation(line: 86, column: 13, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !13, line: 87, type: !39)
!124 = !DILocation(line: 87, column: 16, scope: !121)
!125 = !DILocation(line: 89, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !13, line: 89, column: 9)
!127 = !DILocation(line: 89, column: 14, scope: !126)
!128 = !DILocation(line: 89, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !13, line: 89, column: 9)
!130 = !DILocation(line: 89, column: 23, scope: !129)
!131 = !DILocation(line: 89, column: 9, scope: !126)
!132 = !DILocation(line: 91, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !13, line: 90, column: 9)
!134 = !DILocation(line: 91, column: 23, scope: !133)
!135 = !DILocation(line: 91, column: 13, scope: !133)
!136 = !DILocation(line: 91, column: 18, scope: !133)
!137 = !DILocation(line: 91, column: 21, scope: !133)
!138 = !DILocation(line: 92, column: 9, scope: !133)
!139 = !DILocation(line: 89, column: 30, scope: !129)
!140 = !DILocation(line: 89, column: 9, scope: !129)
!141 = distinct !{!141, !131, !142, !61}
!142 = !DILocation(line: 92, column: 9, scope: !126)
!143 = !DILocation(line: 93, column: 22, scope: !121)
!144 = !DILocation(line: 93, column: 9, scope: !121)
!145 = !DILocation(line: 94, column: 14, scope: !121)
!146 = !DILocation(line: 94, column: 9, scope: !121)
!147 = !DILocation(line: 96, column: 1, scope: !112)
!148 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 63, type: !68, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", arg: 1, scope: !148, file: !13, line: 63, type: !7)
!150 = !DILocation(line: 63, column: 35, scope: !148)
!151 = !DILocation(line: 65, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 65, column: 8)
!153 = !DILocation(line: 65, column: 8, scope: !148)
!154 = !DILocation(line: 68, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !13, line: 66, column: 5)
!156 = !DILocation(line: 69, column: 5, scope: !155)
!157 = !DILocation(line: 73, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !13, line: 71, column: 5)
!159 = !DILocation(line: 73, column: 16, scope: !158)
!160 = !DILocation(line: 73, column: 14, scope: !158)
!161 = !DILocation(line: 74, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !13, line: 74, column: 13)
!163 = !DILocation(line: 74, column: 18, scope: !162)
!164 = !DILocation(line: 74, column: 13, scope: !158)
!165 = !DILocation(line: 74, column: 28, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !13, line: 74, column: 27)
!167 = !DILocation(line: 76, column: 12, scope: !148)
!168 = !DILocation(line: 76, column: 5, scope: !148)
!169 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 110, type: !23, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DILocalVariable(name: "data", scope: !169, file: !13, line: 112, type: !7)
!171 = !DILocation(line: 112, column: 11, scope: !169)
!172 = !DILocation(line: 113, column: 10, scope: !169)
!173 = !DILocation(line: 114, column: 20, scope: !169)
!174 = !DILocation(line: 115, column: 27, scope: !169)
!175 = !DILocation(line: 115, column: 12, scope: !169)
!176 = !DILocation(line: 115, column: 10, scope: !169)
!177 = !DILocalVariable(name: "source", scope: !178, file: !13, line: 117, type: !34)
!178 = distinct !DILexicalBlock(scope: !169, file: !13, line: 116, column: 5)
!179 = !DILocation(line: 117, column: 13, scope: !178)
!180 = !DILocalVariable(name: "i", scope: !178, file: !13, line: 118, type: !39)
!181 = !DILocation(line: 118, column: 16, scope: !178)
!182 = !DILocation(line: 120, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !13, line: 120, column: 9)
!184 = !DILocation(line: 120, column: 14, scope: !183)
!185 = !DILocation(line: 120, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !13, line: 120, column: 9)
!187 = !DILocation(line: 120, column: 23, scope: !186)
!188 = !DILocation(line: 120, column: 9, scope: !183)
!189 = !DILocation(line: 122, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !13, line: 121, column: 9)
!191 = !DILocation(line: 122, column: 23, scope: !190)
!192 = !DILocation(line: 122, column: 13, scope: !190)
!193 = !DILocation(line: 122, column: 18, scope: !190)
!194 = !DILocation(line: 122, column: 21, scope: !190)
!195 = !DILocation(line: 123, column: 9, scope: !190)
!196 = !DILocation(line: 120, column: 30, scope: !186)
!197 = !DILocation(line: 120, column: 9, scope: !186)
!198 = distinct !{!198, !188, !199, !61}
!199 = !DILocation(line: 123, column: 9, scope: !183)
!200 = !DILocation(line: 124, column: 22, scope: !178)
!201 = !DILocation(line: 124, column: 9, scope: !178)
!202 = !DILocation(line: 125, column: 14, scope: !178)
!203 = !DILocation(line: 125, column: 9, scope: !178)
!204 = !DILocation(line: 127, column: 1, scope: !169)
!205 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 99, type: !68, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!206 = !DILocalVariable(name: "data", arg: 1, scope: !205, file: !13, line: 99, type: !7)
!207 = !DILocation(line: 99, column: 35, scope: !205)
!208 = !DILocation(line: 101, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !13, line: 101, column: 8)
!210 = !DILocation(line: 101, column: 8, scope: !205)
!211 = !DILocation(line: 104, column: 23, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !13, line: 102, column: 5)
!213 = !DILocation(line: 104, column: 16, scope: !212)
!214 = !DILocation(line: 104, column: 14, scope: !212)
!215 = !DILocation(line: 105, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !13, line: 105, column: 13)
!217 = !DILocation(line: 105, column: 18, scope: !216)
!218 = !DILocation(line: 105, column: 13, scope: !212)
!219 = !DILocation(line: 105, column: 28, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !13, line: 105, column: 27)
!221 = !DILocation(line: 106, column: 5, scope: !212)
!222 = !DILocation(line: 107, column: 12, scope: !205)
!223 = !DILocation(line: 107, column: 5, scope: !205)
