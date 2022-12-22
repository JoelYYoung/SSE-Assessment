; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_bad.source to i8*), i64 44, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !53
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !54
  store i64 %call, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !59
  %4 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %4, 1, !dbg !62
  %cmp2 = icmp ult i64 %3, %add, !dbg !63
  br i1 %cmp2, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !67
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !67
  %7 = load i32*, i32** %data, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !68
  store i32 %6, i32* %arrayidx4, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %10), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32, i32* @staticFive, align 4, !dbg !111
  %cmp = icmp ne i32 %0, 5, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !118
  store i32* %arraydecay, i32** %data, align 8, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !130
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !131
  store i64 %call, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !136
  %4 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %4, 1, !dbg !139
  %cmp2 = icmp ult i64 %3, %add, !dbg !140
  br i1 %cmp2, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !144
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !144
  %7 = load i32*, i32** %data, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !145
  store i32 %6, i32* %arrayidx4, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %9, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %10), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = load i32, i32* @staticFive, align 4, !dbg !163
  %cmp = icmp eq i32 %0, 5, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !167
  store i32* %arraydecay, i32** %data, align 8, !dbg !169
  %1 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !170
  store i32 0, i32* %arrayidx, align 4, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !173, metadata !DIExpression()), !dbg !175
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !180
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !181
  store i64 %call, i64* %sourceLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !186
  %4 = load i64, i64* %sourceLen, align 8, !dbg !188
  %add = add i64 %4, 1, !dbg !189
  %cmp2 = icmp ult i64 %3, %add, !dbg !190
  br i1 %cmp2, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !194
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !194
  %7 = load i32*, i32** %data, align 8, !dbg !195
  %8 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !195
  store i32 %6, i32* %arrayidx4, align 4, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %9, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !203
  call void @printWLine(i32* %10), !dbg !204
  ret void, !dbg !205
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_bad", scope: !8, file: !8, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 36, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DILocation(line: 36, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 37, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 37, column: 13, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 38, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 38, column: 13, scope: !16)
!34 = !DILocation(line: 39, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !8, line: 39, column: 8)
!36 = !DILocation(line: 39, column: 18, scope: !35)
!37 = !DILocation(line: 39, column: 8, scope: !16)
!38 = !DILocation(line: 43, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 40, column: 5)
!40 = !DILocation(line: 43, column: 14, scope: !39)
!41 = !DILocation(line: 44, column: 9, scope: !39)
!42 = !DILocation(line: 44, column: 17, scope: !39)
!43 = !DILocation(line: 45, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !8, line: 47, type: !30)
!45 = distinct !DILexicalBlock(scope: !16, file: !8, line: 46, column: 5)
!46 = !DILocation(line: 47, column: 17, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !45, file: !8, line: 48, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 48, column: 16, scope: !45)
!51 = !DILocalVariable(name: "sourceLen", scope: !45, file: !8, line: 48, type: !48)
!52 = !DILocation(line: 48, column: 19, scope: !45)
!53 = !DILocation(line: 49, column: 28, scope: !45)
!54 = !DILocation(line: 49, column: 21, scope: !45)
!55 = !DILocation(line: 49, column: 19, scope: !45)
!56 = !DILocation(line: 52, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !45, file: !8, line: 52, column: 9)
!58 = !DILocation(line: 52, column: 14, scope: !57)
!59 = !DILocation(line: 52, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !8, line: 52, column: 9)
!61 = !DILocation(line: 52, column: 25, scope: !60)
!62 = !DILocation(line: 52, column: 35, scope: !60)
!63 = !DILocation(line: 52, column: 23, scope: !60)
!64 = !DILocation(line: 52, column: 9, scope: !57)
!65 = !DILocation(line: 54, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !8, line: 53, column: 9)
!67 = !DILocation(line: 54, column: 23, scope: !66)
!68 = !DILocation(line: 54, column: 13, scope: !66)
!69 = !DILocation(line: 54, column: 18, scope: !66)
!70 = !DILocation(line: 54, column: 21, scope: !66)
!71 = !DILocation(line: 55, column: 9, scope: !66)
!72 = !DILocation(line: 52, column: 41, scope: !60)
!73 = !DILocation(line: 52, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 55, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 56, column: 20, scope: !45)
!78 = !DILocation(line: 56, column: 9, scope: !45)
!79 = !DILocation(line: 58, column: 1, scope: !16)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_07_good", scope: !8, file: !8, line: 123, type: !17, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 125, column: 5, scope: !80)
!82 = !DILocation(line: 126, column: 5, scope: !80)
!83 = !DILocation(line: 127, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 139, type: !85, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!9, !9, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !8, line: 139, type: !9)
!91 = !DILocation(line: 139, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !8, line: 139, type: !87)
!93 = !DILocation(line: 139, column: 27, scope: !84)
!94 = !DILocation(line: 142, column: 22, scope: !84)
!95 = !DILocation(line: 142, column: 12, scope: !84)
!96 = !DILocation(line: 142, column: 5, scope: !84)
!97 = !DILocation(line: 144, column: 5, scope: !84)
!98 = !DILocation(line: 145, column: 5, scope: !84)
!99 = !DILocation(line: 146, column: 5, scope: !84)
!100 = !DILocation(line: 149, column: 5, scope: !84)
!101 = !DILocation(line: 150, column: 5, scope: !84)
!102 = !DILocation(line: 151, column: 5, scope: !84)
!103 = !DILocation(line: 153, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !8, line: 67, type: !20)
!106 = !DILocation(line: 67, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !8, line: 68, type: !25)
!108 = !DILocation(line: 68, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !8, line: 69, type: !30)
!110 = !DILocation(line: 69, column: 13, scope: !104)
!111 = !DILocation(line: 70, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !8, line: 70, column: 8)
!113 = !DILocation(line: 70, column: 18, scope: !112)
!114 = !DILocation(line: 70, column: 8, scope: !104)
!115 = !DILocation(line: 73, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !8, line: 71, column: 5)
!117 = !DILocation(line: 74, column: 5, scope: !116)
!118 = !DILocation(line: 79, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !8, line: 76, column: 5)
!120 = !DILocation(line: 79, column: 14, scope: !119)
!121 = !DILocation(line: 80, column: 9, scope: !119)
!122 = !DILocation(line: 80, column: 17, scope: !119)
!123 = !DILocalVariable(name: "source", scope: !124, file: !8, line: 83, type: !30)
!124 = distinct !DILexicalBlock(scope: !104, file: !8, line: 82, column: 5)
!125 = !DILocation(line: 83, column: 17, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !8, line: 84, type: !48)
!127 = !DILocation(line: 84, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !8, line: 84, type: !48)
!129 = !DILocation(line: 84, column: 19, scope: !124)
!130 = !DILocation(line: 85, column: 28, scope: !124)
!131 = !DILocation(line: 85, column: 21, scope: !124)
!132 = !DILocation(line: 85, column: 19, scope: !124)
!133 = !DILocation(line: 88, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !8, line: 88, column: 9)
!135 = !DILocation(line: 88, column: 14, scope: !134)
!136 = !DILocation(line: 88, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !8, line: 88, column: 9)
!138 = !DILocation(line: 88, column: 25, scope: !137)
!139 = !DILocation(line: 88, column: 35, scope: !137)
!140 = !DILocation(line: 88, column: 23, scope: !137)
!141 = !DILocation(line: 88, column: 9, scope: !134)
!142 = !DILocation(line: 90, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !8, line: 89, column: 9)
!144 = !DILocation(line: 90, column: 23, scope: !143)
!145 = !DILocation(line: 90, column: 13, scope: !143)
!146 = !DILocation(line: 90, column: 18, scope: !143)
!147 = !DILocation(line: 90, column: 21, scope: !143)
!148 = !DILocation(line: 91, column: 9, scope: !143)
!149 = !DILocation(line: 88, column: 41, scope: !137)
!150 = !DILocation(line: 88, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !76}
!152 = !DILocation(line: 91, column: 9, scope: !134)
!153 = !DILocation(line: 92, column: 20, scope: !124)
!154 = !DILocation(line: 92, column: 9, scope: !124)
!155 = !DILocation(line: 94, column: 1, scope: !104)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !8, line: 99, type: !20)
!158 = !DILocation(line: 99, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !8, line: 100, type: !25)
!160 = !DILocation(line: 100, column: 13, scope: !156)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !8, line: 101, type: !30)
!162 = !DILocation(line: 101, column: 13, scope: !156)
!163 = !DILocation(line: 102, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !8, line: 102, column: 8)
!165 = !DILocation(line: 102, column: 18, scope: !164)
!166 = !DILocation(line: 102, column: 8, scope: !156)
!167 = !DILocation(line: 106, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !8, line: 103, column: 5)
!169 = !DILocation(line: 106, column: 14, scope: !168)
!170 = !DILocation(line: 107, column: 9, scope: !168)
!171 = !DILocation(line: 107, column: 17, scope: !168)
!172 = !DILocation(line: 108, column: 5, scope: !168)
!173 = !DILocalVariable(name: "source", scope: !174, file: !8, line: 110, type: !30)
!174 = distinct !DILexicalBlock(scope: !156, file: !8, line: 109, column: 5)
!175 = !DILocation(line: 110, column: 17, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !8, line: 111, type: !48)
!177 = !DILocation(line: 111, column: 16, scope: !174)
!178 = !DILocalVariable(name: "sourceLen", scope: !174, file: !8, line: 111, type: !48)
!179 = !DILocation(line: 111, column: 19, scope: !174)
!180 = !DILocation(line: 112, column: 28, scope: !174)
!181 = !DILocation(line: 112, column: 21, scope: !174)
!182 = !DILocation(line: 112, column: 19, scope: !174)
!183 = !DILocation(line: 115, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !8, line: 115, column: 9)
!185 = !DILocation(line: 115, column: 14, scope: !184)
!186 = !DILocation(line: 115, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !8, line: 115, column: 9)
!188 = !DILocation(line: 115, column: 25, scope: !187)
!189 = !DILocation(line: 115, column: 35, scope: !187)
!190 = !DILocation(line: 115, column: 23, scope: !187)
!191 = !DILocation(line: 115, column: 9, scope: !184)
!192 = !DILocation(line: 117, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !187, file: !8, line: 116, column: 9)
!194 = !DILocation(line: 117, column: 23, scope: !193)
!195 = !DILocation(line: 117, column: 13, scope: !193)
!196 = !DILocation(line: 117, column: 18, scope: !193)
!197 = !DILocation(line: 117, column: 21, scope: !193)
!198 = !DILocation(line: 118, column: 9, scope: !193)
!199 = !DILocation(line: 115, column: 41, scope: !187)
!200 = !DILocation(line: 115, column: 9, scope: !187)
!201 = distinct !{!201, !191, !202, !76}
!202 = !DILocation(line: 118, column: 9, scope: !184)
!203 = !DILocation(line: 119, column: 20, scope: !174)
!204 = !DILocation(line: 119, column: 9, scope: !174)
!205 = !DILocation(line: 121, column: 1, scope: !156)
