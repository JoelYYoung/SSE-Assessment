; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %0, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData, align 8, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !67, metadata !DIExpression()), !dbg !69
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !69
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !79
  %cmp = icmp ult i64 %2, 100, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !85
  %4 = load i32, i32* %arrayidx, align 4, !dbg !85
  %5 = load i32*, i32** %data, align 8, !dbg !86
  %6 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !86
  store i32 %4, i32* %arrayidx1, align 4, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !90
  %inc = add i64 %7, 1, !dbg !90
  store i64 %inc, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !95
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !95
  call void @printIntLine(i32 %9), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  store i32* %0, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData, align 8, !dbg !108
  call void @goodG2BSink(), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData, align 8, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %2, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !130
  %4 = load i32, i32* %arrayidx, align 4, !dbg !130
  %5 = load i32*, i32** %data, align 8, !dbg !131
  %6 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !131
  store i32 %4, i32* %arrayidx1, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %7, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !139
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !139
  call void @printIntLine(i32 %9), !dbg !140
  ret void, !dbg !141
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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData", scope: !2, file: !10, line: 19, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_bad", scope: !10, file: !10, line: 41, type: !20, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 43, type: !11)
!23 = !DILocation(line: 43, column: 11, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 44, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 44, column: 9, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 45, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 45, column: 9, scope: !19)
!34 = !DILocation(line: 48, column: 12, scope: !19)
!35 = !DILocation(line: 48, column: 10, scope: !19)
!36 = !DILocation(line: 49, column: 78, scope: !19)
!37 = !DILocation(line: 49, column: 76, scope: !19)
!38 = !DILocation(line: 50, column: 5, scope: !19)
!39 = !DILocation(line: 51, column: 1, scope: !19)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_good", scope: !10, file: !10, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 88, column: 5, scope: !40)
!42 = !DILocation(line: 89, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 100, type: !44, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!12, !12, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !10, line: 100, type: !12)
!50 = !DILocation(line: 100, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !10, line: 100, type: !46)
!52 = !DILocation(line: 100, column: 27, scope: !43)
!53 = !DILocation(line: 103, column: 22, scope: !43)
!54 = !DILocation(line: 103, column: 12, scope: !43)
!55 = !DILocation(line: 103, column: 5, scope: !43)
!56 = !DILocation(line: 105, column: 5, scope: !43)
!57 = !DILocation(line: 106, column: 5, scope: !43)
!58 = !DILocation(line: 107, column: 5, scope: !43)
!59 = !DILocation(line: 110, column: 5, scope: !43)
!60 = !DILocation(line: 111, column: 5, scope: !43)
!61 = !DILocation(line: 112, column: 5, scope: !43)
!62 = !DILocation(line: 114, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "data", scope: !63, file: !10, line: 26, type: !11)
!65 = !DILocation(line: 26, column: 11, scope: !63)
!66 = !DILocation(line: 26, column: 18, scope: !63)
!67 = !DILocalVariable(name: "source", scope: !68, file: !10, line: 28, type: !30)
!68 = distinct !DILexicalBlock(scope: !63, file: !10, line: 27, column: 5)
!69 = !DILocation(line: 28, column: 13, scope: !68)
!70 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 30, type: !72)
!71 = distinct !DILexicalBlock(scope: !68, file: !10, line: 29, column: 9)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !73, line: 46, baseType: !74)
!73 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!74 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!75 = !DILocation(line: 30, column: 20, scope: !71)
!76 = !DILocation(line: 32, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !10, line: 32, column: 13)
!78 = !DILocation(line: 32, column: 18, scope: !77)
!79 = !DILocation(line: 32, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !10, line: 32, column: 13)
!81 = !DILocation(line: 32, column: 27, scope: !80)
!82 = !DILocation(line: 32, column: 13, scope: !77)
!83 = !DILocation(line: 34, column: 34, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !10, line: 33, column: 13)
!85 = !DILocation(line: 34, column: 27, scope: !84)
!86 = !DILocation(line: 34, column: 17, scope: !84)
!87 = !DILocation(line: 34, column: 22, scope: !84)
!88 = !DILocation(line: 34, column: 25, scope: !84)
!89 = !DILocation(line: 35, column: 13, scope: !84)
!90 = !DILocation(line: 32, column: 35, scope: !80)
!91 = !DILocation(line: 32, column: 13, scope: !80)
!92 = distinct !{!92, !82, !93, !94}
!93 = !DILocation(line: 35, column: 13, scope: !77)
!94 = !{!"llvm.loop.mustprogress"}
!95 = !DILocation(line: 36, column: 26, scope: !71)
!96 = !DILocation(line: 36, column: 13, scope: !71)
!97 = !DILocation(line: 39, column: 1, scope: !63)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 75, type: !20, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !10, line: 77, type: !11)
!100 = !DILocation(line: 77, column: 11, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !10, line: 78, type: !25)
!102 = !DILocation(line: 78, column: 9, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !10, line: 79, type: !30)
!104 = !DILocation(line: 79, column: 9, scope: !98)
!105 = !DILocation(line: 81, column: 12, scope: !98)
!106 = !DILocation(line: 81, column: 10, scope: !98)
!107 = !DILocation(line: 82, column: 82, scope: !98)
!108 = !DILocation(line: 82, column: 80, scope: !98)
!109 = !DILocation(line: 83, column: 5, scope: !98)
!110 = !DILocation(line: 84, column: 1, scope: !98)
!111 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !10, line: 60, type: !11)
!113 = !DILocation(line: 60, column: 11, scope: !111)
!114 = !DILocation(line: 60, column: 18, scope: !111)
!115 = !DILocalVariable(name: "source", scope: !116, file: !10, line: 62, type: !30)
!116 = distinct !DILexicalBlock(scope: !111, file: !10, line: 61, column: 5)
!117 = !DILocation(line: 62, column: 13, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !10, line: 64, type: !72)
!119 = distinct !DILexicalBlock(scope: !116, file: !10, line: 63, column: 9)
!120 = !DILocation(line: 64, column: 20, scope: !119)
!121 = !DILocation(line: 66, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !10, line: 66, column: 13)
!123 = !DILocation(line: 66, column: 18, scope: !122)
!124 = !DILocation(line: 66, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !10, line: 66, column: 13)
!126 = !DILocation(line: 66, column: 27, scope: !125)
!127 = !DILocation(line: 66, column: 13, scope: !122)
!128 = !DILocation(line: 68, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !10, line: 67, column: 13)
!130 = !DILocation(line: 68, column: 27, scope: !129)
!131 = !DILocation(line: 68, column: 17, scope: !129)
!132 = !DILocation(line: 68, column: 22, scope: !129)
!133 = !DILocation(line: 68, column: 25, scope: !129)
!134 = !DILocation(line: 69, column: 13, scope: !129)
!135 = !DILocation(line: 66, column: 35, scope: !125)
!136 = !DILocation(line: 66, column: 13, scope: !125)
!137 = distinct !{!137, !127, !138, !94}
!138 = !DILocation(line: 69, column: 13, scope: !122)
!139 = !DILocation(line: 70, column: 26, scope: !119)
!140 = !DILocation(line: 70, column: 13, scope: !119)
!141 = !DILocation(line: 73, column: 1, scope: !111)
