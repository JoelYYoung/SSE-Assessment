; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_wchar_t_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !50
  store i64 %call3, i64* %destLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !55
  %2 = load i64, i64* %destLen, align 8, !dbg !57
  %cmp = icmp ult i64 %1, %2, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !60
  %4 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !60
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !64
  store i32 %5, i32* %arrayidx5, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %7, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !72
  store i32 0, i32* %arrayidx6, align 4, !dbg !73
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !74
  call void @printWLine(i32* %arraydecay7), !dbg !75
  %8 = load i32*, i32** %data, align 8, !dbg !76
  %9 = bitcast i32* %8 to i8*, !dbg !76
  call void @free(i8* %9) #5, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  store i32 0, i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B1Global, align 4, !dbg !107
  %0 = load i32*, i32** %data, align 8, !dbg !108
  %call = call i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B1Source(i32* %0), !dbg !109
  store i32* %call, i32** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !119
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !123
  store i64 %call3, i64* %destLen, align 8, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !128
  %2 = load i64, i64* %destLen, align 8, !dbg !130
  %cmp = icmp ult i64 %1, %2, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %4 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !133
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !133
  %6 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !137
  store i32 %5, i32* %arrayidx5, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %7, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx6, align 4, !dbg !145
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  call void @printWLine(i32* %arraydecay7), !dbg !147
  %8 = load i32*, i32** %data, align 8, !dbg !148
  %9 = bitcast i32* %8 to i8*, !dbg !148
  call void @free(i8* %9) #5, !dbg !149
  ret void, !dbg !150
}

declare dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i32* null, i32** %data, align 8, !dbg !154
  store i32 1, i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B2Global, align 4, !dbg !155
  %0 = load i32*, i32** %data, align 8, !dbg !156
  %call = call i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B2Source(i32* %0), !dbg !157
  store i32* %call, i32** %data, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !166
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !167
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !171
  store i64 %call3, i64* %destLen, align 8, !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !176
  %2 = load i64, i64* %destLen, align 8, !dbg !178
  %cmp = icmp ult i64 %1, %2, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !181
  %4 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !181
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !181
  %6 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !185
  store i32 %5, i32* %arrayidx5, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %7, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !192
  store i32 0, i32* %arrayidx6, align 4, !dbg !193
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !194
  call void @printWLine(i32* %arraydecay7), !dbg !195
  %8 = load i32*, i32** %data, align 8, !dbg !196
  %9 = bitcast i32* %8 to i8*, !dbg !196
  call void @free(i8* %9) #5, !dbg !197
  ret void, !dbg !198
}

declare dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B1Global", scope: !2, file: !10, line: 57, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_22_goodG2B2Global", scope: !2, file: !10, line: 58, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 62, scope: !20)
!30 = !DILocation(line: 33, column: 69, scope: !20)
!31 = !DILocation(line: 33, column: 12, scope: !20)
!32 = !DILocation(line: 33, column: 10, scope: !20)
!33 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !36)
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 35, column: 16, scope: !34)
!38 = !DILocalVariable(name: "destLen", scope: !34, file: !10, line: 35, type: !35)
!39 = !DILocation(line: 35, column: 19, scope: !34)
!40 = !DILocalVariable(name: "dest", scope: !34, file: !10, line: 36, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 36, column: 17, scope: !34)
!45 = !DILocation(line: 37, column: 17, scope: !34)
!46 = !DILocation(line: 37, column: 9, scope: !34)
!47 = !DILocation(line: 38, column: 9, scope: !34)
!48 = !DILocation(line: 38, column: 21, scope: !34)
!49 = !DILocation(line: 39, column: 26, scope: !34)
!50 = !DILocation(line: 39, column: 19, scope: !34)
!51 = !DILocation(line: 39, column: 17, scope: !34)
!52 = !DILocation(line: 42, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !34, file: !10, line: 42, column: 9)
!54 = !DILocation(line: 42, column: 14, scope: !53)
!55 = !DILocation(line: 42, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !10, line: 42, column: 9)
!57 = !DILocation(line: 42, column: 25, scope: !56)
!58 = !DILocation(line: 42, column: 23, scope: !56)
!59 = !DILocation(line: 42, column: 9, scope: !53)
!60 = !DILocation(line: 44, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !10, line: 43, column: 9)
!62 = !DILocation(line: 44, column: 28, scope: !61)
!63 = !DILocation(line: 44, column: 18, scope: !61)
!64 = !DILocation(line: 44, column: 13, scope: !61)
!65 = !DILocation(line: 44, column: 21, scope: !61)
!66 = !DILocation(line: 45, column: 9, scope: !61)
!67 = !DILocation(line: 42, column: 35, scope: !56)
!68 = !DILocation(line: 42, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 45, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 46, column: 9, scope: !34)
!73 = !DILocation(line: 46, column: 21, scope: !34)
!74 = !DILocation(line: 47, column: 20, scope: !34)
!75 = !DILocation(line: 47, column: 9, scope: !34)
!76 = !DILocation(line: 48, column: 14, scope: !34)
!77 = !DILocation(line: 48, column: 9, scope: !34)
!78 = !DILocation(line: 50, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_22_good", scope: !10, file: !10, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 116, column: 5, scope: !79)
!81 = !DILocation(line: 117, column: 5, scope: !79)
!82 = !DILocation(line: 118, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 130, type: !84, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!11, !11, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !10, line: 130, type: !11)
!90 = !DILocation(line: 130, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !10, line: 130, type: !86)
!92 = !DILocation(line: 130, column: 27, scope: !83)
!93 = !DILocation(line: 133, column: 22, scope: !83)
!94 = !DILocation(line: 133, column: 12, scope: !83)
!95 = !DILocation(line: 133, column: 5, scope: !83)
!96 = !DILocation(line: 135, column: 5, scope: !83)
!97 = !DILocation(line: 136, column: 5, scope: !83)
!98 = !DILocation(line: 137, column: 5, scope: !83)
!99 = !DILocation(line: 140, column: 5, scope: !83)
!100 = !DILocation(line: 141, column: 5, scope: !83)
!101 = !DILocation(line: 142, column: 5, scope: !83)
!102 = !DILocation(line: 144, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 63, type: !21, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 65, type: !24)
!105 = !DILocation(line: 65, column: 15, scope: !103)
!106 = !DILocation(line: 66, column: 10, scope: !103)
!107 = !DILocation(line: 67, column: 67, scope: !103)
!108 = !DILocation(line: 68, column: 74, scope: !103)
!109 = !DILocation(line: 68, column: 12, scope: !103)
!110 = !DILocation(line: 68, column: 10, scope: !103)
!111 = !DILocalVariable(name: "i", scope: !112, file: !10, line: 70, type: !35)
!112 = distinct !DILexicalBlock(scope: !103, file: !10, line: 69, column: 5)
!113 = !DILocation(line: 70, column: 16, scope: !112)
!114 = !DILocalVariable(name: "destLen", scope: !112, file: !10, line: 70, type: !35)
!115 = !DILocation(line: 70, column: 19, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !112, file: !10, line: 71, type: !41)
!117 = !DILocation(line: 71, column: 17, scope: !112)
!118 = !DILocation(line: 72, column: 17, scope: !112)
!119 = !DILocation(line: 72, column: 9, scope: !112)
!120 = !DILocation(line: 73, column: 9, scope: !112)
!121 = !DILocation(line: 73, column: 21, scope: !112)
!122 = !DILocation(line: 74, column: 26, scope: !112)
!123 = !DILocation(line: 74, column: 19, scope: !112)
!124 = !DILocation(line: 74, column: 17, scope: !112)
!125 = !DILocation(line: 77, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !112, file: !10, line: 77, column: 9)
!127 = !DILocation(line: 77, column: 14, scope: !126)
!128 = !DILocation(line: 77, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !10, line: 77, column: 9)
!130 = !DILocation(line: 77, column: 25, scope: !129)
!131 = !DILocation(line: 77, column: 23, scope: !129)
!132 = !DILocation(line: 77, column: 9, scope: !126)
!133 = !DILocation(line: 79, column: 23, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !10, line: 78, column: 9)
!135 = !DILocation(line: 79, column: 28, scope: !134)
!136 = !DILocation(line: 79, column: 18, scope: !134)
!137 = !DILocation(line: 79, column: 13, scope: !134)
!138 = !DILocation(line: 79, column: 21, scope: !134)
!139 = !DILocation(line: 80, column: 9, scope: !134)
!140 = !DILocation(line: 77, column: 35, scope: !129)
!141 = !DILocation(line: 77, column: 9, scope: !129)
!142 = distinct !{!142, !132, !143, !71}
!143 = !DILocation(line: 80, column: 9, scope: !126)
!144 = !DILocation(line: 81, column: 9, scope: !112)
!145 = !DILocation(line: 81, column: 21, scope: !112)
!146 = !DILocation(line: 82, column: 20, scope: !112)
!147 = !DILocation(line: 82, column: 9, scope: !112)
!148 = !DILocation(line: 83, column: 14, scope: !112)
!149 = !DILocation(line: 83, column: 9, scope: !112)
!150 = !DILocation(line: 85, column: 1, scope: !103)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!152 = !DILocalVariable(name: "data", scope: !151, file: !10, line: 92, type: !24)
!153 = !DILocation(line: 92, column: 15, scope: !151)
!154 = !DILocation(line: 93, column: 10, scope: !151)
!155 = !DILocation(line: 94, column: 67, scope: !151)
!156 = !DILocation(line: 95, column: 74, scope: !151)
!157 = !DILocation(line: 95, column: 12, scope: !151)
!158 = !DILocation(line: 95, column: 10, scope: !151)
!159 = !DILocalVariable(name: "i", scope: !160, file: !10, line: 97, type: !35)
!160 = distinct !DILexicalBlock(scope: !151, file: !10, line: 96, column: 5)
!161 = !DILocation(line: 97, column: 16, scope: !160)
!162 = !DILocalVariable(name: "destLen", scope: !160, file: !10, line: 97, type: !35)
!163 = !DILocation(line: 97, column: 19, scope: !160)
!164 = !DILocalVariable(name: "dest", scope: !160, file: !10, line: 98, type: !41)
!165 = !DILocation(line: 98, column: 17, scope: !160)
!166 = !DILocation(line: 99, column: 17, scope: !160)
!167 = !DILocation(line: 99, column: 9, scope: !160)
!168 = !DILocation(line: 100, column: 9, scope: !160)
!169 = !DILocation(line: 100, column: 21, scope: !160)
!170 = !DILocation(line: 101, column: 26, scope: !160)
!171 = !DILocation(line: 101, column: 19, scope: !160)
!172 = !DILocation(line: 101, column: 17, scope: !160)
!173 = !DILocation(line: 104, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !160, file: !10, line: 104, column: 9)
!175 = !DILocation(line: 104, column: 14, scope: !174)
!176 = !DILocation(line: 104, column: 21, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !10, line: 104, column: 9)
!178 = !DILocation(line: 104, column: 25, scope: !177)
!179 = !DILocation(line: 104, column: 23, scope: !177)
!180 = !DILocation(line: 104, column: 9, scope: !174)
!181 = !DILocation(line: 106, column: 23, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !10, line: 105, column: 9)
!183 = !DILocation(line: 106, column: 28, scope: !182)
!184 = !DILocation(line: 106, column: 18, scope: !182)
!185 = !DILocation(line: 106, column: 13, scope: !182)
!186 = !DILocation(line: 106, column: 21, scope: !182)
!187 = !DILocation(line: 107, column: 9, scope: !182)
!188 = !DILocation(line: 104, column: 35, scope: !177)
!189 = !DILocation(line: 104, column: 9, scope: !177)
!190 = distinct !{!190, !180, !191, !71}
!191 = !DILocation(line: 107, column: 9, scope: !174)
!192 = !DILocation(line: 108, column: 9, scope: !160)
!193 = !DILocation(line: 108, column: 21, scope: !160)
!194 = !DILocation(line: 109, column: 20, scope: !160)
!195 = !DILocation(line: 109, column: 9, scope: !160)
!196 = !DILocation(line: 110, column: 14, scope: !160)
!197 = !DILocation(line: 110, column: 9, scope: !160)
!198 = !DILocation(line: 112, column: 1, scope: !151)
