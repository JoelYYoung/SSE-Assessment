; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
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
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  call void %5(i32* %6), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %1 = load i32*, i32** %data.addr, align 8, !dbg !54
  %call = call i64 @wcslen(i32* %1) #7, !dbg !55
  store i64 %call, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !60
  %3 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp = icmp ult i64 %2, %3, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !65
  %5 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !65
  %6 = load i32, i32* %arrayidx, align 4, !dbg !65
  %7 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !69
  store i32 %6, i32* %arrayidx1, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %8, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !77
  store i32 0, i32* %arrayidx2, align 4, !dbg !78
  %9 = load i32*, i32** %data.addr, align 8, !dbg !79
  call void @printWLine(i32* %9), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !108, metadata !DIExpression()), !dbg !109
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !109
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
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  call void %5(i32* %6), !dbg !120
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !123 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !131, metadata !DIExpression()), !dbg !132
  %1 = load i32*, i32** %data.addr, align 8, !dbg !133
  %call = call i64 @wcslen(i32* %1) #7, !dbg !134
  store i64 %call, i64* %dataLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !139
  %3 = load i64, i64* %dataLen, align 8, !dbg !141
  %cmp = icmp ult i64 %2, %3, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !144
  %5 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !144
  %6 = load i32, i32* %arrayidx, align 4, !dbg !144
  %7 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !148
  store i32 %6, i32* %arrayidx1, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %8, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !155
  store i32 0, i32* %arrayidx2, align 4, !dbg !156
  %9 = load i32*, i32** %data.addr, align 8, !dbg !157
  call void @printWLine(i32* %9), !dbg !158
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44_bad", scope: !16, file: !16, line: 39, type: !17, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 41, type: !4)
!20 = !DILocation(line: 41, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 43, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 43, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 44, type: !4)
!27 = !DILocation(line: 44, column: 15, scope: !15)
!28 = !DILocation(line: 44, column: 39, scope: !15)
!29 = !DILocation(line: 44, column: 28, scope: !15)
!30 = !DILocation(line: 45, column: 12, scope: !15)
!31 = !DILocation(line: 45, column: 10, scope: !15)
!32 = !DILocation(line: 47, column: 13, scope: !15)
!33 = !DILocation(line: 47, column: 5, scope: !15)
!34 = !DILocation(line: 48, column: 5, scope: !15)
!35 = !DILocation(line: 48, column: 17, scope: !15)
!36 = !DILocation(line: 50, column: 5, scope: !15)
!37 = !DILocation(line: 50, column: 13, scope: !15)
!38 = !DILocation(line: 51, column: 1, scope: !15)
!39 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !16, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !16, line: 26, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !16, line: 25, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 26, column: 17, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !16, line: 27, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 27, column: 16, scope: !43)
!52 = !DILocalVariable(name: "dataLen", scope: !43, file: !16, line: 27, type: !49)
!53 = !DILocation(line: 27, column: 19, scope: !43)
!54 = !DILocation(line: 28, column: 26, scope: !43)
!55 = !DILocation(line: 28, column: 19, scope: !43)
!56 = !DILocation(line: 28, column: 17, scope: !43)
!57 = !DILocation(line: 30, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !43, file: !16, line: 30, column: 9)
!59 = !DILocation(line: 30, column: 14, scope: !58)
!60 = !DILocation(line: 30, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !16, line: 30, column: 9)
!62 = !DILocation(line: 30, column: 25, scope: !61)
!63 = !DILocation(line: 30, column: 23, scope: !61)
!64 = !DILocation(line: 30, column: 9, scope: !58)
!65 = !DILocation(line: 32, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !16, line: 31, column: 9)
!67 = !DILocation(line: 32, column: 28, scope: !66)
!68 = !DILocation(line: 32, column: 18, scope: !66)
!69 = !DILocation(line: 32, column: 13, scope: !66)
!70 = !DILocation(line: 32, column: 21, scope: !66)
!71 = !DILocation(line: 33, column: 9, scope: !66)
!72 = !DILocation(line: 30, column: 35, scope: !61)
!73 = !DILocation(line: 30, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 33, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 34, column: 9, scope: !43)
!78 = !DILocation(line: 34, column: 20, scope: !43)
!79 = !DILocation(line: 35, column: 20, scope: !43)
!80 = !DILocation(line: 35, column: 9, scope: !43)
!81 = !DILocation(line: 37, column: 1, scope: !39)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_44_good", scope: !16, file: !16, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 88, column: 5, scope: !82)
!84 = !DILocation(line: 89, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 100, type: !86, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !16, line: 100, type: !7)
!92 = !DILocation(line: 100, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !16, line: 100, type: !88)
!94 = !DILocation(line: 100, column: 27, scope: !85)
!95 = !DILocation(line: 103, column: 22, scope: !85)
!96 = !DILocation(line: 103, column: 12, scope: !85)
!97 = !DILocation(line: 103, column: 5, scope: !85)
!98 = !DILocation(line: 105, column: 5, scope: !85)
!99 = !DILocation(line: 106, column: 5, scope: !85)
!100 = !DILocation(line: 107, column: 5, scope: !85)
!101 = !DILocation(line: 110, column: 5, scope: !85)
!102 = !DILocation(line: 111, column: 5, scope: !85)
!103 = !DILocation(line: 112, column: 5, scope: !85)
!104 = !DILocation(line: 114, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 76, type: !4)
!107 = !DILocation(line: 76, column: 15, scope: !105)
!108 = !DILocalVariable(name: "funcPtr", scope: !105, file: !16, line: 77, type: !22)
!109 = !DILocation(line: 77, column: 12, scope: !105)
!110 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !16, line: 78, type: !4)
!111 = !DILocation(line: 78, column: 15, scope: !105)
!112 = !DILocation(line: 78, column: 39, scope: !105)
!113 = !DILocation(line: 78, column: 28, scope: !105)
!114 = !DILocation(line: 79, column: 12, scope: !105)
!115 = !DILocation(line: 79, column: 10, scope: !105)
!116 = !DILocation(line: 81, column: 13, scope: !105)
!117 = !DILocation(line: 81, column: 5, scope: !105)
!118 = !DILocation(line: 82, column: 5, scope: !105)
!119 = !DILocation(line: 82, column: 16, scope: !105)
!120 = !DILocation(line: 83, column: 5, scope: !105)
!121 = !DILocation(line: 83, column: 13, scope: !105)
!122 = !DILocation(line: 84, column: 1, scope: !105)
!123 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 58, type: !23, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", arg: 1, scope: !123, file: !16, line: 58, type: !4)
!125 = !DILocation(line: 58, column: 35, scope: !123)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !16, line: 61, type: !44)
!127 = distinct !DILexicalBlock(scope: !123, file: !16, line: 60, column: 5)
!128 = !DILocation(line: 61, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !16, line: 62, type: !49)
!130 = !DILocation(line: 62, column: 16, scope: !127)
!131 = !DILocalVariable(name: "dataLen", scope: !127, file: !16, line: 62, type: !49)
!132 = !DILocation(line: 62, column: 19, scope: !127)
!133 = !DILocation(line: 63, column: 26, scope: !127)
!134 = !DILocation(line: 63, column: 19, scope: !127)
!135 = !DILocation(line: 63, column: 17, scope: !127)
!136 = !DILocation(line: 65, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !16, line: 65, column: 9)
!138 = !DILocation(line: 65, column: 14, scope: !137)
!139 = !DILocation(line: 65, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !16, line: 65, column: 9)
!141 = !DILocation(line: 65, column: 25, scope: !140)
!142 = !DILocation(line: 65, column: 23, scope: !140)
!143 = !DILocation(line: 65, column: 9, scope: !137)
!144 = !DILocation(line: 67, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !16, line: 66, column: 9)
!146 = !DILocation(line: 67, column: 28, scope: !145)
!147 = !DILocation(line: 67, column: 18, scope: !145)
!148 = !DILocation(line: 67, column: 13, scope: !145)
!149 = !DILocation(line: 67, column: 21, scope: !145)
!150 = !DILocation(line: 68, column: 9, scope: !145)
!151 = !DILocation(line: 65, column: 35, scope: !140)
!152 = !DILocation(line: 65, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !76}
!154 = !DILocation(line: 68, column: 9, scope: !137)
!155 = !DILocation(line: 69, column: 9, scope: !127)
!156 = !DILocation(line: 69, column: 20, scope: !127)
!157 = !DILocation(line: 70, column: 20, scope: !127)
!158 = !DILocation(line: 70, column: 9, scope: !127)
!159 = !DILocation(line: 72, column: 1, scope: !123)
