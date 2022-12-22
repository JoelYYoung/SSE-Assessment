; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_bad(), !dbg !61
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
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData, align 8, !dbg !67
  store i8* %0, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !76
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !82
  %cmp = icmp ult i64 %1, 100, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !88
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %5 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !89
  store i8 %3, i8* %arrayidx2, align 1, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !93
  %inc = add i64 %6, 1, !dbg !93
  store i64 %inc, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !98
  store i8 0, i8* %arrayidx3, align 1, !dbg !99
  %8 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %8), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %1 = load i8*, i8** %data, align 8, !dbg !114
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData, align 8, !dbg !115
  call void @goodG2BSink(), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !118 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData, align 8, !dbg !121
  store i8* %0, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %1, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !139
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !139
  %4 = load i8*, i8** %data, align 8, !dbg !140
  %5 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !140
  store i8 %3, i8* %arrayidx2, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %6, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !148
  store i8 0, i8* %arrayidx3, align 1, !dbg !149
  %8 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %8), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_bad", scope: !10, file: !10, line: 44, type: !20, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 46, type: !11)
!23 = !DILocation(line: 46, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 47, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 47, column: 10, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 48, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 48, column: 10, scope: !19)
!34 = !DILocation(line: 51, column: 12, scope: !19)
!35 = !DILocation(line: 51, column: 10, scope: !19)
!36 = !DILocation(line: 52, column: 5, scope: !19)
!37 = !DILocation(line: 52, column: 13, scope: !19)
!38 = !DILocation(line: 53, column: 79, scope: !19)
!39 = !DILocation(line: 53, column: 77, scope: !19)
!40 = !DILocation(line: 54, column: 5, scope: !19)
!41 = !DILocation(line: 55, column: 1, scope: !19)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_good", scope: !10, file: !10, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 94, column: 5, scope: !42)
!44 = !DILocation(line: 95, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 106, type: !46, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !10, line: 106, type: !48)
!51 = !DILocation(line: 106, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !10, line: 106, type: !49)
!53 = !DILocation(line: 106, column: 27, scope: !45)
!54 = !DILocation(line: 109, column: 22, scope: !45)
!55 = !DILocation(line: 109, column: 12, scope: !45)
!56 = !DILocation(line: 109, column: 5, scope: !45)
!57 = !DILocation(line: 111, column: 5, scope: !45)
!58 = !DILocation(line: 112, column: 5, scope: !45)
!59 = !DILocation(line: 113, column: 5, scope: !45)
!60 = !DILocation(line: 116, column: 5, scope: !45)
!61 = !DILocation(line: 117, column: 5, scope: !45)
!62 = !DILocation(line: 118, column: 5, scope: !45)
!63 = !DILocation(line: 120, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 28, type: !11)
!66 = !DILocation(line: 28, column: 12, scope: !64)
!67 = !DILocation(line: 28, column: 19, scope: !64)
!68 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 30, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !10, line: 29, column: 5)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !71, line: 46, baseType: !72)
!71 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DILocation(line: 30, column: 16, scope: !69)
!74 = !DILocalVariable(name: "source", scope: !69, file: !10, line: 31, type: !30)
!75 = !DILocation(line: 31, column: 14, scope: !69)
!76 = !DILocation(line: 32, column: 9, scope: !69)
!77 = !DILocation(line: 33, column: 9, scope: !69)
!78 = !DILocation(line: 33, column: 23, scope: !69)
!79 = !DILocation(line: 35, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !69, file: !10, line: 35, column: 9)
!81 = !DILocation(line: 35, column: 14, scope: !80)
!82 = !DILocation(line: 35, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 35, column: 9)
!84 = !DILocation(line: 35, column: 23, scope: !83)
!85 = !DILocation(line: 35, column: 9, scope: !80)
!86 = !DILocation(line: 37, column: 30, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !10, line: 36, column: 9)
!88 = !DILocation(line: 37, column: 23, scope: !87)
!89 = !DILocation(line: 37, column: 13, scope: !87)
!90 = !DILocation(line: 37, column: 18, scope: !87)
!91 = !DILocation(line: 37, column: 21, scope: !87)
!92 = !DILocation(line: 38, column: 9, scope: !87)
!93 = !DILocation(line: 35, column: 31, scope: !83)
!94 = !DILocation(line: 35, column: 9, scope: !83)
!95 = distinct !{!95, !85, !96, !97}
!96 = !DILocation(line: 38, column: 9, scope: !80)
!97 = !{!"llvm.loop.mustprogress"}
!98 = !DILocation(line: 39, column: 9, scope: !69)
!99 = !DILocation(line: 39, column: 21, scope: !69)
!100 = !DILocation(line: 40, column: 19, scope: !69)
!101 = !DILocation(line: 40, column: 9, scope: !69)
!102 = !DILocation(line: 42, column: 1, scope: !64)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 82, type: !11)
!105 = !DILocation(line: 82, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !10, line: 83, type: !25)
!107 = !DILocation(line: 83, column: 10, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !10, line: 84, type: !30)
!109 = !DILocation(line: 84, column: 10, scope: !103)
!110 = !DILocation(line: 86, column: 12, scope: !103)
!111 = !DILocation(line: 86, column: 10, scope: !103)
!112 = !DILocation(line: 87, column: 5, scope: !103)
!113 = !DILocation(line: 87, column: 13, scope: !103)
!114 = !DILocation(line: 88, column: 83, scope: !103)
!115 = !DILocation(line: 88, column: 81, scope: !103)
!116 = !DILocation(line: 89, column: 5, scope: !103)
!117 = !DILocation(line: 90, column: 1, scope: !103)
!118 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !10, line: 64, type: !11)
!120 = !DILocation(line: 64, column: 12, scope: !118)
!121 = !DILocation(line: 64, column: 19, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !10, line: 66, type: !70)
!123 = distinct !DILexicalBlock(scope: !118, file: !10, line: 65, column: 5)
!124 = !DILocation(line: 66, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !10, line: 67, type: !30)
!126 = !DILocation(line: 67, column: 14, scope: !123)
!127 = !DILocation(line: 68, column: 9, scope: !123)
!128 = !DILocation(line: 69, column: 9, scope: !123)
!129 = !DILocation(line: 69, column: 23, scope: !123)
!130 = !DILocation(line: 71, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !10, line: 71, column: 9)
!132 = !DILocation(line: 71, column: 14, scope: !131)
!133 = !DILocation(line: 71, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !10, line: 71, column: 9)
!135 = !DILocation(line: 71, column: 23, scope: !134)
!136 = !DILocation(line: 71, column: 9, scope: !131)
!137 = !DILocation(line: 73, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !10, line: 72, column: 9)
!139 = !DILocation(line: 73, column: 23, scope: !138)
!140 = !DILocation(line: 73, column: 13, scope: !138)
!141 = !DILocation(line: 73, column: 18, scope: !138)
!142 = !DILocation(line: 73, column: 21, scope: !138)
!143 = !DILocation(line: 74, column: 9, scope: !138)
!144 = !DILocation(line: 71, column: 31, scope: !134)
!145 = !DILocation(line: 71, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !97}
!147 = !DILocation(line: 74, column: 9, scope: !131)
!148 = !DILocation(line: 75, column: 9, scope: !123)
!149 = !DILocation(line: 75, column: 21, scope: !123)
!150 = !DILocation(line: 76, column: 19, scope: !123)
!151 = !DILocation(line: 76, column: 9, scope: !123)
!152 = !DILocation(line: 78, column: 1, scope: !118)
