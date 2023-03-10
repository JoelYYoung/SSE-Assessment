; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__char_declare_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE124_Buffer_Underwrite__char_declare_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %0, i8** @CWE124_Buffer_Underwrite__char_declare_loop_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #5, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #5, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE124_Buffer_Underwrite__char_declare_loop_45_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE124_Buffer_Underwrite__char_declare_loop_45_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE124_Buffer_Underwrite__char_declare_loop_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  store i64 0, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !79
  %cmp = icmp ult i64 %1, 100, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !85
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !86
  %5 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !86
  store i8 %3, i8* %arrayidx2, align 1, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !90
  %inc = add i64 %6, 1, !dbg !90
  store i64 %inc, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !95
  store i8 0, i8* %arrayidx3, align 1, !dbg !96
  %8 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %8), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i8* %arraydecay1, i8** %data, align 8, !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  store i8* %0, i8** @CWE124_Buffer_Underwrite__char_declare_loop_45_goodG2BData, align 8, !dbg !111
  call void @goodG2BSink(), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i8*, i8** @CWE124_Buffer_Underwrite__char_declare_loop_45_goodG2BData, align 8, !dbg !117
  store i8* %0, i8** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %1, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !135
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !135
  %4 = load i8*, i8** %data, align 8, !dbg !136
  %5 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !136
  store i8 %3, i8* %arrayidx2, align 1, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %6, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !144
  store i8 0, i8* %arrayidx3, align 1, !dbg !145
  %8 = load i8*, i8** %data, align 8, !dbg !146
  call void @printLine(i8* %8), !dbg !147
  ret void, !dbg !148
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
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__char_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__char_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_45_bad", scope: !10, file: !10, line: 45, type: !20, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 47, type: !11)
!23 = !DILocation(line: 47, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !10, line: 48, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 48, column: 10, scope: !19)
!29 = !DILocation(line: 49, column: 5, scope: !19)
!30 = !DILocation(line: 50, column: 5, scope: !19)
!31 = !DILocation(line: 50, column: 23, scope: !19)
!32 = !DILocation(line: 52, column: 12, scope: !19)
!33 = !DILocation(line: 52, column: 23, scope: !19)
!34 = !DILocation(line: 52, column: 10, scope: !19)
!35 = !DILocation(line: 53, column: 62, scope: !19)
!36 = !DILocation(line: 53, column: 60, scope: !19)
!37 = !DILocation(line: 54, column: 5, scope: !19)
!38 = !DILocation(line: 55, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_45_good", scope: !10, file: !10, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 95, column: 5, scope: !39)
!41 = !DILocation(line: 96, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 107, type: !43, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !10, line: 107, type: !45)
!48 = !DILocation(line: 107, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !10, line: 107, type: !46)
!50 = !DILocation(line: 107, column: 27, scope: !42)
!51 = !DILocation(line: 110, column: 22, scope: !42)
!52 = !DILocation(line: 110, column: 12, scope: !42)
!53 = !DILocation(line: 110, column: 5, scope: !42)
!54 = !DILocation(line: 112, column: 5, scope: !42)
!55 = !DILocation(line: 113, column: 5, scope: !42)
!56 = !DILocation(line: 114, column: 5, scope: !42)
!57 = !DILocation(line: 117, column: 5, scope: !42)
!58 = !DILocation(line: 118, column: 5, scope: !42)
!59 = !DILocation(line: 119, column: 5, scope: !42)
!60 = !DILocation(line: 121, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "data", scope: !61, file: !10, line: 28, type: !11)
!63 = !DILocation(line: 28, column: 12, scope: !61)
!64 = !DILocation(line: 28, column: 19, scope: !61)
!65 = !DILocalVariable(name: "i", scope: !66, file: !10, line: 30, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !10, line: 29, column: 5)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !68, line: 46, baseType: !69)
!68 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!69 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!70 = !DILocation(line: 30, column: 16, scope: !66)
!71 = !DILocalVariable(name: "source", scope: !66, file: !10, line: 31, type: !25)
!72 = !DILocation(line: 31, column: 14, scope: !66)
!73 = !DILocation(line: 32, column: 9, scope: !66)
!74 = !DILocation(line: 33, column: 9, scope: !66)
!75 = !DILocation(line: 33, column: 23, scope: !66)
!76 = !DILocation(line: 35, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !66, file: !10, line: 35, column: 9)
!78 = !DILocation(line: 35, column: 14, scope: !77)
!79 = !DILocation(line: 35, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !10, line: 35, column: 9)
!81 = !DILocation(line: 35, column: 23, scope: !80)
!82 = !DILocation(line: 35, column: 9, scope: !77)
!83 = !DILocation(line: 37, column: 30, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !10, line: 36, column: 9)
!85 = !DILocation(line: 37, column: 23, scope: !84)
!86 = !DILocation(line: 37, column: 13, scope: !84)
!87 = !DILocation(line: 37, column: 18, scope: !84)
!88 = !DILocation(line: 37, column: 21, scope: !84)
!89 = !DILocation(line: 38, column: 9, scope: !84)
!90 = !DILocation(line: 35, column: 31, scope: !80)
!91 = !DILocation(line: 35, column: 9, scope: !80)
!92 = distinct !{!92, !82, !93, !94}
!93 = !DILocation(line: 38, column: 9, scope: !77)
!94 = !{!"llvm.loop.mustprogress"}
!95 = !DILocation(line: 40, column: 9, scope: !66)
!96 = !DILocation(line: 40, column: 21, scope: !66)
!97 = !DILocation(line: 41, column: 19, scope: !66)
!98 = !DILocation(line: 41, column: 9, scope: !66)
!99 = !DILocation(line: 43, column: 1, scope: !61)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !10, line: 83, type: !11)
!102 = !DILocation(line: 83, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !10, line: 84, type: !25)
!104 = !DILocation(line: 84, column: 10, scope: !100)
!105 = !DILocation(line: 85, column: 5, scope: !100)
!106 = !DILocation(line: 86, column: 5, scope: !100)
!107 = !DILocation(line: 86, column: 23, scope: !100)
!108 = !DILocation(line: 88, column: 12, scope: !100)
!109 = !DILocation(line: 88, column: 10, scope: !100)
!110 = !DILocation(line: 89, column: 66, scope: !100)
!111 = !DILocation(line: 89, column: 64, scope: !100)
!112 = !DILocation(line: 90, column: 5, scope: !100)
!113 = !DILocation(line: 91, column: 1, scope: !100)
!114 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !10, line: 64, type: !11)
!116 = !DILocation(line: 64, column: 12, scope: !114)
!117 = !DILocation(line: 64, column: 19, scope: !114)
!118 = !DILocalVariable(name: "i", scope: !119, file: !10, line: 66, type: !67)
!119 = distinct !DILexicalBlock(scope: !114, file: !10, line: 65, column: 5)
!120 = !DILocation(line: 66, column: 16, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !10, line: 67, type: !25)
!122 = !DILocation(line: 67, column: 14, scope: !119)
!123 = !DILocation(line: 68, column: 9, scope: !119)
!124 = !DILocation(line: 69, column: 9, scope: !119)
!125 = !DILocation(line: 69, column: 23, scope: !119)
!126 = !DILocation(line: 71, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !119, file: !10, line: 71, column: 9)
!128 = !DILocation(line: 71, column: 14, scope: !127)
!129 = !DILocation(line: 71, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !10, line: 71, column: 9)
!131 = !DILocation(line: 71, column: 23, scope: !130)
!132 = !DILocation(line: 71, column: 9, scope: !127)
!133 = !DILocation(line: 73, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !10, line: 72, column: 9)
!135 = !DILocation(line: 73, column: 23, scope: !134)
!136 = !DILocation(line: 73, column: 13, scope: !134)
!137 = !DILocation(line: 73, column: 18, scope: !134)
!138 = !DILocation(line: 73, column: 21, scope: !134)
!139 = !DILocation(line: 74, column: 9, scope: !134)
!140 = !DILocation(line: 71, column: 31, scope: !130)
!141 = !DILocation(line: 71, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !94}
!143 = !DILocation(line: 74, column: 9, scope: !127)
!144 = !DILocation(line: 76, column: 9, scope: !119)
!145 = !DILocation(line: 76, column: 21, scope: !119)
!146 = !DILocation(line: 77, column: 19, scope: !119)
!147 = !DILocation(line: 77, column: 9, scope: !119)
!148 = !DILocation(line: 79, column: 1, scope: !114)
