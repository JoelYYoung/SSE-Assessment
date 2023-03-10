; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_13.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end4, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp1 = icmp eq i32* %2, null, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !40
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  br label %if.end4, !dbg !46

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !58
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx6, align 4, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !64
  %cmp7 = icmp ult i64 %6, 100, !dbg !66
  br i1 %cmp7, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !68
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !68
  %10 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !72
  store i32 %9, i32* %arrayidx9, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %11, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx10, align 4, !dbg !81
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !82
  call void @printWLine(i32* %arraydecay11), !dbg !83
  ret void, !dbg !84
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_13_good() #0 !dbg !85 {
entry:
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #5, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #5, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_13_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_13_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32* null, i32** %data, align 8, !dbg !112
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !113
  %cmp = icmp ne i32 %0, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end4, !dbg !119

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !120, metadata !DIExpression()), !dbg !123
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !124
  %1 = bitcast i8* %call to i32*, !dbg !125
  store i32* %1, i32** %dataBuffer, align 8, !dbg !123
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %cmp1 = icmp eq i32* %2, null, !dbg !128
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !129

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !133
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !136
  store i32* %5, i32** %data, align 8, !dbg !137
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !144
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx6, align 4, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !150
  %cmp7 = icmp ult i64 %6, 100, !dbg !152
  br i1 %cmp7, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !154
  %8 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !154
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !154
  %10 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !158
  store i32 %9, i32* %arrayidx9, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %11, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx10, align 4, !dbg !166
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  call void @printWLine(i32* %arraydecay11), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !171, metadata !DIExpression()), !dbg !172
  store i32* null, i32** %data, align 8, !dbg !173
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !174
  %cmp = icmp eq i32 %0, 5, !dbg !176
  br i1 %cmp, label %if.then, label %if.end4, !dbg !177

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !178, metadata !DIExpression()), !dbg !181
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !182
  %1 = bitcast i8* %call to i32*, !dbg !183
  store i32* %1, i32** %dataBuffer, align 8, !dbg !181
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !184
  %cmp1 = icmp eq i32* %2, null, !dbg !186
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !187

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !188
  unreachable, !dbg !188

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !190
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !191
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !192
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !192
  store i32 0, i32* %arrayidx, align 4, !dbg !193
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !194
  store i32* %5, i32** %data, align 8, !dbg !195
  br label %if.end4, !dbg !196

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !197, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !200, metadata !DIExpression()), !dbg !201
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !202
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !203
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !204
  store i32 0, i32* %arrayidx6, align 4, !dbg !205
  store i64 0, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !209
  %cmp7 = icmp ult i64 %6, 100, !dbg !211
  br i1 %cmp7, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !213
  %8 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !213
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !213
  %10 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !217
  store i32 %9, i32* %arrayidx9, align 4, !dbg !218
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !220
  %inc = add i64 %11, 1, !dbg !220
  store i64 %inc, i64* %i, align 8, !dbg !220
  br label %for.cond, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !224
  store i32 0, i32* %arrayidx10, align 4, !dbg !225
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !226
  call void @printWLine(i32* %arraydecay11), !dbg !227
  ret void, !dbg !228
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 25, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !17, line: 30, type: !4)
!28 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 30, column: 23, scope: !28)
!31 = !DILocation(line: 30, column: 47, scope: !28)
!32 = !DILocation(line: 30, column: 36, scope: !28)
!33 = !DILocation(line: 31, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 17)
!35 = !DILocation(line: 31, column: 28, scope: !34)
!36 = !DILocation(line: 31, column: 17, scope: !28)
!37 = !DILocation(line: 31, column: 38, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 31, column: 37)
!39 = !DILocation(line: 32, column: 21, scope: !28)
!40 = !DILocation(line: 32, column: 13, scope: !28)
!41 = !DILocation(line: 33, column: 13, scope: !28)
!42 = !DILocation(line: 33, column: 31, scope: !28)
!43 = !DILocation(line: 35, column: 20, scope: !28)
!44 = !DILocation(line: 35, column: 31, scope: !28)
!45 = !DILocation(line: 35, column: 18, scope: !28)
!46 = !DILocation(line: 37, column: 5, scope: !29)
!47 = !DILocalVariable(name: "i", scope: !48, file: !17, line: 39, type: !49)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 39, column: 16, scope: !48)
!52 = !DILocalVariable(name: "dest", scope: !48, file: !17, line: 40, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 40, column: 17, scope: !48)
!57 = !DILocation(line: 41, column: 17, scope: !48)
!58 = !DILocation(line: 41, column: 9, scope: !48)
!59 = !DILocation(line: 42, column: 9, scope: !48)
!60 = !DILocation(line: 42, column: 21, scope: !48)
!61 = !DILocation(line: 44, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !48, file: !17, line: 44, column: 9)
!63 = !DILocation(line: 44, column: 14, scope: !62)
!64 = !DILocation(line: 44, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !17, line: 44, column: 9)
!66 = !DILocation(line: 44, column: 23, scope: !65)
!67 = !DILocation(line: 44, column: 9, scope: !62)
!68 = !DILocation(line: 46, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !17, line: 45, column: 9)
!70 = !DILocation(line: 46, column: 28, scope: !69)
!71 = !DILocation(line: 46, column: 18, scope: !69)
!72 = !DILocation(line: 46, column: 13, scope: !69)
!73 = !DILocation(line: 46, column: 21, scope: !69)
!74 = !DILocation(line: 47, column: 9, scope: !69)
!75 = !DILocation(line: 44, column: 31, scope: !65)
!76 = !DILocation(line: 44, column: 9, scope: !65)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 47, column: 9, scope: !62)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 49, column: 9, scope: !48)
!81 = !DILocation(line: 49, column: 21, scope: !48)
!82 = !DILocation(line: 50, column: 20, scope: !48)
!83 = !DILocation(line: 50, column: 9, scope: !48)
!84 = !DILocation(line: 54, column: 1, scope: !16)
!85 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_13_good", scope: !17, file: !17, line: 133, type: !18, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 135, column: 5, scope: !85)
!87 = !DILocation(line: 136, column: 5, scope: !85)
!88 = !DILocation(line: 137, column: 1, scope: !85)
!89 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 149, type: !90, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!7, !7, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !17, line: 149, type: !7)
!96 = !DILocation(line: 149, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !17, line: 149, type: !92)
!98 = !DILocation(line: 149, column: 27, scope: !89)
!99 = !DILocation(line: 152, column: 22, scope: !89)
!100 = !DILocation(line: 152, column: 12, scope: !89)
!101 = !DILocation(line: 152, column: 5, scope: !89)
!102 = !DILocation(line: 154, column: 5, scope: !89)
!103 = !DILocation(line: 155, column: 5, scope: !89)
!104 = !DILocation(line: 156, column: 5, scope: !89)
!105 = !DILocation(line: 159, column: 5, scope: !89)
!106 = !DILocation(line: 160, column: 5, scope: !89)
!107 = !DILocation(line: 161, column: 5, scope: !89)
!108 = !DILocation(line: 163, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !17, line: 63, type: !4)
!111 = !DILocation(line: 63, column: 15, scope: !109)
!112 = !DILocation(line: 64, column: 10, scope: !109)
!113 = !DILocation(line: 65, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !17, line: 65, column: 8)
!115 = !DILocation(line: 65, column: 25, scope: !114)
!116 = !DILocation(line: 65, column: 8, scope: !109)
!117 = !DILocation(line: 68, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 66, column: 5)
!119 = !DILocation(line: 69, column: 5, scope: !118)
!120 = !DILocalVariable(name: "dataBuffer", scope: !121, file: !17, line: 73, type: !4)
!121 = distinct !DILexicalBlock(scope: !122, file: !17, line: 72, column: 9)
!122 = distinct !DILexicalBlock(scope: !114, file: !17, line: 71, column: 5)
!123 = !DILocation(line: 73, column: 23, scope: !121)
!124 = !DILocation(line: 73, column: 47, scope: !121)
!125 = !DILocation(line: 73, column: 36, scope: !121)
!126 = !DILocation(line: 74, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !121, file: !17, line: 74, column: 17)
!128 = !DILocation(line: 74, column: 28, scope: !127)
!129 = !DILocation(line: 74, column: 17, scope: !121)
!130 = !DILocation(line: 74, column: 38, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 74, column: 37)
!132 = !DILocation(line: 75, column: 21, scope: !121)
!133 = !DILocation(line: 75, column: 13, scope: !121)
!134 = !DILocation(line: 76, column: 13, scope: !121)
!135 = !DILocation(line: 76, column: 31, scope: !121)
!136 = !DILocation(line: 78, column: 20, scope: !121)
!137 = !DILocation(line: 78, column: 18, scope: !121)
!138 = !DILocalVariable(name: "i", scope: !139, file: !17, line: 82, type: !49)
!139 = distinct !DILexicalBlock(scope: !109, file: !17, line: 81, column: 5)
!140 = !DILocation(line: 82, column: 16, scope: !139)
!141 = !DILocalVariable(name: "dest", scope: !139, file: !17, line: 83, type: !53)
!142 = !DILocation(line: 83, column: 17, scope: !139)
!143 = !DILocation(line: 84, column: 17, scope: !139)
!144 = !DILocation(line: 84, column: 9, scope: !139)
!145 = !DILocation(line: 85, column: 9, scope: !139)
!146 = !DILocation(line: 85, column: 21, scope: !139)
!147 = !DILocation(line: 87, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !139, file: !17, line: 87, column: 9)
!149 = !DILocation(line: 87, column: 14, scope: !148)
!150 = !DILocation(line: 87, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !17, line: 87, column: 9)
!152 = !DILocation(line: 87, column: 23, scope: !151)
!153 = !DILocation(line: 87, column: 9, scope: !148)
!154 = !DILocation(line: 89, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !17, line: 88, column: 9)
!156 = !DILocation(line: 89, column: 28, scope: !155)
!157 = !DILocation(line: 89, column: 18, scope: !155)
!158 = !DILocation(line: 89, column: 13, scope: !155)
!159 = !DILocation(line: 89, column: 21, scope: !155)
!160 = !DILocation(line: 90, column: 9, scope: !155)
!161 = !DILocation(line: 87, column: 31, scope: !151)
!162 = !DILocation(line: 87, column: 9, scope: !151)
!163 = distinct !{!163, !153, !164, !79}
!164 = !DILocation(line: 90, column: 9, scope: !148)
!165 = !DILocation(line: 92, column: 9, scope: !139)
!166 = !DILocation(line: 92, column: 21, scope: !139)
!167 = !DILocation(line: 93, column: 20, scope: !139)
!168 = !DILocation(line: 93, column: 9, scope: !139)
!169 = !DILocation(line: 97, column: 1, scope: !109)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 100, type: !18, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DILocalVariable(name: "data", scope: !170, file: !17, line: 102, type: !4)
!172 = !DILocation(line: 102, column: 15, scope: !170)
!173 = !DILocation(line: 103, column: 10, scope: !170)
!174 = !DILocation(line: 104, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !17, line: 104, column: 8)
!176 = !DILocation(line: 104, column: 25, scope: !175)
!177 = !DILocation(line: 104, column: 8, scope: !170)
!178 = !DILocalVariable(name: "dataBuffer", scope: !179, file: !17, line: 107, type: !4)
!179 = distinct !DILexicalBlock(scope: !180, file: !17, line: 106, column: 9)
!180 = distinct !DILexicalBlock(scope: !175, file: !17, line: 105, column: 5)
!181 = !DILocation(line: 107, column: 23, scope: !179)
!182 = !DILocation(line: 107, column: 47, scope: !179)
!183 = !DILocation(line: 107, column: 36, scope: !179)
!184 = !DILocation(line: 108, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !179, file: !17, line: 108, column: 17)
!186 = !DILocation(line: 108, column: 28, scope: !185)
!187 = !DILocation(line: 108, column: 17, scope: !179)
!188 = !DILocation(line: 108, column: 38, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !17, line: 108, column: 37)
!190 = !DILocation(line: 109, column: 21, scope: !179)
!191 = !DILocation(line: 109, column: 13, scope: !179)
!192 = !DILocation(line: 110, column: 13, scope: !179)
!193 = !DILocation(line: 110, column: 31, scope: !179)
!194 = !DILocation(line: 112, column: 20, scope: !179)
!195 = !DILocation(line: 112, column: 18, scope: !179)
!196 = !DILocation(line: 114, column: 5, scope: !180)
!197 = !DILocalVariable(name: "i", scope: !198, file: !17, line: 116, type: !49)
!198 = distinct !DILexicalBlock(scope: !170, file: !17, line: 115, column: 5)
!199 = !DILocation(line: 116, column: 16, scope: !198)
!200 = !DILocalVariable(name: "dest", scope: !198, file: !17, line: 117, type: !53)
!201 = !DILocation(line: 117, column: 17, scope: !198)
!202 = !DILocation(line: 118, column: 17, scope: !198)
!203 = !DILocation(line: 118, column: 9, scope: !198)
!204 = !DILocation(line: 119, column: 9, scope: !198)
!205 = !DILocation(line: 119, column: 21, scope: !198)
!206 = !DILocation(line: 121, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !198, file: !17, line: 121, column: 9)
!208 = !DILocation(line: 121, column: 14, scope: !207)
!209 = !DILocation(line: 121, column: 21, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !17, line: 121, column: 9)
!211 = !DILocation(line: 121, column: 23, scope: !210)
!212 = !DILocation(line: 121, column: 9, scope: !207)
!213 = !DILocation(line: 123, column: 23, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !17, line: 122, column: 9)
!215 = !DILocation(line: 123, column: 28, scope: !214)
!216 = !DILocation(line: 123, column: 18, scope: !214)
!217 = !DILocation(line: 123, column: 13, scope: !214)
!218 = !DILocation(line: 123, column: 21, scope: !214)
!219 = !DILocation(line: 124, column: 9, scope: !214)
!220 = !DILocation(line: 121, column: 31, scope: !210)
!221 = !DILocation(line: 121, column: 9, scope: !210)
!222 = distinct !{!222, !212, !223, !79}
!223 = !DILocation(line: 124, column: 9, scope: !207)
!224 = !DILocation(line: 126, column: 9, scope: !198)
!225 = !DILocation(line: 126, column: 21, scope: !198)
!226 = !DILocation(line: 127, column: 20, scope: !198)
!227 = !DILocation(line: 127, column: 9, scope: !198)
!228 = !DILocation(line: 131, column: 1, scope: !170)
