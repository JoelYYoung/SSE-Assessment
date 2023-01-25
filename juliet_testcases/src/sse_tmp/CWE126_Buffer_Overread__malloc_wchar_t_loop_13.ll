; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end4, !dbg !26

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !27
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %data, align 8, !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %cmp1 = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !34

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end4, !dbg !41

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !55
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx6, align 4, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !59
  store i64 %call8, i64* %destLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !64
  %6 = load i64, i64* %destLen, align 8, !dbg !66
  %cmp9 = icmp ult i64 %5, %6, !dbg !67
  br i1 %cmp9, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !69
  %8 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx10 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !69
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !69
  %10 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !73
  store i32 %9, i32* %arrayidx11, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %11, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx12, align 4, !dbg !82
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  call void @printWLine(i32* %arraydecay13), !dbg !84
  %12 = load i32*, i32** %data, align 8, !dbg !85
  %13 = bitcast i32* %12 to i8*, !dbg !85
  call void @free(i8* %13) #6, !dbg !86
  ret void, !dbg !87
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_13_good() #0 !dbg !88 {
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
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_13_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_13_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !116
  %cmp = icmp ne i32 %0, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end4, !dbg !122

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !123
  %1 = bitcast i8* %call to i32*, !dbg !125
  store i32* %1, i32** %data, align 8, !dbg !126
  %2 = load i32*, i32** %data, align 8, !dbg !127
  %cmp1 = icmp eq i32* %2, null, !dbg !129
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !130

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !131
  unreachable, !dbg !131

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !134
  %4 = load i32*, i32** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !145
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx6, align 4, !dbg !147
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !149
  store i64 %call8, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !154
  %6 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp9 = icmp ult i64 %5, %6, !dbg !157
  br i1 %cmp9, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !159
  %8 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx10 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !159
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !159
  %10 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !163
  store i32 %9, i32* %arrayidx11, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %11, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx12, align 4, !dbg !171
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  call void @printWLine(i32* %arraydecay13), !dbg !173
  %12 = load i32*, i32** %data, align 8, !dbg !174
  %13 = bitcast i32* %12 to i8*, !dbg !174
  call void @free(i8* %13) #6, !dbg !175
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !177 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !178, metadata !DIExpression()), !dbg !179
  store i32* null, i32** %data, align 8, !dbg !180
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !181
  %cmp = icmp eq i32 %0, 5, !dbg !183
  br i1 %cmp, label %if.then, label %if.end4, !dbg !184

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !185
  %1 = bitcast i8* %call to i32*, !dbg !187
  store i32* %1, i32** %data, align 8, !dbg !188
  %2 = load i32*, i32** %data, align 8, !dbg !189
  %cmp1 = icmp eq i32* %2, null, !dbg !191
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !192

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !193
  unreachable, !dbg !193

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !195
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !196
  %4 = load i32*, i32** %data, align 8, !dbg !197
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !197
  store i32 0, i32* %arrayidx, align 4, !dbg !198
  br label %if.end4, !dbg !199

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !205, metadata !DIExpression()), !dbg !206
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !207
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !208
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !209
  store i32 0, i32* %arrayidx6, align 4, !dbg !210
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !211
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !212
  store i64 %call8, i64* %destLen, align 8, !dbg !213
  store i64 0, i64* %i, align 8, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !217
  %6 = load i64, i64* %destLen, align 8, !dbg !219
  %cmp9 = icmp ult i64 %5, %6, !dbg !220
  br i1 %cmp9, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !222
  %8 = load i64, i64* %i, align 8, !dbg !224
  %arrayidx10 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !222
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !222
  %10 = load i64, i64* %i, align 8, !dbg !225
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !226
  store i32 %9, i32* %arrayidx11, align 4, !dbg !227
  br label %for.inc, !dbg !228

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !229
  %inc = add i64 %11, 1, !dbg !229
  store i64 %inc, i64* %i, align 8, !dbg !229
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !233
  store i32 0, i32* %arrayidx12, align 4, !dbg !234
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !235
  call void @printWLine(i32* %arraydecay13), !dbg !236
  %12 = load i32*, i32** %data, align 8, !dbg !237
  %13 = bitcast i32* %12 to i8*, !dbg !237
  call void @free(i8* %13) #6, !dbg !238
  ret void, !dbg !239
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 25, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocation(line: 30, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !28)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 17, scope: !28)
!38 = !DILocation(line: 32, column: 9, scope: !28)
!39 = !DILocation(line: 33, column: 9, scope: !28)
!40 = !DILocation(line: 33, column: 20, scope: !28)
!41 = !DILocation(line: 34, column: 5, scope: !28)
!42 = !DILocalVariable(name: "i", scope: !43, file: !17, line: 36, type: !44)
!43 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 36, column: 16, scope: !43)
!47 = !DILocalVariable(name: "destLen", scope: !43, file: !17, line: 36, type: !44)
!48 = !DILocation(line: 36, column: 19, scope: !43)
!49 = !DILocalVariable(name: "dest", scope: !43, file: !17, line: 37, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 37, column: 17, scope: !43)
!54 = !DILocation(line: 38, column: 17, scope: !43)
!55 = !DILocation(line: 38, column: 9, scope: !43)
!56 = !DILocation(line: 39, column: 9, scope: !43)
!57 = !DILocation(line: 39, column: 21, scope: !43)
!58 = !DILocation(line: 40, column: 26, scope: !43)
!59 = !DILocation(line: 40, column: 19, scope: !43)
!60 = !DILocation(line: 40, column: 17, scope: !43)
!61 = !DILocation(line: 43, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !43, file: !17, line: 43, column: 9)
!63 = !DILocation(line: 43, column: 14, scope: !62)
!64 = !DILocation(line: 43, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !17, line: 43, column: 9)
!66 = !DILocation(line: 43, column: 25, scope: !65)
!67 = !DILocation(line: 43, column: 23, scope: !65)
!68 = !DILocation(line: 43, column: 9, scope: !62)
!69 = !DILocation(line: 45, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !17, line: 44, column: 9)
!71 = !DILocation(line: 45, column: 28, scope: !70)
!72 = !DILocation(line: 45, column: 18, scope: !70)
!73 = !DILocation(line: 45, column: 13, scope: !70)
!74 = !DILocation(line: 45, column: 21, scope: !70)
!75 = !DILocation(line: 46, column: 9, scope: !70)
!76 = !DILocation(line: 43, column: 35, scope: !65)
!77 = !DILocation(line: 43, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 46, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 47, column: 9, scope: !43)
!82 = !DILocation(line: 47, column: 21, scope: !43)
!83 = !DILocation(line: 48, column: 20, scope: !43)
!84 = !DILocation(line: 48, column: 9, scope: !43)
!85 = !DILocation(line: 49, column: 14, scope: !43)
!86 = !DILocation(line: 49, column: 9, scope: !43)
!87 = !DILocation(line: 51, column: 1, scope: !16)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_13_good", scope: !17, file: !17, line: 124, type: !18, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 126, column: 5, scope: !88)
!90 = !DILocation(line: 127, column: 5, scope: !88)
!91 = !DILocation(line: 128, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 140, type: !93, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !17, line: 140, type: !7)
!99 = !DILocation(line: 140, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !17, line: 140, type: !95)
!101 = !DILocation(line: 140, column: 27, scope: !92)
!102 = !DILocation(line: 143, column: 22, scope: !92)
!103 = !DILocation(line: 143, column: 12, scope: !92)
!104 = !DILocation(line: 143, column: 5, scope: !92)
!105 = !DILocation(line: 145, column: 5, scope: !92)
!106 = !DILocation(line: 146, column: 5, scope: !92)
!107 = !DILocation(line: 147, column: 5, scope: !92)
!108 = !DILocation(line: 150, column: 5, scope: !92)
!109 = !DILocation(line: 151, column: 5, scope: !92)
!110 = !DILocation(line: 152, column: 5, scope: !92)
!111 = !DILocation(line: 154, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 60, type: !4)
!114 = !DILocation(line: 60, column: 15, scope: !112)
!115 = !DILocation(line: 61, column: 10, scope: !112)
!116 = !DILocation(line: 62, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !17, line: 62, column: 8)
!118 = !DILocation(line: 62, column: 25, scope: !117)
!119 = !DILocation(line: 62, column: 8, scope: !112)
!120 = !DILocation(line: 65, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 63, column: 5)
!122 = !DILocation(line: 66, column: 5, scope: !121)
!123 = !DILocation(line: 70, column: 27, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !17, line: 68, column: 5)
!125 = !DILocation(line: 70, column: 16, scope: !124)
!126 = !DILocation(line: 70, column: 14, scope: !124)
!127 = !DILocation(line: 71, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 71, column: 13)
!129 = !DILocation(line: 71, column: 18, scope: !128)
!130 = !DILocation(line: 71, column: 13, scope: !124)
!131 = !DILocation(line: 71, column: 28, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !17, line: 71, column: 27)
!133 = !DILocation(line: 72, column: 17, scope: !124)
!134 = !DILocation(line: 72, column: 9, scope: !124)
!135 = !DILocation(line: 73, column: 9, scope: !124)
!136 = !DILocation(line: 73, column: 21, scope: !124)
!137 = !DILocalVariable(name: "i", scope: !138, file: !17, line: 76, type: !44)
!138 = distinct !DILexicalBlock(scope: !112, file: !17, line: 75, column: 5)
!139 = !DILocation(line: 76, column: 16, scope: !138)
!140 = !DILocalVariable(name: "destLen", scope: !138, file: !17, line: 76, type: !44)
!141 = !DILocation(line: 76, column: 19, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !138, file: !17, line: 77, type: !50)
!143 = !DILocation(line: 77, column: 17, scope: !138)
!144 = !DILocation(line: 78, column: 17, scope: !138)
!145 = !DILocation(line: 78, column: 9, scope: !138)
!146 = !DILocation(line: 79, column: 9, scope: !138)
!147 = !DILocation(line: 79, column: 21, scope: !138)
!148 = !DILocation(line: 80, column: 26, scope: !138)
!149 = !DILocation(line: 80, column: 19, scope: !138)
!150 = !DILocation(line: 80, column: 17, scope: !138)
!151 = !DILocation(line: 83, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !138, file: !17, line: 83, column: 9)
!153 = !DILocation(line: 83, column: 14, scope: !152)
!154 = !DILocation(line: 83, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !17, line: 83, column: 9)
!156 = !DILocation(line: 83, column: 25, scope: !155)
!157 = !DILocation(line: 83, column: 23, scope: !155)
!158 = !DILocation(line: 83, column: 9, scope: !152)
!159 = !DILocation(line: 85, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !17, line: 84, column: 9)
!161 = !DILocation(line: 85, column: 28, scope: !160)
!162 = !DILocation(line: 85, column: 18, scope: !160)
!163 = !DILocation(line: 85, column: 13, scope: !160)
!164 = !DILocation(line: 85, column: 21, scope: !160)
!165 = !DILocation(line: 86, column: 9, scope: !160)
!166 = !DILocation(line: 83, column: 35, scope: !155)
!167 = !DILocation(line: 83, column: 9, scope: !155)
!168 = distinct !{!168, !158, !169, !80}
!169 = !DILocation(line: 86, column: 9, scope: !152)
!170 = !DILocation(line: 87, column: 9, scope: !138)
!171 = !DILocation(line: 87, column: 21, scope: !138)
!172 = !DILocation(line: 88, column: 20, scope: !138)
!173 = !DILocation(line: 88, column: 9, scope: !138)
!174 = !DILocation(line: 89, column: 14, scope: !138)
!175 = !DILocation(line: 89, column: 9, scope: !138)
!176 = !DILocation(line: 91, column: 1, scope: !112)
!177 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!178 = !DILocalVariable(name: "data", scope: !177, file: !17, line: 96, type: !4)
!179 = !DILocation(line: 96, column: 15, scope: !177)
!180 = !DILocation(line: 97, column: 10, scope: !177)
!181 = !DILocation(line: 98, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !17, line: 98, column: 8)
!183 = !DILocation(line: 98, column: 25, scope: !182)
!184 = !DILocation(line: 98, column: 8, scope: !177)
!185 = !DILocation(line: 101, column: 27, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !17, line: 99, column: 5)
!187 = !DILocation(line: 101, column: 16, scope: !186)
!188 = !DILocation(line: 101, column: 14, scope: !186)
!189 = !DILocation(line: 102, column: 13, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !17, line: 102, column: 13)
!191 = !DILocation(line: 102, column: 18, scope: !190)
!192 = !DILocation(line: 102, column: 13, scope: !186)
!193 = !DILocation(line: 102, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !17, line: 102, column: 27)
!195 = !DILocation(line: 103, column: 17, scope: !186)
!196 = !DILocation(line: 103, column: 9, scope: !186)
!197 = !DILocation(line: 104, column: 9, scope: !186)
!198 = !DILocation(line: 104, column: 21, scope: !186)
!199 = !DILocation(line: 105, column: 5, scope: !186)
!200 = !DILocalVariable(name: "i", scope: !201, file: !17, line: 107, type: !44)
!201 = distinct !DILexicalBlock(scope: !177, file: !17, line: 106, column: 5)
!202 = !DILocation(line: 107, column: 16, scope: !201)
!203 = !DILocalVariable(name: "destLen", scope: !201, file: !17, line: 107, type: !44)
!204 = !DILocation(line: 107, column: 19, scope: !201)
!205 = !DILocalVariable(name: "dest", scope: !201, file: !17, line: 108, type: !50)
!206 = !DILocation(line: 108, column: 17, scope: !201)
!207 = !DILocation(line: 109, column: 17, scope: !201)
!208 = !DILocation(line: 109, column: 9, scope: !201)
!209 = !DILocation(line: 110, column: 9, scope: !201)
!210 = !DILocation(line: 110, column: 21, scope: !201)
!211 = !DILocation(line: 111, column: 26, scope: !201)
!212 = !DILocation(line: 111, column: 19, scope: !201)
!213 = !DILocation(line: 111, column: 17, scope: !201)
!214 = !DILocation(line: 114, column: 16, scope: !215)
!215 = distinct !DILexicalBlock(scope: !201, file: !17, line: 114, column: 9)
!216 = !DILocation(line: 114, column: 14, scope: !215)
!217 = !DILocation(line: 114, column: 21, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !17, line: 114, column: 9)
!219 = !DILocation(line: 114, column: 25, scope: !218)
!220 = !DILocation(line: 114, column: 23, scope: !218)
!221 = !DILocation(line: 114, column: 9, scope: !215)
!222 = !DILocation(line: 116, column: 23, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !17, line: 115, column: 9)
!224 = !DILocation(line: 116, column: 28, scope: !223)
!225 = !DILocation(line: 116, column: 18, scope: !223)
!226 = !DILocation(line: 116, column: 13, scope: !223)
!227 = !DILocation(line: 116, column: 21, scope: !223)
!228 = !DILocation(line: 117, column: 9, scope: !223)
!229 = !DILocation(line: 114, column: 35, scope: !218)
!230 = !DILocation(line: 114, column: 9, scope: !218)
!231 = distinct !{!231, !221, !232, !80}
!232 = !DILocation(line: 117, column: 9, scope: !215)
!233 = !DILocation(line: 118, column: 9, scope: !201)
!234 = !DILocation(line: 118, column: 21, scope: !201)
!235 = !DILocation(line: 119, column: 20, scope: !201)
!236 = !DILocation(line: 119, column: 9, scope: !201)
!237 = !DILocation(line: 120, column: 14, scope: !201)
!238 = !DILocation(line: 120, column: 9, scope: !201)
!239 = !DILocation(line: 122, column: 1, scope: !177)
