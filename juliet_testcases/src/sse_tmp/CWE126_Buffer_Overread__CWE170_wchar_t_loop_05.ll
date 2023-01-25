; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_05_bad() #0 !dbg !18 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !24, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %i, metadata !38, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !40
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !41
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !47
  %cmp = icmp slt i32 %1, 99, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !51
  %idxprom = sext i32 %2 to i64, !dbg !53
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !53
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !53
  %4 = load i32, i32* %i, align 4, !dbg !54
  %idxprom2 = sext i32 %4 to i64, !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !55
  store i32 %3, i32* %arrayidx3, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %5, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay4), !dbg !64
  br label %if.end, !dbg !65

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_05_good() #0 !dbg !67 {
entry:
  call void @good1(), !dbg !68
  call void @good2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #4, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #4, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_05_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_05_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !91 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFalse, align 4, !dbg !92
  %tobool = icmp ne i32 %0, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

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
  %cmp = icmp slt i32 %1, 99, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !117
  %idxprom = sext i32 %2 to i64, !dbg !119
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !119
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !119
  %4 = load i32, i32* %i, align 4, !dbg !120
  %idxprom2 = sext i32 %4 to i64, !dbg !121
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !121
  store i32 %3, i32* %arrayidx3, align 4, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !124
  %inc = add nsw i32 %5, 1, !dbg !124
  store i32 %inc, i32* %i, align 4, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx4, align 4, !dbg !129
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay5), !dbg !131
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !134
  %tobool = icmp ne i32 %0, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !137, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !145
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !146
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !147
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  store i32 0, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !152
  %cmp = icmp slt i32 %1, 99, !dbg !154
  br i1 %cmp, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !156
  %idxprom = sext i32 %2 to i64, !dbg !158
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !158
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !158
  %4 = load i32, i32* %i, align 4, !dbg !159
  %idxprom2 = sext i32 %4 to i64, !dbg !160
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !160
  store i32 %3, i32* %arrayidx3, align 4, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !163
  %inc = add nsw i32 %5, 1, !dbg !163
  store i32 %inc, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !167
  store i32 0, i32* %arrayidx4, align 4, !dbg !168
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !169
  call void @printWLine(i32* %arraydecay5), !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 30, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 30, column: 8)
!23 = !DILocation(line: 30, column: 8, scope: !18)
!24 = !DILocalVariable(name: "src", scope: !25, file: !10, line: 33, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !10, line: 32, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 4800, elements: !30)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !29, line: 74, baseType: !11)
!29 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!30 = !{!31}
!31 = !DISubrange(count: 150)
!32 = !DILocation(line: 33, column: 21, scope: !25)
!33 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 33, column: 31, scope: !25)
!38 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 34, type: !11)
!39 = !DILocation(line: 34, column: 17, scope: !25)
!40 = !DILocation(line: 36, column: 21, scope: !25)
!41 = !DILocation(line: 36, column: 13, scope: !25)
!42 = !DILocation(line: 37, column: 13, scope: !25)
!43 = !DILocation(line: 37, column: 22, scope: !25)
!44 = !DILocation(line: 38, column: 18, scope: !45)
!45 = distinct !DILexicalBlock(scope: !25, file: !10, line: 38, column: 13)
!46 = !DILocation(line: 38, column: 17, scope: !45)
!47 = !DILocation(line: 38, column: 22, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !10, line: 38, column: 13)
!49 = !DILocation(line: 38, column: 24, scope: !48)
!50 = !DILocation(line: 38, column: 13, scope: !45)
!51 = !DILocation(line: 40, column: 31, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 39, column: 13)
!53 = !DILocation(line: 40, column: 27, scope: !52)
!54 = !DILocation(line: 40, column: 22, scope: !52)
!55 = !DILocation(line: 40, column: 17, scope: !52)
!56 = !DILocation(line: 40, column: 25, scope: !52)
!57 = !DILocation(line: 41, column: 13, scope: !52)
!58 = !DILocation(line: 38, column: 31, scope: !48)
!59 = !DILocation(line: 38, column: 13, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 41, column: 13, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 43, column: 24, scope: !25)
!64 = !DILocation(line: 43, column: 13, scope: !25)
!65 = !DILocation(line: 45, column: 5, scope: !26)
!66 = !DILocation(line: 46, column: 1, scope: !18)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_05_good", scope: !10, file: !10, line: 99, type: !19, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 101, column: 5, scope: !67)
!69 = !DILocation(line: 102, column: 5, scope: !67)
!70 = !DILocation(line: 103, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 114, type: !72, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!11, !11, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !10, line: 114, type: !11)
!78 = !DILocation(line: 114, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !10, line: 114, type: !74)
!80 = !DILocation(line: 114, column: 27, scope: !71)
!81 = !DILocation(line: 117, column: 22, scope: !71)
!82 = !DILocation(line: 117, column: 12, scope: !71)
!83 = !DILocation(line: 117, column: 5, scope: !71)
!84 = !DILocation(line: 119, column: 5, scope: !71)
!85 = !DILocation(line: 120, column: 5, scope: !71)
!86 = !DILocation(line: 121, column: 5, scope: !71)
!87 = !DILocation(line: 124, column: 5, scope: !71)
!88 = !DILocation(line: 125, column: 5, scope: !71)
!89 = !DILocation(line: 126, column: 5, scope: !71)
!90 = !DILocation(line: 128, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocation(line: 55, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !91, file: !10, line: 55, column: 8)
!94 = !DILocation(line: 55, column: 8, scope: !91)
!95 = !DILocation(line: 58, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !10, line: 56, column: 5)
!97 = !DILocation(line: 59, column: 5, scope: !96)
!98 = !DILocalVariable(name: "src", scope: !99, file: !10, line: 63, type: !27)
!99 = distinct !DILexicalBlock(scope: !100, file: !10, line: 62, column: 9)
!100 = distinct !DILexicalBlock(scope: !93, file: !10, line: 61, column: 5)
!101 = !DILocation(line: 63, column: 21, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !99, file: !10, line: 63, type: !34)
!103 = !DILocation(line: 63, column: 31, scope: !99)
!104 = !DILocalVariable(name: "i", scope: !99, file: !10, line: 64, type: !11)
!105 = !DILocation(line: 64, column: 17, scope: !99)
!106 = !DILocation(line: 66, column: 21, scope: !99)
!107 = !DILocation(line: 66, column: 13, scope: !99)
!108 = !DILocation(line: 67, column: 13, scope: !99)
!109 = !DILocation(line: 67, column: 22, scope: !99)
!110 = !DILocation(line: 68, column: 18, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !10, line: 68, column: 13)
!112 = !DILocation(line: 68, column: 17, scope: !111)
!113 = !DILocation(line: 68, column: 22, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !10, line: 68, column: 13)
!115 = !DILocation(line: 68, column: 24, scope: !114)
!116 = !DILocation(line: 68, column: 13, scope: !111)
!117 = !DILocation(line: 70, column: 31, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !10, line: 69, column: 13)
!119 = !DILocation(line: 70, column: 27, scope: !118)
!120 = !DILocation(line: 70, column: 22, scope: !118)
!121 = !DILocation(line: 70, column: 17, scope: !118)
!122 = !DILocation(line: 70, column: 25, scope: !118)
!123 = !DILocation(line: 71, column: 13, scope: !118)
!124 = !DILocation(line: 68, column: 31, scope: !114)
!125 = !DILocation(line: 68, column: 13, scope: !114)
!126 = distinct !{!126, !116, !127, !62}
!127 = !DILocation(line: 71, column: 13, scope: !111)
!128 = !DILocation(line: 72, column: 13, scope: !99)
!129 = !DILocation(line: 72, column: 22, scope: !99)
!130 = !DILocation(line: 73, column: 24, scope: !99)
!131 = !DILocation(line: 73, column: 13, scope: !99)
!132 = !DILocation(line: 76, column: 1, scope: !91)
!133 = distinct !DISubprogram(name: "good2", scope: !10, file: !10, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocation(line: 81, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !133, file: !10, line: 81, column: 8)
!136 = !DILocation(line: 81, column: 8, scope: !133)
!137 = !DILocalVariable(name: "src", scope: !138, file: !10, line: 84, type: !27)
!138 = distinct !DILexicalBlock(scope: !139, file: !10, line: 83, column: 9)
!139 = distinct !DILexicalBlock(scope: !135, file: !10, line: 82, column: 5)
!140 = !DILocation(line: 84, column: 21, scope: !138)
!141 = !DILocalVariable(name: "dest", scope: !138, file: !10, line: 84, type: !34)
!142 = !DILocation(line: 84, column: 31, scope: !138)
!143 = !DILocalVariable(name: "i", scope: !138, file: !10, line: 85, type: !11)
!144 = !DILocation(line: 85, column: 17, scope: !138)
!145 = !DILocation(line: 87, column: 21, scope: !138)
!146 = !DILocation(line: 87, column: 13, scope: !138)
!147 = !DILocation(line: 88, column: 13, scope: !138)
!148 = !DILocation(line: 88, column: 22, scope: !138)
!149 = !DILocation(line: 89, column: 18, scope: !150)
!150 = distinct !DILexicalBlock(scope: !138, file: !10, line: 89, column: 13)
!151 = !DILocation(line: 89, column: 17, scope: !150)
!152 = !DILocation(line: 89, column: 22, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !10, line: 89, column: 13)
!154 = !DILocation(line: 89, column: 24, scope: !153)
!155 = !DILocation(line: 89, column: 13, scope: !150)
!156 = !DILocation(line: 91, column: 31, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !10, line: 90, column: 13)
!158 = !DILocation(line: 91, column: 27, scope: !157)
!159 = !DILocation(line: 91, column: 22, scope: !157)
!160 = !DILocation(line: 91, column: 17, scope: !157)
!161 = !DILocation(line: 91, column: 25, scope: !157)
!162 = !DILocation(line: 92, column: 13, scope: !157)
!163 = !DILocation(line: 89, column: 31, scope: !153)
!164 = !DILocation(line: 89, column: 13, scope: !153)
!165 = distinct !{!165, !155, !166, !62}
!166 = !DILocation(line: 92, column: 13, scope: !150)
!167 = !DILocation(line: 93, column: 13, scope: !138)
!168 = !DILocation(line: 93, column: 22, scope: !138)
!169 = !DILocation(line: 94, column: 24, scope: !138)
!170 = !DILocation(line: 94, column: 13, scope: !138)
!171 = !DILocation(line: 96, column: 5, scope: !139)
!172 = !DILocation(line: 97, column: 1, scope: !133)
