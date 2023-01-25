; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_05.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_05_bad() #0 !dbg !18 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !24, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !39
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !45
  %cmp = icmp slt i32 %1, 99, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !49
  %idxprom = sext i32 %2 to i64, !dbg !51
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !51
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !51
  %4 = load i32, i32* %i, align 4, !dbg !52
  %idxprom2 = sext i32 %4 to i64, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !53
  store i8 %3, i8* %arrayidx3, align 1, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %5, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay4), !dbg !62
  br label %if.end, !dbg !63

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_05_good() #0 !dbg !65 {
entry:
  call void @good1(), !dbg !66
  call void @good2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__CWE170_char_loop_05_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__CWE170_char_loop_05_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !88 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFalse, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !95, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %i, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !103
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  store i32 0, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.else
  %1 = load i32, i32* %i, align 4, !dbg !109
  %cmp = icmp slt i32 %1, 99, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !113
  %idxprom = sext i32 %2 to i64, !dbg !115
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !115
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !115
  %4 = load i32, i32* %i, align 4, !dbg !116
  %idxprom2 = sext i32 %4 to i64, !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !117
  store i8 %3, i8* %arrayidx3, align 1, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !120
  %inc = add nsw i32 %5, 1, !dbg !120
  store i32 %inc, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx4, align 1, !dbg !125
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* %arraydecay5), !dbg !127
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !129 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticTrue, align 4, !dbg !130
  %tobool = icmp ne i32 %0, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.end, !dbg !132

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !133, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32* %i, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !141
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !142
  store i8 0, i8* %arrayidx, align 1, !dbg !143
  store i32 0, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !147
  %cmp = icmp slt i32 %1, 99, !dbg !149
  br i1 %cmp, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !151
  %idxprom = sext i32 %2 to i64, !dbg !153
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !153
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !153
  %4 = load i32, i32* %i, align 4, !dbg !154
  %idxprom2 = sext i32 %4 to i64, !dbg !155
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !155
  store i8 %3, i8* %arrayidx3, align 1, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !158
  %inc = add nsw i32 %5, 1, !dbg !158
  store i32 %inc, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx4, align 1, !dbg !163
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  call void @printLine(i8* %arraydecay5), !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 30, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 30, column: 8)
!23 = !DILocation(line: 30, column: 8, scope: !18)
!24 = !DILocalVariable(name: "src", scope: !25, file: !10, line: 33, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !10, line: 32, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 1200, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 150)
!31 = !DILocation(line: 33, column: 18, scope: !25)
!32 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 28, scope: !25)
!37 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 34, type: !11)
!38 = !DILocation(line: 34, column: 17, scope: !25)
!39 = !DILocation(line: 36, column: 13, scope: !25)
!40 = !DILocation(line: 37, column: 13, scope: !25)
!41 = !DILocation(line: 37, column: 22, scope: !25)
!42 = !DILocation(line: 38, column: 18, scope: !43)
!43 = distinct !DILexicalBlock(scope: !25, file: !10, line: 38, column: 13)
!44 = !DILocation(line: 38, column: 17, scope: !43)
!45 = !DILocation(line: 38, column: 22, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !10, line: 38, column: 13)
!47 = !DILocation(line: 38, column: 24, scope: !46)
!48 = !DILocation(line: 38, column: 13, scope: !43)
!49 = !DILocation(line: 40, column: 31, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !10, line: 39, column: 13)
!51 = !DILocation(line: 40, column: 27, scope: !50)
!52 = !DILocation(line: 40, column: 22, scope: !50)
!53 = !DILocation(line: 40, column: 17, scope: !50)
!54 = !DILocation(line: 40, column: 25, scope: !50)
!55 = !DILocation(line: 41, column: 13, scope: !50)
!56 = !DILocation(line: 38, column: 31, scope: !46)
!57 = !DILocation(line: 38, column: 13, scope: !46)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 41, column: 13, scope: !43)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 43, column: 23, scope: !25)
!62 = !DILocation(line: 43, column: 13, scope: !25)
!63 = !DILocation(line: 45, column: 5, scope: !26)
!64 = !DILocation(line: 46, column: 1, scope: !18)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_05_good", scope: !10, file: !10, line: 99, type: !19, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 101, column: 5, scope: !65)
!67 = !DILocation(line: 102, column: 5, scope: !65)
!68 = !DILocation(line: 103, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 114, type: !70, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!11, !11, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !10, line: 114, type: !11)
!75 = !DILocation(line: 114, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !10, line: 114, type: !72)
!77 = !DILocation(line: 114, column: 27, scope: !69)
!78 = !DILocation(line: 117, column: 22, scope: !69)
!79 = !DILocation(line: 117, column: 12, scope: !69)
!80 = !DILocation(line: 117, column: 5, scope: !69)
!81 = !DILocation(line: 119, column: 5, scope: !69)
!82 = !DILocation(line: 120, column: 5, scope: !69)
!83 = !DILocation(line: 121, column: 5, scope: !69)
!84 = !DILocation(line: 124, column: 5, scope: !69)
!85 = !DILocation(line: 125, column: 5, scope: !69)
!86 = !DILocation(line: 126, column: 5, scope: !69)
!87 = !DILocation(line: 128, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocation(line: 55, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !88, file: !10, line: 55, column: 8)
!91 = !DILocation(line: 55, column: 8, scope: !88)
!92 = !DILocation(line: 58, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !10, line: 56, column: 5)
!94 = !DILocation(line: 59, column: 5, scope: !93)
!95 = !DILocalVariable(name: "src", scope: !96, file: !10, line: 63, type: !27)
!96 = distinct !DILexicalBlock(scope: !97, file: !10, line: 62, column: 9)
!97 = distinct !DILexicalBlock(scope: !90, file: !10, line: 61, column: 5)
!98 = !DILocation(line: 63, column: 18, scope: !96)
!99 = !DILocalVariable(name: "dest", scope: !96, file: !10, line: 63, type: !33)
!100 = !DILocation(line: 63, column: 28, scope: !96)
!101 = !DILocalVariable(name: "i", scope: !96, file: !10, line: 64, type: !11)
!102 = !DILocation(line: 64, column: 17, scope: !96)
!103 = !DILocation(line: 66, column: 13, scope: !96)
!104 = !DILocation(line: 67, column: 13, scope: !96)
!105 = !DILocation(line: 67, column: 22, scope: !96)
!106 = !DILocation(line: 68, column: 18, scope: !107)
!107 = distinct !DILexicalBlock(scope: !96, file: !10, line: 68, column: 13)
!108 = !DILocation(line: 68, column: 17, scope: !107)
!109 = !DILocation(line: 68, column: 22, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !10, line: 68, column: 13)
!111 = !DILocation(line: 68, column: 24, scope: !110)
!112 = !DILocation(line: 68, column: 13, scope: !107)
!113 = !DILocation(line: 70, column: 31, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !10, line: 69, column: 13)
!115 = !DILocation(line: 70, column: 27, scope: !114)
!116 = !DILocation(line: 70, column: 22, scope: !114)
!117 = !DILocation(line: 70, column: 17, scope: !114)
!118 = !DILocation(line: 70, column: 25, scope: !114)
!119 = !DILocation(line: 71, column: 13, scope: !114)
!120 = !DILocation(line: 68, column: 31, scope: !110)
!121 = !DILocation(line: 68, column: 13, scope: !110)
!122 = distinct !{!122, !112, !123, !60}
!123 = !DILocation(line: 71, column: 13, scope: !107)
!124 = !DILocation(line: 72, column: 13, scope: !96)
!125 = !DILocation(line: 72, column: 22, scope: !96)
!126 = !DILocation(line: 73, column: 23, scope: !96)
!127 = !DILocation(line: 73, column: 13, scope: !96)
!128 = !DILocation(line: 76, column: 1, scope: !88)
!129 = distinct !DISubprogram(name: "good2", scope: !10, file: !10, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocation(line: 81, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !129, file: !10, line: 81, column: 8)
!132 = !DILocation(line: 81, column: 8, scope: !129)
!133 = !DILocalVariable(name: "src", scope: !134, file: !10, line: 84, type: !27)
!134 = distinct !DILexicalBlock(scope: !135, file: !10, line: 83, column: 9)
!135 = distinct !DILexicalBlock(scope: !131, file: !10, line: 82, column: 5)
!136 = !DILocation(line: 84, column: 18, scope: !134)
!137 = !DILocalVariable(name: "dest", scope: !134, file: !10, line: 84, type: !33)
!138 = !DILocation(line: 84, column: 28, scope: !134)
!139 = !DILocalVariable(name: "i", scope: !134, file: !10, line: 85, type: !11)
!140 = !DILocation(line: 85, column: 17, scope: !134)
!141 = !DILocation(line: 87, column: 13, scope: !134)
!142 = !DILocation(line: 88, column: 13, scope: !134)
!143 = !DILocation(line: 88, column: 22, scope: !134)
!144 = !DILocation(line: 89, column: 18, scope: !145)
!145 = distinct !DILexicalBlock(scope: !134, file: !10, line: 89, column: 13)
!146 = !DILocation(line: 89, column: 17, scope: !145)
!147 = !DILocation(line: 89, column: 22, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !10, line: 89, column: 13)
!149 = !DILocation(line: 89, column: 24, scope: !148)
!150 = !DILocation(line: 89, column: 13, scope: !145)
!151 = !DILocation(line: 91, column: 31, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !10, line: 90, column: 13)
!153 = !DILocation(line: 91, column: 27, scope: !152)
!154 = !DILocation(line: 91, column: 22, scope: !152)
!155 = !DILocation(line: 91, column: 17, scope: !152)
!156 = !DILocation(line: 91, column: 25, scope: !152)
!157 = !DILocation(line: 92, column: 13, scope: !152)
!158 = !DILocation(line: 89, column: 31, scope: !148)
!159 = !DILocation(line: 89, column: 13, scope: !148)
!160 = distinct !{!160, !150, !161, !60}
!161 = !DILocation(line: 92, column: 13, scope: !145)
!162 = !DILocation(line: 93, column: 13, scope: !134)
!163 = !DILocation(line: 93, column: 22, scope: !134)
!164 = !DILocation(line: 94, column: 23, scope: !134)
!165 = !DILocation(line: 94, column: 13, scope: !134)
!166 = !DILocation(line: 96, column: 5, scope: !135)
!167 = !DILocation(line: 97, column: 1, scope: !129)
