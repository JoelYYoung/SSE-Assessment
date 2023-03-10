; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !29
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %4 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !38
  store i32* %add.ptr, i32** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx2, align 4, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !58
  %cmp3 = icmp ult i64 %6, 100, !dbg !60
  br i1 %cmp3, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !62
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !66
  store i32 %9, i32* %arrayidx5, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %11, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx6, align 4, !dbg !75
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  call void @printWLine(i32* %arraydecay7), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_07_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #4, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #4, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_07_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_07_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 400, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBuffer, align 8, !dbg !107
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !111
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %4 = load i32, i32* @staticFive, align 4, !dbg !114
  %cmp = icmp ne i32 %4, 5, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %5, i32** %data, align 8, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx2, align 4, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !136
  %cmp3 = icmp ult i64 %6, 100, !dbg !138
  br i1 %cmp3, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !140
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !140
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !140
  %10 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !144
  store i32 %9, i32* %arrayidx5, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %11, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx6, align 4, !dbg !152
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  call void @printWLine(i32* %arraydecay7), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 400, align 16, !dbg !161
  %1 = bitcast i8* %0 to i32*, !dbg !162
  store i32* %1, i32** %dataBuffer, align 8, !dbg !160
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !163
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !164
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  %4 = load i32, i32* @staticFive, align 4, !dbg !167
  %cmp = icmp eq i32 %4, 5, !dbg !169
  br i1 %cmp, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !171
  store i32* %5, i32** %data, align 8, !dbg !173
  br label %if.end, !dbg !174

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !181
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !182
  store i32 0, i32* %arrayidx2, align 4, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !187
  %cmp3 = icmp ult i64 %6, 100, !dbg !189
  br i1 %cmp3, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !191
  %8 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !191
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !191
  %10 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !195
  store i32 %9, i32* %arrayidx5, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %11, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !202
  store i32 0, i32* %arrayidx6, align 4, !dbg !203
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !204
  call void @printWLine(i32* %arraydecay7), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 39, scope: !19)
!27 = !DILocation(line: 32, column: 28, scope: !19)
!28 = !DILocation(line: 33, column: 13, scope: !19)
!29 = !DILocation(line: 33, column: 5, scope: !19)
!30 = !DILocation(line: 34, column: 5, scope: !19)
!31 = !DILocation(line: 34, column: 23, scope: !19)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 8, scope: !19)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 36, column: 5)
!38 = !DILocation(line: 38, column: 27, scope: !37)
!39 = !DILocation(line: 38, column: 14, scope: !37)
!40 = !DILocation(line: 39, column: 5, scope: !37)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !12, line: 40, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 41, column: 16, scope: !42)
!46 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 42, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 42, column: 17, scope: !42)
!51 = !DILocation(line: 43, column: 17, scope: !42)
!52 = !DILocation(line: 43, column: 9, scope: !42)
!53 = !DILocation(line: 44, column: 9, scope: !42)
!54 = !DILocation(line: 44, column: 21, scope: !42)
!55 = !DILocation(line: 46, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !42, file: !12, line: 46, column: 9)
!57 = !DILocation(line: 46, column: 14, scope: !56)
!58 = !DILocation(line: 46, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 46, column: 9)
!60 = !DILocation(line: 46, column: 23, scope: !59)
!61 = !DILocation(line: 46, column: 9, scope: !56)
!62 = !DILocation(line: 48, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 47, column: 9)
!64 = !DILocation(line: 48, column: 28, scope: !63)
!65 = !DILocation(line: 48, column: 18, scope: !63)
!66 = !DILocation(line: 48, column: 13, scope: !63)
!67 = !DILocation(line: 48, column: 21, scope: !63)
!68 = !DILocation(line: 49, column: 9, scope: !63)
!69 = !DILocation(line: 46, column: 31, scope: !59)
!70 = !DILocation(line: 46, column: 9, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 49, column: 9, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 51, column: 9, scope: !42)
!75 = !DILocation(line: 51, column: 21, scope: !42)
!76 = !DILocation(line: 52, column: 20, scope: !42)
!77 = !DILocation(line: 52, column: 9, scope: !42)
!78 = !DILocation(line: 54, column: 1, scope: !19)
!79 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_07_good", scope: !12, file: !12, line: 121, type: !20, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 123, column: 5, scope: !79)
!81 = !DILocation(line: 124, column: 5, scope: !79)
!82 = !DILocation(line: 125, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 137, type: !84, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!9, !9, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 137, type: !9)
!90 = !DILocation(line: 137, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 137, type: !86)
!92 = !DILocation(line: 137, column: 27, scope: !83)
!93 = !DILocation(line: 140, column: 22, scope: !83)
!94 = !DILocation(line: 140, column: 12, scope: !83)
!95 = !DILocation(line: 140, column: 5, scope: !83)
!96 = !DILocation(line: 142, column: 5, scope: !83)
!97 = !DILocation(line: 143, column: 5, scope: !83)
!98 = !DILocation(line: 144, column: 5, scope: !83)
!99 = !DILocation(line: 147, column: 5, scope: !83)
!100 = !DILocation(line: 148, column: 5, scope: !83)
!101 = !DILocation(line: 149, column: 5, scope: !83)
!102 = !DILocation(line: 151, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 63, type: !6)
!105 = !DILocation(line: 63, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 64, type: !6)
!107 = !DILocation(line: 64, column: 15, scope: !103)
!108 = !DILocation(line: 64, column: 39, scope: !103)
!109 = !DILocation(line: 64, column: 28, scope: !103)
!110 = !DILocation(line: 65, column: 13, scope: !103)
!111 = !DILocation(line: 65, column: 5, scope: !103)
!112 = !DILocation(line: 66, column: 5, scope: !103)
!113 = !DILocation(line: 66, column: 23, scope: !103)
!114 = !DILocation(line: 67, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !103, file: !12, line: 67, column: 8)
!116 = !DILocation(line: 67, column: 18, scope: !115)
!117 = !DILocation(line: 67, column: 8, scope: !103)
!118 = !DILocation(line: 70, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 68, column: 5)
!120 = !DILocation(line: 71, column: 5, scope: !119)
!121 = !DILocation(line: 75, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !12, line: 73, column: 5)
!123 = !DILocation(line: 75, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 78, type: !43)
!125 = distinct !DILexicalBlock(scope: !103, file: !12, line: 77, column: 5)
!126 = !DILocation(line: 78, column: 16, scope: !125)
!127 = !DILocalVariable(name: "dest", scope: !125, file: !12, line: 79, type: !47)
!128 = !DILocation(line: 79, column: 17, scope: !125)
!129 = !DILocation(line: 80, column: 17, scope: !125)
!130 = !DILocation(line: 80, column: 9, scope: !125)
!131 = !DILocation(line: 81, column: 9, scope: !125)
!132 = !DILocation(line: 81, column: 21, scope: !125)
!133 = !DILocation(line: 83, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !12, line: 83, column: 9)
!135 = !DILocation(line: 83, column: 14, scope: !134)
!136 = !DILocation(line: 83, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 83, column: 9)
!138 = !DILocation(line: 83, column: 23, scope: !137)
!139 = !DILocation(line: 83, column: 9, scope: !134)
!140 = !DILocation(line: 85, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !12, line: 84, column: 9)
!142 = !DILocation(line: 85, column: 28, scope: !141)
!143 = !DILocation(line: 85, column: 18, scope: !141)
!144 = !DILocation(line: 85, column: 13, scope: !141)
!145 = !DILocation(line: 85, column: 21, scope: !141)
!146 = !DILocation(line: 86, column: 9, scope: !141)
!147 = !DILocation(line: 83, column: 31, scope: !137)
!148 = !DILocation(line: 83, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !73}
!150 = !DILocation(line: 86, column: 9, scope: !134)
!151 = !DILocation(line: 88, column: 9, scope: !125)
!152 = !DILocation(line: 88, column: 21, scope: !125)
!153 = !DILocation(line: 89, column: 20, scope: !125)
!154 = !DILocation(line: 89, column: 9, scope: !125)
!155 = !DILocation(line: 91, column: 1, scope: !103)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !20, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !12, line: 96, type: !6)
!158 = !DILocation(line: 96, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBuffer", scope: !156, file: !12, line: 97, type: !6)
!160 = !DILocation(line: 97, column: 15, scope: !156)
!161 = !DILocation(line: 97, column: 39, scope: !156)
!162 = !DILocation(line: 97, column: 28, scope: !156)
!163 = !DILocation(line: 98, column: 13, scope: !156)
!164 = !DILocation(line: 98, column: 5, scope: !156)
!165 = !DILocation(line: 99, column: 5, scope: !156)
!166 = !DILocation(line: 99, column: 23, scope: !156)
!167 = !DILocation(line: 100, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !156, file: !12, line: 100, column: 8)
!169 = !DILocation(line: 100, column: 18, scope: !168)
!170 = !DILocation(line: 100, column: 8, scope: !156)
!171 = !DILocation(line: 103, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !12, line: 101, column: 5)
!173 = !DILocation(line: 103, column: 14, scope: !172)
!174 = !DILocation(line: 104, column: 5, scope: !172)
!175 = !DILocalVariable(name: "i", scope: !176, file: !12, line: 106, type: !43)
!176 = distinct !DILexicalBlock(scope: !156, file: !12, line: 105, column: 5)
!177 = !DILocation(line: 106, column: 16, scope: !176)
!178 = !DILocalVariable(name: "dest", scope: !176, file: !12, line: 107, type: !47)
!179 = !DILocation(line: 107, column: 17, scope: !176)
!180 = !DILocation(line: 108, column: 17, scope: !176)
!181 = !DILocation(line: 108, column: 9, scope: !176)
!182 = !DILocation(line: 109, column: 9, scope: !176)
!183 = !DILocation(line: 109, column: 21, scope: !176)
!184 = !DILocation(line: 111, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !176, file: !12, line: 111, column: 9)
!186 = !DILocation(line: 111, column: 14, scope: !185)
!187 = !DILocation(line: 111, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !12, line: 111, column: 9)
!189 = !DILocation(line: 111, column: 23, scope: !188)
!190 = !DILocation(line: 111, column: 9, scope: !185)
!191 = !DILocation(line: 113, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !12, line: 112, column: 9)
!193 = !DILocation(line: 113, column: 28, scope: !192)
!194 = !DILocation(line: 113, column: 18, scope: !192)
!195 = !DILocation(line: 113, column: 13, scope: !192)
!196 = !DILocation(line: 113, column: 21, scope: !192)
!197 = !DILocation(line: 114, column: 9, scope: !192)
!198 = !DILocation(line: 111, column: 31, scope: !188)
!199 = !DILocation(line: 111, column: 9, scope: !188)
!200 = distinct !{!200, !190, !201, !73}
!201 = !DILocation(line: 114, column: 9, scope: !185)
!202 = !DILocation(line: 116, column: 9, scope: !176)
!203 = !DILocation(line: 116, column: 21, scope: !176)
!204 = !DILocation(line: 117, column: 20, scope: !176)
!205 = !DILocation(line: 117, column: 9, scope: !176)
!206 = !DILocation(line: 119, column: 1, scope: !156)
