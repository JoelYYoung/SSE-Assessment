; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_good() #0 !dbg !40 {
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
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_bad(), !dbg !60
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
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_badData, align 8, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !67, metadata !DIExpression()), !dbg !72
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i64 @wcslen(i32* %2) #7, !dbg !80
  store i64 %call, i64* %dataLen, align 8, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !85
  %4 = load i64, i64* %dataLen, align 8, !dbg !87
  %cmp = icmp ult i64 %3, %4, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !90
  %6 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !90
  %7 = load i32, i32* %arrayidx, align 4, !dbg !90
  %8 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !94
  store i32 %7, i32* %arrayidx1, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %9, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !102
  store i32 0, i32* %arrayidx2, align 4, !dbg !103
  %10 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %10), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 400, align 16, !dbg !112
  %1 = bitcast i8* %0 to i32*, !dbg !113
  store i32* %1, i32** %dataBuffer, align 8, !dbg !111
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  store i32* %2, i32** %data, align 8, !dbg !115
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !117
  %4 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !121
  call void @goodG2BSink(), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !124 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !127
  store i32* %0, i32** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !133, metadata !DIExpression()), !dbg !134
  %2 = load i32*, i32** %data, align 8, !dbg !135
  %call = call i64 @wcslen(i32* %2) #7, !dbg !136
  store i64 %call, i64* %dataLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !141
  %4 = load i64, i64* %dataLen, align 8, !dbg !143
  %cmp = icmp ult i64 %3, %4, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !146
  %6 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !146
  %7 = load i32, i32* %arrayidx, align 4, !dbg !146
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !150
  store i32 %7, i32* %arrayidx1, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %9, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !157
  store i32 0, i32* %arrayidx2, align 4, !dbg !158
  %10 = load i32*, i32** %data, align 8, !dbg !159
  call void @printWLine(i32* %10), !dbg !160
  ret void, !dbg !161
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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_bad", scope: !14, file: !14, line: 43, type: !22, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 45, type: !6)
!25 = !DILocation(line: 45, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 46, type: !6)
!27 = !DILocation(line: 46, column: 15, scope: !21)
!28 = !DILocation(line: 46, column: 39, scope: !21)
!29 = !DILocation(line: 46, column: 28, scope: !21)
!30 = !DILocation(line: 47, column: 12, scope: !21)
!31 = !DILocation(line: 47, column: 10, scope: !21)
!32 = !DILocation(line: 49, column: 13, scope: !21)
!33 = !DILocation(line: 49, column: 5, scope: !21)
!34 = !DILocation(line: 50, column: 5, scope: !21)
!35 = !DILocation(line: 50, column: 17, scope: !21)
!36 = !DILocation(line: 51, column: 81, scope: !21)
!37 = !DILocation(line: 51, column: 79, scope: !21)
!38 = !DILocation(line: 52, column: 5, scope: !21)
!39 = !DILocation(line: 53, column: 1, scope: !21)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_45_good", scope: !14, file: !14, line: 89, type: !22, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 91, column: 5, scope: !40)
!42 = !DILocation(line: 92, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !44, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!9, !9, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 103, type: !9)
!50 = !DILocation(line: 103, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 103, type: !46)
!52 = !DILocation(line: 103, column: 27, scope: !43)
!53 = !DILocation(line: 106, column: 22, scope: !43)
!54 = !DILocation(line: 106, column: 12, scope: !43)
!55 = !DILocation(line: 106, column: 5, scope: !43)
!56 = !DILocation(line: 108, column: 5, scope: !43)
!57 = !DILocation(line: 109, column: 5, scope: !43)
!58 = !DILocation(line: 110, column: 5, scope: !43)
!59 = !DILocation(line: 113, column: 5, scope: !43)
!60 = !DILocation(line: 114, column: 5, scope: !43)
!61 = !DILocation(line: 115, column: 5, scope: !43)
!62 = !DILocation(line: 117, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 28, type: !6)
!65 = !DILocation(line: 28, column: 15, scope: !63)
!66 = !DILocation(line: 28, column: 22, scope: !63)
!67 = !DILocalVariable(name: "dest", scope: !68, file: !14, line: 30, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !14, line: 29, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 50)
!72 = !DILocation(line: 30, column: 17, scope: !68)
!73 = !DILocalVariable(name: "i", scope: !68, file: !14, line: 31, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !75)
!75 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!76 = !DILocation(line: 31, column: 16, scope: !68)
!77 = !DILocalVariable(name: "dataLen", scope: !68, file: !14, line: 31, type: !74)
!78 = !DILocation(line: 31, column: 19, scope: !68)
!79 = !DILocation(line: 32, column: 26, scope: !68)
!80 = !DILocation(line: 32, column: 19, scope: !68)
!81 = !DILocation(line: 32, column: 17, scope: !68)
!82 = !DILocation(line: 34, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !68, file: !14, line: 34, column: 9)
!84 = !DILocation(line: 34, column: 14, scope: !83)
!85 = !DILocation(line: 34, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 34, column: 9)
!87 = !DILocation(line: 34, column: 25, scope: !86)
!88 = !DILocation(line: 34, column: 23, scope: !86)
!89 = !DILocation(line: 34, column: 9, scope: !83)
!90 = !DILocation(line: 36, column: 23, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !14, line: 35, column: 9)
!92 = !DILocation(line: 36, column: 28, scope: !91)
!93 = !DILocation(line: 36, column: 18, scope: !91)
!94 = !DILocation(line: 36, column: 13, scope: !91)
!95 = !DILocation(line: 36, column: 21, scope: !91)
!96 = !DILocation(line: 37, column: 9, scope: !91)
!97 = !DILocation(line: 34, column: 35, scope: !86)
!98 = !DILocation(line: 34, column: 9, scope: !86)
!99 = distinct !{!99, !89, !100, !101}
!100 = !DILocation(line: 37, column: 9, scope: !83)
!101 = !{!"llvm.loop.mustprogress"}
!102 = !DILocation(line: 38, column: 9, scope: !68)
!103 = !DILocation(line: 38, column: 20, scope: !68)
!104 = !DILocation(line: 39, column: 20, scope: !68)
!105 = !DILocation(line: 39, column: 9, scope: !68)
!106 = !DILocation(line: 41, column: 1, scope: !63)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 77, type: !22, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 79, type: !6)
!109 = !DILocation(line: 79, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !14, line: 80, type: !6)
!111 = !DILocation(line: 80, column: 15, scope: !107)
!112 = !DILocation(line: 80, column: 39, scope: !107)
!113 = !DILocation(line: 80, column: 28, scope: !107)
!114 = !DILocation(line: 81, column: 12, scope: !107)
!115 = !DILocation(line: 81, column: 10, scope: !107)
!116 = !DILocation(line: 83, column: 13, scope: !107)
!117 = !DILocation(line: 83, column: 5, scope: !107)
!118 = !DILocation(line: 84, column: 5, scope: !107)
!119 = !DILocation(line: 84, column: 16, scope: !107)
!120 = !DILocation(line: 85, column: 85, scope: !107)
!121 = !DILocation(line: 85, column: 83, scope: !107)
!122 = !DILocation(line: 86, column: 5, scope: !107)
!123 = !DILocation(line: 87, column: 1, scope: !107)
!124 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !14, line: 62, type: !6)
!126 = !DILocation(line: 62, column: 15, scope: !124)
!127 = !DILocation(line: 62, column: 22, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !14, line: 64, type: !69)
!129 = distinct !DILexicalBlock(scope: !124, file: !14, line: 63, column: 5)
!130 = !DILocation(line: 64, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !14, line: 65, type: !74)
!132 = !DILocation(line: 65, column: 16, scope: !129)
!133 = !DILocalVariable(name: "dataLen", scope: !129, file: !14, line: 65, type: !74)
!134 = !DILocation(line: 65, column: 19, scope: !129)
!135 = !DILocation(line: 66, column: 26, scope: !129)
!136 = !DILocation(line: 66, column: 19, scope: !129)
!137 = !DILocation(line: 66, column: 17, scope: !129)
!138 = !DILocation(line: 68, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !14, line: 68, column: 9)
!140 = !DILocation(line: 68, column: 14, scope: !139)
!141 = !DILocation(line: 68, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !14, line: 68, column: 9)
!143 = !DILocation(line: 68, column: 25, scope: !142)
!144 = !DILocation(line: 68, column: 23, scope: !142)
!145 = !DILocation(line: 68, column: 9, scope: !139)
!146 = !DILocation(line: 70, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !14, line: 69, column: 9)
!148 = !DILocation(line: 70, column: 28, scope: !147)
!149 = !DILocation(line: 70, column: 18, scope: !147)
!150 = !DILocation(line: 70, column: 13, scope: !147)
!151 = !DILocation(line: 70, column: 21, scope: !147)
!152 = !DILocation(line: 71, column: 9, scope: !147)
!153 = !DILocation(line: 68, column: 35, scope: !142)
!154 = !DILocation(line: 68, column: 9, scope: !142)
!155 = distinct !{!155, !145, !156, !101}
!156 = !DILocation(line: 71, column: 9, scope: !139)
!157 = !DILocation(line: 72, column: 9, scope: !129)
!158 = !DILocation(line: 72, column: 20, scope: !129)
!159 = !DILocation(line: 73, column: 20, scope: !129)
!160 = !DILocation(line: 73, column: 9, scope: !129)
!161 = !DILocation(line: 75, column: 1, scope: !124)
