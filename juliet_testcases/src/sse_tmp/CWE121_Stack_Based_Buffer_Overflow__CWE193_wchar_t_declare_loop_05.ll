; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad.source to i8*), i64 44, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !55
  store i64 %call, i64* %sourceLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !60
  %4 = load i64, i64* %sourceLen, align 8, !dbg !62
  %add = add i64 %4, 1, !dbg !63
  %cmp = icmp ult i64 %3, %add, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !68
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !68
  %7 = load i32*, i32** %data, align 8, !dbg !69
  %8 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !69
  store i32 %6, i32* %arrayidx3, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %9, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %10), !dbg !79
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_good() #0 !dbg !81 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad(), !dbg !102
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
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* @staticFalse, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

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
  %cmp = icmp ult i64 %3, %add, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !144
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !144
  %7 = load i32*, i32** %data, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !145
  store i32 %6, i32* %arrayidx3, align 4, !dbg !147
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !163
  %tobool = icmp ne i32 %0, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !166
  store i32* %arraydecay, i32** %data, align 8, !dbg !168
  %1 = load i32*, i32** %data, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !169
  store i32 0, i32* %arrayidx, align 4, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !172, metadata !DIExpression()), !dbg !174
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !174
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !177, metadata !DIExpression()), !dbg !178
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !179
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !180
  store i64 %call, i64* %sourceLen, align 8, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !185
  %4 = load i64, i64* %sourceLen, align 8, !dbg !187
  %add = add i64 %4, 1, !dbg !188
  %cmp = icmp ult i64 %3, %add, !dbg !189
  br i1 %cmp, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !193
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !193
  %7 = load i32*, i32** %data, align 8, !dbg !194
  %8 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !194
  store i32 %6, i32* %arrayidx3, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %9, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !202
  call void @printWLine(i32* %10), !dbg !203
  ret void, !dbg !204
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 31, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad", scope: !10, file: !10, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 37, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 38, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 38, column: 13, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 39, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 39, column: 13, scope: !18)
!36 = !DILocation(line: 40, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 8)
!38 = !DILocation(line: 40, column: 8, scope: !18)
!39 = !DILocation(line: 44, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 41, column: 5)
!41 = !DILocation(line: 44, column: 14, scope: !40)
!42 = !DILocation(line: 45, column: 9, scope: !40)
!43 = !DILocation(line: 45, column: 17, scope: !40)
!44 = !DILocation(line: 46, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !10, line: 48, type: !32)
!46 = distinct !DILexicalBlock(scope: !18, file: !10, line: 47, column: 5)
!47 = !DILocation(line: 48, column: 17, scope: !46)
!48 = !DILocalVariable(name: "i", scope: !46, file: !10, line: 49, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 49, column: 16, scope: !46)
!52 = !DILocalVariable(name: "sourceLen", scope: !46, file: !10, line: 49, type: !49)
!53 = !DILocation(line: 49, column: 19, scope: !46)
!54 = !DILocation(line: 50, column: 28, scope: !46)
!55 = !DILocation(line: 50, column: 21, scope: !46)
!56 = !DILocation(line: 50, column: 19, scope: !46)
!57 = !DILocation(line: 53, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !46, file: !10, line: 53, column: 9)
!59 = !DILocation(line: 53, column: 14, scope: !58)
!60 = !DILocation(line: 53, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !10, line: 53, column: 9)
!62 = !DILocation(line: 53, column: 25, scope: !61)
!63 = !DILocation(line: 53, column: 35, scope: !61)
!64 = !DILocation(line: 53, column: 23, scope: !61)
!65 = !DILocation(line: 53, column: 9, scope: !58)
!66 = !DILocation(line: 55, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !10, line: 54, column: 9)
!68 = !DILocation(line: 55, column: 23, scope: !67)
!69 = !DILocation(line: 55, column: 13, scope: !67)
!70 = !DILocation(line: 55, column: 18, scope: !67)
!71 = !DILocation(line: 55, column: 21, scope: !67)
!72 = !DILocation(line: 56, column: 9, scope: !67)
!73 = !DILocation(line: 53, column: 41, scope: !61)
!74 = !DILocation(line: 53, column: 9, scope: !61)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 56, column: 9, scope: !58)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 57, column: 20, scope: !46)
!79 = !DILocation(line: 57, column: 9, scope: !46)
!80 = !DILocation(line: 59, column: 1, scope: !18)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_good", scope: !10, file: !10, line: 124, type: !19, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 126, column: 5, scope: !81)
!83 = !DILocation(line: 127, column: 5, scope: !81)
!84 = !DILocation(line: 128, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 140, type: !86, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!11, !11, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !10, line: 140, type: !11)
!92 = !DILocation(line: 140, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !10, line: 140, type: !88)
!94 = !DILocation(line: 140, column: 27, scope: !85)
!95 = !DILocation(line: 143, column: 22, scope: !85)
!96 = !DILocation(line: 143, column: 12, scope: !85)
!97 = !DILocation(line: 143, column: 5, scope: !85)
!98 = !DILocation(line: 145, column: 5, scope: !85)
!99 = !DILocation(line: 146, column: 5, scope: !85)
!100 = !DILocation(line: 147, column: 5, scope: !85)
!101 = !DILocation(line: 150, column: 5, scope: !85)
!102 = !DILocation(line: 151, column: 5, scope: !85)
!103 = !DILocation(line: 152, column: 5, scope: !85)
!104 = !DILocation(line: 154, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !10, line: 68, type: !22)
!107 = !DILocation(line: 68, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !10, line: 69, type: !27)
!109 = !DILocation(line: 69, column: 13, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !10, line: 70, type: !32)
!111 = !DILocation(line: 70, column: 13, scope: !105)
!112 = !DILocation(line: 71, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !10, line: 71, column: 8)
!114 = !DILocation(line: 71, column: 8, scope: !105)
!115 = !DILocation(line: 74, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !10, line: 72, column: 5)
!117 = !DILocation(line: 75, column: 5, scope: !116)
!118 = !DILocation(line: 80, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !10, line: 77, column: 5)
!120 = !DILocation(line: 80, column: 14, scope: !119)
!121 = !DILocation(line: 81, column: 9, scope: !119)
!122 = !DILocation(line: 81, column: 17, scope: !119)
!123 = !DILocalVariable(name: "source", scope: !124, file: !10, line: 84, type: !32)
!124 = distinct !DILexicalBlock(scope: !105, file: !10, line: 83, column: 5)
!125 = !DILocation(line: 84, column: 17, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !10, line: 85, type: !49)
!127 = !DILocation(line: 85, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !10, line: 85, type: !49)
!129 = !DILocation(line: 85, column: 19, scope: !124)
!130 = !DILocation(line: 86, column: 28, scope: !124)
!131 = !DILocation(line: 86, column: 21, scope: !124)
!132 = !DILocation(line: 86, column: 19, scope: !124)
!133 = !DILocation(line: 89, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !10, line: 89, column: 9)
!135 = !DILocation(line: 89, column: 14, scope: !134)
!136 = !DILocation(line: 89, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !10, line: 89, column: 9)
!138 = !DILocation(line: 89, column: 25, scope: !137)
!139 = !DILocation(line: 89, column: 35, scope: !137)
!140 = !DILocation(line: 89, column: 23, scope: !137)
!141 = !DILocation(line: 89, column: 9, scope: !134)
!142 = !DILocation(line: 91, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !10, line: 90, column: 9)
!144 = !DILocation(line: 91, column: 23, scope: !143)
!145 = !DILocation(line: 91, column: 13, scope: !143)
!146 = !DILocation(line: 91, column: 18, scope: !143)
!147 = !DILocation(line: 91, column: 21, scope: !143)
!148 = !DILocation(line: 92, column: 9, scope: !143)
!149 = !DILocation(line: 89, column: 41, scope: !137)
!150 = !DILocation(line: 89, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !77}
!152 = !DILocation(line: 92, column: 9, scope: !134)
!153 = !DILocation(line: 93, column: 20, scope: !124)
!154 = !DILocation(line: 93, column: 9, scope: !124)
!155 = !DILocation(line: 95, column: 1, scope: !105)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 98, type: !19, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !10, line: 100, type: !22)
!158 = !DILocation(line: 100, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !10, line: 101, type: !27)
!160 = !DILocation(line: 101, column: 13, scope: !156)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !10, line: 102, type: !32)
!162 = !DILocation(line: 102, column: 13, scope: !156)
!163 = !DILocation(line: 103, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !10, line: 103, column: 8)
!165 = !DILocation(line: 103, column: 8, scope: !156)
!166 = !DILocation(line: 107, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !10, line: 104, column: 5)
!168 = !DILocation(line: 107, column: 14, scope: !167)
!169 = !DILocation(line: 108, column: 9, scope: !167)
!170 = !DILocation(line: 108, column: 17, scope: !167)
!171 = !DILocation(line: 109, column: 5, scope: !167)
!172 = !DILocalVariable(name: "source", scope: !173, file: !10, line: 111, type: !32)
!173 = distinct !DILexicalBlock(scope: !156, file: !10, line: 110, column: 5)
!174 = !DILocation(line: 111, column: 17, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !173, file: !10, line: 112, type: !49)
!176 = !DILocation(line: 112, column: 16, scope: !173)
!177 = !DILocalVariable(name: "sourceLen", scope: !173, file: !10, line: 112, type: !49)
!178 = !DILocation(line: 112, column: 19, scope: !173)
!179 = !DILocation(line: 113, column: 28, scope: !173)
!180 = !DILocation(line: 113, column: 21, scope: !173)
!181 = !DILocation(line: 113, column: 19, scope: !173)
!182 = !DILocation(line: 116, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !10, line: 116, column: 9)
!184 = !DILocation(line: 116, column: 14, scope: !183)
!185 = !DILocation(line: 116, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !10, line: 116, column: 9)
!187 = !DILocation(line: 116, column: 25, scope: !186)
!188 = !DILocation(line: 116, column: 35, scope: !186)
!189 = !DILocation(line: 116, column: 23, scope: !186)
!190 = !DILocation(line: 116, column: 9, scope: !183)
!191 = !DILocation(line: 118, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !186, file: !10, line: 117, column: 9)
!193 = !DILocation(line: 118, column: 23, scope: !192)
!194 = !DILocation(line: 118, column: 13, scope: !192)
!195 = !DILocation(line: 118, column: 18, scope: !192)
!196 = !DILocation(line: 118, column: 21, scope: !192)
!197 = !DILocation(line: 119, column: 9, scope: !192)
!198 = !DILocation(line: 116, column: 41, scope: !186)
!199 = !DILocation(line: 116, column: 9, scope: !186)
!200 = distinct !{!200, !190, !201, !77}
!201 = !DILocation(line: 119, column: 9, scope: !183)
!202 = !DILocation(line: 120, column: 20, scope: !173)
!203 = !DILocation(line: 120, column: 9, scope: !173)
!204 = !DILocation(line: 122, column: 1, scope: !156)
