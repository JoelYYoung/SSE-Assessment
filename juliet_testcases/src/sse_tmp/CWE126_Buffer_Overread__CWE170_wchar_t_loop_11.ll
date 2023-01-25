; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_11_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrue(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !18, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !35
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !36
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !42
  %cmp = icmp slt i32 %0, 99, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !46
  %idxprom = sext i32 %1 to i64, !dbg !48
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !48
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !48
  %3 = load i32, i32* %i, align 4, !dbg !49
  %idxprom3 = sext i32 %3 to i64, !dbg !50
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !50
  store i32 %2, i32* %arrayidx4, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %4, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay5), !dbg !59
  br label %if.end, !dbg !60

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !61
}

declare dso_local i32 @globalReturnsTrue(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_11_good() #0 !dbg !62 {
entry:
  call void @good1(), !dbg !63
  call void @good2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #4, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #4, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_11_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_11_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !86 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %call = call i32 (...) @globalReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !93, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !101
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !102
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  store i32 0, i32* %i, align 4, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %if.else
  %0 = load i32, i32* %i, align 4, !dbg !108
  %cmp = icmp slt i32 %0, 99, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !112
  %idxprom = sext i32 %1 to i64, !dbg !114
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !114
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !114
  %3 = load i32, i32* %i, align 4, !dbg !115
  %idxprom3 = sext i32 %3 to i64, !dbg !116
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !116
  store i32 %2, i32* %arrayidx4, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !119
  %inc = add nsw i32 %4, 1, !dbg !119
  store i32 %inc, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx5, align 4, !dbg !124
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay6), !dbg !126
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !127
}

declare dso_local i32 @globalReturnsFalse(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !128 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrue(), !dbg !129
  %tobool = icmp ne i32 %call, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !132, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32* %i, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !140
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !141
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !143
  store i32 0, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !147
  %cmp = icmp slt i32 %0, 99, !dbg !149
  br i1 %cmp, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !151
  %idxprom = sext i32 %1 to i64, !dbg !153
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !153
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !153
  %3 = load i32, i32* %i, align 4, !dbg !154
  %idxprom3 = sext i32 %3 to i64, !dbg !155
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !155
  store i32 %2, i32* %arrayidx4, align 4, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !158
  %inc = add nsw i32 %4, 1, !dbg !158
  store i32 %inc, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !162
  store i32 0, i32* %arrayidx5, align 4, !dbg !163
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  call void @printWLine(i32* %arraydecay6), !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_11_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 27, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 26, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 74, baseType: !24)
!23 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!26}
!26 = !DISubrange(count: 150)
!27 = !DILocation(line: 27, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 27, column: 31, scope: !19)
!33 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 28, type: !24)
!34 = !DILocation(line: 28, column: 17, scope: !19)
!35 = !DILocation(line: 30, column: 21, scope: !19)
!36 = !DILocation(line: 30, column: 13, scope: !19)
!37 = !DILocation(line: 31, column: 13, scope: !19)
!38 = !DILocation(line: 31, column: 22, scope: !19)
!39 = !DILocation(line: 32, column: 18, scope: !40)
!40 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 13)
!41 = !DILocation(line: 32, column: 17, scope: !40)
!42 = !DILocation(line: 32, column: 22, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 32, column: 13)
!44 = !DILocation(line: 32, column: 24, scope: !43)
!45 = !DILocation(line: 32, column: 13, scope: !40)
!46 = !DILocation(line: 34, column: 31, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 33, column: 13)
!48 = !DILocation(line: 34, column: 27, scope: !47)
!49 = !DILocation(line: 34, column: 22, scope: !47)
!50 = !DILocation(line: 34, column: 17, scope: !47)
!51 = !DILocation(line: 34, column: 25, scope: !47)
!52 = !DILocation(line: 35, column: 13, scope: !47)
!53 = !DILocation(line: 32, column: 31, scope: !43)
!54 = !DILocation(line: 32, column: 13, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 35, column: 13, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 37, column: 24, scope: !19)
!59 = !DILocation(line: 37, column: 13, scope: !19)
!60 = !DILocation(line: 39, column: 5, scope: !20)
!61 = !DILocation(line: 40, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_11_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 95, column: 5, scope: !62)
!64 = !DILocation(line: 96, column: 5, scope: !62)
!65 = !DILocation(line: 97, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 108, type: !67, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!24, !24, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 108, type: !24)
!73 = !DILocation(line: 108, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 108, type: !69)
!75 = !DILocation(line: 108, column: 27, scope: !66)
!76 = !DILocation(line: 111, column: 22, scope: !66)
!77 = !DILocation(line: 111, column: 12, scope: !66)
!78 = !DILocation(line: 111, column: 5, scope: !66)
!79 = !DILocation(line: 113, column: 5, scope: !66)
!80 = !DILocation(line: 114, column: 5, scope: !66)
!81 = !DILocation(line: 115, column: 5, scope: !66)
!82 = !DILocation(line: 118, column: 5, scope: !66)
!83 = !DILocation(line: 119, column: 5, scope: !66)
!84 = !DILocation(line: 120, column: 5, scope: !66)
!85 = !DILocation(line: 122, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 49, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !86, file: !12, line: 49, column: 8)
!89 = !DILocation(line: 49, column: 8, scope: !86)
!90 = !DILocation(line: 52, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 50, column: 5)
!92 = !DILocation(line: 53, column: 5, scope: !91)
!93 = !DILocalVariable(name: "src", scope: !94, file: !12, line: 57, type: !21)
!94 = distinct !DILexicalBlock(scope: !95, file: !12, line: 56, column: 9)
!95 = distinct !DILexicalBlock(scope: !88, file: !12, line: 55, column: 5)
!96 = !DILocation(line: 57, column: 21, scope: !94)
!97 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 57, type: !29)
!98 = !DILocation(line: 57, column: 31, scope: !94)
!99 = !DILocalVariable(name: "i", scope: !94, file: !12, line: 58, type: !24)
!100 = !DILocation(line: 58, column: 17, scope: !94)
!101 = !DILocation(line: 60, column: 21, scope: !94)
!102 = !DILocation(line: 60, column: 13, scope: !94)
!103 = !DILocation(line: 61, column: 13, scope: !94)
!104 = !DILocation(line: 61, column: 22, scope: !94)
!105 = !DILocation(line: 62, column: 18, scope: !106)
!106 = distinct !DILexicalBlock(scope: !94, file: !12, line: 62, column: 13)
!107 = !DILocation(line: 62, column: 17, scope: !106)
!108 = !DILocation(line: 62, column: 22, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 62, column: 13)
!110 = !DILocation(line: 62, column: 24, scope: !109)
!111 = !DILocation(line: 62, column: 13, scope: !106)
!112 = !DILocation(line: 64, column: 31, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 63, column: 13)
!114 = !DILocation(line: 64, column: 27, scope: !113)
!115 = !DILocation(line: 64, column: 22, scope: !113)
!116 = !DILocation(line: 64, column: 17, scope: !113)
!117 = !DILocation(line: 64, column: 25, scope: !113)
!118 = !DILocation(line: 65, column: 13, scope: !113)
!119 = !DILocation(line: 62, column: 31, scope: !109)
!120 = !DILocation(line: 62, column: 13, scope: !109)
!121 = distinct !{!121, !111, !122, !57}
!122 = !DILocation(line: 65, column: 13, scope: !106)
!123 = !DILocation(line: 66, column: 13, scope: !94)
!124 = !DILocation(line: 66, column: 22, scope: !94)
!125 = !DILocation(line: 67, column: 24, scope: !94)
!126 = !DILocation(line: 67, column: 13, scope: !94)
!127 = !DILocation(line: 70, column: 1, scope: !86)
!128 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocation(line: 75, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !128, file: !12, line: 75, column: 8)
!131 = !DILocation(line: 75, column: 8, scope: !128)
!132 = !DILocalVariable(name: "src", scope: !133, file: !12, line: 78, type: !21)
!133 = distinct !DILexicalBlock(scope: !134, file: !12, line: 77, column: 9)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 76, column: 5)
!135 = !DILocation(line: 78, column: 21, scope: !133)
!136 = !DILocalVariable(name: "dest", scope: !133, file: !12, line: 78, type: !29)
!137 = !DILocation(line: 78, column: 31, scope: !133)
!138 = !DILocalVariable(name: "i", scope: !133, file: !12, line: 79, type: !24)
!139 = !DILocation(line: 79, column: 17, scope: !133)
!140 = !DILocation(line: 81, column: 21, scope: !133)
!141 = !DILocation(line: 81, column: 13, scope: !133)
!142 = !DILocation(line: 82, column: 13, scope: !133)
!143 = !DILocation(line: 82, column: 22, scope: !133)
!144 = !DILocation(line: 83, column: 18, scope: !145)
!145 = distinct !DILexicalBlock(scope: !133, file: !12, line: 83, column: 13)
!146 = !DILocation(line: 83, column: 17, scope: !145)
!147 = !DILocation(line: 83, column: 22, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !12, line: 83, column: 13)
!149 = !DILocation(line: 83, column: 24, scope: !148)
!150 = !DILocation(line: 83, column: 13, scope: !145)
!151 = !DILocation(line: 85, column: 31, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !12, line: 84, column: 13)
!153 = !DILocation(line: 85, column: 27, scope: !152)
!154 = !DILocation(line: 85, column: 22, scope: !152)
!155 = !DILocation(line: 85, column: 17, scope: !152)
!156 = !DILocation(line: 85, column: 25, scope: !152)
!157 = !DILocation(line: 86, column: 13, scope: !152)
!158 = !DILocation(line: 83, column: 31, scope: !148)
!159 = !DILocation(line: 83, column: 13, scope: !148)
!160 = distinct !{!160, !150, !161, !57}
!161 = !DILocation(line: 86, column: 13, scope: !145)
!162 = !DILocation(line: 87, column: 13, scope: !133)
!163 = !DILocation(line: 87, column: 22, scope: !133)
!164 = !DILocation(line: 88, column: 24, scope: !133)
!165 = !DILocation(line: 88, column: 13, scope: !133)
!166 = !DILocation(line: 90, column: 5, scope: !134)
!167 = !DILocation(line: 91, column: 1, scope: !128)
