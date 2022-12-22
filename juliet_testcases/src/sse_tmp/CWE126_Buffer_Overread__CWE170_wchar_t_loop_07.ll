; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_07_bad() #0 !dbg !16 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFive, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !23, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !40
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !46
  %cmp1 = icmp slt i32 %1, 99, !dbg !48
  br i1 %cmp1, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !50
  %idxprom = sext i32 %2 to i64, !dbg !52
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !52
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !52
  %4 = load i32, i32* %i, align 4, !dbg !53
  %idxprom3 = sext i32 %4 to i64, !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !54
  store i32 %3, i32* %arrayidx4, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %5, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay5), !dbg !63
  br label %if.end, !dbg !64

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_07_good() #0 !dbg !66 {
entry:
  call void @good1(), !dbg !67
  call void @good2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #4, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #4, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_07_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_07_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !90 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp = icmp ne i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !98, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %i, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !107
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  store i32 0, i32* %i, align 4, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %if.else
  %1 = load i32, i32* %i, align 4, !dbg !113
  %cmp1 = icmp slt i32 %1, 99, !dbg !115
  br i1 %cmp1, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !117
  %idxprom = sext i32 %2 to i64, !dbg !119
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !119
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !119
  %4 = load i32, i32* %i, align 4, !dbg !120
  %idxprom3 = sext i32 %4 to i64, !dbg !121
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !121
  store i32 %3, i32* %arrayidx4, align 4, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !124
  %inc = add nsw i32 %5, 1, !dbg !124
  store i32 %inc, i32* %i, align 4, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx5, align 4, !dbg !129
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay6), !dbg !131
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !133 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFive, align 4, !dbg !134
  %cmp = icmp eq i32 %0, 5, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !138, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !146
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !147
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  store i32 0, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !153
  %cmp1 = icmp slt i32 %1, 99, !dbg !155
  br i1 %cmp1, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !157
  %idxprom = sext i32 %2 to i64, !dbg !159
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !159
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !159
  %4 = load i32, i32* %i, align 4, !dbg !160
  %idxprom3 = sext i32 %4 to i64, !dbg !161
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !161
  store i32 %3, i32* %arrayidx4, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !164
  %inc = add nsw i32 %5, 1, !dbg !164
  store i32 %inc, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx5, align 4, !dbg !169
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay6), !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 29, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !8, line: 29, column: 8)
!21 = !DILocation(line: 29, column: 18, scope: !20)
!22 = !DILocation(line: 29, column: 8, scope: !16)
!23 = !DILocalVariable(name: "src", scope: !24, file: !8, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !8, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !20, file: !8, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 4800, elements: !29)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !28, line: 74, baseType: !9)
!28 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!29 = !{!30}
!30 = !DISubrange(count: 150)
!31 = !DILocation(line: 32, column: 21, scope: !24)
!32 = !DILocalVariable(name: "dest", scope: !24, file: !8, line: 32, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 32, column: 31, scope: !24)
!37 = !DILocalVariable(name: "i", scope: !24, file: !8, line: 33, type: !9)
!38 = !DILocation(line: 33, column: 17, scope: !24)
!39 = !DILocation(line: 35, column: 21, scope: !24)
!40 = !DILocation(line: 35, column: 13, scope: !24)
!41 = !DILocation(line: 36, column: 13, scope: !24)
!42 = !DILocation(line: 36, column: 22, scope: !24)
!43 = !DILocation(line: 37, column: 18, scope: !44)
!44 = distinct !DILexicalBlock(scope: !24, file: !8, line: 37, column: 13)
!45 = !DILocation(line: 37, column: 17, scope: !44)
!46 = !DILocation(line: 37, column: 22, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !8, line: 37, column: 13)
!48 = !DILocation(line: 37, column: 24, scope: !47)
!49 = !DILocation(line: 37, column: 13, scope: !44)
!50 = !DILocation(line: 39, column: 31, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 38, column: 13)
!52 = !DILocation(line: 39, column: 27, scope: !51)
!53 = !DILocation(line: 39, column: 22, scope: !51)
!54 = !DILocation(line: 39, column: 17, scope: !51)
!55 = !DILocation(line: 39, column: 25, scope: !51)
!56 = !DILocation(line: 40, column: 13, scope: !51)
!57 = !DILocation(line: 37, column: 31, scope: !47)
!58 = !DILocation(line: 37, column: 13, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 40, column: 13, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 42, column: 24, scope: !24)
!63 = !DILocation(line: 42, column: 13, scope: !24)
!64 = !DILocation(line: 44, column: 5, scope: !25)
!65 = !DILocation(line: 45, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_07_good", scope: !8, file: !8, line: 98, type: !17, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 100, column: 5, scope: !66)
!68 = !DILocation(line: 101, column: 5, scope: !66)
!69 = !DILocation(line: 102, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 113, type: !71, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!9, !9, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !8, line: 113, type: !9)
!77 = !DILocation(line: 113, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !8, line: 113, type: !73)
!79 = !DILocation(line: 113, column: 27, scope: !70)
!80 = !DILocation(line: 116, column: 22, scope: !70)
!81 = !DILocation(line: 116, column: 12, scope: !70)
!82 = !DILocation(line: 116, column: 5, scope: !70)
!83 = !DILocation(line: 118, column: 5, scope: !70)
!84 = !DILocation(line: 119, column: 5, scope: !70)
!85 = !DILocation(line: 120, column: 5, scope: !70)
!86 = !DILocation(line: 123, column: 5, scope: !70)
!87 = !DILocation(line: 124, column: 5, scope: !70)
!88 = !DILocation(line: 125, column: 5, scope: !70)
!89 = !DILocation(line: 127, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocation(line: 54, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !8, line: 54, column: 8)
!93 = !DILocation(line: 54, column: 18, scope: !92)
!94 = !DILocation(line: 54, column: 8, scope: !90)
!95 = !DILocation(line: 57, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !8, line: 55, column: 5)
!97 = !DILocation(line: 58, column: 5, scope: !96)
!98 = !DILocalVariable(name: "src", scope: !99, file: !8, line: 62, type: !26)
!99 = distinct !DILexicalBlock(scope: !100, file: !8, line: 61, column: 9)
!100 = distinct !DILexicalBlock(scope: !92, file: !8, line: 60, column: 5)
!101 = !DILocation(line: 62, column: 21, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !99, file: !8, line: 62, type: !33)
!103 = !DILocation(line: 62, column: 31, scope: !99)
!104 = !DILocalVariable(name: "i", scope: !99, file: !8, line: 63, type: !9)
!105 = !DILocation(line: 63, column: 17, scope: !99)
!106 = !DILocation(line: 65, column: 21, scope: !99)
!107 = !DILocation(line: 65, column: 13, scope: !99)
!108 = !DILocation(line: 66, column: 13, scope: !99)
!109 = !DILocation(line: 66, column: 22, scope: !99)
!110 = !DILocation(line: 67, column: 18, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !8, line: 67, column: 13)
!112 = !DILocation(line: 67, column: 17, scope: !111)
!113 = !DILocation(line: 67, column: 22, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !8, line: 67, column: 13)
!115 = !DILocation(line: 67, column: 24, scope: !114)
!116 = !DILocation(line: 67, column: 13, scope: !111)
!117 = !DILocation(line: 69, column: 31, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !8, line: 68, column: 13)
!119 = !DILocation(line: 69, column: 27, scope: !118)
!120 = !DILocation(line: 69, column: 22, scope: !118)
!121 = !DILocation(line: 69, column: 17, scope: !118)
!122 = !DILocation(line: 69, column: 25, scope: !118)
!123 = !DILocation(line: 70, column: 13, scope: !118)
!124 = !DILocation(line: 67, column: 31, scope: !114)
!125 = !DILocation(line: 67, column: 13, scope: !114)
!126 = distinct !{!126, !116, !127, !61}
!127 = !DILocation(line: 70, column: 13, scope: !111)
!128 = !DILocation(line: 71, column: 13, scope: !99)
!129 = !DILocation(line: 71, column: 22, scope: !99)
!130 = !DILocation(line: 72, column: 24, scope: !99)
!131 = !DILocation(line: 72, column: 13, scope: !99)
!132 = !DILocation(line: 75, column: 1, scope: !90)
!133 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocation(line: 80, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !133, file: !8, line: 80, column: 8)
!136 = !DILocation(line: 80, column: 18, scope: !135)
!137 = !DILocation(line: 80, column: 8, scope: !133)
!138 = !DILocalVariable(name: "src", scope: !139, file: !8, line: 83, type: !26)
!139 = distinct !DILexicalBlock(scope: !140, file: !8, line: 82, column: 9)
!140 = distinct !DILexicalBlock(scope: !135, file: !8, line: 81, column: 5)
!141 = !DILocation(line: 83, column: 21, scope: !139)
!142 = !DILocalVariable(name: "dest", scope: !139, file: !8, line: 83, type: !33)
!143 = !DILocation(line: 83, column: 31, scope: !139)
!144 = !DILocalVariable(name: "i", scope: !139, file: !8, line: 84, type: !9)
!145 = !DILocation(line: 84, column: 17, scope: !139)
!146 = !DILocation(line: 86, column: 21, scope: !139)
!147 = !DILocation(line: 86, column: 13, scope: !139)
!148 = !DILocation(line: 87, column: 13, scope: !139)
!149 = !DILocation(line: 87, column: 22, scope: !139)
!150 = !DILocation(line: 88, column: 18, scope: !151)
!151 = distinct !DILexicalBlock(scope: !139, file: !8, line: 88, column: 13)
!152 = !DILocation(line: 88, column: 17, scope: !151)
!153 = !DILocation(line: 88, column: 22, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !8, line: 88, column: 13)
!155 = !DILocation(line: 88, column: 24, scope: !154)
!156 = !DILocation(line: 88, column: 13, scope: !151)
!157 = !DILocation(line: 90, column: 31, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !8, line: 89, column: 13)
!159 = !DILocation(line: 90, column: 27, scope: !158)
!160 = !DILocation(line: 90, column: 22, scope: !158)
!161 = !DILocation(line: 90, column: 17, scope: !158)
!162 = !DILocation(line: 90, column: 25, scope: !158)
!163 = !DILocation(line: 91, column: 13, scope: !158)
!164 = !DILocation(line: 88, column: 31, scope: !154)
!165 = !DILocation(line: 88, column: 13, scope: !154)
!166 = distinct !{!166, !156, !167, !61}
!167 = !DILocation(line: 91, column: 13, scope: !151)
!168 = !DILocation(line: 92, column: 13, scope: !139)
!169 = !DILocation(line: 92, column: 22, scope: !139)
!170 = !DILocation(line: 93, column: 24, scope: !139)
!171 = !DILocation(line: 93, column: 13, scope: !139)
!172 = !DILocation(line: 95, column: 5, scope: !140)
!173 = !DILocation(line: 96, column: 1, scope: !133)
