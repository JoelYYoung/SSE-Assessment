; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_bad() #0 !dbg !15 {
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
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %4, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %5, i32** %data, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_bad.source to i8*), i64 44, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !51
  store i64 %call, i64* %sourceLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !56
  %9 = load i64, i64* %sourceLen, align 8, !dbg !58
  %add = add i64 %9, 1, !dbg !59
  %cmp = icmp ult i64 %8, %add, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !64
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !64
  %12 = load i32*, i32** %data, align 8, !dbg !65
  %13 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !65
  store i32 %11, i32* %arrayidx2, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %14, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %15), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 40, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %2 = alloca i8, i64 44, align 16, !dbg !110
  %3 = bitcast i8* %2 to i32*, !dbg !111
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !109
  %4 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !112
  %tobool = icmp ne i32 %4, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !118
  store i32* %5, i32** %data, align 8, !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !130
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !131
  store i64 %call, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !136
  %9 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %9, 1, !dbg !139
  %cmp = icmp ult i64 %8, %add, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !144
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !144
  %12 = load i32*, i32** %data, align 8, !dbg !145
  %13 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !145
  store i32 %11, i32* %arrayidx2, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %14, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %15), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 40, align 16, !dbg !161
  %1 = bitcast i8* %0 to i32*, !dbg !162
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !160
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %2 = alloca i8, i64 44, align 16, !dbg !165
  %3 = bitcast i8* %2 to i32*, !dbg !166
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !164
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !167
  %tobool = icmp ne i32 %4, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.end, !dbg !169

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !170
  store i32* %5, i32** %data, align 8, !dbg !172
  %6 = load i32*, i32** %data, align 8, !dbg !173
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !173
  store i32 0, i32* %arrayidx, align 4, !dbg !174
  br label %if.end, !dbg !175

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !176, metadata !DIExpression()), !dbg !178
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !181, metadata !DIExpression()), !dbg !182
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !183
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !184
  store i64 %call, i64* %sourceLen, align 8, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !189
  %9 = load i64, i64* %sourceLen, align 8, !dbg !191
  %add = add i64 %9, 1, !dbg !192
  %cmp = icmp ult i64 %8, %add, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !197
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !197
  %12 = load i32*, i32** %data, align 8, !dbg !198
  %13 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !198
  store i32 %11, i32* %arrayidx2, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %14, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !206
  call void @printWLine(i32* %15), !dbg !207
  ret void, !dbg !208
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 33, column: 8, scope: !15)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 41, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !16, line: 42, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 42, column: 16, scope: !39)
!48 = !DILocalVariable(name: "sourceLen", scope: !39, file: !16, line: 42, type: !45)
!49 = !DILocation(line: 42, column: 19, scope: !39)
!50 = !DILocation(line: 43, column: 28, scope: !39)
!51 = !DILocation(line: 43, column: 21, scope: !39)
!52 = !DILocation(line: 43, column: 19, scope: !39)
!53 = !DILocation(line: 46, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !16, line: 46, column: 9)
!55 = !DILocation(line: 46, column: 14, scope: !54)
!56 = !DILocation(line: 46, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !16, line: 46, column: 9)
!58 = !DILocation(line: 46, column: 25, scope: !57)
!59 = !DILocation(line: 46, column: 35, scope: !57)
!60 = !DILocation(line: 46, column: 23, scope: !57)
!61 = !DILocation(line: 46, column: 9, scope: !54)
!62 = !DILocation(line: 48, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !16, line: 47, column: 9)
!64 = !DILocation(line: 48, column: 23, scope: !63)
!65 = !DILocation(line: 48, column: 13, scope: !63)
!66 = !DILocation(line: 48, column: 18, scope: !63)
!67 = !DILocation(line: 48, column: 21, scope: !63)
!68 = !DILocation(line: 49, column: 9, scope: !63)
!69 = !DILocation(line: 46, column: 41, scope: !57)
!70 = !DILocation(line: 46, column: 9, scope: !57)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 49, column: 9, scope: !54)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 50, column: 20, scope: !39)
!75 = !DILocation(line: 50, column: 9, scope: !39)
!76 = !DILocation(line: 52, column: 1, scope: !15)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_09_good", scope: !16, file: !16, line: 117, type: !17, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 119, column: 5, scope: !77)
!79 = !DILocation(line: 120, column: 5, scope: !77)
!80 = !DILocation(line: 121, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 133, type: !82, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !16, line: 133, type: !7)
!88 = !DILocation(line: 133, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !16, line: 133, type: !84)
!90 = !DILocation(line: 133, column: 27, scope: !81)
!91 = !DILocation(line: 136, column: 22, scope: !81)
!92 = !DILocation(line: 136, column: 12, scope: !81)
!93 = !DILocation(line: 136, column: 5, scope: !81)
!94 = !DILocation(line: 138, column: 5, scope: !81)
!95 = !DILocation(line: 139, column: 5, scope: !81)
!96 = !DILocation(line: 140, column: 5, scope: !81)
!97 = !DILocation(line: 143, column: 5, scope: !81)
!98 = !DILocation(line: 144, column: 5, scope: !81)
!99 = !DILocation(line: 145, column: 5, scope: !81)
!100 = !DILocation(line: 147, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 61, type: !4)
!103 = !DILocation(line: 61, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !16, line: 62, type: !4)
!105 = !DILocation(line: 62, column: 15, scope: !101)
!106 = !DILocation(line: 62, column: 42, scope: !101)
!107 = !DILocation(line: 62, column: 31, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !16, line: 63, type: !4)
!109 = !DILocation(line: 63, column: 15, scope: !101)
!110 = !DILocation(line: 63, column: 43, scope: !101)
!111 = !DILocation(line: 63, column: 32, scope: !101)
!112 = !DILocation(line: 64, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !16, line: 64, column: 8)
!114 = !DILocation(line: 64, column: 8, scope: !101)
!115 = !DILocation(line: 67, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !16, line: 65, column: 5)
!117 = !DILocation(line: 68, column: 5, scope: !116)
!118 = !DILocation(line: 73, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !16, line: 70, column: 5)
!120 = !DILocation(line: 73, column: 14, scope: !119)
!121 = !DILocation(line: 74, column: 9, scope: !119)
!122 = !DILocation(line: 74, column: 17, scope: !119)
!123 = !DILocalVariable(name: "source", scope: !124, file: !16, line: 77, type: !40)
!124 = distinct !DILexicalBlock(scope: !101, file: !16, line: 76, column: 5)
!125 = !DILocation(line: 77, column: 17, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !16, line: 78, type: !45)
!127 = !DILocation(line: 78, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !16, line: 78, type: !45)
!129 = !DILocation(line: 78, column: 19, scope: !124)
!130 = !DILocation(line: 79, column: 28, scope: !124)
!131 = !DILocation(line: 79, column: 21, scope: !124)
!132 = !DILocation(line: 79, column: 19, scope: !124)
!133 = !DILocation(line: 82, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !16, line: 82, column: 9)
!135 = !DILocation(line: 82, column: 14, scope: !134)
!136 = !DILocation(line: 82, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !16, line: 82, column: 9)
!138 = !DILocation(line: 82, column: 25, scope: !137)
!139 = !DILocation(line: 82, column: 35, scope: !137)
!140 = !DILocation(line: 82, column: 23, scope: !137)
!141 = !DILocation(line: 82, column: 9, scope: !134)
!142 = !DILocation(line: 84, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !16, line: 83, column: 9)
!144 = !DILocation(line: 84, column: 23, scope: !143)
!145 = !DILocation(line: 84, column: 13, scope: !143)
!146 = !DILocation(line: 84, column: 18, scope: !143)
!147 = !DILocation(line: 84, column: 21, scope: !143)
!148 = !DILocation(line: 85, column: 9, scope: !143)
!149 = !DILocation(line: 82, column: 41, scope: !137)
!150 = !DILocation(line: 82, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !73}
!152 = !DILocation(line: 85, column: 9, scope: !134)
!153 = !DILocation(line: 86, column: 20, scope: !124)
!154 = !DILocation(line: 86, column: 9, scope: !124)
!155 = !DILocation(line: 88, column: 1, scope: !101)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !16, line: 93, type: !4)
!158 = !DILocation(line: 93, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !16, line: 94, type: !4)
!160 = !DILocation(line: 94, column: 15, scope: !156)
!161 = !DILocation(line: 94, column: 42, scope: !156)
!162 = !DILocation(line: 94, column: 31, scope: !156)
!163 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !16, line: 95, type: !4)
!164 = !DILocation(line: 95, column: 15, scope: !156)
!165 = !DILocation(line: 95, column: 43, scope: !156)
!166 = !DILocation(line: 95, column: 32, scope: !156)
!167 = !DILocation(line: 96, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !156, file: !16, line: 96, column: 8)
!169 = !DILocation(line: 96, column: 8, scope: !156)
!170 = !DILocation(line: 100, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !16, line: 97, column: 5)
!172 = !DILocation(line: 100, column: 14, scope: !171)
!173 = !DILocation(line: 101, column: 9, scope: !171)
!174 = !DILocation(line: 101, column: 17, scope: !171)
!175 = !DILocation(line: 102, column: 5, scope: !171)
!176 = !DILocalVariable(name: "source", scope: !177, file: !16, line: 104, type: !40)
!177 = distinct !DILexicalBlock(scope: !156, file: !16, line: 103, column: 5)
!178 = !DILocation(line: 104, column: 17, scope: !177)
!179 = !DILocalVariable(name: "i", scope: !177, file: !16, line: 105, type: !45)
!180 = !DILocation(line: 105, column: 16, scope: !177)
!181 = !DILocalVariable(name: "sourceLen", scope: !177, file: !16, line: 105, type: !45)
!182 = !DILocation(line: 105, column: 19, scope: !177)
!183 = !DILocation(line: 106, column: 28, scope: !177)
!184 = !DILocation(line: 106, column: 21, scope: !177)
!185 = !DILocation(line: 106, column: 19, scope: !177)
!186 = !DILocation(line: 109, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !177, file: !16, line: 109, column: 9)
!188 = !DILocation(line: 109, column: 14, scope: !187)
!189 = !DILocation(line: 109, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !16, line: 109, column: 9)
!191 = !DILocation(line: 109, column: 25, scope: !190)
!192 = !DILocation(line: 109, column: 35, scope: !190)
!193 = !DILocation(line: 109, column: 23, scope: !190)
!194 = !DILocation(line: 109, column: 9, scope: !187)
!195 = !DILocation(line: 111, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !190, file: !16, line: 110, column: 9)
!197 = !DILocation(line: 111, column: 23, scope: !196)
!198 = !DILocation(line: 111, column: 13, scope: !196)
!199 = !DILocation(line: 111, column: 18, scope: !196)
!200 = !DILocation(line: 111, column: 21, scope: !196)
!201 = !DILocation(line: 112, column: 9, scope: !196)
!202 = !DILocation(line: 109, column: 41, scope: !190)
!203 = !DILocation(line: 109, column: 9, scope: !190)
!204 = distinct !{!204, !194, !205, !73}
!205 = !DILocation(line: 112, column: 9, scope: !187)
!206 = !DILocation(line: 113, column: 20, scope: !177)
!207 = !DILocation(line: 113, column: 9, scope: !177)
!208 = !DILocation(line: 115, column: 1, scope: !156)
