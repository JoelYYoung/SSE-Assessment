; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !54
  store i64 %call1, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !59
  %9 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp = icmp ult i64 %8, %9, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !64
  %11 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !64
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !64
  %13 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !68
  store i32 %12, i32* %arrayidx3, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %14, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !76
  store i32 0, i32* %arrayidx4, align 4, !dbg !77
  %15 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %15), !dbg !79
  ret void, !dbg !80
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_good() #0 !dbg !81 {
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
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 400, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBuffer, align 8, !dbg !109
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  store i32* %2, i32** %data, align 8, !dbg !113
  %3 = load i32, i32* @staticFalse, align 4, !dbg !114
  %tobool = icmp ne i32 %3, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

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
  %cmp = icmp ult i64 %8, %9, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !143
  %11 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !143
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !143
  %13 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !147
  store i32 %12, i32* %arrayidx3, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %14, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !154
  store i32 0, i32* %arrayidx4, align 4, !dbg !155
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
  %3 = load i32, i32* @staticTrue, align 4, !dbg !168
  %tobool = icmp ne i32 %3, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !171
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !173
  %5 = load i32*, i32** %data, align 8, !dbg !174
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !174
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !177, metadata !DIExpression()), !dbg !179
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !182, metadata !DIExpression()), !dbg !183
  %7 = load i32*, i32** %data, align 8, !dbg !184
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !185
  store i64 %call1, i64* %dataLen, align 8, !dbg !186
  store i64 0, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !190
  %9 = load i64, i64* %dataLen, align 8, !dbg !192
  %cmp = icmp ult i64 %8, %9, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !195
  %11 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !195
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !195
  %13 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !199
  store i32 %12, i32* %arrayidx3, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %14, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !206
  store i32 0, i32* %arrayidx4, align 4, !dbg !207
  %15 = load i32*, i32** %data, align 8, !dbg !208
  call void @printWLine(i32* %15), !dbg !209
  ret void, !dbg !210
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 39, scope: !21)
!29 = !DILocation(line: 33, column: 28, scope: !21)
!30 = !DILocation(line: 34, column: 12, scope: !21)
!31 = !DILocation(line: 34, column: 10, scope: !21)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !21, file: !14, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 8, scope: !21)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !14, line: 36, column: 5)
!37 = !DILocation(line: 38, column: 9, scope: !36)
!38 = !DILocation(line: 39, column: 9, scope: !36)
!39 = !DILocation(line: 39, column: 21, scope: !36)
!40 = !DILocation(line: 40, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !14, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 42, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !14, line: 43, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 43, column: 16, scope: !42)
!51 = !DILocalVariable(name: "dataLen", scope: !42, file: !14, line: 43, type: !48)
!52 = !DILocation(line: 43, column: 19, scope: !42)
!53 = !DILocation(line: 44, column: 26, scope: !42)
!54 = !DILocation(line: 44, column: 19, scope: !42)
!55 = !DILocation(line: 44, column: 17, scope: !42)
!56 = !DILocation(line: 46, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !42, file: !14, line: 46, column: 9)
!58 = !DILocation(line: 46, column: 14, scope: !57)
!59 = !DILocation(line: 46, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !14, line: 46, column: 9)
!61 = !DILocation(line: 46, column: 25, scope: !60)
!62 = !DILocation(line: 46, column: 23, scope: !60)
!63 = !DILocation(line: 46, column: 9, scope: !57)
!64 = !DILocation(line: 48, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !14, line: 47, column: 9)
!66 = !DILocation(line: 48, column: 28, scope: !65)
!67 = !DILocation(line: 48, column: 18, scope: !65)
!68 = !DILocation(line: 48, column: 13, scope: !65)
!69 = !DILocation(line: 48, column: 21, scope: !65)
!70 = !DILocation(line: 49, column: 9, scope: !65)
!71 = !DILocation(line: 46, column: 35, scope: !60)
!72 = !DILocation(line: 46, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 49, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 50, column: 9, scope: !42)
!77 = !DILocation(line: 50, column: 20, scope: !42)
!78 = !DILocation(line: 51, column: 20, scope: !42)
!79 = !DILocation(line: 51, column: 9, scope: !42)
!80 = !DILocation(line: 53, column: 1, scope: !21)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_good", scope: !14, file: !14, line: 116, type: !22, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 118, column: 5, scope: !81)
!83 = !DILocation(line: 119, column: 5, scope: !81)
!84 = !DILocation(line: 120, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 132, type: !86, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!9, !9, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !14, line: 132, type: !9)
!92 = !DILocation(line: 132, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !14, line: 132, type: !88)
!94 = !DILocation(line: 132, column: 27, scope: !85)
!95 = !DILocation(line: 135, column: 22, scope: !85)
!96 = !DILocation(line: 135, column: 12, scope: !85)
!97 = !DILocation(line: 135, column: 5, scope: !85)
!98 = !DILocation(line: 137, column: 5, scope: !85)
!99 = !DILocation(line: 138, column: 5, scope: !85)
!100 = !DILocation(line: 139, column: 5, scope: !85)
!101 = !DILocation(line: 142, column: 5, scope: !85)
!102 = !DILocation(line: 143, column: 5, scope: !85)
!103 = !DILocation(line: 144, column: 5, scope: !85)
!104 = !DILocation(line: 146, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 62, type: !6)
!107 = !DILocation(line: 62, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !14, line: 63, type: !6)
!109 = !DILocation(line: 63, column: 15, scope: !105)
!110 = !DILocation(line: 63, column: 39, scope: !105)
!111 = !DILocation(line: 63, column: 28, scope: !105)
!112 = !DILocation(line: 64, column: 12, scope: !105)
!113 = !DILocation(line: 64, column: 10, scope: !105)
!114 = !DILocation(line: 65, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !14, line: 65, column: 8)
!116 = !DILocation(line: 65, column: 8, scope: !105)
!117 = !DILocation(line: 68, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 66, column: 5)
!119 = !DILocation(line: 69, column: 5, scope: !118)
!120 = !DILocation(line: 73, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !14, line: 71, column: 5)
!122 = !DILocation(line: 73, column: 9, scope: !121)
!123 = !DILocation(line: 74, column: 9, scope: !121)
!124 = !DILocation(line: 74, column: 20, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !14, line: 77, type: !43)
!126 = distinct !DILexicalBlock(scope: !105, file: !14, line: 76, column: 5)
!127 = !DILocation(line: 77, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !14, line: 78, type: !48)
!129 = !DILocation(line: 78, column: 16, scope: !126)
!130 = !DILocalVariable(name: "dataLen", scope: !126, file: !14, line: 78, type: !48)
!131 = !DILocation(line: 78, column: 19, scope: !126)
!132 = !DILocation(line: 79, column: 26, scope: !126)
!133 = !DILocation(line: 79, column: 19, scope: !126)
!134 = !DILocation(line: 79, column: 17, scope: !126)
!135 = !DILocation(line: 81, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !14, line: 81, column: 9)
!137 = !DILocation(line: 81, column: 14, scope: !136)
!138 = !DILocation(line: 81, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !14, line: 81, column: 9)
!140 = !DILocation(line: 81, column: 25, scope: !139)
!141 = !DILocation(line: 81, column: 23, scope: !139)
!142 = !DILocation(line: 81, column: 9, scope: !136)
!143 = !DILocation(line: 83, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !14, line: 82, column: 9)
!145 = !DILocation(line: 83, column: 28, scope: !144)
!146 = !DILocation(line: 83, column: 18, scope: !144)
!147 = !DILocation(line: 83, column: 13, scope: !144)
!148 = !DILocation(line: 83, column: 21, scope: !144)
!149 = !DILocation(line: 84, column: 9, scope: !144)
!150 = !DILocation(line: 81, column: 35, scope: !139)
!151 = !DILocation(line: 81, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !75}
!153 = !DILocation(line: 84, column: 9, scope: !136)
!154 = !DILocation(line: 85, column: 9, scope: !126)
!155 = !DILocation(line: 85, column: 20, scope: !126)
!156 = !DILocation(line: 86, column: 20, scope: !126)
!157 = !DILocation(line: 86, column: 9, scope: !126)
!158 = !DILocation(line: 88, column: 1, scope: !105)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 91, type: !22, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!160 = !DILocalVariable(name: "data", scope: !159, file: !14, line: 93, type: !6)
!161 = !DILocation(line: 93, column: 15, scope: !159)
!162 = !DILocalVariable(name: "dataBuffer", scope: !159, file: !14, line: 94, type: !6)
!163 = !DILocation(line: 94, column: 15, scope: !159)
!164 = !DILocation(line: 94, column: 39, scope: !159)
!165 = !DILocation(line: 94, column: 28, scope: !159)
!166 = !DILocation(line: 95, column: 12, scope: !159)
!167 = !DILocation(line: 95, column: 10, scope: !159)
!168 = !DILocation(line: 96, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !159, file: !14, line: 96, column: 8)
!170 = !DILocation(line: 96, column: 8, scope: !159)
!171 = !DILocation(line: 99, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !14, line: 97, column: 5)
!173 = !DILocation(line: 99, column: 9, scope: !172)
!174 = !DILocation(line: 100, column: 9, scope: !172)
!175 = !DILocation(line: 100, column: 20, scope: !172)
!176 = !DILocation(line: 101, column: 5, scope: !172)
!177 = !DILocalVariable(name: "dest", scope: !178, file: !14, line: 103, type: !43)
!178 = distinct !DILexicalBlock(scope: !159, file: !14, line: 102, column: 5)
!179 = !DILocation(line: 103, column: 17, scope: !178)
!180 = !DILocalVariable(name: "i", scope: !178, file: !14, line: 104, type: !48)
!181 = !DILocation(line: 104, column: 16, scope: !178)
!182 = !DILocalVariable(name: "dataLen", scope: !178, file: !14, line: 104, type: !48)
!183 = !DILocation(line: 104, column: 19, scope: !178)
!184 = !DILocation(line: 105, column: 26, scope: !178)
!185 = !DILocation(line: 105, column: 19, scope: !178)
!186 = !DILocation(line: 105, column: 17, scope: !178)
!187 = !DILocation(line: 107, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !178, file: !14, line: 107, column: 9)
!189 = !DILocation(line: 107, column: 14, scope: !188)
!190 = !DILocation(line: 107, column: 21, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !14, line: 107, column: 9)
!192 = !DILocation(line: 107, column: 25, scope: !191)
!193 = !DILocation(line: 107, column: 23, scope: !191)
!194 = !DILocation(line: 107, column: 9, scope: !188)
!195 = !DILocation(line: 109, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !14, line: 108, column: 9)
!197 = !DILocation(line: 109, column: 28, scope: !196)
!198 = !DILocation(line: 109, column: 18, scope: !196)
!199 = !DILocation(line: 109, column: 13, scope: !196)
!200 = !DILocation(line: 109, column: 21, scope: !196)
!201 = !DILocation(line: 110, column: 9, scope: !196)
!202 = !DILocation(line: 107, column: 35, scope: !191)
!203 = !DILocation(line: 107, column: 9, scope: !191)
!204 = distinct !{!204, !194, !205, !75}
!205 = !DILocation(line: 110, column: 9, scope: !188)
!206 = !DILocation(line: 111, column: 9, scope: !178)
!207 = !DILocation(line: 111, column: 20, scope: !178)
!208 = !DILocation(line: 112, column: 20, scope: !178)
!209 = !DILocation(line: 112, column: 9, scope: !178)
!210 = !DILocation(line: 114, column: 1, scope: !159)
