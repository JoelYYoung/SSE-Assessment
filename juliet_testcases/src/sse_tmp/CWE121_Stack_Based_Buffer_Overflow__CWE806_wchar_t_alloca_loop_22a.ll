; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !12
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_badGlobal, align 4, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_badSource(i32* %3), !dbg !36
  store i32* %call, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !51
  store i64 %call1, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !56
  %7 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp = icmp ult i64 %6, %7, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !61
  %10 = load i32, i32* %arrayidx, align 4, !dbg !61
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !65
  store i32 %10, i32* %arrayidx2, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %12, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !73
  store i32 0, i32* %arrayidx3, align 4, !dbg !74
  %13 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* %13), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_good() #0 !dbg !78 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 400, align 16, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  store i32* %1, i32** %dataBuffer, align 8, !dbg !106
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %2, i32** %data, align 8, !dbg !110
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B1Global, align 4, !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B1Source(i32* %3), !dbg !113
  store i32* %call, i32** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !120, metadata !DIExpression()), !dbg !121
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !123
  store i64 %call1, i64* %dataLen, align 8, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !128
  %7 = load i64, i64* %dataLen, align 8, !dbg !130
  %cmp = icmp ult i64 %6, %7, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !133
  %9 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !133
  %10 = load i32, i32* %arrayidx, align 4, !dbg !133
  %11 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !137
  store i32 %10, i32* %arrayidx2, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %12, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !144
  store i32 0, i32* %arrayidx3, align 4, !dbg !145
  %13 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %13), !dbg !147
  ret void, !dbg !148
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = alloca i8, i64 400, align 16, !dbg !154
  %1 = bitcast i8* %0 to i32*, !dbg !155
  store i32* %1, i32** %dataBuffer, align 8, !dbg !153
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  store i32* %2, i32** %data, align 8, !dbg !157
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B2Global, align 4, !dbg !158
  %3 = load i32*, i32** %data, align 8, !dbg !159
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B2Source(i32* %3), !dbg !160
  store i32* %call, i32** %data, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !162, metadata !DIExpression()), !dbg !164
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !167, metadata !DIExpression()), !dbg !168
  %5 = load i32*, i32** %data, align 8, !dbg !169
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !170
  store i64 %call1, i64* %dataLen, align 8, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !175
  %7 = load i64, i64* %dataLen, align 8, !dbg !177
  %cmp = icmp ult i64 %6, %7, !dbg !178
  br i1 %cmp, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !180
  %9 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !180
  %10 = load i32, i32* %arrayidx, align 4, !dbg !180
  %11 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !184
  store i32 %10, i32* %arrayidx2, align 4, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !187
  %inc = add i64 %12, 1, !dbg !187
  store i64 %inc, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !191
  store i32 0, i32* %arrayidx3, align 4, !dbg !192
  %13 = load i32*, i32** %data, align 8, !dbg !193
  call void @printWLine(i32* %13), !dbg !194
  ret void, !dbg !195
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_badGlobal", scope: !2, file: !14, line: 24, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B1Global", scope: !2, file: !14, line: 54, type: !9, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_goodG2B2Global", scope: !2, file: !14, line: 55, type: !9, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_bad", scope: !14, file: !14, line: 28, type: !24, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 30, type: !6)
!27 = !DILocation(line: 30, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 31, type: !6)
!29 = !DILocation(line: 31, column: 15, scope: !23)
!30 = !DILocation(line: 31, column: 39, scope: !23)
!31 = !DILocation(line: 31, column: 28, scope: !23)
!32 = !DILocation(line: 32, column: 12, scope: !23)
!33 = !DILocation(line: 32, column: 10, scope: !23)
!34 = !DILocation(line: 33, column: 81, scope: !23)
!35 = !DILocation(line: 34, column: 88, scope: !23)
!36 = !DILocation(line: 34, column: 12, scope: !23)
!37 = !DILocation(line: 34, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 36, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !14, line: 37, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 37, column: 16, scope: !39)
!48 = !DILocalVariable(name: "dataLen", scope: !39, file: !14, line: 37, type: !45)
!49 = !DILocation(line: 37, column: 19, scope: !39)
!50 = !DILocation(line: 38, column: 26, scope: !39)
!51 = !DILocation(line: 38, column: 19, scope: !39)
!52 = !DILocation(line: 38, column: 17, scope: !39)
!53 = !DILocation(line: 40, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !14, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 14, scope: !54)
!56 = !DILocation(line: 40, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !14, line: 40, column: 9)
!58 = !DILocation(line: 40, column: 25, scope: !57)
!59 = !DILocation(line: 40, column: 23, scope: !57)
!60 = !DILocation(line: 40, column: 9, scope: !54)
!61 = !DILocation(line: 42, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !14, line: 41, column: 9)
!63 = !DILocation(line: 42, column: 28, scope: !62)
!64 = !DILocation(line: 42, column: 18, scope: !62)
!65 = !DILocation(line: 42, column: 13, scope: !62)
!66 = !DILocation(line: 42, column: 21, scope: !62)
!67 = !DILocation(line: 43, column: 9, scope: !62)
!68 = !DILocation(line: 40, column: 35, scope: !57)
!69 = !DILocation(line: 40, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 43, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 44, column: 9, scope: !39)
!74 = !DILocation(line: 44, column: 20, scope: !39)
!75 = !DILocation(line: 45, column: 20, scope: !39)
!76 = !DILocation(line: 45, column: 9, scope: !39)
!77 = !DILocation(line: 47, column: 1, scope: !23)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_22_good", scope: !14, file: !14, line: 105, type: !24, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 107, column: 5, scope: !78)
!80 = !DILocation(line: 108, column: 5, scope: !78)
!81 = !DILocation(line: 109, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !83, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!9, !9, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !14, line: 121, type: !9)
!89 = !DILocation(line: 121, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !14, line: 121, type: !85)
!91 = !DILocation(line: 121, column: 27, scope: !82)
!92 = !DILocation(line: 124, column: 22, scope: !82)
!93 = !DILocation(line: 124, column: 12, scope: !82)
!94 = !DILocation(line: 124, column: 5, scope: !82)
!95 = !DILocation(line: 126, column: 5, scope: !82)
!96 = !DILocation(line: 127, column: 5, scope: !82)
!97 = !DILocation(line: 128, column: 5, scope: !82)
!98 = !DILocation(line: 131, column: 5, scope: !82)
!99 = !DILocation(line: 132, column: 5, scope: !82)
!100 = !DILocation(line: 133, column: 5, scope: !82)
!101 = !DILocation(line: 135, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !14, line: 62, type: !6)
!104 = !DILocation(line: 62, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !14, line: 63, type: !6)
!106 = !DILocation(line: 63, column: 15, scope: !102)
!107 = !DILocation(line: 63, column: 39, scope: !102)
!108 = !DILocation(line: 63, column: 28, scope: !102)
!109 = !DILocation(line: 64, column: 12, scope: !102)
!110 = !DILocation(line: 64, column: 10, scope: !102)
!111 = !DILocation(line: 65, column: 86, scope: !102)
!112 = !DILocation(line: 66, column: 93, scope: !102)
!113 = !DILocation(line: 66, column: 12, scope: !102)
!114 = !DILocation(line: 66, column: 10, scope: !102)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !14, line: 68, type: !40)
!116 = distinct !DILexicalBlock(scope: !102, file: !14, line: 67, column: 5)
!117 = !DILocation(line: 68, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !116, file: !14, line: 69, type: !45)
!119 = !DILocation(line: 69, column: 16, scope: !116)
!120 = !DILocalVariable(name: "dataLen", scope: !116, file: !14, line: 69, type: !45)
!121 = !DILocation(line: 69, column: 19, scope: !116)
!122 = !DILocation(line: 70, column: 26, scope: !116)
!123 = !DILocation(line: 70, column: 19, scope: !116)
!124 = !DILocation(line: 70, column: 17, scope: !116)
!125 = !DILocation(line: 72, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !14, line: 72, column: 9)
!127 = !DILocation(line: 72, column: 14, scope: !126)
!128 = !DILocation(line: 72, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !14, line: 72, column: 9)
!130 = !DILocation(line: 72, column: 25, scope: !129)
!131 = !DILocation(line: 72, column: 23, scope: !129)
!132 = !DILocation(line: 72, column: 9, scope: !126)
!133 = !DILocation(line: 74, column: 23, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !14, line: 73, column: 9)
!135 = !DILocation(line: 74, column: 28, scope: !134)
!136 = !DILocation(line: 74, column: 18, scope: !134)
!137 = !DILocation(line: 74, column: 13, scope: !134)
!138 = !DILocation(line: 74, column: 21, scope: !134)
!139 = !DILocation(line: 75, column: 9, scope: !134)
!140 = !DILocation(line: 72, column: 35, scope: !129)
!141 = !DILocation(line: 72, column: 9, scope: !129)
!142 = distinct !{!142, !132, !143, !72}
!143 = !DILocation(line: 75, column: 9, scope: !126)
!144 = !DILocation(line: 76, column: 9, scope: !116)
!145 = !DILocation(line: 76, column: 20, scope: !116)
!146 = !DILocation(line: 77, column: 20, scope: !116)
!147 = !DILocation(line: 77, column: 9, scope: !116)
!148 = !DILocation(line: 79, column: 1, scope: !102)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 84, type: !24, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !14, line: 86, type: !6)
!151 = !DILocation(line: 86, column: 15, scope: !149)
!152 = !DILocalVariable(name: "dataBuffer", scope: !149, file: !14, line: 87, type: !6)
!153 = !DILocation(line: 87, column: 15, scope: !149)
!154 = !DILocation(line: 87, column: 39, scope: !149)
!155 = !DILocation(line: 87, column: 28, scope: !149)
!156 = !DILocation(line: 88, column: 12, scope: !149)
!157 = !DILocation(line: 88, column: 10, scope: !149)
!158 = !DILocation(line: 89, column: 86, scope: !149)
!159 = !DILocation(line: 90, column: 93, scope: !149)
!160 = !DILocation(line: 90, column: 12, scope: !149)
!161 = !DILocation(line: 90, column: 10, scope: !149)
!162 = !DILocalVariable(name: "dest", scope: !163, file: !14, line: 92, type: !40)
!163 = distinct !DILexicalBlock(scope: !149, file: !14, line: 91, column: 5)
!164 = !DILocation(line: 92, column: 17, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !163, file: !14, line: 93, type: !45)
!166 = !DILocation(line: 93, column: 16, scope: !163)
!167 = !DILocalVariable(name: "dataLen", scope: !163, file: !14, line: 93, type: !45)
!168 = !DILocation(line: 93, column: 19, scope: !163)
!169 = !DILocation(line: 94, column: 26, scope: !163)
!170 = !DILocation(line: 94, column: 19, scope: !163)
!171 = !DILocation(line: 94, column: 17, scope: !163)
!172 = !DILocation(line: 96, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !163, file: !14, line: 96, column: 9)
!174 = !DILocation(line: 96, column: 14, scope: !173)
!175 = !DILocation(line: 96, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !14, line: 96, column: 9)
!177 = !DILocation(line: 96, column: 25, scope: !176)
!178 = !DILocation(line: 96, column: 23, scope: !176)
!179 = !DILocation(line: 96, column: 9, scope: !173)
!180 = !DILocation(line: 98, column: 23, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !14, line: 97, column: 9)
!182 = !DILocation(line: 98, column: 28, scope: !181)
!183 = !DILocation(line: 98, column: 18, scope: !181)
!184 = !DILocation(line: 98, column: 13, scope: !181)
!185 = !DILocation(line: 98, column: 21, scope: !181)
!186 = !DILocation(line: 99, column: 9, scope: !181)
!187 = !DILocation(line: 96, column: 35, scope: !176)
!188 = !DILocation(line: 96, column: 9, scope: !176)
!189 = distinct !{!189, !179, !190, !72}
!190 = !DILocation(line: 99, column: 9, scope: !173)
!191 = !DILocation(line: 100, column: 9, scope: !163)
!192 = !DILocation(line: 100, column: 20, scope: !163)
!193 = !DILocation(line: 101, column: 20, scope: !163)
!194 = !DILocation(line: 101, column: 9, scope: !163)
!195 = !DILocation(line: 103, column: 1, scope: !149)
