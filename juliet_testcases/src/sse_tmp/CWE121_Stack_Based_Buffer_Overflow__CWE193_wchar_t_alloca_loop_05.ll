; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %5, i32** %data, align 8, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad.source to i8*), i64 44, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !56
  store i64 %call, i64* %sourceLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !61
  %9 = load i64, i64* %sourceLen, align 8, !dbg !63
  %add = add i64 %9, 1, !dbg !64
  %cmp = icmp ult i64 %8, %add, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !69
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !69
  %12 = load i32*, i32** %data, align 8, !dbg !70
  %13 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !70
  store i32 %11, i32* %arrayidx2, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %14, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %15), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 40, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %2 = alloca i8, i64 44, align 16, !dbg !115
  %3 = bitcast i8* %2 to i32*, !dbg !116
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !114
  %4 = load i32, i32* @staticFalse, align 4, !dbg !117
  %tobool = icmp ne i32 %4, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

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
  %cmp = icmp ult i64 %8, %add, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !149
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !149
  %12 = load i32*, i32** %data, align 8, !dbg !150
  %13 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !150
  store i32 %11, i32* %arrayidx2, align 4, !dbg !152
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
  %4 = load i32, i32* @staticTrue, align 4, !dbg !172
  %tobool = icmp ne i32 %4, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !175
  store i32* %5, i32** %data, align 8, !dbg !177
  %6 = load i32*, i32** %data, align 8, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !178
  store i32 0, i32* %arrayidx, align 4, !dbg !179
  br label %if.end, !dbg !180

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !181, metadata !DIExpression()), !dbg !183
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !186, metadata !DIExpression()), !dbg !187
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !188
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !189
  store i64 %call, i64* %sourceLen, align 8, !dbg !190
  store i64 0, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !194
  %9 = load i64, i64* %sourceLen, align 8, !dbg !196
  %add = add i64 %9, 1, !dbg !197
  %cmp = icmp ult i64 %8, %add, !dbg !198
  br i1 %cmp, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !202
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !202
  %12 = load i32*, i32** %data, align 8, !dbg !203
  %13 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !203
  store i32 %11, i32* %arrayidx2, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %14, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* %15), !dbg !212
  ret void, !dbg !213
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 31, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad", scope: !14, file: !14, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 37, type: !6)
!25 = !DILocation(line: 37, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 38, type: !6)
!27 = !DILocation(line: 38, column: 15, scope: !21)
!28 = !DILocation(line: 38, column: 42, scope: !21)
!29 = !DILocation(line: 38, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 39, type: !6)
!31 = !DILocation(line: 39, column: 15, scope: !21)
!32 = !DILocation(line: 39, column: 43, scope: !21)
!33 = !DILocation(line: 39, column: 32, scope: !21)
!34 = !DILocation(line: 40, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 40, column: 8)
!36 = !DILocation(line: 40, column: 8, scope: !21)
!37 = !DILocation(line: 44, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 41, column: 5)
!39 = !DILocation(line: 44, column: 14, scope: !38)
!40 = !DILocation(line: 45, column: 9, scope: !38)
!41 = !DILocation(line: 45, column: 17, scope: !38)
!42 = !DILocation(line: 46, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 48, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !14, line: 47, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 48, column: 17, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !14, line: 49, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 49, column: 16, scope: !44)
!53 = !DILocalVariable(name: "sourceLen", scope: !44, file: !14, line: 49, type: !50)
!54 = !DILocation(line: 49, column: 19, scope: !44)
!55 = !DILocation(line: 50, column: 28, scope: !44)
!56 = !DILocation(line: 50, column: 21, scope: !44)
!57 = !DILocation(line: 50, column: 19, scope: !44)
!58 = !DILocation(line: 53, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !44, file: !14, line: 53, column: 9)
!60 = !DILocation(line: 53, column: 14, scope: !59)
!61 = !DILocation(line: 53, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !14, line: 53, column: 9)
!63 = !DILocation(line: 53, column: 25, scope: !62)
!64 = !DILocation(line: 53, column: 35, scope: !62)
!65 = !DILocation(line: 53, column: 23, scope: !62)
!66 = !DILocation(line: 53, column: 9, scope: !59)
!67 = !DILocation(line: 55, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !14, line: 54, column: 9)
!69 = !DILocation(line: 55, column: 23, scope: !68)
!70 = !DILocation(line: 55, column: 13, scope: !68)
!71 = !DILocation(line: 55, column: 18, scope: !68)
!72 = !DILocation(line: 55, column: 21, scope: !68)
!73 = !DILocation(line: 56, column: 9, scope: !68)
!74 = !DILocation(line: 53, column: 41, scope: !62)
!75 = !DILocation(line: 53, column: 9, scope: !62)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 56, column: 9, scope: !59)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 57, column: 20, scope: !44)
!80 = !DILocation(line: 57, column: 9, scope: !44)
!81 = !DILocation(line: 59, column: 1, scope: !21)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_good", scope: !14, file: !14, line: 124, type: !22, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocation(line: 126, column: 5, scope: !82)
!84 = !DILocation(line: 127, column: 5, scope: !82)
!85 = !DILocation(line: 128, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 140, type: !87, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!9, !9, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !14, line: 140, type: !9)
!93 = !DILocation(line: 140, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !14, line: 140, type: !89)
!95 = !DILocation(line: 140, column: 27, scope: !86)
!96 = !DILocation(line: 143, column: 22, scope: !86)
!97 = !DILocation(line: 143, column: 12, scope: !86)
!98 = !DILocation(line: 143, column: 5, scope: !86)
!99 = !DILocation(line: 145, column: 5, scope: !86)
!100 = !DILocation(line: 146, column: 5, scope: !86)
!101 = !DILocation(line: 147, column: 5, scope: !86)
!102 = !DILocation(line: 150, column: 5, scope: !86)
!103 = !DILocation(line: 151, column: 5, scope: !86)
!104 = !DILocation(line: 152, column: 5, scope: !86)
!105 = !DILocation(line: 154, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 68, type: !6)
!108 = !DILocation(line: 68, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !14, line: 69, type: !6)
!110 = !DILocation(line: 69, column: 15, scope: !106)
!111 = !DILocation(line: 69, column: 42, scope: !106)
!112 = !DILocation(line: 69, column: 31, scope: !106)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !14, line: 70, type: !6)
!114 = !DILocation(line: 70, column: 15, scope: !106)
!115 = !DILocation(line: 70, column: 43, scope: !106)
!116 = !DILocation(line: 70, column: 32, scope: !106)
!117 = !DILocation(line: 71, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !106, file: !14, line: 71, column: 8)
!119 = !DILocation(line: 71, column: 8, scope: !106)
!120 = !DILocation(line: 74, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !14, line: 72, column: 5)
!122 = !DILocation(line: 75, column: 5, scope: !121)
!123 = !DILocation(line: 80, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !14, line: 77, column: 5)
!125 = !DILocation(line: 80, column: 14, scope: !124)
!126 = !DILocation(line: 81, column: 9, scope: !124)
!127 = !DILocation(line: 81, column: 17, scope: !124)
!128 = !DILocalVariable(name: "source", scope: !129, file: !14, line: 84, type: !45)
!129 = distinct !DILexicalBlock(scope: !106, file: !14, line: 83, column: 5)
!130 = !DILocation(line: 84, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !14, line: 85, type: !50)
!132 = !DILocation(line: 85, column: 16, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !14, line: 85, type: !50)
!134 = !DILocation(line: 85, column: 19, scope: !129)
!135 = !DILocation(line: 86, column: 28, scope: !129)
!136 = !DILocation(line: 86, column: 21, scope: !129)
!137 = !DILocation(line: 86, column: 19, scope: !129)
!138 = !DILocation(line: 89, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !14, line: 89, column: 9)
!140 = !DILocation(line: 89, column: 14, scope: !139)
!141 = !DILocation(line: 89, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !14, line: 89, column: 9)
!143 = !DILocation(line: 89, column: 25, scope: !142)
!144 = !DILocation(line: 89, column: 35, scope: !142)
!145 = !DILocation(line: 89, column: 23, scope: !142)
!146 = !DILocation(line: 89, column: 9, scope: !139)
!147 = !DILocation(line: 91, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !14, line: 90, column: 9)
!149 = !DILocation(line: 91, column: 23, scope: !148)
!150 = !DILocation(line: 91, column: 13, scope: !148)
!151 = !DILocation(line: 91, column: 18, scope: !148)
!152 = !DILocation(line: 91, column: 21, scope: !148)
!153 = !DILocation(line: 92, column: 9, scope: !148)
!154 = !DILocation(line: 89, column: 41, scope: !142)
!155 = !DILocation(line: 89, column: 9, scope: !142)
!156 = distinct !{!156, !146, !157, !78}
!157 = !DILocation(line: 92, column: 9, scope: !139)
!158 = !DILocation(line: 93, column: 20, scope: !129)
!159 = !DILocation(line: 93, column: 9, scope: !129)
!160 = !DILocation(line: 95, column: 1, scope: !106)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 98, type: !22, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DILocalVariable(name: "data", scope: !161, file: !14, line: 100, type: !6)
!163 = !DILocation(line: 100, column: 15, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !14, line: 101, type: !6)
!165 = !DILocation(line: 101, column: 15, scope: !161)
!166 = !DILocation(line: 101, column: 42, scope: !161)
!167 = !DILocation(line: 101, column: 31, scope: !161)
!168 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !14, line: 102, type: !6)
!169 = !DILocation(line: 102, column: 15, scope: !161)
!170 = !DILocation(line: 102, column: 43, scope: !161)
!171 = !DILocation(line: 102, column: 32, scope: !161)
!172 = !DILocation(line: 103, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !14, line: 103, column: 8)
!174 = !DILocation(line: 103, column: 8, scope: !161)
!175 = !DILocation(line: 107, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !14, line: 104, column: 5)
!177 = !DILocation(line: 107, column: 14, scope: !176)
!178 = !DILocation(line: 108, column: 9, scope: !176)
!179 = !DILocation(line: 108, column: 17, scope: !176)
!180 = !DILocation(line: 109, column: 5, scope: !176)
!181 = !DILocalVariable(name: "source", scope: !182, file: !14, line: 111, type: !45)
!182 = distinct !DILexicalBlock(scope: !161, file: !14, line: 110, column: 5)
!183 = !DILocation(line: 111, column: 17, scope: !182)
!184 = !DILocalVariable(name: "i", scope: !182, file: !14, line: 112, type: !50)
!185 = !DILocation(line: 112, column: 16, scope: !182)
!186 = !DILocalVariable(name: "sourceLen", scope: !182, file: !14, line: 112, type: !50)
!187 = !DILocation(line: 112, column: 19, scope: !182)
!188 = !DILocation(line: 113, column: 28, scope: !182)
!189 = !DILocation(line: 113, column: 21, scope: !182)
!190 = !DILocation(line: 113, column: 19, scope: !182)
!191 = !DILocation(line: 116, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !182, file: !14, line: 116, column: 9)
!193 = !DILocation(line: 116, column: 14, scope: !192)
!194 = !DILocation(line: 116, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !14, line: 116, column: 9)
!196 = !DILocation(line: 116, column: 25, scope: !195)
!197 = !DILocation(line: 116, column: 35, scope: !195)
!198 = !DILocation(line: 116, column: 23, scope: !195)
!199 = !DILocation(line: 116, column: 9, scope: !192)
!200 = !DILocation(line: 118, column: 30, scope: !201)
!201 = distinct !DILexicalBlock(scope: !195, file: !14, line: 117, column: 9)
!202 = !DILocation(line: 118, column: 23, scope: !201)
!203 = !DILocation(line: 118, column: 13, scope: !201)
!204 = !DILocation(line: 118, column: 18, scope: !201)
!205 = !DILocation(line: 118, column: 21, scope: !201)
!206 = !DILocation(line: 119, column: 9, scope: !201)
!207 = !DILocation(line: 116, column: 41, scope: !195)
!208 = !DILocation(line: 116, column: 9, scope: !195)
!209 = distinct !{!209, !199, !210, !78}
!210 = !DILocation(line: 119, column: 9, scope: !192)
!211 = !DILocation(line: 120, column: 20, scope: !182)
!212 = !DILocation(line: 120, column: 9, scope: !182)
!213 = !DILocation(line: 122, column: 1, scope: !161)
