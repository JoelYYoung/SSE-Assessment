; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_char_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_char_loop_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_loop_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !53
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !53
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !53
  %5 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !57
  store i8 %4, i8* %arrayidx2, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx3, align 1, !dbg !66
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  call void @printLine(i8* %arraydecay4), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_loop_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_22_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE127_Buffer_Underread__malloc_char_loop_22_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE127_Buffer_Underread__malloc_char_loop_22_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i8* null, i8** %data, align 8, !dbg !95
  store i32 0, i32* @CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B1Global, align 4, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B1Source(i8* %0), !dbg !98
  store i8* %call, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i64* %i, metadata !100, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !111
  %cmp = icmp ult i64 %1, 100, !dbg !113
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !115
  %3 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !115
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !119
  store i8 %4, i8* %arrayidx2, align 1, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %6, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx3, align 1, !dbg !127
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  call void @printLine(i8* %arraydecay4), !dbg !129
  ret void, !dbg !130
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i8* null, i8** %data, align 8, !dbg !134
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B2Global, align 4, !dbg !135
  %0 = load i8*, i8** %data, align 8, !dbg !136
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B2Source(i8* %0), !dbg !137
  store i8* %call, i8** %data, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !144
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !150
  %cmp = icmp ult i64 %1, 100, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !154
  %3 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !154
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !154
  %5 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !158
  store i8 %4, i8* %arrayidx2, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %6, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx3, align 1, !dbg !166
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay4), !dbg !168
  ret void, !dbg !169
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B1Global", scope: !2, file: !10, line: 57, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_loop_22_goodG2B2Global", scope: !2, file: !10, line: 58, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocation(line: 31, column: 10, scope: !20)
!28 = !DILocation(line: 32, column: 60, scope: !20)
!29 = !DILocation(line: 33, column: 67, scope: !20)
!30 = !DILocation(line: 33, column: 12, scope: !20)
!31 = !DILocation(line: 33, column: 10, scope: !20)
!32 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 35, column: 16, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !33, file: !10, line: 36, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 36, column: 14, scope: !33)
!43 = !DILocation(line: 37, column: 9, scope: !33)
!44 = !DILocation(line: 38, column: 9, scope: !33)
!45 = !DILocation(line: 38, column: 21, scope: !33)
!46 = !DILocation(line: 40, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !10, line: 40, column: 9)
!48 = !DILocation(line: 40, column: 14, scope: !47)
!49 = !DILocation(line: 40, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !10, line: 40, column: 9)
!51 = !DILocation(line: 40, column: 23, scope: !50)
!52 = !DILocation(line: 40, column: 9, scope: !47)
!53 = !DILocation(line: 42, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !10, line: 41, column: 9)
!55 = !DILocation(line: 42, column: 28, scope: !54)
!56 = !DILocation(line: 42, column: 18, scope: !54)
!57 = !DILocation(line: 42, column: 13, scope: !54)
!58 = !DILocation(line: 42, column: 21, scope: !54)
!59 = !DILocation(line: 43, column: 9, scope: !54)
!60 = !DILocation(line: 40, column: 31, scope: !50)
!61 = !DILocation(line: 40, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 43, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 45, column: 9, scope: !33)
!66 = !DILocation(line: 45, column: 21, scope: !33)
!67 = !DILocation(line: 46, column: 19, scope: !33)
!68 = !DILocation(line: 46, column: 9, scope: !33)
!69 = !DILocation(line: 50, column: 1, scope: !20)
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_22_good", scope: !10, file: !10, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 116, column: 5, scope: !70)
!72 = !DILocation(line: 117, column: 5, scope: !70)
!73 = !DILocation(line: 118, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 130, type: !75, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!11, !11, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !10, line: 130, type: !11)
!79 = !DILocation(line: 130, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !10, line: 130, type: !77)
!81 = !DILocation(line: 130, column: 27, scope: !74)
!82 = !DILocation(line: 133, column: 22, scope: !74)
!83 = !DILocation(line: 133, column: 12, scope: !74)
!84 = !DILocation(line: 133, column: 5, scope: !74)
!85 = !DILocation(line: 135, column: 5, scope: !74)
!86 = !DILocation(line: 136, column: 5, scope: !74)
!87 = !DILocation(line: 137, column: 5, scope: !74)
!88 = !DILocation(line: 140, column: 5, scope: !74)
!89 = !DILocation(line: 141, column: 5, scope: !74)
!90 = !DILocation(line: 142, column: 5, scope: !74)
!91 = !DILocation(line: 144, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 63, type: !21, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !10, line: 65, type: !24)
!94 = !DILocation(line: 65, column: 12, scope: !92)
!95 = !DILocation(line: 66, column: 10, scope: !92)
!96 = !DILocation(line: 67, column: 65, scope: !92)
!97 = !DILocation(line: 68, column: 72, scope: !92)
!98 = !DILocation(line: 68, column: 12, scope: !92)
!99 = !DILocation(line: 68, column: 10, scope: !92)
!100 = !DILocalVariable(name: "i", scope: !101, file: !10, line: 70, type: !34)
!101 = distinct !DILexicalBlock(scope: !92, file: !10, line: 69, column: 5)
!102 = !DILocation(line: 70, column: 16, scope: !101)
!103 = !DILocalVariable(name: "dest", scope: !101, file: !10, line: 71, type: !39)
!104 = !DILocation(line: 71, column: 14, scope: !101)
!105 = !DILocation(line: 72, column: 9, scope: !101)
!106 = !DILocation(line: 73, column: 9, scope: !101)
!107 = !DILocation(line: 73, column: 21, scope: !101)
!108 = !DILocation(line: 75, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !10, line: 75, column: 9)
!110 = !DILocation(line: 75, column: 14, scope: !109)
!111 = !DILocation(line: 75, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !10, line: 75, column: 9)
!113 = !DILocation(line: 75, column: 23, scope: !112)
!114 = !DILocation(line: 75, column: 9, scope: !109)
!115 = !DILocation(line: 77, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !10, line: 76, column: 9)
!117 = !DILocation(line: 77, column: 28, scope: !116)
!118 = !DILocation(line: 77, column: 18, scope: !116)
!119 = !DILocation(line: 77, column: 13, scope: !116)
!120 = !DILocation(line: 77, column: 21, scope: !116)
!121 = !DILocation(line: 78, column: 9, scope: !116)
!122 = !DILocation(line: 75, column: 31, scope: !112)
!123 = !DILocation(line: 75, column: 9, scope: !112)
!124 = distinct !{!124, !114, !125, !64}
!125 = !DILocation(line: 78, column: 9, scope: !109)
!126 = !DILocation(line: 80, column: 9, scope: !101)
!127 = !DILocation(line: 80, column: 21, scope: !101)
!128 = !DILocation(line: 81, column: 19, scope: !101)
!129 = !DILocation(line: 81, column: 9, scope: !101)
!130 = !DILocation(line: 85, column: 1, scope: !92)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", scope: !131, file: !10, line: 92, type: !24)
!133 = !DILocation(line: 92, column: 12, scope: !131)
!134 = !DILocation(line: 93, column: 10, scope: !131)
!135 = !DILocation(line: 94, column: 65, scope: !131)
!136 = !DILocation(line: 95, column: 72, scope: !131)
!137 = !DILocation(line: 95, column: 12, scope: !131)
!138 = !DILocation(line: 95, column: 10, scope: !131)
!139 = !DILocalVariable(name: "i", scope: !140, file: !10, line: 97, type: !34)
!140 = distinct !DILexicalBlock(scope: !131, file: !10, line: 96, column: 5)
!141 = !DILocation(line: 97, column: 16, scope: !140)
!142 = !DILocalVariable(name: "dest", scope: !140, file: !10, line: 98, type: !39)
!143 = !DILocation(line: 98, column: 14, scope: !140)
!144 = !DILocation(line: 99, column: 9, scope: !140)
!145 = !DILocation(line: 100, column: 9, scope: !140)
!146 = !DILocation(line: 100, column: 21, scope: !140)
!147 = !DILocation(line: 102, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !10, line: 102, column: 9)
!149 = !DILocation(line: 102, column: 14, scope: !148)
!150 = !DILocation(line: 102, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !10, line: 102, column: 9)
!152 = !DILocation(line: 102, column: 23, scope: !151)
!153 = !DILocation(line: 102, column: 9, scope: !148)
!154 = !DILocation(line: 104, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !10, line: 103, column: 9)
!156 = !DILocation(line: 104, column: 28, scope: !155)
!157 = !DILocation(line: 104, column: 18, scope: !155)
!158 = !DILocation(line: 104, column: 13, scope: !155)
!159 = !DILocation(line: 104, column: 21, scope: !155)
!160 = !DILocation(line: 105, column: 9, scope: !155)
!161 = !DILocation(line: 102, column: 31, scope: !151)
!162 = !DILocation(line: 102, column: 9, scope: !151)
!163 = distinct !{!163, !153, !164, !64}
!164 = !DILocation(line: 105, column: 9, scope: !148)
!165 = !DILocation(line: 107, column: 9, scope: !140)
!166 = !DILocation(line: 107, column: 21, scope: !140)
!167 = !DILocation(line: 108, column: 19, scope: !140)
!168 = !DILocation(line: 108, column: 9, scope: !140)
!169 = !DILocation(line: 112, column: 1, scope: !131)
