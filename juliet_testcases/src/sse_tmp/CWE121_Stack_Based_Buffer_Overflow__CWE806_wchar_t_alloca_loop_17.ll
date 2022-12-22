; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i1 = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBuffer, align 8, !dbg !24
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  store i32* %2, i32** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %3, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %6, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !57, metadata !DIExpression()), !dbg !58
  %8 = load i32*, i32** %data, align 8, !dbg !59
  %call2 = call i64 @wcslen(i32* %8) #7, !dbg !60
  store i64 %call2, i64* %dataLen, align 8, !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond3, !dbg !64

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i1, align 8, !dbg !65
  %10 = load i64, i64* %dataLen, align 8, !dbg !67
  %cmp4 = icmp ult i64 %9, %10, !dbg !68
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !69

for.body5:                                        ; preds = %for.cond3
  %11 = load i32*, i32** %data, align 8, !dbg !70
  %12 = load i64, i64* %i1, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !70
  %13 = load i32, i32* %arrayidx6, align 4, !dbg !70
  %14 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %14, !dbg !74
  store i32 %13, i32* %arrayidx7, align 4, !dbg !75
  br label %for.inc8, !dbg !76

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i1, align 8, !dbg !77
  %inc9 = add i64 %15, 1, !dbg !77
  store i64 %inc9, i64* %i1, align 8, !dbg !77
  br label %for.cond3, !dbg !78, !llvm.loop !79

for.end10:                                        ; preds = %for.cond3
  %arrayidx11 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !81
  store i32 0, i32* %arrayidx11, align 4, !dbg !82
  %16 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %16), !dbg !84
  ret void, !dbg !85
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #6, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #6, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 400, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBuffer, align 8, !dbg !115
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %2, i32** %data, align 8, !dbg !119
  store i32 0, i32* %h, align 4, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %h, align 4, !dbg !123
  %cmp = icmp slt i32 %3, 1, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !127
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !129
  %5 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !133
  %inc = add nsw i32 %6, 1, !dbg !133
  store i32 %inc, i32* %h, align 4, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !142, metadata !DIExpression()), !dbg !143
  %8 = load i32*, i32** %data, align 8, !dbg !144
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !145
  store i64 %call1, i64* %dataLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond2, !dbg !149

for.cond2:                                        ; preds = %for.inc7, %for.end
  %9 = load i64, i64* %i, align 8, !dbg !150
  %10 = load i64, i64* %dataLen, align 8, !dbg !152
  %cmp3 = icmp ult i64 %9, %10, !dbg !153
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !154

for.body4:                                        ; preds = %for.cond2
  %11 = load i32*, i32** %data, align 8, !dbg !155
  %12 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !155
  %13 = load i32, i32* %arrayidx5, align 4, !dbg !155
  %14 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %14, !dbg !159
  store i32 %13, i32* %arrayidx6, align 4, !dbg !160
  br label %for.inc7, !dbg !161

for.inc7:                                         ; preds = %for.body4
  %15 = load i64, i64* %i, align 8, !dbg !162
  %inc8 = add i64 %15, 1, !dbg !162
  store i64 %inc8, i64* %i, align 8, !dbg !162
  br label %for.cond2, !dbg !163, !llvm.loop !164

for.end9:                                         ; preds = %for.cond2
  %arrayidx10 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !166
  store i32 0, i32* %arrayidx10, align 4, !dbg !167
  %16 = load i32*, i32** %data, align 8, !dbg !168
  call void @printWLine(i32* %16), !dbg !169
  ret void, !dbg !170
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 25, type: !7)
!20 = !DILocation(line: 25, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 27, type: !4)
!24 = !DILocation(line: 27, column: 15, scope: !15)
!25 = !DILocation(line: 27, column: 39, scope: !15)
!26 = !DILocation(line: 27, column: 28, scope: !15)
!27 = !DILocation(line: 28, column: 12, scope: !15)
!28 = !DILocation(line: 28, column: 10, scope: !15)
!29 = !DILocation(line: 29, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!31 = !DILocation(line: 29, column: 9, scope: !30)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 5, scope: !30)
!36 = !DILocation(line: 32, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !16, line: 30, column: 5)
!38 = !DILocation(line: 32, column: 9, scope: !37)
!39 = !DILocation(line: 33, column: 9, scope: !37)
!40 = !DILocation(line: 33, column: 21, scope: !37)
!41 = !DILocation(line: 34, column: 5, scope: !37)
!42 = !DILocation(line: 29, column: 24, scope: !33)
!43 = !DILocation(line: 29, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !16, line: 36, type: !49)
!48 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 36, column: 17, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !16, line: 37, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 37, column: 16, scope: !48)
!57 = !DILocalVariable(name: "dataLen", scope: !48, file: !16, line: 37, type: !54)
!58 = !DILocation(line: 37, column: 19, scope: !48)
!59 = !DILocation(line: 38, column: 26, scope: !48)
!60 = !DILocation(line: 38, column: 19, scope: !48)
!61 = !DILocation(line: 38, column: 17, scope: !48)
!62 = !DILocation(line: 40, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !48, file: !16, line: 40, column: 9)
!64 = !DILocation(line: 40, column: 14, scope: !63)
!65 = !DILocation(line: 40, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !16, line: 40, column: 9)
!67 = !DILocation(line: 40, column: 25, scope: !66)
!68 = !DILocation(line: 40, column: 23, scope: !66)
!69 = !DILocation(line: 40, column: 9, scope: !63)
!70 = !DILocation(line: 42, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !16, line: 41, column: 9)
!72 = !DILocation(line: 42, column: 28, scope: !71)
!73 = !DILocation(line: 42, column: 18, scope: !71)
!74 = !DILocation(line: 42, column: 13, scope: !71)
!75 = !DILocation(line: 42, column: 21, scope: !71)
!76 = !DILocation(line: 43, column: 9, scope: !71)
!77 = !DILocation(line: 40, column: 35, scope: !66)
!78 = !DILocation(line: 40, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !46}
!80 = !DILocation(line: 43, column: 9, scope: !63)
!81 = !DILocation(line: 44, column: 9, scope: !48)
!82 = !DILocation(line: 44, column: 20, scope: !48)
!83 = !DILocation(line: 45, column: 20, scope: !48)
!84 = !DILocation(line: 45, column: 9, scope: !48)
!85 = !DILocation(line: 47, column: 1, scope: !15)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_17_good", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 82, column: 5, scope: !86)
!88 = !DILocation(line: 83, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 95, type: !90, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!7, !7, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !16, line: 95, type: !7)
!96 = !DILocation(line: 95, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !16, line: 95, type: !92)
!98 = !DILocation(line: 95, column: 27, scope: !89)
!99 = !DILocation(line: 98, column: 22, scope: !89)
!100 = !DILocation(line: 98, column: 12, scope: !89)
!101 = !DILocation(line: 98, column: 5, scope: !89)
!102 = !DILocation(line: 100, column: 5, scope: !89)
!103 = !DILocation(line: 101, column: 5, scope: !89)
!104 = !DILocation(line: 102, column: 5, scope: !89)
!105 = !DILocation(line: 105, column: 5, scope: !89)
!106 = !DILocation(line: 106, column: 5, scope: !89)
!107 = !DILocation(line: 107, column: 5, scope: !89)
!108 = !DILocation(line: 109, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "h", scope: !109, file: !16, line: 56, type: !7)
!111 = !DILocation(line: 56, column: 9, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 57, type: !4)
!113 = !DILocation(line: 57, column: 15, scope: !109)
!114 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !16, line: 58, type: !4)
!115 = !DILocation(line: 58, column: 15, scope: !109)
!116 = !DILocation(line: 58, column: 39, scope: !109)
!117 = !DILocation(line: 58, column: 28, scope: !109)
!118 = !DILocation(line: 59, column: 12, scope: !109)
!119 = !DILocation(line: 59, column: 10, scope: !109)
!120 = !DILocation(line: 60, column: 11, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !16, line: 60, column: 5)
!122 = !DILocation(line: 60, column: 9, scope: !121)
!123 = !DILocation(line: 60, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !16, line: 60, column: 5)
!125 = !DILocation(line: 60, column: 18, scope: !124)
!126 = !DILocation(line: 60, column: 5, scope: !121)
!127 = !DILocation(line: 63, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !16, line: 61, column: 5)
!129 = !DILocation(line: 63, column: 9, scope: !128)
!130 = !DILocation(line: 64, column: 9, scope: !128)
!131 = !DILocation(line: 64, column: 20, scope: !128)
!132 = !DILocation(line: 65, column: 5, scope: !128)
!133 = !DILocation(line: 60, column: 24, scope: !124)
!134 = !DILocation(line: 60, column: 5, scope: !124)
!135 = distinct !{!135, !126, !136, !46}
!136 = !DILocation(line: 65, column: 5, scope: !121)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !16, line: 67, type: !49)
!138 = distinct !DILexicalBlock(scope: !109, file: !16, line: 66, column: 5)
!139 = !DILocation(line: 67, column: 17, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !138, file: !16, line: 68, type: !54)
!141 = !DILocation(line: 68, column: 16, scope: !138)
!142 = !DILocalVariable(name: "dataLen", scope: !138, file: !16, line: 68, type: !54)
!143 = !DILocation(line: 68, column: 19, scope: !138)
!144 = !DILocation(line: 69, column: 26, scope: !138)
!145 = !DILocation(line: 69, column: 19, scope: !138)
!146 = !DILocation(line: 69, column: 17, scope: !138)
!147 = !DILocation(line: 71, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !138, file: !16, line: 71, column: 9)
!149 = !DILocation(line: 71, column: 14, scope: !148)
!150 = !DILocation(line: 71, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !16, line: 71, column: 9)
!152 = !DILocation(line: 71, column: 25, scope: !151)
!153 = !DILocation(line: 71, column: 23, scope: !151)
!154 = !DILocation(line: 71, column: 9, scope: !148)
!155 = !DILocation(line: 73, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !16, line: 72, column: 9)
!157 = !DILocation(line: 73, column: 28, scope: !156)
!158 = !DILocation(line: 73, column: 18, scope: !156)
!159 = !DILocation(line: 73, column: 13, scope: !156)
!160 = !DILocation(line: 73, column: 21, scope: !156)
!161 = !DILocation(line: 74, column: 9, scope: !156)
!162 = !DILocation(line: 71, column: 35, scope: !151)
!163 = !DILocation(line: 71, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !46}
!165 = !DILocation(line: 74, column: 9, scope: !148)
!166 = !DILocation(line: 75, column: 9, scope: !138)
!167 = !DILocation(line: 75, column: 20, scope: !138)
!168 = !DILocation(line: 76, column: 20, scope: !138)
!169 = !DILocation(line: 76, column: 9, scope: !138)
!170 = !DILocation(line: 78, column: 1, scope: !109)
