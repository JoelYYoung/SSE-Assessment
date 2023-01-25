; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 40, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 44, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_bad.source to i8*), i64 44, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !55
  store i64 %call, i64* %sourceLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !60
  %9 = load i64, i64* %sourceLen, align 8, !dbg !62
  %add = add i64 %9, 1, !dbg !63
  %cmp1 = icmp ult i64 %8, %add, !dbg !64
  br i1 %cmp1, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !68
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !68
  %12 = load i32*, i32** %data, align 8, !dbg !69
  %13 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !69
  store i32 %11, i32* %arrayidx3, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %14, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %15), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 40, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 44, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %4 = load i32, i32* @staticFive, align 4, !dbg !116
  %cmp = icmp ne i32 %4, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !123
  store i32* %5, i32** %data, align 8, !dbg !125
  %6 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !136
  store i64 %call, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !141
  %9 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %9, 1, !dbg !144
  %cmp1 = icmp ult i64 %8, %add, !dbg !145
  br i1 %cmp1, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !149
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !149
  %12 = load i32*, i32** %data, align 8, !dbg !150
  %13 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !150
  store i32 %11, i32* %arrayidx3, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %14, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %15), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = alloca i8, i64 40, align 16, !dbg !166
  %1 = bitcast i8* %0 to i32*, !dbg !167
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  %2 = alloca i8, i64 44, align 16, !dbg !170
  %3 = bitcast i8* %2 to i32*, !dbg !171
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !169
  %4 = load i32, i32* @staticFive, align 4, !dbg !172
  %cmp = icmp eq i32 %4, 5, !dbg !174
  br i1 %cmp, label %if.then, label %if.end, !dbg !175

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !176
  store i32* %5, i32** %data, align 8, !dbg !178
  %6 = load i32*, i32** %data, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !179
  store i32 0, i32* %arrayidx, align 4, !dbg !180
  br label %if.end, !dbg !181

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !182, metadata !DIExpression()), !dbg !184
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !184
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %i, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !187, metadata !DIExpression()), !dbg !188
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !189
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !190
  store i64 %call, i64* %sourceLen, align 8, !dbg !191
  store i64 0, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !195
  %9 = load i64, i64* %sourceLen, align 8, !dbg !197
  %add = add i64 %9, 1, !dbg !198
  %cmp1 = icmp ult i64 %8, %add, !dbg !199
  br i1 %cmp1, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !203
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !203
  %12 = load i32*, i32** %data, align 8, !dbg !204
  %13 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !204
  store i32 %11, i32* %arrayidx3, align 4, !dbg !206
  br label %for.inc, !dbg !207

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !208
  %inc = add i64 %14, 1, !dbg !208
  store i64 %inc, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !212
  call void @printWLine(i32* %15), !dbg !213
  ret void, !dbg !214
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_bad", scope: !12, file: !12, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 36, type: !6)
!23 = !DILocation(line: 36, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 37, type: !6)
!25 = !DILocation(line: 37, column: 15, scope: !19)
!26 = !DILocation(line: 37, column: 42, scope: !19)
!27 = !DILocation(line: 37, column: 31, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 38, type: !6)
!29 = !DILocation(line: 38, column: 15, scope: !19)
!30 = !DILocation(line: 38, column: 43, scope: !19)
!31 = !DILocation(line: 38, column: 32, scope: !19)
!32 = !DILocation(line: 39, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 39, column: 8)
!34 = !DILocation(line: 39, column: 18, scope: !33)
!35 = !DILocation(line: 39, column: 8, scope: !19)
!36 = !DILocation(line: 43, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 40, column: 5)
!38 = !DILocation(line: 43, column: 14, scope: !37)
!39 = !DILocation(line: 44, column: 9, scope: !37)
!40 = !DILocation(line: 44, column: 17, scope: !37)
!41 = !DILocation(line: 45, column: 5, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 47, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !12, line: 46, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 11)
!47 = !DILocation(line: 47, column: 17, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 48, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 48, column: 16, scope: !43)
!52 = !DILocalVariable(name: "sourceLen", scope: !43, file: !12, line: 48, type: !49)
!53 = !DILocation(line: 48, column: 19, scope: !43)
!54 = !DILocation(line: 49, column: 28, scope: !43)
!55 = !DILocation(line: 49, column: 21, scope: !43)
!56 = !DILocation(line: 49, column: 19, scope: !43)
!57 = !DILocation(line: 52, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !43, file: !12, line: 52, column: 9)
!59 = !DILocation(line: 52, column: 14, scope: !58)
!60 = !DILocation(line: 52, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 52, column: 9)
!62 = !DILocation(line: 52, column: 25, scope: !61)
!63 = !DILocation(line: 52, column: 35, scope: !61)
!64 = !DILocation(line: 52, column: 23, scope: !61)
!65 = !DILocation(line: 52, column: 9, scope: !58)
!66 = !DILocation(line: 54, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !12, line: 53, column: 9)
!68 = !DILocation(line: 54, column: 23, scope: !67)
!69 = !DILocation(line: 54, column: 13, scope: !67)
!70 = !DILocation(line: 54, column: 18, scope: !67)
!71 = !DILocation(line: 54, column: 21, scope: !67)
!72 = !DILocation(line: 55, column: 9, scope: !67)
!73 = !DILocation(line: 52, column: 41, scope: !61)
!74 = !DILocation(line: 52, column: 9, scope: !61)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 55, column: 9, scope: !58)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 56, column: 20, scope: !43)
!79 = !DILocation(line: 56, column: 9, scope: !43)
!80 = !DILocation(line: 58, column: 1, scope: !19)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_07_good", scope: !12, file: !12, line: 123, type: !20, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 125, column: 5, scope: !81)
!83 = !DILocation(line: 126, column: 5, scope: !81)
!84 = !DILocation(line: 127, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 139, type: !86, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!9, !9, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 139, type: !9)
!92 = !DILocation(line: 139, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 139, type: !88)
!94 = !DILocation(line: 139, column: 27, scope: !85)
!95 = !DILocation(line: 142, column: 22, scope: !85)
!96 = !DILocation(line: 142, column: 12, scope: !85)
!97 = !DILocation(line: 142, column: 5, scope: !85)
!98 = !DILocation(line: 144, column: 5, scope: !85)
!99 = !DILocation(line: 145, column: 5, scope: !85)
!100 = !DILocation(line: 146, column: 5, scope: !85)
!101 = !DILocation(line: 149, column: 5, scope: !85)
!102 = !DILocation(line: 150, column: 5, scope: !85)
!103 = !DILocation(line: 151, column: 5, scope: !85)
!104 = !DILocation(line: 153, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !20, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 67, type: !6)
!107 = !DILocation(line: 67, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 68, type: !6)
!109 = !DILocation(line: 68, column: 15, scope: !105)
!110 = !DILocation(line: 68, column: 42, scope: !105)
!111 = !DILocation(line: 68, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 69, type: !6)
!113 = !DILocation(line: 69, column: 15, scope: !105)
!114 = !DILocation(line: 69, column: 43, scope: !105)
!115 = !DILocation(line: 69, column: 32, scope: !105)
!116 = !DILocation(line: 70, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !12, line: 70, column: 8)
!118 = !DILocation(line: 70, column: 18, scope: !117)
!119 = !DILocation(line: 70, column: 8, scope: !105)
!120 = !DILocation(line: 73, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 71, column: 5)
!122 = !DILocation(line: 74, column: 5, scope: !121)
!123 = !DILocation(line: 79, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !12, line: 76, column: 5)
!125 = !DILocation(line: 79, column: 14, scope: !124)
!126 = !DILocation(line: 80, column: 9, scope: !124)
!127 = !DILocation(line: 80, column: 17, scope: !124)
!128 = !DILocalVariable(name: "source", scope: !129, file: !12, line: 83, type: !44)
!129 = distinct !DILexicalBlock(scope: !105, file: !12, line: 82, column: 5)
!130 = !DILocation(line: 83, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !12, line: 84, type: !49)
!132 = !DILocation(line: 84, column: 16, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !12, line: 84, type: !49)
!134 = !DILocation(line: 84, column: 19, scope: !129)
!135 = !DILocation(line: 85, column: 28, scope: !129)
!136 = !DILocation(line: 85, column: 21, scope: !129)
!137 = !DILocation(line: 85, column: 19, scope: !129)
!138 = !DILocation(line: 88, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !12, line: 88, column: 9)
!140 = !DILocation(line: 88, column: 14, scope: !139)
!141 = !DILocation(line: 88, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 88, column: 9)
!143 = !DILocation(line: 88, column: 25, scope: !142)
!144 = !DILocation(line: 88, column: 35, scope: !142)
!145 = !DILocation(line: 88, column: 23, scope: !142)
!146 = !DILocation(line: 88, column: 9, scope: !139)
!147 = !DILocation(line: 90, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !12, line: 89, column: 9)
!149 = !DILocation(line: 90, column: 23, scope: !148)
!150 = !DILocation(line: 90, column: 13, scope: !148)
!151 = !DILocation(line: 90, column: 18, scope: !148)
!152 = !DILocation(line: 90, column: 21, scope: !148)
!153 = !DILocation(line: 91, column: 9, scope: !148)
!154 = !DILocation(line: 88, column: 41, scope: !142)
!155 = !DILocation(line: 88, column: 9, scope: !142)
!156 = distinct !{!156, !146, !157, !77}
!157 = !DILocation(line: 91, column: 9, scope: !139)
!158 = !DILocation(line: 92, column: 20, scope: !129)
!159 = !DILocation(line: 92, column: 9, scope: !129)
!160 = !DILocation(line: 94, column: 1, scope: !105)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 97, type: !20, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DILocalVariable(name: "data", scope: !161, file: !12, line: 99, type: !6)
!163 = !DILocation(line: 99, column: 15, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !12, line: 100, type: !6)
!165 = !DILocation(line: 100, column: 15, scope: !161)
!166 = !DILocation(line: 100, column: 42, scope: !161)
!167 = !DILocation(line: 100, column: 31, scope: !161)
!168 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !12, line: 101, type: !6)
!169 = !DILocation(line: 101, column: 15, scope: !161)
!170 = !DILocation(line: 101, column: 43, scope: !161)
!171 = !DILocation(line: 101, column: 32, scope: !161)
!172 = !DILocation(line: 102, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !12, line: 102, column: 8)
!174 = !DILocation(line: 102, column: 18, scope: !173)
!175 = !DILocation(line: 102, column: 8, scope: !161)
!176 = !DILocation(line: 106, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !12, line: 103, column: 5)
!178 = !DILocation(line: 106, column: 14, scope: !177)
!179 = !DILocation(line: 107, column: 9, scope: !177)
!180 = !DILocation(line: 107, column: 17, scope: !177)
!181 = !DILocation(line: 108, column: 5, scope: !177)
!182 = !DILocalVariable(name: "source", scope: !183, file: !12, line: 110, type: !44)
!183 = distinct !DILexicalBlock(scope: !161, file: !12, line: 109, column: 5)
!184 = !DILocation(line: 110, column: 17, scope: !183)
!185 = !DILocalVariable(name: "i", scope: !183, file: !12, line: 111, type: !49)
!186 = !DILocation(line: 111, column: 16, scope: !183)
!187 = !DILocalVariable(name: "sourceLen", scope: !183, file: !12, line: 111, type: !49)
!188 = !DILocation(line: 111, column: 19, scope: !183)
!189 = !DILocation(line: 112, column: 28, scope: !183)
!190 = !DILocation(line: 112, column: 21, scope: !183)
!191 = !DILocation(line: 112, column: 19, scope: !183)
!192 = !DILocation(line: 115, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !183, file: !12, line: 115, column: 9)
!194 = !DILocation(line: 115, column: 14, scope: !193)
!195 = !DILocation(line: 115, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 115, column: 9)
!197 = !DILocation(line: 115, column: 25, scope: !196)
!198 = !DILocation(line: 115, column: 35, scope: !196)
!199 = !DILocation(line: 115, column: 23, scope: !196)
!200 = !DILocation(line: 115, column: 9, scope: !193)
!201 = !DILocation(line: 117, column: 30, scope: !202)
!202 = distinct !DILexicalBlock(scope: !196, file: !12, line: 116, column: 9)
!203 = !DILocation(line: 117, column: 23, scope: !202)
!204 = !DILocation(line: 117, column: 13, scope: !202)
!205 = !DILocation(line: 117, column: 18, scope: !202)
!206 = !DILocation(line: 117, column: 21, scope: !202)
!207 = !DILocation(line: 118, column: 9, scope: !202)
!208 = !DILocation(line: 115, column: 41, scope: !196)
!209 = !DILocation(line: 115, column: 9, scope: !196)
!210 = distinct !{!210, !200, !211, !77}
!211 = !DILocation(line: 118, column: 9, scope: !193)
!212 = !DILocation(line: 119, column: 20, scope: !183)
!213 = !DILocation(line: 119, column: 9, scope: !183)
!214 = !DILocation(line: 121, column: 1, scope: !161)
