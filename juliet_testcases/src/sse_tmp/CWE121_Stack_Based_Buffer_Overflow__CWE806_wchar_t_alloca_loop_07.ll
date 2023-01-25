; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %3 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %3, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !53
  store i64 %call1, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !58
  %9 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp2 = icmp ult i64 %8, %9, !dbg !61
  br i1 %cmp2, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !63
  %11 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !63
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !63
  %13 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !67
  store i32 %12, i32* %arrayidx4, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %14, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !75
  store i32 0, i32* %arrayidx5, align 4, !dbg !76
  %15 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %15), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07_good() #0 !dbg !80 {
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
  %call = call i64 @time(i64* null) #6, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #6, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %2, i32** %data, align 8, !dbg !112
  %3 = load i32, i32* @staticFive, align 4, !dbg !113
  %cmp = icmp ne i32 %3, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !120
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !131
  %7 = load i32*, i32** %data, align 8, !dbg !132
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !133
  store i64 %call1, i64* %dataLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !138
  %9 = load i64, i64* %dataLen, align 8, !dbg !140
  %cmp2 = icmp ult i64 %8, %9, !dbg !141
  br i1 %cmp2, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !143
  %11 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !143
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !143
  %13 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !147
  store i32 %12, i32* %arrayidx4, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %14, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !154
  store i32 0, i32* %arrayidx5, align 4, !dbg !155
  %15 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %15), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = alloca i8, i64 400, align 16, !dbg !164
  %1 = bitcast i8* %0 to i32*, !dbg !165
  store i32* %1, i32** %dataBuffer, align 8, !dbg !163
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !166
  store i32* %2, i32** %data, align 8, !dbg !167
  %3 = load i32, i32* @staticFive, align 4, !dbg !168
  %cmp = icmp eq i32 %3, 5, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !172
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !174
  %5 = load i32*, i32** %data, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !175
  store i32 0, i32* %arrayidx, align 4, !dbg !176
  br label %if.end, !dbg !177

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !178, metadata !DIExpression()), !dbg !180
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %i, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !183, metadata !DIExpression()), !dbg !184
  %7 = load i32*, i32** %data, align 8, !dbg !185
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !186
  store i64 %call1, i64* %dataLen, align 8, !dbg !187
  store i64 0, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !191
  %9 = load i64, i64* %dataLen, align 8, !dbg !193
  %cmp2 = icmp ult i64 %8, %9, !dbg !194
  br i1 %cmp2, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !196
  %11 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !196
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !196
  %13 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !200
  store i32 %12, i32* %arrayidx4, align 4, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !203
  %inc = add i64 %14, 1, !dbg !203
  store i64 %inc, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !207
  store i32 0, i32* %arrayidx5, align 4, !dbg !208
  %15 = load i32*, i32** %data, align 8, !dbg !209
  call void @printWLine(i32* %15), !dbg !210
  ret void, !dbg !211
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 39, scope: !19)
!27 = !DILocation(line: 32, column: 28, scope: !19)
!28 = !DILocation(line: 33, column: 12, scope: !19)
!29 = !DILocation(line: 33, column: 10, scope: !19)
!30 = !DILocation(line: 34, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !19, file: !12, line: 34, column: 8)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 8, scope: !19)
!34 = !DILocation(line: 37, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 9, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !12, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 17, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 42, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 16, scope: !41)
!50 = !DILocalVariable(name: "dataLen", scope: !41, file: !12, line: 42, type: !47)
!51 = !DILocation(line: 42, column: 19, scope: !41)
!52 = !DILocation(line: 43, column: 26, scope: !41)
!53 = !DILocation(line: 43, column: 19, scope: !41)
!54 = !DILocation(line: 43, column: 17, scope: !41)
!55 = !DILocation(line: 45, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !41, file: !12, line: 45, column: 9)
!57 = !DILocation(line: 45, column: 14, scope: !56)
!58 = !DILocation(line: 45, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 45, column: 9)
!60 = !DILocation(line: 45, column: 25, scope: !59)
!61 = !DILocation(line: 45, column: 23, scope: !59)
!62 = !DILocation(line: 45, column: 9, scope: !56)
!63 = !DILocation(line: 47, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !12, line: 46, column: 9)
!65 = !DILocation(line: 47, column: 28, scope: !64)
!66 = !DILocation(line: 47, column: 18, scope: !64)
!67 = !DILocation(line: 47, column: 13, scope: !64)
!68 = !DILocation(line: 47, column: 21, scope: !64)
!69 = !DILocation(line: 48, column: 9, scope: !64)
!70 = !DILocation(line: 45, column: 35, scope: !59)
!71 = !DILocation(line: 45, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 48, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 49, column: 9, scope: !41)
!76 = !DILocation(line: 49, column: 20, scope: !41)
!77 = !DILocation(line: 50, column: 20, scope: !41)
!78 = !DILocation(line: 50, column: 9, scope: !41)
!79 = !DILocation(line: 52, column: 1, scope: !19)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_07_good", scope: !12, file: !12, line: 115, type: !20, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 117, column: 5, scope: !80)
!82 = !DILocation(line: 118, column: 5, scope: !80)
!83 = !DILocation(line: 119, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !85, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!9, !9, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 131, type: !9)
!91 = !DILocation(line: 131, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 131, type: !87)
!93 = !DILocation(line: 131, column: 27, scope: !84)
!94 = !DILocation(line: 134, column: 22, scope: !84)
!95 = !DILocation(line: 134, column: 12, scope: !84)
!96 = !DILocation(line: 134, column: 5, scope: !84)
!97 = !DILocation(line: 136, column: 5, scope: !84)
!98 = !DILocation(line: 137, column: 5, scope: !84)
!99 = !DILocation(line: 138, column: 5, scope: !84)
!100 = !DILocation(line: 141, column: 5, scope: !84)
!101 = !DILocation(line: 142, column: 5, scope: !84)
!102 = !DILocation(line: 143, column: 5, scope: !84)
!103 = !DILocation(line: 145, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 61, type: !6)
!106 = !DILocation(line: 61, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !12, line: 62, type: !6)
!108 = !DILocation(line: 62, column: 15, scope: !104)
!109 = !DILocation(line: 62, column: 39, scope: !104)
!110 = !DILocation(line: 62, column: 28, scope: !104)
!111 = !DILocation(line: 63, column: 12, scope: !104)
!112 = !DILocation(line: 63, column: 10, scope: !104)
!113 = !DILocation(line: 64, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !12, line: 64, column: 8)
!115 = !DILocation(line: 64, column: 18, scope: !114)
!116 = !DILocation(line: 64, column: 8, scope: !104)
!117 = !DILocation(line: 67, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 65, column: 5)
!119 = !DILocation(line: 68, column: 5, scope: !118)
!120 = !DILocation(line: 72, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !12, line: 70, column: 5)
!122 = !DILocation(line: 72, column: 9, scope: !121)
!123 = !DILocation(line: 73, column: 9, scope: !121)
!124 = !DILocation(line: 73, column: 20, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !12, line: 76, type: !42)
!126 = distinct !DILexicalBlock(scope: !104, file: !12, line: 75, column: 5)
!127 = !DILocation(line: 76, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 77, type: !47)
!129 = !DILocation(line: 77, column: 16, scope: !126)
!130 = !DILocalVariable(name: "dataLen", scope: !126, file: !12, line: 77, type: !47)
!131 = !DILocation(line: 77, column: 19, scope: !126)
!132 = !DILocation(line: 78, column: 26, scope: !126)
!133 = !DILocation(line: 78, column: 19, scope: !126)
!134 = !DILocation(line: 78, column: 17, scope: !126)
!135 = !DILocation(line: 80, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !12, line: 80, column: 9)
!137 = !DILocation(line: 80, column: 14, scope: !136)
!138 = !DILocation(line: 80, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 80, column: 9)
!140 = !DILocation(line: 80, column: 25, scope: !139)
!141 = !DILocation(line: 80, column: 23, scope: !139)
!142 = !DILocation(line: 80, column: 9, scope: !136)
!143 = !DILocation(line: 82, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !12, line: 81, column: 9)
!145 = !DILocation(line: 82, column: 28, scope: !144)
!146 = !DILocation(line: 82, column: 18, scope: !144)
!147 = !DILocation(line: 82, column: 13, scope: !144)
!148 = !DILocation(line: 82, column: 21, scope: !144)
!149 = !DILocation(line: 83, column: 9, scope: !144)
!150 = !DILocation(line: 80, column: 35, scope: !139)
!151 = !DILocation(line: 80, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !74}
!153 = !DILocation(line: 83, column: 9, scope: !136)
!154 = !DILocation(line: 84, column: 9, scope: !126)
!155 = !DILocation(line: 84, column: 20, scope: !126)
!156 = !DILocation(line: 85, column: 20, scope: !126)
!157 = !DILocation(line: 85, column: 9, scope: !126)
!158 = !DILocation(line: 87, column: 1, scope: !104)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!160 = !DILocalVariable(name: "data", scope: !159, file: !12, line: 92, type: !6)
!161 = !DILocation(line: 92, column: 15, scope: !159)
!162 = !DILocalVariable(name: "dataBuffer", scope: !159, file: !12, line: 93, type: !6)
!163 = !DILocation(line: 93, column: 15, scope: !159)
!164 = !DILocation(line: 93, column: 39, scope: !159)
!165 = !DILocation(line: 93, column: 28, scope: !159)
!166 = !DILocation(line: 94, column: 12, scope: !159)
!167 = !DILocation(line: 94, column: 10, scope: !159)
!168 = !DILocation(line: 95, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !159, file: !12, line: 95, column: 8)
!170 = !DILocation(line: 95, column: 18, scope: !169)
!171 = !DILocation(line: 95, column: 8, scope: !159)
!172 = !DILocation(line: 98, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !12, line: 96, column: 5)
!174 = !DILocation(line: 98, column: 9, scope: !173)
!175 = !DILocation(line: 99, column: 9, scope: !173)
!176 = !DILocation(line: 99, column: 20, scope: !173)
!177 = !DILocation(line: 100, column: 5, scope: !173)
!178 = !DILocalVariable(name: "dest", scope: !179, file: !12, line: 102, type: !42)
!179 = distinct !DILexicalBlock(scope: !159, file: !12, line: 101, column: 5)
!180 = !DILocation(line: 102, column: 17, scope: !179)
!181 = !DILocalVariable(name: "i", scope: !179, file: !12, line: 103, type: !47)
!182 = !DILocation(line: 103, column: 16, scope: !179)
!183 = !DILocalVariable(name: "dataLen", scope: !179, file: !12, line: 103, type: !47)
!184 = !DILocation(line: 103, column: 19, scope: !179)
!185 = !DILocation(line: 104, column: 26, scope: !179)
!186 = !DILocation(line: 104, column: 19, scope: !179)
!187 = !DILocation(line: 104, column: 17, scope: !179)
!188 = !DILocation(line: 106, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !179, file: !12, line: 106, column: 9)
!190 = !DILocation(line: 106, column: 14, scope: !189)
!191 = !DILocation(line: 106, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !12, line: 106, column: 9)
!193 = !DILocation(line: 106, column: 25, scope: !192)
!194 = !DILocation(line: 106, column: 23, scope: !192)
!195 = !DILocation(line: 106, column: 9, scope: !189)
!196 = !DILocation(line: 108, column: 23, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !12, line: 107, column: 9)
!198 = !DILocation(line: 108, column: 28, scope: !197)
!199 = !DILocation(line: 108, column: 18, scope: !197)
!200 = !DILocation(line: 108, column: 13, scope: !197)
!201 = !DILocation(line: 108, column: 21, scope: !197)
!202 = !DILocation(line: 109, column: 9, scope: !197)
!203 = !DILocation(line: 106, column: 35, scope: !192)
!204 = !DILocation(line: 106, column: 9, scope: !192)
!205 = distinct !{!205, !195, !206, !74}
!206 = !DILocation(line: 109, column: 9, scope: !189)
!207 = !DILocation(line: 110, column: 9, scope: !179)
!208 = !DILocation(line: 110, column: 20, scope: !179)
!209 = !DILocation(line: 111, column: 20, scope: !179)
!210 = !DILocation(line: 111, column: 9, scope: !179)
!211 = !DILocation(line: 113, column: 1, scope: !159)
