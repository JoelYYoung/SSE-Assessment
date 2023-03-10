; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_char_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE126_Buffer_Overread__malloc_char_loop_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_loop_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx, align 1, !dbg !47
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !49
  store i64 %call2, i64* %destLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !54
  %2 = load i64, i64* %destLen, align 8, !dbg !56
  %cmp = icmp ult i64 %1, %2, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !59
  %4 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !59
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !59
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !63
  store i8 %5, i8* %arrayidx4, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %7, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx5, align 1, !dbg !72
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @printLine(i8* %arraydecay6), !dbg !74
  %8 = load i8*, i8** %data, align 8, !dbg !75
  call void @free(i8* %8) #7, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_22_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE126_Buffer_Overread__malloc_char_loop_22_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE126_Buffer_Overread__malloc_char_loop_22_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  store i32 0, i32* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Global, align 4, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Source(i8* %0), !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !119
  store i64 %call2, i64* %destLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !124
  %2 = load i64, i64* %destLen, align 8, !dbg !126
  %cmp = icmp ult i64 %1, %2, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !129
  %4 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !129
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !129
  %6 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !133
  store i8 %5, i8* %arrayidx4, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %7, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx5, align 1, !dbg !141
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  call void @printLine(i8* %arraydecay6), !dbg !143
  %8 = load i8*, i8** %data, align 8, !dbg !144
  call void @free(i8* %8) #7, !dbg !145
  ret void, !dbg !146
}

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i8* null, i8** %data, align 8, !dbg !150
  store i32 1, i32* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Global, align 4, !dbg !151
  %0 = load i8*, i8** %data, align 8, !dbg !152
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Source(i8* %0), !dbg !153
  store i8* %call, i8** %data, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !160, metadata !DIExpression()), !dbg !161
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !162
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !163
  store i8 0, i8* %arrayidx, align 1, !dbg !164
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !165
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !166
  store i64 %call2, i64* %destLen, align 8, !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !171
  %2 = load i64, i64* %destLen, align 8, !dbg !173
  %cmp = icmp ult i64 %1, %2, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !176
  %4 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !176
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !176
  %6 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !180
  store i8 %5, i8* %arrayidx4, align 1, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %7, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !187
  store i8 0, i8* %arrayidx5, align 1, !dbg !188
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !189
  call void @printLine(i8* %arraydecay6), !dbg !190
  %8 = load i8*, i8** %data, align 8, !dbg !191
  call void @free(i8* %8) #7, !dbg !192
  ret void, !dbg !193
}

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Global", scope: !2, file: !10, line: 57, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Global", scope: !2, file: !10, line: 58, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocation(line: 31, column: 10, scope: !20)
!28 = !DILocation(line: 32, column: 59, scope: !20)
!29 = !DILocation(line: 33, column: 66, scope: !20)
!30 = !DILocation(line: 33, column: 12, scope: !20)
!31 = !DILocation(line: 33, column: 10, scope: !20)
!32 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 35, column: 16, scope: !33)
!38 = !DILocalVariable(name: "destLen", scope: !33, file: !10, line: 35, type: !34)
!39 = !DILocation(line: 35, column: 19, scope: !33)
!40 = !DILocalVariable(name: "dest", scope: !33, file: !10, line: 36, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 36, column: 14, scope: !33)
!45 = !DILocation(line: 37, column: 9, scope: !33)
!46 = !DILocation(line: 38, column: 9, scope: !33)
!47 = !DILocation(line: 38, column: 21, scope: !33)
!48 = !DILocation(line: 39, column: 26, scope: !33)
!49 = !DILocation(line: 39, column: 19, scope: !33)
!50 = !DILocation(line: 39, column: 17, scope: !33)
!51 = !DILocation(line: 42, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !33, file: !10, line: 42, column: 9)
!53 = !DILocation(line: 42, column: 14, scope: !52)
!54 = !DILocation(line: 42, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !10, line: 42, column: 9)
!56 = !DILocation(line: 42, column: 25, scope: !55)
!57 = !DILocation(line: 42, column: 23, scope: !55)
!58 = !DILocation(line: 42, column: 9, scope: !52)
!59 = !DILocation(line: 44, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !10, line: 43, column: 9)
!61 = !DILocation(line: 44, column: 28, scope: !60)
!62 = !DILocation(line: 44, column: 18, scope: !60)
!63 = !DILocation(line: 44, column: 13, scope: !60)
!64 = !DILocation(line: 44, column: 21, scope: !60)
!65 = !DILocation(line: 45, column: 9, scope: !60)
!66 = !DILocation(line: 42, column: 35, scope: !55)
!67 = !DILocation(line: 42, column: 9, scope: !55)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 45, column: 9, scope: !52)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 46, column: 9, scope: !33)
!72 = !DILocation(line: 46, column: 21, scope: !33)
!73 = !DILocation(line: 47, column: 19, scope: !33)
!74 = !DILocation(line: 47, column: 9, scope: !33)
!75 = !DILocation(line: 48, column: 14, scope: !33)
!76 = !DILocation(line: 48, column: 9, scope: !33)
!77 = !DILocation(line: 50, column: 1, scope: !20)
!78 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_22_good", scope: !10, file: !10, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 116, column: 5, scope: !78)
!80 = !DILocation(line: 117, column: 5, scope: !78)
!81 = !DILocation(line: 118, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 130, type: !83, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!11, !11, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !10, line: 130, type: !11)
!87 = !DILocation(line: 130, column: 14, scope: !82)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !10, line: 130, type: !85)
!89 = !DILocation(line: 130, column: 27, scope: !82)
!90 = !DILocation(line: 133, column: 22, scope: !82)
!91 = !DILocation(line: 133, column: 12, scope: !82)
!92 = !DILocation(line: 133, column: 5, scope: !82)
!93 = !DILocation(line: 135, column: 5, scope: !82)
!94 = !DILocation(line: 136, column: 5, scope: !82)
!95 = !DILocation(line: 137, column: 5, scope: !82)
!96 = !DILocation(line: 140, column: 5, scope: !82)
!97 = !DILocation(line: 141, column: 5, scope: !82)
!98 = !DILocation(line: 142, column: 5, scope: !82)
!99 = !DILocation(line: 144, column: 5, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 63, type: !21, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !10, line: 65, type: !24)
!102 = !DILocation(line: 65, column: 12, scope: !100)
!103 = !DILocation(line: 66, column: 10, scope: !100)
!104 = !DILocation(line: 67, column: 64, scope: !100)
!105 = !DILocation(line: 68, column: 71, scope: !100)
!106 = !DILocation(line: 68, column: 12, scope: !100)
!107 = !DILocation(line: 68, column: 10, scope: !100)
!108 = !DILocalVariable(name: "i", scope: !109, file: !10, line: 70, type: !34)
!109 = distinct !DILexicalBlock(scope: !100, file: !10, line: 69, column: 5)
!110 = !DILocation(line: 70, column: 16, scope: !109)
!111 = !DILocalVariable(name: "destLen", scope: !109, file: !10, line: 70, type: !34)
!112 = !DILocation(line: 70, column: 19, scope: !109)
!113 = !DILocalVariable(name: "dest", scope: !109, file: !10, line: 71, type: !41)
!114 = !DILocation(line: 71, column: 14, scope: !109)
!115 = !DILocation(line: 72, column: 9, scope: !109)
!116 = !DILocation(line: 73, column: 9, scope: !109)
!117 = !DILocation(line: 73, column: 21, scope: !109)
!118 = !DILocation(line: 74, column: 26, scope: !109)
!119 = !DILocation(line: 74, column: 19, scope: !109)
!120 = !DILocation(line: 74, column: 17, scope: !109)
!121 = !DILocation(line: 77, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !109, file: !10, line: 77, column: 9)
!123 = !DILocation(line: 77, column: 14, scope: !122)
!124 = !DILocation(line: 77, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !10, line: 77, column: 9)
!126 = !DILocation(line: 77, column: 25, scope: !125)
!127 = !DILocation(line: 77, column: 23, scope: !125)
!128 = !DILocation(line: 77, column: 9, scope: !122)
!129 = !DILocation(line: 79, column: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !10, line: 78, column: 9)
!131 = !DILocation(line: 79, column: 28, scope: !130)
!132 = !DILocation(line: 79, column: 18, scope: !130)
!133 = !DILocation(line: 79, column: 13, scope: !130)
!134 = !DILocation(line: 79, column: 21, scope: !130)
!135 = !DILocation(line: 80, column: 9, scope: !130)
!136 = !DILocation(line: 77, column: 35, scope: !125)
!137 = !DILocation(line: 77, column: 9, scope: !125)
!138 = distinct !{!138, !128, !139, !70}
!139 = !DILocation(line: 80, column: 9, scope: !122)
!140 = !DILocation(line: 81, column: 9, scope: !109)
!141 = !DILocation(line: 81, column: 21, scope: !109)
!142 = !DILocation(line: 82, column: 19, scope: !109)
!143 = !DILocation(line: 82, column: 9, scope: !109)
!144 = !DILocation(line: 83, column: 14, scope: !109)
!145 = !DILocation(line: 83, column: 9, scope: !109)
!146 = !DILocation(line: 85, column: 1, scope: !100)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !10, line: 92, type: !24)
!149 = !DILocation(line: 92, column: 12, scope: !147)
!150 = !DILocation(line: 93, column: 10, scope: !147)
!151 = !DILocation(line: 94, column: 64, scope: !147)
!152 = !DILocation(line: 95, column: 71, scope: !147)
!153 = !DILocation(line: 95, column: 12, scope: !147)
!154 = !DILocation(line: 95, column: 10, scope: !147)
!155 = !DILocalVariable(name: "i", scope: !156, file: !10, line: 97, type: !34)
!156 = distinct !DILexicalBlock(scope: !147, file: !10, line: 96, column: 5)
!157 = !DILocation(line: 97, column: 16, scope: !156)
!158 = !DILocalVariable(name: "destLen", scope: !156, file: !10, line: 97, type: !34)
!159 = !DILocation(line: 97, column: 19, scope: !156)
!160 = !DILocalVariable(name: "dest", scope: !156, file: !10, line: 98, type: !41)
!161 = !DILocation(line: 98, column: 14, scope: !156)
!162 = !DILocation(line: 99, column: 9, scope: !156)
!163 = !DILocation(line: 100, column: 9, scope: !156)
!164 = !DILocation(line: 100, column: 21, scope: !156)
!165 = !DILocation(line: 101, column: 26, scope: !156)
!166 = !DILocation(line: 101, column: 19, scope: !156)
!167 = !DILocation(line: 101, column: 17, scope: !156)
!168 = !DILocation(line: 104, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !156, file: !10, line: 104, column: 9)
!170 = !DILocation(line: 104, column: 14, scope: !169)
!171 = !DILocation(line: 104, column: 21, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !10, line: 104, column: 9)
!173 = !DILocation(line: 104, column: 25, scope: !172)
!174 = !DILocation(line: 104, column: 23, scope: !172)
!175 = !DILocation(line: 104, column: 9, scope: !169)
!176 = !DILocation(line: 106, column: 23, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !10, line: 105, column: 9)
!178 = !DILocation(line: 106, column: 28, scope: !177)
!179 = !DILocation(line: 106, column: 18, scope: !177)
!180 = !DILocation(line: 106, column: 13, scope: !177)
!181 = !DILocation(line: 106, column: 21, scope: !177)
!182 = !DILocation(line: 107, column: 9, scope: !177)
!183 = !DILocation(line: 104, column: 35, scope: !172)
!184 = !DILocation(line: 104, column: 9, scope: !172)
!185 = distinct !{!185, !175, !186, !70}
!186 = !DILocation(line: 107, column: 9, scope: !169)
!187 = !DILocation(line: 108, column: 9, scope: !156)
!188 = !DILocation(line: 108, column: 21, scope: !156)
!189 = !DILocation(line: 109, column: 19, scope: !156)
!190 = !DILocation(line: 109, column: 9, scope: !156)
!191 = !DILocation(line: 110, column: 14, scope: !156)
!192 = !DILocation(line: 110, column: 9, scope: !156)
!193 = !DILocation(line: 112, column: 1, scope: !147)
