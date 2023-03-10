; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_badGlobal, align 4, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_badSource(i32* %0), !dbg !37
  store i32* %call, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = load i32*, i32** %data, align 8, !dbg !51
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !52
  store i64 %call1, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !57
  %4 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp = icmp ult i64 %3, %4, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !62
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !62
  %7 = load i32, i32* %arrayidx, align 4, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !66
  store i32 %7, i32* %arrayidx2, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !74
  store i32 0, i32* %arrayidx3, align 4, !dbg !75
  %10 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* %10), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_good() #0 !dbg !79 {
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
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !109
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B1Global, align 4, !dbg !110
  %0 = load i32*, i32** %data, align 8, !dbg !111
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B1Source(i32* %0), !dbg !112
  store i32* %call, i32** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !122
  store i64 %call1, i64* %dataLen, align 8, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !127
  %4 = load i64, i64* %dataLen, align 8, !dbg !129
  %cmp = icmp ult i64 %3, %4, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !132
  %6 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !132
  %7 = load i32, i32* %arrayidx, align 4, !dbg !132
  %8 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !136
  store i32 %7, i32* %arrayidx2, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %9, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !143
  store i32 0, i32* %arrayidx3, align 4, !dbg !144
  %10 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %10), !dbg !146
  ret void, !dbg !147
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !153
  store i32* %arraydecay, i32** %data, align 8, !dbg !154
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B2Global, align 4, !dbg !155
  %0 = load i32*, i32** %data, align 8, !dbg !156
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B2Source(i32* %0), !dbg !157
  store i32* %call, i32** %data, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !159, metadata !DIExpression()), !dbg !161
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !164, metadata !DIExpression()), !dbg !165
  %2 = load i32*, i32** %data, align 8, !dbg !166
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !167
  store i64 %call1, i64* %dataLen, align 8, !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !172
  %4 = load i64, i64* %dataLen, align 8, !dbg !174
  %cmp = icmp ult i64 %3, %4, !dbg !175
  br i1 %cmp, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !177
  %6 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !177
  %7 = load i32, i32* %arrayidx, align 4, !dbg !177
  %8 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !181
  store i32 %7, i32* %arrayidx2, align 4, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %9, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !188
  store i32 0, i32* %arrayidx3, align 4, !dbg !189
  %10 = load i32*, i32** %data, align 8, !dbg !190
  call void @printWLine(i32* %10), !dbg !191
  ret void, !dbg !192
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B1Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_goodG2B2Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 31, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 31, column: 13, scope: !20)
!33 = !DILocation(line: 32, column: 12, scope: !20)
!34 = !DILocation(line: 32, column: 10, scope: !20)
!35 = !DILocation(line: 33, column: 82, scope: !20)
!36 = !DILocation(line: 34, column: 89, scope: !20)
!37 = !DILocation(line: 34, column: 12, scope: !20)
!38 = !DILocation(line: 34, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !10, line: 35, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 36, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !10, line: 37, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 37, column: 16, scope: !40)
!49 = !DILocalVariable(name: "dataLen", scope: !40, file: !10, line: 37, type: !46)
!50 = !DILocation(line: 37, column: 19, scope: !40)
!51 = !DILocation(line: 38, column: 26, scope: !40)
!52 = !DILocation(line: 38, column: 19, scope: !40)
!53 = !DILocation(line: 38, column: 17, scope: !40)
!54 = !DILocation(line: 40, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !10, line: 40, column: 9)
!56 = !DILocation(line: 40, column: 14, scope: !55)
!57 = !DILocation(line: 40, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !10, line: 40, column: 9)
!59 = !DILocation(line: 40, column: 25, scope: !58)
!60 = !DILocation(line: 40, column: 23, scope: !58)
!61 = !DILocation(line: 40, column: 9, scope: !55)
!62 = !DILocation(line: 42, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 41, column: 9)
!64 = !DILocation(line: 42, column: 28, scope: !63)
!65 = !DILocation(line: 42, column: 18, scope: !63)
!66 = !DILocation(line: 42, column: 13, scope: !63)
!67 = !DILocation(line: 42, column: 21, scope: !63)
!68 = !DILocation(line: 43, column: 9, scope: !63)
!69 = !DILocation(line: 40, column: 35, scope: !58)
!70 = !DILocation(line: 40, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 43, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 44, column: 9, scope: !40)
!75 = !DILocation(line: 44, column: 20, scope: !40)
!76 = !DILocation(line: 45, column: 20, scope: !40)
!77 = !DILocation(line: 45, column: 9, scope: !40)
!78 = !DILocation(line: 47, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_22_good", scope: !10, file: !10, line: 105, type: !21, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 107, column: 5, scope: !79)
!81 = !DILocation(line: 108, column: 5, scope: !79)
!82 = !DILocation(line: 109, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 121, type: !84, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!11, !11, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !10, line: 121, type: !11)
!90 = !DILocation(line: 121, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !10, line: 121, type: !86)
!92 = !DILocation(line: 121, column: 27, scope: !83)
!93 = !DILocation(line: 124, column: 22, scope: !83)
!94 = !DILocation(line: 124, column: 12, scope: !83)
!95 = !DILocation(line: 124, column: 5, scope: !83)
!96 = !DILocation(line: 126, column: 5, scope: !83)
!97 = !DILocation(line: 127, column: 5, scope: !83)
!98 = !DILocation(line: 128, column: 5, scope: !83)
!99 = !DILocation(line: 131, column: 5, scope: !83)
!100 = !DILocation(line: 132, column: 5, scope: !83)
!101 = !DILocation(line: 133, column: 5, scope: !83)
!102 = !DILocation(line: 135, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 62, type: !24)
!105 = !DILocation(line: 62, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !10, line: 63, type: !29)
!107 = !DILocation(line: 63, column: 13, scope: !103)
!108 = !DILocation(line: 64, column: 12, scope: !103)
!109 = !DILocation(line: 64, column: 10, scope: !103)
!110 = !DILocation(line: 65, column: 87, scope: !103)
!111 = !DILocation(line: 66, column: 94, scope: !103)
!112 = !DILocation(line: 66, column: 12, scope: !103)
!113 = !DILocation(line: 66, column: 10, scope: !103)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !10, line: 68, type: !41)
!115 = distinct !DILexicalBlock(scope: !103, file: !10, line: 67, column: 5)
!116 = !DILocation(line: 68, column: 17, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !115, file: !10, line: 69, type: !46)
!118 = !DILocation(line: 69, column: 16, scope: !115)
!119 = !DILocalVariable(name: "dataLen", scope: !115, file: !10, line: 69, type: !46)
!120 = !DILocation(line: 69, column: 19, scope: !115)
!121 = !DILocation(line: 70, column: 26, scope: !115)
!122 = !DILocation(line: 70, column: 19, scope: !115)
!123 = !DILocation(line: 70, column: 17, scope: !115)
!124 = !DILocation(line: 72, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !10, line: 72, column: 9)
!126 = !DILocation(line: 72, column: 14, scope: !125)
!127 = !DILocation(line: 72, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !10, line: 72, column: 9)
!129 = !DILocation(line: 72, column: 25, scope: !128)
!130 = !DILocation(line: 72, column: 23, scope: !128)
!131 = !DILocation(line: 72, column: 9, scope: !125)
!132 = !DILocation(line: 74, column: 23, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !10, line: 73, column: 9)
!134 = !DILocation(line: 74, column: 28, scope: !133)
!135 = !DILocation(line: 74, column: 18, scope: !133)
!136 = !DILocation(line: 74, column: 13, scope: !133)
!137 = !DILocation(line: 74, column: 21, scope: !133)
!138 = !DILocation(line: 75, column: 9, scope: !133)
!139 = !DILocation(line: 72, column: 35, scope: !128)
!140 = !DILocation(line: 72, column: 9, scope: !128)
!141 = distinct !{!141, !131, !142, !73}
!142 = !DILocation(line: 75, column: 9, scope: !125)
!143 = !DILocation(line: 76, column: 9, scope: !115)
!144 = !DILocation(line: 76, column: 20, scope: !115)
!145 = !DILocation(line: 77, column: 20, scope: !115)
!146 = !DILocation(line: 77, column: 9, scope: !115)
!147 = !DILocation(line: 79, column: 1, scope: !103)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 84, type: !21, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", scope: !148, file: !10, line: 86, type: !24)
!150 = !DILocation(line: 86, column: 15, scope: !148)
!151 = !DILocalVariable(name: "dataBuffer", scope: !148, file: !10, line: 87, type: !29)
!152 = !DILocation(line: 87, column: 13, scope: !148)
!153 = !DILocation(line: 88, column: 12, scope: !148)
!154 = !DILocation(line: 88, column: 10, scope: !148)
!155 = !DILocation(line: 89, column: 87, scope: !148)
!156 = !DILocation(line: 90, column: 94, scope: !148)
!157 = !DILocation(line: 90, column: 12, scope: !148)
!158 = !DILocation(line: 90, column: 10, scope: !148)
!159 = !DILocalVariable(name: "dest", scope: !160, file: !10, line: 92, type: !41)
!160 = distinct !DILexicalBlock(scope: !148, file: !10, line: 91, column: 5)
!161 = !DILocation(line: 92, column: 17, scope: !160)
!162 = !DILocalVariable(name: "i", scope: !160, file: !10, line: 93, type: !46)
!163 = !DILocation(line: 93, column: 16, scope: !160)
!164 = !DILocalVariable(name: "dataLen", scope: !160, file: !10, line: 93, type: !46)
!165 = !DILocation(line: 93, column: 19, scope: !160)
!166 = !DILocation(line: 94, column: 26, scope: !160)
!167 = !DILocation(line: 94, column: 19, scope: !160)
!168 = !DILocation(line: 94, column: 17, scope: !160)
!169 = !DILocation(line: 96, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !160, file: !10, line: 96, column: 9)
!171 = !DILocation(line: 96, column: 14, scope: !170)
!172 = !DILocation(line: 96, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !10, line: 96, column: 9)
!174 = !DILocation(line: 96, column: 25, scope: !173)
!175 = !DILocation(line: 96, column: 23, scope: !173)
!176 = !DILocation(line: 96, column: 9, scope: !170)
!177 = !DILocation(line: 98, column: 23, scope: !178)
!178 = distinct !DILexicalBlock(scope: !173, file: !10, line: 97, column: 9)
!179 = !DILocation(line: 98, column: 28, scope: !178)
!180 = !DILocation(line: 98, column: 18, scope: !178)
!181 = !DILocation(line: 98, column: 13, scope: !178)
!182 = !DILocation(line: 98, column: 21, scope: !178)
!183 = !DILocation(line: 99, column: 9, scope: !178)
!184 = !DILocation(line: 96, column: 35, scope: !173)
!185 = !DILocation(line: 96, column: 9, scope: !173)
!186 = distinct !{!186, !176, !187, !73}
!187 = !DILocation(line: 99, column: 9, scope: !170)
!188 = !DILocation(line: 100, column: 9, scope: !160)
!189 = !DILocation(line: 100, column: 20, scope: !160)
!190 = !DILocation(line: 101, column: 20, scope: !160)
!191 = !DILocation(line: 101, column: 9, scope: !160)
!192 = !DILocation(line: 103, column: 1, scope: !148)
