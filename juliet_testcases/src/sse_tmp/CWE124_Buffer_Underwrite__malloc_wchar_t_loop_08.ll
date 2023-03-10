; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end4, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !30
  %0 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !39
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end4, !dbg !45

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx6, align 4, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !63
  %cmp7 = icmp ult i64 %5, 100, !dbg !65
  br i1 %cmp7, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !69
  %7 = load i32, i32* %arrayidx8, align 4, !dbg !69
  %8 = load i32*, i32** %data, align 8, !dbg !70
  %9 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx9 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !70
  store i32 %7, i32* %arrayidx9, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %10, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !79
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !79
  store i32 0, i32* %arrayidx10, align 4, !dbg !80
  %12 = load i32*, i32** %data, align 8, !dbg !81
  call void @printWLine(i32* %12), !dbg !82
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08_good() #0 !dbg !84 {
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
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !108 {
entry:
  ret i32 1, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %call = call i32 @staticReturnsFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end4, !dbg !121

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !125
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !126
  %0 = bitcast i8* %call1 to i32*, !dbg !127
  store i32* %0, i32** %dataBuffer, align 8, !dbg !125
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  %cmp = icmp eq i32* %1, null, !dbg !130
  br i1 %cmp, label %if.then2, label %if.end, !dbg !131

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !135
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  store i32* %4, i32** %data, align 8, !dbg !139
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !145
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !146
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx6, align 4, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !152
  %cmp7 = icmp ult i64 %5, 100, !dbg !154
  br i1 %cmp7, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !158
  %7 = load i32, i32* %arrayidx8, align 4, !dbg !158
  %8 = load i32*, i32** %data, align 8, !dbg !159
  %9 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx9 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !159
  store i32 %7, i32* %arrayidx9, align 4, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %10, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !167
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !167
  store i32 0, i32* %arrayidx10, align 4, !dbg !168
  %12 = load i32*, i32** %data, align 8, !dbg !169
  call void @printWLine(i32* %12), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !172 {
entry:
  ret i32 0, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !174 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !175, metadata !DIExpression()), !dbg !176
  store i32* null, i32** %data, align 8, !dbg !177
  %call = call i32 @staticReturnsTrue(), !dbg !178
  %tobool = icmp ne i32 %call, 0, !dbg !178
  br i1 %tobool, label %if.then, label %if.end4, !dbg !180

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !181, metadata !DIExpression()), !dbg !184
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !185
  %0 = bitcast i8* %call1 to i32*, !dbg !186
  store i32* %0, i32** %dataBuffer, align 8, !dbg !184
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !187
  %cmp = icmp eq i32* %1, null, !dbg !189
  br i1 %cmp, label %if.then2, label %if.end, !dbg !190

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !191
  unreachable, !dbg !191

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !193
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !194
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !195
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !195
  store i32 0, i32* %arrayidx, align 4, !dbg !196
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !197
  store i32* %4, i32** %data, align 8, !dbg !198
  br label %if.end4, !dbg !199

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !203, metadata !DIExpression()), !dbg !204
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !205
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !206
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !207
  store i32 0, i32* %arrayidx6, align 4, !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !212
  %cmp7 = icmp ult i64 %5, 100, !dbg !214
  br i1 %cmp7, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !218
  %7 = load i32, i32* %arrayidx8, align 4, !dbg !218
  %8 = load i32*, i32** %data, align 8, !dbg !219
  %9 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx9 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !219
  store i32 %7, i32* %arrayidx9, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !223
  %inc = add i64 %10, 1, !dbg !223
  store i64 %inc, i64* %i, align 8, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !227
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !227
  store i32 0, i32* %arrayidx10, align 4, !dbg !228
  %12 = load i32*, i32** %data, align 8, !dbg !229
  call void @printWLine(i32* %12), !dbg !230
  ret void, !dbg !231
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 44, type: !4)
!27 = distinct !DILexicalBlock(scope: !28, file: !17, line: 43, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 5)
!29 = !DILocation(line: 44, column: 23, scope: !27)
!30 = !DILocation(line: 44, column: 47, scope: !27)
!31 = !DILocation(line: 44, column: 36, scope: !27)
!32 = !DILocation(line: 45, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !17, line: 45, column: 17)
!34 = !DILocation(line: 45, column: 28, scope: !33)
!35 = !DILocation(line: 45, column: 17, scope: !27)
!36 = !DILocation(line: 45, column: 38, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 45, column: 37)
!38 = !DILocation(line: 46, column: 21, scope: !27)
!39 = !DILocation(line: 46, column: 13, scope: !27)
!40 = !DILocation(line: 47, column: 13, scope: !27)
!41 = !DILocation(line: 47, column: 31, scope: !27)
!42 = !DILocation(line: 49, column: 20, scope: !27)
!43 = !DILocation(line: 49, column: 31, scope: !27)
!44 = !DILocation(line: 49, column: 18, scope: !27)
!45 = !DILocation(line: 51, column: 5, scope: !28)
!46 = !DILocalVariable(name: "i", scope: !47, file: !17, line: 53, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 52, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 53, column: 16, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !47, file: !17, line: 54, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 54, column: 17, scope: !47)
!56 = !DILocation(line: 55, column: 17, scope: !47)
!57 = !DILocation(line: 55, column: 9, scope: !47)
!58 = !DILocation(line: 56, column: 9, scope: !47)
!59 = !DILocation(line: 56, column: 23, scope: !47)
!60 = !DILocation(line: 58, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !47, file: !17, line: 58, column: 9)
!62 = !DILocation(line: 58, column: 14, scope: !61)
!63 = !DILocation(line: 58, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !17, line: 58, column: 9)
!65 = !DILocation(line: 58, column: 23, scope: !64)
!66 = !DILocation(line: 58, column: 9, scope: !61)
!67 = !DILocation(line: 60, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !17, line: 59, column: 9)
!69 = !DILocation(line: 60, column: 23, scope: !68)
!70 = !DILocation(line: 60, column: 13, scope: !68)
!71 = !DILocation(line: 60, column: 18, scope: !68)
!72 = !DILocation(line: 60, column: 21, scope: !68)
!73 = !DILocation(line: 61, column: 9, scope: !68)
!74 = !DILocation(line: 58, column: 31, scope: !64)
!75 = !DILocation(line: 58, column: 9, scope: !64)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 61, column: 9, scope: !61)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 63, column: 9, scope: !47)
!80 = !DILocation(line: 63, column: 21, scope: !47)
!81 = !DILocation(line: 64, column: 20, scope: !47)
!82 = !DILocation(line: 64, column: 9, scope: !47)
!83 = !DILocation(line: 68, column: 1, scope: !16)
!84 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_08_good", scope: !17, file: !17, line: 147, type: !18, scopeLine: 148, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 149, column: 5, scope: !84)
!86 = !DILocation(line: 150, column: 5, scope: !84)
!87 = !DILocation(line: 151, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 163, type: !89, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !17, line: 163, type: !7)
!95 = !DILocation(line: 163, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !17, line: 163, type: !91)
!97 = !DILocation(line: 163, column: 27, scope: !88)
!98 = !DILocation(line: 166, column: 22, scope: !88)
!99 = !DILocation(line: 166, column: 12, scope: !88)
!100 = !DILocation(line: 166, column: 5, scope: !88)
!101 = !DILocation(line: 168, column: 5, scope: !88)
!102 = !DILocation(line: 169, column: 5, scope: !88)
!103 = !DILocation(line: 170, column: 5, scope: !88)
!104 = !DILocation(line: 173, column: 5, scope: !88)
!105 = !DILocation(line: 174, column: 5, scope: !88)
!106 = !DILocation(line: 175, column: 5, scope: !88)
!107 = !DILocation(line: 177, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !109, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DISubroutineType(types: !110)
!110 = !{!7}
!111 = !DILocation(line: 27, column: 5, scope: !108)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 75, type: !18, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 77, type: !4)
!114 = !DILocation(line: 77, column: 15, scope: !112)
!115 = !DILocation(line: 78, column: 10, scope: !112)
!116 = !DILocation(line: 79, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !17, line: 79, column: 8)
!118 = !DILocation(line: 79, column: 8, scope: !112)
!119 = !DILocation(line: 82, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !17, line: 80, column: 5)
!121 = !DILocation(line: 83, column: 5, scope: !120)
!122 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !17, line: 87, type: !4)
!123 = distinct !DILexicalBlock(scope: !124, file: !17, line: 86, column: 9)
!124 = distinct !DILexicalBlock(scope: !117, file: !17, line: 85, column: 5)
!125 = !DILocation(line: 87, column: 23, scope: !123)
!126 = !DILocation(line: 87, column: 47, scope: !123)
!127 = !DILocation(line: 87, column: 36, scope: !123)
!128 = !DILocation(line: 88, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !17, line: 88, column: 17)
!130 = !DILocation(line: 88, column: 28, scope: !129)
!131 = !DILocation(line: 88, column: 17, scope: !123)
!132 = !DILocation(line: 88, column: 38, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 88, column: 37)
!134 = !DILocation(line: 89, column: 21, scope: !123)
!135 = !DILocation(line: 89, column: 13, scope: !123)
!136 = !DILocation(line: 90, column: 13, scope: !123)
!137 = !DILocation(line: 90, column: 31, scope: !123)
!138 = !DILocation(line: 92, column: 20, scope: !123)
!139 = !DILocation(line: 92, column: 18, scope: !123)
!140 = !DILocalVariable(name: "i", scope: !141, file: !17, line: 96, type: !48)
!141 = distinct !DILexicalBlock(scope: !112, file: !17, line: 95, column: 5)
!142 = !DILocation(line: 96, column: 16, scope: !141)
!143 = !DILocalVariable(name: "source", scope: !141, file: !17, line: 97, type: !52)
!144 = !DILocation(line: 97, column: 17, scope: !141)
!145 = !DILocation(line: 98, column: 17, scope: !141)
!146 = !DILocation(line: 98, column: 9, scope: !141)
!147 = !DILocation(line: 99, column: 9, scope: !141)
!148 = !DILocation(line: 99, column: 23, scope: !141)
!149 = !DILocation(line: 101, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !141, file: !17, line: 101, column: 9)
!151 = !DILocation(line: 101, column: 14, scope: !150)
!152 = !DILocation(line: 101, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !17, line: 101, column: 9)
!154 = !DILocation(line: 101, column: 23, scope: !153)
!155 = !DILocation(line: 101, column: 9, scope: !150)
!156 = !DILocation(line: 103, column: 30, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !17, line: 102, column: 9)
!158 = !DILocation(line: 103, column: 23, scope: !157)
!159 = !DILocation(line: 103, column: 13, scope: !157)
!160 = !DILocation(line: 103, column: 18, scope: !157)
!161 = !DILocation(line: 103, column: 21, scope: !157)
!162 = !DILocation(line: 104, column: 9, scope: !157)
!163 = !DILocation(line: 101, column: 31, scope: !153)
!164 = !DILocation(line: 101, column: 9, scope: !153)
!165 = distinct !{!165, !155, !166, !78}
!166 = !DILocation(line: 104, column: 9, scope: !150)
!167 = !DILocation(line: 106, column: 9, scope: !141)
!168 = !DILocation(line: 106, column: 21, scope: !141)
!169 = !DILocation(line: 107, column: 20, scope: !141)
!170 = !DILocation(line: 107, column: 9, scope: !141)
!171 = !DILocation(line: 111, column: 1, scope: !112)
!172 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !109, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!173 = !DILocation(line: 32, column: 5, scope: !172)
!174 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 114, type: !18, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!175 = !DILocalVariable(name: "data", scope: !174, file: !17, line: 116, type: !4)
!176 = !DILocation(line: 116, column: 15, scope: !174)
!177 = !DILocation(line: 117, column: 10, scope: !174)
!178 = !DILocation(line: 118, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !17, line: 118, column: 8)
!180 = !DILocation(line: 118, column: 8, scope: !174)
!181 = !DILocalVariable(name: "dataBuffer", scope: !182, file: !17, line: 121, type: !4)
!182 = distinct !DILexicalBlock(scope: !183, file: !17, line: 120, column: 9)
!183 = distinct !DILexicalBlock(scope: !179, file: !17, line: 119, column: 5)
!184 = !DILocation(line: 121, column: 23, scope: !182)
!185 = !DILocation(line: 121, column: 47, scope: !182)
!186 = !DILocation(line: 121, column: 36, scope: !182)
!187 = !DILocation(line: 122, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !17, line: 122, column: 17)
!189 = !DILocation(line: 122, column: 28, scope: !188)
!190 = !DILocation(line: 122, column: 17, scope: !182)
!191 = !DILocation(line: 122, column: 38, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !17, line: 122, column: 37)
!193 = !DILocation(line: 123, column: 21, scope: !182)
!194 = !DILocation(line: 123, column: 13, scope: !182)
!195 = !DILocation(line: 124, column: 13, scope: !182)
!196 = !DILocation(line: 124, column: 31, scope: !182)
!197 = !DILocation(line: 126, column: 20, scope: !182)
!198 = !DILocation(line: 126, column: 18, scope: !182)
!199 = !DILocation(line: 128, column: 5, scope: !183)
!200 = !DILocalVariable(name: "i", scope: !201, file: !17, line: 130, type: !48)
!201 = distinct !DILexicalBlock(scope: !174, file: !17, line: 129, column: 5)
!202 = !DILocation(line: 130, column: 16, scope: !201)
!203 = !DILocalVariable(name: "source", scope: !201, file: !17, line: 131, type: !52)
!204 = !DILocation(line: 131, column: 17, scope: !201)
!205 = !DILocation(line: 132, column: 17, scope: !201)
!206 = !DILocation(line: 132, column: 9, scope: !201)
!207 = !DILocation(line: 133, column: 9, scope: !201)
!208 = !DILocation(line: 133, column: 23, scope: !201)
!209 = !DILocation(line: 135, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !201, file: !17, line: 135, column: 9)
!211 = !DILocation(line: 135, column: 14, scope: !210)
!212 = !DILocation(line: 135, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !17, line: 135, column: 9)
!214 = !DILocation(line: 135, column: 23, scope: !213)
!215 = !DILocation(line: 135, column: 9, scope: !210)
!216 = !DILocation(line: 137, column: 30, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !17, line: 136, column: 9)
!218 = !DILocation(line: 137, column: 23, scope: !217)
!219 = !DILocation(line: 137, column: 13, scope: !217)
!220 = !DILocation(line: 137, column: 18, scope: !217)
!221 = !DILocation(line: 137, column: 21, scope: !217)
!222 = !DILocation(line: 138, column: 9, scope: !217)
!223 = !DILocation(line: 135, column: 31, scope: !213)
!224 = !DILocation(line: 135, column: 9, scope: !213)
!225 = distinct !{!225, !215, !226, !78}
!226 = !DILocation(line: 138, column: 9, scope: !210)
!227 = !DILocation(line: 140, column: 9, scope: !201)
!228 = !DILocation(line: 140, column: 21, scope: !201)
!229 = !DILocation(line: 141, column: 20, scope: !201)
!230 = !DILocation(line: 141, column: 9, scope: !201)
!231 = !DILocation(line: 145, column: 1, scope: !174)
