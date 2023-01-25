; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !59
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx5, align 4, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !63
  store i64 %call7, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !68
  %6 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp8 = icmp ult i64 %5, %6, !dbg !71
  br i1 %cmp8, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !73
  %8 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !73
  %9 = load i32, i32* %arrayidx9, align 4, !dbg !73
  %10 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !77
  store i32 %9, i32* %arrayidx10, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %11, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx11, align 4, !dbg !86
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  call void @printWLine(i32* %arraydecay12), !dbg !88
  %12 = load i32*, i32** %data, align 8, !dbg !89
  %13 = bitcast i32* %12 to i8*, !dbg !89
  call void @free(i8* %13) #6, !dbg !90
  ret void, !dbg !91
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_05_good() #0 !dbg !92 {
entry:
  call void @goodG2B1(), !dbg !93
  call void @goodG2B2(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #6, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #6, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_05_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_05_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32* null, i32** %data, align 8, !dbg !119
  %0 = load i32, i32* @staticFalse, align 4, !dbg !120
  %tobool = icmp ne i32 %0, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.else, !dbg !122

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !123
  br label %if.end3, !dbg !125

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !126
  %1 = bitcast i8* %call to i32*, !dbg !128
  store i32* %1, i32** %data, align 8, !dbg !129
  %2 = load i32*, i32** %data, align 8, !dbg !130
  %cmp = icmp eq i32* %2, null, !dbg !132
  br i1 %cmp, label %if.then1, label %if.end, !dbg !133

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !136
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !137
  %4 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx5, align 4, !dbg !150
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !152
  store i64 %call7, i64* %destLen, align 8, !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !157
  %6 = load i64, i64* %destLen, align 8, !dbg !159
  %cmp8 = icmp ult i64 %5, %6, !dbg !160
  br i1 %cmp8, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !162
  %8 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !162
  %9 = load i32, i32* %arrayidx9, align 4, !dbg !162
  %10 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !166
  store i32 %9, i32* %arrayidx10, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %11, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx11, align 4, !dbg !174
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay12), !dbg !176
  %12 = load i32*, i32** %data, align 8, !dbg !177
  %13 = bitcast i32* %12 to i8*, !dbg !177
  call void @free(i8* %13) #6, !dbg !178
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i32* null, i32** %data, align 8, !dbg !183
  %0 = load i32, i32* @staticTrue, align 4, !dbg !184
  %tobool = icmp ne i32 %0, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.end3, !dbg !186

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !187
  %1 = bitcast i8* %call to i32*, !dbg !189
  store i32* %1, i32** %data, align 8, !dbg !190
  %2 = load i32*, i32** %data, align 8, !dbg !191
  %cmp = icmp eq i32* %2, null, !dbg !193
  br i1 %cmp, label %if.then1, label %if.end, !dbg !194

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !195
  unreachable, !dbg !195

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !197
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !198
  %4 = load i32*, i32** %data, align 8, !dbg !199
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !199
  store i32 0, i32* %arrayidx, align 4, !dbg !200
  br label %if.end3, !dbg !201

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !202, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !205, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !207, metadata !DIExpression()), !dbg !208
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !209
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !210
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !211
  store i32 0, i32* %arrayidx5, align 4, !dbg !212
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !213
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !214
  store i64 %call7, i64* %destLen, align 8, !dbg !215
  store i64 0, i64* %i, align 8, !dbg !216
  br label %for.cond, !dbg !218

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !219
  %6 = load i64, i64* %destLen, align 8, !dbg !221
  %cmp8 = icmp ult i64 %5, %6, !dbg !222
  br i1 %cmp8, label %for.body, label %for.end, !dbg !223

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !224
  %8 = load i64, i64* %i, align 8, !dbg !226
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !224
  %9 = load i32, i32* %arrayidx9, align 4, !dbg !224
  %10 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !228
  store i32 %9, i32* %arrayidx10, align 4, !dbg !229
  br label %for.inc, !dbg !230

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !231
  %inc = add i64 %11, 1, !dbg !231
  store i64 %inc, i64* %i, align 8, !dbg !231
  br label %for.cond, !dbg !232, !llvm.loop !233

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !235
  store i32 0, i32* %arrayidx11, align 4, !dbg !236
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !237
  call void @printWLine(i32* %arraydecay12), !dbg !238
  %12 = load i32*, i32** %data, align 8, !dbg !239
  %13 = bitcast i32* %12 to i8*, !dbg !239
  call void @free(i8* %13) #6, !dbg !240
  ret void, !dbg !241
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocation(line: 37, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 16, scope: !32)
!34 = !DILocation(line: 37, column: 14, scope: !32)
!35 = !DILocation(line: 38, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 13)
!37 = !DILocation(line: 38, column: 18, scope: !36)
!38 = !DILocation(line: 38, column: 13, scope: !32)
!39 = !DILocation(line: 38, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 38, column: 27)
!41 = !DILocation(line: 39, column: 17, scope: !32)
!42 = !DILocation(line: 39, column: 9, scope: !32)
!43 = !DILocation(line: 40, column: 9, scope: !32)
!44 = !DILocation(line: 40, column: 20, scope: !32)
!45 = !DILocation(line: 41, column: 5, scope: !32)
!46 = !DILocalVariable(name: "i", scope: !47, file: !15, line: 43, type: !48)
!47 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 43, column: 16, scope: !47)
!51 = !DILocalVariable(name: "destLen", scope: !47, file: !15, line: 43, type: !48)
!52 = !DILocation(line: 43, column: 19, scope: !47)
!53 = !DILocalVariable(name: "dest", scope: !47, file: !15, line: 44, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 44, column: 17, scope: !47)
!58 = !DILocation(line: 45, column: 17, scope: !47)
!59 = !DILocation(line: 45, column: 9, scope: !47)
!60 = !DILocation(line: 46, column: 9, scope: !47)
!61 = !DILocation(line: 46, column: 21, scope: !47)
!62 = !DILocation(line: 47, column: 26, scope: !47)
!63 = !DILocation(line: 47, column: 19, scope: !47)
!64 = !DILocation(line: 47, column: 17, scope: !47)
!65 = !DILocation(line: 50, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !47, file: !15, line: 50, column: 9)
!67 = !DILocation(line: 50, column: 14, scope: !66)
!68 = !DILocation(line: 50, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 50, column: 9)
!70 = !DILocation(line: 50, column: 25, scope: !69)
!71 = !DILocation(line: 50, column: 23, scope: !69)
!72 = !DILocation(line: 50, column: 9, scope: !66)
!73 = !DILocation(line: 52, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !15, line: 51, column: 9)
!75 = !DILocation(line: 52, column: 28, scope: !74)
!76 = !DILocation(line: 52, column: 18, scope: !74)
!77 = !DILocation(line: 52, column: 13, scope: !74)
!78 = !DILocation(line: 52, column: 21, scope: !74)
!79 = !DILocation(line: 53, column: 9, scope: !74)
!80 = !DILocation(line: 50, column: 35, scope: !69)
!81 = !DILocation(line: 50, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 53, column: 9, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 54, column: 9, scope: !47)
!86 = !DILocation(line: 54, column: 21, scope: !47)
!87 = !DILocation(line: 55, column: 20, scope: !47)
!88 = !DILocation(line: 55, column: 9, scope: !47)
!89 = !DILocation(line: 56, column: 14, scope: !47)
!90 = !DILocation(line: 56, column: 9, scope: !47)
!91 = !DILocation(line: 58, column: 1, scope: !22)
!92 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_05_good", scope: !15, file: !15, line: 131, type: !23, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 133, column: 5, scope: !92)
!94 = !DILocation(line: 134, column: 5, scope: !92)
!95 = !DILocation(line: 135, column: 1, scope: !92)
!96 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 147, type: !97, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DISubroutineType(types: !98)
!98 = !{!9, !9, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !15, line: 147, type: !9)
!103 = !DILocation(line: 147, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !15, line: 147, type: !99)
!105 = !DILocation(line: 147, column: 27, scope: !96)
!106 = !DILocation(line: 150, column: 22, scope: !96)
!107 = !DILocation(line: 150, column: 12, scope: !96)
!108 = !DILocation(line: 150, column: 5, scope: !96)
!109 = !DILocation(line: 152, column: 5, scope: !96)
!110 = !DILocation(line: 153, column: 5, scope: !96)
!111 = !DILocation(line: 154, column: 5, scope: !96)
!112 = !DILocation(line: 157, column: 5, scope: !96)
!113 = !DILocation(line: 158, column: 5, scope: !96)
!114 = !DILocation(line: 159, column: 5, scope: !96)
!115 = !DILocation(line: 161, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 65, type: !23, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 67, type: !6)
!118 = !DILocation(line: 67, column: 15, scope: !116)
!119 = !DILocation(line: 68, column: 10, scope: !116)
!120 = !DILocation(line: 69, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !15, line: 69, column: 8)
!122 = !DILocation(line: 69, column: 8, scope: !116)
!123 = !DILocation(line: 72, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 70, column: 5)
!125 = !DILocation(line: 73, column: 5, scope: !124)
!126 = !DILocation(line: 77, column: 27, scope: !127)
!127 = distinct !DILexicalBlock(scope: !121, file: !15, line: 75, column: 5)
!128 = !DILocation(line: 77, column: 16, scope: !127)
!129 = !DILocation(line: 77, column: 14, scope: !127)
!130 = !DILocation(line: 78, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 78, column: 13)
!132 = !DILocation(line: 78, column: 18, scope: !131)
!133 = !DILocation(line: 78, column: 13, scope: !127)
!134 = !DILocation(line: 78, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 78, column: 27)
!136 = !DILocation(line: 79, column: 17, scope: !127)
!137 = !DILocation(line: 79, column: 9, scope: !127)
!138 = !DILocation(line: 80, column: 9, scope: !127)
!139 = !DILocation(line: 80, column: 21, scope: !127)
!140 = !DILocalVariable(name: "i", scope: !141, file: !15, line: 83, type: !48)
!141 = distinct !DILexicalBlock(scope: !116, file: !15, line: 82, column: 5)
!142 = !DILocation(line: 83, column: 16, scope: !141)
!143 = !DILocalVariable(name: "destLen", scope: !141, file: !15, line: 83, type: !48)
!144 = !DILocation(line: 83, column: 19, scope: !141)
!145 = !DILocalVariable(name: "dest", scope: !141, file: !15, line: 84, type: !54)
!146 = !DILocation(line: 84, column: 17, scope: !141)
!147 = !DILocation(line: 85, column: 17, scope: !141)
!148 = !DILocation(line: 85, column: 9, scope: !141)
!149 = !DILocation(line: 86, column: 9, scope: !141)
!150 = !DILocation(line: 86, column: 21, scope: !141)
!151 = !DILocation(line: 87, column: 26, scope: !141)
!152 = !DILocation(line: 87, column: 19, scope: !141)
!153 = !DILocation(line: 87, column: 17, scope: !141)
!154 = !DILocation(line: 90, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !141, file: !15, line: 90, column: 9)
!156 = !DILocation(line: 90, column: 14, scope: !155)
!157 = !DILocation(line: 90, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 90, column: 9)
!159 = !DILocation(line: 90, column: 25, scope: !158)
!160 = !DILocation(line: 90, column: 23, scope: !158)
!161 = !DILocation(line: 90, column: 9, scope: !155)
!162 = !DILocation(line: 92, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !15, line: 91, column: 9)
!164 = !DILocation(line: 92, column: 28, scope: !163)
!165 = !DILocation(line: 92, column: 18, scope: !163)
!166 = !DILocation(line: 92, column: 13, scope: !163)
!167 = !DILocation(line: 92, column: 21, scope: !163)
!168 = !DILocation(line: 93, column: 9, scope: !163)
!169 = !DILocation(line: 90, column: 35, scope: !158)
!170 = !DILocation(line: 90, column: 9, scope: !158)
!171 = distinct !{!171, !161, !172, !84}
!172 = !DILocation(line: 93, column: 9, scope: !155)
!173 = !DILocation(line: 94, column: 9, scope: !141)
!174 = !DILocation(line: 94, column: 21, scope: !141)
!175 = !DILocation(line: 95, column: 20, scope: !141)
!176 = !DILocation(line: 95, column: 9, scope: !141)
!177 = !DILocation(line: 96, column: 14, scope: !141)
!178 = !DILocation(line: 96, column: 9, scope: !141)
!179 = !DILocation(line: 98, column: 1, scope: !116)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 101, type: !23, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocalVariable(name: "data", scope: !180, file: !15, line: 103, type: !6)
!182 = !DILocation(line: 103, column: 15, scope: !180)
!183 = !DILocation(line: 104, column: 10, scope: !180)
!184 = !DILocation(line: 105, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !15, line: 105, column: 8)
!186 = !DILocation(line: 105, column: 8, scope: !180)
!187 = !DILocation(line: 108, column: 27, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !15, line: 106, column: 5)
!189 = !DILocation(line: 108, column: 16, scope: !188)
!190 = !DILocation(line: 108, column: 14, scope: !188)
!191 = !DILocation(line: 109, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !15, line: 109, column: 13)
!193 = !DILocation(line: 109, column: 18, scope: !192)
!194 = !DILocation(line: 109, column: 13, scope: !188)
!195 = !DILocation(line: 109, column: 28, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !15, line: 109, column: 27)
!197 = !DILocation(line: 110, column: 17, scope: !188)
!198 = !DILocation(line: 110, column: 9, scope: !188)
!199 = !DILocation(line: 111, column: 9, scope: !188)
!200 = !DILocation(line: 111, column: 21, scope: !188)
!201 = !DILocation(line: 112, column: 5, scope: !188)
!202 = !DILocalVariable(name: "i", scope: !203, file: !15, line: 114, type: !48)
!203 = distinct !DILexicalBlock(scope: !180, file: !15, line: 113, column: 5)
!204 = !DILocation(line: 114, column: 16, scope: !203)
!205 = !DILocalVariable(name: "destLen", scope: !203, file: !15, line: 114, type: !48)
!206 = !DILocation(line: 114, column: 19, scope: !203)
!207 = !DILocalVariable(name: "dest", scope: !203, file: !15, line: 115, type: !54)
!208 = !DILocation(line: 115, column: 17, scope: !203)
!209 = !DILocation(line: 116, column: 17, scope: !203)
!210 = !DILocation(line: 116, column: 9, scope: !203)
!211 = !DILocation(line: 117, column: 9, scope: !203)
!212 = !DILocation(line: 117, column: 21, scope: !203)
!213 = !DILocation(line: 118, column: 26, scope: !203)
!214 = !DILocation(line: 118, column: 19, scope: !203)
!215 = !DILocation(line: 118, column: 17, scope: !203)
!216 = !DILocation(line: 121, column: 16, scope: !217)
!217 = distinct !DILexicalBlock(scope: !203, file: !15, line: 121, column: 9)
!218 = !DILocation(line: 121, column: 14, scope: !217)
!219 = !DILocation(line: 121, column: 21, scope: !220)
!220 = distinct !DILexicalBlock(scope: !217, file: !15, line: 121, column: 9)
!221 = !DILocation(line: 121, column: 25, scope: !220)
!222 = !DILocation(line: 121, column: 23, scope: !220)
!223 = !DILocation(line: 121, column: 9, scope: !217)
!224 = !DILocation(line: 123, column: 23, scope: !225)
!225 = distinct !DILexicalBlock(scope: !220, file: !15, line: 122, column: 9)
!226 = !DILocation(line: 123, column: 28, scope: !225)
!227 = !DILocation(line: 123, column: 18, scope: !225)
!228 = !DILocation(line: 123, column: 13, scope: !225)
!229 = !DILocation(line: 123, column: 21, scope: !225)
!230 = !DILocation(line: 124, column: 9, scope: !225)
!231 = !DILocation(line: 121, column: 35, scope: !220)
!232 = !DILocation(line: 121, column: 9, scope: !220)
!233 = distinct !{!233, !223, !234, !84}
!234 = !DILocation(line: 124, column: 9, scope: !217)
!235 = !DILocation(line: 125, column: 9, scope: !203)
!236 = !DILocation(line: 125, column: 21, scope: !203)
!237 = !DILocation(line: 126, column: 20, scope: !203)
!238 = !DILocation(line: 126, column: 9, scope: !203)
!239 = !DILocation(line: 127, column: 14, scope: !203)
!240 = !DILocation(line: 127, column: 9, scope: !203)
!241 = !DILocation(line: 129, column: 1, scope: !180)
