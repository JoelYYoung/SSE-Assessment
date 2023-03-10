; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__wchar_t_alloca_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__wchar_t_alloca_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %5, i32** @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #4, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #4, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !73, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !79
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !85
  %cmp = icmp ult i64 %1, 100, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !89
  %3 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !89
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !89
  %5 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !93
  store i32 %4, i32* %arrayidx2, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %6, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx3, align 4, !dbg !102
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !103
  call void @printWLine(i32* %arraydecay4), !dbg !104
  ret void, !dbg !105
}

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 400, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBuffer, align 8, !dbg !110
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !114
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %4, i32** %data, align 8, !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !119
  store i32* %5, i32** @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !120
  call void @goodG2BSink(), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !126
  store i32* %0, i32** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !139
  %cmp = icmp ult i64 %1, 100, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !143
  %3 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !143
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !143
  %5 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !147
  store i32 %4, i32* %arrayidx2, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %6, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx3, align 4, !dbg !155
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  call void @printWLine(i32* %arraydecay4), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_45_bad", scope: !14, file: !14, line: 45, type: !22, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 47, type: !6)
!25 = !DILocation(line: 47, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 48, type: !6)
!27 = !DILocation(line: 48, column: 15, scope: !21)
!28 = !DILocation(line: 48, column: 39, scope: !21)
!29 = !DILocation(line: 48, column: 28, scope: !21)
!30 = !DILocation(line: 49, column: 13, scope: !21)
!31 = !DILocation(line: 49, column: 5, scope: !21)
!32 = !DILocation(line: 50, column: 5, scope: !21)
!33 = !DILocation(line: 50, column: 23, scope: !21)
!34 = !DILocation(line: 52, column: 12, scope: !21)
!35 = !DILocation(line: 52, column: 23, scope: !21)
!36 = !DILocation(line: 52, column: 10, scope: !21)
!37 = !DILocation(line: 53, column: 63, scope: !21)
!38 = !DILocation(line: 53, column: 61, scope: !21)
!39 = !DILocation(line: 54, column: 5, scope: !21)
!40 = !DILocation(line: 55, column: 1, scope: !21)
!41 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_45_good", scope: !14, file: !14, line: 93, type: !22, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 95, column: 5, scope: !41)
!43 = !DILocation(line: 96, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !45, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 107, type: !9)
!51 = !DILocation(line: 107, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 107, type: !47)
!53 = !DILocation(line: 107, column: 27, scope: !44)
!54 = !DILocation(line: 110, column: 22, scope: !44)
!55 = !DILocation(line: 110, column: 12, scope: !44)
!56 = !DILocation(line: 110, column: 5, scope: !44)
!57 = !DILocation(line: 112, column: 5, scope: !44)
!58 = !DILocation(line: 113, column: 5, scope: !44)
!59 = !DILocation(line: 114, column: 5, scope: !44)
!60 = !DILocation(line: 117, column: 5, scope: !44)
!61 = !DILocation(line: 118, column: 5, scope: !44)
!62 = !DILocation(line: 119, column: 5, scope: !44)
!63 = !DILocation(line: 121, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 28, type: !6)
!66 = !DILocation(line: 28, column: 15, scope: !64)
!67 = !DILocation(line: 28, column: 22, scope: !64)
!68 = !DILocalVariable(name: "i", scope: !69, file: !14, line: 30, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !14, line: 29, column: 5)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !71)
!71 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!72 = !DILocation(line: 30, column: 16, scope: !69)
!73 = !DILocalVariable(name: "dest", scope: !69, file: !14, line: 31, type: !74)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 100)
!77 = !DILocation(line: 31, column: 17, scope: !69)
!78 = !DILocation(line: 32, column: 17, scope: !69)
!79 = !DILocation(line: 32, column: 9, scope: !69)
!80 = !DILocation(line: 33, column: 9, scope: !69)
!81 = !DILocation(line: 33, column: 21, scope: !69)
!82 = !DILocation(line: 35, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !69, file: !14, line: 35, column: 9)
!84 = !DILocation(line: 35, column: 14, scope: !83)
!85 = !DILocation(line: 35, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 35, column: 9)
!87 = !DILocation(line: 35, column: 23, scope: !86)
!88 = !DILocation(line: 35, column: 9, scope: !83)
!89 = !DILocation(line: 37, column: 23, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !14, line: 36, column: 9)
!91 = !DILocation(line: 37, column: 28, scope: !90)
!92 = !DILocation(line: 37, column: 18, scope: !90)
!93 = !DILocation(line: 37, column: 13, scope: !90)
!94 = !DILocation(line: 37, column: 21, scope: !90)
!95 = !DILocation(line: 38, column: 9, scope: !90)
!96 = !DILocation(line: 35, column: 31, scope: !86)
!97 = !DILocation(line: 35, column: 9, scope: !86)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 38, column: 9, scope: !83)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 40, column: 9, scope: !69)
!102 = !DILocation(line: 40, column: 21, scope: !69)
!103 = !DILocation(line: 41, column: 20, scope: !69)
!104 = !DILocation(line: 41, column: 9, scope: !69)
!105 = !DILocation(line: 43, column: 1, scope: !64)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 81, type: !22, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 83, type: !6)
!108 = !DILocation(line: 83, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !14, line: 84, type: !6)
!110 = !DILocation(line: 84, column: 15, scope: !106)
!111 = !DILocation(line: 84, column: 39, scope: !106)
!112 = !DILocation(line: 84, column: 28, scope: !106)
!113 = !DILocation(line: 85, column: 13, scope: !106)
!114 = !DILocation(line: 85, column: 5, scope: !106)
!115 = !DILocation(line: 86, column: 5, scope: !106)
!116 = !DILocation(line: 86, column: 23, scope: !106)
!117 = !DILocation(line: 88, column: 12, scope: !106)
!118 = !DILocation(line: 88, column: 10, scope: !106)
!119 = !DILocation(line: 89, column: 67, scope: !106)
!120 = !DILocation(line: 89, column: 65, scope: !106)
!121 = !DILocation(line: 90, column: 5, scope: !106)
!122 = !DILocation(line: 91, column: 1, scope: !106)
!123 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !14, line: 64, type: !6)
!125 = !DILocation(line: 64, column: 15, scope: !123)
!126 = !DILocation(line: 64, column: 22, scope: !123)
!127 = !DILocalVariable(name: "i", scope: !128, file: !14, line: 66, type: !70)
!128 = distinct !DILexicalBlock(scope: !123, file: !14, line: 65, column: 5)
!129 = !DILocation(line: 66, column: 16, scope: !128)
!130 = !DILocalVariable(name: "dest", scope: !128, file: !14, line: 67, type: !74)
!131 = !DILocation(line: 67, column: 17, scope: !128)
!132 = !DILocation(line: 68, column: 17, scope: !128)
!133 = !DILocation(line: 68, column: 9, scope: !128)
!134 = !DILocation(line: 69, column: 9, scope: !128)
!135 = !DILocation(line: 69, column: 21, scope: !128)
!136 = !DILocation(line: 71, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !14, line: 71, column: 9)
!138 = !DILocation(line: 71, column: 14, scope: !137)
!139 = !DILocation(line: 71, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !14, line: 71, column: 9)
!141 = !DILocation(line: 71, column: 23, scope: !140)
!142 = !DILocation(line: 71, column: 9, scope: !137)
!143 = !DILocation(line: 73, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !14, line: 72, column: 9)
!145 = !DILocation(line: 73, column: 28, scope: !144)
!146 = !DILocation(line: 73, column: 18, scope: !144)
!147 = !DILocation(line: 73, column: 13, scope: !144)
!148 = !DILocation(line: 73, column: 21, scope: !144)
!149 = !DILocation(line: 74, column: 9, scope: !144)
!150 = !DILocation(line: 71, column: 31, scope: !140)
!151 = !DILocation(line: 71, column: 9, scope: !140)
!152 = distinct !{!152, !142, !153, !100}
!153 = !DILocation(line: 74, column: 9, scope: !137)
!154 = !DILocation(line: 76, column: 9, scope: !128)
!155 = !DILocation(line: 76, column: 21, scope: !128)
!156 = !DILocation(line: 77, column: 20, scope: !128)
!157 = !DILocation(line: 77, column: 9, scope: !128)
!158 = !DILocation(line: 79, column: 1, scope: !123)
