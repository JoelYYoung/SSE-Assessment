; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i1 = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay, i32** %data, align 8, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %2, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx3, align 4, !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond4, !dbg !64

for.cond4:                                        ; preds = %for.inc9, %for.end
  %3 = load i64, i64* %i1, align 8, !dbg !65
  %cmp5 = icmp ult i64 %3, 100, !dbg !67
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !68

for.body6:                                        ; preds = %for.cond4
  %4 = load i64, i64* %i1, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !71
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !71
  %6 = load i32*, i32** %data, align 8, !dbg !72
  %7 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !72
  store i32 %5, i32* %arrayidx8, align 4, !dbg !74
  br label %for.inc9, !dbg !75

for.inc9:                                         ; preds = %for.body6
  %8 = load i64, i64* %i1, align 8, !dbg !76
  %inc10 = add i64 %8, 1, !dbg !76
  store i64 %inc10, i64* %i1, align 8, !dbg !76
  br label %for.cond4, !dbg !77, !llvm.loop !78

for.end11:                                        ; preds = %for.cond4
  %9 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx12 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !80
  store i32 0, i32* %arrayidx12, align 4, !dbg !81
  %10 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* %10), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17_good() #0 !dbg !85 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17_bad(), !dbg !105
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 0, i32* %h, align 4, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !120
  %cmp = icmp slt i32 %0, 1, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  store i32* %arraydecay, i32** %data, align 8, !dbg !126
  %1 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !130
  %inc = add nsw i32 %2, 1, !dbg !130
  store i32 %inc, i32* %h, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !140
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx2, align 4, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond3, !dbg !145

for.cond3:                                        ; preds = %for.inc8, %for.end
  %3 = load i64, i64* %i, align 8, !dbg !146
  %cmp4 = icmp ult i64 %3, 100, !dbg !148
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !149

for.body5:                                        ; preds = %for.cond3
  %4 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !152
  %5 = load i32, i32* %arrayidx6, align 4, !dbg !152
  %6 = load i32*, i32** %data, align 8, !dbg !153
  %7 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !153
  store i32 %5, i32* %arrayidx7, align 4, !dbg !155
  br label %for.inc8, !dbg !156

for.inc8:                                         ; preds = %for.body5
  %8 = load i64, i64* %i, align 8, !dbg !157
  %inc9 = add i64 %8, 1, !dbg !157
  store i64 %inc9, i64* %i, align 8, !dbg !157
  br label %for.cond3, !dbg !158, !llvm.loop !159

for.end10:                                        ; preds = %for.cond3
  %9 = load i32*, i32** %data, align 8, !dbg !161
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !161
  store i32 0, i32* %arrayidx11, align 4, !dbg !162
  %10 = load i32*, i32** %data, align 8, !dbg !163
  call void @printWLine(i32* %10), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !16)
!21 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 27, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 28, column: 13, scope: !11)
!33 = !DILocation(line: 29, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 29, column: 9, scope: !34)
!36 = !DILocation(line: 29, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 29, column: 5)
!38 = !DILocation(line: 29, column: 18, scope: !37)
!39 = !DILocation(line: 29, column: 5, scope: !34)
!40 = !DILocation(line: 33, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 30, column: 5)
!42 = !DILocation(line: 33, column: 14, scope: !41)
!43 = !DILocation(line: 34, column: 9, scope: !41)
!44 = !DILocation(line: 34, column: 17, scope: !41)
!45 = !DILocation(line: 35, column: 5, scope: !41)
!46 = !DILocation(line: 29, column: 24, scope: !37)
!47 = !DILocation(line: 29, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 35, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 37, type: !53)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !21, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 37, column: 16, scope: !52)
!56 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 38, type: !29)
!57 = !DILocation(line: 38, column: 17, scope: !52)
!58 = !DILocation(line: 39, column: 17, scope: !52)
!59 = !DILocation(line: 39, column: 9, scope: !52)
!60 = !DILocation(line: 40, column: 9, scope: !52)
!61 = !DILocation(line: 40, column: 23, scope: !52)
!62 = !DILocation(line: 42, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !52, file: !12, line: 42, column: 9)
!64 = !DILocation(line: 42, column: 14, scope: !63)
!65 = !DILocation(line: 42, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 42, column: 9)
!67 = !DILocation(line: 42, column: 23, scope: !66)
!68 = !DILocation(line: 42, column: 9, scope: !63)
!69 = !DILocation(line: 44, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 43, column: 9)
!71 = !DILocation(line: 44, column: 23, scope: !70)
!72 = !DILocation(line: 44, column: 13, scope: !70)
!73 = !DILocation(line: 44, column: 18, scope: !70)
!74 = !DILocation(line: 44, column: 21, scope: !70)
!75 = !DILocation(line: 45, column: 9, scope: !70)
!76 = !DILocation(line: 42, column: 31, scope: !66)
!77 = !DILocation(line: 42, column: 9, scope: !66)
!78 = distinct !{!78, !68, !79, !50}
!79 = !DILocation(line: 45, column: 9, scope: !63)
!80 = !DILocation(line: 46, column: 9, scope: !52)
!81 = !DILocation(line: 46, column: 21, scope: !52)
!82 = !DILocation(line: 47, column: 20, scope: !52)
!83 = !DILocation(line: 47, column: 9, scope: !52)
!84 = !DILocation(line: 49, column: 1, scope: !11)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_17_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 85, column: 5, scope: !85)
!87 = !DILocation(line: 86, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !89, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!16, !16, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !12, line: 98, type: !16)
!95 = !DILocation(line: 98, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !12, line: 98, type: !91)
!97 = !DILocation(line: 98, column: 27, scope: !88)
!98 = !DILocation(line: 101, column: 22, scope: !88)
!99 = !DILocation(line: 101, column: 12, scope: !88)
!100 = !DILocation(line: 101, column: 5, scope: !88)
!101 = !DILocation(line: 103, column: 5, scope: !88)
!102 = !DILocation(line: 104, column: 5, scope: !88)
!103 = !DILocation(line: 105, column: 5, scope: !88)
!104 = !DILocation(line: 108, column: 5, scope: !88)
!105 = !DILocation(line: 109, column: 5, scope: !88)
!106 = !DILocation(line: 110, column: 5, scope: !88)
!107 = !DILocation(line: 112, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "h", scope: !108, file: !12, line: 58, type: !16)
!110 = !DILocation(line: 58, column: 9, scope: !108)
!111 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 59, type: !19)
!112 = !DILocation(line: 59, column: 15, scope: !108)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !12, line: 60, type: !24)
!114 = !DILocation(line: 60, column: 13, scope: !108)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !12, line: 61, type: !29)
!116 = !DILocation(line: 61, column: 13, scope: !108)
!117 = !DILocation(line: 62, column: 11, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !12, line: 62, column: 5)
!119 = !DILocation(line: 62, column: 9, scope: !118)
!120 = !DILocation(line: 62, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 62, column: 5)
!122 = !DILocation(line: 62, column: 18, scope: !121)
!123 = !DILocation(line: 62, column: 5, scope: !118)
!124 = !DILocation(line: 65, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 63, column: 5)
!126 = !DILocation(line: 65, column: 14, scope: !125)
!127 = !DILocation(line: 66, column: 9, scope: !125)
!128 = !DILocation(line: 66, column: 17, scope: !125)
!129 = !DILocation(line: 67, column: 5, scope: !125)
!130 = !DILocation(line: 62, column: 24, scope: !121)
!131 = !DILocation(line: 62, column: 5, scope: !121)
!132 = distinct !{!132, !123, !133, !50}
!133 = !DILocation(line: 67, column: 5, scope: !118)
!134 = !DILocalVariable(name: "i", scope: !135, file: !12, line: 69, type: !53)
!135 = distinct !DILexicalBlock(scope: !108, file: !12, line: 68, column: 5)
!136 = !DILocation(line: 69, column: 16, scope: !135)
!137 = !DILocalVariable(name: "source", scope: !135, file: !12, line: 70, type: !29)
!138 = !DILocation(line: 70, column: 17, scope: !135)
!139 = !DILocation(line: 71, column: 17, scope: !135)
!140 = !DILocation(line: 71, column: 9, scope: !135)
!141 = !DILocation(line: 72, column: 9, scope: !135)
!142 = !DILocation(line: 72, column: 23, scope: !135)
!143 = !DILocation(line: 74, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !135, file: !12, line: 74, column: 9)
!145 = !DILocation(line: 74, column: 14, scope: !144)
!146 = !DILocation(line: 74, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 74, column: 9)
!148 = !DILocation(line: 74, column: 23, scope: !147)
!149 = !DILocation(line: 74, column: 9, scope: !144)
!150 = !DILocation(line: 76, column: 30, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !12, line: 75, column: 9)
!152 = !DILocation(line: 76, column: 23, scope: !151)
!153 = !DILocation(line: 76, column: 13, scope: !151)
!154 = !DILocation(line: 76, column: 18, scope: !151)
!155 = !DILocation(line: 76, column: 21, scope: !151)
!156 = !DILocation(line: 77, column: 9, scope: !151)
!157 = !DILocation(line: 74, column: 31, scope: !147)
!158 = !DILocation(line: 74, column: 9, scope: !147)
!159 = distinct !{!159, !149, !160, !50}
!160 = !DILocation(line: 77, column: 9, scope: !144)
!161 = !DILocation(line: 78, column: 9, scope: !135)
!162 = !DILocation(line: 78, column: 21, scope: !135)
!163 = !DILocation(line: 79, column: 20, scope: !135)
!164 = !DILocation(line: 79, column: 9, scope: !135)
!165 = !DILocation(line: 81, column: 1, scope: !108)
