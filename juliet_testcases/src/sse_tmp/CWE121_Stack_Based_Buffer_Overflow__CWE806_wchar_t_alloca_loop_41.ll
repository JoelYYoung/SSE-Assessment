; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !31, metadata !DIExpression()), !dbg !32
  %1 = load i32*, i32** %data.addr, align 8, !dbg !33
  %call = call i64 @wcslen(i32* %1) #6, !dbg !34
  store i64 %call, i64* %dataLen, align 8, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %3 = load i64, i64* %dataLen, align 8, !dbg !41
  %cmp = icmp ult i64 %2, %3, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !44
  %5 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !44
  %6 = load i32, i32* %arrayidx, align 4, !dbg !44
  %7 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !48
  store i32 %6, i32* %arrayidx1, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %8, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !56
  store i32 0, i32* %arrayidx2, align 4, !dbg !57
  %9 = load i32*, i32** %data.addr, align 8, !dbg !58
  call void @printWLine(i32* %9), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_bad() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = alloca i8, i64 400, align 16, !dbg !68
  %1 = bitcast i8* %0 to i32*, !dbg !69
  store i32* %1, i32** %dataBuffer, align 8, !dbg !67
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  store i32* %2, i32** %data, align 8, !dbg !71
  %3 = load i32*, i32** %data, align 8, !dbg !72
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !73
  %4 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %5 = load i32*, i32** %data, align 8, !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_badSink(i32* %5), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_goodG2BSink(i32* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !87, metadata !DIExpression()), !dbg !88
  %1 = load i32*, i32** %data.addr, align 8, !dbg !89
  %call = call i64 @wcslen(i32* %1) #6, !dbg !90
  store i64 %call, i64* %dataLen, align 8, !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !95
  %3 = load i64, i64* %dataLen, align 8, !dbg !97
  %cmp = icmp ult i64 %2, %3, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !100
  %5 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !100
  %6 = load i32, i32* %arrayidx, align 4, !dbg !100
  %7 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !104
  store i32 %6, i32* %arrayidx1, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %8, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !111
  store i32 0, i32* %arrayidx2, align 4, !dbg !112
  %9 = load i32*, i32** %data.addr, align 8, !dbg !113
  call void @printWLine(i32* %9), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_good() #0 !dbg !116 {
entry:
  call void @goodG2B(), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %call = call i64 @time(i64* null) #7, !dbg !129
  %conv = trunc i64 %call to i32, !dbg !130
  call void @srand(i32 %conv) #7, !dbg !131
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !132
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_good(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !135
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_bad(), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !137
  ret i32 0, !dbg !138
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = alloca i8, i64 400, align 16, !dbg !144
  %1 = bitcast i8* %0 to i32*, !dbg !145
  store i32* %1, i32** %dataBuffer, align 8, !dbg !143
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  store i32* %2, i32** %data, align 8, !dbg !147
  %3 = load i32*, i32** %data, align 8, !dbg !148
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !149
  %4 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  %5 = load i32*, i32** %data, align 8, !dbg !152
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_goodG2BSink(i32* %5), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 90, scope: !15)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !22, file: !16, line: 27, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 27, column: 16, scope: !22)
!31 = !DILocalVariable(name: "dataLen", scope: !22, file: !16, line: 27, type: !28)
!32 = !DILocation(line: 27, column: 19, scope: !22)
!33 = !DILocation(line: 28, column: 26, scope: !22)
!34 = !DILocation(line: 28, column: 19, scope: !22)
!35 = !DILocation(line: 28, column: 17, scope: !22)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !16, line: 30, column: 9)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 30, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !16, line: 30, column: 9)
!41 = !DILocation(line: 30, column: 25, scope: !40)
!42 = !DILocation(line: 30, column: 23, scope: !40)
!43 = !DILocation(line: 30, column: 9, scope: !37)
!44 = !DILocation(line: 32, column: 23, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !16, line: 31, column: 9)
!46 = !DILocation(line: 32, column: 28, scope: !45)
!47 = !DILocation(line: 32, column: 18, scope: !45)
!48 = !DILocation(line: 32, column: 13, scope: !45)
!49 = !DILocation(line: 32, column: 21, scope: !45)
!50 = !DILocation(line: 33, column: 9, scope: !45)
!51 = !DILocation(line: 30, column: 35, scope: !40)
!52 = !DILocation(line: 30, column: 9, scope: !40)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 33, column: 9, scope: !37)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 34, column: 9, scope: !22)
!57 = !DILocation(line: 34, column: 20, scope: !22)
!58 = !DILocation(line: 35, column: 20, scope: !22)
!59 = !DILocation(line: 35, column: 9, scope: !22)
!60 = !DILocation(line: 37, column: 1, scope: !15)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_bad", scope: !16, file: !16, line: 39, type: !62, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{null}
!64 = !DILocalVariable(name: "data", scope: !61, file: !16, line: 41, type: !4)
!65 = !DILocation(line: 41, column: 15, scope: !61)
!66 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !16, line: 42, type: !4)
!67 = !DILocation(line: 42, column: 15, scope: !61)
!68 = !DILocation(line: 42, column: 39, scope: !61)
!69 = !DILocation(line: 42, column: 28, scope: !61)
!70 = !DILocation(line: 43, column: 12, scope: !61)
!71 = !DILocation(line: 43, column: 10, scope: !61)
!72 = !DILocation(line: 45, column: 13, scope: !61)
!73 = !DILocation(line: 45, column: 5, scope: !61)
!74 = !DILocation(line: 46, column: 5, scope: !61)
!75 = !DILocation(line: 46, column: 17, scope: !61)
!76 = !DILocation(line: 47, column: 79, scope: !61)
!77 = !DILocation(line: 47, column: 5, scope: !61)
!78 = !DILocation(line: 48, column: 1, scope: !61)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_goodG2BSink", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !16, line: 54, type: !4)
!81 = !DILocation(line: 54, column: 94, scope: !79)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !16, line: 57, type: !23)
!83 = distinct !DILexicalBlock(scope: !79, file: !16, line: 56, column: 5)
!84 = !DILocation(line: 57, column: 17, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !83, file: !16, line: 58, type: !28)
!86 = !DILocation(line: 58, column: 16, scope: !83)
!87 = !DILocalVariable(name: "dataLen", scope: !83, file: !16, line: 58, type: !28)
!88 = !DILocation(line: 58, column: 19, scope: !83)
!89 = !DILocation(line: 59, column: 26, scope: !83)
!90 = !DILocation(line: 59, column: 19, scope: !83)
!91 = !DILocation(line: 59, column: 17, scope: !83)
!92 = !DILocation(line: 61, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !16, line: 61, column: 9)
!94 = !DILocation(line: 61, column: 14, scope: !93)
!95 = !DILocation(line: 61, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !16, line: 61, column: 9)
!97 = !DILocation(line: 61, column: 25, scope: !96)
!98 = !DILocation(line: 61, column: 23, scope: !96)
!99 = !DILocation(line: 61, column: 9, scope: !93)
!100 = !DILocation(line: 63, column: 23, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !16, line: 62, column: 9)
!102 = !DILocation(line: 63, column: 28, scope: !101)
!103 = !DILocation(line: 63, column: 18, scope: !101)
!104 = !DILocation(line: 63, column: 13, scope: !101)
!105 = !DILocation(line: 63, column: 21, scope: !101)
!106 = !DILocation(line: 64, column: 9, scope: !101)
!107 = !DILocation(line: 61, column: 35, scope: !96)
!108 = !DILocation(line: 61, column: 9, scope: !96)
!109 = distinct !{!109, !99, !110, !55}
!110 = !DILocation(line: 64, column: 9, scope: !93)
!111 = !DILocation(line: 65, column: 9, scope: !83)
!112 = !DILocation(line: 65, column: 20, scope: !83)
!113 = !DILocation(line: 66, column: 20, scope: !83)
!114 = !DILocation(line: 66, column: 9, scope: !83)
!115 = !DILocation(line: 68, column: 1, scope: !79)
!116 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_41_good", scope: !16, file: !16, line: 82, type: !62, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocation(line: 84, column: 5, scope: !116)
!118 = !DILocation(line: 85, column: 1, scope: !116)
!119 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 97, type: !120, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!7, !7, !122}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!125 = !DILocalVariable(name: "argc", arg: 1, scope: !119, file: !16, line: 97, type: !7)
!126 = !DILocation(line: 97, column: 14, scope: !119)
!127 = !DILocalVariable(name: "argv", arg: 2, scope: !119, file: !16, line: 97, type: !122)
!128 = !DILocation(line: 97, column: 27, scope: !119)
!129 = !DILocation(line: 100, column: 22, scope: !119)
!130 = !DILocation(line: 100, column: 12, scope: !119)
!131 = !DILocation(line: 100, column: 5, scope: !119)
!132 = !DILocation(line: 102, column: 5, scope: !119)
!133 = !DILocation(line: 103, column: 5, scope: !119)
!134 = !DILocation(line: 104, column: 5, scope: !119)
!135 = !DILocation(line: 107, column: 5, scope: !119)
!136 = !DILocation(line: 108, column: 5, scope: !119)
!137 = !DILocation(line: 109, column: 5, scope: !119)
!138 = !DILocation(line: 111, column: 5, scope: !119)
!139 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 71, type: !62, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !16, line: 73, type: !4)
!141 = !DILocation(line: 73, column: 15, scope: !139)
!142 = !DILocalVariable(name: "dataBuffer", scope: !139, file: !16, line: 74, type: !4)
!143 = !DILocation(line: 74, column: 15, scope: !139)
!144 = !DILocation(line: 74, column: 39, scope: !139)
!145 = !DILocation(line: 74, column: 28, scope: !139)
!146 = !DILocation(line: 75, column: 12, scope: !139)
!147 = !DILocation(line: 75, column: 10, scope: !139)
!148 = !DILocation(line: 77, column: 13, scope: !139)
!149 = !DILocation(line: 77, column: 5, scope: !139)
!150 = !DILocation(line: 78, column: 5, scope: !139)
!151 = !DILocation(line: 78, column: 16, scope: !139)
!152 = !DILocation(line: 79, column: 83, scope: !139)
!153 = !DILocation(line: 79, column: 5, scope: !139)
!154 = !DILocation(line: 80, column: 1, scope: !139)
