; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %5, i32** %data, align 8, !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_bad.source to i8*), i64 44, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !52
  store i64 %call, i64* %sourceLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !57
  %9 = load i64, i64* %sourceLen, align 8, !dbg !59
  %add = add i64 %9, 1, !dbg !60
  %cmp1 = icmp ult i64 %8, %add, !dbg !61
  br i1 %cmp1, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !65
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !65
  %12 = load i32*, i32** %data, align 8, !dbg !66
  %13 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !66
  store i32 %11, i32* %arrayidx3, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %14, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* %15), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_good() #0 !dbg !78 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 40, align 16, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %2 = alloca i8, i64 44, align 16, !dbg !111
  %3 = bitcast i8* %2 to i32*, !dbg !112
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !110
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !113
  %cmp = icmp ne i32 %4, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !120
  store i32* %5, i32** %data, align 8, !dbg !122
  %6 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !132
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !133
  store i64 %call, i64* %sourceLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !138
  %9 = load i64, i64* %sourceLen, align 8, !dbg !140
  %add = add i64 %9, 1, !dbg !141
  %cmp1 = icmp ult i64 %8, %add, !dbg !142
  br i1 %cmp1, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !146
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !146
  %12 = load i32*, i32** %data, align 8, !dbg !147
  %13 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !147
  store i32 %11, i32* %arrayidx3, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %14, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* %15), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = alloca i8, i64 40, align 16, !dbg !163
  %1 = bitcast i8* %0 to i32*, !dbg !164
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !165, metadata !DIExpression()), !dbg !166
  %2 = alloca i8, i64 44, align 16, !dbg !167
  %3 = bitcast i8* %2 to i32*, !dbg !168
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !166
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !169
  %cmp = icmp eq i32 %4, 5, !dbg !171
  br i1 %cmp, label %if.then, label %if.end, !dbg !172

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !173
  store i32* %5, i32** %data, align 8, !dbg !175
  %6 = load i32*, i32** %data, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  br label %if.end, !dbg !178

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !179, metadata !DIExpression()), !dbg !181
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !181
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %i, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !184, metadata !DIExpression()), !dbg !185
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !186
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !187
  store i64 %call, i64* %sourceLen, align 8, !dbg !188
  store i64 0, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !192
  %9 = load i64, i64* %sourceLen, align 8, !dbg !194
  %add = add i64 %9, 1, !dbg !195
  %cmp1 = icmp ult i64 %8, %add, !dbg !196
  br i1 %cmp1, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !200
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !200
  %12 = load i32*, i32** %data, align 8, !dbg !201
  %13 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !201
  store i32 %11, i32* %arrayidx3, align 4, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !205
  %inc = add i64 %14, 1, !dbg !205
  store i64 %inc, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !209
  call void @printWLine(i32* %15), !dbg !210
  ret void, !dbg !211
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 25, scope: !30)
!32 = !DILocation(line: 33, column: 8, scope: !15)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !16, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 41, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !16, line: 42, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !40)
!49 = !DILocalVariable(name: "sourceLen", scope: !40, file: !16, line: 42, type: !46)
!50 = !DILocation(line: 42, column: 19, scope: !40)
!51 = !DILocation(line: 43, column: 28, scope: !40)
!52 = !DILocation(line: 43, column: 21, scope: !40)
!53 = !DILocation(line: 43, column: 19, scope: !40)
!54 = !DILocation(line: 46, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !16, line: 46, column: 9)
!56 = !DILocation(line: 46, column: 14, scope: !55)
!57 = !DILocation(line: 46, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !16, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 25, scope: !58)
!60 = !DILocation(line: 46, column: 35, scope: !58)
!61 = !DILocation(line: 46, column: 23, scope: !58)
!62 = !DILocation(line: 46, column: 9, scope: !55)
!63 = !DILocation(line: 48, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !16, line: 47, column: 9)
!65 = !DILocation(line: 48, column: 23, scope: !64)
!66 = !DILocation(line: 48, column: 13, scope: !64)
!67 = !DILocation(line: 48, column: 18, scope: !64)
!68 = !DILocation(line: 48, column: 21, scope: !64)
!69 = !DILocation(line: 49, column: 9, scope: !64)
!70 = !DILocation(line: 46, column: 41, scope: !58)
!71 = !DILocation(line: 46, column: 9, scope: !58)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 49, column: 9, scope: !55)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 50, column: 20, scope: !40)
!76 = !DILocation(line: 50, column: 9, scope: !40)
!77 = !DILocation(line: 52, column: 1, scope: !15)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_13_good", scope: !16, file: !16, line: 117, type: !17, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 119, column: 5, scope: !78)
!80 = !DILocation(line: 120, column: 5, scope: !78)
!81 = !DILocation(line: 121, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 133, type: !83, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!7, !7, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !16, line: 133, type: !7)
!89 = !DILocation(line: 133, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !16, line: 133, type: !85)
!91 = !DILocation(line: 133, column: 27, scope: !82)
!92 = !DILocation(line: 136, column: 22, scope: !82)
!93 = !DILocation(line: 136, column: 12, scope: !82)
!94 = !DILocation(line: 136, column: 5, scope: !82)
!95 = !DILocation(line: 138, column: 5, scope: !82)
!96 = !DILocation(line: 139, column: 5, scope: !82)
!97 = !DILocation(line: 140, column: 5, scope: !82)
!98 = !DILocation(line: 143, column: 5, scope: !82)
!99 = !DILocation(line: 144, column: 5, scope: !82)
!100 = !DILocation(line: 145, column: 5, scope: !82)
!101 = !DILocation(line: 147, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !16, line: 61, type: !4)
!104 = !DILocation(line: 61, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !16, line: 62, type: !4)
!106 = !DILocation(line: 62, column: 15, scope: !102)
!107 = !DILocation(line: 62, column: 42, scope: !102)
!108 = !DILocation(line: 62, column: 31, scope: !102)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !16, line: 63, type: !4)
!110 = !DILocation(line: 63, column: 15, scope: !102)
!111 = !DILocation(line: 63, column: 43, scope: !102)
!112 = !DILocation(line: 63, column: 32, scope: !102)
!113 = !DILocation(line: 64, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !16, line: 64, column: 8)
!115 = !DILocation(line: 64, column: 25, scope: !114)
!116 = !DILocation(line: 64, column: 8, scope: !102)
!117 = !DILocation(line: 67, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !16, line: 65, column: 5)
!119 = !DILocation(line: 68, column: 5, scope: !118)
!120 = !DILocation(line: 73, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !16, line: 70, column: 5)
!122 = !DILocation(line: 73, column: 14, scope: !121)
!123 = !DILocation(line: 74, column: 9, scope: !121)
!124 = !DILocation(line: 74, column: 17, scope: !121)
!125 = !DILocalVariable(name: "source", scope: !126, file: !16, line: 77, type: !41)
!126 = distinct !DILexicalBlock(scope: !102, file: !16, line: 76, column: 5)
!127 = !DILocation(line: 77, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !16, line: 78, type: !46)
!129 = !DILocation(line: 78, column: 16, scope: !126)
!130 = !DILocalVariable(name: "sourceLen", scope: !126, file: !16, line: 78, type: !46)
!131 = !DILocation(line: 78, column: 19, scope: !126)
!132 = !DILocation(line: 79, column: 28, scope: !126)
!133 = !DILocation(line: 79, column: 21, scope: !126)
!134 = !DILocation(line: 79, column: 19, scope: !126)
!135 = !DILocation(line: 82, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !16, line: 82, column: 9)
!137 = !DILocation(line: 82, column: 14, scope: !136)
!138 = !DILocation(line: 82, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !16, line: 82, column: 9)
!140 = !DILocation(line: 82, column: 25, scope: !139)
!141 = !DILocation(line: 82, column: 35, scope: !139)
!142 = !DILocation(line: 82, column: 23, scope: !139)
!143 = !DILocation(line: 82, column: 9, scope: !136)
!144 = !DILocation(line: 84, column: 30, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !16, line: 83, column: 9)
!146 = !DILocation(line: 84, column: 23, scope: !145)
!147 = !DILocation(line: 84, column: 13, scope: !145)
!148 = !DILocation(line: 84, column: 18, scope: !145)
!149 = !DILocation(line: 84, column: 21, scope: !145)
!150 = !DILocation(line: 85, column: 9, scope: !145)
!151 = !DILocation(line: 82, column: 41, scope: !139)
!152 = !DILocation(line: 82, column: 9, scope: !139)
!153 = distinct !{!153, !143, !154, !74}
!154 = !DILocation(line: 85, column: 9, scope: !136)
!155 = !DILocation(line: 86, column: 20, scope: !126)
!156 = !DILocation(line: 86, column: 9, scope: !126)
!157 = !DILocation(line: 88, column: 1, scope: !102)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DILocalVariable(name: "data", scope: !158, file: !16, line: 93, type: !4)
!160 = !DILocation(line: 93, column: 15, scope: !158)
!161 = !DILocalVariable(name: "dataBadBuffer", scope: !158, file: !16, line: 94, type: !4)
!162 = !DILocation(line: 94, column: 15, scope: !158)
!163 = !DILocation(line: 94, column: 42, scope: !158)
!164 = !DILocation(line: 94, column: 31, scope: !158)
!165 = !DILocalVariable(name: "dataGoodBuffer", scope: !158, file: !16, line: 95, type: !4)
!166 = !DILocation(line: 95, column: 15, scope: !158)
!167 = !DILocation(line: 95, column: 43, scope: !158)
!168 = !DILocation(line: 95, column: 32, scope: !158)
!169 = !DILocation(line: 96, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !158, file: !16, line: 96, column: 8)
!171 = !DILocation(line: 96, column: 25, scope: !170)
!172 = !DILocation(line: 96, column: 8, scope: !158)
!173 = !DILocation(line: 100, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !16, line: 97, column: 5)
!175 = !DILocation(line: 100, column: 14, scope: !174)
!176 = !DILocation(line: 101, column: 9, scope: !174)
!177 = !DILocation(line: 101, column: 17, scope: !174)
!178 = !DILocation(line: 102, column: 5, scope: !174)
!179 = !DILocalVariable(name: "source", scope: !180, file: !16, line: 104, type: !41)
!180 = distinct !DILexicalBlock(scope: !158, file: !16, line: 103, column: 5)
!181 = !DILocation(line: 104, column: 17, scope: !180)
!182 = !DILocalVariable(name: "i", scope: !180, file: !16, line: 105, type: !46)
!183 = !DILocation(line: 105, column: 16, scope: !180)
!184 = !DILocalVariable(name: "sourceLen", scope: !180, file: !16, line: 105, type: !46)
!185 = !DILocation(line: 105, column: 19, scope: !180)
!186 = !DILocation(line: 106, column: 28, scope: !180)
!187 = !DILocation(line: 106, column: 21, scope: !180)
!188 = !DILocation(line: 106, column: 19, scope: !180)
!189 = !DILocation(line: 109, column: 16, scope: !190)
!190 = distinct !DILexicalBlock(scope: !180, file: !16, line: 109, column: 9)
!191 = !DILocation(line: 109, column: 14, scope: !190)
!192 = !DILocation(line: 109, column: 21, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !16, line: 109, column: 9)
!194 = !DILocation(line: 109, column: 25, scope: !193)
!195 = !DILocation(line: 109, column: 35, scope: !193)
!196 = !DILocation(line: 109, column: 23, scope: !193)
!197 = !DILocation(line: 109, column: 9, scope: !190)
!198 = !DILocation(line: 111, column: 30, scope: !199)
!199 = distinct !DILexicalBlock(scope: !193, file: !16, line: 110, column: 9)
!200 = !DILocation(line: 111, column: 23, scope: !199)
!201 = !DILocation(line: 111, column: 13, scope: !199)
!202 = !DILocation(line: 111, column: 18, scope: !199)
!203 = !DILocation(line: 111, column: 21, scope: !199)
!204 = !DILocation(line: 112, column: 9, scope: !199)
!205 = !DILocation(line: 109, column: 41, scope: !193)
!206 = !DILocation(line: 109, column: 9, scope: !193)
!207 = distinct !{!207, !197, !208, !74}
!208 = !DILocation(line: 112, column: 9, scope: !190)
!209 = !DILocation(line: 113, column: 20, scope: !180)
!210 = !DILocation(line: 113, column: 9, scope: !180)
!211 = !DILocation(line: 115, column: 1, scope: !158)
