; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_08_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %call = call i32 @staticReturnsTrue(), !dbg !15
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

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_08_good() #0 !dbg !62 {
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
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_08_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_08_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !86 {
entry:
  ret i32 1, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !90 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %call = call i32 @staticReturnsFalse(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !97, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %i, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !105
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !106
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  store i32 0, i32* %i, align 4, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %if.else
  %0 = load i32, i32* %i, align 4, !dbg !112
  %cmp = icmp slt i32 %0, 99, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !116
  %idxprom = sext i32 %1 to i64, !dbg !118
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !118
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !118
  %3 = load i32, i32* %i, align 4, !dbg !119
  %idxprom3 = sext i32 %3 to i64, !dbg !120
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !120
  store i32 %2, i32* %arrayidx4, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !123
  %inc = add nsw i32 %4, 1, !dbg !123
  store i32 %inc, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx5, align 4, !dbg !128
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay6), !dbg !130
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !132 {
entry:
  ret i32 0, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !134 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %call = call i32 @staticReturnsTrue(), !dbg !135
  %tobool = icmp ne i32 %call, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !138, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !146
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !147
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  store i32 0, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !153
  %cmp = icmp slt i32 %0, 99, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !157
  %idxprom = sext i32 %1 to i64, !dbg !159
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !159
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !159
  %3 = load i32, i32* %i, align 4, !dbg !160
  %idxprom3 = sext i32 %3 to i64, !dbg !161
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !161
  store i32 %2, i32* %arrayidx4, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !164
  %inc = add nsw i32 %4, 1, !dbg !164
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 37, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!17 = !DILocation(line: 37, column: 8, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 40, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 39, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 38, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 74, baseType: !24)
!23 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!26}
!26 = !DISubrange(count: 150)
!27 = !DILocation(line: 40, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 40, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 40, column: 31, scope: !19)
!33 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 41, type: !24)
!34 = !DILocation(line: 41, column: 17, scope: !19)
!35 = !DILocation(line: 43, column: 21, scope: !19)
!36 = !DILocation(line: 43, column: 13, scope: !19)
!37 = !DILocation(line: 44, column: 13, scope: !19)
!38 = !DILocation(line: 44, column: 22, scope: !19)
!39 = !DILocation(line: 45, column: 18, scope: !40)
!40 = distinct !DILexicalBlock(scope: !19, file: !12, line: 45, column: 13)
!41 = !DILocation(line: 45, column: 17, scope: !40)
!42 = !DILocation(line: 45, column: 22, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 45, column: 13)
!44 = !DILocation(line: 45, column: 24, scope: !43)
!45 = !DILocation(line: 45, column: 13, scope: !40)
!46 = !DILocation(line: 47, column: 31, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 46, column: 13)
!48 = !DILocation(line: 47, column: 27, scope: !47)
!49 = !DILocation(line: 47, column: 22, scope: !47)
!50 = !DILocation(line: 47, column: 17, scope: !47)
!51 = !DILocation(line: 47, column: 25, scope: !47)
!52 = !DILocation(line: 48, column: 13, scope: !47)
!53 = !DILocation(line: 45, column: 31, scope: !43)
!54 = !DILocation(line: 45, column: 13, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 48, column: 13, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 50, column: 24, scope: !19)
!59 = !DILocation(line: 50, column: 13, scope: !19)
!60 = !DILocation(line: 52, column: 5, scope: !20)
!61 = !DILocation(line: 53, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_08_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 108, column: 5, scope: !62)
!64 = !DILocation(line: 109, column: 5, scope: !62)
!65 = !DILocation(line: 110, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !67, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!24, !24, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 121, type: !24)
!73 = !DILocation(line: 121, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 121, type: !69)
!75 = !DILocation(line: 121, column: 27, scope: !66)
!76 = !DILocation(line: 124, column: 22, scope: !66)
!77 = !DILocation(line: 124, column: 12, scope: !66)
!78 = !DILocation(line: 124, column: 5, scope: !66)
!79 = !DILocation(line: 126, column: 5, scope: !66)
!80 = !DILocation(line: 127, column: 5, scope: !66)
!81 = !DILocation(line: 128, column: 5, scope: !66)
!82 = !DILocation(line: 131, column: 5, scope: !66)
!83 = !DILocation(line: 132, column: 5, scope: !66)
!84 = !DILocation(line: 133, column: 5, scope: !66)
!85 = !DILocation(line: 135, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !87, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!24}
!89 = !DILocation(line: 25, column: 5, scope: !86)
!90 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 62, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !12, line: 62, column: 8)
!93 = !DILocation(line: 62, column: 8, scope: !90)
!94 = !DILocation(line: 65, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !12, line: 63, column: 5)
!96 = !DILocation(line: 66, column: 5, scope: !95)
!97 = !DILocalVariable(name: "src", scope: !98, file: !12, line: 70, type: !21)
!98 = distinct !DILexicalBlock(scope: !99, file: !12, line: 69, column: 9)
!99 = distinct !DILexicalBlock(scope: !92, file: !12, line: 68, column: 5)
!100 = !DILocation(line: 70, column: 21, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 70, type: !29)
!102 = !DILocation(line: 70, column: 31, scope: !98)
!103 = !DILocalVariable(name: "i", scope: !98, file: !12, line: 71, type: !24)
!104 = !DILocation(line: 71, column: 17, scope: !98)
!105 = !DILocation(line: 73, column: 21, scope: !98)
!106 = !DILocation(line: 73, column: 13, scope: !98)
!107 = !DILocation(line: 74, column: 13, scope: !98)
!108 = !DILocation(line: 74, column: 22, scope: !98)
!109 = !DILocation(line: 75, column: 18, scope: !110)
!110 = distinct !DILexicalBlock(scope: !98, file: !12, line: 75, column: 13)
!111 = !DILocation(line: 75, column: 17, scope: !110)
!112 = !DILocation(line: 75, column: 22, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 75, column: 13)
!114 = !DILocation(line: 75, column: 24, scope: !113)
!115 = !DILocation(line: 75, column: 13, scope: !110)
!116 = !DILocation(line: 77, column: 31, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 76, column: 13)
!118 = !DILocation(line: 77, column: 27, scope: !117)
!119 = !DILocation(line: 77, column: 22, scope: !117)
!120 = !DILocation(line: 77, column: 17, scope: !117)
!121 = !DILocation(line: 77, column: 25, scope: !117)
!122 = !DILocation(line: 78, column: 13, scope: !117)
!123 = !DILocation(line: 75, column: 31, scope: !113)
!124 = !DILocation(line: 75, column: 13, scope: !113)
!125 = distinct !{!125, !115, !126, !57}
!126 = !DILocation(line: 78, column: 13, scope: !110)
!127 = !DILocation(line: 79, column: 13, scope: !98)
!128 = !DILocation(line: 79, column: 22, scope: !98)
!129 = !DILocation(line: 80, column: 24, scope: !98)
!130 = !DILocation(line: 80, column: 13, scope: !98)
!131 = !DILocation(line: 83, column: 1, scope: !90)
!132 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !87, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocation(line: 30, column: 5, scope: !132)
!134 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocation(line: 88, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !134, file: !12, line: 88, column: 8)
!137 = !DILocation(line: 88, column: 8, scope: !134)
!138 = !DILocalVariable(name: "src", scope: !139, file: !12, line: 91, type: !21)
!139 = distinct !DILexicalBlock(scope: !140, file: !12, line: 90, column: 9)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 89, column: 5)
!141 = !DILocation(line: 91, column: 21, scope: !139)
!142 = !DILocalVariable(name: "dest", scope: !139, file: !12, line: 91, type: !29)
!143 = !DILocation(line: 91, column: 31, scope: !139)
!144 = !DILocalVariable(name: "i", scope: !139, file: !12, line: 92, type: !24)
!145 = !DILocation(line: 92, column: 17, scope: !139)
!146 = !DILocation(line: 94, column: 21, scope: !139)
!147 = !DILocation(line: 94, column: 13, scope: !139)
!148 = !DILocation(line: 95, column: 13, scope: !139)
!149 = !DILocation(line: 95, column: 22, scope: !139)
!150 = !DILocation(line: 96, column: 18, scope: !151)
!151 = distinct !DILexicalBlock(scope: !139, file: !12, line: 96, column: 13)
!152 = !DILocation(line: 96, column: 17, scope: !151)
!153 = !DILocation(line: 96, column: 22, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !12, line: 96, column: 13)
!155 = !DILocation(line: 96, column: 24, scope: !154)
!156 = !DILocation(line: 96, column: 13, scope: !151)
!157 = !DILocation(line: 98, column: 31, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !12, line: 97, column: 13)
!159 = !DILocation(line: 98, column: 27, scope: !158)
!160 = !DILocation(line: 98, column: 22, scope: !158)
!161 = !DILocation(line: 98, column: 17, scope: !158)
!162 = !DILocation(line: 98, column: 25, scope: !158)
!163 = !DILocation(line: 99, column: 13, scope: !158)
!164 = !DILocation(line: 96, column: 31, scope: !154)
!165 = !DILocation(line: 96, column: 13, scope: !154)
!166 = distinct !{!166, !156, !167, !57}
!167 = !DILocation(line: 99, column: 13, scope: !151)
!168 = !DILocation(line: 100, column: 13, scope: !139)
!169 = !DILocation(line: 100, column: 22, scope: !139)
!170 = !DILocation(line: 101, column: 24, scope: !139)
!171 = !DILocation(line: 101, column: 13, scope: !139)
!172 = !DILocation(line: 103, column: 5, scope: !140)
!173 = !DILocation(line: 104, column: 1, scope: !134)
