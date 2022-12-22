; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_good() #0 !dbg !42 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_badData, align 8, !dbg !68
  store i32* %0, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !74, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !79
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !80
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %1, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !92
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %5 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !93
  store i32 %3, i32* %arrayidx2, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %6, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !102
  store i32 0, i32* %arrayidx3, align 4, !dbg !103
  %8 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %8), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 200, align 16, !dbg !112
  %1 = bitcast i8* %0 to i32*, !dbg !113
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = alloca i8, i64 400, align 16, !dbg !116
  %3 = bitcast i8* %2 to i32*, !dbg !117
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !115
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !118
  store i32* %4, i32** %data, align 8, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !123
  call void @goodG2BSink(), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !126 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !129
  store i32* %0, i32** %data, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !136
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !142
  %cmp = icmp ult i64 %1, 100, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !148
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !148
  %4 = load i32*, i32** %data, align 8, !dbg !149
  %5 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !149
  store i32 %3, i32* %arrayidx2, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %6, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !157
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !157
  store i32 0, i32* %arrayidx3, align 4, !dbg !158
  %8 = load i32*, i32** %data, align 8, !dbg !159
  call void @printWLine(i32* %8), !dbg !160
  ret void, !dbg !161
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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_bad", scope: !14, file: !14, line: 44, type: !22, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 46, type: !6)
!25 = !DILocation(line: 46, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 47, type: !6)
!27 = !DILocation(line: 47, column: 15, scope: !21)
!28 = !DILocation(line: 47, column: 42, scope: !21)
!29 = !DILocation(line: 47, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 48, type: !6)
!31 = !DILocation(line: 48, column: 15, scope: !21)
!32 = !DILocation(line: 48, column: 43, scope: !21)
!33 = !DILocation(line: 48, column: 32, scope: !21)
!34 = !DILocation(line: 51, column: 12, scope: !21)
!35 = !DILocation(line: 51, column: 10, scope: !21)
!36 = !DILocation(line: 52, column: 5, scope: !21)
!37 = !DILocation(line: 52, column: 13, scope: !21)
!38 = !DILocation(line: 53, column: 81, scope: !21)
!39 = !DILocation(line: 53, column: 79, scope: !21)
!40 = !DILocation(line: 54, column: 5, scope: !21)
!41 = !DILocation(line: 55, column: 1, scope: !21)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_45_good", scope: !14, file: !14, line: 92, type: !22, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 94, column: 5, scope: !42)
!44 = !DILocation(line: 95, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !46, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!9, !9, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 106, type: !9)
!52 = !DILocation(line: 106, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 106, type: !48)
!54 = !DILocation(line: 106, column: 27, scope: !45)
!55 = !DILocation(line: 109, column: 22, scope: !45)
!56 = !DILocation(line: 109, column: 12, scope: !45)
!57 = !DILocation(line: 109, column: 5, scope: !45)
!58 = !DILocation(line: 111, column: 5, scope: !45)
!59 = !DILocation(line: 112, column: 5, scope: !45)
!60 = !DILocation(line: 113, column: 5, scope: !45)
!61 = !DILocation(line: 116, column: 5, scope: !45)
!62 = !DILocation(line: 117, column: 5, scope: !45)
!63 = !DILocation(line: 118, column: 5, scope: !45)
!64 = !DILocation(line: 120, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 28, type: !6)
!67 = !DILocation(line: 28, column: 15, scope: !65)
!68 = !DILocation(line: 28, column: 22, scope: !65)
!69 = !DILocalVariable(name: "i", scope: !70, file: !14, line: 30, type: !71)
!70 = distinct !DILexicalBlock(scope: !65, file: !14, line: 29, column: 5)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !72)
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DILocation(line: 30, column: 16, scope: !70)
!74 = !DILocalVariable(name: "source", scope: !70, file: !14, line: 31, type: !75)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 100)
!78 = !DILocation(line: 31, column: 17, scope: !70)
!79 = !DILocation(line: 32, column: 17, scope: !70)
!80 = !DILocation(line: 32, column: 9, scope: !70)
!81 = !DILocation(line: 33, column: 9, scope: !70)
!82 = !DILocation(line: 33, column: 23, scope: !70)
!83 = !DILocation(line: 35, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !70, file: !14, line: 35, column: 9)
!85 = !DILocation(line: 35, column: 14, scope: !84)
!86 = !DILocation(line: 35, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !14, line: 35, column: 9)
!88 = !DILocation(line: 35, column: 23, scope: !87)
!89 = !DILocation(line: 35, column: 9, scope: !84)
!90 = !DILocation(line: 37, column: 30, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !14, line: 36, column: 9)
!92 = !DILocation(line: 37, column: 23, scope: !91)
!93 = !DILocation(line: 37, column: 13, scope: !91)
!94 = !DILocation(line: 37, column: 18, scope: !91)
!95 = !DILocation(line: 37, column: 21, scope: !91)
!96 = !DILocation(line: 38, column: 9, scope: !91)
!97 = !DILocation(line: 35, column: 31, scope: !87)
!98 = !DILocation(line: 35, column: 9, scope: !87)
!99 = distinct !{!99, !89, !100, !101}
!100 = !DILocation(line: 38, column: 9, scope: !84)
!101 = !{!"llvm.loop.mustprogress"}
!102 = !DILocation(line: 39, column: 9, scope: !70)
!103 = !DILocation(line: 39, column: 21, scope: !70)
!104 = !DILocation(line: 40, column: 20, scope: !70)
!105 = !DILocation(line: 40, column: 9, scope: !70)
!106 = !DILocation(line: 42, column: 1, scope: !65)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 80, type: !22, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 82, type: !6)
!109 = !DILocation(line: 82, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !14, line: 83, type: !6)
!111 = !DILocation(line: 83, column: 15, scope: !107)
!112 = !DILocation(line: 83, column: 42, scope: !107)
!113 = !DILocation(line: 83, column: 31, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !14, line: 84, type: !6)
!115 = !DILocation(line: 84, column: 15, scope: !107)
!116 = !DILocation(line: 84, column: 43, scope: !107)
!117 = !DILocation(line: 84, column: 32, scope: !107)
!118 = !DILocation(line: 86, column: 12, scope: !107)
!119 = !DILocation(line: 86, column: 10, scope: !107)
!120 = !DILocation(line: 87, column: 5, scope: !107)
!121 = !DILocation(line: 87, column: 13, scope: !107)
!122 = !DILocation(line: 88, column: 85, scope: !107)
!123 = !DILocation(line: 88, column: 83, scope: !107)
!124 = !DILocation(line: 89, column: 5, scope: !107)
!125 = !DILocation(line: 90, column: 1, scope: !107)
!126 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", scope: !126, file: !14, line: 64, type: !6)
!128 = !DILocation(line: 64, column: 15, scope: !126)
!129 = !DILocation(line: 64, column: 22, scope: !126)
!130 = !DILocalVariable(name: "i", scope: !131, file: !14, line: 66, type: !71)
!131 = distinct !DILexicalBlock(scope: !126, file: !14, line: 65, column: 5)
!132 = !DILocation(line: 66, column: 16, scope: !131)
!133 = !DILocalVariable(name: "source", scope: !131, file: !14, line: 67, type: !75)
!134 = !DILocation(line: 67, column: 17, scope: !131)
!135 = !DILocation(line: 68, column: 17, scope: !131)
!136 = !DILocation(line: 68, column: 9, scope: !131)
!137 = !DILocation(line: 69, column: 9, scope: !131)
!138 = !DILocation(line: 69, column: 23, scope: !131)
!139 = !DILocation(line: 71, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !131, file: !14, line: 71, column: 9)
!141 = !DILocation(line: 71, column: 14, scope: !140)
!142 = !DILocation(line: 71, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !14, line: 71, column: 9)
!144 = !DILocation(line: 71, column: 23, scope: !143)
!145 = !DILocation(line: 71, column: 9, scope: !140)
!146 = !DILocation(line: 73, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !14, line: 72, column: 9)
!148 = !DILocation(line: 73, column: 23, scope: !147)
!149 = !DILocation(line: 73, column: 13, scope: !147)
!150 = !DILocation(line: 73, column: 18, scope: !147)
!151 = !DILocation(line: 73, column: 21, scope: !147)
!152 = !DILocation(line: 74, column: 9, scope: !147)
!153 = !DILocation(line: 71, column: 31, scope: !143)
!154 = !DILocation(line: 71, column: 9, scope: !143)
!155 = distinct !{!155, !145, !156, !101}
!156 = !DILocation(line: 74, column: 9, scope: !140)
!157 = !DILocation(line: 75, column: 9, scope: !131)
!158 = !DILocation(line: 75, column: 21, scope: !131)
!159 = !DILocation(line: 76, column: 20, scope: !131)
!160 = !DILocation(line: 76, column: 9, scope: !131)
!161 = !DILocation(line: 78, column: 1, scope: !126)
