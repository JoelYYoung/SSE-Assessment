; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !44
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !56
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !56
  %4 = load i32*, i32** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !57
  store i32 %3, i32* %arrayidx3, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !66
  store i32 0, i32* %arrayidx4, align 4, !dbg !67
  %8 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #4, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #4, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  store i32 0, i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B1Global, align 4, !dbg !99
  %0 = load i32*, i32** %data, align 8, !dbg !100
  %call = call i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B1Source(i32* %0), !dbg !101
  store i32* %call, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !109
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %1, 100, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !121
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !121
  %4 = load i32*, i32** %data, align 8, !dbg !122
  %5 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !122
  store i32 %3, i32* %arrayidx3, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %6, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !130
  store i32 0, i32* %arrayidx4, align 4, !dbg !131
  %8 = load i32*, i32** %data, align 8, !dbg !132
  call void @printWLine(i32* %8), !dbg !133
  ret void, !dbg !134
}

declare dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32* null, i32** %data, align 8, !dbg !138
  store i32 1, i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B2Global, align 4, !dbg !139
  %0 = load i32*, i32** %data, align 8, !dbg !140
  %call = call i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B2Source(i32* %0), !dbg !141
  store i32* %call, i32** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !148
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !149
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !155
  %cmp = icmp ult i64 %1, 100, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !161
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !161
  %4 = load i32*, i32** %data, align 8, !dbg !162
  %5 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !162
  store i32 %3, i32* %arrayidx3, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %6, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !170
  store i32 0, i32* %arrayidx4, align 4, !dbg !171
  %8 = load i32*, i32** %data, align 8, !dbg !172
  call void @printWLine(i32* %8), !dbg !173
  ret void, !dbg !174
}

declare dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B1Global", scope: !2, file: !10, line: 57, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_goodG2B2Global", scope: !2, file: !10, line: 58, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 64, scope: !20)
!30 = !DILocation(line: 33, column: 71, scope: !20)
!31 = !DILocation(line: 33, column: 12, scope: !20)
!32 = !DILocation(line: 33, column: 10, scope: !20)
!33 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !36)
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 35, column: 16, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !34, file: !10, line: 36, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 36, column: 17, scope: !34)
!43 = !DILocation(line: 37, column: 17, scope: !34)
!44 = !DILocation(line: 37, column: 9, scope: !34)
!45 = !DILocation(line: 38, column: 9, scope: !34)
!46 = !DILocation(line: 38, column: 23, scope: !34)
!47 = !DILocation(line: 40, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !10, line: 40, column: 9)
!49 = !DILocation(line: 40, column: 14, scope: !48)
!50 = !DILocation(line: 40, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !10, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 23, scope: !51)
!53 = !DILocation(line: 40, column: 9, scope: !48)
!54 = !DILocation(line: 42, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !10, line: 41, column: 9)
!56 = !DILocation(line: 42, column: 23, scope: !55)
!57 = !DILocation(line: 42, column: 13, scope: !55)
!58 = !DILocation(line: 42, column: 18, scope: !55)
!59 = !DILocation(line: 42, column: 21, scope: !55)
!60 = !DILocation(line: 43, column: 9, scope: !55)
!61 = !DILocation(line: 40, column: 31, scope: !51)
!62 = !DILocation(line: 40, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 43, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 45, column: 9, scope: !34)
!67 = !DILocation(line: 45, column: 21, scope: !34)
!68 = !DILocation(line: 46, column: 20, scope: !34)
!69 = !DILocation(line: 46, column: 9, scope: !34)
!70 = !DILocation(line: 50, column: 1, scope: !20)
!71 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_22_good", scope: !10, file: !10, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 116, column: 5, scope: !71)
!73 = !DILocation(line: 117, column: 5, scope: !71)
!74 = !DILocation(line: 118, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 130, type: !76, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!11, !11, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !10, line: 130, type: !11)
!82 = !DILocation(line: 130, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !10, line: 130, type: !78)
!84 = !DILocation(line: 130, column: 27, scope: !75)
!85 = !DILocation(line: 133, column: 22, scope: !75)
!86 = !DILocation(line: 133, column: 12, scope: !75)
!87 = !DILocation(line: 133, column: 5, scope: !75)
!88 = !DILocation(line: 135, column: 5, scope: !75)
!89 = !DILocation(line: 136, column: 5, scope: !75)
!90 = !DILocation(line: 137, column: 5, scope: !75)
!91 = !DILocation(line: 140, column: 5, scope: !75)
!92 = !DILocation(line: 141, column: 5, scope: !75)
!93 = !DILocation(line: 142, column: 5, scope: !75)
!94 = !DILocation(line: 144, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 63, type: !21, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 65, type: !24)
!97 = !DILocation(line: 65, column: 15, scope: !95)
!98 = !DILocation(line: 66, column: 10, scope: !95)
!99 = !DILocation(line: 67, column: 69, scope: !95)
!100 = !DILocation(line: 68, column: 76, scope: !95)
!101 = !DILocation(line: 68, column: 12, scope: !95)
!102 = !DILocation(line: 68, column: 10, scope: !95)
!103 = !DILocalVariable(name: "i", scope: !104, file: !10, line: 70, type: !35)
!104 = distinct !DILexicalBlock(scope: !95, file: !10, line: 69, column: 5)
!105 = !DILocation(line: 70, column: 16, scope: !104)
!106 = !DILocalVariable(name: "source", scope: !104, file: !10, line: 71, type: !39)
!107 = !DILocation(line: 71, column: 17, scope: !104)
!108 = !DILocation(line: 72, column: 17, scope: !104)
!109 = !DILocation(line: 72, column: 9, scope: !104)
!110 = !DILocation(line: 73, column: 9, scope: !104)
!111 = !DILocation(line: 73, column: 23, scope: !104)
!112 = !DILocation(line: 75, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !10, line: 75, column: 9)
!114 = !DILocation(line: 75, column: 14, scope: !113)
!115 = !DILocation(line: 75, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !10, line: 75, column: 9)
!117 = !DILocation(line: 75, column: 23, scope: !116)
!118 = !DILocation(line: 75, column: 9, scope: !113)
!119 = !DILocation(line: 77, column: 30, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !10, line: 76, column: 9)
!121 = !DILocation(line: 77, column: 23, scope: !120)
!122 = !DILocation(line: 77, column: 13, scope: !120)
!123 = !DILocation(line: 77, column: 18, scope: !120)
!124 = !DILocation(line: 77, column: 21, scope: !120)
!125 = !DILocation(line: 78, column: 9, scope: !120)
!126 = !DILocation(line: 75, column: 31, scope: !116)
!127 = !DILocation(line: 75, column: 9, scope: !116)
!128 = distinct !{!128, !118, !129, !65}
!129 = !DILocation(line: 78, column: 9, scope: !113)
!130 = !DILocation(line: 80, column: 9, scope: !104)
!131 = !DILocation(line: 80, column: 21, scope: !104)
!132 = !DILocation(line: 81, column: 20, scope: !104)
!133 = !DILocation(line: 81, column: 9, scope: !104)
!134 = !DILocation(line: 85, column: 1, scope: !95)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "data", scope: !135, file: !10, line: 92, type: !24)
!137 = !DILocation(line: 92, column: 15, scope: !135)
!138 = !DILocation(line: 93, column: 10, scope: !135)
!139 = !DILocation(line: 94, column: 69, scope: !135)
!140 = !DILocation(line: 95, column: 76, scope: !135)
!141 = !DILocation(line: 95, column: 12, scope: !135)
!142 = !DILocation(line: 95, column: 10, scope: !135)
!143 = !DILocalVariable(name: "i", scope: !144, file: !10, line: 97, type: !35)
!144 = distinct !DILexicalBlock(scope: !135, file: !10, line: 96, column: 5)
!145 = !DILocation(line: 97, column: 16, scope: !144)
!146 = !DILocalVariable(name: "source", scope: !144, file: !10, line: 98, type: !39)
!147 = !DILocation(line: 98, column: 17, scope: !144)
!148 = !DILocation(line: 99, column: 17, scope: !144)
!149 = !DILocation(line: 99, column: 9, scope: !144)
!150 = !DILocation(line: 100, column: 9, scope: !144)
!151 = !DILocation(line: 100, column: 23, scope: !144)
!152 = !DILocation(line: 102, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !144, file: !10, line: 102, column: 9)
!154 = !DILocation(line: 102, column: 14, scope: !153)
!155 = !DILocation(line: 102, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !10, line: 102, column: 9)
!157 = !DILocation(line: 102, column: 23, scope: !156)
!158 = !DILocation(line: 102, column: 9, scope: !153)
!159 = !DILocation(line: 104, column: 30, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !10, line: 103, column: 9)
!161 = !DILocation(line: 104, column: 23, scope: !160)
!162 = !DILocation(line: 104, column: 13, scope: !160)
!163 = !DILocation(line: 104, column: 18, scope: !160)
!164 = !DILocation(line: 104, column: 21, scope: !160)
!165 = !DILocation(line: 105, column: 9, scope: !160)
!166 = !DILocation(line: 102, column: 31, scope: !156)
!167 = !DILocation(line: 102, column: 9, scope: !156)
!168 = distinct !{!168, !158, !169, !65}
!169 = !DILocation(line: 105, column: 9, scope: !153)
!170 = !DILocation(line: 107, column: 9, scope: !144)
!171 = !DILocation(line: 107, column: 21, scope: !144)
!172 = !DILocation(line: 108, column: 20, scope: !144)
!173 = !DILocation(line: 108, column: 9, scope: !144)
!174 = !DILocation(line: 112, column: 1, scope: !135)
