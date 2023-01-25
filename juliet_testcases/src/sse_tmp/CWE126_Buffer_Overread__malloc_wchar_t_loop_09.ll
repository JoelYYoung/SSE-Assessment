; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_09.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_09.c"
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_09_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !26
  %1 = bitcast i8* %call to i32*, !dbg !28
  store i32* %1, i32** %data, align 8, !dbg !29
  %2 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %2, null, !dbg !32
  br i1 %cmp, label %if.then1, label %if.end, !dbg !33

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !54
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !58
  store i64 %call7, i64* %destLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !63
  %6 = load i64, i64* %destLen, align 8, !dbg !65
  %cmp8 = icmp ult i64 %5, %6, !dbg !66
  br i1 %cmp8, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !68
  %9 = load i32, i32* %arrayidx9, align 4, !dbg !68
  %10 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !72
  store i32 %9, i32* %arrayidx10, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %11, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx11, align 4, !dbg !81
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !82
  call void @printWLine(i32* %arraydecay12), !dbg !83
  %12 = load i32*, i32** %data, align 8, !dbg !84
  %13 = bitcast i32* %12 to i8*, !dbg !84
  call void @free(i8* %13) #6, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_09_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #6, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #6, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_09_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_09_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i32* null, i32** %data, align 8, !dbg !114
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end3, !dbg !120

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !121
  %1 = bitcast i8* %call to i32*, !dbg !123
  store i32* %1, i32** %data, align 8, !dbg !124
  %2 = load i32*, i32** %data, align 8, !dbg !125
  %cmp = icmp eq i32* %2, null, !dbg !127
  br i1 %cmp, label %if.then1, label %if.end, !dbg !128

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !131
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !132
  %4 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !143
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx5, align 4, !dbg !145
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !147
  store i64 %call7, i64* %destLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !152
  %6 = load i64, i64* %destLen, align 8, !dbg !154
  %cmp8 = icmp ult i64 %5, %6, !dbg !155
  br i1 %cmp8, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !157
  %8 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !157
  %9 = load i32, i32* %arrayidx9, align 4, !dbg !157
  %10 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !161
  store i32 %9, i32* %arrayidx10, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %11, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx11, align 4, !dbg !169
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay12), !dbg !171
  %12 = load i32*, i32** %data, align 8, !dbg !172
  %13 = bitcast i32* %12 to i8*, !dbg !172
  call void @free(i8* %13) #6, !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !175 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !176, metadata !DIExpression()), !dbg !177
  store i32* null, i32** %data, align 8, !dbg !178
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !179
  %tobool = icmp ne i32 %0, 0, !dbg !179
  br i1 %tobool, label %if.then, label %if.end3, !dbg !181

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !182
  %1 = bitcast i8* %call to i32*, !dbg !184
  store i32* %1, i32** %data, align 8, !dbg !185
  %2 = load i32*, i32** %data, align 8, !dbg !186
  %cmp = icmp eq i32* %2, null, !dbg !188
  br i1 %cmp, label %if.then1, label %if.end, !dbg !189

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !190
  unreachable, !dbg !190

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !192
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !193
  %4 = load i32*, i32** %data, align 8, !dbg !194
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !194
  store i32 0, i32* %arrayidx, align 4, !dbg !195
  br label %if.end3, !dbg !196

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !197, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !200, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !202, metadata !DIExpression()), !dbg !203
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !204
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !205
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !206
  store i32 0, i32* %arrayidx5, align 4, !dbg !207
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !208
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !209
  store i64 %call7, i64* %destLen, align 8, !dbg !210
  store i64 0, i64* %i, align 8, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !214
  %6 = load i64, i64* %destLen, align 8, !dbg !216
  %cmp8 = icmp ult i64 %5, %6, !dbg !217
  br i1 %cmp8, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !219
  %8 = load i64, i64* %i, align 8, !dbg !221
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !219
  %9 = load i32, i32* %arrayidx9, align 4, !dbg !219
  %10 = load i64, i64* %i, align 8, !dbg !222
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !223
  store i32 %9, i32* %arrayidx10, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !226
  %inc = add i64 %11, 1, !dbg !226
  store i64 %inc, i64* %i, align 8, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !230
  store i32 0, i32* %arrayidx11, align 4, !dbg !231
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !232
  call void @printWLine(i32* %arraydecay12), !dbg !233
  %12 = load i32*, i32** %data, align 8, !dbg !234
  %13 = bitcast i32* %12 to i8*, !dbg !234
  call void @free(i8* %13) #6, !dbg !235
  ret void, !dbg !236
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_09_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 17, scope: !27)
!37 = !DILocation(line: 32, column: 9, scope: !27)
!38 = !DILocation(line: 33, column: 9, scope: !27)
!39 = !DILocation(line: 33, column: 20, scope: !27)
!40 = !DILocation(line: 34, column: 5, scope: !27)
!41 = !DILocalVariable(name: "i", scope: !42, file: !17, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 16, scope: !42)
!46 = !DILocalVariable(name: "destLen", scope: !42, file: !17, line: 36, type: !43)
!47 = !DILocation(line: 36, column: 19, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 37, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 37, column: 17, scope: !42)
!53 = !DILocation(line: 38, column: 17, scope: !42)
!54 = !DILocation(line: 38, column: 9, scope: !42)
!55 = !DILocation(line: 39, column: 9, scope: !42)
!56 = !DILocation(line: 39, column: 21, scope: !42)
!57 = !DILocation(line: 40, column: 26, scope: !42)
!58 = !DILocation(line: 40, column: 19, scope: !42)
!59 = !DILocation(line: 40, column: 17, scope: !42)
!60 = !DILocation(line: 43, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !42, file: !17, line: 43, column: 9)
!62 = !DILocation(line: 43, column: 14, scope: !61)
!63 = !DILocation(line: 43, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !17, line: 43, column: 9)
!65 = !DILocation(line: 43, column: 25, scope: !64)
!66 = !DILocation(line: 43, column: 23, scope: !64)
!67 = !DILocation(line: 43, column: 9, scope: !61)
!68 = !DILocation(line: 45, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !17, line: 44, column: 9)
!70 = !DILocation(line: 45, column: 28, scope: !69)
!71 = !DILocation(line: 45, column: 18, scope: !69)
!72 = !DILocation(line: 45, column: 13, scope: !69)
!73 = !DILocation(line: 45, column: 21, scope: !69)
!74 = !DILocation(line: 46, column: 9, scope: !69)
!75 = !DILocation(line: 43, column: 35, scope: !64)
!76 = !DILocation(line: 43, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 46, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 47, column: 9, scope: !42)
!81 = !DILocation(line: 47, column: 21, scope: !42)
!82 = !DILocation(line: 48, column: 20, scope: !42)
!83 = !DILocation(line: 48, column: 9, scope: !42)
!84 = !DILocation(line: 49, column: 14, scope: !42)
!85 = !DILocation(line: 49, column: 9, scope: !42)
!86 = !DILocation(line: 51, column: 1, scope: !16)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_09_good", scope: !17, file: !17, line: 124, type: !18, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 126, column: 5, scope: !87)
!89 = !DILocation(line: 127, column: 5, scope: !87)
!90 = !DILocation(line: 128, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 140, type: !92, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !17, line: 140, type: !7)
!98 = !DILocation(line: 140, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !17, line: 140, type: !94)
!100 = !DILocation(line: 140, column: 27, scope: !91)
!101 = !DILocation(line: 143, column: 22, scope: !91)
!102 = !DILocation(line: 143, column: 12, scope: !91)
!103 = !DILocation(line: 143, column: 5, scope: !91)
!104 = !DILocation(line: 145, column: 5, scope: !91)
!105 = !DILocation(line: 146, column: 5, scope: !91)
!106 = !DILocation(line: 147, column: 5, scope: !91)
!107 = !DILocation(line: 150, column: 5, scope: !91)
!108 = !DILocation(line: 151, column: 5, scope: !91)
!109 = !DILocation(line: 152, column: 5, scope: !91)
!110 = !DILocation(line: 154, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 60, type: !4)
!113 = !DILocation(line: 60, column: 15, scope: !111)
!114 = !DILocation(line: 61, column: 10, scope: !111)
!115 = !DILocation(line: 62, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !17, line: 62, column: 8)
!117 = !DILocation(line: 62, column: 8, scope: !111)
!118 = !DILocation(line: 65, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !17, line: 63, column: 5)
!120 = !DILocation(line: 66, column: 5, scope: !119)
!121 = !DILocation(line: 70, column: 27, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !17, line: 68, column: 5)
!123 = !DILocation(line: 70, column: 16, scope: !122)
!124 = !DILocation(line: 70, column: 14, scope: !122)
!125 = !DILocation(line: 71, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !17, line: 71, column: 13)
!127 = !DILocation(line: 71, column: 18, scope: !126)
!128 = !DILocation(line: 71, column: 13, scope: !122)
!129 = !DILocation(line: 71, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 71, column: 27)
!131 = !DILocation(line: 72, column: 17, scope: !122)
!132 = !DILocation(line: 72, column: 9, scope: !122)
!133 = !DILocation(line: 73, column: 9, scope: !122)
!134 = !DILocation(line: 73, column: 21, scope: !122)
!135 = !DILocalVariable(name: "i", scope: !136, file: !17, line: 76, type: !43)
!136 = distinct !DILexicalBlock(scope: !111, file: !17, line: 75, column: 5)
!137 = !DILocation(line: 76, column: 16, scope: !136)
!138 = !DILocalVariable(name: "destLen", scope: !136, file: !17, line: 76, type: !43)
!139 = !DILocation(line: 76, column: 19, scope: !136)
!140 = !DILocalVariable(name: "dest", scope: !136, file: !17, line: 77, type: !49)
!141 = !DILocation(line: 77, column: 17, scope: !136)
!142 = !DILocation(line: 78, column: 17, scope: !136)
!143 = !DILocation(line: 78, column: 9, scope: !136)
!144 = !DILocation(line: 79, column: 9, scope: !136)
!145 = !DILocation(line: 79, column: 21, scope: !136)
!146 = !DILocation(line: 80, column: 26, scope: !136)
!147 = !DILocation(line: 80, column: 19, scope: !136)
!148 = !DILocation(line: 80, column: 17, scope: !136)
!149 = !DILocation(line: 83, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !136, file: !17, line: 83, column: 9)
!151 = !DILocation(line: 83, column: 14, scope: !150)
!152 = !DILocation(line: 83, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !17, line: 83, column: 9)
!154 = !DILocation(line: 83, column: 25, scope: !153)
!155 = !DILocation(line: 83, column: 23, scope: !153)
!156 = !DILocation(line: 83, column: 9, scope: !150)
!157 = !DILocation(line: 85, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !17, line: 84, column: 9)
!159 = !DILocation(line: 85, column: 28, scope: !158)
!160 = !DILocation(line: 85, column: 18, scope: !158)
!161 = !DILocation(line: 85, column: 13, scope: !158)
!162 = !DILocation(line: 85, column: 21, scope: !158)
!163 = !DILocation(line: 86, column: 9, scope: !158)
!164 = !DILocation(line: 83, column: 35, scope: !153)
!165 = !DILocation(line: 83, column: 9, scope: !153)
!166 = distinct !{!166, !156, !167, !79}
!167 = !DILocation(line: 86, column: 9, scope: !150)
!168 = !DILocation(line: 87, column: 9, scope: !136)
!169 = !DILocation(line: 87, column: 21, scope: !136)
!170 = !DILocation(line: 88, column: 20, scope: !136)
!171 = !DILocation(line: 88, column: 9, scope: !136)
!172 = !DILocation(line: 89, column: 14, scope: !136)
!173 = !DILocation(line: 89, column: 9, scope: !136)
!174 = !DILocation(line: 91, column: 1, scope: !111)
!175 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = !DILocalVariable(name: "data", scope: !175, file: !17, line: 96, type: !4)
!177 = !DILocation(line: 96, column: 15, scope: !175)
!178 = !DILocation(line: 97, column: 10, scope: !175)
!179 = !DILocation(line: 98, column: 8, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !17, line: 98, column: 8)
!181 = !DILocation(line: 98, column: 8, scope: !175)
!182 = !DILocation(line: 101, column: 27, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !17, line: 99, column: 5)
!184 = !DILocation(line: 101, column: 16, scope: !183)
!185 = !DILocation(line: 101, column: 14, scope: !183)
!186 = !DILocation(line: 102, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !17, line: 102, column: 13)
!188 = !DILocation(line: 102, column: 18, scope: !187)
!189 = !DILocation(line: 102, column: 13, scope: !183)
!190 = !DILocation(line: 102, column: 28, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !17, line: 102, column: 27)
!192 = !DILocation(line: 103, column: 17, scope: !183)
!193 = !DILocation(line: 103, column: 9, scope: !183)
!194 = !DILocation(line: 104, column: 9, scope: !183)
!195 = !DILocation(line: 104, column: 21, scope: !183)
!196 = !DILocation(line: 105, column: 5, scope: !183)
!197 = !DILocalVariable(name: "i", scope: !198, file: !17, line: 107, type: !43)
!198 = distinct !DILexicalBlock(scope: !175, file: !17, line: 106, column: 5)
!199 = !DILocation(line: 107, column: 16, scope: !198)
!200 = !DILocalVariable(name: "destLen", scope: !198, file: !17, line: 107, type: !43)
!201 = !DILocation(line: 107, column: 19, scope: !198)
!202 = !DILocalVariable(name: "dest", scope: !198, file: !17, line: 108, type: !49)
!203 = !DILocation(line: 108, column: 17, scope: !198)
!204 = !DILocation(line: 109, column: 17, scope: !198)
!205 = !DILocation(line: 109, column: 9, scope: !198)
!206 = !DILocation(line: 110, column: 9, scope: !198)
!207 = !DILocation(line: 110, column: 21, scope: !198)
!208 = !DILocation(line: 111, column: 26, scope: !198)
!209 = !DILocation(line: 111, column: 19, scope: !198)
!210 = !DILocation(line: 111, column: 17, scope: !198)
!211 = !DILocation(line: 114, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !198, file: !17, line: 114, column: 9)
!213 = !DILocation(line: 114, column: 14, scope: !212)
!214 = !DILocation(line: 114, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !17, line: 114, column: 9)
!216 = !DILocation(line: 114, column: 25, scope: !215)
!217 = !DILocation(line: 114, column: 23, scope: !215)
!218 = !DILocation(line: 114, column: 9, scope: !212)
!219 = !DILocation(line: 116, column: 23, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !17, line: 115, column: 9)
!221 = !DILocation(line: 116, column: 28, scope: !220)
!222 = !DILocation(line: 116, column: 18, scope: !220)
!223 = !DILocation(line: 116, column: 13, scope: !220)
!224 = !DILocation(line: 116, column: 21, scope: !220)
!225 = !DILocation(line: 117, column: 9, scope: !220)
!226 = !DILocation(line: 114, column: 35, scope: !215)
!227 = !DILocation(line: 114, column: 9, scope: !215)
!228 = distinct !{!228, !218, !229, !79}
!229 = !DILocation(line: 117, column: 9, scope: !212)
!230 = !DILocation(line: 118, column: 9, scope: !198)
!231 = !DILocation(line: 118, column: 21, scope: !198)
!232 = !DILocation(line: 119, column: 20, scope: !198)
!233 = !DILocation(line: 119, column: 9, scope: !198)
!234 = !DILocation(line: 120, column: 14, scope: !198)
!235 = !DILocation(line: 120, column: 9, scope: !198)
!236 = !DILocation(line: 122, column: 1, scope: !175)
