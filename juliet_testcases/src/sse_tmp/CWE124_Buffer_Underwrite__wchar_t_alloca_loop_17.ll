; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i1 = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBuffer, align 8, !dbg !24
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !28
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %4, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data, align 8, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %6, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx3, align 4, !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond4, !dbg !64

for.cond4:                                        ; preds = %for.inc9, %for.end
  %7 = load i64, i64* %i1, align 8, !dbg !65
  %cmp5 = icmp ult i64 %7, 100, !dbg !67
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !68

for.body6:                                        ; preds = %for.cond4
  %8 = load i64, i64* %i1, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !71
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !71
  %10 = load i32*, i32** %data, align 8, !dbg !72
  %11 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx8 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !72
  store i32 %9, i32* %arrayidx8, align 4, !dbg !74
  br label %for.inc9, !dbg !75

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i1, align 8, !dbg !76
  %inc10 = add i64 %12, 1, !dbg !76
  store i64 %inc10, i64* %i1, align 8, !dbg !76
  br label %for.cond4, !dbg !77, !llvm.loop !78

for.end11:                                        ; preds = %for.cond4
  %13 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx12 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !80
  store i32 0, i32* %arrayidx12, align 4, !dbg !81
  %14 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* %14), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #4, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #4, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBuffer, align 8, !dbg !114
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !118
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  store i32 0, i32* %h, align 4, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !124
  %cmp = icmp slt i32 %4, 1, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  store i32* %5, i32** %data, align 8, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !132
  %inc = add nsw i32 %6, 1, !dbg !132
  store i32 %inc, i32* %h, align 4, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !142
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx2, align 4, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond3, !dbg !147

for.cond3:                                        ; preds = %for.inc8, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !148
  %cmp4 = icmp ult i64 %7, 100, !dbg !150
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !151

for.body5:                                        ; preds = %for.cond3
  %8 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !154
  %9 = load i32, i32* %arrayidx6, align 4, !dbg !154
  %10 = load i32*, i32** %data, align 8, !dbg !155
  %11 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !155
  store i32 %9, i32* %arrayidx7, align 4, !dbg !157
  br label %for.inc8, !dbg !158

for.inc8:                                         ; preds = %for.body5
  %12 = load i64, i64* %i, align 8, !dbg !159
  %inc9 = add i64 %12, 1, !dbg !159
  store i64 %inc9, i64* %i, align 8, !dbg !159
  br label %for.cond3, !dbg !160, !llvm.loop !161

for.end10:                                        ; preds = %for.cond3
  %13 = load i32*, i32** %data, align 8, !dbg !163
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !163
  store i32 0, i32* %arrayidx11, align 4, !dbg !164
  %14 = load i32*, i32** %data, align 8, !dbg !165
  call void @printWLine(i32* %14), !dbg !166
  ret void, !dbg !167
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 28, column: 13, scope: !15)
!28 = !DILocation(line: 28, column: 5, scope: !15)
!29 = !DILocation(line: 29, column: 5, scope: !15)
!30 = !DILocation(line: 29, column: 23, scope: !15)
!31 = !DILocation(line: 30, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!33 = !DILocation(line: 30, column: 9, scope: !32)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !16, line: 30, column: 5)
!36 = !DILocation(line: 30, column: 18, scope: !35)
!37 = !DILocation(line: 30, column: 5, scope: !32)
!38 = !DILocation(line: 33, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 31, column: 5)
!40 = !DILocation(line: 33, column: 27, scope: !39)
!41 = !DILocation(line: 33, column: 14, scope: !39)
!42 = !DILocation(line: 34, column: 5, scope: !39)
!43 = !DILocation(line: 30, column: 24, scope: !35)
!44 = !DILocation(line: 30, column: 5, scope: !35)
!45 = distinct !{!45, !37, !46, !47}
!46 = !DILocation(line: 34, column: 5, scope: !32)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "i", scope: !49, file: !16, line: 36, type: !50)
!49 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 36, column: 16, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !49, file: !16, line: 37, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 37, column: 17, scope: !49)
!58 = !DILocation(line: 38, column: 17, scope: !49)
!59 = !DILocation(line: 38, column: 9, scope: !49)
!60 = !DILocation(line: 39, column: 9, scope: !49)
!61 = !DILocation(line: 39, column: 23, scope: !49)
!62 = !DILocation(line: 41, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !49, file: !16, line: 41, column: 9)
!64 = !DILocation(line: 41, column: 14, scope: !63)
!65 = !DILocation(line: 41, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !16, line: 41, column: 9)
!67 = !DILocation(line: 41, column: 23, scope: !66)
!68 = !DILocation(line: 41, column: 9, scope: !63)
!69 = !DILocation(line: 43, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !16, line: 42, column: 9)
!71 = !DILocation(line: 43, column: 23, scope: !70)
!72 = !DILocation(line: 43, column: 13, scope: !70)
!73 = !DILocation(line: 43, column: 18, scope: !70)
!74 = !DILocation(line: 43, column: 21, scope: !70)
!75 = !DILocation(line: 44, column: 9, scope: !70)
!76 = !DILocation(line: 41, column: 31, scope: !66)
!77 = !DILocation(line: 41, column: 9, scope: !66)
!78 = distinct !{!78, !68, !79, !47}
!79 = !DILocation(line: 44, column: 9, scope: !63)
!80 = !DILocation(line: 46, column: 9, scope: !49)
!81 = !DILocation(line: 46, column: 21, scope: !49)
!82 = !DILocation(line: 47, column: 20, scope: !49)
!83 = !DILocation(line: 47, column: 9, scope: !49)
!84 = !DILocation(line: 49, column: 1, scope: !15)
!85 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_17_good", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 86, column: 5, scope: !85)
!87 = !DILocation(line: 87, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !89, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !16, line: 99, type: !7)
!95 = !DILocation(line: 99, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !16, line: 99, type: !91)
!97 = !DILocation(line: 99, column: 27, scope: !88)
!98 = !DILocation(line: 102, column: 22, scope: !88)
!99 = !DILocation(line: 102, column: 12, scope: !88)
!100 = !DILocation(line: 102, column: 5, scope: !88)
!101 = !DILocation(line: 104, column: 5, scope: !88)
!102 = !DILocation(line: 105, column: 5, scope: !88)
!103 = !DILocation(line: 106, column: 5, scope: !88)
!104 = !DILocation(line: 109, column: 5, scope: !88)
!105 = !DILocation(line: 110, column: 5, scope: !88)
!106 = !DILocation(line: 111, column: 5, scope: !88)
!107 = !DILocation(line: 113, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "h", scope: !108, file: !16, line: 58, type: !7)
!110 = !DILocation(line: 58, column: 9, scope: !108)
!111 = !DILocalVariable(name: "data", scope: !108, file: !16, line: 59, type: !4)
!112 = !DILocation(line: 59, column: 15, scope: !108)
!113 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !16, line: 60, type: !4)
!114 = !DILocation(line: 60, column: 15, scope: !108)
!115 = !DILocation(line: 60, column: 39, scope: !108)
!116 = !DILocation(line: 60, column: 28, scope: !108)
!117 = !DILocation(line: 61, column: 13, scope: !108)
!118 = !DILocation(line: 61, column: 5, scope: !108)
!119 = !DILocation(line: 62, column: 5, scope: !108)
!120 = !DILocation(line: 62, column: 23, scope: !108)
!121 = !DILocation(line: 63, column: 11, scope: !122)
!122 = distinct !DILexicalBlock(scope: !108, file: !16, line: 63, column: 5)
!123 = !DILocation(line: 63, column: 9, scope: !122)
!124 = !DILocation(line: 63, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !16, line: 63, column: 5)
!126 = !DILocation(line: 63, column: 18, scope: !125)
!127 = !DILocation(line: 63, column: 5, scope: !122)
!128 = !DILocation(line: 66, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !16, line: 64, column: 5)
!130 = !DILocation(line: 66, column: 14, scope: !129)
!131 = !DILocation(line: 67, column: 5, scope: !129)
!132 = !DILocation(line: 63, column: 24, scope: !125)
!133 = !DILocation(line: 63, column: 5, scope: !125)
!134 = distinct !{!134, !127, !135, !47}
!135 = !DILocation(line: 67, column: 5, scope: !122)
!136 = !DILocalVariable(name: "i", scope: !137, file: !16, line: 69, type: !50)
!137 = distinct !DILexicalBlock(scope: !108, file: !16, line: 68, column: 5)
!138 = !DILocation(line: 69, column: 16, scope: !137)
!139 = !DILocalVariable(name: "source", scope: !137, file: !16, line: 70, type: !54)
!140 = !DILocation(line: 70, column: 17, scope: !137)
!141 = !DILocation(line: 71, column: 17, scope: !137)
!142 = !DILocation(line: 71, column: 9, scope: !137)
!143 = !DILocation(line: 72, column: 9, scope: !137)
!144 = !DILocation(line: 72, column: 23, scope: !137)
!145 = !DILocation(line: 74, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !137, file: !16, line: 74, column: 9)
!147 = !DILocation(line: 74, column: 14, scope: !146)
!148 = !DILocation(line: 74, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !16, line: 74, column: 9)
!150 = !DILocation(line: 74, column: 23, scope: !149)
!151 = !DILocation(line: 74, column: 9, scope: !146)
!152 = !DILocation(line: 76, column: 30, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !16, line: 75, column: 9)
!154 = !DILocation(line: 76, column: 23, scope: !153)
!155 = !DILocation(line: 76, column: 13, scope: !153)
!156 = !DILocation(line: 76, column: 18, scope: !153)
!157 = !DILocation(line: 76, column: 21, scope: !153)
!158 = !DILocation(line: 77, column: 9, scope: !153)
!159 = !DILocation(line: 74, column: 31, scope: !149)
!160 = !DILocation(line: 74, column: 9, scope: !149)
!161 = distinct !{!161, !151, !162, !47}
!162 = !DILocation(line: 77, column: 9, scope: !146)
!163 = !DILocation(line: 79, column: 9, scope: !137)
!164 = !DILocation(line: 79, column: 21, scope: !137)
!165 = !DILocation(line: 80, column: 20, scope: !137)
!166 = !DILocation(line: 80, column: 9, scope: !137)
!167 = !DILocation(line: 82, column: 1, scope: !108)
