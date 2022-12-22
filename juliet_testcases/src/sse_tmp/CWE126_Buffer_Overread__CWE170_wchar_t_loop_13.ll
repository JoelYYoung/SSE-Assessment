; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_13_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !15
  %cmp = icmp eq i32 %0, 5, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !19, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !37
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  store i32 0, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !43
  %cmp1 = icmp slt i32 %1, 99, !dbg !45
  br i1 %cmp1, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !47
  %idxprom = sext i32 %2 to i64, !dbg !49
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !49
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !49
  %4 = load i32, i32* %i, align 4, !dbg !50
  %idxprom3 = sext i32 %4 to i64, !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !51
  store i32 %3, i32* %arrayidx4, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %5, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* %arraydecay5), !dbg !60
  br label %if.end, !dbg !61

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_13_good() #0 !dbg !63 {
entry:
  call void @good1(), !dbg !64
  call void @good2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #4, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #4, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_13_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_13_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !87 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !95, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %i, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !103
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !104
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  store i32 0, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %if.else
  %1 = load i32, i32* %i, align 4, !dbg !110
  %cmp1 = icmp slt i32 %1, 99, !dbg !112
  br i1 %cmp1, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !114
  %idxprom = sext i32 %2 to i64, !dbg !116
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !116
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !116
  %4 = load i32, i32* %i, align 4, !dbg !117
  %idxprom3 = sext i32 %4 to i64, !dbg !118
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !118
  store i32 %3, i32* %arrayidx4, align 4, !dbg !119
  br label %for.inc, !dbg !120

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !121
  %inc = add nsw i32 %5, 1, !dbg !121
  store i32 %inc, i32* %i, align 4, !dbg !121
  br label %for.cond, !dbg !122, !llvm.loop !123

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx5, align 4, !dbg !126
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay6), !dbg !128
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !130 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !131
  %cmp = icmp eq i32 %0, 5, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !135, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i32* %i, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !143
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !144
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  store i32 0, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !150
  %cmp1 = icmp slt i32 %1, 99, !dbg !152
  br i1 %cmp1, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !154
  %idxprom = sext i32 %2 to i64, !dbg !156
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !156
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !156
  %4 = load i32, i32* %i, align 4, !dbg !157
  %idxprom3 = sext i32 %4 to i64, !dbg !158
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !158
  store i32 %3, i32* %arrayidx4, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !161
  %inc = add nsw i32 %5, 1, !dbg !161
  store i32 %inc, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx5, align 4, !dbg !166
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  call void @printWLine(i32* %arraydecay6), !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !170
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_13_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_13.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 25, scope: !16)
!18 = !DILocation(line: 24, column: 8, scope: !11)
!19 = !DILocalVariable(name: "src", scope: !20, file: !12, line: 27, type: !22)
!20 = distinct !DILexicalBlock(scope: !21, file: !12, line: 26, column: 9)
!21 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 4800, elements: !26)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !25)
!24 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{!27}
!27 = !DISubrange(count: 150)
!28 = !DILocation(line: 27, column: 21, scope: !20)
!29 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 31, scope: !20)
!34 = !DILocalVariable(name: "i", scope: !20, file: !12, line: 28, type: !25)
!35 = !DILocation(line: 28, column: 17, scope: !20)
!36 = !DILocation(line: 30, column: 21, scope: !20)
!37 = !DILocation(line: 30, column: 13, scope: !20)
!38 = !DILocation(line: 31, column: 13, scope: !20)
!39 = !DILocation(line: 31, column: 22, scope: !20)
!40 = !DILocation(line: 32, column: 18, scope: !41)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 32, column: 13)
!42 = !DILocation(line: 32, column: 17, scope: !41)
!43 = !DILocation(line: 32, column: 22, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 32, column: 13)
!45 = !DILocation(line: 32, column: 24, scope: !44)
!46 = !DILocation(line: 32, column: 13, scope: !41)
!47 = !DILocation(line: 34, column: 31, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 33, column: 13)
!49 = !DILocation(line: 34, column: 27, scope: !48)
!50 = !DILocation(line: 34, column: 22, scope: !48)
!51 = !DILocation(line: 34, column: 17, scope: !48)
!52 = !DILocation(line: 34, column: 25, scope: !48)
!53 = !DILocation(line: 35, column: 13, scope: !48)
!54 = !DILocation(line: 32, column: 31, scope: !44)
!55 = !DILocation(line: 32, column: 13, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 35, column: 13, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 37, column: 24, scope: !20)
!60 = !DILocation(line: 37, column: 13, scope: !20)
!61 = !DILocation(line: 39, column: 5, scope: !21)
!62 = !DILocation(line: 40, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_13_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 95, column: 5, scope: !63)
!65 = !DILocation(line: 96, column: 5, scope: !63)
!66 = !DILocation(line: 97, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 108, type: !68, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!25, !25, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 108, type: !25)
!74 = !DILocation(line: 108, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 108, type: !70)
!76 = !DILocation(line: 108, column: 27, scope: !67)
!77 = !DILocation(line: 111, column: 22, scope: !67)
!78 = !DILocation(line: 111, column: 12, scope: !67)
!79 = !DILocation(line: 111, column: 5, scope: !67)
!80 = !DILocation(line: 113, column: 5, scope: !67)
!81 = !DILocation(line: 114, column: 5, scope: !67)
!82 = !DILocation(line: 115, column: 5, scope: !67)
!83 = !DILocation(line: 118, column: 5, scope: !67)
!84 = !DILocation(line: 119, column: 5, scope: !67)
!85 = !DILocation(line: 120, column: 5, scope: !67)
!86 = !DILocation(line: 122, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 49, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !87, file: !12, line: 49, column: 8)
!90 = !DILocation(line: 49, column: 25, scope: !89)
!91 = !DILocation(line: 49, column: 8, scope: !87)
!92 = !DILocation(line: 52, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !12, line: 50, column: 5)
!94 = !DILocation(line: 53, column: 5, scope: !93)
!95 = !DILocalVariable(name: "src", scope: !96, file: !12, line: 57, type: !22)
!96 = distinct !DILexicalBlock(scope: !97, file: !12, line: 56, column: 9)
!97 = distinct !DILexicalBlock(scope: !89, file: !12, line: 55, column: 5)
!98 = !DILocation(line: 57, column: 21, scope: !96)
!99 = !DILocalVariable(name: "dest", scope: !96, file: !12, line: 57, type: !30)
!100 = !DILocation(line: 57, column: 31, scope: !96)
!101 = !DILocalVariable(name: "i", scope: !96, file: !12, line: 58, type: !25)
!102 = !DILocation(line: 58, column: 17, scope: !96)
!103 = !DILocation(line: 60, column: 21, scope: !96)
!104 = !DILocation(line: 60, column: 13, scope: !96)
!105 = !DILocation(line: 61, column: 13, scope: !96)
!106 = !DILocation(line: 61, column: 22, scope: !96)
!107 = !DILocation(line: 62, column: 18, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !12, line: 62, column: 13)
!109 = !DILocation(line: 62, column: 17, scope: !108)
!110 = !DILocation(line: 62, column: 22, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 62, column: 13)
!112 = !DILocation(line: 62, column: 24, scope: !111)
!113 = !DILocation(line: 62, column: 13, scope: !108)
!114 = !DILocation(line: 64, column: 31, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 63, column: 13)
!116 = !DILocation(line: 64, column: 27, scope: !115)
!117 = !DILocation(line: 64, column: 22, scope: !115)
!118 = !DILocation(line: 64, column: 17, scope: !115)
!119 = !DILocation(line: 64, column: 25, scope: !115)
!120 = !DILocation(line: 65, column: 13, scope: !115)
!121 = !DILocation(line: 62, column: 31, scope: !111)
!122 = !DILocation(line: 62, column: 13, scope: !111)
!123 = distinct !{!123, !113, !124, !58}
!124 = !DILocation(line: 65, column: 13, scope: !108)
!125 = !DILocation(line: 66, column: 13, scope: !96)
!126 = !DILocation(line: 66, column: 22, scope: !96)
!127 = !DILocation(line: 67, column: 24, scope: !96)
!128 = !DILocation(line: 67, column: 13, scope: !96)
!129 = !DILocation(line: 70, column: 1, scope: !87)
!130 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocation(line: 75, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !130, file: !12, line: 75, column: 8)
!133 = !DILocation(line: 75, column: 25, scope: !132)
!134 = !DILocation(line: 75, column: 8, scope: !130)
!135 = !DILocalVariable(name: "src", scope: !136, file: !12, line: 78, type: !22)
!136 = distinct !DILexicalBlock(scope: !137, file: !12, line: 77, column: 9)
!137 = distinct !DILexicalBlock(scope: !132, file: !12, line: 76, column: 5)
!138 = !DILocation(line: 78, column: 21, scope: !136)
!139 = !DILocalVariable(name: "dest", scope: !136, file: !12, line: 78, type: !30)
!140 = !DILocation(line: 78, column: 31, scope: !136)
!141 = !DILocalVariable(name: "i", scope: !136, file: !12, line: 79, type: !25)
!142 = !DILocation(line: 79, column: 17, scope: !136)
!143 = !DILocation(line: 81, column: 21, scope: !136)
!144 = !DILocation(line: 81, column: 13, scope: !136)
!145 = !DILocation(line: 82, column: 13, scope: !136)
!146 = !DILocation(line: 82, column: 22, scope: !136)
!147 = !DILocation(line: 83, column: 18, scope: !148)
!148 = distinct !DILexicalBlock(scope: !136, file: !12, line: 83, column: 13)
!149 = !DILocation(line: 83, column: 17, scope: !148)
!150 = !DILocation(line: 83, column: 22, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 83, column: 13)
!152 = !DILocation(line: 83, column: 24, scope: !151)
!153 = !DILocation(line: 83, column: 13, scope: !148)
!154 = !DILocation(line: 85, column: 31, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !12, line: 84, column: 13)
!156 = !DILocation(line: 85, column: 27, scope: !155)
!157 = !DILocation(line: 85, column: 22, scope: !155)
!158 = !DILocation(line: 85, column: 17, scope: !155)
!159 = !DILocation(line: 85, column: 25, scope: !155)
!160 = !DILocation(line: 86, column: 13, scope: !155)
!161 = !DILocation(line: 83, column: 31, scope: !151)
!162 = !DILocation(line: 83, column: 13, scope: !151)
!163 = distinct !{!163, !153, !164, !58}
!164 = !DILocation(line: 86, column: 13, scope: !148)
!165 = !DILocation(line: 87, column: 13, scope: !136)
!166 = !DILocation(line: 87, column: 22, scope: !136)
!167 = !DILocation(line: 88, column: 24, scope: !136)
!168 = !DILocation(line: 88, column: 13, scope: !136)
!169 = !DILocation(line: 90, column: 5, scope: !137)
!170 = !DILocation(line: 91, column: 1, scope: !130)
