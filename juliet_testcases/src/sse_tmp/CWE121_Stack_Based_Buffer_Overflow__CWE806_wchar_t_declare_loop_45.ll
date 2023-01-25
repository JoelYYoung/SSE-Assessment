; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %2 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_good() #0 !dbg !41 {
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
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_bad(), !dbg !61
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
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !68, metadata !DIExpression()), !dbg !73
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %i, metadata !74, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = load i32*, i32** %data, align 8, !dbg !80
  %call = call i64 @wcslen(i32* %2) #7, !dbg !81
  store i64 %call, i64* %dataLen, align 8, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !86
  %4 = load i64, i64* %dataLen, align 8, !dbg !88
  %cmp = icmp ult i64 %3, %4, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !91
  %6 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !91
  %7 = load i32, i32* %arrayidx, align 4, !dbg !91
  %8 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !95
  store i32 %7, i32* %arrayidx1, align 4, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %9, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !103
  store i32 0, i32* %arrayidx2, align 4, !dbg !104
  %10 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %10), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %0 = load i32*, i32** %data, align 8, !dbg !115
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !120
  call void @goodG2BSink(), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !126
  store i32* %0, i32** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !132, metadata !DIExpression()), !dbg !133
  %2 = load i32*, i32** %data, align 8, !dbg !134
  %call = call i64 @wcslen(i32* %2) #7, !dbg !135
  store i64 %call, i64* %dataLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !140
  %4 = load i64, i64* %dataLen, align 8, !dbg !142
  %cmp = icmp ult i64 %3, %4, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !145
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !145
  %7 = load i32, i32* %arrayidx, align 4, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !149
  store i32 %7, i32* %arrayidx1, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %9, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !156
  store i32 0, i32* %arrayidx2, align 4, !dbg !157
  %10 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %10), !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_bad", scope: !10, file: !10, line: 43, type: !22, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 45, type: !11)
!25 = !DILocation(line: 45, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !10, line: 46, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 46, column: 13, scope: !21)
!31 = !DILocation(line: 47, column: 12, scope: !21)
!32 = !DILocation(line: 47, column: 10, scope: !21)
!33 = !DILocation(line: 49, column: 13, scope: !21)
!34 = !DILocation(line: 49, column: 5, scope: !21)
!35 = !DILocation(line: 50, column: 5, scope: !21)
!36 = !DILocation(line: 50, column: 17, scope: !21)
!37 = !DILocation(line: 51, column: 82, scope: !21)
!38 = !DILocation(line: 51, column: 80, scope: !21)
!39 = !DILocation(line: 52, column: 5, scope: !21)
!40 = !DILocation(line: 53, column: 1, scope: !21)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_good", scope: !10, file: !10, line: 89, type: !22, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 91, column: 5, scope: !41)
!43 = !DILocation(line: 92, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 103, type: !45, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!14, !14, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !10, line: 103, type: !14)
!51 = !DILocation(line: 103, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !10, line: 103, type: !47)
!53 = !DILocation(line: 103, column: 27, scope: !44)
!54 = !DILocation(line: 106, column: 22, scope: !44)
!55 = !DILocation(line: 106, column: 12, scope: !44)
!56 = !DILocation(line: 106, column: 5, scope: !44)
!57 = !DILocation(line: 108, column: 5, scope: !44)
!58 = !DILocation(line: 109, column: 5, scope: !44)
!59 = !DILocation(line: 110, column: 5, scope: !44)
!60 = !DILocation(line: 113, column: 5, scope: !44)
!61 = !DILocation(line: 114, column: 5, scope: !44)
!62 = !DILocation(line: 115, column: 5, scope: !44)
!63 = !DILocation(line: 117, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 28, type: !11)
!66 = !DILocation(line: 28, column: 15, scope: !64)
!67 = !DILocation(line: 28, column: 22, scope: !64)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !10, line: 30, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !10, line: 29, column: 5)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 50)
!73 = !DILocation(line: 30, column: 17, scope: !69)
!74 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 31, type: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 46, baseType: !76)
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 31, column: 16, scope: !69)
!78 = !DILocalVariable(name: "dataLen", scope: !69, file: !10, line: 31, type: !75)
!79 = !DILocation(line: 31, column: 19, scope: !69)
!80 = !DILocation(line: 32, column: 26, scope: !69)
!81 = !DILocation(line: 32, column: 19, scope: !69)
!82 = !DILocation(line: 32, column: 17, scope: !69)
!83 = !DILocation(line: 34, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !69, file: !10, line: 34, column: 9)
!85 = !DILocation(line: 34, column: 14, scope: !84)
!86 = !DILocation(line: 34, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 34, column: 9)
!88 = !DILocation(line: 34, column: 25, scope: !87)
!89 = !DILocation(line: 34, column: 23, scope: !87)
!90 = !DILocation(line: 34, column: 9, scope: !84)
!91 = !DILocation(line: 36, column: 23, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !10, line: 35, column: 9)
!93 = !DILocation(line: 36, column: 28, scope: !92)
!94 = !DILocation(line: 36, column: 18, scope: !92)
!95 = !DILocation(line: 36, column: 13, scope: !92)
!96 = !DILocation(line: 36, column: 21, scope: !92)
!97 = !DILocation(line: 37, column: 9, scope: !92)
!98 = !DILocation(line: 34, column: 35, scope: !87)
!99 = !DILocation(line: 34, column: 9, scope: !87)
!100 = distinct !{!100, !90, !101, !102}
!101 = !DILocation(line: 37, column: 9, scope: !84)
!102 = !{!"llvm.loop.mustprogress"}
!103 = !DILocation(line: 38, column: 9, scope: !69)
!104 = !DILocation(line: 38, column: 20, scope: !69)
!105 = !DILocation(line: 39, column: 20, scope: !69)
!106 = !DILocation(line: 39, column: 9, scope: !69)
!107 = !DILocation(line: 41, column: 1, scope: !64)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 77, type: !22, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !10, line: 79, type: !11)
!110 = !DILocation(line: 79, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !10, line: 80, type: !27)
!112 = !DILocation(line: 80, column: 13, scope: !108)
!113 = !DILocation(line: 81, column: 12, scope: !108)
!114 = !DILocation(line: 81, column: 10, scope: !108)
!115 = !DILocation(line: 83, column: 13, scope: !108)
!116 = !DILocation(line: 83, column: 5, scope: !108)
!117 = !DILocation(line: 84, column: 5, scope: !108)
!118 = !DILocation(line: 84, column: 16, scope: !108)
!119 = !DILocation(line: 85, column: 86, scope: !108)
!120 = !DILocation(line: 85, column: 84, scope: !108)
!121 = !DILocation(line: 86, column: 5, scope: !108)
!122 = !DILocation(line: 87, column: 1, scope: !108)
!123 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !10, line: 62, type: !11)
!125 = !DILocation(line: 62, column: 15, scope: !123)
!126 = !DILocation(line: 62, column: 22, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !10, line: 64, type: !70)
!128 = distinct !DILexicalBlock(scope: !123, file: !10, line: 63, column: 5)
!129 = !DILocation(line: 64, column: 17, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !10, line: 65, type: !75)
!131 = !DILocation(line: 65, column: 16, scope: !128)
!132 = !DILocalVariable(name: "dataLen", scope: !128, file: !10, line: 65, type: !75)
!133 = !DILocation(line: 65, column: 19, scope: !128)
!134 = !DILocation(line: 66, column: 26, scope: !128)
!135 = !DILocation(line: 66, column: 19, scope: !128)
!136 = !DILocation(line: 66, column: 17, scope: !128)
!137 = !DILocation(line: 68, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !10, line: 68, column: 9)
!139 = !DILocation(line: 68, column: 14, scope: !138)
!140 = !DILocation(line: 68, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !10, line: 68, column: 9)
!142 = !DILocation(line: 68, column: 25, scope: !141)
!143 = !DILocation(line: 68, column: 23, scope: !141)
!144 = !DILocation(line: 68, column: 9, scope: !138)
!145 = !DILocation(line: 70, column: 23, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !10, line: 69, column: 9)
!147 = !DILocation(line: 70, column: 28, scope: !146)
!148 = !DILocation(line: 70, column: 18, scope: !146)
!149 = !DILocation(line: 70, column: 13, scope: !146)
!150 = !DILocation(line: 70, column: 21, scope: !146)
!151 = !DILocation(line: 71, column: 9, scope: !146)
!152 = !DILocation(line: 68, column: 35, scope: !141)
!153 = !DILocation(line: 68, column: 9, scope: !141)
!154 = distinct !{!154, !144, !155, !102}
!155 = !DILocation(line: 71, column: 9, scope: !138)
!156 = !DILocation(line: 72, column: 9, scope: !128)
!157 = !DILocation(line: 72, column: 20, scope: !128)
!158 = !DILocation(line: 73, column: 20, scope: !128)
!159 = !DILocation(line: 73, column: 9, scope: !128)
!160 = !DILocation(line: 75, column: 1, scope: !123)
