; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i1 = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 50, align 16, !dbg !24
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %2, 1, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %3, i8** %data, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %5, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx2, align 1, !dbg !59
  store i64 0, i64* %i1, align 8, !dbg !60
  br label %for.cond3, !dbg !62

for.cond3:                                        ; preds = %for.inc8, %for.end
  %6 = load i64, i64* %i1, align 8, !dbg !63
  %cmp4 = icmp ult i64 %6, 100, !dbg !65
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !66

for.body5:                                        ; preds = %for.cond3
  %7 = load i64, i64* %i1, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !69
  %8 = load i8, i8* %arrayidx6, align 1, !dbg !69
  %9 = load i8*, i8** %data, align 8, !dbg !70
  %10 = load i64, i64* %i1, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !70
  store i8 %8, i8* %arrayidx7, align 1, !dbg !72
  br label %for.inc8, !dbg !73

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i1, align 8, !dbg !74
  %inc9 = add i64 %11, 1, !dbg !74
  store i64 %inc9, i64* %i1, align 8, !dbg !74
  br label %for.cond3, !dbg !75, !llvm.loop !76

for.end10:                                        ; preds = %for.cond3
  %12 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx11 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !78
  store i8 0, i8* %arrayidx11, align 1, !dbg !79
  %13 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* %13), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 50, align 16, !dbg !111
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %1 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !113
  store i32 0, i32* %h, align 4, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !118
  %cmp = icmp slt i32 %2, 1, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  store i8* %3, i8** %data, align 8, !dbg !124
  %4 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !128
  %inc = add nsw i32 %5, 1, !dbg !128
  store i32 %inc, i32* %h, align 4, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !137
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx1, align 1, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond2, !dbg !142

for.cond2:                                        ; preds = %for.inc7, %for.end
  %6 = load i64, i64* %i, align 8, !dbg !143
  %cmp3 = icmp ult i64 %6, 100, !dbg !145
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !146

for.body4:                                        ; preds = %for.cond2
  %7 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !149
  %8 = load i8, i8* %arrayidx5, align 1, !dbg !149
  %9 = load i8*, i8** %data, align 8, !dbg !150
  %10 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !150
  store i8 %8, i8* %arrayidx6, align 1, !dbg !152
  br label %for.inc7, !dbg !153

for.inc7:                                         ; preds = %for.body4
  %11 = load i64, i64* %i, align 8, !dbg !154
  %inc8 = add i64 %11, 1, !dbg !154
  store i64 %inc8, i64* %i, align 8, !dbg !154
  br label %for.cond2, !dbg !155, !llvm.loop !156

for.end9:                                         ; preds = %for.cond2
  %12 = load i8*, i8** %data, align 8, !dbg !158
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !158
  store i8 0, i8* %arrayidx10, align 1, !dbg !159
  %13 = load i8*, i8** %data, align 8, !dbg !160
  call void @printLine(i8* %13), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 25, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 25, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 36, scope: !13)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 28, type: !4)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 37, scope: !13)
!28 = !DILocation(line: 29, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 29, column: 9, scope: !29)
!31 = !DILocation(line: 29, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !14, line: 29, column: 5)
!33 = !DILocation(line: 29, column: 18, scope: !32)
!34 = !DILocation(line: 29, column: 5, scope: !29)
!35 = !DILocation(line: 33, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !14, line: 30, column: 5)
!37 = !DILocation(line: 33, column: 14, scope: !36)
!38 = !DILocation(line: 34, column: 9, scope: !36)
!39 = !DILocation(line: 34, column: 17, scope: !36)
!40 = !DILocation(line: 35, column: 5, scope: !36)
!41 = !DILocation(line: 29, column: 24, scope: !32)
!42 = !DILocation(line: 29, column: 5, scope: !32)
!43 = distinct !{!43, !34, !44, !45}
!44 = !DILocation(line: 35, column: 5, scope: !29)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "i", scope: !47, file: !14, line: 37, type: !48)
!47 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 37, column: 16, scope: !47)
!52 = !DILocalVariable(name: "source", scope: !47, file: !14, line: 38, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 38, column: 14, scope: !47)
!57 = !DILocation(line: 39, column: 9, scope: !47)
!58 = !DILocation(line: 40, column: 9, scope: !47)
!59 = !DILocation(line: 40, column: 23, scope: !47)
!60 = !DILocation(line: 42, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !47, file: !14, line: 42, column: 9)
!62 = !DILocation(line: 42, column: 14, scope: !61)
!63 = !DILocation(line: 42, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !14, line: 42, column: 9)
!65 = !DILocation(line: 42, column: 23, scope: !64)
!66 = !DILocation(line: 42, column: 9, scope: !61)
!67 = !DILocation(line: 44, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !14, line: 43, column: 9)
!69 = !DILocation(line: 44, column: 23, scope: !68)
!70 = !DILocation(line: 44, column: 13, scope: !68)
!71 = !DILocation(line: 44, column: 18, scope: !68)
!72 = !DILocation(line: 44, column: 21, scope: !68)
!73 = !DILocation(line: 45, column: 9, scope: !68)
!74 = !DILocation(line: 42, column: 31, scope: !64)
!75 = !DILocation(line: 42, column: 9, scope: !64)
!76 = distinct !{!76, !66, !77, !45}
!77 = !DILocation(line: 45, column: 9, scope: !61)
!78 = !DILocation(line: 46, column: 9, scope: !47)
!79 = !DILocation(line: 46, column: 21, scope: !47)
!80 = !DILocation(line: 47, column: 19, scope: !47)
!81 = !DILocation(line: 47, column: 9, scope: !47)
!82 = !DILocation(line: 49, column: 1, scope: !13)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_17_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 85, column: 5, scope: !83)
!85 = !DILocation(line: 86, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 98, type: !87, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!18, !18, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !14, line: 98, type: !18)
!91 = !DILocation(line: 98, column: 14, scope: !86)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !14, line: 98, type: !89)
!93 = !DILocation(line: 98, column: 27, scope: !86)
!94 = !DILocation(line: 101, column: 22, scope: !86)
!95 = !DILocation(line: 101, column: 12, scope: !86)
!96 = !DILocation(line: 101, column: 5, scope: !86)
!97 = !DILocation(line: 103, column: 5, scope: !86)
!98 = !DILocation(line: 104, column: 5, scope: !86)
!99 = !DILocation(line: 105, column: 5, scope: !86)
!100 = !DILocation(line: 108, column: 5, scope: !86)
!101 = !DILocation(line: 109, column: 5, scope: !86)
!102 = !DILocation(line: 110, column: 5, scope: !86)
!103 = !DILocation(line: 112, column: 5, scope: !86)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "h", scope: !104, file: !14, line: 58, type: !18)
!106 = !DILocation(line: 58, column: 9, scope: !104)
!107 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 59, type: !4)
!108 = !DILocation(line: 59, column: 12, scope: !104)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !14, line: 60, type: !4)
!110 = !DILocation(line: 60, column: 12, scope: !104)
!111 = !DILocation(line: 60, column: 36, scope: !104)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !14, line: 61, type: !4)
!113 = !DILocation(line: 61, column: 12, scope: !104)
!114 = !DILocation(line: 61, column: 37, scope: !104)
!115 = !DILocation(line: 62, column: 11, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !14, line: 62, column: 5)
!117 = !DILocation(line: 62, column: 9, scope: !116)
!118 = !DILocation(line: 62, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 62, column: 5)
!120 = !DILocation(line: 62, column: 18, scope: !119)
!121 = !DILocation(line: 62, column: 5, scope: !116)
!122 = !DILocation(line: 65, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !14, line: 63, column: 5)
!124 = !DILocation(line: 65, column: 14, scope: !123)
!125 = !DILocation(line: 66, column: 9, scope: !123)
!126 = !DILocation(line: 66, column: 17, scope: !123)
!127 = !DILocation(line: 67, column: 5, scope: !123)
!128 = !DILocation(line: 62, column: 24, scope: !119)
!129 = !DILocation(line: 62, column: 5, scope: !119)
!130 = distinct !{!130, !121, !131, !45}
!131 = !DILocation(line: 67, column: 5, scope: !116)
!132 = !DILocalVariable(name: "i", scope: !133, file: !14, line: 69, type: !48)
!133 = distinct !DILexicalBlock(scope: !104, file: !14, line: 68, column: 5)
!134 = !DILocation(line: 69, column: 16, scope: !133)
!135 = !DILocalVariable(name: "source", scope: !133, file: !14, line: 70, type: !53)
!136 = !DILocation(line: 70, column: 14, scope: !133)
!137 = !DILocation(line: 71, column: 9, scope: !133)
!138 = !DILocation(line: 72, column: 9, scope: !133)
!139 = !DILocation(line: 72, column: 23, scope: !133)
!140 = !DILocation(line: 74, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !133, file: !14, line: 74, column: 9)
!142 = !DILocation(line: 74, column: 14, scope: !141)
!143 = !DILocation(line: 74, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !14, line: 74, column: 9)
!145 = !DILocation(line: 74, column: 23, scope: !144)
!146 = !DILocation(line: 74, column: 9, scope: !141)
!147 = !DILocation(line: 76, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !14, line: 75, column: 9)
!149 = !DILocation(line: 76, column: 23, scope: !148)
!150 = !DILocation(line: 76, column: 13, scope: !148)
!151 = !DILocation(line: 76, column: 18, scope: !148)
!152 = !DILocation(line: 76, column: 21, scope: !148)
!153 = !DILocation(line: 77, column: 9, scope: !148)
!154 = !DILocation(line: 74, column: 31, scope: !144)
!155 = !DILocation(line: 74, column: 9, scope: !144)
!156 = distinct !{!156, !146, !157, !45}
!157 = !DILocation(line: 77, column: 9, scope: !141)
!158 = !DILocation(line: 78, column: 9, scope: !133)
!159 = !DILocation(line: 78, column: 21, scope: !133)
!160 = !DILocation(line: 79, column: 19, scope: !133)
!161 = !DILocation(line: 79, column: 9, scope: !133)
!162 = !DILocation(line: 81, column: 1, scope: !104)
