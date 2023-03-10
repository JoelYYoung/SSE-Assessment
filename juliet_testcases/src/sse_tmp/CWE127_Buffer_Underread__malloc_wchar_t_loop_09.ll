; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_09.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_09_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %2, null, !dbg !34
  br i1 %cmp, label %if.then1, label %if.end, !dbg !35

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !57
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx5, align 4, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !63
  %cmp6 = icmp ult i64 %6, 100, !dbg !65
  br i1 %cmp6, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !67
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !67
  %10 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !71
  store i32 %9, i32* %arrayidx8, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %11, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !79
  store i32 0, i32* %arrayidx9, align 4, !dbg !80
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !81
  call void @printWLine(i32* %arraydecay10), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_09_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_09_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_09_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end3, !dbg !117

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !122
  %1 = bitcast i8* %call to i32*, !dbg !123
  store i32* %1, i32** %dataBuffer, align 8, !dbg !121
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %cmp = icmp eq i32* %2, null, !dbg !126
  br i1 %cmp, label %if.then1, label %if.end, !dbg !127

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !131
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  store i32* %5, i32** %data, align 8, !dbg !135
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !141
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !142
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx5, align 4, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !148
  %cmp6 = icmp ult i64 %6, 100, !dbg !150
  br i1 %cmp6, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !152
  %8 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !152
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !152
  %10 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !156
  store i32 %9, i32* %arrayidx8, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %11, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !163
  store i32 0, i32* %arrayidx9, align 4, !dbg !164
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !165
  call void @printWLine(i32* %arraydecay10), !dbg !166
  ret void, !dbg !167
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !168 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i32* null, i32** %data, align 8, !dbg !171
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !172
  %tobool = icmp ne i32 %0, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end3, !dbg !174

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !175, metadata !DIExpression()), !dbg !178
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !179
  %1 = bitcast i8* %call to i32*, !dbg !180
  store i32* %1, i32** %dataBuffer, align 8, !dbg !178
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !181
  %cmp = icmp eq i32* %2, null, !dbg !183
  br i1 %cmp, label %if.then1, label %if.end, !dbg !184

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !187
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !188
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !191
  store i32* %5, i32** %data, align 8, !dbg !192
  br label %if.end3, !dbg !193

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !194, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !197, metadata !DIExpression()), !dbg !198
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !199
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !200
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !201
  store i32 0, i32* %arrayidx5, align 4, !dbg !202
  store i64 0, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !205

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !206
  %cmp6 = icmp ult i64 %6, 100, !dbg !208
  br i1 %cmp6, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !210
  %8 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !210
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !210
  %10 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !214
  store i32 %9, i32* %arrayidx8, align 4, !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !217
  %inc = add i64 %11, 1, !dbg !217
  store i64 %inc, i64* %i, align 8, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !221
  store i32 0, i32* %arrayidx9, align 4, !dbg !222
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !223
  call void @printWLine(i32* %arraydecay10), !dbg !224
  ret void, !dbg !225
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_09_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !28, file: !17, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 23, scope: !27)
!30 = !DILocation(line: 30, column: 47, scope: !27)
!31 = !DILocation(line: 30, column: 36, scope: !27)
!32 = !DILocation(line: 31, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 17)
!34 = !DILocation(line: 31, column: 28, scope: !33)
!35 = !DILocation(line: 31, column: 17, scope: !27)
!36 = !DILocation(line: 31, column: 38, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 31, column: 37)
!38 = !DILocation(line: 32, column: 21, scope: !27)
!39 = !DILocation(line: 32, column: 13, scope: !27)
!40 = !DILocation(line: 33, column: 13, scope: !27)
!41 = !DILocation(line: 33, column: 31, scope: !27)
!42 = !DILocation(line: 35, column: 20, scope: !27)
!43 = !DILocation(line: 35, column: 31, scope: !27)
!44 = !DILocation(line: 35, column: 18, scope: !27)
!45 = !DILocation(line: 37, column: 5, scope: !28)
!46 = !DILocalVariable(name: "i", scope: !47, file: !17, line: 39, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 39, column: 16, scope: !47)
!51 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 40, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 40, column: 17, scope: !47)
!56 = !DILocation(line: 41, column: 17, scope: !47)
!57 = !DILocation(line: 41, column: 9, scope: !47)
!58 = !DILocation(line: 42, column: 9, scope: !47)
!59 = !DILocation(line: 42, column: 21, scope: !47)
!60 = !DILocation(line: 44, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !47, file: !17, line: 44, column: 9)
!62 = !DILocation(line: 44, column: 14, scope: !61)
!63 = !DILocation(line: 44, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !17, line: 44, column: 9)
!65 = !DILocation(line: 44, column: 23, scope: !64)
!66 = !DILocation(line: 44, column: 9, scope: !61)
!67 = !DILocation(line: 46, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !17, line: 45, column: 9)
!69 = !DILocation(line: 46, column: 28, scope: !68)
!70 = !DILocation(line: 46, column: 18, scope: !68)
!71 = !DILocation(line: 46, column: 13, scope: !68)
!72 = !DILocation(line: 46, column: 21, scope: !68)
!73 = !DILocation(line: 47, column: 9, scope: !68)
!74 = !DILocation(line: 44, column: 31, scope: !64)
!75 = !DILocation(line: 44, column: 9, scope: !64)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 47, column: 9, scope: !61)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 49, column: 9, scope: !47)
!80 = !DILocation(line: 49, column: 21, scope: !47)
!81 = !DILocation(line: 50, column: 20, scope: !47)
!82 = !DILocation(line: 50, column: 9, scope: !47)
!83 = !DILocation(line: 54, column: 1, scope: !16)
!84 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_09_good", scope: !17, file: !17, line: 133, type: !18, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 135, column: 5, scope: !84)
!86 = !DILocation(line: 136, column: 5, scope: !84)
!87 = !DILocation(line: 137, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 149, type: !89, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !17, line: 149, type: !7)
!95 = !DILocation(line: 149, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !17, line: 149, type: !91)
!97 = !DILocation(line: 149, column: 27, scope: !88)
!98 = !DILocation(line: 152, column: 22, scope: !88)
!99 = !DILocation(line: 152, column: 12, scope: !88)
!100 = !DILocation(line: 152, column: 5, scope: !88)
!101 = !DILocation(line: 154, column: 5, scope: !88)
!102 = !DILocation(line: 155, column: 5, scope: !88)
!103 = !DILocation(line: 156, column: 5, scope: !88)
!104 = !DILocation(line: 159, column: 5, scope: !88)
!105 = !DILocation(line: 160, column: 5, scope: !88)
!106 = !DILocation(line: 161, column: 5, scope: !88)
!107 = !DILocation(line: 163, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 63, type: !4)
!110 = !DILocation(line: 63, column: 15, scope: !108)
!111 = !DILocation(line: 64, column: 10, scope: !108)
!112 = !DILocation(line: 65, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !17, line: 65, column: 8)
!114 = !DILocation(line: 65, column: 8, scope: !108)
!115 = !DILocation(line: 68, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !17, line: 66, column: 5)
!117 = !DILocation(line: 69, column: 5, scope: !116)
!118 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !17, line: 73, type: !4)
!119 = distinct !DILexicalBlock(scope: !120, file: !17, line: 72, column: 9)
!120 = distinct !DILexicalBlock(scope: !113, file: !17, line: 71, column: 5)
!121 = !DILocation(line: 73, column: 23, scope: !119)
!122 = !DILocation(line: 73, column: 47, scope: !119)
!123 = !DILocation(line: 73, column: 36, scope: !119)
!124 = !DILocation(line: 74, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !17, line: 74, column: 17)
!126 = !DILocation(line: 74, column: 28, scope: !125)
!127 = !DILocation(line: 74, column: 17, scope: !119)
!128 = !DILocation(line: 74, column: 38, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 74, column: 37)
!130 = !DILocation(line: 75, column: 21, scope: !119)
!131 = !DILocation(line: 75, column: 13, scope: !119)
!132 = !DILocation(line: 76, column: 13, scope: !119)
!133 = !DILocation(line: 76, column: 31, scope: !119)
!134 = !DILocation(line: 78, column: 20, scope: !119)
!135 = !DILocation(line: 78, column: 18, scope: !119)
!136 = !DILocalVariable(name: "i", scope: !137, file: !17, line: 82, type: !48)
!137 = distinct !DILexicalBlock(scope: !108, file: !17, line: 81, column: 5)
!138 = !DILocation(line: 82, column: 16, scope: !137)
!139 = !DILocalVariable(name: "dest", scope: !137, file: !17, line: 83, type: !52)
!140 = !DILocation(line: 83, column: 17, scope: !137)
!141 = !DILocation(line: 84, column: 17, scope: !137)
!142 = !DILocation(line: 84, column: 9, scope: !137)
!143 = !DILocation(line: 85, column: 9, scope: !137)
!144 = !DILocation(line: 85, column: 21, scope: !137)
!145 = !DILocation(line: 87, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !137, file: !17, line: 87, column: 9)
!147 = !DILocation(line: 87, column: 14, scope: !146)
!148 = !DILocation(line: 87, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !17, line: 87, column: 9)
!150 = !DILocation(line: 87, column: 23, scope: !149)
!151 = !DILocation(line: 87, column: 9, scope: !146)
!152 = !DILocation(line: 89, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !17, line: 88, column: 9)
!154 = !DILocation(line: 89, column: 28, scope: !153)
!155 = !DILocation(line: 89, column: 18, scope: !153)
!156 = !DILocation(line: 89, column: 13, scope: !153)
!157 = !DILocation(line: 89, column: 21, scope: !153)
!158 = !DILocation(line: 90, column: 9, scope: !153)
!159 = !DILocation(line: 87, column: 31, scope: !149)
!160 = !DILocation(line: 87, column: 9, scope: !149)
!161 = distinct !{!161, !151, !162, !78}
!162 = !DILocation(line: 90, column: 9, scope: !146)
!163 = !DILocation(line: 92, column: 9, scope: !137)
!164 = !DILocation(line: 92, column: 21, scope: !137)
!165 = !DILocation(line: 93, column: 20, scope: !137)
!166 = !DILocation(line: 93, column: 9, scope: !137)
!167 = !DILocation(line: 97, column: 1, scope: !108)
!168 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 100, type: !18, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!169 = !DILocalVariable(name: "data", scope: !168, file: !17, line: 102, type: !4)
!170 = !DILocation(line: 102, column: 15, scope: !168)
!171 = !DILocation(line: 103, column: 10, scope: !168)
!172 = !DILocation(line: 104, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !17, line: 104, column: 8)
!174 = !DILocation(line: 104, column: 8, scope: !168)
!175 = !DILocalVariable(name: "dataBuffer", scope: !176, file: !17, line: 107, type: !4)
!176 = distinct !DILexicalBlock(scope: !177, file: !17, line: 106, column: 9)
!177 = distinct !DILexicalBlock(scope: !173, file: !17, line: 105, column: 5)
!178 = !DILocation(line: 107, column: 23, scope: !176)
!179 = !DILocation(line: 107, column: 47, scope: !176)
!180 = !DILocation(line: 107, column: 36, scope: !176)
!181 = !DILocation(line: 108, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !17, line: 108, column: 17)
!183 = !DILocation(line: 108, column: 28, scope: !182)
!184 = !DILocation(line: 108, column: 17, scope: !176)
!185 = !DILocation(line: 108, column: 38, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !17, line: 108, column: 37)
!187 = !DILocation(line: 109, column: 21, scope: !176)
!188 = !DILocation(line: 109, column: 13, scope: !176)
!189 = !DILocation(line: 110, column: 13, scope: !176)
!190 = !DILocation(line: 110, column: 31, scope: !176)
!191 = !DILocation(line: 112, column: 20, scope: !176)
!192 = !DILocation(line: 112, column: 18, scope: !176)
!193 = !DILocation(line: 114, column: 5, scope: !177)
!194 = !DILocalVariable(name: "i", scope: !195, file: !17, line: 116, type: !48)
!195 = distinct !DILexicalBlock(scope: !168, file: !17, line: 115, column: 5)
!196 = !DILocation(line: 116, column: 16, scope: !195)
!197 = !DILocalVariable(name: "dest", scope: !195, file: !17, line: 117, type: !52)
!198 = !DILocation(line: 117, column: 17, scope: !195)
!199 = !DILocation(line: 118, column: 17, scope: !195)
!200 = !DILocation(line: 118, column: 9, scope: !195)
!201 = !DILocation(line: 119, column: 9, scope: !195)
!202 = !DILocation(line: 119, column: 21, scope: !195)
!203 = !DILocation(line: 121, column: 16, scope: !204)
!204 = distinct !DILexicalBlock(scope: !195, file: !17, line: 121, column: 9)
!205 = !DILocation(line: 121, column: 14, scope: !204)
!206 = !DILocation(line: 121, column: 21, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !17, line: 121, column: 9)
!208 = !DILocation(line: 121, column: 23, scope: !207)
!209 = !DILocation(line: 121, column: 9, scope: !204)
!210 = !DILocation(line: 123, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !17, line: 122, column: 9)
!212 = !DILocation(line: 123, column: 28, scope: !211)
!213 = !DILocation(line: 123, column: 18, scope: !211)
!214 = !DILocation(line: 123, column: 13, scope: !211)
!215 = !DILocation(line: 123, column: 21, scope: !211)
!216 = !DILocation(line: 124, column: 9, scope: !211)
!217 = !DILocation(line: 121, column: 31, scope: !207)
!218 = !DILocation(line: 121, column: 9, scope: !207)
!219 = distinct !{!219, !209, !220, !78}
!220 = !DILocation(line: 124, column: 9, scope: !204)
!221 = !DILocation(line: 126, column: 9, scope: !195)
!222 = !DILocation(line: 126, column: 21, scope: !195)
!223 = !DILocation(line: 127, column: 20, scope: !195)
!224 = !DILocation(line: 127, column: 9, scope: !195)
!225 = !DILocation(line: 131, column: 1, scope: !168)
