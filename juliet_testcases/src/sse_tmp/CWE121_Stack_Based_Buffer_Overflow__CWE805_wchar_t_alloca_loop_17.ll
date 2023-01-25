; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i1 = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 200, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 400, align 16, !dbg !29
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %4, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  store i32* %5, i32** %data, align 8, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %7, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !60
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx2, align 4, !dbg !62
  store i64 0, i64* %i1, align 8, !dbg !63
  br label %for.cond3, !dbg !65

for.cond3:                                        ; preds = %for.inc8, %for.end
  %8 = load i64, i64* %i1, align 8, !dbg !66
  %cmp4 = icmp ult i64 %8, 100, !dbg !68
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !69

for.body5:                                        ; preds = %for.cond3
  %9 = load i64, i64* %i1, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !72
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !72
  %11 = load i32*, i32** %data, align 8, !dbg !73
  %12 = load i64, i64* %i1, align 8, !dbg !74
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !73
  store i32 %10, i32* %arrayidx7, align 4, !dbg !75
  br label %for.inc8, !dbg !76

for.inc8:                                         ; preds = %for.body5
  %13 = load i64, i64* %i1, align 8, !dbg !77
  %inc9 = add i64 %13, 1, !dbg !77
  store i64 %inc9, i64* %i1, align 8, !dbg !77
  br label %for.cond3, !dbg !78, !llvm.loop !79

for.end10:                                        ; preds = %for.cond3
  %14 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx11 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !81
  store i32 0, i32* %arrayidx11, align 4, !dbg !82
  %15 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %15), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17_good() #0 !dbg !86 {
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
  %call = call i64 @time(i64* null) #4, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #4, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 200, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = alloca i8, i64 400, align 16, !dbg !120
  %3 = bitcast i8* %2 to i32*, !dbg !121
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !119
  store i32 0, i32* %h, align 4, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !125
  %cmp = icmp slt i32 %4, 1, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !129
  store i32* %5, i32** %data, align 8, !dbg !131
  %6 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %h, align 4, !dbg !135
  %inc = add nsw i32 %7, 1, !dbg !135
  store i32 %inc, i32* %h, align 4, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !145
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx1, align 4, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond2, !dbg !150

for.cond2:                                        ; preds = %for.inc7, %for.end
  %8 = load i64, i64* %i, align 8, !dbg !151
  %cmp3 = icmp ult i64 %8, 100, !dbg !153
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !154

for.body4:                                        ; preds = %for.cond2
  %9 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !157
  %10 = load i32, i32* %arrayidx5, align 4, !dbg !157
  %11 = load i32*, i32** %data, align 8, !dbg !158
  %12 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx6 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !158
  store i32 %10, i32* %arrayidx6, align 4, !dbg !160
  br label %for.inc7, !dbg !161

for.inc7:                                         ; preds = %for.body4
  %13 = load i64, i64* %i, align 8, !dbg !162
  %inc8 = add i64 %13, 1, !dbg !162
  store i64 %inc8, i64* %i, align 8, !dbg !162
  br label %for.cond2, !dbg !163, !llvm.loop !164

for.end9:                                         ; preds = %for.cond2
  %14 = load i32*, i32** %data, align 8, !dbg !166
  %arrayidx10 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !166
  store i32 0, i32* %arrayidx10, align 4, !dbg !167
  %15 = load i32*, i32** %data, align 8, !dbg !168
  call void @printWLine(i32* %15), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 25, type: !7)
!20 = !DILocation(line: 25, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 27, type: !4)
!24 = !DILocation(line: 27, column: 15, scope: !15)
!25 = !DILocation(line: 27, column: 42, scope: !15)
!26 = !DILocation(line: 27, column: 31, scope: !15)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 28, type: !4)
!28 = !DILocation(line: 28, column: 15, scope: !15)
!29 = !DILocation(line: 28, column: 43, scope: !15)
!30 = !DILocation(line: 28, column: 32, scope: !15)
!31 = !DILocation(line: 29, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!33 = !DILocation(line: 29, column: 9, scope: !32)
!34 = !DILocation(line: 29, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !16, line: 29, column: 5)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 5, scope: !32)
!38 = !DILocation(line: 33, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 30, column: 5)
!40 = !DILocation(line: 33, column: 14, scope: !39)
!41 = !DILocation(line: 34, column: 9, scope: !39)
!42 = !DILocation(line: 34, column: 17, scope: !39)
!43 = !DILocation(line: 35, column: 5, scope: !39)
!44 = !DILocation(line: 29, column: 24, scope: !35)
!45 = !DILocation(line: 29, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 35, column: 5, scope: !32)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "i", scope: !50, file: !16, line: 37, type: !51)
!50 = distinct !DILexicalBlock(scope: !15, file: !16, line: 36, column: 5)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !52)
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 37, column: 16, scope: !50)
!54 = !DILocalVariable(name: "source", scope: !50, file: !16, line: 38, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 38, column: 17, scope: !50)
!59 = !DILocation(line: 39, column: 17, scope: !50)
!60 = !DILocation(line: 39, column: 9, scope: !50)
!61 = !DILocation(line: 40, column: 9, scope: !50)
!62 = !DILocation(line: 40, column: 23, scope: !50)
!63 = !DILocation(line: 42, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !16, line: 42, column: 9)
!65 = !DILocation(line: 42, column: 14, scope: !64)
!66 = !DILocation(line: 42, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !16, line: 42, column: 9)
!68 = !DILocation(line: 42, column: 23, scope: !67)
!69 = !DILocation(line: 42, column: 9, scope: !64)
!70 = !DILocation(line: 44, column: 30, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !16, line: 43, column: 9)
!72 = !DILocation(line: 44, column: 23, scope: !71)
!73 = !DILocation(line: 44, column: 13, scope: !71)
!74 = !DILocation(line: 44, column: 18, scope: !71)
!75 = !DILocation(line: 44, column: 21, scope: !71)
!76 = !DILocation(line: 45, column: 9, scope: !71)
!77 = !DILocation(line: 42, column: 31, scope: !67)
!78 = !DILocation(line: 42, column: 9, scope: !67)
!79 = distinct !{!79, !69, !80, !48}
!80 = !DILocation(line: 45, column: 9, scope: !64)
!81 = !DILocation(line: 46, column: 9, scope: !50)
!82 = !DILocation(line: 46, column: 21, scope: !50)
!83 = !DILocation(line: 47, column: 20, scope: !50)
!84 = !DILocation(line: 47, column: 9, scope: !50)
!85 = !DILocation(line: 49, column: 1, scope: !15)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_17_good", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 85, column: 5, scope: !86)
!88 = !DILocation(line: 86, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 98, type: !90, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!7, !7, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !16, line: 98, type: !7)
!96 = !DILocation(line: 98, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !16, line: 98, type: !92)
!98 = !DILocation(line: 98, column: 27, scope: !89)
!99 = !DILocation(line: 101, column: 22, scope: !89)
!100 = !DILocation(line: 101, column: 12, scope: !89)
!101 = !DILocation(line: 101, column: 5, scope: !89)
!102 = !DILocation(line: 103, column: 5, scope: !89)
!103 = !DILocation(line: 104, column: 5, scope: !89)
!104 = !DILocation(line: 105, column: 5, scope: !89)
!105 = !DILocation(line: 108, column: 5, scope: !89)
!106 = !DILocation(line: 109, column: 5, scope: !89)
!107 = !DILocation(line: 110, column: 5, scope: !89)
!108 = !DILocation(line: 112, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "h", scope: !109, file: !16, line: 58, type: !7)
!111 = !DILocation(line: 58, column: 9, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 59, type: !4)
!113 = !DILocation(line: 59, column: 15, scope: !109)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !16, line: 60, type: !4)
!115 = !DILocation(line: 60, column: 15, scope: !109)
!116 = !DILocation(line: 60, column: 42, scope: !109)
!117 = !DILocation(line: 60, column: 31, scope: !109)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !16, line: 61, type: !4)
!119 = !DILocation(line: 61, column: 15, scope: !109)
!120 = !DILocation(line: 61, column: 43, scope: !109)
!121 = !DILocation(line: 61, column: 32, scope: !109)
!122 = !DILocation(line: 62, column: 11, scope: !123)
!123 = distinct !DILexicalBlock(scope: !109, file: !16, line: 62, column: 5)
!124 = !DILocation(line: 62, column: 9, scope: !123)
!125 = !DILocation(line: 62, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !16, line: 62, column: 5)
!127 = !DILocation(line: 62, column: 18, scope: !126)
!128 = !DILocation(line: 62, column: 5, scope: !123)
!129 = !DILocation(line: 65, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !16, line: 63, column: 5)
!131 = !DILocation(line: 65, column: 14, scope: !130)
!132 = !DILocation(line: 66, column: 9, scope: !130)
!133 = !DILocation(line: 66, column: 17, scope: !130)
!134 = !DILocation(line: 67, column: 5, scope: !130)
!135 = !DILocation(line: 62, column: 24, scope: !126)
!136 = !DILocation(line: 62, column: 5, scope: !126)
!137 = distinct !{!137, !128, !138, !48}
!138 = !DILocation(line: 67, column: 5, scope: !123)
!139 = !DILocalVariable(name: "i", scope: !140, file: !16, line: 69, type: !51)
!140 = distinct !DILexicalBlock(scope: !109, file: !16, line: 68, column: 5)
!141 = !DILocation(line: 69, column: 16, scope: !140)
!142 = !DILocalVariable(name: "source", scope: !140, file: !16, line: 70, type: !55)
!143 = !DILocation(line: 70, column: 17, scope: !140)
!144 = !DILocation(line: 71, column: 17, scope: !140)
!145 = !DILocation(line: 71, column: 9, scope: !140)
!146 = !DILocation(line: 72, column: 9, scope: !140)
!147 = !DILocation(line: 72, column: 23, scope: !140)
!148 = !DILocation(line: 74, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !140, file: !16, line: 74, column: 9)
!150 = !DILocation(line: 74, column: 14, scope: !149)
!151 = !DILocation(line: 74, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !16, line: 74, column: 9)
!153 = !DILocation(line: 74, column: 23, scope: !152)
!154 = !DILocation(line: 74, column: 9, scope: !149)
!155 = !DILocation(line: 76, column: 30, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !16, line: 75, column: 9)
!157 = !DILocation(line: 76, column: 23, scope: !156)
!158 = !DILocation(line: 76, column: 13, scope: !156)
!159 = !DILocation(line: 76, column: 18, scope: !156)
!160 = !DILocation(line: 76, column: 21, scope: !156)
!161 = !DILocation(line: 77, column: 9, scope: !156)
!162 = !DILocation(line: 74, column: 31, scope: !152)
!163 = !DILocation(line: 74, column: 9, scope: !152)
!164 = distinct !{!164, !154, !165, !48}
!165 = !DILocation(line: 77, column: 9, scope: !149)
!166 = !DILocation(line: 78, column: 9, scope: !140)
!167 = !DILocation(line: 78, column: 21, scope: !140)
!168 = !DILocation(line: 79, column: 20, scope: !140)
!169 = !DILocation(line: 79, column: 9, scope: !140)
!170 = !DILocation(line: 81, column: 1, scope: !109)
