; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_04.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_04_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !55
  store i64 %call5, i64* %destLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !60
  %5 = load i64, i64* %destLen, align 8, !dbg !62
  %cmp6 = icmp ult i64 %4, %5, !dbg !63
  br i1 %cmp6, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !65
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !65
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !69
  store i32 %8, i32* %arrayidx8, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %10, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx9, align 4, !dbg !78
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  call void @printWLine(i32* %arraydecay10), !dbg !80
  %11 = load i32*, i32** %data, align 8, !dbg !81
  %12 = bitcast i32* %11 to i8*, !dbg !81
  call void @free(i8* %12) #6, !dbg !82
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_04_good() #0 !dbg !84 {
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
  %call = call i64 @time(i64* null) #6, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #6, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_04_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_04_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !112
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %data, align 8, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !123
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !124
  %3 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx3, align 4, !dbg !137
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !139
  store i64 %call5, i64* %destLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !144
  %5 = load i64, i64* %destLen, align 8, !dbg !146
  %cmp6 = icmp ult i64 %4, %5, !dbg !147
  br i1 %cmp6, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !149
  %7 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !149
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !149
  %9 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !153
  store i32 %8, i32* %arrayidx8, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %10, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx9, align 4, !dbg !161
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  call void @printWLine(i32* %arraydecay10), !dbg !163
  %11 = load i32*, i32** %data, align 8, !dbg !164
  %12 = bitcast i32* %11 to i8*, !dbg !164
  call void @free(i8* %12) #6, !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !167 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !168, metadata !DIExpression()), !dbg !169
  store i32* null, i32** %data, align 8, !dbg !170
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !171
  %0 = bitcast i8* %call to i32*, !dbg !174
  store i32* %0, i32** %data, align 8, !dbg !175
  %1 = load i32*, i32** %data, align 8, !dbg !176
  %cmp = icmp eq i32* %1, null, !dbg !178
  br i1 %cmp, label %if.then, label %if.end, !dbg !179

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !182
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !183
  %3 = load i32*, i32** %data, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !184
  store i32 0, i32* %arrayidx, align 4, !dbg !185
  call void @llvm.dbg.declare(metadata i64* %i, metadata !186, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !191, metadata !DIExpression()), !dbg !192
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !193
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !194
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !195
  store i32 0, i32* %arrayidx3, align 4, !dbg !196
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !197
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !198
  store i64 %call5, i64* %destLen, align 8, !dbg !199
  store i64 0, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !202

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !203
  %5 = load i64, i64* %destLen, align 8, !dbg !205
  %cmp6 = icmp ult i64 %4, %5, !dbg !206
  br i1 %cmp6, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !208
  %7 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !208
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !208
  %9 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !212
  store i32 %8, i32* %arrayidx8, align 4, !dbg !213
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !215
  %inc = add i64 %10, 1, !dbg !215
  store i64 %inc, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !216, !llvm.loop !217

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !219
  store i32 0, i32* %arrayidx9, align 4, !dbg !220
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !221
  call void @printWLine(i32* %arraydecay10), !dbg !222
  %11 = load i32*, i32** %data, align 8, !dbg !223
  %12 = bitcast i32* %11 to i8*, !dbg !223
  call void @free(i8* %12) #6, !dbg !224
  ret void, !dbg !225
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_04_bad", scope: !17, file: !17, line: 30, type: !18, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 32, type: !4)
!21 = !DILocation(line: 32, column: 15, scope: !16)
!22 = !DILocation(line: 33, column: 10, scope: !16)
!23 = !DILocation(line: 37, column: 27, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 35, column: 5)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 8)
!26 = !DILocation(line: 37, column: 16, scope: !24)
!27 = !DILocation(line: 37, column: 14, scope: !24)
!28 = !DILocation(line: 38, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 38, column: 13)
!30 = !DILocation(line: 38, column: 18, scope: !29)
!31 = !DILocation(line: 38, column: 13, scope: !24)
!32 = !DILocation(line: 38, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 38, column: 27)
!34 = !DILocation(line: 39, column: 17, scope: !24)
!35 = !DILocation(line: 39, column: 9, scope: !24)
!36 = !DILocation(line: 40, column: 9, scope: !24)
!37 = !DILocation(line: 40, column: 20, scope: !24)
!38 = !DILocalVariable(name: "i", scope: !39, file: !17, line: 43, type: !40)
!39 = distinct !DILexicalBlock(scope: !16, file: !17, line: 42, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 43, column: 16, scope: !39)
!43 = !DILocalVariable(name: "destLen", scope: !39, file: !17, line: 43, type: !40)
!44 = !DILocation(line: 43, column: 19, scope: !39)
!45 = !DILocalVariable(name: "dest", scope: !39, file: !17, line: 44, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 44, column: 17, scope: !39)
!50 = !DILocation(line: 45, column: 17, scope: !39)
!51 = !DILocation(line: 45, column: 9, scope: !39)
!52 = !DILocation(line: 46, column: 9, scope: !39)
!53 = !DILocation(line: 46, column: 21, scope: !39)
!54 = !DILocation(line: 47, column: 26, scope: !39)
!55 = !DILocation(line: 47, column: 19, scope: !39)
!56 = !DILocation(line: 47, column: 17, scope: !39)
!57 = !DILocation(line: 50, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !39, file: !17, line: 50, column: 9)
!59 = !DILocation(line: 50, column: 14, scope: !58)
!60 = !DILocation(line: 50, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !17, line: 50, column: 9)
!62 = !DILocation(line: 50, column: 25, scope: !61)
!63 = !DILocation(line: 50, column: 23, scope: !61)
!64 = !DILocation(line: 50, column: 9, scope: !58)
!65 = !DILocation(line: 52, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !17, line: 51, column: 9)
!67 = !DILocation(line: 52, column: 28, scope: !66)
!68 = !DILocation(line: 52, column: 18, scope: !66)
!69 = !DILocation(line: 52, column: 13, scope: !66)
!70 = !DILocation(line: 52, column: 21, scope: !66)
!71 = !DILocation(line: 53, column: 9, scope: !66)
!72 = !DILocation(line: 50, column: 35, scope: !61)
!73 = !DILocation(line: 50, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 53, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 54, column: 9, scope: !39)
!78 = !DILocation(line: 54, column: 21, scope: !39)
!79 = !DILocation(line: 55, column: 20, scope: !39)
!80 = !DILocation(line: 55, column: 9, scope: !39)
!81 = !DILocation(line: 56, column: 14, scope: !39)
!82 = !DILocation(line: 56, column: 9, scope: !39)
!83 = !DILocation(line: 58, column: 1, scope: !16)
!84 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_04_good", scope: !17, file: !17, line: 131, type: !18, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 133, column: 5, scope: !84)
!86 = !DILocation(line: 134, column: 5, scope: !84)
!87 = !DILocation(line: 135, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 147, type: !89, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !17, line: 147, type: !7)
!95 = !DILocation(line: 147, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !17, line: 147, type: !91)
!97 = !DILocation(line: 147, column: 27, scope: !88)
!98 = !DILocation(line: 150, column: 22, scope: !88)
!99 = !DILocation(line: 150, column: 12, scope: !88)
!100 = !DILocation(line: 150, column: 5, scope: !88)
!101 = !DILocation(line: 152, column: 5, scope: !88)
!102 = !DILocation(line: 153, column: 5, scope: !88)
!103 = !DILocation(line: 154, column: 5, scope: !88)
!104 = !DILocation(line: 157, column: 5, scope: !88)
!105 = !DILocation(line: 158, column: 5, scope: !88)
!106 = !DILocation(line: 159, column: 5, scope: !88)
!107 = !DILocation(line: 161, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 65, type: !18, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 67, type: !4)
!110 = !DILocation(line: 67, column: 15, scope: !108)
!111 = !DILocation(line: 68, column: 10, scope: !108)
!112 = !DILocation(line: 77, column: 27, scope: !113)
!113 = distinct !DILexicalBlock(scope: !114, file: !17, line: 75, column: 5)
!114 = distinct !DILexicalBlock(scope: !108, file: !17, line: 69, column: 8)
!115 = !DILocation(line: 77, column: 16, scope: !113)
!116 = !DILocation(line: 77, column: 14, scope: !113)
!117 = !DILocation(line: 78, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !17, line: 78, column: 13)
!119 = !DILocation(line: 78, column: 18, scope: !118)
!120 = !DILocation(line: 78, column: 13, scope: !113)
!121 = !DILocation(line: 78, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 78, column: 27)
!123 = !DILocation(line: 79, column: 17, scope: !113)
!124 = !DILocation(line: 79, column: 9, scope: !113)
!125 = !DILocation(line: 80, column: 9, scope: !113)
!126 = !DILocation(line: 80, column: 21, scope: !113)
!127 = !DILocalVariable(name: "i", scope: !128, file: !17, line: 83, type: !40)
!128 = distinct !DILexicalBlock(scope: !108, file: !17, line: 82, column: 5)
!129 = !DILocation(line: 83, column: 16, scope: !128)
!130 = !DILocalVariable(name: "destLen", scope: !128, file: !17, line: 83, type: !40)
!131 = !DILocation(line: 83, column: 19, scope: !128)
!132 = !DILocalVariable(name: "dest", scope: !128, file: !17, line: 84, type: !46)
!133 = !DILocation(line: 84, column: 17, scope: !128)
!134 = !DILocation(line: 85, column: 17, scope: !128)
!135 = !DILocation(line: 85, column: 9, scope: !128)
!136 = !DILocation(line: 86, column: 9, scope: !128)
!137 = !DILocation(line: 86, column: 21, scope: !128)
!138 = !DILocation(line: 87, column: 26, scope: !128)
!139 = !DILocation(line: 87, column: 19, scope: !128)
!140 = !DILocation(line: 87, column: 17, scope: !128)
!141 = !DILocation(line: 90, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !128, file: !17, line: 90, column: 9)
!143 = !DILocation(line: 90, column: 14, scope: !142)
!144 = !DILocation(line: 90, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !17, line: 90, column: 9)
!146 = !DILocation(line: 90, column: 25, scope: !145)
!147 = !DILocation(line: 90, column: 23, scope: !145)
!148 = !DILocation(line: 90, column: 9, scope: !142)
!149 = !DILocation(line: 92, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !17, line: 91, column: 9)
!151 = !DILocation(line: 92, column: 28, scope: !150)
!152 = !DILocation(line: 92, column: 18, scope: !150)
!153 = !DILocation(line: 92, column: 13, scope: !150)
!154 = !DILocation(line: 92, column: 21, scope: !150)
!155 = !DILocation(line: 93, column: 9, scope: !150)
!156 = !DILocation(line: 90, column: 35, scope: !145)
!157 = !DILocation(line: 90, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !76}
!159 = !DILocation(line: 93, column: 9, scope: !142)
!160 = !DILocation(line: 94, column: 9, scope: !128)
!161 = !DILocation(line: 94, column: 21, scope: !128)
!162 = !DILocation(line: 95, column: 20, scope: !128)
!163 = !DILocation(line: 95, column: 9, scope: !128)
!164 = !DILocation(line: 96, column: 14, scope: !128)
!165 = !DILocation(line: 96, column: 9, scope: !128)
!166 = !DILocation(line: 98, column: 1, scope: !108)
!167 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 101, type: !18, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!168 = !DILocalVariable(name: "data", scope: !167, file: !17, line: 103, type: !4)
!169 = !DILocation(line: 103, column: 15, scope: !167)
!170 = !DILocation(line: 104, column: 10, scope: !167)
!171 = !DILocation(line: 108, column: 27, scope: !172)
!172 = distinct !DILexicalBlock(scope: !173, file: !17, line: 106, column: 5)
!173 = distinct !DILexicalBlock(scope: !167, file: !17, line: 105, column: 8)
!174 = !DILocation(line: 108, column: 16, scope: !172)
!175 = !DILocation(line: 108, column: 14, scope: !172)
!176 = !DILocation(line: 109, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !17, line: 109, column: 13)
!178 = !DILocation(line: 109, column: 18, scope: !177)
!179 = !DILocation(line: 109, column: 13, scope: !172)
!180 = !DILocation(line: 109, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !17, line: 109, column: 27)
!182 = !DILocation(line: 110, column: 17, scope: !172)
!183 = !DILocation(line: 110, column: 9, scope: !172)
!184 = !DILocation(line: 111, column: 9, scope: !172)
!185 = !DILocation(line: 111, column: 21, scope: !172)
!186 = !DILocalVariable(name: "i", scope: !187, file: !17, line: 114, type: !40)
!187 = distinct !DILexicalBlock(scope: !167, file: !17, line: 113, column: 5)
!188 = !DILocation(line: 114, column: 16, scope: !187)
!189 = !DILocalVariable(name: "destLen", scope: !187, file: !17, line: 114, type: !40)
!190 = !DILocation(line: 114, column: 19, scope: !187)
!191 = !DILocalVariable(name: "dest", scope: !187, file: !17, line: 115, type: !46)
!192 = !DILocation(line: 115, column: 17, scope: !187)
!193 = !DILocation(line: 116, column: 17, scope: !187)
!194 = !DILocation(line: 116, column: 9, scope: !187)
!195 = !DILocation(line: 117, column: 9, scope: !187)
!196 = !DILocation(line: 117, column: 21, scope: !187)
!197 = !DILocation(line: 118, column: 26, scope: !187)
!198 = !DILocation(line: 118, column: 19, scope: !187)
!199 = !DILocation(line: 118, column: 17, scope: !187)
!200 = !DILocation(line: 121, column: 16, scope: !201)
!201 = distinct !DILexicalBlock(scope: !187, file: !17, line: 121, column: 9)
!202 = !DILocation(line: 121, column: 14, scope: !201)
!203 = !DILocation(line: 121, column: 21, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !17, line: 121, column: 9)
!205 = !DILocation(line: 121, column: 25, scope: !204)
!206 = !DILocation(line: 121, column: 23, scope: !204)
!207 = !DILocation(line: 121, column: 9, scope: !201)
!208 = !DILocation(line: 123, column: 23, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !17, line: 122, column: 9)
!210 = !DILocation(line: 123, column: 28, scope: !209)
!211 = !DILocation(line: 123, column: 18, scope: !209)
!212 = !DILocation(line: 123, column: 13, scope: !209)
!213 = !DILocation(line: 123, column: 21, scope: !209)
!214 = !DILocation(line: 124, column: 9, scope: !209)
!215 = !DILocation(line: 121, column: 35, scope: !204)
!216 = !DILocation(line: 121, column: 9, scope: !204)
!217 = distinct !{!217, !207, !218, !76}
!218 = !DILocation(line: 124, column: 9, scope: !201)
!219 = !DILocation(line: 125, column: 9, scope: !187)
!220 = !DILocation(line: 125, column: 21, scope: !187)
!221 = !DILocation(line: 126, column: 20, scope: !187)
!222 = !DILocation(line: 126, column: 9, scope: !187)
!223 = !DILocation(line: 127, column: 14, scope: !187)
!224 = !DILocation(line: 127, column: 9, scope: !187)
!225 = !DILocation(line: 129, column: 1, scope: !167)
