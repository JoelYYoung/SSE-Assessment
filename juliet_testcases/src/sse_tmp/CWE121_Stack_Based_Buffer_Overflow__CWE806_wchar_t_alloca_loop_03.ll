; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !30
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !46
  store i64 %call1, i64* %dataLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !51
  %8 = load i64, i64* %dataLen, align 8, !dbg !53
  %cmp = icmp ult i64 %7, %8, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !56
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !56
  %12 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !60
  store i32 %11, i32* %arrayidx3, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %13, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !68
  store i32 0, i32* %arrayidx4, align 4, !dbg !69
  %14 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %14), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #6, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #6, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 400, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBuffer, align 8, !dbg !101
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %2, i32** %data, align 8, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !109
  %4 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !117, metadata !DIExpression()), !dbg !118
  %6 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !120
  store i64 %call1, i64* %dataLen, align 8, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !125
  %8 = load i64, i64* %dataLen, align 8, !dbg !127
  %cmp = icmp ult i64 %7, %8, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !130
  %10 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !130
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !130
  %12 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !134
  store i32 %11, i32* %arrayidx3, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %13, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %14 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %14), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = alloca i8, i64 400, align 16, !dbg !151
  %1 = bitcast i8* %0 to i32*, !dbg !152
  store i32* %1, i32** %dataBuffer, align 8, !dbg !150
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !153
  store i32* %2, i32** %data, align 8, !dbg !154
  %3 = load i32*, i32** %data, align 8, !dbg !155
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !158
  %4 = load i32*, i32** %data, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !161, metadata !DIExpression()), !dbg !163
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !166, metadata !DIExpression()), !dbg !167
  %6 = load i32*, i32** %data, align 8, !dbg !168
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !169
  store i64 %call1, i64* %dataLen, align 8, !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !174
  %8 = load i64, i64* %dataLen, align 8, !dbg !176
  %cmp = icmp ult i64 %7, %8, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !179
  %10 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !179
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !179
  %12 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !183
  store i32 %11, i32* %arrayidx3, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %13, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !190
  store i32 0, i32* %arrayidx4, align 4, !dbg !191
  %14 = load i32*, i32** %data, align 8, !dbg !192
  call void @printWLine(i32* %14), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 31, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !16, line: 29, column: 5)
!29 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!30 = !DILocation(line: 31, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 9, scope: !28)
!32 = !DILocation(line: 32, column: 21, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !16, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 17, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !16, line: 36, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 36, column: 16, scope: !34)
!43 = !DILocalVariable(name: "dataLen", scope: !34, file: !16, line: 36, type: !40)
!44 = !DILocation(line: 36, column: 19, scope: !34)
!45 = !DILocation(line: 37, column: 26, scope: !34)
!46 = !DILocation(line: 37, column: 19, scope: !34)
!47 = !DILocation(line: 37, column: 17, scope: !34)
!48 = !DILocation(line: 39, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !34, file: !16, line: 39, column: 9)
!50 = !DILocation(line: 39, column: 14, scope: !49)
!51 = !DILocation(line: 39, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !16, line: 39, column: 9)
!53 = !DILocation(line: 39, column: 25, scope: !52)
!54 = !DILocation(line: 39, column: 23, scope: !52)
!55 = !DILocation(line: 39, column: 9, scope: !49)
!56 = !DILocation(line: 41, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !16, line: 40, column: 9)
!58 = !DILocation(line: 41, column: 28, scope: !57)
!59 = !DILocation(line: 41, column: 18, scope: !57)
!60 = !DILocation(line: 41, column: 13, scope: !57)
!61 = !DILocation(line: 41, column: 21, scope: !57)
!62 = !DILocation(line: 42, column: 9, scope: !57)
!63 = !DILocation(line: 39, column: 35, scope: !52)
!64 = !DILocation(line: 39, column: 9, scope: !52)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 42, column: 9, scope: !49)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 43, column: 9, scope: !34)
!69 = !DILocation(line: 43, column: 20, scope: !34)
!70 = !DILocation(line: 44, column: 20, scope: !34)
!71 = !DILocation(line: 44, column: 9, scope: !34)
!72 = !DILocation(line: 46, column: 1, scope: !15)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_03_good", scope: !16, file: !16, line: 109, type: !17, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 111, column: 5, scope: !73)
!75 = !DILocation(line: 112, column: 5, scope: !73)
!76 = !DILocation(line: 113, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 125, type: !78, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !16, line: 125, type: !7)
!84 = !DILocation(line: 125, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !16, line: 125, type: !80)
!86 = !DILocation(line: 125, column: 27, scope: !77)
!87 = !DILocation(line: 128, column: 22, scope: !77)
!88 = !DILocation(line: 128, column: 12, scope: !77)
!89 = !DILocation(line: 128, column: 5, scope: !77)
!90 = !DILocation(line: 130, column: 5, scope: !77)
!91 = !DILocation(line: 131, column: 5, scope: !77)
!92 = !DILocation(line: 132, column: 5, scope: !77)
!93 = !DILocation(line: 135, column: 5, scope: !77)
!94 = !DILocation(line: 136, column: 5, scope: !77)
!95 = !DILocation(line: 137, column: 5, scope: !77)
!96 = !DILocation(line: 139, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 55, type: !4)
!99 = !DILocation(line: 55, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !16, line: 56, type: !4)
!101 = !DILocation(line: 56, column: 15, scope: !97)
!102 = !DILocation(line: 56, column: 39, scope: !97)
!103 = !DILocation(line: 56, column: 28, scope: !97)
!104 = !DILocation(line: 57, column: 12, scope: !97)
!105 = !DILocation(line: 57, column: 10, scope: !97)
!106 = !DILocation(line: 66, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !16, line: 64, column: 5)
!108 = distinct !DILexicalBlock(scope: !97, file: !16, line: 58, column: 8)
!109 = !DILocation(line: 66, column: 9, scope: !107)
!110 = !DILocation(line: 67, column: 9, scope: !107)
!111 = !DILocation(line: 67, column: 20, scope: !107)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !16, line: 70, type: !35)
!113 = distinct !DILexicalBlock(scope: !97, file: !16, line: 69, column: 5)
!114 = !DILocation(line: 70, column: 17, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !113, file: !16, line: 71, type: !40)
!116 = !DILocation(line: 71, column: 16, scope: !113)
!117 = !DILocalVariable(name: "dataLen", scope: !113, file: !16, line: 71, type: !40)
!118 = !DILocation(line: 71, column: 19, scope: !113)
!119 = !DILocation(line: 72, column: 26, scope: !113)
!120 = !DILocation(line: 72, column: 19, scope: !113)
!121 = !DILocation(line: 72, column: 17, scope: !113)
!122 = !DILocation(line: 74, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !16, line: 74, column: 9)
!124 = !DILocation(line: 74, column: 14, scope: !123)
!125 = !DILocation(line: 74, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !16, line: 74, column: 9)
!127 = !DILocation(line: 74, column: 25, scope: !126)
!128 = !DILocation(line: 74, column: 23, scope: !126)
!129 = !DILocation(line: 74, column: 9, scope: !123)
!130 = !DILocation(line: 76, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !16, line: 75, column: 9)
!132 = !DILocation(line: 76, column: 28, scope: !131)
!133 = !DILocation(line: 76, column: 18, scope: !131)
!134 = !DILocation(line: 76, column: 13, scope: !131)
!135 = !DILocation(line: 76, column: 21, scope: !131)
!136 = !DILocation(line: 77, column: 9, scope: !131)
!137 = !DILocation(line: 74, column: 35, scope: !126)
!138 = !DILocation(line: 74, column: 9, scope: !126)
!139 = distinct !{!139, !129, !140, !67}
!140 = !DILocation(line: 77, column: 9, scope: !123)
!141 = !DILocation(line: 78, column: 9, scope: !113)
!142 = !DILocation(line: 78, column: 20, scope: !113)
!143 = !DILocation(line: 79, column: 20, scope: !113)
!144 = !DILocation(line: 79, column: 9, scope: !113)
!145 = !DILocation(line: 81, column: 1, scope: !97)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !16, line: 86, type: !4)
!148 = !DILocation(line: 86, column: 15, scope: !146)
!149 = !DILocalVariable(name: "dataBuffer", scope: !146, file: !16, line: 87, type: !4)
!150 = !DILocation(line: 87, column: 15, scope: !146)
!151 = !DILocation(line: 87, column: 39, scope: !146)
!152 = !DILocation(line: 87, column: 28, scope: !146)
!153 = !DILocation(line: 88, column: 12, scope: !146)
!154 = !DILocation(line: 88, column: 10, scope: !146)
!155 = !DILocation(line: 92, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !157, file: !16, line: 90, column: 5)
!157 = distinct !DILexicalBlock(scope: !146, file: !16, line: 89, column: 8)
!158 = !DILocation(line: 92, column: 9, scope: !156)
!159 = !DILocation(line: 93, column: 9, scope: !156)
!160 = !DILocation(line: 93, column: 20, scope: !156)
!161 = !DILocalVariable(name: "dest", scope: !162, file: !16, line: 96, type: !35)
!162 = distinct !DILexicalBlock(scope: !146, file: !16, line: 95, column: 5)
!163 = !DILocation(line: 96, column: 17, scope: !162)
!164 = !DILocalVariable(name: "i", scope: !162, file: !16, line: 97, type: !40)
!165 = !DILocation(line: 97, column: 16, scope: !162)
!166 = !DILocalVariable(name: "dataLen", scope: !162, file: !16, line: 97, type: !40)
!167 = !DILocation(line: 97, column: 19, scope: !162)
!168 = !DILocation(line: 98, column: 26, scope: !162)
!169 = !DILocation(line: 98, column: 19, scope: !162)
!170 = !DILocation(line: 98, column: 17, scope: !162)
!171 = !DILocation(line: 100, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !162, file: !16, line: 100, column: 9)
!173 = !DILocation(line: 100, column: 14, scope: !172)
!174 = !DILocation(line: 100, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !16, line: 100, column: 9)
!176 = !DILocation(line: 100, column: 25, scope: !175)
!177 = !DILocation(line: 100, column: 23, scope: !175)
!178 = !DILocation(line: 100, column: 9, scope: !172)
!179 = !DILocation(line: 102, column: 23, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !16, line: 101, column: 9)
!181 = !DILocation(line: 102, column: 28, scope: !180)
!182 = !DILocation(line: 102, column: 18, scope: !180)
!183 = !DILocation(line: 102, column: 13, scope: !180)
!184 = !DILocation(line: 102, column: 21, scope: !180)
!185 = !DILocation(line: 103, column: 9, scope: !180)
!186 = !DILocation(line: 100, column: 35, scope: !175)
!187 = !DILocation(line: 100, column: 9, scope: !175)
!188 = distinct !{!188, !178, !189, !67}
!189 = !DILocation(line: 103, column: 9, scope: !172)
!190 = !DILocation(line: 104, column: 9, scope: !162)
!191 = !DILocation(line: 104, column: 20, scope: !162)
!192 = !DILocation(line: 105, column: 20, scope: !162)
!193 = !DILocation(line: 105, column: 9, scope: !162)
!194 = !DILocation(line: 107, column: 1, scope: !146)
