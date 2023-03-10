; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %4, i8** @CWE127_Buffer_Underread__char_alloca_loop_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #5, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #5, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE127_Buffer_Underread__char_alloca_loop_45_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE127_Buffer_Underread__char_alloca_loop_45_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE127_Buffer_Underread__char_alloca_loop_45_badData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i64* %i, metadata !64, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !70, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !75
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  store i64 0, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !81
  %cmp = icmp ult i64 %1, 100, !dbg !83
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !85
  %3 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !85
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !85
  %5 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !89
  store i8 %4, i8* %arrayidx2, align 1, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %6, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx3, align 1, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @printLine(i8* %arraydecay4), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %0, i8** %dataBuffer, align 8, !dbg !106
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !109
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  store i8* %3, i8** %data, align 8, !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  store i8* %4, i8** @CWE127_Buffer_Underread__char_alloca_loop_45_goodG2BData, align 8, !dbg !115
  call void @goodG2BSink(), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !118 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i8*, i8** @CWE127_Buffer_Underread__char_alloca_loop_45_goodG2BData, align 8, !dbg !121
  store i8* %0, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %1, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !137
  %3 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !137
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !137
  %5 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !141
  store i8 %4, i8* %arrayidx2, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %6, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx3, align 1, !dbg !149
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @printLine(i8* %arraydecay4), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__char_alloca_loop_45_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__char_alloca_loop_45_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_45_bad", scope: !12, file: !12, line: 45, type: !20, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 47, type: !6)
!23 = !DILocation(line: 47, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 48, type: !6)
!25 = !DILocation(line: 48, column: 12, scope: !19)
!26 = !DILocation(line: 48, column: 33, scope: !19)
!27 = !DILocation(line: 49, column: 12, scope: !19)
!28 = !DILocation(line: 49, column: 5, scope: !19)
!29 = !DILocation(line: 50, column: 5, scope: !19)
!30 = !DILocation(line: 50, column: 23, scope: !19)
!31 = !DILocation(line: 52, column: 12, scope: !19)
!32 = !DILocation(line: 52, column: 23, scope: !19)
!33 = !DILocation(line: 52, column: 10, scope: !19)
!34 = !DILocation(line: 53, column: 60, scope: !19)
!35 = !DILocation(line: 53, column: 58, scope: !19)
!36 = !DILocation(line: 54, column: 5, scope: !19)
!37 = !DILocation(line: 55, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_45_good", scope: !12, file: !12, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 95, column: 5, scope: !38)
!40 = !DILocation(line: 96, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !42, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 107, type: !44)
!47 = !DILocation(line: 107, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 107, type: !45)
!49 = !DILocation(line: 107, column: 27, scope: !41)
!50 = !DILocation(line: 110, column: 22, scope: !41)
!51 = !DILocation(line: 110, column: 12, scope: !41)
!52 = !DILocation(line: 110, column: 5, scope: !41)
!53 = !DILocation(line: 112, column: 5, scope: !41)
!54 = !DILocation(line: 113, column: 5, scope: !41)
!55 = !DILocation(line: 114, column: 5, scope: !41)
!56 = !DILocation(line: 117, column: 5, scope: !41)
!57 = !DILocation(line: 118, column: 5, scope: !41)
!58 = !DILocation(line: 119, column: 5, scope: !41)
!59 = !DILocation(line: 121, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 28, type: !6)
!62 = !DILocation(line: 28, column: 12, scope: !60)
!63 = !DILocation(line: 28, column: 19, scope: !60)
!64 = !DILocalVariable(name: "i", scope: !65, file: !12, line: 30, type: !66)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 29, column: 5)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !67, line: 46, baseType: !68)
!67 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!68 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!69 = !DILocation(line: 30, column: 16, scope: !65)
!70 = !DILocalVariable(name: "dest", scope: !65, file: !12, line: 31, type: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 100)
!74 = !DILocation(line: 31, column: 14, scope: !65)
!75 = !DILocation(line: 32, column: 9, scope: !65)
!76 = !DILocation(line: 33, column: 9, scope: !65)
!77 = !DILocation(line: 33, column: 21, scope: !65)
!78 = !DILocation(line: 35, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !65, file: !12, line: 35, column: 9)
!80 = !DILocation(line: 35, column: 14, scope: !79)
!81 = !DILocation(line: 35, column: 21, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !12, line: 35, column: 9)
!83 = !DILocation(line: 35, column: 23, scope: !82)
!84 = !DILocation(line: 35, column: 9, scope: !79)
!85 = !DILocation(line: 37, column: 23, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 36, column: 9)
!87 = !DILocation(line: 37, column: 28, scope: !86)
!88 = !DILocation(line: 37, column: 18, scope: !86)
!89 = !DILocation(line: 37, column: 13, scope: !86)
!90 = !DILocation(line: 37, column: 21, scope: !86)
!91 = !DILocation(line: 38, column: 9, scope: !86)
!92 = !DILocation(line: 35, column: 31, scope: !82)
!93 = !DILocation(line: 35, column: 9, scope: !82)
!94 = distinct !{!94, !84, !95, !96}
!95 = !DILocation(line: 38, column: 9, scope: !79)
!96 = !{!"llvm.loop.mustprogress"}
!97 = !DILocation(line: 40, column: 9, scope: !65)
!98 = !DILocation(line: 40, column: 21, scope: !65)
!99 = !DILocation(line: 41, column: 19, scope: !65)
!100 = !DILocation(line: 41, column: 9, scope: !65)
!101 = !DILocation(line: 43, column: 1, scope: !60)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 83, type: !6)
!104 = !DILocation(line: 83, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 84, type: !6)
!106 = !DILocation(line: 84, column: 12, scope: !102)
!107 = !DILocation(line: 84, column: 33, scope: !102)
!108 = !DILocation(line: 85, column: 12, scope: !102)
!109 = !DILocation(line: 85, column: 5, scope: !102)
!110 = !DILocation(line: 86, column: 5, scope: !102)
!111 = !DILocation(line: 86, column: 23, scope: !102)
!112 = !DILocation(line: 88, column: 12, scope: !102)
!113 = !DILocation(line: 88, column: 10, scope: !102)
!114 = !DILocation(line: 89, column: 64, scope: !102)
!115 = !DILocation(line: 89, column: 62, scope: !102)
!116 = !DILocation(line: 90, column: 5, scope: !102)
!117 = !DILocation(line: 91, column: 1, scope: !102)
!118 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !12, line: 64, type: !6)
!120 = !DILocation(line: 64, column: 12, scope: !118)
!121 = !DILocation(line: 64, column: 19, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !12, line: 66, type: !66)
!123 = distinct !DILexicalBlock(scope: !118, file: !12, line: 65, column: 5)
!124 = !DILocation(line: 66, column: 16, scope: !123)
!125 = !DILocalVariable(name: "dest", scope: !123, file: !12, line: 67, type: !71)
!126 = !DILocation(line: 67, column: 14, scope: !123)
!127 = !DILocation(line: 68, column: 9, scope: !123)
!128 = !DILocation(line: 69, column: 9, scope: !123)
!129 = !DILocation(line: 69, column: 21, scope: !123)
!130 = !DILocation(line: 71, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !12, line: 71, column: 9)
!132 = !DILocation(line: 71, column: 14, scope: !131)
!133 = !DILocation(line: 71, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 71, column: 9)
!135 = !DILocation(line: 71, column: 23, scope: !134)
!136 = !DILocation(line: 71, column: 9, scope: !131)
!137 = !DILocation(line: 73, column: 23, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 72, column: 9)
!139 = !DILocation(line: 73, column: 28, scope: !138)
!140 = !DILocation(line: 73, column: 18, scope: !138)
!141 = !DILocation(line: 73, column: 13, scope: !138)
!142 = !DILocation(line: 73, column: 21, scope: !138)
!143 = !DILocation(line: 74, column: 9, scope: !138)
!144 = !DILocation(line: 71, column: 31, scope: !134)
!145 = !DILocation(line: 71, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !96}
!147 = !DILocation(line: 74, column: 9, scope: !131)
!148 = !DILocation(line: 76, column: 9, scope: !123)
!149 = !DILocation(line: 76, column: 21, scope: !123)
!150 = !DILocation(line: 77, column: 19, scope: !123)
!151 = !DILocation(line: 77, column: 9, scope: !123)
!152 = !DILocation(line: 79, column: 1, scope: !118)
